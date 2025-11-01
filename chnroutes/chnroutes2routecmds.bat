@ECHO OFF

CD /D %~dp0

SETLOCAL ENABLEDELAYEDEXPANSION

SET "CIDR_32=255.255.255.255"
SET "CIDR_31=255.255.255.254"
SET "CIDR_30=255.255.255.252"
SET "CIDR_29=255.255.255.248"
SET "CIDR_28=255.255.255.240"
SET "CIDR_27=255.255.255.224"
SET "CIDR_26=255.255.255.192"
SET "CIDR_25=255.255.255.128"
SET "CIDR_24=255.255.255.0"
SET "CIDR_23=255.255.254.0"
SET "CIDR_22=255.255.252.0"
SET "CIDR_21=255.255.248.0"
SET "CIDR_20=255.255.240.0"
SET "CIDR_19=255.255.224.0"
SET "CIDR_18=255.255.192.0"
SET "CIDR_17=255.255.128.0"
SET "CIDR_16=255.255.0.0"
SET "CIDR_15=255.254.0.0"
SET "CIDR_14=255.252.0.0"
SET "CIDR_13=255.248.0.0"
SET "CIDR_12=255.240.0.0"
SET "CIDR_11=255.224.0.0"
SET "CIDR_10=255.192.0.0"
SET "CIDR_9=255.128.0.0"
SET "CIDR_8=255.0.0.0"
SET "CIDR_7=254.0.0.0"
SET "CIDR_6=252.0.0.0"
SET "CIDR_5=248.0.0.0"
SET "CIDR_4=240.0.0.0"
SET "CIDR_3=224.0.0.0"
SET "CIDR_2=192.0.0.0"
SET "CIDR_1=128.0.0.0"

IF EXIST add.txt (
    DEL add.txt >NUL
)

IF EXIST delete.txt (
    DEL delete.txt >NUL
)

IF EXIST ..\dns\overture\rules\ip-cn.txt (
    DEL ..\dns\overture\rules\ip-cn.txt >NUL
)

FOR /F "usebackq delims=" %%L IN (chnroutes.txt) DO (
    FOR /F "tokens=1,2 delims=/" %%A IN ("%%L") DO (
        CALL SET "NETMASK=%%CIDR_%%B%%%"
        >>add.txt ECHO add %%A mask !NETMASK! default METRIC default IF default
        >>delete.txt ECHO delete %%A mask !NETMASK! default METRIC default IF default
    )
)
 
COPY chnroutes.txt ..\dns\overture\rules\ip-cn.txt >NUL

ENDLOCAL
