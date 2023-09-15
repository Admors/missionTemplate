/*
    Fichier: fnc_authAttribution.sqf
    Auteur: Admors for Adeptus TEAM (adeptusrepublica.fr).
    Publique: Non

    Description: Assigne une spécialisation à un utilisateur à l'aide d'une bibliothèque d'UID64. 
*/

sleep 2; // Délai d'execution

MEDECIN = ["76561198218934540","76561198007972617","76561198272941463", "76561198241719492","76561198091207614"];
ENGINEER = ["76561198063259158","76561198134513977","76561198254448634","76561198148617439","76561198111618582"];
EOD = ["76561198007972617","76561198127318244","76561198272941463","76561198241719492","76561198213235397"];

_playerUID = getPlayerUID player; // Récupère l'UID64

switch (true) do {
    case (_playerUID in MEDECIN)   : { player setVariable ["ace_medical_medicclass",2, true]; player setUnitTrait ["Medic",true]; };
    case (_playerUID in ENGINEER)   : { player setVariable ["ace_isEngineer",2, true]; player setUnitTrait ["Engineer",true]; player setVariable ["ace_isExplosiveSpecialist", true, true]; player setUnitTrait ["ExplosiveSpecialist",true]; };
    case (_playerUID in EOD) : { player setVariable ["ace_isExplosiveSpecialist", true, true]; player setUnitTrait ["ExplosiveSpecialist",true] };

    default { hint "None" }; // Paramètre par défaut d'un joueur.    
};