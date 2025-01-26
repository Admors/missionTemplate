_player = _this select 0;
_UID = getPlayerUID _player;
_playerName = name _player;

if ( _player getVariable [ "reserved", false ] && {
	!(_UID in allowed)
} ) then {
	[] remoteExec [ "BIS_fnc_endMission", _player ];
};

checkForDatabase = [_UID, _playerName, _player];

publicVariableServer "checkForDatabase";

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	_inidbi = ["new", _UID] call OO_INIDBI;
	_playerLoadout = getUnitLoadout _unit;

	["Write", ["GameData", "Name", _name]] call _inidbi;
	["Write", ["GameData", "SteamID64", _UID]] call _inidbi;
	["Write", ["GameData", "Loadout", _playerLoadout]] call _inidbi;
	diag_log format ["[INIDBI2-STATUS] %1 loadout has been saved", _UID];
	false;
}];

/*
	Description:
	Ce script est exécuté sur le serveur lorsqu'un joueur s'initialise. Il récupère une liste de joueurs assis et s'assure que leur état d'animation assis est synchronisé sur le réseau.

	Variables:
	_sittedPlayers - Un tableau de joueurs actuellement assis, récupéré à partir de la variable de l'espace de mission "AR_sitList".

	Fonctions:
	- missionNamespace getVariable: Récupère la valeur de la variable "AR_sitList" de l'espace de mission.
	- remoteExec: Exécute la commande "switchMove" sur chaque joueur dans le tableau _sittedPlayers pour s'assurer que leur état d'animation assis est synchronisé sur le réseau.
*/

[] spawn {
	private _sittedPlayers = missionNamespace getVariable["AR_sitList", []];
	{
		[_x, (animationState _x)] remoteExec["switchMove", 0, true];
	}forEach _sittedPlayers;
};
