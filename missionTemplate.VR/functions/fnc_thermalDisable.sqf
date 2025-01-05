/*
    Fichier: fnc_thermalDisable.sqf
    Auteur: Admors pour Adeptus TEAM (adeptusrepublica.fr)
    Publique: Non

    Description: Désactive la vision Thermique pour un joueur tant que EMI_Broadcaster est Alive.
*/
if (isNil {EMI_Broadcaster}) exitWith {};

if(!Alive EMI_Broadcaster) then {
	_layer cutText ["Vision thermique active !", "PLAIN", 2];
} else {
	_layer = 85125; 

	while {Alive EMI_Broadcaster} do 
	{ 
		if (currentVisionMode player == 2) then
		{
			_layer	cutText ["Vision thermique dysfonctionnel !","BLACK",-1];
			waituntil {currentVisionMode player != 2};
			_layer cutText ["", "PLAIN"];
		};
		sleep 1; 
	};
};