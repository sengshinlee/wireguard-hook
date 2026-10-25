@ECHO OFF

CD /D %~dp0

START /B ..\dns\overture\overture-windows-amd64.exe -c ..\dns\overture\config.yml