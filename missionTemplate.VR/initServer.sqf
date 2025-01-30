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

[] call AR_fnc_unconsciousPlayerTasks;