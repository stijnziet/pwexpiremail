@echo off
setlocal
set LOGFILE=c:\log.txt

call :LOG > %LOGFILE% 2>&1

goto :EOF

:LOG
REM Log the current date/time and the message to the logfile
echo %date% %time% %*
echo on

:: Your batch script here


:: end script
@echo off
goto :EOF


