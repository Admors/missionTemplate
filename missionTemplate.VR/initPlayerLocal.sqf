player setUnitLoadout (player getVariable ["Saved_Loadout", []]);

fnc_reservedSlot = {
	player enableSimulationGlobal false;
	("reserved" call BIS_fnc_rscLayer) cutText ["Vous n'avez pas le droit d'occuper ce rôle.", "BLACK OUT", 1, true ];
	sleep 0.01;
	endMission "NOT_ALLOWED";
};
/*
	Affiche un indice à l'écran pendant un certain laps de temps.
	
	Cette fonction prend une chaîne de caractères et une durée en secondes en tant que paramètres.
	Elle affiche l'indice silencieusement à l'écran pendant la durée spécifiée, puis le retire.
	
	Parameters:
	_string (string): La chaîne de caractères à afficher en tant qu'indice.
	_time (number): La durée en secondes pendant laquelle l'indice est affiché.
	
	Exemple d'utilisation:
    fnc_hintDisplayTexts "Ceci est un message d'indice." 5;  // Affiche "Ceci est un message d'indice." pendant 5 secondes
*/
fnc_hintDisplayTexts = {
	params["_string", "_time"];
	hintSilent parseText _string;
	sleep _time;
	hintSilent "";
};

/*
	Function: fn_UnderFire
	
	Description:
	This function handles the behavior of a unit when it is under fire.
	It sets a combat timer and switches the camera view to internal if the unit is in external view.
	
	Parameters:
	_unit - Object: The unit that is under fire.
	_combatTime - Number (Optional): The duration of the combat state in seconds. default is 60 seconds.
	
	Usage:
	[_unit, _combatTime] call fn_UnderFire;
	
	Notes:
	- The function exits if the unit is remote controlled or if the unit is inside a vehicle.
	- The function displays a hint message when the unit is in combat and switches the camera view to internal.
	- The combat timer decreases over time and resets to 0 when the combat state ends.
 */
fn_UnderFire = {
	params ["_unit", ["_combatTime", 60, [0]]];
	if ((isRemoteControlling _unit) || ((vehicle _unit) != _unit)) exitWith {};

	if ((_unit getVariable ["combatTime", 0]) == 0) then {
		_unit setVariable ["combatTime", _combatTime, true];
		[_unit] spawn {
			params ["_unit"];
			while {
				uiSleep 0.2;
				(_unit getVariable ["combatTime", 0]) > 0
			} do {
				if ((cameraView == "External") && ((vehicle _unit) == _unit)) then {
					["<t size='2.0' color='#FF0000'><img image='a3\ui_f_curator\data\rsccommon\rscattributebehaviour\combat_ca.paa'/></t><br/><br/>Vous êtes en combat !", 5] spawn fnc_hintDisplayTexts;
					_unit switchCamera "Internal";
				};
				if ((vehicle _unit) != _unit) exitWith {};
				_unit setVariable ["combatTime", (_unit getVariable ["combatTime", 0]) - 0.2, true];
			};
			_unit setVariable ["combatTime", 0, true];
			["<t size='2.0' color='#00FF00'><img image='a3\ui_f_curator\data\rsccommon\rscattributebehaviour\safe_ca.paa'/></t> ", 5] spawn fnc_hintDisplayTexts;
		};
	} else {
		_unit setVariable ["combatTime", _combatTime, true];
	};
};

player addEventHandler ["FiredNear", {
	params ["_unit"];
	[_unit] spawn fn_UnderFire;
}];

[] execVM "functions\fnc_welcome.sqf";