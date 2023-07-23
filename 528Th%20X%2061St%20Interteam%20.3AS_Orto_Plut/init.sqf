[] execVM "528th_Aux\Mission_Script\init_InfoPanel.sqf"; //InfoPanel Script Need "infopanel_1", "infopanel_2", "infopanel_3", "infopanel_4"

[] execVM "528th_Aux\Mission_Script\init_Loadout.sqf"; //Loadout Script Need "Loadout_AT", "Loadout_EOD", "Loadout_Flame", "Loadout_GL", "Loadout_Infirmier", "Loadout_Ingenieur", "Loadout_JTAC", "Loadout_Medic", "Loadout_Mortier", "Loadout_Pilote", "Loadout_Shield", "Loadout_Soldat", "Loadout_TP", "Loadout_Z6"

[] execVM "528th_Aux\Mission_Script\init_UnitTrait.sqf"; //UnitTrait Script Need "UnitTrait_Ingenieur", "UnitTrait_medic", "UnitTrait_EOD"

[] execVM "528th_Aux\Mission_Script\init_MapIcon.sqf"; //Player Map Icon Script

[] execVM "528th_Aux\Mission_Script\init_GarageAir.sqf"; //garage Air Script Need "SpawnAir_Pad", "SpawnAir_terminal"

[] execVM "528th_Aux\Mission_Script\init_GarageCar.sqf"; //garage Car Script Need "SpawnCar_Pad", "SpawnCar_terminal"

[] execVM "528th_Aux\Mission_Script\init_fortifyACE.sqf"; //Add fortify in ace menu

MAC_fnc_switchMove = {
   private["_object","_anim"];
   _object = _this select 0;
   _anim = _this select 1;

   _object switchMove _anim;
};