/*
	    Fichier: fnc_createLight.sqf
	    Auteur: Archer pour Adeptus TEAM (adeptusrepublica.fr)
	    Publique: Non
	
	    Description: Crée une lumière a tout les objets qui contienne le script
*/

params["_object"];

/*private _light = createVehicle["#lightpoint", getPosATL _object];
	_light attachTo [_object, [0, 0, 0]];
	_light setLightColor [1, 1, 1];
	_light setLightAmbient [1, 1, 1];
	_light setLightBrightness 1;
_object hideObjectGlobal true;// / Code pour une future mise à jours