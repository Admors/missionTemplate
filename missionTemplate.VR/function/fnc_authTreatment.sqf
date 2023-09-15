/*
    Fichier: fnc_authorizationManagement.sqf
    Auteur: Admors pour Adeptus TEAM (adeptusrepublica.fr)
    Publique: Non

    Description: addAction qui renvoie une autorisation via le stats_terminal.        
*/

if (isNil {stats_terminal}) exitWith {};

stats_terminal addAction ["<t color='#FFFFFF'>Activer Qualification Médicale</t>", {hint "Vous avez ajouter votre rôle",player setVariable ["ace_medical_medicclass",2, true]; player setUnitTrait ["Medic",true]},nil,1.5,false,false,"",'Player getUnitTrait "Medic" == false'];   
stats_terminal addAction ["<t color='#FF0000'>Désactiver Qualification Médicale</t>", {hint "Vous avez retirer votre rôle", player setVariable ["ace_medical_medicclass",0, true]; player setUnitTrait ["Medic",false]},nil,1.5,false,false,"",'Player getUnitTrait "medic" == true'];   
 
stats_terminal  addAction ["<t color='#FFFFFF'>Activer Qualification Ingénieur</t>", {hint "Vous avez ajouter votre rôle", player setVariable ["ace_isEngineer",2, true]; player setUnitTrait ["Engineer",true]; player setVariable ["ace_isExplosiveSpecialist", true, true]; player setUnitTrait ["ExplosiveSpecialist",true]},nil,1.5,false,false,"",'Player getUnitTrait "engineer" == false'];   
stats_terminal  addAction ["<t color='#FF0000'>Désactiver Qualification Ingénieur</t>", {hint "Vous avez retirer votre rôle", player setVariable ["ace_isEngineer",0, true]; player setUnitTrait ["Engineer",false]; player setVariable ["ace_isExplosiveSpecialist", false, true];player setUnitTrait ["ExplosiveSpecialist",false]},nil,1.5,false,false,"",'Player getUnitTrait "engineer" == true'];  
 
stats_terminal  addAction ["<t color='#FFFFFF'>Activer Spécialiste en explosifs</t>", {hint "Vous avez ajouter votre rôle",player setVariable ["ace_isExplosiveSpecialist", true, true]; player setUnitTrait ["ExplosiveSpecialist",true];},nil,1.5,false,false,"",'Player getUnitTrait "ExplosiveSpecialist" == false'];   
stats_terminal  addAction ["<t color='#FF0000'>Désactiver Spécialiste en explosifs</t>", {hint "Vous avez retirer votre rôle", player setVariable ["ace_isExplosiveSpecialist", false, true]; player setUnitTrait ["ExplosiveSpecialist",false];},nil,1.5,false,false,"",'Player getUnitTrait "ExplosiveSpecialist" == true']; 

/* 
-- Pour ARMA 3 
[
	["Medic", false],
	["Engineer", false],
	["ExplosiveSpecialist", false],
	["UavHacker", false],
	["CamouflageCoef", 1],
	["AudibleCoef", 1],
	["LoadCoef", 1],
	["test", "custom"]
]
-- Pour ACE
[
	["ace_medial_medicalss",2, true],
	["ace_isEngineer",2, true],
	["ace_isExplosiveSpecialist",true, true]
]
https://ace3.acemod.org/
*/