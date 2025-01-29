medicUnit switchMove "UnconsciousReviveArms";

[player] call AR_fnc_nvg

[player] call AR_fnc_rank

[] call AR_fnc_fortifyAce

[] execVM "functions\fnc_load_equipement.sqf";

[player] call AR_fnc_authAttribution;