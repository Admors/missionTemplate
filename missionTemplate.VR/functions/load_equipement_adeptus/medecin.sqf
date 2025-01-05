comment "Remove existing items";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add weapons";
player addWeapon "3AS_DC15A_F";
player addPrimaryWeaponItem "3AS_Muzzle_LE_DC15A";
player addPrimaryWeaponItem "acc_pointer_IR";
player addPrimaryWeaponItem "3AS_Optic_LEScope_DC15A";
player addPrimaryWeaponItem "3AS_45Rnd_EC50_Mag";
player addWeapon "JLTS_DC17SA";
player addHandgunItem "JLTS_DC17SA_mag";

comment "Add containers";
player forceAddUniform "ar_trooperUniform_v2";
player addVest "ar_medic_armor";
player addBackpack "ar_heavy_medic_backpack";

comment "Add binoculars";
player addMagazine "Laserbatteries";
player addWeapon "SWLB_clone_binocular";

comment "Add items to containers";
for "_i" from 1 to 9 do {player addItemToUniform "3AS_45Rnd_EC50_Mag";};
for "_i" from 1 to 4 do {player addItemToUniform "JLTS_DC17SA_mag";};
for "_i" from 1 to 2 do {player addItemToVest "ACE_IR_Strobe_Item";};
player addItemToVest "ACE_EarPlugs";
for "_i" from 1 to 5 do {player addItemToVest "ACE_CableTie";};
player addItemToVest "ACE_Flashlight_XL50";
player addItemToVest "ACE_microDAGR";
player addItemToVest "WBK_HeadLampItem";
player addItemToVest "ACE_EntrenchingTool";
for "_i" from 1 to 2 do {player addItemToVest "JLTS_stun_mag_long";};
for "_i" from 1 to 2 do {player addItemToVest "3AS_ThermalDetonator";};
for "_i" from 1 to 2 do {player addItemToVest "3AS_SmokeWhite";};
for "_i" from 1 to 2 do {player addItemToVest "3AS_SmokeRed";};
for "_i" from 1 to 2 do {player addItemToVest "3AS_SmokeGreen";};
player addItemToVest "kat_Carbonate";
player addItemToBackpack "ACE_personalAidKit";
player addItemToBackpack "ACE_surgicalKit";
player addItemToBackpack "kat_X_AED";
player addItemToBackpack "kat_BVM";
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_splint";};
for "_i" from 1 to 30 do {player addItemToBackpack "ACE_packingBandage";};
for "_i" from 1 to 50 do {player addItemToBackpack "ACE_elasticBandage";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_epinephrine";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_morphine";};
for "_i" from 1 to 20 do {player addItemToBackpack "ACE_salineIV_500";};
for "_i" from 1 to 15 do {player addItemToBackpack "ACE_salineIV";};
for "_i" from 1 to 10 do {player addItemToBackpack "kat_Carbonate";};
player addHeadgear "ar_p2_helmet_v2";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "SWLB_comlink_1";
player linkItem "ItemGPS";
player linkItem "lsd_gar_standard_nvg";

comment "Set identity";
[player,"Head_SFA_Mirakulan_01","ace_novoice"] call BIS_fnc_setIdentity;
[player,"JLTS_GAR_medic"] call BIS_fnc_setUnitInsignia;

_color = "#FF0000";
_name = "Médecin";
[parseText format ["<t font='PuristaBold'> Équipement ajouté avec succès <br/> </t> <t font='PuristaBold' size='1.6' color='%1'> %2 </t>", _color,_name], true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;

