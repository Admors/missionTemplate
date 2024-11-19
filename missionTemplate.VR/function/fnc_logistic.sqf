private _crateNameArray = ["Adeptus_Ammo_basic", "Adeptus_Grenade_basic", "Adeptus_Lanceurs_basic", "Adeptus_Medical_basic"];
private _crateTextArray = ["Caisse de munition", "Caisse de grenade", "Caisse de lanceurs", "Caisse medical"];

for "_x" from 0 to 3 do {
	logisticUnit addAction
	[
		_crateTextArray # _x,
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			private _crate =createVehicle[_arguments, getPosATL logisticLogic, [], 0, "CAN_COLLIDE"];
		},
		_crateNameArray # _x,
		1.5,
		true,
		true,
		"",
		"true",
		3,
		false
	];
};