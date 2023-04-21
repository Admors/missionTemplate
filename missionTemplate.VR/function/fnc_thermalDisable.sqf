/*
    File: fnc_thermalDisable.sqf
    Author: Admors pour Adeptus TEAM (adeptusrepublica.fr)
    Public: No

    Description: Désactive la vision Thermique pour un joueur.
*/

_layer = 85125; 

while {true} do 
{ 
if (currentVisionMode player == 2) then
	{
		_layer	cutText ["Vision thermique dysfonctionnel !","BLACK",-1];
		waituntil {currentVisionMode player != 2};
		_layer cutText ["", "PLAIN"];
	};
	sleep 1; 
}