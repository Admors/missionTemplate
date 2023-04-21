/*
    File: fnc_welcome.sqf
    Author: Admors pour Adeptus TEAM (adeptusrepublica.fr)
    Public: No

    Description: Affiche une vidéo et un message de bienvenue aux joueurs. 
*/
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

//private _video = ["A3\Missions_F_EPA\video\A_in_intro.ogv"] spawn BIS_fnc_playVideo;