/*
    Fichier: fnc_authorizationManagement.sqf
    Auteur: Admors pour Adeptus TEAM (adeptusrepublica.fr)
    Publique: Non

    Description: Permet via un addAction d'appliquer une habilitation à un utilisateur.

    Exemple(s):
       
*/
if (isNil {promote_medic}) exitWith {};
if (isNil {promote_eng}) exitWith {};
if (isNil {promote_eod}) exitWith {};