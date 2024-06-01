params["_object"];

_object addAction ["Ouvrir terminal médicale", {
	execVM "dialogs\medicalMenu\openMedicMenu.sqf";
},
nil,
1.5,
true,
true,
"",
"true",
3
];