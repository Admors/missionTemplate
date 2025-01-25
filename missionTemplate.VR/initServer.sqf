allowed = ["76561198063259158", "76561198134513977", "76561198218934540", "76561198127318244", "76561198308368404", "76561198272941463", "76561198254448634", "76561198063711746"];

/*
	Gère l'événement de vérification d'entrée dans une base de données INIDBI.
	
	Cette fonction est déclenchée lorsqu'une variable publique nommée "checkForDatabase" est modifiée.
	Elle vérifie si une entrée correspondant à un UID spécifique existe déjà dans la base de données.
	Si l'entrée existe, les données associées sont chargées. Sinon, une nouvelle entrée est créée.
	
	Parameters:
	- Aucun directement, mais l'événement reçoit les données suivantes dans un tableau (_this select 1):
	_UID (string): Identifiant unique de l'entrée ou du joueur.
	_playerName (string): Nom du joueur.
	_playerUnit (object): Référence à l'unité associée au joueur.
	
	Étapes principales :
	1. Extraction des données fournies par l'événement.
	2. Initialisation du gestionnaire INIDBI pour l'UID fourni.
	3. Vérification de l'existence d'un fichier dans la base de données.
	4. Si le fichier existe, charger les données (appel à "fnc_loadDatabaseEntry.sqf").
	5. Si le fichier n'existe pas, créer une nouvelle entrée (appel à "fnc_createDatabaseEntry.sqf").
	
	Exemple d'utilisation :
	La variable publique "checkForDatabase" peut être définie comme suit pour déclencher cet événement :
[["12345", "Joueur1", player]] publicVariable "checkForDatabase"; // Vérifie ou crée une entrée pour le joueur "Joueur1".
	
*/

"checkForDatabase" addPublicVariableEventHandler
{
	private ["_data"];
	_data = (_this select 1);
	_UID = (_data select 0);
	_playerName = (_data select 1);
	_playerUnit = (_data select 2);

	_inidbi = ["new", _UID] call OO_INIDBI;
	_fileExist = "exists" call _inidbi;
	if (_fileExist) then {
		diag_log format ["[%1] Entry already exist, loading file data", _UID];
		null = [_UID, _playerName, _playerUnit] execVM "functions\fnc_loadDatabaseEntry.sqf";
	} else {
		diag_log format["[%1] Entry doesn't exist, creating file data", _UID];
		null = [ _UID, _playerName, _playerUnit] execVM "functions\fnc_createDataBaseEntry.sqf";
	};
};

/*
	Function: fn_UnconsciousPlayersTasks
	
	Description:
	This function continuously monitors all players to check if any of them are unconscious (incapacitated).
	if a player is found to be unconscious, it adds them to the `unconsciousPlayers` list and creates a task for medics to heal them.
	The task is updated based on the player's state (healed or not) and removed once the player regains consciousness or leaves the game.
	
	Variables:
	- unconsciousPlayers: Array of players who are currently unconscious.
	
	Parameters:
	None
	
	Returns:
	None
	
	Example:
	[] spawn fn_UnconsciousPlayersTasks;
	
	Notes:
	- This function should be spawned to run in the background.
	- The task creation and state update are handled using BIS_fnc_taskCreate and BIS_fnc_taskSetState respectively.
	- The task description is updated to reflect the outcome of the healing process.
	- The function uses uiSleep to periodically check the state of players and to wait for certain conditions.
*/
fn_UnconsciousPlayersTasks = {
	unconsciousPlayers = [];

	// Continuously check if any player is unconscious
	while {
		uiSleep 20;
		!isNil "unconsciousPlayers"
	} do {
		// Check if any player is unconscious
		{
			private _unit = _x;
			// Check if the player is unconscious
			if (lifeState _unit == "INCAPACITATED") then {
				// Check if the player is already in the unconsciousPlayers list
				if !(_unit in unconsciousPlayers) then {
					// Add the player to the unconsciousPlayers list
					unconsciousPlayers pushBack _unit;

					// Create a task for medics
					private _medics = allPlayers select {
						(_x getVariable ["ace_medical_medicClass", 0] >= 1) || (_x getUnitTrait "Medic")
					};
					private _taskID = format ["UnconsciousTask_%1_%2", round time, _unit];
					private _taskDescription = [
						format ["%1 a besoin d'un médecin!<br/><br/>Il est blessé depuis %2h%3. Il se trouve en %4.", name _unit, systemTime select 3, systemTime select 4, mapGridPosition _unit],
						format ["Soigner : %1", name _unit],
						"heal"
					];
					_task = [_medics, _taskID, _taskDescription, [ _unit, true ], "AUTOASSIGNED", 0, true, "heal"] call BIS_fnc_taskCreate;

					// TODO : Add BattleFront2 Clone Death Sound here

					// spawn a new thread to handle the unconscious player
					[_unit, _taskID, _taskDescription] spawn {
						params ["_unit", "_taskID", "_taskDescription"];

						// Wait until the player regains consciousness or leaves the game
						waitUntil {
							uiSleep 5;
							(lifeState _unit != "INCAPACITATED") || (isNull _unit)
						};

						// If the player has been healed, the task is marked as "SUCCEEDED", otherwise it is marked as "FAILED"
						private _lifestatedescription = "";
						if (lifeState _unit == "HEALTHY") then {
							[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
							_lifestatedescription = "Il a été soigné avec succès à";
						} else {
							[_taskID, "FAILED"] call BIS_fnc_taskSetState;
							_lifestatedescription = "Il n'a pas pu être soigné à";
						};

						// Update the task description to reflect the outcome
						private _updatedTaskDescription = [
							(_taskDescription select 0) + format ["<br/><br/>" + _lifestatedescription + " %1h%2.", systemTime select 3, systemTime select 4],
							_taskDescription select 1,
							_taskDescription select 2
						];
						[_taskID, _updatedTaskDescription] call BIS_fnc_taskSetDescription;

						// Delete the task and remove the player from the unconsciousPlayers list
						unconsciousPlayers = unconsciousPlayers - [_unit];
					};
				};
			};
		} forEach allPlayers;
	};
};

// spawn the function to start monitoring unconscious players
[] spawn fn_UnconsciousPlayersTasks;