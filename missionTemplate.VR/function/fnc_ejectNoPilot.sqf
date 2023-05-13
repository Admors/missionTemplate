/*
    Fichier: fnc_ejectNoPilot.sqf
    Auteur: Admors pour Adeptus TEAM (adeptusrepublica.fr)
    Publique: Non

    Description: Eject un utilisateur non pilote à une place passagère.

    ERREUR : Non-Fonctionnel quelques bugs niveau de la validation 
*/
private _authorizedUIDs = ["76561198063259158","76561198134513977","76561198127318244","76561198241719492","76561198254448634", "76561198327438969"];
private _authorizedVehicles = ["3as_LAAT_mk2", "B_Heli_Transport_01_F"];

if (isServer) then {
    waitUntil {!isNull driver vehicle player};
    private _pilotUID = getPlayerUID64 driver vehicle player;
    private _playerUID = getPlayerUID64 player;
    private _isAuthorized = _authorizedUIDs find _playerUID > -1;
    private _isAuthorizedVehicle = _authorizedVehicles find  > -1;
    if (_pilotUID != _playerUID && (!_isAuthorized || !_isAuthorizedVehicle)) then {
        hint "Vous n'êtes pas autorisé à piloter ce véhicule !";
        player moveInCargo vehicle;
    };
};


