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
player addEventHandler ["FiredNear", {
	params ["_unit", "_firer", "_distance", "_weapon", "_muzzle", "_mode", "_ammo", "_gunner"];
	if (!((vehicle player) == player)) exitWith {};
	if (!(isNull getAssignedCuratorLogic player)) exitWith {};
	countdownTime = time + 60;
	if (alive player) then {
		_unit spawn {
			while { (countdownTime - time) > 0 } do {
				if (cameraView == "EXTERNAL") then {
					[" <t color='#FF0000'<t size='2.0'><img image='a3\ui_f_curator\data\rsccommon\rscattributebehaviour\combat_ca.paa'/></t><br/><br/>Vous êtes en combat !</t>", 5] spawn fnc_hintDisplayTexts;
					player switchCamera "INTERNAL";
					sleep 0.25;
				};
			};
			[" <t color='#00FF00'<t size='2.0'><img image='a3\ui_f_curator\data\rsccommon\rscattributebehaviour\safe_ca.paa'/></t></t>", 5] spawn fnc_hintDisplayTexts;
		};
	};
}];
*/

[] execVM "functions\fnc_welcome.sqf";