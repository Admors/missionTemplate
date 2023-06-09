/*
    Fichier: fnc_cleanUp.sqf (Soon)
    Auteur: Admors pour Adeptus TEAM (adeptusrepublica.fr)
    Publique: Non

    Description: Permet via a addAction de supprimer les items au sol.  

    Exemple(s):
       this addAction ["Nettoyer la zone", {[] spawn fnc_cleanup}, [], 1, true, true, "", ""];

    ERREUR : Non-Fonctionnel quelques bugs niveau de la validation
*/
if (isNil {cleaner}) exitWith {};

fnc_cleanup = {
    private _objects = nearestObjects [position player, ["GroundWeaponHolder","WeaponHolder","GroundWeaponHolderSimulated"], 10];
    {
        if (alive _x && !isPlayer _x) then {
            deleteVehicle _x;
        };
    } forEach _objects;
    hint "Objets au sol nettoyés !";
};

cleaner addAction ["Nettoyer la zone", {[] spawn fnc_cleanup}, [], 1, true, true, "", ""]; // Variable en jeu 'cleaner'
