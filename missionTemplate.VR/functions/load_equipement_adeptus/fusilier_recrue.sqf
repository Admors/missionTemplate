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
player addWeapon "JLTS_DC15S";
player addWeapon "JLTS_DC17SA";
player addHandgunItem "JLTS_stun_mag_short";

comment "Add containers";
player forceAddUniform "SWLB_clone_uniform";
player addVest "SWLB_clone_basic_armor";
player addBackpack "ar_empty_backpack";

comment "Add binoculars";
player addMagazine "Laserbatteries";
player addWeapon "JLTS_CloneBinocular";

comment "Add items to containers";
for "_i" from 1 to 4 do {player addItemToUniform "JLTS_DC17SA_mag";};
for "_i" from 1 to 5 do {player addItemToBackpack "ACE_CableTie";};
player addItemToBackpack "ACE_EntrenchingTool";
for "_i" from 1 to 5 do {player addItemToBackpack "ACE_fieldDressing";};
for "_i" from 1 to 5 do {player addItemToBackpack "ACE_quikclot";};
player addItemToBackpack "ACE_Flashlight_XL50";
player addItemToBackpack "ACE_microDAGR";
for "_i" from 1 to 5 do {player addItemToBackpack "ACE_elasticBandage";};
for "_i" from 1 to 5 do {player addItemToBackpack "ACE_packingBandage";};
for "_i" from 1 to 5 do {player addItemToBackpack "ACE_morphine";};
for "_i" from 1 to 3 do {player addItemToBackpack "ACE_IR_Strobe_Item";};
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_epinephrine";};
for "_i" from 1 to 4 do {player addItemToBackpack "JLTS_stun_mag_long";};
for "_i" from 1 to 9 do {player addItemToBackpack "JLTS_DC15A_mag";};
for "_i" from 1 to 2 do {player addItemToBackpack "3AS_BaridumCore";};
for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShellRed";};
for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShellGreen";};
for "_i" from 1 to 2 do {player addItemToBackpack "OPTRE_M2_Smoke";};
player addHeadgear "ar_p2_helmet_v2";
player addGoggles "442_clone_p2_glasses";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ACE_Altimeter";
player linkItem "SWLB_comlink_1";
player linkItem "ItemGPS";
player linkItem "lsd_gar_standard_nvg";

_color = "#FFFFFF";
_name = "Recrue";
[parseText format ["<t font='PuristaBold'> Équipement ajouté avec succès <br/> </t> <t font='PuristaBold' size='1.6' color='%1'> %2 </t>", _color,_name], true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
