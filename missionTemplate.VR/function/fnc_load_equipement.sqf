/*
    Fichier: fnc_load_equipement.sqf
    Auteur: Admors pour Adeptus TEAM (adeptusrepublica.fr)
    Publique: Non

    Description: Permet via a addAction de donner un équipement pré-définis à une classe.

*/

if (isNil {load_terminal}) exitWith {};

load_terminal addAction ["<t color='#FFFFFF'>Clone Recrue</t>", "function\load_equipement\fusilier_recrue.sqf"];  
load_terminal addAction ["<t color='#FFFFFF'>Clone DC-15S</t>", "function\load_equipement\fusilier_dc15s.sqf"];  
load_terminal addAction ["<t color='#FFFFFF'>Clone DC-15A</t>", "function\load_equipement\fusilier_dc15a.sqf"];  
load_terminal addAction ["<t color='#964B00'>Clone Grenadier</t>", "function\load_equipement\fusilier_gre.sqf"];  
load_terminal addAction ["<t color='#964B00'>Clone Artilleur Lourd</t>", "function\load_equipement\artilleur_lourd.sqf"];  
load_terminal addAction ["<t color='#A020F0'>Clone Ingénieur</t>", "function\load_equipement\ingenieur.sqf"];  
load_terminal addAction ["<t color='#FF0000'>Clone Médecin</t>", "function\load_equipement\medecin.sqf"];  
load_terminal addAction ["<t color='#00FF00'>Clone Scout</t>", "function\load_equipement\scout.sqf"];  
load_terminal addAction ["<t color='#228B22'>Clone ARF</t>", "function\load_equipement\reconnaissance.sqf"];  
load_terminal addAction ["<t color='#388a73'>Clone Tireur de Précision</t>", "function\load_equipement\tp.sqf"];  
load_terminal addAction ["<t color='#FFFF00'>Clone Pilote</t>", "function\load_equipement\pilote.sqf"];  
load_terminal addAction ["<t color='#0000FF'>Clone AT</t>", "function\load_equipement\at.sqf"];  
load_terminal addAction ["<t color='#1e6d85'>Clone Opérateur</t>", "function\load_equipement\operateur.sqf"];  
load_terminal addAction ["<t color='#FF7F00'>Clone EOD</t>", "function\load_equipement\eod.sqf"];
