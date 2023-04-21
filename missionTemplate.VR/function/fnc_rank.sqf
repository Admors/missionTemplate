 /*
    File: fnc_rank.sqf
    Author: Violt Created for American-Tactics.com (Closed) edit and improve by Admors for Adeptus TEAM (adeptusrepublica.fr).
    Public: No

    Description: Assigne un rang à un utilisateur à l'aide d'une bibliothèque d'UID. 
*/

sleep 2; // Délai d'execution du Code

CORPORAL        =    ["76561198218934540","76561198007972617","76561198195563307","76561198254448634"];
SERGEANT        =    ["76561198272941463"];
LIEUTENANT      =    ["76561198127318244"];
CAPTAIN         =    ["76561198134513977"];
MAJOR           =    ["76561198063259158"];
COLONEL         =    [];

_playerUID = getPlayerUID player; // Récupère l'UID64

switch (true) do {
    case (_playerUID in CORPORAL)   : { player setRank "CORPORAL"; };
    case (_playerUID in SERGEANT)   : { player setRank "SERGEANT"; };
    case (_playerUID in LIEUTENANT) : { player setRank "LIEUTENANT"; };
    case (_playerUID in CAPTAIN)    : { player setRank "CAPTAIN"; };
    case (_playerUID in MAJOR)      : { player setRank "MAJOR"; };
    case (_playerUID in COLONEL)    : { player setRank "COLONEL"; };

    default { hint "Vous êtes un Soldat !"; }; // Paramètre par défaut d'un joueur.    
};