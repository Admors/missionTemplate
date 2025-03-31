class CfgFunctions
{
    class Adeptus_DataBase
    {
        tag = "ARDB";
        class Database
        {
            /* Script DB */
            class create
            {
            };
            class handle
            {
            };
            class init
            {
            };
            class load
            {
            };
            class saveOnDisconnect
            {
            };
        };
    };
    class Adeptus
    {
        tag = "AR";
        class Scripts_Mission
        {
            /*-----------------*/
            /* Scripts Mission */
            /*-----------------*/
        };
    };
};

#define ANYONE 0
#define CLIENT 1
#define SERVER 2

class CfgRemoteExec
{
    class Functions
    {
        mode = 2;
        jip = 1;

        /* Client only functions */

        /* Server only functions */
        class ARDB_fnc_create
        {
            allowedTargets = SERVER;
        };
        class ARDB_fnc_handle
        {
            allowedTargets = SERVER;
        };
        class ARDB_fnc_load
        {
            allowedTargets = SERVER;
        };
        class ARDB_fnc_saveOnDisconnect
        {
            allowedTargets = SERVER;
        };

        /* Functions for everyone */
        class ARDB_fnc_init
        {
            allowedTargets = ANYONE;
        };
    };
};