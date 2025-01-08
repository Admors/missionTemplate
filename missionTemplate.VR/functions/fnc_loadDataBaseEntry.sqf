_UID = (_this select 0);
_playerName = (_this select 1);
_playerUnit = (_this select 2);

_inidbi = ["new", _UID] call OO_INIDBI;

_loadout = ["Read", ["GameData", "Loadout", []]] call _inidbi;

if (count _loadout == 0) then {
	diag_log format["[INIDBI2-STATUS] Error Loading Loadout data."];
} else {
	_playerUnit setUnitLoadout _loadout;
	diag_log format["[%1] Loadout data has been loaded.", _UID];
};