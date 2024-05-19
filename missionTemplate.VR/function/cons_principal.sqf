/*
    Fichier: fnc_message
    Auteur: Admors pour Adeptus TEAM (adeptusrepublica.fr)
    Publique: Non

    Description: this execVM "function\cons_principal.sqf";
*/

#define ADD_CUSTOM_ACTION(_object, _actionName, _function, _radius) \
    _object addAction [ \
        _actionName, \
        { [] remoteExec [_function, 0]; }, \
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

fnc_signals = {
    playSound3D ["swlb_core\sounds\Alarm_1.wss", player];
    titleText ["<t align='center' shadow='2' color='#cc0000' size='1.2' font='RobotoCondensedBold'>Holo Alert</t><t color='#ffffff' size='1.2' font='RobotoCondensed'> : Purgatoire à équipage... Evacuation !", "PLAIN DOWN", -1, true, true];
    sleep 5;
    playSound3D ["swlb_core\sounds\Alarm_1.wss", player];
    titleText ["<t align='center' shadow='2' color='#cc0000' size='1.2' font='RobotoCondensedBold'>Holo Alert</t><t color='#ffffff' size='1.2' font='RobotoCondensed'> : Purgatoire à équipage... Evacuation !</t>", "PLAIN DOWN", -1, true, true]; 
    sleep 5;
    playSound3D ["swlb_core\sounds\Alarm_1.wss", player];
    titleText ["<t align='center' shadow='2' color='#cc0000' size='1.2' font='RobotoCondensedBold'>Holo Alert</t><t color='#ffffff' size='1.2' font='RobotoCondensed'> : Purgatoire à équipe... Rassemblement : Hangar Principal... Ceci n'est pas un exercice ! </t>", "PLAIN DOWN", -1, true, true];  

    for "_i" from 1 to 10 do { 
            sleep 5;
            playSound3D ["swlb_core\sounds\Alarm_1.wss", player];
     };

};

fnc_space = {
    playSound "FTL_OUT_1";

    sleep 3;
    
    if (isObjectHidden env_space) then {
        env_space hideObjectGlobal false;
        titleText ["<t align='center' shadow='2' color='#4c6ca8' size='1.2' font='RobotoCondensedBold'>Holo Coms</t><t color='#ffffff' size='1.2' font='RobotoCondensed'> : Purgatoire à équipage... Sortie de l'Atmosphère...</t>", "PLAIN DOWN", -1, true, true];
    } else {
        env_space hideObjectGlobal true;
        titleText ["<t align='center' shadow='2' color='#4c6ca8' size='1.2' font='RobotoCondensedBold'>Holo Coms</t><t color='#ffffff' size='1.2' font='RobotoCondensed'> : Purgatoire à équipage... Entrée dans l'Atmosphère...</t>", "PLAIN DOWN", -1, true, true];

    }
};


ADD_CUSTOM_ACTION(cons_principal, "Entrée / Sortie d'Atmosphère", "fnc_space", 5);
ADD_CUSTOM_ACTION(cons_principal, "<t color='#FF0000'>Ordre d'évacuation</t>", "fnc_signals", 5);





