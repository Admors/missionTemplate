/*
    Fichier: OnPlayerRespawn.sqf
    Auteur: Admors pour Adeptus TEAM (adeptusrepublica.fr)
    Publique: Non

	Description: Effectue une animation, un effet visuel et un message à la réapparition. 

    Conditions: Nécessite un `respawnOnStart = -1;` pour fonctionner après lancement. Une condition if _oldUnit prévue.

    Testing

*/

    ["ChromAberration", 200, [0.05, 0.05, true]] spawn {
        params ["_name", "_priority", "_effect", "_handle"];
        while {
            _handle = ppEffectCreate [_name, _priority];
            _handle < 0
        } do {
            _priority = _priority + 1;
        };
        _handle ppEffectEnable true;
        _handle ppEffectAdjust _effect;
        _handle ppEffectCommit 5;
        waitUntil { ppEffectCommitted _handle };
        uiSleep 2;
        _handle ppEffectEnable false;
        ppEffectDestroy _handle;
    };

    _name = name player;

    [parseText format ["<t font='PuristaBold' size='1.6'> %1, Vous avez été évacués <br/> </t> <t font='PuristaBold' color='#d1041c'> Baie Medicale </t>", _name], true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;