"checkForDatabase" addPublicVariableEventHandler {
	private ["_data"];
	_data = (_this select 1);
	_UID = (_data select 0);
	_playerName = (_data select 1);
	_playerUnit = (_data select 2);

	_inidbi = ["new", _UID] call OO_INIDBI;
	_fileExist = "exists" call _inidbi;
	if (_fileExist) then {
		diag_log format ["[%1] Entry already exist, loading file data", _UID];
		null = [_UID, _playerName, _playerUnit] call ARDB_fnc_load;
	} else {
		diag_log format["[%1] Entry doesn't exist, creating file data", _UID];
		null = [_UID, _playerName, _playerUnit] call ARDB_fnc_create;
	};
};