//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Config_Behaviour  //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_array","_setSkill","_setCombat","_setBehav","_setSpeed","_setForm","_setPatrol","_setSearch",
			"_setFleeing","_setHeliVal","_setPause","_setBldgBeh","_setSupport","_setJoin","_setEmpVeh","_setSupTime","_setHidTime"
		];

switch (_this select 0) do
{
//-------------------------------------------------------------------------------------------------------------------------
	case 0:
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.1,0.2],[0.1,0.3],[0.1,0.3],[0.1,0.4],[0.1,0.4],[0.1,0.5],[0.1,0.5],[0.5,0.8],[0.1,0.6],[0.2,0.8]];
		_setCombat  = ["white","yellow","red"];
		_setBehav   = ["safe","aware"];
		_setSpeed   = ["limited","normal","full"];
		_setForm    = ["line","vee","column","wedge","stag column","ech left","ech right","file","diamond"];
		_setFleeing = [0.2,200];
		_setHeliVal = [150,400,0.7,0];
		_setPause   = [[5,10],[5,10],[5,10],[20,30,5,5],[1,3],[0,0]];
		_setBldgBeh = [8,100,60,60,6];
		_setPatrol  = ["45 + (20 * (skill _leader))","(60 + (random 60)) + ((skill _leader) * 50)"];
		_setSearch  = ["40 + ((skill _leader) * 150)","50 + ((skill _leader) * 50)"];
		_setSupport = [1,1];
		_setJoin    = 2;
		_setEmpVeh  = [[150,100],[150,100]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,5];
		_setHidTime = ["(((10 * DAC_AI_Level) + ((skill _leader) * 50)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 4:
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.1,0.2],[0.1,0.3],[0.1,0.3],[0.1,0.4],[0.1,0.4],[0.1,0.5],[0.1,0.5],[0.5,0.8],[0.1,0.6],[0.2,0.5]];
		_setCombat  = ["white","yellow","red"];
		_setBehav   = ["safe","aware"];
		_setSpeed   = ["limited","normal","full"];
		_setForm    = ["line","vee","column","wedge","stag column","ech left","ech right","file","diamond"];
		_setFleeing = [0.2,200];
		_setHeliVal = [50,100,0.7,1];
		_setPause   = [[1,1],[1,1],[1,1],[20,30,5,5],[1,3],[0,0]];
		_setBldgBeh = [4,50,120,300,2];
		_setPatrol  = ["25 + (20 * (skill _leader))","(60 + (random 60)) + ((skill _leader) * 50)"];
		_setSearch  = ["20 + ((skill _leader) * 50)","40 + ((skill _leader) * 50)"];
		_setSupport = [1,1];
		_setJoin    = 2;
		_setEmpVeh  = [[150,100],[150,100]];
		_setSupTime = ["6 + ((skill _unit) * (6 * DAC_AI_Level))",3,6];
		_setHidTime = ["(((10 * DAC_AI_Level) + ((skill _leader) * 50)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 5:
	{
		//_setSkill = [global min,global max];
		_setSkill   = [0.4,0.8];
		_setCombat  = ["yellow"];
		_setBehav   = ["aware"];
		_setSpeed   = ["limited","normal","full"];
		_setForm    = ["line","vee","column","wedge","stag column","ech left","ech right","file","diamond"];
		_setFleeing = [0,200];
		_setHeliVal = [50,100,0.7,1];
		_setPause   = [[1,1],[1,1],[1,1],[20,30,5,5],[1,3],[0,0]];
		_setBldgBeh = [4,50,120,300,2];
		_setPatrol  = ["45 + (20 * (skill _leader))","(60 + (random 60)) + ((skill _leader) * 50)"];
		_setSearch  = ["40 + ((skill _leader) * 150)","50 + ((skill _leader) * 50)"];
		_setSupport = [1,0];
		_setJoin    = 2;
		_setEmpVeh  = [[150,100],[150,100]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,5];
		_setHidTime = ["(((10 * DAC_AI_Level) + ((skill _leader) * 50)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	Default {
				if(DAC_Basic_Value != 5) then
				{
					DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value";
					hintc "Error: DAC_Config_Behaviour > No valid config number";
				};
				if(true) exitwith {};
			};
};

_array =	[
				_setSkill,_setCombat,_setBehav,_setSpeed,_setForm,_setFleeing,
				_setHeliVal,_setPause,_setBldgBeh,_setPatrol,_setSearch,
				_setSupport,_setJoin,_setEmpVeh,_setSupTime,_setHidTime
			];
_array