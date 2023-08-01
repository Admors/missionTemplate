/*
    Fichier: fnc_teamspeak_check.sqf
    Auteur: Maxence for The Programmer Forum Edited Admors pour Adeptus TEAM (adeptusrepublica.fr)
    Publique: Non

    Description: Task Force Radio Check
*/
[] spawn {
    _teamspeakName = "Adeptus Républica";
    _temspeakAdress = "ts3.adeptusrepublica.fr";
    _channelName = "TaskForceRadio";
    _kickAfter = 30; // Nombre de secondes après lequel kicker le joueur s'il n'est toujours pas sur Teamspeak

    // Editing code below is not recommended
   _isAdmin = false;
    if (_isAdmin) exitWith {};

    if (isNil "TFAR_fnc_isTeamSpeakPluginEnabled") exitwith {
        999999 cutText ["Task Force Radio n'est pas activé pas sur votre ordinateur. Veuillez re-synchroniser et réessayer","BLACK FADED"];
        999999 cutFadeOut 99999999;
    };

    _tfarEnabled = true;
    _playerOnTeamspeak = true;
    _playerInChannel = false;
    _sleep = 2;
    _timeout = _kickAfter;
    _alreadyKnow = false;

    while {true} do {
        if !([] call TFAR_fnc_isTeamSpeakPluginEnabled) then {
            titleText ["Veuillez activer Task Force Radio dans vos plugins teamspeak ! Pour ce faire, rendez-vous dans l'onglet réglages de teamspeak puis plugins et activez-le.", "BLACK"];
            _tfarEnabled = false;
        } else {
            _tfarEnabled = true;
        };

        if !(_teamspeakName == (call TFAR_fnc_getTeamSpeakServerName)) then {
            titleText [format ["Veuillez rejoindre notre TeamSpeak : %1",_temspeakAdress], "BLACK"];
            _playerOnTeamspeak = false;
        } else {
            _playerOnTeamspeak = true;
        };

        if !(_channelName == (call TFAR_fnc_getTeamSpeakChannelName)) then {
            titleText ["Veuillez 'RELOAD' votre plugin Task Force Radio pour être déplacer dans le canal vocal !", "BLACK"];
            _playerInChannel = false;
        } else {
            _playerInChannel = true;
        };

        if (_tfarEnabled && _playerOnTeamspeak && _playerInChannel) then {
            if !(_alreadyKnow) then {
                titleText ["Task Force Radio est bien initialisé, Bienvenue Soldat !","BLACK IN"];
                _alreadyKnow = true;
            };
            _sleep = 5;
        } else {
            _alreadyKnow = false;
            _sleep = 2;
        };
       
        sleep _sleep;

        if (!_tfarEnabled || !_playerOnTeamspeak || !_playerInChannel) then {
            _timeout = _timeout - _sleep;
        } else {
            _timeout = _kickAfter;
        };

        if (_timeout <= 0) exitwith {};
    };

    if (_timeout <= 0) then {
        ["Teamspeak",false,false] call BIS_fnc_endMission;
    };
};