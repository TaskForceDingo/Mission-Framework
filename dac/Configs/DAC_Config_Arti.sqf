//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Config_Arti       //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_ArtiSide","_ArtiTyp","_array","_ArtiSets","_set0","_set1",
			"_set2","_set3","_set4","_set5","_set6","_set7","_set8","_set9","_set10","_s"
		];

			_ArtiTyp = _this select 0;_array = [];_s = 0;_set10 = 0;
			_set0 = [];_set1 = [];_set2 = [];_set3 = [];_set4 = [];_set5 = [];_set6 = [];_set7 = [];_set8 = [];_set9 = [];


if(_ArtiTyp == 0) exitwith {};

switch (_ArtiTyp) do
{
//-------------------------------------------------------------------------------------------------------------------------
case 1:
    {        
        _set0  = [30,1,0,30];
        _set1  = [1,0.1,100,[],999,30];
        _set2  = [100,1,100,1000,4,2,0];
        _set3  = [["O_Mortar_01_F",["Sh_82mm_AMOS", "F_20mm_White"]]];
        _set4  = [2,5,1];
        _set5  = [50,150,0];
        _set6  = [50,150,0];
        _set7  = [5,10,0];
        _set8  = [];
        _set9  = [];
        _set10 = 5000;
    };
//-------------------------------------------------------------------------------------------------------------------------
	Default {
				if(DAC_Basic_Value != 5) then
				{
					DAC_Basic_Value = 5; publicvariable "DAC_Basic_Value";
					hintc "Error: DAC_Config_Camps > No valid config number";
				};
				if (true) exitwith {};
			};
};

_array = [_set0,_set1,_set2,_set3,_set4,_set5,_set6,_set7,_set8,_set9,_set10];
_array