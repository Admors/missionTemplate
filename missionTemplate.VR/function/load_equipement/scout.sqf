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
player addHandgunItem "JLTS_DC17SA_flashlight";

comment "Add containers";
player forceAddUniform "adeptus_trooper_uniform_scout";
player addVest "SWLB_clone_recon_armor";
player addBackpack "Adeptus_Backpack_radio_med";

comment "Add binoculars";
player addMagazine "Laserbatteries";
player addWeapon "SWLB_clone_binocular";

comment "Add items to containers";
for "_i" from 1 to 5 do {player addItemToUniform "ACE_packingBandage";};
for "_i" from 1 to 5 do {player addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 5 do {player addItemToUniform "ACE_elasticBandage";};
for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
for "_i" from 1 to 2 do {player addItemToUniform "ACE_epinephrine";};
for "_i" from 1 to 2 do {player addItemToUniform "SmokeShellRed";};
for "_i" from 1 to 2 do {player addItemToUniform "SmokeShellGreen";};
for "_i" from 1 to 2 do {player addItemToUniform "SmokeShell";};
for "_i" from 1 to 3 do {player addItemToUniform "JLTS_stun_mag_long";};
for "_i" from 1 to 5 do {player addItemToUniform "JLTS_DC17SA_mag";};
for "_i" from 1 to 5 do {player addItemToBackpack "ACE_CableTie";};
player addItemToBackpack "WBK_HeadLampItem";
player addItemToBackpack "J3FF_FoxholeTool";
for "_i" from 1 to 3 do {player addItemToBackpack "ACE_IR_Strobe_Item";};
player addItemToBackpack "MineDetector";
for "_i" from 1 to 10 do {player addItemToBackpack "JLTS_DC15S_mag";};
for "_i" from 1 to 2 do {player addItemToBackpack "3AS_SmokeWhite";};
for "_i" from 1 to 2 do {player addItemToBackpack "3AS_ThermalDetonator";};
player addItemToBackpack "JLTS_DC17SA_mag";
player addHeadgear "adeptus_helmet_scout";
player addGoggles "442_clone_arf_glasses";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "SWLB_comlink_2";
player linkItem "ItemGPS";
player linkItem "k_nvg_ti";
