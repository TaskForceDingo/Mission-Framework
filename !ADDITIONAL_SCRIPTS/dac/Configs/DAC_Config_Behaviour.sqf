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
	case 0: //Basic Infantry Patrol Behaviour (Walking)(Roads)(Relaxed)
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.2,0.5],[0.2,0.5],[0.2,0.5],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0]];
		_setCombat  = ["red","yellow"];
		_setBehav   = ["safe"];
		_setSpeed   = ["limited"];
		_setForm    = ["column","stag column","file"];
		_setFleeing = [0.2,200];
		_setHeliVal = [150,400,0.7,1];
		_setPause   = [[1,1],[5,10],[5,10],[20,30,10,10],[1,1],[0,0]];
		_setBldgBeh = [0,100,60,60,6];
		_setPatrol  = ["150","120"];
		_setSearch  = ["150","120"];
		_setSupport = [1,0];
		_setJoin    = 2;
		_setEmpVeh  = [[150,50],[150,50]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,10];
		_setHidTime = ["(((5 * DAC_AI_Level) + ((skill _leader) * 25)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 1: //Basic Infantry Patrol Behaviour (Walking)(Off-Roads)(Patrol Stance)
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.2,0.5],[0.2,0.5],[0.2,0.5],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0]];
		_setCombat  = ["red","yellow"];
		_setBehav   = ["aware"];
		_setSpeed   = ["limited"];
		_setForm    = ["column","stag column","file","vee","diamond","wedge"];
		_setFleeing = [0.2,200];
		_setHeliVal = [150,400,0.7,1];
		_setPause   = [[1,1],[5,10],[5,10],[20,30,10,10],[1,1],[0,0]];
		_setBldgBeh = [0,100,60,60,6];
		_setPatrol  = ["150","120"];
		_setSearch  = ["150","120"];
		_setSupport = [1,0];
		_setJoin    = 2;
		_setEmpVeh  = [[150,50],[150,50]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,10];
		_setHidTime = ["(((5 * DAC_AI_Level) + ((skill _leader) * 25)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 2: //Basic Infantry Patrol Behaviour (Running)(Off-Roads)(Patrol Stance)
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.2,0.25],[0.4,0.6],[0.2,0.5],[1.0,1.0],[0.4,0.5],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0]];
		_setCombat  = ["red","yellow"];
		_setBehav   = ["aware"];
		_setSpeed   = ["Normal"];
		_setForm    = ["column","stag column","file","vee","diamond","wedge"];
		_setFleeing = [0.2,200];
		_setHeliVal = [150,400,0.7,1];
		_setPause   = [[1,1],[5,10],[5,10],[20,30,10,10],[1,1],[0,0]];
		_setBldgBeh = [0,100,60,60,6];
		_setPatrol  = ["150","120"];
		_setSearch  = ["150","120"];
		_setSupport = [1,0];
		_setJoin    = 2;
		_setEmpVeh  = [[150,50],[150,50]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,10];
		_setHidTime = ["(((5 * DAC_AI_Level) + ((skill _leader) * 25)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 3: //Basic Infantry Patrol Behaviour (Search and Destroy)
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.2,0.5],[0.2,0.5],[0.2,0.5],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0]];
		_setCombat  = ["red","yellow"];
		_setBehav   = ["aware"];
		_setSpeed   = ["Normal"];
		_setForm    = ["line","diamond","wedge"];
		_setFleeing = [0.2,200];
		_setHeliVal = [150,400,0.7,1];
		_setPause   = [[1,1],[5,10],[5,10],[20,30,10,10],[1,1],[0,0]];
		_setBldgBeh = [0,100,60,60,6];
		_setPatrol  = ["200","120"];
		_setSearch  = ["200","120"];
		_setSupport = [1,0];
		_setJoin    = 2;
		_setEmpVeh  = [[150,50],[150,50]];
		_setSupTime = ["10 + ((skill _unit) * (5 * DAC_AI_Level))",2,10];
		_setHidTime = ["(((10 * DAC_AI_Level) + ((skill _leader) * 25)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 4: //Basic Infantry Patrol Behaviour (Ambush)
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.2,0.6],[0.2,0.6],[0.2,0.6],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0]];
		_setCombat  = ["green"];
		_setBehav   = ["stealth"];
		_setSpeed   = ["limited"];
		_setForm    = ["line"];
		_setFleeing = [0.2,200];
		_setHeliVal = [150,400,0.7,1];
		_setPause   = [[600,600],[5,10],[5,10],[20,30,10,10],[1,1],[0,0]];
		_setBldgBeh = [0,100,60,60,6];
		_setPatrol  = ["200","120"];
		_setSearch  = ["200","120"];
		_setSupport = [1,0];
		_setJoin    = 2;
		_setEmpVeh  = [[150,50],[150,50]];
		_setSupTime = ["20 + ((skill _unit) * (10 * DAC_AI_Level))",5,10];
		_setHidTime = ["(((4 * DAC_AI_Level) + ((skill _leader) * 4)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 5: //Basic Infantry Patrol Behaviour (Aggressive AI)(Fast Push)
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.3,0.5],[0.3,0.5],[0.3,0.5],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0]];
		_setCombat  = ["red"];
		_setBehav   = ["aware"];
		_setSpeed   = ["full"];
		_setForm    = ["line","diamond","wedge"];
		_setFleeing = [0.2,200];
		_setHeliVal = [150,400,0.7,1];
		_setPause   = [[1,1],[5,10],[5,10],[20,30,10,10],[1,1],[0,0]];
		_setBldgBeh = [0,100,60,60,6];
		_setPatrol  = ["5","5"];
		_setSearch  = ["200","120"];
		_setSupport = [1,0];
		_setJoin    = 2;
		_setEmpVeh  = [[150,50],[150,50]];
		_setSupTime = ["80 + ((skill _unit) * (80 * DAC_AI_Level))",5,10];
		_setHidTime = ["(((4 * DAC_AI_Level) + ((skill _leader) * 3)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 6: //Basic Infantry Patrol Behaviour (Defence)(Minimal Movement)(Sentry)
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.1,0.4],[0.1,0.4],[0.1,0.4],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0]];
		_setCombat  = ["green"];
		_setBehav   = ["combat"];
		_setSpeed   = ["limited"];
		_setForm    = ["line"];
		_setFleeing = [0.2,400];
		_setHeliVal = [150,400,0.7,1];
		_setPause   = [[300,600],[5,10],[5,10],[20,30,10,10],[1,1],[1,1]];
		_setBldgBeh = [0,100,60,60,6];
		_setPatrol  = ["1","1"];
		_setSearch  = ["1","1"];
		_setSupport = [1,0];
		_setJoin    = 2;
		_setEmpVeh  = [[300,80],[300,80]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,10];
		_setHidTime = ["(((90 * DAC_AI_Level) + ((skill _leader) * 90)) / ((count units _group) + 120))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 7: //Basic Infantry Patrol Behaviour (Defence)(Movement)(Sentry)(Building Enter/Exit Search)
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.1,0.25],[0.1,0.4],[0.1,0.4],[1.0,1.0],[0.4,0.5],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0]];
		_setCombat  = ["green"];
		_setBehav   = ["combat"];
		_setSpeed   = ["limited"];
		_setForm    = ["line","file"];
		_setFleeing = [0.2,400];
		_setHeliVal = [150,400,0.7,1];
		_setPause   = [[60,60],[5,10],[5,10],[20,30,10,10],[1,1],[1,1]];
		_setBldgBeh = [3,200,15,60,2];
		_setPatrol  = ["1","1"];
		_setSearch  = ["1","1"];
		_setSupport = [1,0];
		_setJoin    = 2;
		_setEmpVeh  = [[300,80],[300,80]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,10];
		_setHidTime = ["(((90 * DAC_AI_Level) + ((skill _leader) * 90)) / ((count units _group) + 120))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 8: //Basic Infantry Patrol Behaviour (Sniper/Scout)(Movement/Stealthy)(Sentry)(Accurate)
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.4,0.7],[0.4,0.7],[0.4,0.7],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0]];
		_setCombat  = ["red"];
		_setBehav   = ["stealth"];
		_setSpeed   = ["limited"];
		_setForm    = ["line","file"];
		_setFleeing = [0.2,200];
		_setHeliVal = [150,400,0.7,1];
		_setPause   = [[60,60],[5,10],[5,10],[20,30,10,10],[1,1],[1,1]];
		_setBldgBeh = [0,100,60,60,6];
		_setPatrol  = ["1","1"];
		_setSearch  = ["1","1"];
		_setSupport = [1,0];
		_setJoin    = 2;
		_setEmpVeh  = [[300,80],[300,80]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,10];
		_setHidTime = ["(((90 * DAC_AI_Level) + ((skill _leader) * 90)) / ((count units _group) + 120))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 9: //Basic Infantry Patrol Behaviour (Weak Army)(Fleeing)(Inacurate)
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.1,0.3],[0.1,0.3],[0.1,0.3],[1.0,1.0],[1.0,1.0],[0.1,0.1],[0.1,0.1],[1.0,1.0],[1.0,1.0],[1.0,1.0]];
		_setCombat  = ["green"];
		_setBehav   = ["aware"];
		_setSpeed   = ["limited"];
		_setForm    = ["line","file"];
		_setFleeing = [1,200];
		_setHeliVal = [150,400,0.7,1];
		_setPause   = [[60,60],[5,10],[5,10],[20,30,10,10],[1,1],[1,1]];
		_setBldgBeh = [0,100,60,60,6];
		_setPatrol  = ["1","1"];
		_setSearch  = ["1","1"];
		_setSupport = [0,0];
		_setJoin    = 0;
		_setEmpVeh  = [[300,80],[300,80]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,10];
		_setHidTime = ["(((90 * DAC_AI_Level) + ((skill _leader) * 90)) / ((count units _group) + 120))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 10: //Basic Vehicle Patrol Behaviour (Civilian)
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.1,0.3],[0.1,0.3],[0.1,0.3],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0]];
		_setCombat  = ["blue"];
		_setBehav   = ["careless"];
		_setSpeed   = ["limited"];
		_setForm    = ["file"];
		_setFleeing = [0.2,200];
		_setHeliVal = [150,400,0.7,1];
		_setPause   = [[1,1],[5,5],[5,5],[20,30,10,10],[1,1],[1,1]];
		_setBldgBeh = [2,400,60,60,1];
		_setPatrol  = ["1","1"];
		_setSearch  = ["1","1"];
		_setSupport = [0,0];
		_setJoin    = 0;
		_setEmpVeh  = [[300,80],[300,80]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,10];
		_setHidTime = ["(((90 * DAC_AI_Level) + ((skill _leader) * 90)) / ((count units _group) + 120))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 11: //Basic Vehicle Patrol Behaviour (Slow Road Patrol)
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.3,0.4],[0.3,0.7],[0.3,0.7],[1.0,1.0],[0.4,0.5],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0]];
		_setCombat  = ["yellow"];
		_setBehav   = ["safe"];
		_setSpeed   = ["limited"];
		_setForm    = ["column","stag column","file","wedge"];
		_setFleeing = [0.2,200];
		_setHeliVal = [150,400,0.7,1];
		_setPause   = [[1,1],[5,5],[5,5],[20,30,10,10],[1,1],[5,5]];
		_setBldgBeh = [0,400,60,60,1];
		_setPatrol  = ["10","20"];
		_setSearch  = ["1","1"];
		_setSupport = [1,0];
		_setJoin    = 2;
		_setEmpVeh  = [[300,80],[300,80]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,10];
		_setHidTime = ["(((5 * DAC_AI_Level) + ((skill _leader) * 25)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 12: //Basic Vehicle Patrol Behaviour (Slow Off Road Patrol)
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.3,0.7],[0.3,0.7],[0.3,0.7],[1.0,1.0],[0.6,0.7],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0]];
		_setCombat  = ["yellow"];
		_setBehav   = ["aware"];
		_setSpeed   = ["limited"];
		_setForm    = ["column","stag column","file","wedge"];
		_setFleeing = [0.2,200];
		_setHeliVal = [150,400,1,1];
		_setPause   = [[1,1],[5,5],[5,5],[20,30,10,10],[1,1],[5,5]];
		_setBldgBeh = [0,400,60,60,1];
		_setPatrol  = ["10","10"];
		_setSearch  = ["1","1"];
		_setSupport = [1,0];
		_setJoin    = 2;
		_setEmpVeh  = [[300,80],[300,80]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,10];
		_setHidTime = ["(((5 * DAC_AI_Level) + ((skill _leader) * 25)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 13: //Basic Vehicle Patrol Behaviour (Regular Road Patrol)
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.3,0.7],[0.3,0.7],[0.3,0.7],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0]];
		_setCombat  = ["yellow"];
		_setBehav   = ["safe"];
		_setSpeed   = ["normal"];
		_setForm    = ["column","stag column","file","wedge"];
		_setFleeing = [0.2,200];
		_setHeliVal = [150,400,1,1];
		_setPause   = [[1,1],[5,5],[5,5],[20,30,10,10],[1,1],[5,5]];
		_setBldgBeh = [0,400,60,60,1];
		_setPatrol  = ["50","90"];
		_setSearch  = ["1","1"];
		_setSupport = [1,0];
		_setJoin    = 2;
		_setEmpVeh  = [[300,80],[300,80]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,10];
		_setHidTime = ["(((5 * DAC_AI_Level) + ((skill _leader) * 25)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 14: //Basic Vehicle Patrol Behaviour (Regular Off Road Patrol)
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.3,0.7],[0.3,0.7],[0.3,0.7],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0]];
		_setCombat  = ["yellow"];
		_setBehav   = ["aware"];
		_setSpeed   = ["normal"];
		_setForm    = ["column","stag column","file","wedge"];
		_setFleeing = [0.2,200];
		_setHeliVal = [150,400,0.7,1];
		_setPause   = [[1,1],[5,5],[5,5],[20,30,10,10],[1,1],[5,5]];
		_setBldgBeh = [0,400,60,60,1];
		_setPatrol  = ["50","90"];
		_setSearch  = ["1","1"];
		_setSupport = [1,0];
		_setJoin    = 2;
		_setEmpVeh  = [[300,80],[300,80]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,10];
		_setHidTime = ["(((5 * DAC_AI_Level) + ((skill _leader) * 25)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 15: //Basic Vehicle Patrol Behaviour (Regular Off Road Patrol)
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.3,0.7],[0.3,0.7],[0.3,0.7],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0]];
		_setCombat  = ["yellow"];
		_setBehav   = ["aware"];
		_setSpeed   = ["normal"];
		_setForm    = ["column","stag column","file","wedge"];
		_setFleeing = [0.2,200];
		_setHeliVal = [150,400,0.7,1];
		_setPause   = [[1,1],[5,5],[5,5],[20,30,10,10],[1,1],[5,5]];
		_setBldgBeh = [0,400,60,60,1];
		_setPatrol  = ["50","90"];
		_setSearch  = ["1","1"];
		_setSupport = [1,0];
		_setJoin    = 2;
		_setEmpVeh  = [[300,80],[300,80]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,10];
		_setHidTime = ["(((5 * DAC_AI_Level) + ((skill _leader) * 25)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 16: //Basic Vehicle Patrol Behaviour (Dismounted Patrols)
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.3,0.7],[0.3,0.7],[0.3,0.7],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0]];
		_setCombat  = ["red"];
		_setBehav   = ["aware"];
		_setSpeed   = ["normal"];
		_setForm    = ["wedge"];
		_setFleeing = [0.2,200];
		_setHeliVal = [150,400,0.7,1];
		_setPause   = [[1,1],[10,10],[5,5],[20,30,10,10],[1,1],[0,0]];
		_setBldgBeh = [0,400,60,60,1];
		_setPatrol  = ["50","180"];
		_setSearch  = ["50","180"];
		_setSupport = [1,0];
		_setJoin    = 2;
		_setEmpVeh  = [[300,80],[300,80]];
		_setSupTime = ["10 + ((skill _unit) * (5 * DAC_AI_Level))",2,10];
		_setHidTime = ["(((10 * DAC_AI_Level) + ((skill _leader) * 25)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 17: //Basic Vehicle Patrol Behaviour (Aggressive Vehicles)
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.4,0.7],[0.4,0.7],[0.4,0.7],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0],[1.0,1.0]];
		_setCombat  = ["red"];
		_setBehav   = ["combat"];
		_setSpeed   = ["normal"];
		_setForm    = ["column","file"];
		_setFleeing = [0.2,200];
		_setHeliVal = [150,400,0.7,1];
		_setPause   = [[1,1],[1,1],[1,1],[20,30,10,10],[1,1],[0,0]];
		_setBldgBeh = [0,400,60,60,1];
		_setPatrol  = ["1","1"];
		_setSearch  = ["1","1"];
		_setSupport = [1,0];
		_setJoin    = 2;
		_setEmpVeh  = [[300,80],[300,80]];
		_setSupTime = ["80 + ((skill _unit) * (80 * DAC_AI_Level))",5,10];
		_setHidTime = ["(((4 * DAC_AI_Level) + ((skill _leader) * 3)) / ((count units _group) + 1))"];
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
