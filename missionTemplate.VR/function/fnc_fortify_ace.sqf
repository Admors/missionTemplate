/*
    Fichier: fnc_fortify_ace.sqf
    Auteur: Admors pour Adeptus TEAM (adeptusrepublica.fr)
    Publique: Non

    Description: Permet l'ajout d'objet via le fortify ace en jeu. Il accorde la gestion de budget et les objets à placer.
*/

[west, 450, [
    
["3AS_Cover1",15],
["3AS_Cover2",20],
["3AS_Barricade_2_C_prop",25],
["3AS_H_barrier_small_1",40],
["3AS_H_barrier_small_3",50],
["3AS_H_barrier_small_5",65],
["3AS_Short_Wall_Bunker",100],
["cwa_HeliH",5],
["3AS_HeavyRepeater_Unarmoured",125],
["3AS_Republic_Mortar",250]

]] call acex_fortify_fnc_registerObjects;

