_EndSplashScreen = {
    for "_x" from 1 to 4 do {
        endLoadingScreen;
        sleep 3;
    };
};

[] spawn _EndSplashScreen;

[] execVM "function\fnc_nvgAdeptus.sqf";

[] execVM "function\fnc_rotate.sqf";

[] execVM "function\fnc_rank.sqf";

[] execVM "function\fnc_authTreatment.sqf";

[] execVM "function\fnc_thermalDisable.sqf";

[] execVM "function\fnc_fortify_ace.sqf";

[] execVM "function\fnc_load_equipement.sqf";

[] execVM "function\fnc_authAttribution.sqf";