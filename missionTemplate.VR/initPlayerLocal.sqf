player setUnitLoadout (player getVariable ["Saved_Loadout",[]]);

fnc_reservedSlot = {
player enableSimulationGlobal false;
( "reserved" call BIS_fnc_rscLayer ) cutText ["Vous n'avez pas le droit d'occuper ce rôle.", "BLACK OUT", 1, true ];
sleep 0.01;
endMission "NOT_ALLOWED";
};

[] execVM "function\fnc_welcome.sqf";
[] execVM "functions\fnc_authAuto.sqf";