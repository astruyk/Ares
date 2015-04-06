[
	"Util",
	"Execute Code (All Machines)",
	{
		missionNamespace setVariable ['Ares_CopyPaste_Dialog_Text', ""];
		missionNamespace setVariable ["Ares_CopyPaste_Dialog_Result", ""];
		_dialog = createDialog "Ares_CopyPaste_Dialog";
		waitUntil { dialog };
		waitUntil { !dialog };
		_dialogResult = missionNamespace getVariable ["Ares_CopyPaste_Dialog_Result", -1];
		if (_dialogResult == 1) then
		{
			_pastedText = missionNamespace getVariable ["Ares_CopyPaste_Dialog_Text", "[]"];
			try
			{
				[(compile _pastedText), [], true] call Ares_fnc_BroadcastCode;
			}
			catch
			{
				diag_log _exception;
				["Failed to parse code. See RPT for error."] call Ares_fnc_ShowZeusMessage;
			};
		};
	}
] call Ares_fnc_RegisterCustomModule;