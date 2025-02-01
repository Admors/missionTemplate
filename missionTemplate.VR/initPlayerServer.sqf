_player = _this select 0;
_UID = getPlayerUID _player;
_playerName = name _player;

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