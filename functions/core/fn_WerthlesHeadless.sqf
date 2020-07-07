//WerthlesHeadless.sqf
//Split AI Groups Evenly Among Headless Clients

//private variables
private ["_recurrent", "_timeBetween", "_debug", "_advanced", "_startDelay", "_pause", "_report", "_badNames", "_moreBadNames", "_syncGroup", "_trigSyncs", "_waySyncs", "_objSyncs", "_objs", "_wayPoint", "_counts", "_null", "_localCount", "_stringInfo1", "_stringInfo2", "_stringInfo3", "_Info", "_transfers", "_recurrentCheck", "_ll", "_who", "_amount", "_whom", "_inheadlessArray", "_headlessCount", "_unitsInGroup", "_groupMoving", "_size", "_lead", "_leadOwner", "_leadHeadless", "_moveToHC", "_bad", "_syncTrigArray", "_syncWayArray", "_wayNum", "_syncedTrigs", "_syncedWays", "_syncObjectsArray", "_syncObjects", "_nameOfSync", "_found", "_zz", "_HC", "_fewest", "_local", "_newSum", "_stringInfo4", "_strTransfers", "_strRecurrent", "_confirmation"];

//Ignored Special Variables: _this, _x, _forEachIndex.
//script parameters
_recurrent = _this select 0; // run repeatedly
_timeBetween = _this select 1; // time between each check
_debug = _this select 2; // show counts of local units as hints
_advanced = _this select 3; // selects which AI distribution method to use
_startDelay = _this select 4; // how long to wait before running
_pause = _this select 5; // how long to wait between each setGroupOwner, longer aids syncing
_report = _this select 6; // turn setup report on or off
_moreBadNames = _this select 7; // check for units, groups, classes, vehicles or modules with these words in their name, then ignore the associated unit's group

_badNames = ["ignore"] + _moreBadNames;

//Check the script is run in multiplayer only
if (isMultiplayer) then
{

	SyncArrays = compileFinal "
		_syncGroup = _this select 0;
		_trigSyncs = _this select 1;
		_waySyncs = _this select 2;
		_objSyncs = _this select 3;
		{
			_objs = _objSyncs select _forEachIndex;
			_x synchronizeObjectsAdd _objs;
		}forEach units _syncGroup;

		{
			_wayPoint = _x;
			{
				_x synchronizeTrigger [_wayPoint];
			}forEach (_trigSyncs select _forEachIndex);
			{
				_x synchronizeWaypoint [_wayPoint];
			}forEach (_waySyncs select _forEachIndex);
		}forEach waypoints _syncGroup;
	";


	if not (isServer or hasInterface) then
	{
		SendInfo = compileFinal "
			sleep (random 5);
			_counts = {local _x} count allUnits;
			[[player,_counts],""addHeadless"",false,false] call bis_fnc_mp;
		";
	}
	else
	{
		SendInfo = compileFinal "";
	};

	//displays number of units local to each client as a hint, if debug is on
	if (_debug) then
	{
		_null = [] spawn {
			while {true} do
			{
				//make sure hints are not always displayed together
				sleep (7 + random 7);
				
				//count local units
				_localCount = {local _x} count allUnits;
				_stringInfo1 = "<t color='#8E8E38' align='center'>" + profileName + ": " + "</t>";
				_stringInfo2 = "<t color='#FFFACD' align='center'>" + str _localCount + "</t>";
				_stringInfo3 = "<t color='#8E8E38' align='center'>" + " Local Units" + "</t>";
				
				//causes all to receive hints
				_Info = composeText [
					parseText "<t color='#C5C1AA' align='center'>-------------------------------------------------------</t>",
					parseText "<br />",
					parseText "<t color='#C67171' align='center'>Debug Mode</t>",
					parseText "<br />",
					parseText _stringInfo1,
					parseText _stringInfo2,
					parseText _stringInfo3,
					parseText "<br />",
					parseText "<t color='#C5C1AA' align='center'>-------------------------------------------------------</t>"
				];
				[_Info,"hintSilent",true,false] call BIS_fnc_MP;
			};
		};
	};

	if (_report) then
	{
		//Inform players WH is running
		hintSilent composeText [
			parseText "<t color='#C5C1AA' align='center'>-------------------------------------------------------</t>",
			parseText "<br />",
			parseText "<t color='#7D9EC0' align='center'>Werthles Headless Script Is Now Running</t>",
			parseText "<br />",
			parseText "<t color='#C5C1AA' align='center'>-------------------------------------------------------</t>"
		];
	};
	//Run only on server
	if (isServer) then
	{
		//set up arrays
		headlessArray = [];
		HeadlessLocalCounts = [];
		_transfers = -1;
		_recurrentCheck = true;
		
		//Headless client incrementer
		if not (_advanced) then
		{
			_ll = -1;
		};
		
		//function to add id and counts to headlessArray and HeadlessLocalCounts
		addHeadless = compileFinal "
			_who = _this select 0;
			_amount = _this select 1;
			_whom = owner _who;
			_inheadlessArray = headlessArray find _whom;
			if (_inheadlessArray > -1) then
			{
				HeadlessLocalCounts set [_inheadlessArray,_amount];
			}
			else
			{
				headlessArray append [_whom];
				_inheadlessArray = headlessArray find _whom;
				HeadlessLocalCounts set [_inheadlessArray,_amount];
			};
		";
		
		//sleep for the length of the start delay
		sleep _startDelay;
				
		//if recurrent, repeat
		while {_recurrentCheck} do
		{
			//reset array
			headlessArray = [];
			HeadlessLocalCounts = [];
			
			//end if not recurrent
			if not (_recurrent) then
			{
				_recurrentCheck = false;
			};
			
			//causes all to receive hints
			if (_debug) then
			{
				_Info = composeText [
					parseText "<t color='#C5C1AA' align='center'>-------------------------------------------------------</t>",
					parseText "<br />",
					parseText "<t color='#C67171' align='center'>Debug Mode</t>",
					parseText "<br />",
					parseText "<t color='#7D9EC0' align='center'>Next Cycle Is Starting...</t>",
					parseText "<br />",
					parseText "<t color='#C5C1AA' align='center'>-------------------------------------------------------</t>"
				];
				[_Info,"hintSilent",true,false] call BIS_fnc_MP;
			};
			
			//tell HCs to send info
			[0,"SendInfo",true,false] call BIS_fnc_MP;
			
			//wait for replies
			sleep 10;
			
			//Count the number of headless clients connected
			_headlessCount = count headlessArray;
			
			//if there are headless clients connected, split AIs
			if (_headlessCount > 0) then
			{
				//clean up groups
				{
					//check if groups are empty
					_unitsInGroup = count units _x;
					if (_unitsInGroup == 0) then
					{
						deleteGroup _x;
					};
				}forEach allGroups;
				
				//loop all groups				
				{
					//get the group
					_groupMoving = _x;
					_size = count units _groupMoving;
					_lead = leader _groupMoving;
					_leadOwner = owner _lead;
					_leadHeadless = headlessArray find _leadOwner;
					
					//if group leader isn't a human and isn't controlled by a HC
					if (!(isPlayer _lead) and (_leadHeadless == -1)) then
					{
						_moveToHC = false;
						_bad = false;
						
						//Remember syncs from waypoints to other waypoints and triggers
						_syncTrigArray = [];
						_syncWayArray = [];
						{
							_wayNum = _forEachIndex;
							_syncedTrigs = synchronizedTriggers _x;
							_syncTrigArray set [_wayNum,_syncedTrigs];
							_syncedWays = synchronizedWaypoints _x;
							_syncWayArray set [_wayNum,_syncedWays];
						}forEach waypoints _groupMoving;

						//remember syncs to objects
						_syncObjectsArray = [];
						{
							_syncObjects = synchronizedObjects _x;
							_syncObjectsArray = _syncObjectsArray + [_syncObjects];
						}forEach units _groupMoving;
						
						//check for bad modules with ignore
						{
							{
								_nameOfSync = str _x;
								{
									_found = _nameOfSync find _x;
									if (_found>-1) then
									{
										_bad = true;
									};
								}forEach _badNames;
							}forEach _x;
						}forEach _syncObjectsArray;
						
						//check for units with ignore
						{
							_nameOfSync = str _x;
							{
								_found = _nameOfSync find _x;
								if (_found>-1) then
								{
									_bad = true;
								};
							}forEach _badNames;
						}forEach units _groupMoving;
						
						//check for unit type with ignore phrase
						{
							_nameOfSync = typeOf _x;
							{
								_found = _nameOfSync find _x;
								if (_found>-1) then
								{
									_bad = true;
								};
							}forEach _badNames;
						}forEach units _groupMoving;
						
						//check for unit vehicle type with ignore phrase
						{
							_nameOfSync = typeOf (vehicle _x);
							{
								_found = _nameOfSync find _x;
								if (_found>-1) then
								{
									_bad = true;
								};
							}forEach _badNames;
						}forEach units _groupMoving;
						
						//check for unit vehicle with ignore phrase
						{
							_nameOfSync = str (vehicle _x);
							{
								_found = _nameOfSync find _x;
								if (_found>-1) then
								{
									_bad = true;
								};
							}forEach _badNames;
						}forEach units _groupMoving;
						
						//check for groups with ignore
						_nameOfSync = str _x;
						{
							_found = _nameOfSync find _x;
							if (_found>-1) then
							{
								_bad = true;
							};
						}forEach _badNames;
						
						//move it to HC
						if not (_bad) then
						{
							_zz = 0;
							_HC = 0;
							if (_advanced) then
							{
								//find the headless client with the fewest AIs
								_fewest = HeadlessLocalCounts select 0;
								{
									//the total local units for the current HC
									if (_x < _fewest) then
									{
										_zz = _forEachIndex;
										_fewest = _x;
									};
								}forEach HeadlessLocalCounts;
								
								//add group size to _local arrays
								_fewest = HeadlessLocalCounts select _zz;
								_newSum = _fewest + _size;
								HeadlessLocalCounts set [_zz,_newSum];
						
								//select the emptiest Headless Client
								_HC = headlessArray select _zz;
							}
							else
							{
				
								//increment HC
								_ll = _ll + 1;
								if !(_ll < _headlessCount) then
								{
									_ll = 0;
								};
								
								//select a headless client
								_HC = headlessArray select _ll;
								
								//update HeadlessLocalCounts
								_newSum = HeadlessLocalCounts select _ll;
								_newSum = _newSum + _size;
								HeadlessLocalCounts set [_ll,_newSum];
							};
							_moveToHC = _groupMoving setGroupOwner _HC;
						
							//reattach triggers and waypoints
							[[_groupMoving,_syncTrigArray,_syncWayArray,_syncObjectsArray],"SyncArrays",true,false] call BIS_fnc_MP;
							
							//causes all to receive hints
							if (_debug and _moveToHC) then
							{
								_stringInfo1 = "<t color='#7D9EC0' align='center'>" + "Group: " + "</t>";
								_stringInfo2 = "<t color='#FFFACD' align='center'>" + str _groupMoving + "</t>";
								_stringInfo3 = "<t color='#7D9EC0' align='center'>" + "ID Of HC Transferred To: " + "</t>";
								_stringInfo4 = "<t color='#FFFACD' align='center'>" + str _HC + "</t>";
								
								_Info = composeText [
									parseText "<t color='#C5C1AA' align='center'>-------------------------------------------------------</t>",
									parseText "<br />",
									parseText "<t color='#C67171' align='center'>Debug Mode</t>",
									parseText "<br />",
									parseText _stringInfo1,
									parseText _stringInfo2,
									parseText "<br />",
									parseText _stringInfo3,
									parseText _stringInfo4,
									parseText "<br />",
									parseText "<t color='#C5C1AA' align='center'>-------------------------------------------------------</t>"
								];
								[_Info,"hintSilent",true,false] call BIS_fnc_MP;
							};
							
							sleep _pause;
							
							//reattach triggers and waypoints
							[[_groupMoving,_syncTrigArray,_syncWayArray,_syncObjectsArray],"SyncArrays",true,false] call BIS_fnc_MP;
						};
					};
				}forEach allGroups;
			
				//show report only after the first cycle
				if (_transfers == -1 and _report) then
				{
					//count units moved to HCs
					_transfers = 0;
					{
						_transfers = _transfers + _x;
					}forEach HeadlessLocalCounts;
					
					//display 1 time HC transfer report
					_strTransfers = "<t color='#FFFACD' align='center'>" + str _transfers + "</t>";
					
					//create strings
					_strRecurrent = "";
					if (_recurrent) then
					{
						_strRecurrent = "<t color='#388E8E' align='center'>WHS Will Continue To Check For AI Units Throughout The Mission</t>";
					}
					else
					{
						_strRecurrent = "<t color='#8E388E' align='center'>WHS Will Now Terminate</t>";
					};
					
					_confirmation = composeText [
						parseText "<t color='#C5C1AA' align='center'>-------------------------------------------------------</t>",
						parseText "<br />",
						parseText "<t color='#7D9EC0' align='center'>Werthles Headless Script</t>",
						parseText "<br />",
						parseText "<t color='#7D9EC0' align='center'>Has Transferred</t>",
						parseText "<br />",
						parseText _strTransfers,
						parseText "<br />",
						parseText "<t color='#7D9EC0' align='center'>Units To Headless Clients</t>",
						parseText "<br />",
						parseText "<br />",
						parseText _strRecurrent,
						parseText "<br />",
						parseText "<t color='#C5C1AA' align='center'>-------------------------------------------------------</t>"
					];
					
					//show strings as hintSilent
					sleep 2;
					[_confirmation,"hintSilent",true,false] call BIS_fnc_MP;
					sleep 0.5;
					[_confirmation,"hintSilent",true,false] call BIS_fnc_MP;
					sleep 0.5;
					[_confirmation,"hintSilent",true,false] call BIS_fnc_MP;
					sleep 0.5;
					[_confirmation,"hintSilent",true,false] call BIS_fnc_MP;
					sleep 0.5;
					[_confirmation,"hintSilent",true,false] call BIS_fnc_MP;
					sleep 10;
				};
				
			};
			
			//causes all to receive hints
			if (_debug) then
			{
				_Info = composeText [
					parseText "<t color='#C5C1AA' align='center'>-------------------------------------------------------</t>",
					parseText "<br />",
					parseText "<t color='#C67171' align='center'>Debug Mode</t>",
					parseText "<br />",
					parseText "<t color='#7D9EC0' align='center'>Cycle Finished</t>",
					parseText "<br />",
					parseText "<t color='#C5C1AA' align='center'>-------------------------------------------------------</t>"
				];
				[_Info,"hintSilent",true,false] call BIS_fnc_MP;
			};
			
			//time between checks
			sleep _timeBetween;
		};
	};	
}
else
{
	//Inform players WH is not running
	hintSilent composeText [
		parseText "<t color='#C5C1AA' align='center'>-------------------------------------------------------</t>",
		parseText "<br />",
		parseText "<t color='#7D9EC0' align='center'>Headless Clients Can Only Connect To Multiplayer Games, So Werthles Headless Script Has Terminated</t>",
		parseText "<br />",
		parseText "<t color='#C5C1AA' align='center'>-------------------------------------------------------</t>"
	];
};