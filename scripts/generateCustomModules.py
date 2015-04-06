numberOfModules = 100;

# Generate the items in the units[] array of cfgPatches
outputLines = [];
outputLines.append("// This is a generated file! Do not edit by hand!");
for i in range(0, numberOfModules):
	outputLines.append('"Ares_Module_User_Defined_' + str(i) + '",');
with open("../src/addons/ares_zeusExtensions/units_customModules.hpp", "w") as file:
	file.write('\n'.join(outputLines));

# Register a function for each module to call
outputLines = [];
outputLines.append("// This is a generated file! Do not edit by hand!");
outputLines.append('class CustomModules');
outputLines.append('{');
outputLines.append('\tfile = "\\ares_zeusExtensions\\modules\\userDefined";');
for i in range (0, numberOfModules):
	outputLines.append('\tclass UserDefinedModule' + str(i) + ';');
outputLines.append('};');
outputLines.append('');
with open("../src/addons/ares_zeusExtensions/cfgFunctionsCustomUserModules.hpp", "w") as file:
	file.write('\n'.join(outputLines));

# Generate the actual function files that will be called when the module is instantiated.
for i in range (0, numberOfModules):
	outputLines = [];
	outputLines.append("// This is a generated file! Do not edit by hand!");
	outputLines.append('#include "\\ares_zeusExtensions\\module_header.hpp"');
	outputLines.append('_deleteModuleOnExit = false; //This will be done by executeCustomModuleCode');
	outputLines.append('[' + str(i) + ', _logic] call Ares_fnc_ExecuteCustomModuleCode;');
	outputLines.append('#include "\\ares_zeusExtensions\\module_footer.hpp"');
	outputLines.append('');
	with open("../src/addons/ares_zeusExtensions/modules/UserDefined/fn_UserDefinedModule" + str(i) + ".sqf", "w") as file:
		file.write('\n'.join(outputLines));

# Generate the list of modules and have them instantiate the generated functions
outputLines = [];
outputLines.append("// This is a generated file! Do not edit by hand!");
for i in range (0, numberOfModules):
	outputLines.append('class Ares_Module_User_Defined_' + str(i) + ' : Ares_User_Defined_Module_Base');
	outputLines.append('{');
	outputLines.append('\tscopeCurator = 2;');
	outputLines.append('\tdisplayName = "User Defined Module ' + str(i) + '";');
	outputLines.append('\tfunction = "Ares_fnc_UserDefinedModule' + str(i) + '";');
	outputLines.append('};');
	outputLines.append('');
with open("../src/addons/ares_zeusExtensions/cfgVehiclesModulesUserDefined.hpp", "w") as file:
	file.write('\n'.join(outputLines));