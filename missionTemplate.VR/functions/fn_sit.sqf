/*
    Fichier: fnc_sitInteraction.sqf
    Auteur: Archer for Adeptus TEAM (adeptusrepublica.fr).
    Publique: Non

    Description: Configure une interaction ACE permettant à un utilisateur de s'asseoir sur un objet en jeu, avec différentes animations 
                 et vérifications dynamiques basées sur l'état de l'objet et du joueur.
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

// Initialise la variable indiquant si l'objet est occupé.
_object setVariable ["isOccupied", false, true];

// Création de l'action "S'asseoir".
private _sitAction = [
    'SitAction',                            // Identifiant de l'action.
    "S'asseoir",                            // Texte affiché pour l'utilisateur.
    '',                                    // Icone associée (vide dans ce cas).
    {
        // Code d'exécution lorsque l'utilisateur choisit de s'asseoir.
        params ["_target", "_caller", "_arguments"];

        _caller switchMove "amovpknlmstpsraswrfldnon"; // Transition vers une animation neutre.
        private _dir = getDir _target; // Direction actuelle de l'objet.

        private _cPos = [];
        private _tPos = [];

        // Gestion de la position en fonction de la surface (eau ou terrain).
        if (surfaceIsWater getPos _caller) then {
            _cPos = getPosASL _caller;
            _tPos = getPosASL _target;
            _caller setPosASL [
                (_tPos select 0),
                (_tPos select 1) - 0.15,
                (_tPos select 2) - 0.6
            ];
        } else {
            _cPos = getPosATL _caller;
            _tPos = getPosATL _target;
            _caller setPosATL [
                (_tPos select 0),
                (_tPos select 1) - 0.15,
                (_tPos select 2) - 0.6
            ];
        };

        _caller setDir (_dir - 180); // Orientation de l'utilisateur par rapport à l'objet.
        _caller switchMove ([(_arguments select 0), 1] call CBA_fnc_selectRandomArray); // Animation choisie aléatoirement.
        _target setVariable ["isOccupied", true, true]; // Marquer l'objet comme occupé.

        // Ajout d'une action pour permettre à l'utilisateur de se lever.
        _caller addAction [
            "Se lever", // Texte de l'action.
            {
                // Code d'exécution pour se lever.
                params ["_target", "_caller", "_actionId", "_arguments"];
                _caller switchMove ""; // Arrêt de l'animation.
                _caller setPosATL (_arguments select 0); // Remise à la position initiale.
                _caller removeAction _actionId; // Suppression de l'action.
                (_arguments select 1) setVariable ["isOccupied", false, true]; // Libération de l'objet.
            },
            [_cPos, _target], // Arguments passés à l'action.
            1.5, true, true, "", "true", 0, false, "", "" // Paramètres additionnels.
        ];
    },
    {
        // Condition pour afficher l'action "S'asseoir".
        !(_target getVariable ["isOccupied", false]);
    },
    {}, // Aucun code particulier pour désactiver l'action.
    [_animationList] // Passage de la liste des animations comme argument.
] call ace_interact_menu_fnc_createAction;

// Ajout de l'action au menu interactif ACE.
[this, 0, ["ACE_MainActions"], _sitAction] call ace_interact_menu_fnc_addActionToObject;
