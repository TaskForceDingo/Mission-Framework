waitUntil {!isNil "KICK_TARGET" && !isNil "TFD_SERVER_PASSWORD"};
waitUntil {KICK_TARGET != ""};

serverCommand format["#kick %1", KICK_TARGET];

KICK_TARGET = ""; publicVariable "KICK_TARGET";

