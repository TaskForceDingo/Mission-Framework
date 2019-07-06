// Nothing in here needs to be changed
// Give Admins the Panel via keybind:

[] spawn {

	waitUntil {time>5 && (!isNil "TFD_ADMINS") && (getClientStateNumber > 9)};

	if (getPlayerUID player in TFD_admins) then {
		
		(findDisplay 46) displayAddEventHandler ["keyDown",{
			_ctrl = _this select 0; 
			_dikCode = _this select 1; 
			_shift = _this select 2; 
			_ctrlKey = _this select 3;
			_alt = _this select 4;
			_yourKey = 0xC5; // Pause Break -- https://community.bistudio.com/wiki/DIK_KeyCodes
			
			if (_dikCode == _yourKey && !dialog) then {
				createDialog "TFD_AdminPanel";
				true
			};
		}]; 
	};
};