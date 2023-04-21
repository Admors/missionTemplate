/*
    File: fnc_rotate.sqf
    Author: Admors pour Adeptus TEAM (adeptusrepublica.fr)
    Public: No

    Description:
        Effectue une rotation continue d'un objet si la condition Alive est VRAI. 

    Parameter(s):
        Objet

    Example(s):
       Name Variable  (Tag_Logo_01)
*/

0 spawn {
   while {alive Tag_Logo_01 || alive Tag_Logo_02} do {
   for "_i" from 0 to 359 do      {
         Tag_Logo_01 setDir _i;
         Tag_Logo_02 setDir _i + 180;
         sleep 0.01
       };
   };
};