_player = _this select 0;
_UID = getPlayerUID _player;
_playerName = name _player;

if ( _player getVariable [ "reserved", false ] && {
	!(_UID in allowed)
} ) then {
	// [ [], "fnc_reservedSlot", _player ] call BIS_fnc_MP;// This function has been replaced by remoteExec. while BIS_fnc_MP still works (to provide backwards compatibility), it is now deprecated and should no longer be used.
	[] remoteExec [ "BIS_fnc_endMission", _player ];
};

checkForDatabase = [_UID, _playerName, _player];

publicVariableServer "checkForDatabase";

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	_inidbi = ["new", _UID] call OO_INIDBI;
	_playerLoadout = getUnitLoadout _unit;

	["Write", ["GameData", "Name", _name]] call _inidbi;
	["Write", ["GameData", "SteamID64", _UID]] call _inidbi;
	["Write", ["GameData", "Loadout", _playerLoadout]] call _inidbi;
	diag_log format ["[INIDBI2-STATUS] %1 loadout has been saved", _UID];
	false;
}];