// Command and signals tab and Unit roster are generated automatically based of TFD_ORBAT
//User to add their briefing into appropriate sections here.  Further additions can be added via modules during mission events.
//<marker name='markernamehere'>Your text here</marker> this will create a clickable link in the text, good for panning the camera to locations
//<br/> is for page breaks

_sitText = "<font face='RobotoCondensedBold' size='16' color='#FFC145'>SITUATION</font><br/>Situation text here.";
_misText = "<font face='RobotoCondensedBold' size='16' color='#FFC145'>MISSION</font><br/>Mission text here.";
_excText = "<font face='RobotoCondensedBold' size='16' color='#FFC145'>EXECUTION</font><br/><Execution text here.";
_admText = "<font face='RobotoCondensedBold' size='16' color='#FFC145'>ADMIN AND LOGISTICS</font><br/>Admin text here.";

player createDiaryRecord ["Diary",
							["Admin and Logistics",
								_admText]];

player createDiaryRecord ["Diary",
							["Execution",
								_excText]];

player createDiaryRecord ["Diary", 
							["Mission", 
								_misText]];
								
player createDiaryRecord ["Diary", 
							["Situation", 
								_sitText]];