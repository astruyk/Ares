SET TOOL_DIR="C:\Games\Steam\steamapps\common\Arma 3 Tools\"
SET CONTENT_DIR="C:\Users\Anton\Documents\SourceTree\Ares"
SET VERSION=1_4_0

%TOOL_DIR%\AddonBuilder\AddonBuilder.exe %CONTENT_DIR%\src\addons\ares_zeusExtensions %CONTENT_DIR%\bin\@Ares\addons -sign="..\..\..\..\Dropbox\Arma3\Ares_%VERSION%.biprivatekey" -packonly -clear > build_PBO_out.txt
pause