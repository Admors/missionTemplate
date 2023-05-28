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

[] execVM "function\fnc_medicalTreatment.sqf";

[] execVM "function\fnc_authTreatment.sqf";

[] execVM "function\fnc_thermalDisable.sqf";

//[] execVM "function\fnc_ejectNoPilot.sqf";

//[] execVM "function\fnc_cleanUp.sqf";