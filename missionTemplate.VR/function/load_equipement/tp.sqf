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
player addWeapon "JLTS_DC15X";
player addPrimaryWeaponItem "JLTS_DC15X_scope";
player addPrimaryWeaponItem "JLTS_DC15X_mag";
player addWeapon "442_DC15SA";
player addHandgunItem "442_127x33_10rnd_blue_mag";

comment "Add containers";
player forceAddUniform "adeptus_trooper_uniform_v1";
player addVest "SWLB_clone_specialist_armor";
player addBackpack "Adeptus_Backpack_radio_med";

comment "Add binoculars";
player addMagazine "Laserbatteries";
player addWeapon "SWLB_clone_binocular";

comment "Add items to containers";
player addItemToUniform "ACE_microDAGR";
player addItemToUniform "MineDetector";
for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
for "_i" from 1 to 3 do {player addItemToUniform "442_127x33_10rnd_blue_mag";};
for "_i" from 1 to 10 do {player addItemToVest "ACE_elasticBandage";};
for "_i" from 1 to 10 do {player addItemToVest "ACE_packingBandage";};
for "_i" from 1 to 2 do {player addItemToVest "ACE_epinephrine";};
for "_i" from 1 to 2 do {player addItemToVest "ACE_morphine";};
player addItemToVest "ACE_Flashlight_XL50";
for "_i" from 1 to 5 do {player addItemToVest "ACE_IR_Strobe_Item";};
for "_i" from 1 to 5 do {player addItemToBackpack "ACE_CableTie";};
player addItemToBackpack "ACE_EntrenchingTool";
for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShellGreen";};
for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShellRed";};
for "_i" from 1 to 2 do {player addItemToBackpack "OPTRE_M2_Smoke";};
for "_i" from 1 to 7 do {player addItemToBackpack "JLTS_DC15X_mag";};
for "_i" from 1 to 2 do {player addItemToBackpack "442_thermal_det_mag";};
player addHeadgear "adeptus_helmet_barc";
player addGoggles "442_clone_ab_barc_glasses";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "tf_microdagr";
player linkItem "JLTS_clone_comlink_1";
player linkItem "ItemGPS";
player linkItem "lsd_gar_standardSPC_nvg";
