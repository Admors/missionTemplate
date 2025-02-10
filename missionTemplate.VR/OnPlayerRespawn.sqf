params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

_newUnit setUnitLoadout (getUnitLoadout [_oldUnit, true]);

[_newUnit] call AR_fnc_respawnAnimation;