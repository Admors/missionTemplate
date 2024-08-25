PLP_fnc_revive = {
	_pos = getPosATL _this;
	_dir = getDir _this;
	_type = typeOf _this;
	_name = name _this;
	_nameSound = nameSound _this;
	_face = face _this;
	_speaker = speaker _this;
	_loadout = getUnitLoadout _this;
	_wpnCargo = getWeaponCargo (_pos nearestObject "weaponHolderSimulated");

	deleteVehicle _this;
	_group = createGroup side _this;
	_unit = _group createUnit [_type, _pos, [], 0, "CAN_COLLIDE"];
	_unit switchMove "UnconsciousReviveArms";
	// _unit setUnitPos "DOWN";
	_unit setDir _dir;
	_unit setUnitLoadout _loadout;
	_unit addWeapon (_wpnCargo select 0 select 0);
	_unit setName _name;
	_unit setNameSound _nameSound;
	_unit setFace _face;
	_unit setSpeaker _speaker;
	_unit enableSimulationGlobal false;
	missionNamespace setVariable ["medicUnit", _unit];
};

hintSilent "Le sujet a été soigné.";
medicUnit remoteExecCall ["PLP_fnc_revive"];
medicUnit switchMove "UnconsciousReviveArms";
[[medicUnit, true, 99999, false], ace_medical_fnc_setUnconscious] remoteExec ["call", 0, true];

sleep 10;
hintSilent "";