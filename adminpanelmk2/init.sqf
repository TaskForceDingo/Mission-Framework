//Admin Panel Init

//Set Admin List
#include "ADMINLIST.hpp";

//Init Server Lock State Variable
if (isNil "SERVER_IS_LOCKED") then {SERVER_IS_LOCKED = false; publicVariable "SERVER_IS_LOCKED"};

//Enter server password here as a CaSe SeNsItIvE string to activate kick / ban / server lock functionality
TFD_SERVER_PASSWORD = "tfd"; publicVariable "TFD_SERVER_PASSWORD";

//Logic group for the dynamically spawned zeus modules to be added to
TFD_ZEUS_GROUP = createGroup sideLogic; publicVariable "TFD_ZEUS_GROUP";

