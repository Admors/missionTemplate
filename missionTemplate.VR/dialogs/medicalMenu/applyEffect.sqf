_indexBodyPart = lbCurSel 1500;
_indexDamageType = lbCurSel 1501;
_indexSlider = sliderPosition 1900;

private _bodyPart = ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"] select _indexBodyPart;
private _damageType = ["backblast", "bite", "bullet", "explosive", "falling", "grenade", "punch", "ropeburn", "shell", "stab", "unknown", "vehiclecrash"] select _indexDamageType;

// [medicUnit, true] call ace_medical_fnc_setUnconscious;
[medicUnit, _indexSlider, _bodyPart, _damageType] remoteExecCall ["ace_medical_fnc_addDamageToUnit"];
hintSilent formatText["Partie du corps : %1 %2 Type de dégât : %3 %4 Quantité de dégât : %5 ", _bodyPart, lineBreak, _damageType, lineBreak, _indexSlider];
sleep 10;
hintSilent "";