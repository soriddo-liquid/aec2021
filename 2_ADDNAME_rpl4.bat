@echo off
REM --------------------------------------
REM rpl4フォルダの中に入れて使用すること。
REM rpl4_1010ファイルの先頭にSL_をつける。
REM 参照：
REM https://www.mynote-jp.com/entry/2016/01/24/115618
REM --------------------------------------
set HORIZON=---------------------------------------------------------------------

set processCount=0
@echo on
for %%F in (*.rpl4_1010) do call :sub "%%F"
@echo off
echo %HORIZON%
echo Renamed %processCount% files!
echo %HORIZON%

REM powershell sleep 1
pause
exit /b

:sub
  @echo off
  set FILENAME=%~n1
  set EXTENSION=%~x1
  set AFTER=%FILENAME:~3%%EXTENSION%
  REM 先頭の３文字を抽出
  set txt1=%FILENAME:~0,3%
  echo %txt1%
  @echo on
  
  if not "%txt1%" == "SL_" (
    set /a processCount=%processCount%+1
    ren "%FILENAME%%EXTENSION%" "SL_%FILENAME%%EXTENSION%"
  )