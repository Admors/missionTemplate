// ranks.sqf  -  called from init.sqf

// nous pourrions avoir 1 grand tableau multi-dim contenant chaque ID utilisateur et rang mais ...
// cela rendrait ce réglage plus difficile à l'avenir puisqu'il s'agit d'un manuel
// processus. Si vous deviez charger ces données à partir d'une base de données par exemple, vous pourriez
// veut le garder dans un tableau multidimensionnel comme:
// [["1234","PRIVATE"],["231","General"]]
Ranks_PRIVATE		=	[];
Ranks_CORPORAL		=	[];
Ranks_SERGEANT		=	[];
Ranks_LIEUTENANT	=	[];
Ranks_CAPTAIN		=	["76561198134513977"]; // Red
Ranks_MAJOR			=	["76561198063259158"]; //SixOne
Ranks_COLONEL		=	[]; 



_playerUID = player getPlayerUID;
_found = false;
_rank = "PRIVATE"; // default private rank

// vérifier si votre joueur correspond

while {!_found} do {
	if (_playerUID in Ranks_PRIVATE) then {
		_rank = "PRIVATE";
		_found = true; // breaks us out of this while loop
	};
	// ... and so on
};

// définit enfin le classement de nos joueurs!
player setRank _rank;