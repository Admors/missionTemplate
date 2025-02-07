player setUnitLoadout (player getVariable ["Saved_Loadout", []]);

fnc_reservedSlot = {
	player enableSimulationGlobal false;
	("reserved" call BIS_fnc_rscLayer) cutText ["Vous n'avez pas le droit d'occuper ce rôle.", "BLACK OUT", 1, true ];
	sleep 0.01;
	endMission "NOT_ALLOWED";
};

/*
	Function: fnc_hintDisplayTexts
	
	Description:
	Displays a hint message for a specified duration.
	
	Parameters:
	_string - (String) The text to be displayed as a hint. default is an empty string.
	_time - (Number) The duration in seconds for which the hint will be displayed. default is 5 seconds.
	
	Example:
	 [
	  "<t color='#FF0000'>This is a red hint!</t>", // hint text with color formatting
	  10 // Display duration in seconds
	 ] call fnc_hintDisplayTexts;
*/
fnc_hintDisplayTexts = {
	params[["_string", "", ["STRING"]], ["_time", 5, [0]]];
	hintSilent parseText _string;
	sleep _time;
	hintSilent "";
};

/*
	Function: AR_fnc_underFire
	Auteur: Adeptus TEAM (adeptusrepublica.fr)
	Publique: Non
	
	Description: Gère la vue de la caméra d'une unité lorsqu'elle est sous le feu.
	
	Arguments:
	0: _unit <Unit> - Unité regarder.
	1: _combatTime <Number> (default: 60) - Durée du combat en secondes.
	
	Retourne:
	None
	
	Exemple:
	[_unit, _combatTime] call AR_fnc_underFire;
*/
fn_UnderFire = {
	params ["_unit", ["_combatTime", 60, [0]]];

	AR_CombatTime = _combatTime;
	publicVariable "AR_CombatTime";

	_unit addEventHandler ["FiredNear", {
		params ["_unit"];

		if ((isRemoteControlling _unit) || ((vehicle _unit) != _unit) || !(alive _unit) || !(isPlayer _unit)) exitWith {};

		if ((_unit getVariable ["combatTime", 0]) == 0) then {
			_unit setVariable ["combatTime", AR_CombatTime, true];
			[_unit] spawn {
				params ["_unit"];
				while {
					uiSleep 0.2;
					(_unit getVariable ["combatTime", 0]) > 0
				} do {
					if ((cameraView == "External") && ((vehicle _unit) == _unit) && (isPlayer _unit) && (alive _unit)) then {
						["<t size='2.0' color='#FF0000'><img image='a3\ui_f_curator\data\rsccommon\rscattributebehaviour\combat_ca.paa'/></t><br/><br/>Vous êtes en combat !", 5] call fnc_hintDisplayTexts;
						_unit switchCamera "Internal";
					};
					if ((isRemoteControlling _unit) || ((vehicle _unit) != _unit) || !(alive _unit) || !(isPlayer _unit)) exitWith {
						_unit setVariable ["combatTime", 0, true];
					};
					_unit setVariable ["combatTime", (_unit getVariable ["combatTime", 0]) - 0.2, true];
				};
				_unit setVariable ["combatTime", 0, true];
				["<t size='2.0' color='#00FF00'><img image='a3\ui_f_curator\data\rsccommon\rscattributebehaviour\safe_ca.paa'/></t> ", 5] call fnc_hintDisplayTexts;
			};
		} else {
			_unit setVariable ["combatTime", AR_CombatTime, true];
		};
	};
];
};

[player, 60] spawn fn_UnderFire;

[] execVM "functions\fnc_welcome.sqf";