color E
ECHO OFF
CLS
:MENU
ECHO.
ECHO ...............................................
ECHO Inhealth Medical Group IT Staff's property 
ECHO		Created by Robert Garcia
Echo		Credited to Wilfredo Santana
ECHO ...............................................
ECHO.
ECHO 1 - Change Computer Name (Reboot Required)
ECHO 2 - Change Region (Time)
ECHO 3 - Update Power options
ECHO 4 - Install Google
ECHO 5 - Install Adobe
ECHO 6 - Install Atera
ECHO 7 - Install Fortinet
Echo 8 - Install SonicWall
Echo 9 - Install Spectrum Voip
Echo 10 - Install Trend Micro (Long install!!!)
REM Echo 11 - Join Domain (Reboot Required)
Echo 11 - Install Spiceworks (Quick install!!!)
Echo 12 - Exit and Reboot
Echo 13 - Please Run me Sanity Check!!!
ECHO.
SET /P M=Type 1, 2, 3, or 4 then press ENTER:
IF %M%==1 GOTO  changename
IF %M%==2 GOTO  date
IF %M%==3 GOTO  power
IF %M%==4 GOTO  google
IF %M%==5 GOTO  adobe
IF %M%==6 GOTO  atera
IF %M%==7 GOTO  fortinet
IF %M%==8 GOTO  sonicwall
IF %M%==9 GOTO  spectrum
IF %M%==10 GOTO trend
REM IF %M%==11 GOTO join
IF %M%==11 GOTO spice
IF %M%==12 GOTO exit
IF %M%==13 GOTO sanity
:changename
cd C:\
wmic bios get serialnumber
echo "current computer name %computername%"
set /p NEW_NAME="Please enter computer name: "
for /f %%i in ('hostname') do set OLD_NAME=%%i
echo %OLD_NAME%
echo %NEW_NAME%
WMIC computersystem where caption="%OLD_NAME%" rename "%NEW_NAME%"
echo "Shutting down no I will be back!!!!"
pause 2
shutdown.exe /r /t 00
GOTO MENU
:date 
color A
tzutil /s "Eastern Standard Time"
echo " System time settings changed to Eastern Stadard Time"
GOTO MENU
:power
@echo off
powercfg /x -hibernate-timeout-ac 0

powercfg /x -hibernate-timeout-dc 0

powercfg /x -disk-timeout-ac 0

powercfg /x -disk-timeout-dc 0d

powercfg /x -monitor-timeout-ac 0

powercfg /x -monitor-timeout-dc 0

Powercfg /x -standby-timeout-ac 0

powercfg /x -standby-timeout-dc 0
echo '!!Your Power options should all say NEVER!!' 
pause
color E
GOTO MENU
:google
cd C:\Users\itadmin\Desktop\New_Project
start C:\Users\itadmin\Desktop\New_Project\googlechromestandaloneenterprise64.msi /qn
echo '!!Yea it is installed!!' 
pause
color E
GOTO MENU
:adobe
cd C:\Users\itadmin\Desktop\New_Project\
start C:\Users\itadmin\Desktop\New_Project\AcroRdrDC2100120140_en_US.exe /sAll /rs /msi EULA_ACCEPT=YES
echo '!!Yea it is installed!!' 
pause
color E
GOTO MENU
:atera
cd C:\Users\itadmin\Desktop\New_Project\
start C:\Users\itadmin\Desktop\New_Project\New_Setup_IMA_Medical_Group.msi /qn
echo '!!Yea it is installed!!' 
pause
color E
GOTO MENU
:fortinet
cd C:\Users\itadmin\Desktop\New_Project\
start C:\Users\itadmin\Desktop\New_Project\FortiClient.msi /qn
@echo off
color A
setlocal
set "write=<nul set/p"
%write%=Patience, please
for /l %%a in (1,1,25) do (
%write%=.
ping -n 2 127.0.0.1 > nul
)
echo '!!Yea it is installed!!' 
pause
color E
GOTO MENU
:sonicwall
cd C:\Users\itadmin\Desktop\New_Project\
start C:\Users\itadmin\Desktop\New_Project\184-005968-00_Rev_A_GVCSetup64.exe /Q
@echo off
color A
setlocal
set "write=<nul set/p"
%write%=Patience, please
for /l %%a in (1,1,25) do (
%write%=.
ping -n 2 127.0.0.1 > nul
)
echo '!!Yea it is installed!!' 
pause
color E
GOTO MENU
:spectrum
cd C:\Users\itadmin\Desktop\New_Project\
start C:\Users\itadmin\Desktop\New_Project\SpectrumVoIP_6.2.2.0_105060.msi /qn
@echo off
color A
setlocal
set "write=<nul set/p"
%write%=Patience, please
for /l %%a in (1,1,25) do (
%write%=.
ping -n 2 127.0.0.1 > nul
)
echo '!!Yea it is installed!!' 
pause
color E
GOTO MENU
:trend
cd C:\Users\itadmin\Desktop\New_Project\
start C:\Users\itadmin\Desktop\New_Project\Apex1_Agent_Installer_Modifiedv2.msi /quiet
@echo off
color A
setlocal
set "write=<nul set/p"
%write%=Patience, please
for /l %%a in (1,1,25) do (
%write%=.
ping -n 2 127.0.0.1 > nul
)
echo '!!Yea it is installed!!' 
pause
color E
GOTO MENU
REM :join
REM cd C:\
REM start wmic COMPUTERSYSTEM WHERE Name="%COMPUTERNAME%" CALL JoinDomainOrWorkgroup FJoinOptions=3 Name="inhealthmd.com" UserName="it" Password="Password"
REM @echo off
REM color A
REM setlocal
REM set "write=<nul set/p"
REM %write%=Patience, please
REM for /l %%a in (1,1,25) do (
REM %write%=.
REM ping -n 2 127.0.0.1 > nul
REM )
REM echo '!!Yea it is installed!!' 
REM pause
REM color E
GOTO MENU
:spice
cd C:\Users\itadmin\Desktop\New_Project\
start Msiexec.exe /I "Spiceworks Agent.msi" /q /l*v c:\spiceworksinstall.log SPICEWORKS_SERVER="172.16.0.46" SPICEWORKS_AUTH_KEY="Hash" SPICEWORKS_PORT=444 ADDLOCAL=FeatureService,FeatureTray  /norestart
color A
setlocal
set "write=<nul set/p"
%write%=Patience, please
for /l %%a in (1,1,25) do (
%write%=.
ping -n 2 127.0.0.1 > nul
)
echo '!!Hmmm Check Control panel to make sure!!' 
pause
GOTO MENU
:exit
shutdown.exe /r /t 00
color A
GOTO MENU
:sanity
control appwiz.cpl
echo "PLEASE CHECK ALL APPS IN CONTROL PANEL!!!"
pause

