@echo off
REM --------------------------------------
REM rpl4フォルダの中に入れて使用すること。
REM 日付を消すことができる。
REM --------------------------------------
set HORIZON=---------------------------------------------------------------------
set processCount=0
@echo on
for %%F in (^????_????_??????_*.rpl4_1010) do call :sub "%%F"
@echo off
echo %HORIZON%
echo Renamed %processCount% files!
echo %HORIZON%
REM powershell sleep 1
pause
exit /b

:sub
  @echo off
  set /a processCount=%processCount%+1
  set BEFORE=%~1
  set FILENAME=%~n1
  set EXTENSION=%~x1
  set AFTER=%FILENAME:~17%%EXTENSION%
  @echo on
  ren "%BEFORE%" "%AFTER%"
