// Init des fonction de base
[] call AR_fnc_init;

// Init des fonction de DataBase
[] call ARDB_fnc_init;

if (hasInterface) then {
	[player, 60] call AR_fnc_underFire;
	[player, 60] call AR_fnc_respawnDelay;
};

if (isServer) then {
	[] call AR_fnc_unconsciousPlayerTasks;
};