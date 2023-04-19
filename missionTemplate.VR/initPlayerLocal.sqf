player setUnitLoadout (player getVariable ["Saved_Loadout",[]]);

fnc_reservedSlot = {
player enableSimulationGlobal false;
( "reserved" call BIS_fnc_rscLayer ) cutText ["Vous n'avez pas le droit d'occuper ce rôle.", "BLACK OUT", 1, true ];
sleep 0.01;
endMission "NOT_ALLOWED";
};

/**
* Variable de lecture d'une vidéo au lancement de la session d'un utilisateur.
*/
//private _video = ["A3\Missions_F_EPA\video\A_in_intro.ogv"] spawn BIS_fnc_playVideo;

_name = name player;
    20 = [
    [
        ["Session : Adeptus Team ","align = 'center' shadow = '1' size = '0.7' font='TahomaB'"],
        ["","<br/>"],
        [format ["Vous êtes %1 %2,", _name],"align = 'center' shadow = '1' size = '0.7'","#4649FF"],
		["","<br/>"],
        ["Clone dans le 61ST PELOTON DE LA REPUBLIQUE","align = 'center' shadow = '1' size = '0.7'","#1D1CE5"]
    ]
] spawn BIS_fnc_typeText2;