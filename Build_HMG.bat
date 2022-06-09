SET PATH=%~d0\hmg.3.4.4\harbour\bin;%~d0\hmg.3.4.4\mingw\bin;%PATH%

title tly_hmg

call del.bat

copy tly_ver3._ch tly_ver.ch
copy tly_hmg3._rc tly_hmg.rc

call %~d0\hmg.3.4.4\build.bat /n tly_hmg.hbp tly_hmg.hbc

IF NOT EXIST tly_hmg.exe goto :END
IF NOT EXIST %~d0\upx-win32\upx.exe goto :END

IF EXIST %~d0\upx-win32\upx.exe %~d0\upx-win32\upx.exe -9 -q tly_hmg.exe -o tly.exe

IF EXIST tly.exe DEL tly_hmg.exe

:END

title OK
