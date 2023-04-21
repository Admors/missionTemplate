/*
    Fichier: fnc_ejectNoPilot.sqf
    Auteur: Admors pour Adeptus TEAM (adeptusrepublica.fr)
    Publique: Non

    Description: Eject un utilisateur non pilote. 
*/

_restrictVehicle = [];
_pilotAccess = ["SixOne","Red","Spearhead","Phantom","Nek", "Sight"];

_playerUID = getPlayerUID player; // Récupère l'UID64




