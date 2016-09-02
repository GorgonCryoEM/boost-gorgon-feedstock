set vc="14.0"
set libdir="lib%ARCH%-msvc-%vc%"

:: Move headers to LIBRARY_INC
move boost %LIBRARY_INC%\
if errorlevel 1 exit 1

:: Move dll's to LIBRARY_BIN
move %libdir%\*.dll    %LIBRARY_BIN%
if errorlevel 1 exit 1

:: Move libs's to LIBRARY_LIB
move %libdir%\*.lib    %LIBRARY_LIB%
if errorlevel 1 exit 1

%PYTHON% %RECIPE_DIR%\..\ci_support\upload_or_check_non_existence.py %RECIPE_DIR% gorgoncryoem --channel=dependency
