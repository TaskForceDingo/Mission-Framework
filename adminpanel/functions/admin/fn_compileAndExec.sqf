/*
	Author: JohnnyShootos (Edited by TheTimidShade)

	Description:
		Called locally on client to execute code sent remotely via admin panel

	Parameters:
		0: STRING - Code to compile and execute on local client
		
	Returns:
		NONE
*/

params ["_code"];

_compiledCode = compile _code;
[] spawn _compiledCode;