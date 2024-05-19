player setUnitLoadout (player getVariable ["Saved_Loadout",[]]);


fnc_reservedSlot = {
player enableSimulationGlobal false;
( "reserved" call BIS_fnc_rscLayer ) cutText ["Vous n'avez pas le droit d'occuper ce rôle.", "BLACK OUT", 1, true ];
sleep 0.01;
endMission "NOT_ALLOWED";
};

player addEventHandler ["FiredNear", {
	params ["_unit", "_firer", "_distance", "_weapon", "_muzzle", "_mode", "_ammo", "_gunner"];
	countdownTime = time + 60;
	_unit spawn {
			if((vehicle _this == _this))then{
				while{round(countdownTime - time) > 0}do{
				if(cameraView == "EXTERNAL")then{
					hintSilent parseText " <t color='#FF0000'<t size='2.0'><img image='\a3\ui_f\data\igui\cfg\simpletasks\types\destroy_ca.paa'/></t></t>";
					_this switchCamera "INTERNAL";
					sleep 0.25;
				};
			};
		};
	hintSilent parseText " <t color='#00FF00'<t size='2.0'><img image='\a3\ui_f\data\igui\cfg\simpletasks\types\destroy_ca.paa'/></t></t>";
	sleep 1;
	hintSilent "";
	};
}];

[] execVM "function\fnc_welcome.sqf";

