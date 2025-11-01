@ECHO OFF

CD /D %~dp0

rundll32.exe ..\dll\cmroute.dll,SetRoutes ^
             /STATIC_FILE_NAME ..\chnroutes\add.txt ^
             /DONT_REQUIRE_URL ^
             /IPHLPAPI_ACCESS_DENIED_OK