_chair = _this select 0; 
_unit = _this select 1; 

[[_unit, "Crew"], "MAC_fnc_switchMove"] spawn BIS_fnc_MP; 
_unit setPosATL (getPosATL _chair); 
_unit setDir ((getDir _chair) - 180); 
standup = _unit addaction ["<t color='#0099FF'>Se lever</t>","Chair\standup.sqf"];
player setPosATL [getPosATL player select 0, getPosATL player select 1, getPosATL player select 2];