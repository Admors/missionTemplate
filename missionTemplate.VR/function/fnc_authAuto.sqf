/*
    Fichier: fnc_authAuto.sqf
    Auteur: Admors pour Adeptus TEAM (adeptusrepublica.fr)
    Publique: Non

    Description: Assigne un rôle à un utilisateur à l'aide d'une bibliothèque d'UID64.        
 
	ERREUR : Non-Fonctionnel quelques bugs niveau de la validation
*/

sleep 2;

MEDICAL = ["76561198218934540","76561198007972617","76561198272941463","76561198241719492"];
ENGINEER = ["76561198063259158","76561198134513977"];
EOD = ["76561198063259158","76561198134513977","76561198007972617","76561198127318244","76561198272941463","76561198241719492"];

private _playerUID = getPlayerUID _player; 

if (_playerUID in MEDICAL) exitWith {
    _player setVariable ["ace_medical_medicclass", 2, true];
    _player setUnitTrait ["medic", true];
};
if (_playerUID in ENGINEER) exitWith {
    _player setUnitTrait ["engineer", true];
    _player setUnitTrait ["explosiveSpecialist",true];
};
if (_playerUID in EOD) exitWith {
    _player setUnitTrait ["explosiveSpecialist",true]
};