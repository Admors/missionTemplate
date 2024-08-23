player setUnitLoadout (player getVariable ["Saved_Loadout", []]);
	
	fnc_reservedSlot = {
		player enableSimulationGlobal false;
		("reserved" call BIS_fnc_rscLayer) cutText ["Vous n'avez pas le droit d'occuper ce rôle.", "BLACK OUT", 1, true ];
		sleep 0.01;
		endMission "NOT_ALLOWED";
	};
	
/**
	    Affiche un indice à l'écran pendant un certain laps de temps.
	
	    Cette fonction prend une chaîne de caractères et une durée en secondes en tant que paramètres.
	    Elle affiche l'indice silencieusement à l'écran pendant la durée spécifiée, puis le retire.
	
	    Parameters:
	    _string (string): La chaîne de caractères à afficher en tant qu'indice.
	    _time (number): La durée en secondes pendant laquelle l'indice est affiché.
	
	    Exemple d'utilisation:
    fnc_hintDisplayTexts "Ceci est un message d'indice." 5;  // Affiche "Ceci est un message d'indice." pendant 5 secondes
 */
fnc_hintDisplayTexts = {
	params["_string", "_time"];
	hintSilent parseText _string;
	sleep _time;
	hintSilent "";
};

player addEventHandler ["FiredNear", {
	params ["_unit", "_firer", "_distance", "_weapon", "_muzzle", "_mode", "_ammo", "_gunner"];
	if (!((vehicle player) == player)) exitWith {};
	if (!(isNull getAssignedCuratorLogic player)) exitWith {};
	countdownTime = time + 60;
	if (alive player) then {
		_unit spawn {
			while { (countdownTime - time) > 0 } do {
				if (cameraView == "EXTERNAL") then {
					[" <t color='#FF0000'<t size='2.0'><img image='a3\ui_f_curator\data\rsccommon\rscattributebehaviour\combat_ca.paa'/></t><br/><br/>Vous êtes en combat !</t>", 5] spawn fnc_hintDisplayTexts;
					player switchCamera "INTERNAL";
					sleep 0.25;
				};
			};
			[" <t color='#00FF00'<t size='2.0'><img image='a3\ui_f_curator\data\rsccommon\rscattributebehaviour\safe_ca.paa'/></t></t>", 5] spawn fnc_hintDisplayTexts;
		};
	};
}];

/**
	    Gère l'affichage des marqueurs pour les joueurs inconscients, visibles uniquement par les médecins.
	
	    Ce script vérifie périodiquement si le joueur est un médecin ou possède des compétences médicales.
	    Pour chaque joueur, s'il est inconscient, un marqueur est créé à sa position actuelle.
	    Ce marqueur est visible uniquement pour les médecins et indique le nom du joueur inconscient.
	    Si un joueur redevient conscient, son marqueur est supprimé.
	
	    Si aucun médecin n'est présent, tous les marqueurs associés à des joueurs inconscients sont supprimés.
	
	    Remarque : Ce script suppose que les fonctions `lifeState`, `getPosATL`, `createMarkerLocal`, 
	    `setMarkerShapeLocal`, `setMarkerTypeLocal`, `setMarkerColorLocal`, `setMarkerTextLocal`, 
	    `deleteMarkerLocal`, `getUnitTrait` sont définies ailleurs dans le code.
	
	    Exemple d'utilisation :
	    Ce script signale aux médecins la présence de joueurs inconscients.
 */
private _unconsciousMarkers = [];

while {
	sleep 5;
	alive player
} do {
	// Vérifier si le joueur courant est un médecin
	private _medicLevel = player getVariable ["ace_medical_medicClass", 0];
	private _medicTrait = player getUnitTrait "Medic";

	if (_medicTrait || _medicLevel >= 1) then {
		// Parcourir tous les joueurs
		{
			private _player = _x;

			            // Vérifier si le joueur est inconscient
			if (lifestate _player == "incapacitated") then {
				private _position = getPosATL _player;
				private _markerName = format ["Unconscious_%1", name _player];

				                // Si le marqueur n'existe pas, le créer
				if (!(_markerName in _unconsciousMarkers)) then {
					_unconsciousMarkers pushBack _markerName;

					                    // Créer un marqueur local visible uniquement pour le médecin
					private _marker = createMarkerLocal [_markerName, _position];
					_marker setMarkerShapeLocal "ICON";
					_marker setMarkerTypeLocal "loc_heal";
					_marker setMarkerColorLocal "ColorRed";
					_marker setMarkerTextLocal format ["%1", name _player];
				};
			} else {
				// Si le joueur n'est plus inconscient, supprimer le marqueur
				private _markerName = format ["Unconscious_%1", name _player];
				if (_markerName in _unconsciousMarkers) then {
					_unconsciousMarkers = _unconsciousMarkers - [_markerName];
					deleteMarkerLocal _markerName;
				};
			};
		} forEach allPlayers;
	} else {
		// Supprimer tous les marqueurs associés à des joueurs inconscients
		{
			private _player = _x;
			private _markerName = format ["Unconscious_%1", name _player];
			if (_markerName in _unconsciousMarkers) then {
				_unconsciousMarkers = _unconsciousMarkers - [_markerName];
				deleteMarkerLocal _markerName;
			};
		} forEach allPlayers;
	};
};

[] execVM "function\fnc_welcome.sqf";