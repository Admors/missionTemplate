/*
    Fichier: fnc_teleport.sqf
    Auteur: Admors pour Adeptus TEAM (adeptusrepublica.fr)
    Publique: Non

    Description: Téléportation dans le venator
*/

#define ADD_CUSTOM_ACTION(_object, _actionName, _function, _radius) \
    _object addAction [ \
        _actionName, \
        { [_this select 1] call _function; }, \
        nil, \
        1.5, \
        true, \
        true, \
        "", \
        "true", \
        _radius, \
        false, \
        "", \
        "" \
    ];

	fnc_goToRightCorridor = {
        params["_player"];
		playSound "LS_door1_open";
		[0,"BLACK",1,0] call BIS_fnc_fadeEffect;
        sleep 1;
        _player setPosATL (getposATL spawn_2);
        sleep 1;
        [1,"BLACK",1,0] call BIS_fnc_fadeEffect;
		playSound "LS_door1_close";
	};

	fnc_goToMainBridge = {
		playSound "LS_door1_open";
		[0,"BLACK",1,0] call BIS_fnc_fadeEffect;
        sleep 1;
        _player setPosATL (getposATL spawn_1);
        sleep 1;
        [1,"BLACK",1,0] call BIS_fnc_fadeEffect;
		playSound "LS_door1_close";
	};

	fnc_goToLeftCorridor = {
		playSound "LS_door1_open";
		[0,"BLACK",1,0] call BIS_fnc_fadeEffect;
        sleep 1;
        _player setPosATL (getposATL spawn_4);
        sleep 1;
        [1,"BLACK",1,0] call BIS_fnc_fadeEffect;  
		playSound "LS_door1_close";
	};

	fnc_goToBridge = {
		playSound "LS_door1_open";
		[0,"BLACK",1,0] call BIS_fnc_fadeEffect;
        sleep 1;
        _player setPosATL (getposATL spawn_3);
        sleep 1;
        [1,"BLACK",1,0] call BIS_fnc_fadeEffect;  
		playSound "LS_door1_close";
	};

ADD_CUSTOM_ACTION(goToLeftCorridor, "Revenir dans le couloir", fnc_goToLeftCorridor, 5);
ADD_CUSTOM_ACTION(goToMainBridge, "Aller sur le pont", fnc_goToMainBridge, 5);
ADD_CUSTOM_ACTION(goToRightCorridor, "Revenir dans le couloir", fnc_goToRightCorridor, 5)
ADD_CUSTOM_ACTION(goToBridge, "Aller sur le pont d'observation du hangar", fnc_goToBridge, 5);