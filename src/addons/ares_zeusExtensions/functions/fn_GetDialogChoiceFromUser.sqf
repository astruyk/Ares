/*
	Displays a dialog that prompts the user to choose an option from a combo box.
	
	Params:
		0 - Array - An array of strings to fill into the combo box.
		1 - (Optional) Number - The index of the value to select by default. Default is first item in the array.
		2 - (Optional) String - The text to display above the combo box. Default: "Please choose an option:"

	Returns:
		The index from the array of options that was selected or -1 if the user chose to cancel.
*/

_optionsArray = [_this, 0, [], [[]]] call BIS_fnc_param;
_defaultOption = [_this, 1, 0, [0]] call BIS_fnc_param;
_labelText = [_this, 2, "Please choose an option:", [""]] call BIS_fnc_param;

// Bring up the dialog
_dialog = createDialog "Ares_Choose_Dialog";

// Set the label text
ctrlSetText [1000, _labelText];

// Add the options to choose from.
{
	lbAdd [2100, _x];
} forEach _optionsArray;

// Select the default option
lbSetCurSel [2100, _defaultOption];

waitUntil { !dialog };
_returnValue = -1;
if (missionNamespace getVariable ["Ares_Dialog_Result", -1] == 1) then
{
	_returnValue = missionNamespace getVariable ["Ares_ChooseDialog_SelectedValue", 0];
};
_returnValue;
