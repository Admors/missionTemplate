medicUnit switchMove "UnconsciousReviveArms";

_EndSplashScreen = {
	for "_x" from 1 to 4 do {
		endLoadingScreen;
		sleep 3;
	};
};

[] spawn _EndSplashScreen;

[] execVM "functions\fnc_nvgAdeptus.sqf";

[] execVM "functions\fnc_rank.sqf";

[] execVM "functions\fnc_authTreatment.sqf";

[] execVM "functions\fnc_fortify_ace.sqf";

[] execVM "functions\fnc_load_equipement.sqf";

[] execVM "functions\fnc_authAttribution.sqf";
