/*
    File: fnc_cleanUp.sqf
    Author: Admors pour Adeptus TEAM (adeptusrepublica.fr)
    Public: No

    Description: Permet via a addAction de supprimer les items au sol.  

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

cleaner addAction ["Nettoyer la zone", {[] spawn fnc_cleanup}, [], 1, true, true, "", ""]; // Variable en jeu 'cleaner'
