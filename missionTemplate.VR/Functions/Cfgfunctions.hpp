#include "\adeptus_core\defines.hpp"

class CfgFunctions
{
    class Adeptus_DataBase
    {
        tag = "ARDB";
        class Database
        {
            /* Script DB */
            F(create)
            F(handle)
            F(init)
            F(load)
            F(saveOnDisconnect)
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

class CfgRemoteExec
{
    class Functions
    {
        mode = 2;
        jip = 1;

        /* Client only functions */

        /* Server only functions */
        RemoteExec(ARDB_fnc_create, SERVER)
        RemoteExec(ARDB_fnc_load, SERVER)
        RemoteExec(ARDB_fnc_saveOnDisconnect, SERVER)
        RemoteExec(ARDB_fnc_handle, SERVER)
        
        /* Functions for everyone */
        RemoteExec(ARDB_fnc_init, ANYONE)
    };
};