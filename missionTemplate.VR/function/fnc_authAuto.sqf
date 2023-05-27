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

_playerUID = getPlayerUID player; 

{
    switch (true) do {
    case (_playerUID in MEDICAL): {
        player setVariable ["ace_medical_medicclass", 2, true];
        player setUnitTrait ["medic", true];
    }; 
    case(_playerUID in ENGINEER): {
        player setUnitTrait["engineer", true];
        player setUnitTrait["explosiveSpecialist",true];
    };
    case(_playerUID in EOD): {
        player setUnitTrait["explosiveSpecialist",true]
    };
	default { hint "ERREUR : Vous n'avez aucune de ces facultés !" };
    };

} forEach allPlayers;
