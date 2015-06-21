@ECHO OFF
SET TOOL_DIR=D:\Spiele\steamapps\common\Arma 3 Tools\
SET CONTENT_DIR=C:\Users\jonas\IdeaProjects\Ares
SET VERSION=171

python2.7.exe generateCustomModules.py

"%TOOL_DIR%\AddonBuilder\AddonBuilder.exe" "%CONTENT_DIR%\src\addons\ares_zeusExtensions" "%CONTENT_DIR%\bin\@Ares\addons" -packonly -clear > build_PBO_out.txt
"%TOOL_DIR%\DSSignFile\DSCheckSignatures.exe" "%CONTENT_DIR%\bin\@Ares\addons" "%CONTENT_DIR%\bin\@Ares\keys"

cp "%CONTENT_DIR%\bin\@Ares\addons\ares_zeusExtensions.pbo" "D:\Spiele\steamapps\common\Arma 3\@ares\addons\ares_zeusExtensions.pbo"

"D:\Spiele\steamapps\common\Arma 3\arma3.exe" -name=Jason Miles -cpuCount=4 -nosplash -nolauncher -mod=@CBA_A3;@ares;@ace; "D:\Spiele\steamapps\common\Arma 3\Missions\zeus_test.Stratis.pbo"
