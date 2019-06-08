waitUntil {!isNil "BAN_TARGET" && !isNil "TFD_SERVER_PASSWORD"};
waitUntil {BAN_TARGET != ""};

serverCommand format["#ban %1", BAN_TARGET];

BAN_TARGET = ""; publicVariable "BAN_TARGET";