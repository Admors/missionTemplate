/*
    Fichier: fnc_limited_arsenal.sqf
    Auteur: Bragg edit for 528Th Légion Targon (528th.ovh) edit and improve by Admors for Adeptus TEAM (adeptusrepublica.fr).
    Publique: Non

    Description: Permet un arsnenal limité en jeu

    Exemple(s): null = [this] execVM "function\fnc_limited_arsenal.sqf"
*/

// Initialisation BOX
_crate = _this select 0;

["AmmoboxInit",
[_crate,false,{true}]] spawn BIS_fnc_arsenal;

// Listes des éléments à inclure
_availableWeapon = [
	"3AS_DC15S_F",
	"3AS_DC15A_F",
	"3AS_DC15A_GL",
	"3AS_DC15C_F",
	"3AS_Valken38X_F",
	"3AS_DC15L_F",
	"3AS_DC17S_F",
	"3AS_DC15C_GL",
	"3AS_Flamer_Base",
	"JLTS_DP23",
	"JLTS_DC15S",
    "JLTS_DC15A",
	"ls_weapon_rps6",
	"ls_weapon_rps6_disposable",
	"Weap_melee_knife",
	"SWLW_PLX1_AA",
	"JLTS_Z6",
    "3AS_WestarM5_F",
    "3AS_WestarM5_GL",
    "3AS_Valken38X_F",
    "3AS_DC15S_F",
    "3AS_DC15L_F",
    "3AS_DC15C_GL",
    "3AS_DC15C_F",
    "3AS_DC15A_F",
    "3AS_DC15A_GL",
    "3AS_Flamer_Base",
    "3AS_DC17M_F",
    "JLTS_DC15A_plastic",
    "JLTS_DC15A",
    "JLTS_DC15A_ugl_plastic",
    "JLTS_DC15A_ugl",
    "JLTS_DC15X",
    "WBK_survival_weapon_4",
    "WBK_survival_weapon_4_r",
    "WBK_survival_weapon_3",
    "Shovel_Russian_Rotated",
    "Shovel_Russian",
    "Police_Bat",
    "UNSC_Knife",
    "JLTS_DC17SA",
    "ls_weapon_at_plx1",
    "SWLW_PLX1",
    "ls_weapon_aa_plx1",
    "SWLW_DC17",
    "442_RPS6"
];

// Populate with predefined items and whatever is already in the crate

[_crate, ["%ALL"]] call BIS_fnc_addVirtualBackpackCargo;

[_crate, ["%ALL"]] call BIS_fnc_addVirtualItemCargo;

[_crate, ["%ALL"]] call BIS_fnc_addVirtualMagazineCargo;

[_crate,((weaponCargo _crate) + _availableWeapon)] call BIS_fnc_addVirtualWeaponCargo;
