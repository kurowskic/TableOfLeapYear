if "%MG_ROOT%"=="" set MG_ROOT=%~d0\minigui

title tly_hmg

call del.bat

copy tly_ver2._ch tly_ver.ch
copy tly_hmg2._rc tly_hmg.rc


call %MG_ROOT%\batch\compile.bat tly_hmg /ro


call %MG_ROOT%\batch\compile.bat tly_hmg                /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat MakeTableOfLeapYears   /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat MakeNavigation         /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat ctklib                 /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat About                  /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat AutoAdjustControls     /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat EndTheProgram          /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat MoveActiveWindow       /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat CenterMainWindow       /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat CenterModalWindow      /nl %1 %2 %3 %4 %5 %6 %7 %8 %9

call %MG_ROOT%\batch\compile.bat tly_hmg /lo /b MakeTableOfLeapYears /b MakeNavigation /b ctklib /b About /b AutoAdjustControls /b EndTheProgram /b MoveActiveWindow /b CenterMainWindow /b CenterModalWindow /r tly_hmg /nx %1 %2 %3 %4 %5 %6 %7 %8 %9

call %MG_ROOT%\batch\compile.bat tly_hmg                /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat MakeTableOfLeapYears   /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat MakeNavigation         /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat ctklib                 /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat About                  /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat AutoAdjustControls     /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat EndTheProgram          /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat MoveActiveWindow       /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat CenterMainWindow       /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat CenterModalWindow      /do %1 %2 %3 %4 %5 %6 %7 %8 %9

IF NOT EXIST tly_hmg.exe goto :END
IF NOT EXIST %~d0\upx-win32\upx.exe goto :END

IF EXIST %~d0\upx-win32\upx.exe %~d0\upx-win32\upx.exe -9 -q tly_hmg.exe -o tly.exe

IF EXIST tly.exe DEL tly_hmg.exe

:END

title OK
