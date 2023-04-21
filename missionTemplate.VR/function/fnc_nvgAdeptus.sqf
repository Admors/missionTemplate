/*
    File: fnc_nvgAdeptus.sqf
    Author: Admors pour Adeptus TEAM (adeptusrepublica.fr)
    Public: No

    Description: Modifie la colométrie des NVG pour les joueurs. 
*/

if (isDedicated) exitWith {};
if (player != player) then {waitUntil {player == player};};

while {true} do {
waitUntil {(currentVisionMode player) == 1};

pp_Color = ppEffectCreate ["ColorCorrections", 1502];  
pp_Color ppEffectEnable true;
pp_Color ppEffectAdjust [1, 0.6, 0, [0, 0.1, 0.2, 0], [0, 1, 1.2, 0], [1, 1, 1, 0]];      
pp_Color ppEffectCommit 0;
pp_Color ppEffectForceInNVG true;

waitUntil {(currentVisionMode player) != 1};

ppEffectDestroy pp_Color;

};