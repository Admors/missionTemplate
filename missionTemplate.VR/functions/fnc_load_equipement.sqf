/*
    Fichier: fnc_load_equipement.sqf
    Auteur: Admors pour Adeptus TEAM (adeptusrepublica.fr)
    Publique: Non

    Description: Permet via a addAction de donner un équipement pré-définis à une classe.

*/

if (isNil {load_terminal}) exitWith {};

#define ADD_ACTION(_terminal, _text, _script, _radius) _terminal addAction [_text, {_script}, nil, 1.5, true, true, "", "true", _radius, false, "", ""]

ADD_ACTION(load_terminal, "<t color='#FFFFFF'>Clone Recrue</t>", execVM "functions\load_equipement_adeptus\fusilier_recrue.sqf", 5);
ADD_ACTION(load_terminal, "<t color='#FFFFFF'>Clone DC-15S</t>", execVM "functions\load_equipement_adeptus\fusilier_dc15s.sqf", 5);
ADD_ACTION(load_terminal, "<t color='#FFFFFF'>Clone DC-15A</t>", execVM "functions\load_equipement_adeptus\fusilier_dc15a.sqf", 5);
ADD_ACTION(load_terminal, "<t color='#964B00'>Clone Grenadier</t>", execVM "functions\load_equipement_adeptus\fusilier_gre.sqf", 5);
ADD_ACTION(load_terminal, "<t color='#964B00'>Clone Artilleur Lourd</t>", execVM "functions\load_equipement_adeptus\artilleur_lourd.sqf", 5);
ADD_ACTION(load_terminal, "<t color='#A020F0'>Clone Ingénieur</t>", execVM "functions\load_equipement_adeptus\ingenieur.sqf", 5);
ADD_ACTION(load_terminal, "<t color='#FF0000'>Clone Médecin</t>", execVM "functions\load_equipement_adeptus\medecin.sqf", 5);
ADD_ACTION(load_terminal, "<t color='#00FF00'>Clone Scout</t>", execVM "functions\load_equipement_adeptus\scout.sqf", 5);
ADD_ACTION(load_terminal, "<t color='#228B22'>Clone ARF</t>", execVM "functions\load_equipement_adeptus\reconnaissance.sqf", 5);
ADD_ACTION(load_terminal, "<t color='#388a73'>Clone Tireur de Précision</t>", execVM "functions\load_equipement_adeptus\tp.sqf", 5);
ADD_ACTION(load_terminal, "<t color='#FFFF00'>Clone Pilote</t>", execVM "functions\load_equipement_adeptus\pilote.sqf", 5);
ADD_ACTION(load_terminal, "<t color='#0000FF'>Clone AT</t>", execVM "functions\load_equipement_adeptus\at.sqf", 5);
ADD_ACTION(load_terminal, "<t color='#1e6d85'>Clone Opérateur</t>", execVM "functions\load_equipement_adeptus\operateur.sqf", 5);
ADD_ACTION(load_terminal, "<t color='#FF7F00'>Clone EOD</t>", execVM "functions\load_equipement_adeptus\eod.sqf", 5);
