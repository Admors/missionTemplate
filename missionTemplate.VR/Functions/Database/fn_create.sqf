params ["_UID", "_playerName", "_playerUnit"];

_inidbi = ["new", _UID] call OO_INIDBI;

["Write", ["GameData", "Name", _playerName]] call _inidbi;
["Write", ["GameData", "SteamID64", _UID]] call _inidbi;
["Write", ["GameData", "Loadout", getUnitLoadout _playerUnit]] call _inidbi;

diag_log format["[ %1] Data has been writen", _UID];