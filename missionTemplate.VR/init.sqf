[] call AR_fnc_init;

if (hasInterface) then {
	[player, 60] call AR_fnc_underFire;
};

if (isServer) then {
	[] call AR_fnc_unconsciousPlayerTasks;
};