/*
    Fichier: fnc_ejectNoPilot.sqf
    Auteur: Admors pour Adeptus TEAM (adeptusrepublica.fr)
    Publique: Non

    Description: Eject un utilisateur non pilote. 
*/
private _allowedUIDs = ["76561198063259158","76561198134513977","76561198127318244","76561198241719492","76561198254448634", "76561198327438969"];

if (isNil {air_1}) exitWith {};

air_1 addEventHandler ["GetIn", {
    private _unit = _this select 2;
    private _uid = getPlayerUID _unit;

    if (!(_uid in _allowedUIDs)) then {
        _unit action ["eject", _this select 0];
        hint "Vous n'êtes pas autorisé à piloter ce véhicule !";
    };
}];
