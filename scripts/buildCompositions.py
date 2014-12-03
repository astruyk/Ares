import os;
	

inputFolder = "../src/compositions/";
outputFile = "../src/addons/ares_zeusExtensions/compositions.hpp";

outputLines = [];
outputLines.append("// This is a generated file! Do not edit by hand!");
outputLines.append("");
outputLines.append("class AresCompositions");
outputLines.append("{");
outputLines.append("	side = 8;");
outputLines.append("	name = \"Ares\";");

lastDepth = 0;
for sectionName in os.listdir(inputFolder):
	sectionPath = os.path.join(inputFolder, sectionName);
	if (os.path.isdir(sectionPath)):
		sectionClassName = sectionName.replace(' ', '');
		outputLines.append("	class Ares_{0}".format(sectionClassName));
		outputLines.append("	{");
		outputLines.append("		name = \"{0}\";".format(sectionName));
		for categoryName in os.listdir(sectionPath):
			categoryPath = os.path.join(sectionPath, categoryName);
			if (os.path.isdir(categoryPath)):
				categoryClassName = categoryName.replace(' ', '');
				outputLines.append("		class Ares_{0}_{1}".format(sectionClassName, categoryClassName));
				outputLines.append("		{");
				outputLines.append("			name = \"{0}\";".format(categoryName));
				classCount = 0;
				for itemFileName in os.listdir(categoryPath):
					itemPath = os.path.join(categoryPath, itemFileName);
					if (os.path.isfile(itemPath)):
						itemName = os.path.splitext(itemFileName)[0];
						outputLines.append("");
						outputLines.append("			// Generated from file @ '{0}'".format(itemPath[len(inputFolder):]));
						outputLines.append("			class Ares_{0}_{1}_{2}".format(sectionClassName, categoryClassName, classCount));
						outputLines.append("			{");
						outputLines.append("				name = \"{0}\";".format(itemName));
						with open(itemPath) as itemFile:
							for line in itemFile.readlines():
								outputLines.append("				" + line.strip());
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

