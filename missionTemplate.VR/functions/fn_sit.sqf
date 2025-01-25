/*
	Description:
	Ce script ajoute une action de menu d'interaction ACE permettant aux joueurs de s'asseoir sur un objet et de se lever de celui-ci.
	
	paramètres:
	_object - Objet auquel l'action de s'asseoir sera ajoutée.
	
	Variables Privées:
	_animationList - Liste des animations disponibles pour s'asseoir.
	_actionOffset - Liste des décalages pour les positions d'action autour de l'objet.
	
	sitAction - Action de menu d'interaction ACE pour s'asseoir.
	
	Fonctions:
	ace_interact_menu_fnc_createAction - Crée une action de menu d'interaction ACE.
	ace_interact_menu_fnc_addActionToObject - Ajoute une action de menu d'interaction ACE à un objet.
	
	Exécution:
	- Le script crée une action de s'asseoir qui permet aux joueurs de s'asseoir sur l'objet spécifié.
	- Lorsque l'action de s'asseoir est sélectionnée, le joueur est déplacé en position assise avec une animation aléatoire.
	- Une action supplémentaire est ajoutée pour permettre au joueur de se lever et de retourner à sa position initiale.
	- L'objet est marqué comme occupé lorsqu'un joueur est assis et libéré lorsque le joueur se lève.
	
	Remarques:
	- Le script utilise l'exécution à distance pour synchroniser les animations et les positions sur le réseau.
	- L'action de s'asseoir n'est disponible que si l'objet n'est pas déjà occupé.
*/

params ["_object"];

// Liste des animations disponibles pour les positions assises.
private _animationList = [
	"ace_sitting_HubSittingChairA_idle1", "ace_sitting_HubSittingChairA_idle2", "ace_sitting_HubSittingChairA_idle3", "ace_sitting_HubSittingChairA_move1",
	"ace_sitting_HubSittingChairB_idle1", "ace_sitting_HubSittingChairB_idle2", "ace_sitting_HubSittingChairB_idle3", "ace_sitting_HubSittingChairB_move1",
	"ace_sitting_HubSittingChairC_idle1", "ace_sitting_HubSittingChairC_idle2", "ace_sitting_HubSittingChairC_idle3", "ace_sitting_HubSittingChairC_move1",
	"ace_sitting_HubSittingChairUA_idle1", "ace_sitting_HubSittingChairUA_idle2", "ace_sitting_HubSittingChairUA_idle3", "ace_sitting_HubSittingChairUA_move1",
	"ace_sitting_HubSittingChairUB_idle1", "ace_sitting_HubSittingChairUB_idle2", "ace_sitting_HubSittingChairUB_idle3", "ace_sitting_HubSittingChairUB_move1",
	"ace_sitting_HubSittingChairUC_idle1", "ace_sitting_HubSittingChairUC_idle2", "ace_sitting_HubSittingChairUC_idle3", "ace_sitting_HubSittingChairUC_move1"
];

// Liste des décalages pour les positions d'action autour de l'objet.
private _actionOffset = [[-0.25, -0.75, 0.5], [-0.25, 0.75, 0.5]];

// Création de l'action "S'asseoir".
sitAction = [
	    'SitAction', // Identifiant de l'action.
	    "S'asseoir", // Texte affiché pour l'utilisateur.
	    '', // Icone associée (vide dans ce cas).
	{
		// Code d'exécution lorsque l'utilisateur choisit de s'asseoir.
		params ["_target", "_caller", "_arguments"];
		private _sitList = missionNamespace getVariable["AR_sitList", []];
		_sitList pushBack _caller;

		missionNamespace setVariable["AR_sitList", _sitList, true];

		// Gestion de la position
		[_caller, (AGLToASL(_target modelToWorld [0, 0, -1.5]))] remoteExec["setPosASL", 0, true];

		// Transition vers une animation neutre.
		_caller switchMove "amovpercmstpsnonwnondnon";

		// Sélection aléatoire d'une animation.
		private _animation = [(_arguments select 0), 1] call CBA_fnc_selectRandomArray;

		// Orientation de l'utilisateur par rapport à l'objet.
		_caller setDir ((getDir _target) - 90);

		// Animation choisie aléatoirement.
		[_caller, _animation] remoteExec ["switchMove", 0, true];

		// Marquer l'objet comme occupé.
		[_caller, _animation, _target] spawn {
			params["_caller", "_animation", "_target"];
			uiSleep 0.1;
			[_caller, _animation] remoteExec ["switchMove", 0, true];
			_target setVariable ["AR_isOccupied", true, true];
		};

		// Ajout d'une action pour permettre à l'utilisateur de se lever.
		_caller addAction [
			            "Se lever", // Texte de l'action.
			{
				// Code d'exécution pour se lever.
				params ["_target", "_caller", "_actionId", "_arguments"];
				_arguments params ["_posCaller", "_object"];

				// Sélection de l'animation en fonction de l'arme courante.
				private _animation = switch (currentWeapon _caller)do{
					case "": {
						"amovpercmstpsnonwnondnon"
					};
					case (primaryWeapon _caller): {
						"amovpercmstpslowwrfldnon"
					};
					case (handgunWeapon _caller): {
						"amovpercmstpslowwpstdnon"
					};
					default {
						"amovpercmstpsnonwnondnon"
					};
				};

				// Exécution de l'animation de lever.
				[_caller, _animation] remoteExec ["switchMove", 0, true];
				// Remise à la position initiale.
				_caller setPosASL _posCaller;
				// Suppression de l'action.
				_caller removeAction _actionId;
				// Libération de l'objet.
				_object setVariable ["AR_isOccupied", false, true];
			},
			            [(getPosASL _caller), _target], // Arguments passés à l'action.
			1.5,
			true,
			true,
			"",
			"true", // condition
			0,
			false,
			"",
			"" // paramètres additionnels.
		];
	},
	{
		// Condition pour afficher l'action "S'asseoir".
		!(_target getVariable ["AR_isOccupied", false]);
	},
	    {}, // Aucun code particulier pour désactiver l'action.
	    [_animationList] // Passage de la liste des animations comme argument.
] call ace_interact_menu_fnc_createAction;

// Ajout de l'action au menu interactif ACE.
{
	private _actionObject = createVehicle ["Land_HelipadEmpty_F", [0, 0, 0]];

	_actionObject setDir (getDir _object);
	_actionObject setPosASL(AGLToASL(_object modelToWorld _x)); // Positionne l'objet d'action à la position spécifiée autour de l'objet cible.
	_actionObject setVariable ["AR_isOccupied", false, true];

	[_actionObject, 0, ["ACE_MainActions"], sitAction] call ace_interact_menu_fnc_addActionToObject;
}forEach _actionOffset;