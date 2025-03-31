if (isDedicated) then {
	missionNamespace setVariable ["DB_initialized", true];
	[] call ARDB_fnc_handle;
	[] call ARDB_fnc_saveOnDisconnect;
};

if (hasInterface) then {
	[] spawn {
		waitUntil {
			sleep 1;
			!(isNull player)
		};

		private _playerUnit = player;
		private _playerName = name _playerUnit;
		private _UID = getPlayerUID _playerUnit;

		checkForDatabase = [_UID, _playerName, _playerUnit];
		publicVariableServer "checkForDatabase";
	};
};