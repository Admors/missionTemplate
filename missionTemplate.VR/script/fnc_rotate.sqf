/**
* Tag_Logo_-- représente un Objet dans le jeu qui possède le même nom de variable.
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