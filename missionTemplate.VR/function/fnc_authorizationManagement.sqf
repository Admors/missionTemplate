/*
    Fichier: fnc_authorizationManagement.sqf
    Auteur: Admors pour Adeptus TEAM (adeptusrepublica.fr)
    Publique: Non

    Description: Permet via un addAction d'appliquer une habilitation à un utilisateur.         
*/
if (isNil {stats_terminal}) exitWith {};

stats_terminal addAction ["<t color='#FFFFFF'>Activer Qualification Médicale</t>", {player setVariable ["ace_medical_medicclass",2, true]; player setUnitTrait ["medic",true]},nil,1.5,false,false,"",'Player getUnitTrait "Medic" == false'];   
stats_terminal  addAction ["<t color='#FF0000'>Désactiver Qualification Médicale</t>", {player setVariable ["ace_medical_medicclass",0, true]; player setUnitTrait ["medic",false]},nil,1.5,false,false,"",'Player getUnitTrait "medic" == true'];   
 
stats_terminal  addAction ["<t color='#FFFFFF'>Activer Qualification Ingénieur</t>", {player setUnitTrait ["engineer",true]; player setUnitTrait ["explosiveSpecialist",true]},nil,1.5,false,false,"",'Player getUnitTrait "engineer" == false'];   
stats_terminal  addAction ["<t color='#FF0000'>Désactiver Qualification Ingénieur</t>", {player setUnitTrait ["engineer",false]; player setUnitTrait ["explosiveSpecialist",false]},nil,1.5,false,false,"",'Player getUnitTrait "engineer" == true'];  
 
stats_terminal  addAction ["<t color='#FFFFFF'>Activer Spécialiste en explosifs</t>", {player setUnitTrait ["explosiveSpecialist",true];},nil,1.5,false,false,"",'Player getUnitTrait "explosiveSpecialist" == false'];   
stats_terminal  addAction ["<t color='#FF0000'>Désactiver Spécialiste en explosifs</t>", {player setUnitTrait ["explosiveSpecialist",false];},nil,1.5,false,false,"",'Player getUnitTrait "explosiveSpecialist" == true']; 
