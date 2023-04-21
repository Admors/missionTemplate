/*
    File: fnc_cleanUp.sqf
    Author: Admors pour Adeptus TEAM (adeptusrepublica.fr)
    Public: No

    Description: Modifie la colométrie des NVG pour les joueurs. 

    Example(s):
       this addAction ["Nettoyer la zone", {[] spawn fnc_cleanup}, [], 1, true, true, "", ""];
*/

fnc_cleanup = {
    private _objects = nearestObjects [position player, [], 10];
    {
        if (alive _x && !isPlayer _x) then {
            deleteVehicle _x;
        };
    } forEach _objects;
    hint "Objets au sol nettoyés !";
};
