import os;
import string;

def sanitizeClassname(classname):
	validCharacters = "-_" + string.ascii_letters + "01234567890";
	return ''.join(c for c in classname if c in validCharacters)

inputFolder = "../src/addons/ares_zeusExtensions/compositions/";
outputFile = "../src/addons/ares_zeusExtensions/compositions.hpp";

outputLines = [];
outputLines.append("// This is a generated file! Do not edit by hand!");

lastDepth = 0;
for groupName in os.listdir(inputFolder):
	groupPath = os.path.join(inputFolder, groupName);
	if (os.path.isdir(groupPath)):
		groupClassName = sanitizeClassname(groupName);
		outputLines.append("");
		outputLines.append("class {0}".format(groupClassName));
		outputLines.append("{");
		outputLines.append("	side = 8;");
		outputLines.append("	name = \"{0}\";".format(groupName));
		for sectionName in os.listdir(groupPath):
			sectionPath = os.path.join(groupPath, sectionName);
			if (os.path.isdir(sectionPath)):
				sectionClassName = sanitizeClassname(sectionName);
				outputLines.append("	class Ares_{0}".format(sectionClassName));
				outputLines.append("	{");
				outputLines.append("		name = \"{0}\";".format(sectionName));
				for categoryName in os.listdir(sectionPath):
					categoryPath = os.path.join(sectionPath, categoryName);
					if (os.path.isdir(categoryPath)):
						categoryClassName = sanitizeClassname(categoryName);
						outputLines.append("		class Ares_{0}_{1}".format(sectionClassName, categoryClassName));
						outputLines.append("		{");
						outputLines.append("			name = \"{0}\";".format(categoryName));
						classCount = 0;
						for itemFileName in os.listdir(categoryPath):
							itemPath = os.path.join(categoryPath, itemFileName);
							if (os.path.isfile(itemPath)):
								itemName = os.path.splitext(itemFileName)[0];
								outputLines.append("");
								#outputLines.append("			// Generated from file @ '{0}'".format(itemPath[len(inputFolder):]));
								outputLines.append("			class Ares_{0}_{1}_{2}".format(sectionClassName, categoryClassName, classCount));
								outputLines.append("			{");
								outputLines.append("				name = \"{0}\";".format(itemName));
								outputLines.append("				#include \"compositions\\{0}\"".format(itemPath[len(inputFolder):]));
								#with open(itemPath) as itemFile:
								#	for line in itemFile.readlines():
								#		outputLines.append("				" + line.strip());
								outputLines.append("			};");
								classCount += 1;
						outputLines.append("		};");
				outputLines.append("	};");
		outputLines.append("};");

print ("");
print ("-------------");
print ("   OUTPUT");
print ("-------------");
print ("");
print ('\n'.join(outputLines));

with open(outputFile, "w") as file:
	file.write('\n'.join(outputLines));

