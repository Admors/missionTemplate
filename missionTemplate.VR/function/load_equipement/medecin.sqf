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
player forceAddUniform "adeptus_trooper_uniform_v1";
player addVest "SWLB_clone_medic_armor";
player addBackpack "Adeptus_Backpack_MDC_med";

comment "Add binoculars";
player addMagazine "Laserbatteries";
player addWeapon "JLTS_CloneBinocular";

comment "Add items to containers";
for "_i" from 1 to 4 do {player addItemToUniform "JLTS_DC17SA_mag";};
for "_i" from 1 to 6 do {player addItemToBackpack "ACE_salineIV_500";};
for "_i" from 1 to 4 do {player addItemToBackpack "ACE_salineIV";};
for "_i" from 1 to 8 do {player addItemToBackpack "ACE_salineIV_250";};
for "_i" from 1 to 5 do {player addItemToBackpack "ACE_CableTie";};
player addItemToBackpack "ACE_EntrenchingTool";
for "_i" from 1 to 15 do {player addItemToBackpack "ACE_fieldDressing";};
for "_i" from 1 to 15 do {player addItemToBackpack "ACE_quikclot";};
player addItemToBackpack "ACE_MapTools";
player addItemToBackpack "ACE_Flashlight_XL50";
player addItemToBackpack "ACE_microDAGR";
for "_i" from 1 to 8 do {player addItemToBackpack "ACE_tourniquet";};
for "_i" from 1 to 15 do {player addItemToBackpack "ACE_elasticBandage";};
for "_i" from 1 to 15 do {player addItemToBackpack "ACE_packingBandage";};
for "_i" from 1 to 8 do {player addItemToBackpack "ACE_morphine";};
for "_i" from 1 to 3 do {player addItemToBackpack "ACE_IR_Strobe_Item";};
for "_i" from 1 to 8 do {player addItemToBackpack "ACE_epinephrine";};
for "_i" from 1 to 4 do {player addItemToBackpack "JLTS_stun_mag_long";};
for "_i" from 1 to 9 do {player addItemToBackpack "JLTS_DC15A_mag";};
for "_i" from 1 to 2 do {player addItemToBackpack "3AS_BaridumCore";};
for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShellRed";};
for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShellGreen";};
for "_i" from 1 to 2 do {player addItemToBackpack "OPTRE_M2_Smoke";};
player addHeadgear "adeptus_helmet_p2_v1";
player addGoggles "442_clone_p2_glasses";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ACE_Altimeter";
player linkItem "SWLB_comlink_7";
player linkItem "ItemGPS";
player linkItem "lsd_gar_standard_nvg";

_color = "#FF0000";
_name = "Médecin";
[parseText format ["<t font='PuristaBold'> Équipement ajouté avec succès <br/> </t> <t font='PuristaBold' size='1.6' color='%1'> %2 </t>", _color,_name], true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
