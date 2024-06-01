class medicSim{
    idd = 100;
    class controls{
        ////////////////////////////////////////////////////////
        // GUI EDITOR OUTPUT START (by CV 2137 Archer, v1.063, #Lisigo)
        ////////////////////////////////////////////////////////

        class backgroundFrame: RscText
        {
            idc = 1000;

            x = 0.412344 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.253 * safezoneH;
            colorBackground[] = {-1,-1,-1,0.6};
        };
        class bodyPartListBox: RscListBox
        {
            idc = 1500;

            x = 0.422656 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.0670311 * safezoneW;
            h = 0.132 * safezoneH;
            colorBackground[] = {-1,-1,-1,0.6};
            colorActive[] = {-1,-1,-1,0.6};
        };
        class injuryListBox: RscListBox
        {
            idc = 1501;

            x = 0.520625 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.0670311 * safezoneW;
            h = 0.132 * safezoneH;
            colorBackground[] = {-1,-1,-1,0.6};
            colorActive[] = {-1,-1,-1,0.6};
        };
        class injurySeverity: RscSlider
        {
            idc = 1900;

            x = 0.4175 * safezoneW + safezoneX;
            y = 0.599 * safezoneH + safezoneY;
            w = 0.175313 * safezoneW;
            h = 0.022 * safezoneH;
            sliderRange[] = {0,1};
            sliderStep = 0.05;
            colorActive[] = {0.6,0.6,-1,1};
        };
        class infoBar: RscText
        {
            idc = 1001;

            text = "Medical Menu"; //--- ToDo: Localize;
            x = 0.412344 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0.8,0.7,-1,1};
        };
        class healButton: RscButton
        {
            idc = 1600;
            action = "execVM 'dialogs\medicalMenu\healUnit.sqf'";
            text = "Soigner"; //--- ToDo: Localize;
            x = 0.422656 * safezoneW + safezoneX;
            y = 0.555 * safezoneH + safezoneY;
            w = 0.0670312 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class applyEffect: RscButton
        {
            idc = 1601;
             action = "execVM 'dialogs\medicalMenu\applyEffect.sqf'";
            text = "Appliquer"; //--- ToDo: Localize;
            x = 0.520625 * safezoneW + safezoneX;
            y = 0.555 * safezoneH + safezoneY;
            w = 0.0670312 * safezoneW;
            h = 0.022 * safezoneH;
        };
        ////////////////////////////////////////////////////////
        // GUI EDITOR OUTPUT END
        ////////////////////////////////////////////////////////


    };
};
