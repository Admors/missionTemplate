createDialog "medicSim";

bodyPartListArray = ["Tête", "Torse", "Bras Gauche", "Bras droit", "Jambe Gauche", "Jambe Droite"];
damageTypeListArray = ["Retour de flamme", "Morsure", "Balle", "Explosif", "Chute", "Grenade", "Coup de point", "Friction", "Shrapnel", "Poignarder", "Inconnue", "Crash de vehicule"];

{
	lbAdd [1500, _x];
}forEach bodyPartListArray;

{
	lbAdd [1501, _x];
}forEach damageTypeListArray;