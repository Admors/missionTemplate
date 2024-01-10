/*
	    File: init_ModsVerification.sqf
	    Author: Bragg for 528th Legion Targon edit and improve by Admors for Adeptus TEAM (adeptusrepublica.fr).
	    Public: No
	
	    Description: Please do not [Copy, Modify, Plagiarize] the following content without prior authorization from its creator.
	
	    To get the '_RequiredlistModsdir' array, execute the following command in your debug console with all Required mods activated:
	
	_RequiredlistModsdir = [];
	_loadedMods = getLoadedModsInfo;
	
	{
		_modDir = _x select 7;
		    _RequiredlistModsdir pushBack _modDir;
	} forEach _loadedMods;
	
	_RequiredlistModsdir sort true;
	copyToClipboard str _RequiredlistModsdir;
	
*/
_bypassuser = [""];

_RequiredlistModsdir = ["0","0","0","0","0","1021790","1224892496","1325500","1355481562","1360626473","1393068220","1480333388","1638341685","1770265310","1779063631","1808238502","1858070328","1858075458","1862208264","1876589191","1883956552","1908099028","1940589429","1981964169","2018593688","2058554822","2068356312","2121891318","2156476698","2162749089","2179174990","2198339170","2215872933","2231150238","2291129343","2306758518","2320596778","2323185592","2397824964","2567352444","2572487482","2699465073","275700","2789152015","2789845443","2791403093","2794721649","2822758266","288520","2918542818","2925585787","2938100776","2971848020","2979746496","2993442344","304380","332350","395180","450814997","463939057","571710","583496184","583544987","601670","620019431","623475643","639600","730310357","744950","766491311","767380317","769440155","798390","853743366","897295039","925018569"];

_WhitelistModsdir = _RequiredlistModsdir;

/*_WhitelistModsdir = ["0","0","0","0","0","0","0","0","0","0","1021790","1164556198","1165679271","1181731794","1184799741","1224892496","1251859358","1310581330","1321911889","1325500","1355481562","1360626473","1376867375","1393068220","1458210741","1572627279","1612623122","1638341685","1660210110","1680294609","1770265310","1779063631","1862880106","1876589191","1926513010","1940589429","1960024802","1969012355","1988239639","1997001841","2010222986","2010224487","2018593688","2058554822","2060770170","2061309401","2095827925","2095882226","2141020863","2155291956","2162749089","2215872933","2290838143","2291129343","2306758518","2306767844","2320596778","2323185592","2332457910","2387297579","2421703737","2424322922","2447965207","2467589125","2476559740","2478080991","2480263219","2496952221","2515887728","2567352444","2572487482","2616555444","2631999150","2639755526","275700","2764686098","2789152015","2789845443","2791403093","2794721649","2797232351","2806487814","2819732932","2820127143","2822052002","2846415557","288520","2918542818","2925585787","2929616887","2929627553","2929627954","2933180786","2938100776","2969350304","2993442344","3018159841","3023699939","3024549278","3028025089","3032131959","304380","3043987264","3085697583","3086321202","332350","395180","450814997","463939057","571710","583496184","583544987","601670","623475643","639600","648172507","648775794","693153082","693170122","694603075","708278910","714149065","718649903","730310357","744950","751512203","766491311","767380317","769440155","771298211","772802287","794782314","798390","837729515","853743366","855464203","861133494","878502647","883340794","894678801","925018569","937515516","946763963"];*/

_ExcludeModsBragg = [""];

_RequiredlistModsdirZero = {
	_x == "0"
} count _RequiredlistModsdir;

_WhitelistModsdirZero = {
	_x == "0"
} count _WhitelistModsdir;

_loadedModsdir = [];
_loadedModsError = [];
_RequiredloadedModsError = [];
_loadedMods = getLoadedModsInfo;
_ModnameErrorText = "";

{
	_loadedModsdir pushBack (_x select 7);
	if ((_x select 7) in _WhitelistModsdir) then {
		if ((_x select 7) == "0") then {
			if (_WhitelistModsdirZero > 0) then {
				_WhitelistModsdirZero = _WhitelistModsdirZero - 1;
			} else {
				_loadedModsError pushBack ("Inconnu");
			};
		};
	} else {
		switch true do {
			case ((_x select 7) in _ExcludeModsBragg) : {};
			default {
				_loadedModsError pushBack (_x select 1)
			};
		};
	};
} forEach _loadedMods;

{
	if ((_x) in _loadedModsdir) then {
		if ((_x) == "0") then {
			if (_RequiredlistModsdirZero > 0) then {
				_RequiredlistModsdirZero = _RequiredlistModsdirZero - 1;
			} else {
				_RequiredloadedModsError pushBack ("Inconnu");
			};
		};
	} else {
		switch true do {
			case ((_x) in _ExcludeModsBragg) : {};
			default {
				_RequiredloadedModsError pushBack (_x)
			};
		};
	};
} forEach _RequiredlistModsdir;

{
	_ModnameErrorText = _ModnameErrorText + format["<t color='#E67E22'>%1</t><br/>", _x];
} forEach _loadedModsError;

sleep 5;
switch true do {
	case (((count _loadedModsError) > 0) && ((count _RequiredloadedModsError) > 0)) : {
		if ((getPlayerUID player) in _bypassuser) then {} else {
			cutText [format["<img image='img\logo_A.paa' size='6'/><br/><br/><t size='1.5' color='#FF0000'>Vous avez %2 mods qui ne sont pas autorisés :</t><br/>%1<br/>Télécharger le Preset sur le discord et assurez-vous d'activer tout les mods correctement.", _ModnameErrorText, (count _loadedModsError)], "BLACK", -1, true, true];
			while { true } do {
				for "_i" from 1 to 5 do {
				playSound "shocked1";
				sleep 2;
				};
				failMission "end1";
			};
		};
	};
	case ((count _loadedModsError) > 0) : {
		hintSilent "";
		if ((getPlayerUID player) in _bypassuser) then {} else {
			cutText [format["<img image='img\logo_A.paa' size='6'/><br/><br/><t size='1.5' color='#FF0000'>Vous avez %2 mods qui ne sont pas autorisés :</t><br/>%1<br/>Télécharger le Preset sur le discord et assurez-vous d'activer tout les mods correctement.", _ModnameErrorText, (count _loadedModsError)], "BLACK", -1, true, true];
			while { true } do {
				for "_i" from 1 to 5 do {
				playSound "shocked1";
				sleep 2;
				};
				failMission "end1";
			};
		};
	};
	case ((count _RequiredloadedModsError) > 0) : {
		if ((getPlayerUID player) in _bypassuser) then {} else {
			cutText [format["<img image='img\logo_A.paa' size='6'/><br/><br/><t size='1.5' color='#FF0000'>Vous avez %1 mods manquant</t><br/><br/>Télécharger le Preset sur le discord et assurez-vous d'activer tout les mods correctement.", (count _RequiredloadedModsError)], "BLACK", -1, true, true];
			while { true } do {
				for "_i" from 1 to 5 do {
				playSound "shocked1";
				sleep 2;
				};
				failMission "end1";
			};
		};
	};
	default {};
};