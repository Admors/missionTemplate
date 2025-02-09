if (!(missionNamespace getVariable ["DB_Error", false])) then {
	if ((isDedicated) && (!(missionNamespace getVariable ["DB_initialized", false]))) then {
		missionNamespace setVariable ["DB_initialized", true, true];
		[] call ARDB_fnc_handle;
		[] call ARDB_fnc_saveOnDisconnect;
	} else {
		missionNamespace setVariable ["DB_Error", true, true];
		diag_log "[INIDBI2-STATUS] Need to be on a dedicated server to run INIDBI2.";
		diag_log "[INIDBI2-STATUS] Database will not be initialized.";
	};

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
} else {
	missionNamespace setVariable ["DB_Error", true, true];
	diag_log "[INIDBI2-STATUS] Database has encountered an error.";
};