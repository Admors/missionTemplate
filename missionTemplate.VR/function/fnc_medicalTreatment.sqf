/*
    Fichier: fnc_medicalTreatment.sqf
    Auteur: Admors pour Adeptus TEAM (adeptusrepublica.fr)
    Publique: Non

    Description: Permet via un addAction de remettre la vie d'un utilisateur à 100%.

    Exemple(s):     
       this addAction ["<t color='#FFFFFF' size='1.5'>Se soigner</t>", {player call ace_medical_treatment_fnc_fullHealLocal}];
*/
if (isNil {heal}) exitWith {};

[player] call ace_medical_treatment_fnc_fullHealLocal;
heal addAction ["<t color='#FFFFFF' size='1.5'>Se soigner</t>", {player call ace_medical_treatment_fnc_fullHealLocal}]; // Variable en jeu 'heal'
