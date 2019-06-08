JSH_ADMIN_PLAYERLIST_DATA = []; publicVariable "JSH_ADMIN_PLAYERLIST_DATA";

[] spawn {
	while {true} do {
		waitUntil{time>2};
		
		_data = [];
		if (!isNil "TFD_ADMINS") then {{TFD_ADMINS pushbackUnique _x} forEach ['76561197987496729', '76561198073759734','76561198070884998']; publicVariable "TFD_ADMINS";};

		{
			if (isPlayer _x) then {
				_arr = [name _x, owner _x, _x];
				_data pushBackUnique _arr;
			};
		} forEach playableUnits;

		JSH_ADMIN_PLAYERLIST_DATA = _data; publicVariable "JSH_ADMIN_PLAYERLIST_DATA";
		
		sleep 5;
	};
};