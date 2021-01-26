class admp
{
	class init 
	{
		file = "adminpanel";
		class init {};
	};
	class admin 
	{
		file = "adminpanel\functions\admin";
		class ban {};
		class kick {};
		class toggleSpectator {};
		class toggleZeus {};
		class toggleServerLock {};
		class updateCuratorEditableObjects {};
		class updateServerStats {};
		class createZeusModule {};
		class compileAndExec {};
		class executeOnMachine {};
		class loadPreviousCode {};
	};
	class main 
	{
		file = "adminpanel\functions\main";
		class getPlayerList {};
		class refresh {};
		class displayOpened {};
		class displayClosed {};
		class updatePlayerList {};
		class playerFromSelection {};
		class handleClientVars {};
		class LBSelectionChanged {};
		class setReturnValue {};
		class handleSpectatorAdminpanel {};
		class updateToggleControls {};
		class refreshPIPcam {};
		class playerSetup {};
	};
	class map 
	{
		file = "adminpanel\functions\map";
		class getMarkerInfo {};
		class updateMarker {};
		class updateMapMarkers {};
		class handleMapClick {};
		class updateSelectedMarker {};
		class playerFromMapClick {};
		class centreMapOnPlayer {};
	};
	class medical 
	{
		file = "adminpanel\functions\medical";
		class getPlayerMedicalInfo {};
		class updatePlayerMedicalInfo {};
		class fullHeal {};
		class wakeUp {};
	};
	class mission 
	{
		file = "adminpanel\functions\mission";
		class endMission {};
		class populateEndingList {};
	};
	class playerinfo 
	{
		file = "adminpanel\functions\playerinfo";
		class getPlayerInfo {};
		class updatePlayerInfo {};
		class assignGroup {};
	};
	class utility
	{
		file = "adminpanel\functions\utility";
		class arsenal {};
		class ghost {};
		class godmode {};
		class infiniteAmmo {};
		class toggleLocalFiredEH {};
	};
	class vehicle 
	{
		file = "adminpanel\functions\vehicle";
		class forceDismount {};
		class rearmVehicle {};
		class refuelVehicle {};
		class repairVehicle {};
		class vehicleUnstuck {};
	};
};