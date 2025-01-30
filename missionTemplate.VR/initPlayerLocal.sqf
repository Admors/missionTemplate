params ["_player", "_didJIP"];

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

[_player, 60] call AR_fnc_underFire;

[_player] call AR_fnc_welcome;