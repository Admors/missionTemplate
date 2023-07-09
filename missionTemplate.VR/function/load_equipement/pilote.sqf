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
player addWeapon "JLTS_DC17SA";
player addHandgunItem "JLTS_stun_mag_short";

comment "Add containers";
player forceAddUniform "adeptus_trooper_uniform_v1";
player addVest "SWLB_clone_basic_armor";
player addBackpack "SWLB_CEE_Recon_RTO_Backpack";

comment "Add binoculars";
player addMagazine "Laserbatteries";
player addWeapon "JLTS_CloneBinocular";

comment "Add items to containers";
for "_i" from 1 to 4 do {player addItemToUniform "JLTS_DC17SA_mag";};
for "_i" from 1 to 2 do {player addItemToUniform "OPTRE_M2_Smoke";};
for "_i" from 1 to 2 do {player addItemToUniform "SmokeShellGreen";};
for "_i" from 1 to 2 do {player addItemToUniform "SmokeShellRed";};
for "_i" from 1 to 2 do {player addItemToUniform "3AS_BaridumCore";};
for "_i" from 1 to 4 do {player addItemToUniform "JLTS_stun_mag_long";};
for "_i" from 1 to 5 do {player addItemToVest "ACE_CableTie";};
for "_i" from 1 to 5 do {player addItemToVest "ACE_fieldDressing";};
for "_i" from 1 to 5 do {player addItemToVest "ACE_quikclot";};
player addItemToVest "ACE_Flashlight_XL50";
player addItemToVest "ACE_microDAGR";
for "_i" from 1 to 5 do {player addItemToVest "ACE_elasticBandage";};
for "_i" from 1 to 5 do {player addItemToVest "ACE_packingBandage";};
for "_i" from 1 to 2 do {player addItemToVest "ACE_morphine";};
for "_i" from 1 to 3 do {player addItemToVest "ACE_IR_Strobe_Item";};
for "_i" from 1 to 2 do {player addItemToVest "ACE_epinephrine";};
player addHeadgear "adeptus_helmet_pilot_p2";
player addGoggles "442_clone_p2_glasses";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ACE_Altimeter";
player linkItem "SWLB_comlink";
player linkItem "ItemGPS";