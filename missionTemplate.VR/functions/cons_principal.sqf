/*
    Fichier: fnc_message
    Auteur: Techniciens Adeptus pour Adeptus TEAM (adeptusrepublica.fr)
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

/**
    Joue des sons d'alarme et affiche des messages d'alerte à l'écran.

    Cette fonction joue un son d'alarme 3D et affiche un message d'alerte à l'écran indiquant une évacuation.
    Après un délai, elle répète cette alerte deux fois, puis affiche un message final indiquant un rassemblement au hangar principal.
    Ensuite, elle joue le son d'alarme 3D dix fois de plus avec des pauses entre chaque répétition.

    Exemple d'utilisation:
    fnc_signals;  // Lance les alarmes sonores et affiche les messages d'alerte à l'écran
 */
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

/**
    Active ou désactive les boucliers énergétiques.

    Cette fonction parcourt une série de boucliers énergétiques nommés 'MAIN_SHIELD_1' à 'MAIN_SHIELD_10' 
    et les masque ou les rend visibles globalement selon la valeur de _bool.

    Parameters:
    _bool (bool): Indique si les boucliers doivent être activés (True) ou désactivés (False).

    Exemple d'utilisation:
    fnc_energyshields = true;  # Activer tous les boucliers énergétiques
    fnc_energyshields = false; # Désactiver tous les boucliers énergétiques
 */
fnc_energyshields = {
    params["_bool"];
    for "_i" from 1 to 10 do {
        private _SHIELD_STR = format ["MAIN_SHIELD_%1",_i];
        private _SHIELD_OBJ = missionNamespace getVariable [_SHIELD_STR,objNull];
        _SHIELD_OBJ hideObjectGlobal _bool;
    };
};

/**
    Gère l'activation et la désactivation de l'environnement spatial.

    Cette fonction joue un son, puis après un délai, elle vérifie si l'objet `env_space` est caché. 
    Si c'est le cas, elle affiche `env_space` ainsi que les boucliers des hangars, et désactive les boucliers énergétiques globaux. 
    Si `env_space` est visible, elle le masque, masque les boucliers des hangars, et active les boucliers énergétiques globaux. 
    Un message textuel est affiché à l'écran pour informer de l'état actuel (entrée ou sortie de l'atmosphère).

    Exemple d'utilisation:
    fnc_space;  // Active ou désactive l'environnement spatial et les boucliers en conséquence
 */
fnc_space = {
    playSound "FTL_OUT_1";

    sleep 3;
    
    if (isObjectHidden env_space) then {
        env_space hideObjectGlobal false;
        SIMPLE_RIGHT_SHIELD hideObjectGlobal false;
        SIMPLE_LEFT_SHIELD hideObjectGlobal false;
        false call fnc_energyshields;
        titleText ["<t align='center' shadow='2' color='#4c6ca8' size='1.2' font='RobotoCondensedBold'>Holo Coms</t><t color='#ffffff' size='1.2' font='RobotoCondensed'> : Purgatoire à équipage... Sortie de l'Atmosphère...</t>", "PLAIN DOWN", -1, true, true];
    } else {
        env_space hideObjectGlobal true;
        SIMPLE_RIGHT_SHIELD hideObjectGlobal true;
        SIMPLE_LEFT_SHIELD hideObjectGlobal true;
        true call fnc_energyshields;
        titleText ["<t align='center' shadow='2' color='#4c6ca8' size='1.2' font='RobotoCondensedBold'>Holo Coms</t><t color='#ffffff' size='1.2' font='RobotoCondensed'> : Purgatoire à équipage... Entrée dans l'Atmosphère...</t>", "PLAIN DOWN", -1, true, true];

    }
};


ADD_CUSTOM_ACTION(cons_principal, "Entrée / Sortie d'Atmosphère", "fnc_space", 5);
ADD_CUSTOM_ACTION(cons_principal, "<t color='#FF0000'>Ordre d'évacuation</t>", "fnc_signals", 5);





