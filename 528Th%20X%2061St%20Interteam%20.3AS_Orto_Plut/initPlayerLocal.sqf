sameAsDeath = true;  // false for loadout at start
loadoutAtStart = getUnitLoadout player;

addMissionEventHandler ["EntityKilled", {
  params ["_victim","_killer","_instigator"];
  if (isPlayer _victim) then {
    _victim setVariable ["ldout",getUnitLoadout _victim];
    _victim setVariable ["MGI_weapon",currentWeapon _victim];
  };
}];

addMissionEventHandler ["EntityRespawned", {
  params ["_unit","_corpse"];
  if (isPlayer _unit && local _unit) then {
    if (sameAsDeath) then {
      _unit setUnitLoadout (_corpse getVariable ["ldout",getUnitLoadout _unit]);
      _unit selectWeapon (_unit getVariable "MGI_weapon");
    } else {
      _unit setUnitLoadout loadoutAtStart;
    };
    {deleteVehicle _x} forEach nearestObjects [(getPosATL _corpse),["WeaponHolderSimulated","groundWeaponHolder"],5];
    deleteVehicle _corpse;
  };
}];
private _video = ["528th_Aux\Mission_Textures\DebutMission.ogv"] spawn BIS_fnc_playVideo;