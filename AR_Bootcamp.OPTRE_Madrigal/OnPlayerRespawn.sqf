params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

[_newUnit, 60] call AR_fnc_respawnDelay;

[_newUnit] call AR_fnc_respawnAnimation;