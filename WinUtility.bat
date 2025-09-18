@echo off
mode con: cols=130 lines=42
:: SPDX-License-Identifier: GPL-3.0-or-later
:: Copyright (C) 2025 headshotdomain.net

REM #########[Auto elevate to admin if not already elevated]#########
REM --- Check if running with admin rights ---
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    goto UACPrompt
) else (
    goto GotAdmin
)

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B

:GotAdmin
    if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs"
    pushd "%CD%"
    CD /D "%~dp0"
REM #############[END AUTO ADMIN SCRIPT]#############
GOTO START

:START
cls
title Win11 Utility
REM ##################################### ART START #####################################
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
for /f "tokens=* delims=!:" %%A in ('findstr /b ":!:" "%~f0"') do @echo(%%A
REM ###################################### ART END ######################################
echo.
REM ## Administration Cheking system. We are seeing if you ran this file as Administrator or not.
echo Administrative permissions required.
timeout /t 1 /nobreak > NUL
echo Detecting permissions...
timeout /t 1 /nobreak > NUL
net session >nul 2>&1
if %errorLevel% == 0 (
echo [32m--- [1mSuccess:[0m[32m Administrative permissions confirmed. ---[0m
) else (
echo [31m--- [1mFailure:[0m[31m Current permissions inadequate. ---[0m
echo Some features will not work until you run this script as Administrator
echo.
echo Just need to [33m"Right click"[0m on the .bat file and select [33m"Run as Administrator"[0m
timeout /t 1 /nobreak > NUL
echo Close and try again Please. [36m^(Or just hit any key to close^)[0m.
pause > NUL
exit
)
timeout /t 1 /nobreak > NUL

REM ## End of adminstration Checking system.
:MENU
cls
REM ## Disclaimer Message, basically saying I am not responsible fo what you do with this.
echo.
echo [31m[1m!!WARNING!![0m [33m( Disclaimer: Read [?] About / Copyright Section [4mFIRST[0m [33m ) [31m[1m!!WARNING!![0m
REM Menu begining.
echo.
echo [32m#########################################
echo ##         Windows Utility Menu        ##
echo #########################################
echo ## 1.   [37mStart Simple CleanUp[32m
echo ## 2.   [37mStart Deeper CleanUp[32m
echo ## 3.   [37mSystem Information[32m
echo ## 4.   [37mCheck ^& Repair Windows 11[32m
echo ## 5.   [37mImage Repair 11 -[31m[1m Run only if #4 showed issues[0m[32m
echo ## 6.   [37mRun Check Disk to possibly repair a HD[32m
echo ## 7.   [37mOpen Host File[32m
echo ## 8.   [37mOpen Disk CleanUp[32m
echo ## 9.   [37mOpen Disk Managment[32m
echo ## 10.  [37mNetwork Check [33m(Pings/Traceroute [35mgoogle.com[33m by Default)[32m
echo ## 11.  [37mPing/Traceroute Custom IP/URL[32m
echo ## 12.  [37mSpeed Test by Ookla[32m
echo ## 13.  [37mFlush DNS[32m
echo ## 14.  [37mReset Network Adapters[32m
echo ## 15.  [37mPort Listing[32m
echo ## 16.  [37mOpen Reliability Monitor[32m
echo ## 17.  [37mOpen Event Viewer[32m
echo ## 18.  [37mWindows AutoClean on Boot[32m
echo ## 19.  [37mWindows Color Calibration[32m
echo ## 20.  [37mMake Godmode Shortcut[32m
echo ## 21.  [37mRebuild Icon Cache[32m
echo ## 22.  [37mRetreve Win 11 Product Key[32m
echo ## 23.  [37mCreate Battery Report[32m [33m(For those on laptops)[32m
echo ## 24.  [37mPower Configuration[32m [33m(For those on laptops)[32m
echo ## 25.  [37mUninstaller - (Semi Advanced)[32m
echo ## 26.  [37mDrive Tree Exporter[32m
echo ## 27.  [37mVirus Scan - (Windows Defender)[32m
echo ## 28.  [37mCreate Installed Programs List[32m
echo ## 29.  [37mRestart into BIOS[32m
echo ## [33m?[32m.   [37mAbout / Copyright[32m
echo ## [31mQ[32m.   [37mExit Script[32m
echo #########################################[0m
echo [31m[1m!!WARNING!![0m [33m( Disclaimer: Read [?] About / Copyright Section [4mFIRST[0m [33m ) [31m[1m!!WARNING!![0m
echo.
set N=
set /P N=Type a number between (1 - 22), Q, or (?) then press [33mENTER[0m:
if %N%==1 GOTO CLEAN
if %N%==2 GOTO DCLEAN
if %N%==3 GOTO SYSTEM
if %N%==4 GOTO WINFIX
if %N%==5 GOTO IMGREPAIR
if %N%==6 GOTO CHCKDSK
if %N%==7 GOTO HOST
if %N%==8 GOTO DISKC
if %N%==9 GOTO DISKMANAGE
if %N%==10 GOTO NETWORK
if %N%==11 GOTO YTRACEPING
if %N%==12 GOTO SPEEDTEST
if %N%==13 GOTO FDNS
if %N%==14 GOTO RSETNADPT
if %N%==15 GOTO TPORT
if %N%==16 GOTO OPENREL
if %N%==17 GOTO OPENEVENTVWR
if %N%==18 GOTO ACCHECK
if %N%==19 GOTO CCAL
if %N%==20 GOTO GODMODE
if %N%==21 GOTO REBUILDICON
if %N%==22 GOTO WINKEY
if %N%==23 GOTO BATREPORT
if %N%==24 GOTO POWERCON
if %N%==25 GOTO CUNINSTALLER
if %N%==26 GOTO DRIVETREE
if %N%==27 GOTO WINSCAN
if %N%==28 GOTO INSTALLEDPROGRAMS
if %N%==29 GOTO RESTARTINBIOS
if %N%==? GOTO ABOUT
if %N%==Q GOTO QUIT
if %N%==q GOTO QUIT

cls
for /f "tokens=* delims=!:" %%A in ('findstr /b :!: "%~f0"') do @echo(%%A
echo  *Cough* *Cough*
timeout /t 3 /nobreak > NUL
echo  '%N%' is not valid
timeout /t 2 /nobreak > NUL
echo  Please try again
timeout /t 4 /nobreak > NUL
cls
GOTO MENU

REM:| Variable       | Default Value                                                                |
REM:|----------------|------------------------------------------------------------------------------|
REM:| %SystemDrive%  | C:                                                                           |
REM:| %ProgramFiles% | C:\Program Files                                                             |
REM:| %AppData%      | C:\Users\{username}\AppData\Roaming                                          |
REM:| %LocalAppData% | C:\Users\{username}\AppData\Local                                            |
REM:| %UserProfile%  | C:\Users\{username}                                                          |
REM:| %UserName%     | {username}                                                                   |
REM:| %COMPUTERNAME% | {computername}                                                               |
REM:| %PATH%         | C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;{plus program paths} |
REM: Full guide here: https://en.wikipedia.org/wiki/Environment_variable#Windows
REM:|----------------|------------------------------------------------------------------------------|
REM:| /p             | Prompts for confirmation before deleting the specified file.                 |
REM:| /f             | Forces deletion of read-only files.                                          |
REM:| /s             | Deletes specified files from the current directory and all subdirectories.   |
REM:|                | Displays the names of the files as they are being deleted.                   |
REM:| /q             | Specifies quiet mode. You are not prompted for delete confirmation.          |
REM:|----------------|------------------------------------------------------------------------------|

REM #####################################################################################################################################
REM ###################################################### NEW SECTION [1] ##############################################################
REM starts the clean up
:CLEAN
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo Just know, this can take a few min.
timeout /t 1 /nobreak >nul

REM --- Ask about recycle bin ---
set "pdelete="
set /p choice=Do you want me empty your Recycling Bin? [31m^(permanently deleted^)  [33m^[Y/N^][0m:
if /i "%choice%"=="y" set "pdelete=YES"
if /i "%choice%"=="n" set "pdelete=NO"

REM --- Ask about shutdown ---
set "powerc="
set /p choice=Do you want me to shutdown your PC after cleanup? [33m^[Y/N^][0m:
if /i "%choice%"=="y" set "powerc=SHUTDOWN"

echo.
echo Cleanup will begin...
timeout /t 1 /nobreak >nul

set /a deletedFiles=0
set /a deletedDirs=0

REM --- Empty recycle bin ---
if "%pdelete%"=="YES" (
   for %%d in (c d e f g h i j k l m n o p q r s t u v w x y z) do (
     rd /s /q %%d:\$Recycle.bin 2>nul && set /a deletedDirs+=1
   )
   echo Recycle bin emptied.
   echo.
)

REM --- Delete temp files ---
for /f "delims=" %%F in ('dir /a:-d /b /s "%temp%\*" 2^>nul') do (
    del /f /q "%%F" >nul 2>&1 && set /a deletedFiles+=1
)
for /d %%i in ("%temp%\*") do rd /s /q "%%i" && set /a deletedDirs+=1

for /f "delims=" %%F in ('dir /a:-d /b /s "%LocalAppData%\Temp\*" 2^>nul') do (
    del /f /q "%%F" >nul 2>&1 && set /a deletedFiles+=1
)
for /d %%i in ("%LocalAppData%\Temp\*") do rd /s /q "%%i" && set /a deletedDirs+=1

for /f "delims=" %%F in ('dir /a:-d /b /s "%windir%\Temp\*" 2^>nul') do (
    del /f /q "%%F" >nul 2>&1 && set /a deletedFiles+=1
)
for /d %%i in ("%windir%\Temp\*") do rd /s /q "%%i" && set /a deletedDirs+=1

REM --- Prefetch ---
for /f "delims=" %%F in ('dir /a:-d /b /s "%windir%\Prefetch\*" 2^>nul') do (
    del /f /q "%%F" >nul 2>&1 && set /a deletedFiles+=1
)

REM --- Windows Update cache ---
if exist "%windir%\SoftwareDistribution\Download" (
    rd /s /q "%windir%\SoftwareDistribution\Download" && set /a deletedDirs+=1
)
if exist "%SystemRoot%\SoftwareDistribution\DeliveryOptimization" (
    rd /s /q "%SystemRoot%\SoftwareDistribution\DeliveryOptimization" && set /a deletedDirs+=1
)

REM --- Error reports ---
if exist "%ALLUSERSPROFILE%\Microsoft\Windows\WER\ReportQueue" (
    rd /s /q "%ALLUSERSPROFILE%\Microsoft\Windows\WER\ReportQueue" && set /a deletedDirs+=1
)

REM --- Optional big cleanup: Windows.old ---
if exist "%systemdrive%\Windows.old" (
    rd /s /q "%systemdrive%\Windows.old" && set /a deletedDirs+=1
)

echo.
echo Cleaning of junk files is finished!
echo Files deleted : %deletedFiles%
echo Folders removed: %deletedDirs%
timeout /t 2 /nobreak >nul
echo Thank you for using my script.
timeout /t 1 /nobreak >nul
echo.
goto SHUTDOWN

REM ###################################################### NEW SECTION [2] ##############################################################
REM starts the clean up
:DCLEAN
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
timeout /t 1 /nobreak > NUL
echo.
echo Cleaning system junk files, please wait...
timeout /t 1 /nobreak > NUL
echo This can take a few min before you see anything happen.
timeout /t 1 /nobreak > NUL
echo If programs are using the files, those files will not be deleted.
timeout /t 1 /nobreak > NUL
echo.

REM Initialize counters
set "filesDeleted=0"
set "foldersRemoved=0"

REM --- Ask about recycle bin ---
set "pdelete="
set /p choice=Do you want me to empty your Recycling Bin? [31m^(permanently deleted^) [33m^[Y/N^][0m:
if /i "%choice%"=="y" set "pdelete=YES"
if /i "%choice%"=="n" set "pdelete=NO"

REM --- Ask about shutdown ---
set "powerc="
set /p choice=Do you want me to shutdown your PC after cleanup? [33m^[Y/N^][0m:
if /i "%choice%"=="y" set "powerc=SHUTDOWN"

timeout /t 1 /nobreak > NUL
echo.
echo Cleanup will begin.
timeout /t 1 /nobreak > NUL
echo.

REM -------------------------
REM Recycle Bin
if "%pdelete%"=="YES" (
   for %%d in (c d e f g h i j k l m n o p q r s t u v w x y z) do (
     if exist "%%d:\$Recycle.bin" (
        rd /s /q "%%d:\$Recycle.bin" >nul 2>&1
        if not exist "%%d:\$Recycle.bin" set /a foldersRemoved+=1
     )
   )
   echo Recycle bin emptied.
   timeout /t 1 /nobreak > NUL
)
echo.
echo This can take a while, so please, be patient.
REM -------------------------
REM Delete files/folders (all original areas)
for %%F in (%temp%\*.tmp) do del "%%F" /f >nul 2>&1 & set /a filesDeleted+=1
for %%F in (%windir%\prefetch\*.*) do del "%%F" /f >nul 2>&1 & set /a filesDeleted+=1
for %%F in (%windir%\temp\*.*) do del "%%F" /f >nul 2>&1 & set /a filesDeleted+=1
for /d %%D in ("%windir%\temp\*") do rd /s /q "%%D" >nul 2>&1 & set /a foldersRemoved+=1

if exist "%LocalAppData%\temp\*.*" (
  for %%F in (%LocalAppData%\temp\*.*) do del "%%F" /f /s /q >nul 2>&1 & set /a filesDeleted+=1
  for /d %%D in (%LocalAppData%\temp\*.*) do rd /s /q "%%D" >nul 2>&1 & set /a foldersRemoved+=1
)

if exist "%HOMEDRIVE%\*.tmp" del "%HOMEDRIVE%\*.tmp" /f /s /q >nul 2>&1 & set /a filesDeleted+=1
if exist "%HOMEDRIVE%\temp\*.tmp" del "%HOMEDRIVE%\temp\*.tmp" /f /s /q >nul 2>&1 & set /a filesDeleted+=1
if exist "%windir%\prefetch\*.*" del "%windir%\prefetch\*.*" /f /s /q >nul 2>&1 & set /a filesDeleted+=1
if exist "%windir%\temp\*.*" del "%windir%\temp\*.*" /f /s /q >nul 2>&1 & set /a filesDeleted+=1
if exist "%windir%\temp\" rd /s /q "%windir%\temp\" >nul 2>&1 & set /a foldersRemoved+=1
if exist "%windir%\SoftwareDistribution\Download" rd /s /q "%windir%\SoftwareDistribution\Download" >nul 2>&1 & set /a foldersRemoved+=1
if exist "%ALLUSERSPROFILE%\Microsoft\Windows\WER\Reportqueue" rd /s /q "%ALLUSERSPROFILE%\Microsoft\Windows\WER\Reportqueue" >nul 2>&1 & set /a foldersRemoved+=1
echo.
echo [35m[1mSimple clean done, Deep cleaning initiated!!![0m
echo [93m[INFO][0m This will probably take a bit longer to run, so again, be patient.

del /f /s /q %windir%\*.bak >nul 2>&1 & set /a filesDeleted+=1
del /f /s /q %systemdrive%\*.tmp >nul 2>&1 & set /a filesDeleted+=1
echo I'm Still working.
del /f /s /q %systemdrive%\*._mp >nul 2>&1 & set /a filesDeleted+=1
del /f /s /q %systemdrive%\*.log >nul 2>&1 & set /a filesDeleted+=1
del /f /s /q %systemdrive%\*.gid >nul 2>&1 & set /a filesDeleted+=1
echo Trust me, I'm still working. :)
del /f /s /q %systemdrive%\*.chk >nul 2>&1 & set /a filesDeleted+=1
del /f /s /q %systemdrive%\*.old >nul 2>&1 & set /a filesDeleted+=1
del /f /s /q %systemdrive%\recycled\*.* >nul 2>&1 & set /a filesDeleted+=1
del /f /q "%UserProfile%\cookies\*.*" >nul 2>&1 & set /a filesDeleted+=1
del /f /s /q "%UserProfile%\Local Settings\Temporary Internet Files\*.*" >nul 2>&1 & set /a filesDeleted+=1
del /f /s /q "%UserProfile%\Local Settings\Temp\*.*" >nul 2>&1 & set /a filesDeleted+=1
del /f /s /q "%UserProfile%\recent\*.*" >nul 2>&1 & set /a filesDeleted+=1


echo.
echo Cleaning of junk files is finished!
echo Files deleted     : %filesDeleted%
echo Folders removed  : %foldersRemoved%
echo.
timeout /t 2 /nobreak > NUL
echo Thank you for using my script.
timeout /t 1 /nobreak > NUL
echo.
goto SHUTDOWN


REM ###################################################### NEW SECTION [3] ##############################################################
REM shows sytem info
:SYSTEM
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo Please wait... Checking system information.
echo.
REM: Section 1: OS information.
echo [36m============================
echo = OS INFO
echo ============================[0m
systeminfo | findstr /c:"Registered Owner"
systeminfo | findstr /c:"OS Name"
systeminfo | findstr /c:"OS Version"
systeminfo | findstr /c:"System Type"
powershell -NoProfile -Command "$uptime = (Get-Date) - (Get-CimInstance Win32_OperatingSystem).LastBootUpTime; Write-Output ('System Uptime: {0} days' -f [math]::Round($uptime.TotalDays,1))"
echo.
REM: Section 2: Hardware information.
echo [36m============================
echo = HARDWARE INFO
echo ============================[0m
powershell -NoProfile -Command "Get-CimInstance Win32_Processor | Select-Object -ExpandProperty Name"
powershell -NoProfile -Command "Get-CimInstance Win32_BaseBoard | ForEach-Object {Write-Output ('Motherboard: {0} {1}' -f $_.Manufacturer, $_.Product)}"
powershell -NoProfile -Command "Get-CimInstance Win32_BIOS | ForEach-Object {Write-Output ('BIOS Version: {0} ({1})' -f $_.SMBIOSBIOSVersion, $_.ReleaseDate)}"
powershell -NoProfile -Command "$ram = (Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory; Write-Output ('Total RAM: {0}GB' -f [math]::Round($ram/1GB,0))"
powershell -NoProfile -Command "Get-CimInstance Win32_VideoController | Select-Object Name, AdapterRAM | ForEach-Object {Write-Output ('GPU: {0} ({1}GB VRAM)' -f $_.Name, [math]::Round($_.AdapterRAM/1GB,0))}"
echo [93m[INFO][0m The VRAM size can be off due to AdapterRAM in Win32_VideoController does not always report the full dedicated VRAM.
echo.
REM: Section 3: Memory information.
echo [36m============================
echo = MEMORY INFO
echo ============================[0m
powershell -NoProfile -Command ^
"$mem = Get-CimInstance Win32_PhysicalMemory; ^
$counter=1; $total=0; ^
foreach ($m in $mem) { ^
  $sizeGB = [math]::Round($m.Capacity/1GB,0); ^
  $total += $sizeGB; ^
  Write-Output ('DIMM {0} ({1}): {2}GB @ {3}MHz, Manufacturer: {4}' -f $counter, $m.DeviceLocator, $sizeGB, $m.Speed, $m.Manufacturer); ^
  $counter++ ^
}; ^
Write-Output ('Total RAM: {0}GB' -f $total)"

echo You can find more about MemoryType here:
echo https://learn.microsoft.com/en-us/windows/win32/cimwin32prov/win32-physicalmemory
echo.
REM: Section 4: Networking information.
echo [36m============================
echo = NETWORK INFO
echo ============================[0m
powershell -NoProfile -Command "Get-CimInstance Win32_NetworkAdapterConfiguration | Where-Object {$_.IPEnabled} | ForEach-Object { Write-Output ('Adapter: {0}' -f $_.Description); Write-Output ('IP: {0}' -f $_.IPAddress[0]); Write-Output ('MAC: {0}' -f $_.MACAddress); Write-Output '' }"
echo.
ipconfig | findstr IPv4
ipconfig | findstr IPv6
echo.
REM: Section 5: Disk health
echo [36m============================
echo = DISK DRIVES ^& HEALTH STATUS
echo ============================[0m
powershell -NoProfile -Command "Get-PSDrive -PSProvider 'FileSystem' | ForEach-Object {Write-Output ('Drive {0}: {1}GB Free of {2}GB' -f $_.Name, [math]::Round($_.Free/1GB,0), [math]::Round($_.Used/1GB + $_.Free/1GB,0))}"
powershell -NoProfile -Command "Get-PhysicalDisk | Select-Object FriendlyName, OperationalStatus, HealthStatus, @{Name='Size(GB)';Expression={[math]::Round($_.Size/1GB,0)}} | Format-Table -AutoSize"
echo.
:start
set choice=
set /p choice=Would you like me to Export this to a text file?  [33m^[Y/N^][0m:
if NOT '%choice%'=='' set "choice=%choice:~0,1%"
if /i '%choice%'=='y' GOTO YES
if /i '%choice%'=='n' GOTO ADVANCED
if '%choice%'=='' GOTO ADVANCED
echo "%choice%" is not valid
echo.
GOTO start

:YES

echo Exporting System Info...
echo.>"%UserProfile%\SYSTEM-INFO.txt"
REM: Section 1: OS information
echo ============================ >> "%UserProfile%\SYSTEM-INFO.txt"
echo = OS INFO >> "%UserProfile%\SYSTEM-INFO.txt"
echo ============================ >> "%UserProfile%\SYSTEM-INFO.txt"
systeminfo | findstr /c:"Registered Owner" >> "%UserProfile%\SYSTEM-INFO.txt"
systeminfo | findstr /c:"OS Name" >> "%UserProfile%\SYSTEM-INFO.txt"
systeminfo | findstr /c:"OS Version" >> "%UserProfile%\SYSTEM-INFO.txt"
systeminfo | findstr /c:"System Type" >> "%UserProfile%\SYSTEM-INFO.txt"
powershell -NoProfile -Command "$uptime = (Get-Date) - (Get-CimInstance Win32_OperatingSystem).LastBootUpTime; Write-Output ('System Uptime: {0} days' -f [math]::Round($uptime.TotalDays,1))" >> "%UserProfile%\SYSTEM-INFO.txt"
echo. >> "%UserProfile%\SYSTEM-INFO.txt"
REM: Section 2: Hardware information
echo ============================ >> "%UserProfile%\SYSTEM-INFO.txt"
echo = HARDWARE INFO >> "%UserProfile%\SYSTEM-INFO.txt"
echo ============================ >> "%UserProfile%\SYSTEM-INFO.txt"
powershell -NoProfile -Command "Get-CimInstance Win32_BaseBoard | ForEach-Object {Write-Output ('Motherboard: {0} {1}' -f $_.Manufacturer, $_.Product)}" >> "%UserProfile%\SYSTEM-INFO.txt"
powershell -NoProfile -Command "Get-CimInstance Win32_BIOS | ForEach-Object {Write-Output ('BIOS Version: {0} ({1})' -f $_.SMBIOSBIOSVersion, $_.ReleaseDate)}" >> "%UserProfile%\SYSTEM-INFO.txt"
powershell -NoProfile -Command "Get-CimInstance Win32_Processor | Select-Object -ExpandProperty Name" >> "%UserProfile%\SYSTEM-INFO.txt"
REM: Total RAM
powershell -NoProfile -Command "$ram = (Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory; Write-Output ('Total RAM: {0}GB' -f [math]::Round($ram/1GB,0))" >> "%UserProfile%\SYSTEM-INFO.txt"
REM: GPU info (human-readable)
powershell -NoProfile -Command "Get-CimInstance Win32_VideoController | Select-Object Name, AdapterRAM | ForEach-Object {Write-Output ('GPU: {0} ({1}GB VRAM)' -f $_.Name, [math]::Round($_.AdapterRAM/1GB,0))}" >> "%UserProfile%\SYSTEM-INFO.txt"
echo [INFO] The VRAM size can be off due to AdapterRAM in Win32_VideoController >> "%UserProfile%\SYSTEM-INFO.txt"
echo. >> "%UserProfile%\SYSTEM-INFO.txt"
REM: Section 3: Memory information (human-readable DIMMs)
echo ============================ >> "%UserProfile%\SYSTEM-INFO.txt"
echo = MEMORY INFO >> "%UserProfile%\SYSTEM-INFO.txt"
echo ============================ >> "%UserProfile%\SYSTEM-INFO.txt"
powershell -NoProfile -Command "$mem = Get-CimInstance Win32_PhysicalMemory; $counter=1; $total=0; foreach ($m in $mem) { $sizeGB = [math]::Round($m.Capacity/1GB,0); $total += $sizeGB; Write-Output ('DIMM {0} ({1}): {2}GB @ {3}MHz, Manufacturer: {4}' -f $counter, $m.DeviceLocator, $sizeGB, $m.Speed, $m.Manufacturer); $counter++ }; Write-Output ('Total RAM: {0}GB' -f $total)" >> "%UserProfile%\SYSTEM-INFO.txt"
echo You can find more about MemoryType here: >> "%UserProfile%\SYSTEM-INFO.txt"
echo https://learn.microsoft.com/en-us/windows/win32/cimwin32prov/win32-physicalmemory >> "%UserProfile%\SYSTEM-INFO.txt"
echo. >> "%UserProfile%\SYSTEM-INFO.txt"
REM: Section 4: Networking information.
echo ============================ >> "%UserProfile%\SYSTEM-INFO.txt"
echo = NETWORK INFO >> "%UserProfile%\SYSTEM-INFO.txt"
echo ============================ >> "%UserProfile%\SYSTEM-INFO.txt"
powershell -NoProfile -Command "Get-CimInstance Win32_NetworkAdapterConfiguration | Where-Object {$_.IPEnabled} | ForEach-Object { Write-Output ('Adapter: {0}' -f $_.Description); Write-Output ('IP: {0}' -f $_.IPAddress[0]); Write-Output ('MAC: {0}' -f $_.MACAddress); Write-Output '' }" >> "%UserProfile%\SYSTEM-INFO.txt"
echo. >> "%UserProfile%\SYSTEM-INFO.txt"
ipconfig | findstr IPv4 >> "%UserProfile%\SYSTEM-INFO.txt"
ipconfig | findstr IPv6 >> "%UserProfile%\SYSTEM-INFO.txt"
echo. >> "%UserProfile%\SYSTEM-INFO.txt"
REM: Section 5: Disk health
echo ============================ >> "%UserProfile%\SYSTEM-INFO.txt"
echo = DISK DRIVES ^& HEALTH STATUS >> "%UserProfile%\SYSTEM-INFO.txt"
echo ============================ >> "%UserProfile%\SYSTEM-INFO.txt"
powershell -NoProfile -Command "Get-PSDrive -PSProvider 'FileSystem' | ForEach-Object {Write-Output ('Drive {0}: {1}GB Free of {2}GB' -f $_.Name, [math]::Round($_.Free/1GB,0), [math]::Round($_.Used/1GB + $_.Free/1GB,0))}" >> "%UserProfile%\SYSTEM-INFO.txt"
powershell -NoProfile -Command "Get-PhysicalDisk | Select-Object FriendlyName, OperationalStatus, HealthStatus, @{Name='Size(GB)';Expression={[math]::Round($_.Size/1GB,0)}} | Format-Table -AutoSize" >> "%UserProfile%\SYSTEM-INFO.txt"
echo. >> "%UserProfile%\SYSTEM-INFO.txt"
echo -------------------------------------------------------------------------------------------------- >> "%UserProfile%\SYSTEM-INFO.txt"
echo ------------------------------------------- FULL DUMP -------------------------------------------- >> "%UserProfile%\SYSTEM-INFO.txt"
echo -------------------------------------------------------------------------------------------------- >> "%UserProfile%\SYSTEM-INFO.txt"
echo. >> "%UserProfile%\SYSTEM-INFO.txt"
SYSTEMINFO >> "%UserProfile%\SYSTEM-INFO.txt"
echo. >> "%UserProfile%\SYSTEM-INFO.txt"
timeout /t 2 /nobreak > NUL
echo SYSTEM-INFO.txt Exported!
echo.
echo File can be found in your folder^:
echo [33m"%UserProfile%\SYSTEM-INFO.txt"[0m
timeout /t 3 /nobreak > NUL
echo.

:OPENFILE
set choice=
set /p choice=Do you want to view the file now? [33m^[Y/N^][0m:
if NOT '%choice%'=='' set "choice=%choice:~0,1%"
if /i '%choice%'=='y' GOTO OPEN
if /i '%choice%'=='n' GOTO ADVANCED
if '%choice%'=='' GOTO ADVANCED
echo "%choice%" is not valid
echo.
GOTO OPENFILE

:OPEN
echo.
echo Okay, let me open that for you then.
echo Give me 1 sec.
echo.
timeout /t 3 /nobreak > NUL
notepad.exe "%UserProfile%\SYSTEM-INFO.txt"
pause
goto ADVANCED

:ADVANCED
echo.
set choice=
set /p choice= Would you like me to open a more advanced system info? [33m^[Y/N^][0m:
if NOT '%choice%'=='' set "choice=%choice:~0,1%"
if /i '%choice%'=='y' GOTO OPENADVANCED
if /i '%choice%'=='n' GOTO MENU
if '%choice%'=='' GOTO ADVANCED
echo "%choice%" is not valid
echo.
GOTO ADVANCED

:OPENADVANCED
echo.
echo Okay, let me open that for you then.
echo Give me 1 sec.
echo.
timeout /t 1 /nobreak > NUL
msinfo32
pause
goto MENU


REM ###################################################### NEW SECTION [4] ##############################################################
REM Windows 11 Check and repair
:WINFIX
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo We are about to perform a Windows 11 check that will see if any
echo files are bad, and if they are, it will attempt to fix them. This is
echo a default Windows checker that is found in Windows 11.
echo.
echo [31mNote:[0m
echo This will not delete any of your programs or files.
echo This also can take a while...
timeout /t 5 /nobreak
sfc /scannow
pause
goto MENU

REM ###################################################### NEW SECTION [5] ##############################################################
:IMGREPAIR
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo Just note, You don't need to have any errors or have run anything prior to this, I have these checks
echo in for more of a warning/information for you. These are all safe systems that come built in Windows 11.
echo If you really wanted to, you can just answer [36mYes (Y)[0m to everything.
echo.
echo.
echo Have you run the Windows 11 Check and repair, ^[4^], first?
echo If the answer is [31mNo[0m, then I^'ll send you to option ^[4^] first.
        set choice=
        set pingsite=
        set /p choice=So, did you run it? [33m^[Y/N^][0m:
        if NOT '%choice%'=='' set "choice=%choice:~0,1%"
        if /i '%choice%'=='y' GOTO IMGRCHECK
        if /i '%choice%'=='n' GOTO WINFIX
        if '%choice%'=='' GOTO MENU
        echo "%choice%" is not valid
        echo.

:IMGRCHECK
cls
echo.
echo On Windows 11, Deployment Image Servicing and Management (DISM) is a tool designed
echo for network administrators to prepare, modify, and repair system images, including the
echo Windows Recovery Environment, Windows Setup, and Windows PE (WinPE). However, anyone
echo can also use the tool to fix common problems with the hidden recovery image on your computer.
echo.
echo Usually, when your device is experiencing performance issues, doesn't start correctly, or
echo you're troubleshooting errors, you can use the System File Checker tool to scan, detect, and
echo replace corrupted or missing system files using the locally available recovery image.
echo.
echo However, if the replacement files inside the Windows 11 image are damaged in any way, the
echo SFC tool, (Option ^[4^], Windows 11 Check and repair), won't work. In this particular situation,
echo you can use the system to scan and repair the "install.wim" image, which you can then use with
echo SFC, (Option ^[4^], Windows 11 Check and repair), to repair your installation.
echo.
echo.
echo We will start our 2 phase system here. This can take some time so be patient.
echo.
echo Would you like to proceed?
echo If the answer is [31mNo[0m, then I^'ll send you to Main Menu.
        set choice=
        set pingsite=
        set /p choice=So, you ready to proceed? [33m^[Y/N^][0m:
        if NOT '%choice%'=='' set "choice=%choice:~0,1%"
        if /i '%choice%'=='y' GOTO IMGRCHECKY
        if /i '%choice%'=='n' GOTO MENU
        if '%choice%'=='' GOTO MENU
        echo "%choice%" is not valid
        echo.
pause

:IMGRCHECKY
cls
echo.
echo  Lets start off with running an advanced scan to determine if the Windows 11 Image has issues.
timeout /t 2 /nobreak > NUL
echo.
echo -----------------------------------[ Starting Health Check ]----------------------------------------
echo.
DISM /Online /Cleanup-Image /ScanHealth
echo.
echo -----------------------------------[ Finished Health Check ]----------------------------------------
echo.
timeout /t 2 /nobreak > NUL
echo.
echo Now, looking at that output above, does it say/or show it [33mhas any erros or component corruption[0m
echo If you see the below message, that is a good sign and you will answer No, (N), for the below question.
echo.
echo [35m[==========================100.0%==========================] No component store corruption detected.[0m
echo If the answer is [31mNo[0m, then I^'ll send you to Main Menu.
        set choice=
        set pingsite=
        set /p choice=was there errors? [33m^[Y/N^][0m:
        if NOT '%choice%'=='' set "choice=%choice:~0,1%"
        if /i '%choice%'=='y' GOTO IMGRCHECKF
        if /i '%choice%'=='n' GOTO MENU
        if '%choice%'=='' GOTO MENU
        echo "%choice%" is not valid
        echo.
pause


:IMGRCHECKF
cls
echo.
echo Okay, so we are in phase 2 of this two step process. If you are here, then I am
echo guessing that there was an issue with your Windows 11 image and we need to repair that.
echo If I am right, then please confirm one last time and then we will proceed.
echo If the answer is [31mNo[0m, then I^'ll send you to Main Menu.
echo.
timeout /t 5 /nobreak > NUL
        set choice=
        set pingsite=
        set /p choice=So, are you positive you want to proceed. [33m^[Y/N^][0m:
        if NOT '%choice%'=='' set "choice=%choice:~0,1%"
        if /i '%choice%'=='y' GOTO IMGRCHECKFC
        if /i '%choice%'=='n' GOTO MENU
        if '%choice%'=='' GOTO MENU
        echo "%choice%" is not valid
        echo.
pause

:IMGRCHECKFC
cls
echo.
echo Okay, before we start, I like to note that while the command is running, it's expected to see
echo the process get stuck at 20 or 40 percent. After a few minutes, (or longer), the process will
echo complete successfully. I have seen this get stuck for over an hour+ before.
echo.
timeout /t 5 /nobreak > NUL
echo [31m[1m!!WARNING!![0m [33m( Disclaimer: Do not close this out, just let it run... [33m ) [31m[1m!!WARNING!![0m
echo.
timeout /t 2 /nobreak > NUL
echo -----------------------------------[ Starting Health Check ]----------------------------------------
echo.
DISM /Online /Cleanup-Image /RestoreHealth
echo.
echo -----------------------------------[ Finished Health Check ]----------------------------------------
echo.
timeout /t 5 /nobreak > NUL
        set choice=
        set pingsite=
        set /p choice=Would you like to do some cleanup? [33m^[Y/N^][0m:
        if NOT '%choice%'=='' set "choice=%choice:~0,1%"
        echo [33m!!Warning^: All existing service packs and updates cannot be uninstalled after this command is completed.
        echo This will not block the uninstallation of future service packs or updates!![0m
        if /i '%choice%'=='y' GOTO IMGRCLEANUP
        if /i '%choice%'=='n' GOTO MENU
        if '%choice%'=='' GOTO MENU
        echo "%choice%" is not valid
        echo.
pause

:IMGRCLEANUP
cls
echo.
echo Okay, this may take a few min, but I am going to first analyze the component store, then we will cleanup and reset the base.
echo.
timeout /t 2 /nobreak > NUL
echo -----------------------------------[ Analyze Component Store ]----------------------------------------
echo.
Dism.exe /Online /Cleanup-Image /AnalyzeComponentStore
echo.
echo -----------------------------------[ Finished Analyzing Component Store ]----------------------------------------
echo.
echo Starting the next section in 5 seconds
timeout /t 5 /nobreak > NUL
cls
echo.
echo -----------------------------------[ Starting Component Cleanup & Resetting Base ]----------------------------------------
echo.
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
echo.
echo -----------------------------------[ Finished Component Cleanup & Resetting Base ]----------------------------------------
echo.
timeout /t 3 /nobreak > NUL
cls
echo.
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo Your Image Cleanup is completed.
pause
GOTO MENU

REM ###################################################### NEW SECTION [6] ##############################################################
:CHCKDSK
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
set cdmess=
set rochoice=
echo [31mPlease read all of this if this is new to you.[0m
echo.
echo [1m[36mWhat is Check Disk and is it safe for my HD/SSD?[0m
echo.
echo Windows has a handy feature called CHKDSK ^(Check Disk^) that you can use to analyse hard drive errors
echo and run repairs automatically. It can be a lifesaver for dealing with ^(non-physical^) hard drive faults.
echo.
echo A glitchy or corrupted hard drive can create a moment of panic. The potential for lost files is heartbreaking,
echo and hard drive failure is one of the top reported computer faults. CHKDSK won't be of much help if you're
echo dealing with a physically damaged hard drive ^(eg after dropping your laptop^), but it can be a great tool for
echo correcting minor errors.
echo.
echo CHKDSK works for both older spinning hard drives and SSDs, and it [33mcan't[0m harm your computer.
echo.
echo -----------------------------------------------------------------------------------------------------
echo.
echo [1m[36mShould I run this in ^"read only^" mode?[0m
echo.
echo Short answer, yes. At least for the first run to check to see everything is good.
echo.
echo I would do the read only since you can't actually check and fix the drive while the drive is being used by
echo another program, like windows. So by doing the read only, you can check the drives without trying to fix it
echo first. If something is found, then you can run the other check which will ask you if you like to schedule
echo a check after the next start up. ^([33mThat option you would select Y for yes.[0m^).
echo.
echo If you run the read only and you see this message above the readout of your total disk space, files, etc...
echo [36mWindows has scanned the file system and found no problems.
echo No further action is required.[0m
echo.
echo Then, you don't need to worry about doing the non-readon only on that drive. But, if says there are errors,
echo then you would want to do the full check and repair.
echo.
echo You may get first a message like:
echo [33mChkdsk cannot run because the volume is in use by another
echo process.  Chkdsk may run if this volume is dismounted first.
echo ALL OPENED HANDLES TO THIS VOLUME WOULD THEN BE INVALID.
echo Would you like to force a dismount on this volume? (Y/N)[0m
echo.
echo Now, if that is on your primary HD with your OS on it, then you can't since you can't temporaly dismount
echo the drive that Windows is on. So you would just select N which then should bring you to the message to schedule
echo a check on next restart. If this is for a secondary drive that you just have files on, then you can say ^(Y^).
echo Overall, this should only be done if the the read only version showed some errors.
pause
GOTO CHCKDSK1

:CHCKDSK1
cls
echo.
if "%cdmess%"=="1" echo Now that the previous test is done on drive %Drive%:,
if "%cdmess%"=="2" echo I see that you just came from the non ^"read only^" on drive %Drive%:, are you looking to
set choice=
if "%cdmess%"=="" set /p choice=Would you like to run this in ^"read only^"? [33m^[Y/N^][0m:
if "%cdmess%"=="1" set /p choice=would you also like to run this next test in ^"read only^"? [33m^[Y/N^][0m:
if "%cdmess%"=="2" set /p choice=run this next test in ^"read only^"? [33m^[Y/N^][0m:
if NOT "%choice%"=="" set "choice=%choice:~0,1%"
if /i "%choice%"=="y" set "rochoice=1" & GOTO CHCKDSK2
if /i "%choice%"=="n" set "rochoice=0" & GOTO CHCKDSK2
if "%choice%"=="" GOTO CHCKDSK1
echo "%choice%" is not valid
echo.
GOTO CHCKDSK1

:CHCKDSK2
&SetLocal EnableExtensions EnableDelayedExpansion
set cdmess=
cls
if "%rochoice%"=="0" (
  echo [31m[1m^[FIX MODE^][0m
) else (
  echo [32m[1m^[READ ONLY MODE^][0m
)
echo.
echo Detecting what drive letters you have.
timeout /t 1 /nobreak > NUL
echo One second please...
timeout /t 3 /nobreak > NUL
echo.
set "Drives="
for /f %%A in ('powershell -NoProfile -Command "Get-Volume | Where-Object {$_.DriveLetter} | ForEach-Object {($_.DriveLetter).ToString().Trim().ToUpper()}"
') do ( set "Drives=!Drives!%%A" )

REM: choose drive letter
echo completed scan for available drives.
timeout /t 1 /nobreak > NUL
choice /C %Drives% /M "Please select a drive you like to test: "
set /A "Inp=%Errorlevel%,Pnt=Inp-1"
if %Inp% equ 0   Echo aborted & pause & exit /B 1
if %Inp% equ 255 Echo aborted & pause & exit /B 1
set "Drive=!Drives:~%Pnt%,1!"
REM: funtion to run after drive is selected.
echo.
timeout /t 1 /nobreak > NUL
echo This can take a few min.
timeout /t 2 /nobreak > NUL
echo Please don't close while this is running.
timeout /t 3 /nobreak > NUL
cls

if "%rochoice%"=="0" (
echo You may see a message pertaining to dismounting the drive or scheduling a
echo test for next restart. If you don't know what to do, answer [31mN[0m and go back
echo and read the info on the first page after you selected #6 from the menu.
) ELSE (
echo You may see a message like:
echo [33mWARNING!  /F parameter not specified.
echo Running CHKDSK in read-only mode.[0m
echo.
echo Just ignore that, that is normal for read only mode.
echo What you want to see is this:
echo [36mWindows has scanned the file system and found no problems.
echo No further action is required.[0m
echo.
timeout /t 2 /nobreak > NUL
echo ------------------------^[ Performing Test ^]------------------------
)
echo.
timeout /t 3 /nobreak > NUL

if "%rochoice%"=="0" (
chkdsk %Drive%: /F
set "cdmess=2"
) ELSE (
chkdsk %Drive%:
set "cdmess=1"
)
echo.
Goto CHCKDSK3


:CHCKDSK3
echo.
set choice=
set /p choice=Would you like to run this again for a different drive? [33m^[Y/N^][0m:
if NOT "%choice%"=="" set "choice=%choice:~0,1%"
if /i "%choice%"=="y" GOTO CHCKDSK1
if /i "%choice%"=="n" GOTO MENU
if "%choice%"=="" GOTO CHCKDSK3
echo "%choice%" is not valid
echo.
GOTO CHCKDSK3


REM ###################################################### NEW SECTION [7] ##############################################################
:HOST
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo.
echo Let me open the Host for you.
timeout /t 3 /nobreak > NUL
echo.
echo Be careful on what you edit in this file.
timeout /t 1 /nobreak > NUL
notepad %windir%\system32\drivers\etc\hosts
pause
goto MENU

REM ###################################################### NEW SECTION [8] ##############################################################
:DISKC
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo Disk Cleanup Options:
echo.
echo 1. Open old Disk Cleanup (cleanmgr.exe)
echo 2. Open new Storage Sense (Settings)
echo 3. Open both
echo 4. Go To Main Menu
echo.
choice /c 1234 /n /m "Select an option [1-3]: "
set "option=%errorlevel%"

if "%option%"=="1" (
    echo Opening old Disk Cleanup...
    timeout /t 1 /nobreak > NUL
    %windir%\SYSTEM32\cleanmgr.exe
)

if "%option%"=="2" (
    echo Opening new Storage Sense...
    timeout /t 1 /nobreak > NUL
    start ms-settings:storagesense
)

if "%option%"=="3" (
    echo Opening both Disk Cleanup and Storage Sense...
    timeout /t 1 /nobreak > NUL
    %windir%\SYSTEM32\cleanmgr.exe
    start ms-settings:storagesense
)

if "%option%"=="4" (
    goto MENU
)
pause
goto MENU


REM ###################################################### NEW SECTION [9] ##############################################################
:DISKMANAGE
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo Disk Management Options:
echo.
echo 1. Open old Disk Management (diskmgmt.msc)
echo 2. Open new Disk ^& Volumes (Settings)
echo 3. Open both
echo 4. Go To Main Menu
echo.
choice /c 1234 /n /m "Select an option [1-4]: "
set "option=%errorlevel%"

if "%option%"=="1" (
    echo Opening old Disk Management...
    timeout /t 1 /nobreak > NUL
    start /wait diskmgmt.msc
    echo Disk Management has been closed
)

if "%option%"=="2" (
    echo Opening new Disk ^& Volumes...
    timeout /t 1 /nobreak > NUL
    start ms-settings:disksandvolumes
)

if "%option%"=="3" (
    echo Opening both Disk Management and Disk ^& Volumes...
    timeout /t 1 /nobreak > NUL
    start /wait diskmgmt.msc
    start ms-settings:disksandvolumes
    echo Disk Management has been closed
)

if "%option%"=="4" (
    goto MENU
)

pause
goto MENU


REM ###################################################### NEW SECTION [10] ##############################################################
:NETWORK
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo Would you like to use Google for the ping?
echo If the answer is [31mNo[0m, then we^'ll  use Cloudflare instead.
        set choice=
        set pingsite=
        set /p choice=So, use Google to the ping? [33m^[Y/N^][0m:
        if NOT '%choice%'=='' set "choice=%choice:~0,1%"
        if /i '%choice%'=='y' set "pingsite=Google"
        if /i '%choice%'=='n' set "pingsite=Cloudflare"
        if '%choice%'=='' set "pingsite=Google"
        echo "%choice%" is not valid
        echo.
cls
REM Lets check to see the network details and then ping & traceroute to google.com
REM View network connection details
echo.
set pingip=
if "%pingsite%"=="Google" (
  set "pingip=8.8.8.8"
) ELSE (
  set "pingip=1.1.1.1"
)

echo -----------------------------------[ Network Info ]----------------------------------------
ipconfig /all
echo.
echo.
timeout /t 2 /nobreak > NUL
echo -------------------------------------[ Pinging %pingsite% ]-------------------------------------------
ping %pingip% -n 1 -w 3000  > NUL
if errorlevel 1 (
   echo [31m[1m Not connected to internet
   echo  Please check your internet connection and try again.[0m
   echo.
   pause
   GOTO MENU
   )
REM Check if google.com is reachable
ping %pingip%
echo.
echo.
echo ------------------------------------[ Traceroute to %pingsite% ]-----------------------------------------
REM Run a traceroute to check the route to google.com
tracert %pingip%

:PTSAVE
echo.
set choice=
set /p choice=Would you like me to Export this to a text file?  [33m^[Y/N^][0m:
if NOT '%choice%'=='' set "choice=%choice:~0,1%"
if /i '%choice%'=='y' GOTO NYES
if /i '%choice%'=='n' GOTO TRACEPING
if '%choice%'=='' GOTO TRACEPING
echo "%choice%" is not valid
timeout /t 2 > NUL
echo.
GOTO PTSAVE

:NYES

echo Okay, I will export this to a file.
echo This can take a min or two.
REM View network connection details
echo. >  "%UserProfile%\Network_Results.txt"
echo -----------------------------------[ Network Info ]---------------------------------------- >>  "%UserProfile%\Network_Results.txt"
ipconfig /all >>  "%UserProfile%\Network_Results.txt"
REM Check if Google.com is reachable
echo. >>  "%UserProfile%\Network_Results.txt"
echo. >>  "%UserProfile%\Network_Results.txt"
echo -------------------------------------[ Pinging %pingsite% ]------------------------------------------- >>  "%UserProfile%\Network_Results.txt"
ping %pingip% >> "%UserProfile%\Network_Results.txt"
echo. >>  "%UserProfile%\Network_Results.txt"
echo. >>  "%UserProfile%\Network_Results.txt"
echo ------------------------------------[ Traceroute to %pingsite% ]----------------------------------------- >>  "%UserProfile%\Network_Results.txt"
REM Run a traceroute to check the route to Google.com
tracert %pingip% >> "%UserProfile%\Network_Results.txt"
    timeout /t 3 /nobreak > NUL
    echo.
    echo File can be found in your folder^:
    echo [33m"%UserProfile%\Network_Results.txt"[0m
    timeout /t 3 /nobreak > NUL
    echo.
        :NOPENFILE
        set choice=
        set /p choice=Do you want to view the file now?  [33m^[Y/N^][0m:
        if NOT '%choice%'=='' set "choice=%choice:~0,1%"
        if /i '%choice%'=='y' GOTO NOPEN
        if /i '%choice%'=='n' GOTO MENU
        if '%choice%'=='' GOTO MENU
        echo "%choice%" is not valid
        echo.
        GOTO NOPENFILE

        :NOPEN
          echo.
          echo Okay, let me open that for you then.
          echo Give me 1 sec.
          echo.
          timeout /t 3 /nobreak > NUL
          notepad.exe "%UserProfile%\Network_Results.txt"
        pause
        goto MENU
pause
goto MENU

REM Here, lets see if you like to do a custom trace/ping to a specified URL/IP.
 :TRACEPING
    echo.
    set choice=
    set /p choice=Would you like to ping/traceroute to a custom URL/IP?  [33m^[Y/N^][0m:
    if NOT '%choice%'=='' set "choice=%choice:~0,1%"
    if /i '%choice%'=='y' GOTO YTRACEPING
    if /i '%choice%'=='n' GOTO MENU
    if '%choice%'=='' GOTO MENU
    echo "%choice%" is not valid
    echo.
   GOTO TRACEPING

REM ###################################################### NEW SECTION [11] ##############################################################
:YTRACEPING
cls
set "address="
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
:ASKADDR
set /p address="Type the URL/IP you like to ping/traceroute: "
rem Trim any surrounding spaces
for /f "tokens=* delims= " %%A in ("%address%") do set "address=%%A"

if "%address%"=="" (
    echo.
    echo [31mYou must enter a valid URL or IP.[0m
    echo.
    goto ASKADDR
)

timeout /t 1 /nobreak > NUL
echo [33mOkay, pinging %address% then doing a traceroute.[0m
timeout /t 3 /nobreak > NUL
echo.
echo.
echo ----------------------------------[Pinging address]--------------------------------------
ping %address%
timeout /t 1 /nobreak > NUL
echo.
echo.
echo ------------------------------------[Traceroute]-----------------------------------------
timeout /t 1 /nobreak > NUL
tracert %address%
echo.


:CPTSAVE
echo.
set choice=
set /p choice=Would you like me to Export this to a text file?  [33m^[Y/N^][0m:
if NOT '%choice%'=='' set "choice=%choice:~0,1%"
if /i '%choice%'=='y' GOTO PTYES
if /i '%choice%'=='n' GOTO MENU
if '%choice%'=='' GOTO MENU
echo "%choice%" is not valid
echo.
GOTO CPTSAVE

:PTYES

echo Okay, I will export this to a file.
echo This can take a min or two.
REM Ping
echo. >  "%UserProfile%\Ping_Traceroute.txt"
echo ----------------------------------[Pinging address]-------------------------------------- >>  "%UserProfile%\Ping_Traceroute.txt"
ping %address% >>  "%UserProfile%\Ping_Traceroute.txt"
echo. >>  "%UserProfile%\Ping_Traceroute.txt"
echo. >>  "%UserProfile%\Ping_Traceroute.txt"
echo ------------------------------------[Traceroute]----------------------------------------- >>  "%UserProfile%\Ping_Traceroute.txt"
REM Traceroute
tracert %address% >> "%UserProfile%\Ping_Traceroute.txt"
timeout /t 3 /nobreak > NUL
echo.

:PTOPENFILE
set choice=
set /p choice=Do you want to view the file now?  [33m^[Y/N^][0m:
if NOT '%choice%'=='' set "choice=%choice:~0,1%"
if /i '%choice%'=='y' GOTO PTOPEN
if /i '%choice%'=='n' GOTO MENU
if '%choice%'=='' GOTO MENU
echo "%choice%" is not valid
echo.
GOTO PTOPENFILE

:PTOPEN
echo.
echo Okay, let me open that for you then.
echo Give me 1 sec.
echo.
timeout /t 3 /nobreak > NUL
notepad.exe "%UserProfile%\Ping_Traceroute.txt"
pause
goto MENU

REM ###################################################### NEW SECTION [12] ##############################################################
:SPEEDTEST
cls
setlocal
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo This test uses the Speedtest CLI from Ookla via their public download URL,
echo but without installing it. It just downloads the .exe to a temp folder, runs it, and deletes it after.
echo.
echo If you are okay with that, then press Y and we will begin your speed test.
echo.
:SPEEDTESTCONFIRM
set /p proceed=Do you want to continue?  [33m^[Y/N^][0m:
if NOT "%proceed%"=="" set "proceed=%proceed:~0,1%"
if /i "%proceed%"=="N" goto MENU
if /i "%proceed%"=="Y" goto SPEEDTESTEXPORT
if "%proceed%"=="" goto SPEEDTESTCONFIRM
echo "%proceed%" is not valid
goto SPEEDTESTCONFIRM

:SPEEDTESTEXPORT
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo When you run this script, you will be given a URL to your results page if you like to
echo visit it. You will need to highlight the URL and press CTRL+C to copy the URL.
echo.
set "choice="
set /p choice=Would you also like to save your results to a text file?  [33m^[Y/N^][0m:
if not "%choice%"=="" set "choice=%choice:~0,1%"
if /i "%choice%"=="y" set "stexport=save" & goto SPEEDTESTY
if /i "%choice%"=="n" set "stexport=" & goto SPEEDTESTY
echo.
echo [31m[1mI'm sorry, but you must input a valid option.[0m
echo.
goto SPEEDTESTEXPORT

:SPEEDTESTY
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
if "%stexport%"=="save" (
  setlocal EnableDelayedExpansion
)
set "TMPDIR=%TEMP%\speedtest"
if not exist "%TMPDIR%" mkdir "%TMPDIR%"

if "%stexport%"=="save" (
    set "LOGDIR=%USERPROFILE%\Documents\SpeedTest_Results"
    if not exist "!LOGDIR!" mkdir "!LOGDIR!"
)

echo Downloading Speedtest CLI...
powershell -Command ^
"Invoke-WebRequest -Uri 'https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-win64.zip' -OutFile '%TMPDIR%\speedtest.zip'"

powershell -Command ^
"Expand-Archive -Path '%TMPDIR%\speedtest.zip' -DestinationPath '%TMPDIR%' -Force"

echo Running speed test...
if "%stexport%"=="save" (
  echo.
  echo This can take a min...
  echo [33m^(Because we are saving to a file, the animation of the test is hidden.^)[0m
  echo.
)
if "%stexport%"=="save" (
    for /f %%I in ('powershell -NoProfile -Command "Get-Date -Format \"yyyy-MM-dd_HH-mm-ss\""') do set "dt=%%I"
    set "LOGFILE=!LOGDIR!\speedtest_!dt!.txt"

    REM Run speedtest and save to file, then display the results
    "%TMPDIR%\speedtest.exe" > "!LOGFILE!"
    type "!LOGFILE!"
) ELSE (
    "%TMPDIR%\speedtest.exe"
)
REM Lets get rid of the temp file
rd /s /q "%TMPDIR%"

echo.
echo Press Ctrl + Left Click to open link in browser.
if "%stexport%"=="save" (
REM End local scope before any goto operations
endlocal & set "LOGFILE=%LOGFILE%"
    timeout /t 2 /nobreak > NUL
    echo.
    echo [33mLog saved to: [96m"%LOGFILE%"[0m:
)
timeout /t 3 /nobreak > NUL
if "%stexport%"=="save" (
  GOTO STOPSTFILE
) ELSE (
  pause
  GOTO MENU
)
  :STOPSTFILE
    set "choice="
    set /p choice=Would you like to view the file now?  [33m^[Y/N^][0m:
    if not "%choice%"=="" set "choice=%choice:~0,1%"
    if /i "%choice%"=="y" goto OPENSTFILE
    if /i "%choice%"=="n" goto MENU
    echo.
    echo [31m[1mI'm sorry, but you must input a valid option.[0m
    echo.
  GOTO STOPSTFILE

  :OPENSTFILE
    echo.
    echo Okay, let me open that for you then.
    echo Give me 1 sec.
    echo.
    timeout /t 3 /nobreak > NUL
    notepad.exe "%LOGFILE%"
  pause
  goto MENU

REM ###################################################### NEW SECTION [13] ##############################################################
:FDNS
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo Starting of flushing the DNS Resolver Cache
timeout /t 1 /nobreak > NUL
GOTO FDNS2

:FDNS2
echo After I am done clearing your PC cache, would you like me to
:ASKDHCP
set "choice="
set /p choice=Dump and renew your DHCP assigned addresses?  [33m^[Y/N^][0m:
if not "%choice%"=="" set "choice=%choice:~0,1%"
if /i "%choice%"=="y" set "addrenew=RENEW" & goto FDNS3
if /i "%choice%"=="n" set "addrenew=" & goto FDNS3

echo.
echo [31m[1mI'm sorry, but you must input a valid option.[0m
echo.
goto ASKDHCP


:FDNS3
echo.
echo Flushing the DNS Resolver Cache...
timeout /t 1 /nobreak > NUL
ipconfig /flushdns
timeout /t 1 /nobreak > NUL
goto RENEW

:RENEW
if "%addrenew%"=="RENEW" (
    timeout /t 1 /nobreak > NUL
    echo.
    echo Lets release your address then renew it:
    timeout /t 2 /nobreak > NUL
    ipconfig /release
    echo.
    echo Address has been released. Lets renew it now.
    echo.
    timeout /t 1 /nobreak >Nul
    ipconfig /renew
    echo.
    echo Renewed and done.
    pause
    goto MENU
) ELSE (
    pause
    goto MENU
)


REM ###################################################### NEW SECTION [14] ##############################################################
:RSETNADPT
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo This will reset all network adapters, disconnecting you temporarily.
echo It will reset TCP/IP, Winsock, release/renew IP, and flush DNS.
echo.
echo If you proceed, we will create a restore point, then proceed to reset the network adaptors.
echo.
:RSETNADPTYN
set /p proceed=Do you want to continue? (Y/N):
if NOT "%proceed%"=="" set "proceed=%proceed:~0,1%"
if /i "%proceed%"=="N" goto MENU
if /i "%proceed%"=="Y" goto RSETNADPTY
if "%proceed%"=="" goto RSETNADPTYN
echo "%proceed%" is not valid
goto RSETNADPTYN

:RSETNADPTY
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo Lets create a system restore post first.
timeout /t 1 /nobreak > NUL
cls
powershell -Command "Checkpoint-Computer -Description 'Network Reset Backup' -RestorePointType 'MODIFY_SETTINGS'"
timeout /t 5 /nobreak > NUL
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo Restore point created.
timeout /t 1 /nobreak > NUL
echo Phase 2 about to start...
timeout /t 2 /nobreak > NUL
echo Starting the reset.
netsh int ip reset
netsh winsock reset
ipconfig /release
ipconfig /renew
ipconfig /flushdns
echo.
echo Network reset complete. You may need to restart your computer.
echo A restart is the safest advice to avoid edge-case problems.
:RSETNADPTRESTART
set /p restartyn=Do you want to continue? (Y/N):
if NOT '%restartyn%'=='Y' set "restartyn=%restartyn:~0,1%"
if /i "%restartyn%"=="N" goto NORESTART
if /i "%restartyn%"=="Y" goto YESRESTART
if "%restartyn%"=="" goto RSETNADPTRESTART
echo "%restartyn%" is not valid
goto RSETNADPTRESTART

:YESRESTART
timeout /t 1 /nobreak > NUL
echo.
echo Attempting to restart your computer in 5 seconds...
timeout /t 5 /nobreak > NUL
shutdown /r /f /t 0

:NORESTART
timeout /t 1 /nobreak > NUL
echo.
echo Okay, some programs or services (VPNs, certain network-dependent apps)
echo might not recognize the changes until after a reboot.
timeout /t 5 /nobreak > NUL
echo Redirecting you to the menu...
timeout /t 2 /nobreak > NUL
GOTO MENU


REM ###################################################### NEW SECTION [15] ##############################################################
:TPORT
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
REM Lets check to see what ports are listening and what not.
echo.
echo -----------------------------------[ Full Active Port Listing ]----------------------------------------
netstat -a
echo.

:PORTSAVE
echo.
set choice=
set /p choice=Would you like me to Export this to a text file?  [33m^[Y/N^][0m:
if NOT '%choice%'=='' set "choice=%choice:~0,1%"
if /i '%choice%'=='y' GOTO PORTYES
if /i '%choice%'=='n' GOTO MENU
if '%choice%'=='' GOTO MENU
echo "%choice%" is not valid
echo.
GOTO PORTSAVE

:PORTYES
echo Okay, I will export this to a file.
echo This can take a min or two.
echo. >  "%UserProfile%\Port_Test_Results.txt"
echo -----------------------------------[ Full Active Port Listing ]---------------------------------------- >>  "%UserProfile%\Port_Test_Results.txt"
netstat -a >>  "%UserProfile%\Port_Test_Results.txt"
echo. >>  "%UserProfile%\Port_Test_Results.txt"
    timeout /t 3 /nobreak > NUL
    echo.
    echo File can be found in your folder^:
    echo [33m"%UserProfile%\Port_Test_Results.txt"[0m
    timeout /t 3 /nobreak > NUL
    echo.
        :PORTOPENFILE
        set choice=
        set /p choice=Do you want to view the file now?  [33m^[Y/N^][0m:
        if NOT '%choice%'=='' set "choice=%choice:~0,1%"
        if /i '%choice%'=='y' GOTO OPENPFILE
        if /i '%choice%'=='n' GOTO MENU
        if '%choice%'=='' GOTO MENU
        echo "%choice%" is not valid
        echo.
        GOTO PORTOPENFILE

        :OPENPFILE
          echo.
          echo Okay, let me open that for you then.
          echo Give me 1 sec.
          echo.
          timeout /t 3 /nobreak > NUL
          notepad.exe "%UserProfile%\Port_Test_Results.txt"
        pause
        goto MENU
pause
goto MENU

REM ###################################################### NEW SECTION [16] ##############################################################
REM Open Reliability Monitor
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
:OPENREL
cls
echo.
echo Opening Reliability Monitor,
timeout /t 1 /nobreak > NUL
echo This may take a few seconds
timeout /t 1 /nobreak > NUL
perfmon /rel
timeout /t 2 /nobreak > NUL
GOTO MENU


REM ###################################################### NEW SECTION [17] ##############################################################
REM Open Event Viewer
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
:OPENEVENTVWR
cls
echo.
echo Opening Event Viewer,
timeout /t 1 /nobreak > NUL
echo This may take a few seconds
timeout /t 1 /nobreak > NUL
eventvwr
timeout /t 2 /nobreak > NUL

GOTO MENU


REM ###################################################### NEW SECTION [18] ##############################################################
REM Auto Clean system for Windows, (on boot). Creates a file in the Startup folder.
:ACCHECK
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo If you are here, then you are either looking to create or remove the AutoClean temp
echo script that runs on Windows startup. What this file does, is that it removes any temp files that
echo may be on your Windows PC when it starts. Just know, you may see a cmd prompt popup
echo on startup and your PC can take a few seconds longer to start.
timeout /t 3 /nobreak > NUL
echo.
echo We are doing a check to see if you have the AutoClean.bat file already.
timeout /t 2 /nobreak > NUL
echo.
if exist "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\AutoClean.bat" (
    echo [32mFile does exist[0m.
    goto DACYN
) else (
    echo [31mFile doesn't exist[0m.
    echo.
    goto ACYN
)

:ACYN
echo.
set choice=
set /p choice=Would you like to create a AutoClean.bat file to run at Windows startup?  [33m^[Y/N^][0m:
if NOT '%choice%'=='' set "choice=%choice:~0,1%"
if /i '%choice%'=='y' GOTO CREATEAC
if /i '%choice%'=='n' GOTO MENU
if '%choice%'=='' GOTO MENU
echo "%choice%" is not valid
echo.
pause

:CREATEAC
echo Creating AutoClean.bat in the folder:
echo [33m%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\[0m
timeout /t 2 /nobreak > NUL
echo This will take a few seconds.
timeout /t 2 /nobreak > NUL
  cd "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\"
  type nul > "AutoClean.bat"
  del /q /f "%temp%\*.*"
  for /d %%D in ("%temp%\*") do rd "%%D" /s /q 2>nul
echo.
timeout /t 2 /nobreak > NUL
if exist "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\AutoClean.bat" (
    echo File created.
    echo Next time you restart your PC, this script will go into action.
) else (
    echo [1m[31m**Error**[0m Something went wrong and the file was not created.
)
pause
GOTO MENU

:DACYN
echo.
set choice=
set /p choice=Would you like to delete the AutoClean.bat file that runs at Windows startup?  [33m^[Y/N^][0m:
if NOT '%choice%'=='' set "choice=%choice:~0,1%"
if /i '%choice%'=='y' GOTO DELETEAC
if /i '%choice%'=='n' GOTO MENU
if '%choice%'=='' GOTO MENU
echo "%choice%" is not valid
echo.
pause

:DELETEAC
echo Deleting AutoClean.bat in the folder:
echo [33m%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\[0m
timeout /t 2 /nobreak > NUL
echo This will take a second.
timeout /t 2 /nobreak > NUL
  del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\AutoClean.bat" /f /q
echo.
timeout /t 2 /nobreak > NUL
if exist "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\AutoClean.bat" (
    echo File was not deleted.
    echo You may need to manually delete this file.
    echo Step 1.
    echo Please type in your Windows search bar, ^(Cortana Search bar^),
    echo "[36mrun[0m", without the quotes
    echo.
    echo Step 2.
    echo Type [36mshell:Startup[0m into the run.
    echo .
    echo Step 3.
    echo In that folder, you should see a file called AutoClean.bat,
    echo Right click on that file and select delete.
    echo.
    echo You're Done.
) else (
    echo File has been deleted successfully.
)
pause
GOTO MENU

REM ###################################################### NEW SECTION [19] ##############################################################
:CCAL
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo Attempting to open the built in Windows 11 Display Color Calibration
timeout /t 2 /nobreak > NUL
echo Opening now.
timeout /t 1 /nobreak > NUL
start "" dccw.exe
timeout /t 1 /nobreak > NUL
echo Windows 11 display color calibration is now open.
timeout /t 1 /nobreak > NUL
echo Returning to main menu shortly.
timeout /t 2 /nobreak > NUL
GOTO MENU


REM ###################################################### NEW SECTION [20] ##############################################################
REM Make Godmode button
:GODMODE
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo This will attempt to create you a GodMode shortcut button that
echo will give easy access to all Windows features.
timeout /t 1 /nobreak > NUL
echo.
echo [31mNOTE[0m: You will have no name to the icon and it won't show
echo up, no matter if you rename it. [33m^(Windows 11 bug or feature?^)[0m
echo The 4th option is for me to tell you how to create a shortcut
echo that you [36mCAN[0m name and change the icon of, [35m^(really easy to do!^)[0m.
echo.
echo Where would you like me to put it?
echo 1.^) [36m"%UserProfile%\Desktop"[0m
echo 2.^) [35m"%UserProfile%\Documents"[0m
echo 3.^) [33m"%UserProfile%"[0m
echo 4.^) [32mInstructions to make it.[0m
timeout /t 1 /nobreak > NUL
echo.
GOTO GMC

:GMC
set choice=
set gmdir=
set /p choice=Choose one of the above options: [33m^[[36m1[33m^|[36m2[33m^|[36m3[33m^|[36m4[33m^][0m:
if NOT '%choice%'=='' set "choice=%choice:~0,1%"
if /i '%choice%'=='1' set "gmdir=DESKTOP" && GOTO GMCD
if /i '%choice%'=='2' set "gmdir=DOCS" && GOTO GMCD
if /i '%choice%'=='3' set "gmdir=USER" && GOTO GMCD
if /i '%choice%'=='4' GOTO GMCINS
if '%choice%'=='' GOTO GMC
echo "%choice%" is not valid
echo.
GOTO GMC

:GMCD
timeout /t 1 /nobreak > NUL
echo Okay, creating file in your Desktop, unless you remapped your computer.
timeout /t 1 /nobreak > NUL
  if "%gmdir%"=="DESKTOP" (
    if not exist "%UserProfile%\Desktop\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}" (
      md "%UserProfile%\Desktop\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}"
    ) ELSE (
      echo [33m!! File already exists !![0m
    )
  ) ELSE IF "%gmdir%"=="DOCS" (
    if not exist "%UserProfile%\Documents\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}" (
      md "%UserProfile%\Documents\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}"
    ) ELSE (
      echo [33m!! File already exists !![0m
    )
  ) ELSE (
        if not exist "%UserProfile%\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}" (
      md "%UserProfile%\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}"
    ) ELSE (
      echo [33m!! File already exists !![0m
    )
  )

timeout /t 1 /nobreak > NUL
echo.
echo Shortcut created.
timeout /t 1 /nobreak > NUL
echo.
echo You should find it at the following location:
if "%gmdir%"=="DESKTOP" set "folderpath=%UserProfile%\Desktop"
if "%gmdir%"=="DOCS" set "folderpath=%UserProfile%\Documents"
if "%gmdir%"=="USER" set "folderpath=%UserProfile%"
echo [31m"%folderpath%\"[0m
timeout /t 1 /nobreak > NUL
echo.
echo Just note, there is a blueish icon that was created with no name.
echo It should have the name of GodMode, but on Windows 11, that is missing. ^(Bug or Feature?^)
echo.
pause
GOTO MENU

:GMCINS
cls

for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo Okay, you have chosen to make your own shortcut. This is a very
echo easy thing to do. I'm sorry I couldn't create it for you, this is
echo just the limitation of what .bat files can do an where PowerShell
echo takes over.
echo.
echo Steps to follow:
echo 1.^) Right click on your desktop, then click New ^=^> Shortcut
echo.
echo 2.^) Where it says ^"[1mType the location of the item:[0m^", copy the colored text below
echo and paste it in there. To copy, using your mouse, highlight the text then Press
echo Ctrl+C for copy and Ctrl+V to paste it in and then click ^"Next^".
echo [36m^%%windir^%%\explorer.exe shell::^{ED7BA470-8E54-465E-825C-99712043E01C^}[0m
echo.
echo 3.^) Name it to what ever you want, then click ^"Finish^".
echo.
echo 4.^) If you want to change the icon, then right click on it, The ^"[1mShortcut[0m^" tab,
echo at the bottom, had a button called ^"[1mChange Icon[0m^". You can create a custom icon or find
echo one on the web, ^(images.google.com^). File format used is .ico which if your
echo graphics program doesn't allow you to make one, save your image as a png. Should
echo be 48px x 48px in size. Then try a site like icoconvert.com to convert it from
echo .png to .ico for you. There are a lot of online free converters.
echo.
echo. That's it. Hope this helped.
echo.
pause
GOTO MENU

REM ###################################################### NEW SECTION [21] ##############################################################
REM Rebuild Icon Cache
:REBUILDICON
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo About:
echo The icons that display for files in Windows are saved in an icon cache so they can be
echo displayed quickly instead of having to manually load each one every time.
echo.
echo The icon cache can sometimes become corrupted causing the icons of files to display
echo incorrectly or distorted. When this happens, the icon cache needs to be deleted to
echo reset and automatically recreate it.
echo.
echo Rebuilding the icon cache will not help with the following icon issues:
echo 1.^)The icon of a shortcut not displaying properly due to the target source of the shortcut was
echo. moved or deleted. You may need to recreate a new shortcut directly from the source
echo. ^(ex: program's exe^) file to replace it instead.
echo.
echo 2.^)All icons for a specific file extension display the wrong icon. This may be due to setting
echo. the wrong association for what app to open the file type instead. If so, restoring the default
echo. association of the file extension will fix this issue.
echo.
echo 3.^)Thumbnails of folders, pictures, videos, and documents.
echo.
set iconcache=%localappdata%\IconCache.db
echo.
echo The explorer process must be temporarily killed before deleting the IconCache.db file.
echo.
echo Please SAVE ALL OPEN WORK before continuing.
echo.
pause
echo.
if exist "%iconcache%" GOTO DELIC
echo.
echo The %localappdata%\IconCache.db file has already been deleted.
echo.
if exist "%localappdata%\Microsoft\Windows\Explorer\iconcache*" GOTO DELIC
echo.
echo The %localappdata%\Microsoft\Windows\Explorer\IconCache_*.db files have already been deleted.
echo.
GOTO MENU

:DELIC
echo.
echo Attempting to delete IconCache.db files...
echo.
ie4uinit.exe -show
taskkill /IM explorer.exe /F
if exist "%iconcache%" del /A /F /Q "%iconcache%"
if exist "%localappdata%\Microsoft\Windows\Explorer\iconcache*" del /A /F /Q "%localappdata%\Microsoft\Windows\Explorer\iconcache*"
start explorer.exe
echo.
echo IconCache database files have been successfully deleted.
GOTO DELICR


:DELICR
echo.
echo.
echo You will need to restart the PC to finish rebuilding your icon cache.
echo.
CHOICE /C:YN /M "Do you want to restart the PC now?"
IF ERRORLEVEL 2 GOTO NORESTART
IF ERRORLEVEL 1 GOTO YESRESTART

:YESRESTART
timeout /t 1 /nobreak > NUL
echo Attempting to restart your computer in 5 seconds.
timeout /t 5 /nobreak >Nul
shutdown /r /f /t 0

:NORESTART
timeout /t 1 /nobreak > NUL
echo Okay, Icon cache will finish rebuilding on your next restart.
echo Redirecting you to the menu.
timeout /t 3 /nobreak >Nul
GOTO MENU


REM ###################################################### NEW SECTION [22] ##############################################################
:WINKEY
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo [36m::ABOUT::[0m
echo More pre-built PC's are now coming without any stickers to show your product
echo key, and if you ever want to reformat your PC, you definitely need to know this.
echo Because of this, I am putting this in and save you from downloading a software
echo that is just bloated. Unlike those programs, this is just a simple .bat file which
echo all of these things can be run from command prompt.
echo.
echo [36mWhy are they doing this?[0m
echo Simple, security. When you ship PC's with the code on the case, or on a
echo sticker, it's easy for it to be taken off or stolen.
echo.
timeout /t 3 /nobreak > NUL
echo.
echo [31mIMPORTANT:[0m Keep this product key safe and do NOT share it publicly.
echo.
echo ------------------------- Your code is below ---------------------------------
echo.

for /f "usebackq tokens=* delims=" %%K in (`powershell -NoProfile -Command "(Get-CimInstance -ClassName SoftwareLicensingService).OA3xOriginalProductKey"`) do (
    set "WINKEY=%%K"
)

echo %WINKEY%
echo.
echo ------------------------------------------------------------------------------
echo.
echo [35mJust highlight your code above and Press Ctrl+C to copy and Ctrl+V to paste.[0m

:WKSAVE
echo.
set choice=
set /p choice=Would you like me to Export this to a text file?  [33m^[Y/N^][0m:
if NOT '%choice%'=='' set "choice=%choice:~0,1%"
if /i '%choice%'=='y' GOTO WKYES
if /i '%choice%'=='n' GOTO MENU
if '%choice%'=='' GOTO MENU
echo "%choice%" is not valid
echo.
GOTO WKSAVE

:WKYES
cls
echo Okay, I will export this to a file.
echo.
echo Your file can be found here:
echo [33m"%UserProfile%\Win_11_Product_key.txt"[0m
(
    echo.
    echo !!! IMPORTANT: Keep this key private. Do NOT share it publicly. !!!
    echo.
    echo ----------------------------------[Windows 11 Code Below]--------------------------------------
    echo.
    echo %WINKEY%
    echo.
    echo -----------------------------------------------------------------------------------------------
) > "%UserProfile%\Win_11_Product_key.txt"
timeout /t 3 /nobreak > NUL
echo.

:WKOPENFILE
set choice=
set /p choice=Do you want to view the file now?  [33m^[Y/N^][0m:
if NOT '%choice%'=='' set "choice=%choice:~0,1%"
if /i '%choice%'=='y' GOTO WKOPEN
if /i '%choice%'=='n' GOTO MENU
if '%choice%'=='' GOTO MENU
echo "%choice%" is not valid
echo.
GOTO WKOPENFILE

:WKOPEN
cls
echo.
echo Okay, let me open that for you then.
echo Give me 1 sec.
echo.
timeout /t 2 /nobreak > NUL
echo Close notepad to continue.
notepad.exe "%UserProfile%\Win_11_Product_key.txt"
goto MENU

REM ###################################################### NEW SECTION [23] ##############################################################
:BATREPORT
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo [33mLets check for a battery first before we proceed.[0m
echo.
timeout /t 1 /nobreak > nul
powershell -NoProfile -Command "if (Get-CimInstance -ClassName Win32_Battery -ErrorAction SilentlyContinue) { exit 0 } else { exit 1 }" >nul 2>&1
echo.
if %ERRORLEVEL%==0 (
    GOTO BATREPORTPASS
) else (
    echo [33mNote:[0m No battery detected.
    timeout /t 3 /nobreak > nul
    echo.
    echo You are likely on a desktop PC.
    echo This report isn't going to show you anything.
    echo.
    echo Ready to go back to main menu?
    pause
    GOTO MENU
)
echo.

:BATREPORTPASS
cls
echo.
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo [36mLets create you that report.[0m
echo.
powercfg /batteryreport /output "%UserProfile%\Documents\battery-report.html"
echo File created.
timeout /t 1 /nobreak > nul
echo.
echo You can find the file here:
echo -^>  %UserProfile%\Documents\battery-report.html
timeout /t 2 /nobreak > nul
echo.
echo Let me open that for you.
timeout /t 2 /nobreak > nul
start "" "%UserProfile%\Documents\battery-report.html" >nul 2>&1
timeout /t 2 /nobreak > nul
echo.
:BATREPORTPASSOFF
set choice=
set /p choice=Would you like to go to Power Configuration?  [33m^[Y/N^][0m:
if NOT '%choice%'=='' set "choice=%choice:~0,1%"
if /i '%choice%'=='Y' GOTO POWERCON
if /i '%choice%'=='N' GOTO MENU
if '%choice%'=='' GOTO BATREPORTPASSOFF
echo "%choice%" is not valid
echo.
GOTO BATREPORTPASSOFF

REM ###################################################### NEW SECTION [24] ##############################################################
:POWERCON
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo [33mThis is for you that use battery power on your device, (laptops).[0m
echo.
echo [36m::ABOUT::[0m
echo Are you frustrated with how quickly your laptop seems to run out of power?
echo It could be that your power settings are configured as efficiently as possible.
echo This here will use the power ^"configuration^" that can help. This here will get a full
echo power efficiency report for you.
echo.
echo Just note, after you have read the report, be sure to delete the file. In my test, I have
echo had it save the file in my Startup folder so when my PC starts, it opens up in a browser.
echo I also have had it save into a different folder on my other system, so I can^'t just put in
echo a simple delete like I would love to.
echo.
echo The process will take a minute, but when it^’s done, you^’ll see whether there are
echo any warnings or errors that might help you improve the power efficiency of your system.
echo.
timeout /t 1 /nobreak > nul
echo.
echo Checking for battery...
timeout /t 1 /nobreak > nul
powershell -NoProfile -Command "if (Get-CimInstance -ClassName Win32_Battery -ErrorAction SilentlyContinue) { exit 0 } else { exit 1 }" >nul 2>&1
echo.
if %ERRORLEVEL%==0 (
    echo Battery detected, running laptop-style report...
) else (
    echo [33mNote:[0m No battery detected.
    echo You are likely on a desktop PC.
    echo The test will still run, but you can ignore any battery-related warnings.
    echo.
    timeout /t 3 /nobreak > nul
)
echo.

:POWERCONTEST
echo.
set choice=
set /p choice=Ready to run the test? ^(Takes about 60 seconds^)  [33m^[Y/N^][0m:
if NOT '%choice%'=='' set "choice=%choice:~0,1%"
if /i '%choice%'=='Y' GOTO RUNPOWERCONTEST
if /i '%choice%'=='N' GOTO MENU
if '%choice%'=='' GOTO POWERCONTEST
echo "%choice%" is not valid
echo.
GOTO POWERCONTEST

:RUNPOWERCONTEST
echo.
echo Generating your power efficiency report...
echo This will take about 60 seconds.
echo.
powercfg -energy -output "%UserProfile%\Desktop\energy-report.html"
echo.
echo Report completed and saved to your Desktop as:
echo [33menergy-report.html[0m
echo Opening it now for you...
echo.
start "" "%UserProfile%\Desktop\energy-report.html"
pause
GOTO MENU

REM ###################################################### NEW SECTION [25] ##############################################################
:CUNINSTALLER
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo [36m::ABOUT::[0m
echo Here, I put in two systems for you to use, depending on your situation, you may use
echo either or. The first system is going to use perhaps one of the most old-school
echo methods that we have used, especially from the Windows 8, ^(?^), time, and prior.
echo That system is ^"Control Panel^". With the way Windows 11 hides it, this makes it easier to open.
echo Sometimes, the program is unavailable in CP to uninstall, so you can use the command method.
echo This is a bit more advanced and you CAN mess up your computer if you're careless.
echo.
echo [36mINSTRUCTIONS FOR CP[0m
echo Select option 1 below and click on program you wish to uninstall then click uninstall.
echo.
echo Select option 2 below and follow each instruction on each page.
echo [31mBE SURE TO READ EVERYTHING CAREFULLY![0m
echo.

:CPCHOICE
echo.
echo [32m#########################################
echo ## 1.   [37mControl Panel[32m
echo ## 2.   [37mCommand Prompt [31m^(Advanced^)[32m
echo ## 3.   [37mGo Back to Main Menu[32m
echo #########################################[0m
echo.
set choice=
set /p choice=Please, choose either 1, 2, or 3:
if NOT '%choice%'=='' set "choice=%choice:~0,1%"
if '%choice%'=='1' GOTO CPUNINSTALLER
if '%choice%'=='2' GOTO CMDPUNISTALLER
if '%choice%'=='3' GOTO MENU
if '%choice%'=='' GOTO CPCHOICE
echo "%choice%" is not valid
echo.
GOTO CPCHOICE

:CPUNINSTALLER
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo Attempting to open Control Panel.
timeout /t 1 /nobreak > NUL
echo Opening now.
timeout /t 1 /nobreak > NUL
appwiz.cpl
pause
GOTO MENU

:CMDPUNISTALLER
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo Okay, I will be attempting to get you a list of your programs. Once the list
echo of programs show up, you are going to want to either write down the name exactly
echo ^(The WHOLE line^), or, highlight the name and press CTRL+C to copy it and
echo CTRL+V to paste what you had highlighted and copied.
pause
echo Lets get the list of programs, [33m[1m^(This can take a min.^)[0m
timeout /t 1 /nobreak > NUL
echo.
powershell -command "Get-WmiObject Win32_Product | Select-Object -ExpandProperty Name"
echo.
timeout /t 1 /nobreak > NUL
echo [33m[1m-----------------------------------------------------------[0m
timeout /t 1 /nobreak > NUL
echo.
set /p p2uninstall="Type or Paste the program to uninstall: "
timeout /t 1 /nobreak > NUL
echo [33mOkay, program [31m%p2uninstall%[33m is what you selected?.[0m
timeout /t 1 /nobreak > NUL
echo.

:PTOUNINSTALL
echo.
set choice=
set /p choice=Are you sure you want to uninstall it?  [33m^[Y/N^][0m:
if NOT '%choice%'=='' set "choice=%choice:~0,1%"
if /i '%choice%'=='Y' GOTO UNINSTALLPRO
if /i '%choice%'=='N' GOTO MENU
if '%choice%'=='' GOTO PTOUNINSTALL
echo "%choice%" is not valid
echo.
GOTO PTOUNINSTALL

:UNINSTALLPRO
echo Lets get this program uninstalled for you.
timeout /t 1 /nobreak > NUL
echo.
powershell -command "Get-WmiObject Win32_Product | Where-Object { $_.Name -eq '%p2uninstall%' } | ForEach-Object { $_.Uninstall() }"
echo.
echo If program existed, it should be deleted now.
pause
GOTO MENU


REM ###################################################### NEW SECTION [26] ##############################################################
:DRIVETREE
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo This here will export the tree structure of the specified drive to
echo a file. This file will be written and placed in a specified location
echo found here: "%UserProfile%"\
echo.
:DRIVETREERETRY
set /p drive="Type the drive letter: "
timeout /t 1 /nobreak > NUL
echo.

SET updrive=%drive%
if "%updrive%"=="" goto DRIVETREERETRY
for %%i in (%drive%) do set "updrive=%%~i"
set "updrive=%updrive:A=a%"
set "updrive=%updrive:a=A%"


 echo Okay, checking to see if drive [33m%updrive%[0m exists.
timeout /t 1 /nobreak > NUL

@IF EXIST %updrive%:\ (GOTO DRIVETREECONT)
@GOTO DRIVETREEFAILED

:DRIVETREECONT
echo.
echo Drive found.
timeout /t 1 /nobreak > NUL
echo Writing info to a file. This can take up to a few minutes, ^(Please Don^'t Close^).
tree %updrive%:\ /a /f > "%UserProfile%\TreeDump_of_%updrive%_drive.txt"
GOTO TREEOPENFILE

:DRIVETREEFAILED
echo.
echo [31mDrive letter does not exist
echo please try again.[0m
echo -----------------------------------------------------------------
echo.
timeout /t 1 /nobreak > NUL
GOTO DRIVETREERETRY

:TREEOPENFILE
timeout /t 1 /nobreak > NUL
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
timeout /t 1 /nobreak > NUL
echo.
echo File completed.
timeout /t 1 /nobreak > NUL
echo The tree structure was written to a file located here:
echo.
echo [36m[1m "%UserProfile%\TreeDump_of_%updrive%_drive.txt"[0m
timeout /t 1 /nobreak > NUL
echo.
echo.
set choice=
set /p choice=Do you want to view the file?  [33m^[Y/N^][0m:
if NOT '%choice%'=='' set "choice=%choice:~0,1%"
if /i '%choice%'=='y' GOTO TREEOPEN
if /i '%choice%'=='n' GOTO TREEANOTHER
if '%choice%'=='' GOTO TREEOPENFILE
echo "%choice%" is not valid
echo.
GOTO TREEOPENFILE

:TREEOPEN
echo.
echo Okay, let me open that for you then.
echo Give me 1 sec.
echo.
timeout /t 3 /nobreak > NUL
notepad.exe "%UserProfile%\TreeDump_of_%updrive%_drive.txt"
pause
goto MENU

:TREEANOTHER
set choice=
set /p choice=Do you want to do another?  [33m^[Y/N^][0m:
if NOT '%choice%'=='' set "choice=%choice:~0,1%"
if /i '%choice%'=='y' GOTO DRIVETREE
if /i '%choice%'=='n' GOTO MENU
if '%choice%'=='' GOTO TREEANOTHER
echo "%choice%" is not valid
echo.
GOTO TREEANOTHER



REM ###################################################### NEW SECTION [27] ##############################################################
:WINSCAN
cls
REM #####################################  ART START #####################################
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
REM ######################################  ART END ######################################
echo.
echo [33mThis is for Windows 11 ONLY.[0m
echo.
echo [36m::ABOUT::[0m
echo Windows 11 includes Microsoft Defender antivirus—also known as Windows Defender, which has
echo a command-line interface. Rather than using the graphical Windows Security app, you can
echo run Windows 11 built-in antivirus from Command Prompt, which what we are doing here.
echo.

:WDSCANCHOICES
echo.
echo [32m#########################################
echo ## 1.   [37mQuick Scan[32m
echo ## 2.   [37mFull Scan[32m
echo ## 3.   [37mUpDate Win Defender Antivirus[32m
echo ## 4.   [37mMain Menu[32m
echo #########################################[0m
echo.
set choice=
set /p choice=Please, choose either 1, 2, 3, or 4:
if NOT '%choice%'=='' set "choice=%choice:~0,1%"
if '%choice%'=='1' GOTO WDQSCAN1
if '%choice%'=='2' GOTO WDFSCAN1
if '%choice%'=='3' GOTO WDUPDATE1
if '%choice%'=='4' GOTO MENU
if '%choice%'=='' GOTO WDSCANCHOICES
echo "%choice%" is not valid
echo.
GOTO WDSCANCHOICES

:WDQSCAN1
echo.
echo Before I scan your PC,
set updatesigs=
set /p updatesigs=Would you like me to update your Antivirus/Antispyware signatures? [33m^[Y/N^][0m:
if NOT '%updatesigs%'=='' set updatesigs=%updatesigs:~0,1%
if /i '%updatesigs%'=='y' set "updatesigs=DOIT" && GOTO WDQSCAN2
if /i '%updatesigs%'=='n' set "updatesigs=" && GOTO WDQSCAN2
if '%updatesigs%'=='' GOTO WDQSCAN1
echo "%updatesigs%" is not valid
echo.
GOTO WDQSCAN1

:WDQSCAN2
echo.
echo After I am done scanning your PC,
set choice=
set /p choice=Do you want me to shutdown your PC? [33m^[Y/N^][0m:
if NOT '%choice%'=='' set "choice=%choice:~0,1%"
if /i '%choice%'=='y' set "powerc=SHUTDOWN" && GOTO WDQSCAN3
if /i '%choice%'=='n' set "powerc=" && GOTO WDQSCAN3
if '%choice%'=='' GOTO WDQSCAN2
echo "%choice%" is not valid
echo.
GOTO WDQSCAN2

:WDQSCAN3
cls

REM #####################################  ART START #####################################
for /f "tokens=* delims=!:" %%A in ('findstr /b :!: "%~f0"') do @echo(%%A
REM ######################################  ART END ######################################
echo.
echo This will take a few min.
timeout /t 1 /nobreak > NUL
echo So be patient please.
timeout /t 2 /nobreak > NUL
set "defpath="
for /d %%D in ("C:\ProgramData\Microsoft\Windows Defender\Platform\*") do set "defpath=%%D"
if not defined defpath (
    echo Microsoft Defender not found on this system.
    pause
    goto MENU
)
cd /d "%defpath%"
if not exist MpCmdRun.exe (
    echo MpCmdRun.exe not found in %defpath%.
    pause
    goto MENU
)

if "%updatesigs%"=="DOIT" (
  MpCmdRun -SignatureUpdate & MpCmdRun -Scan -ScanType 1
) ELSE (
  MpCmdRun -Scan -ScanType 1
)
timeout /t 2 /nobreak > NUL
GOTO SHUTDOWN


:WDFSCAN1
cls
REM #####################################  ART START #####################################
for /f "tokens=* delims=!:" %%A in ('findstr /b :!: "%~f0"') do @echo(%%A
REM ######################################  ART END ######################################
echo.
echo This will more likely take an hour or more to complete. It will take
echo longer depending on how many files you have on your computer, so be
echo patient please.
echo.
echo Just know that this is not a graphical scanning system, so if that is
echo what you are looking for, then you should just open up the actual program
echo and do it through that. This will not show you any status or do any changes
echo while running. It will look like it's frozen, but rest assured, it's not.
echo You may just want to run the quick scan instead of this.
echo.
echo This was done so you could easily have the scan run from this tool, or you can set the
echo system to clean your PC, then scan for viruses, then shut down if you wanted to.
echo.
:WDFSCANCON
set choice=
set /p choice=Would you like to continue? [33m^[Y/N^][0m:
if NOT '%choice%'=='' set "choice=%choice:~0,1%"
if /i '%choice%'=='y' GOTO WDFSCAN2
if /i '%choice%'=='n' GOTO MENU
if '%choice%'=='' GOTO WDFSCANCON
echo "%choice%" is not valid
echo.
GOTO WDFSCANCON

:WDFSCAN2
echo.
echo Before I scan your PC,
set updatesigs=
set /p updatesigs=Would you like me to update your Antivirus/Antispyware signatures? [33m^[Y/N^][0m:
if NOT '%updatesigs%'=='' set updatesigs=%updatesigs:~0,1%
if /i '%updatesigs%'=='y' set "updatesigs=DOIT" && GOTO WDFSCAN3
if /i '%updatesigs%'=='n' set "updatesigs=" && GOTO WDFSCAN3
if '%updatesigs%'=='' GOTO WDFSCAN2
echo "%updatesigs%" is not valid
echo.
GOTO WDFSCAN2


:WDFSCAN3
echo.
echo After I am done scanning your PC,
set choice=
set /p choice=Do you want me to shutdown your PC? [33m^[Y/N^][0m:
if NOT '%choice%'=='' set "choice=%choice:~0,1%"
if /i '%choice%'=='y' set "powerc=SHUTDOWN" && GOTO WDFSCAN4
if /i '%choice%'=='n' set "powerc=" && GOTO WDFSCAN4
if '%choice%'=='' GOTO WDFSCAN3
echo "%choice%" is not valid
echo.
GOTO WDFSCAN3

:WDFSCAN4
cls
REM #####################################  ART START #####################################
for /f "tokens=* delims=!:" %%A in ('findstr /b :!: "%~f0"') do @echo(%%A
REM ######################################  ART END ######################################
echo.
echo This will more ^& likely take more than an hour complete.
timeout /t 2 /nobreak > NUL
echo.
echo Please, do not close until the scan is completed.
timeout /t 1 /nobreak > NUL
echo Be patient please.
timeout /t 2 /nobreak > NUL
set "defpath="
for /d %%D in ("C:\ProgramData\Microsoft\Windows Defender\Platform\*") do set "defpath=%%D"
if not defined defpath (
    echo Microsoft Defender not found on this system.
    pause
    goto MENU
)
cd /d "%defpath%"
if not exist MpCmdRun.exe (
    echo MpCmdRun.exe not found in %defpath%.
    pause
    goto MENU
)

if "%updatesigs%"=="DOIT" (
  MpCmdRun -SignatureUpdate & MpCmdRun -Scan -ScanType 2
) ELSE (
  MpCmdRun -Scan -ScanType 2
)
timeout /t 2 /nobreak > NUL
GOTO SHUTDOWN

:WDUPDATE1
echo.
echo After I am done updating the antivirus signatures,
set choice=
set /p choice=Do you want me to shutdown your PC? [33m^[Y/N^][0m:
if NOT '%choice%'=='' set "choice=%choice:~0,1%"
if /i '%choice%'=='y' set "powerc=SHUTDOWN" && GOTO WDUPDATE2
if /i '%choice%'=='n' set "powerc=" && GOTO WDUPDATE2
if '%choice%'=='' GOTO WDUPDATE1
echo "%choice%" is not valid
echo.
GOTO WDUPDATE1

:WDUPDATE2
cls
REM #####################################  ART START #####################################
for /f "tokens=* delims=!:" %%A in ('findstr /b :!: "%~f0"') do @echo(%%A
REM ######################################  ART END ######################################
echo.
echo This will take a few min.
timeout /t 1 /nobreak > NUL
echo So be patient please.
timeout /t 2 /nobreak > NUL
set "defpath="
for /d %%D in ("C:\ProgramData\Microsoft\Windows Defender\Platform\*") do set "defpath=%%D"
if not defined defpath (
    echo Microsoft Defender not found on this system.
    pause
    goto MENU
)
cd /d "%defpath%"
if not exist MpCmdRun.exe (
    echo MpCmdRun.exe not found in %defpath%.
    pause
    goto MENU
)

MpCmdRun -SignatureUpdate
timeout /t 2 /nobreak > NUL
GOTO SHUTDOWN


REM ###################################################### NEW SECTION [28] ##############################################################
:INSTALLEDPROGRAMS
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo [36mListing all installed programs in alphabetical order...[0m
echo.
powershell -NoProfile -Command "Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*, HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName } | Select-Object DisplayName, DisplayVersion | Sort-Object DisplayName | Format-Table -AutoSize"
echo.
powershell -NoProfile -Command "Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*, HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName } | Select-Object DisplayName, DisplayVersion | Sort-Object DisplayName | Format-Table -AutoSize" > "%UserProfile%\Documents\InstalledPrograms.txt"
echo List created here:
echo -^> %UserProfile%\Documents\InstalledPrograms.txt
echo.
pause
goto MENU

REM ###################################################### NEW SECTION [29] ##############################################################
:RESTARTINBIOS
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo Just confirming...
set choice=
set /p choice=Are you sure you want me to restart your PC and load into bios? [33m^[Y/N^][0m:
if NOT '%choice%'=='' set "choice=%choice:~0,1%"
if /i '%choice%'=='y' GOTO RESTARTINBIOS2
if /i '%choice%'=='n' GOTO MENU
if '%choice%'=='' GOTO RESTARTINBIOS
echo "%choice%" is not valid
echo.
GOTO RESTARTINBIOS

:RESTARTINBIOS2
echo Restarting now and entering BIOS...
timeout /t 3 /nobreak > NUL
shutdown /r /fw /f /t 0

REM ###################################################### NEW SECTION [?] ##############################################################
REM shows info
:ABOUT
cls
for /f "tokens=* delims=:!" %%A in ('findstr /b "::!" "%~f0"') do @echo(%%A
echo.
echo ******************************************************************
echo ** ABOUT THIS SCRIPT:
echo ******************************************************************
echo * Written by coRpSE (Derek McGuire)
echo * 06/16/2020  ^(MM/DD/YYYY^)
echo * Updated: 09/13/2025  ^(MM/DD/YYYY^)
echo *
echo * This script was written by coRpSE of headshotdomain.net to replace his older script from 2008 which was
echo * using older code. Some inspiration came from Kevin Tipker for the Deeper Cleanup and used a portion of his script,
echo * (with changes), to improve this script. All the rest that is added was just added to make it easier for people
echo * that don't know how to use CMD prompt, also, so they don't need to remember the commands. It's all here in one spot.
echo.
echo ******************************************************************
echo ** WHY THIS SCRIPT:
echo ******************************************************************
echo Windows hides many essential maintenance and troubleshooting tools deep in menus, requiring multiple clicks to access.
echo This script consolidates all those tools into a single, easy-to-use hub. Whether it's cleaning temporary files, checking
echo system health, running disk repairs, inspecting battery and power settings, or scanning for viruses, everything is just
echo a few keystrokes away. Designed specifically for Windows 11, this utility gives you control, visibility, and automation
echo over system maintenance tasks that are otherwise buried or difficult to find.
echo.
:WAITKEY
echo [92m[[0m2[92m][0m to go to Page 2 - [92m[[0mQ[92m][0m to go to Main Menu:
set /p choice=What do you want to do?
if NOT '%choice%'=='' set "choice=%choice:~0,1%"
if /i '%choice%'=='2' GOTO ABOUTP2
if /i '%choice%'=='Q' GOTO MENU
if '%choice%'=='' GOTO WAITKEY
echo.
echo "%choice%" is not valid
goto WAITKEY

:ABOUTP2
cls
for /f "tokens=* delims=!:" %%A in ('findstr /b :!: "%~f0"') do @echo(%%A
echo ******************************************************************
echo ** Copyright [36m(C)[0m headshotdomain
echo ******************************************************************
echo * Content is copyright (C) headshotdomain.net, released under GPL-3.0, which gives you
echo * permission to use content for almost any purpose, (but does not grant you any trademark
echo * permissions), so long as you note the license, as well as leaving credit to this author.
echo * https://opensource.org/licenses/GPL-3.0
echo ******************************************************************
echo.
echo ******************************************************************
echo ** [31mDisclaimer[0m
echo ******************************************************************
echo * I, coRpSE, (aka Derek McGuire), as well as headshotdomain.net, take no responsibility for
echo * any damages that can occur with use of this script. I also take no responsibility for
echo * anything that you may use it for. This script was written and distributed free of charge
echo * to be used for purposes of checking your PC and basic maintenance. If malicious use of
echo * this script is done, then you, (the user), are held responsible for your own actions.
echo ******************************************************************
:WAITKEY2
echo.
echo [92m[[0m1[92m][0m to go to Page 1 - [92m[[0mQ[92m][0m to go to Main Menu:
set /p choice=What do you want to do?
if NOT '%choice%'=='' set "choice=%choice:~0,1%"
if /i '%choice%'=='1' GOTO ABOUT
if /i '%choice%'=='Q' GOTO MENU
if '%choice%'=='' GOTO WAITKEY
echo "%choice%" is not valid
goto WAITKEY2


REM ###################################################### NEW SECTION [Q] ##############################################################
REM closes the program
:QUIT
exit /b

REM ################################################## NEW SECTION [SHUTDOWN] #############################################################
:SHUTDOWN
if "%powerc%"=="SHUTDOWN" (
    timeout /t 2 /nobreak > NUL
    echo.
    echo Cleanup is complete
    timeout /t 2 /nobreak > NUL
    echo Attempting to shut down your computer in 5 seconds.
    timeout /t 5 /nobreak > Nul
    SHUTDOWN /s /f /t 0
    echo.
    pause
    goto MENU
) ELSE (
    echo [93mTransfering you back to the main menu in a second.
    timeout /t 5 /nobreak >Nul
    goto MENU
)

REM ###################################################### NEW SECTION [ART] ##############################################################
REM Let's put in our art work for this script

:!:    .o oOOOOOOOo                                            OOOo
:!:    Ob.OOOOOOOo  OOOo.      oOOo.                      .adOOOOOOO
:!:    OboO"""""""""""".OOo. .oOOOOOo.    OOOo.oOOOOOo.."""""""""'OO
:!:    OOP.oOOOOOOOOOOO "POOOOOOOOOOOo.   `"OOOOOOOOOP,OOOOOOOOOOOB'
:!:    `O'OOOO'     `OOOOo"OOOOOOOOOOO` .adOOOOOOOOO"oOOO'    `OOOOo
:!:    .OOOO'            `OOOOOOOOOOOOOOOOOOOOOOOOOO'            `OO
:!:    OOOOO                 '"OOOOOOOOOOOOOOOO"`                oOO
:!:   oOOOOOba.                .adOOcoRpSEOOba               .adOOOOo.
:!:  oOOOOOOOOOOOOOba.    .adOOOOOOOOOO@^OOOOOOOba.     .adOOOOOOOOOOOO
:!: OOOOOOOOOOOOOOOOO.OOOOOOOOOOOOOO"`  '"OOOOOOOOOOOOO.OOOOOOOOOOOOOO
:!: "OOOO"       "YOoOOOOMOIONODOO"`  .   '"OOROAOPOEOOOoOY"     "OOO"
:!:    Y           'OOOOOOOOOOOOOO: .oOOo. :OOOOOOOOOOO?'         :`
:!:    :            .oO%OOOOOOOOOOo.OOOOOO.oOOOOOOOOOOOO?         .
:!:    .            oOOP"%OOOOOOOOoOOOOOOO?oOOOOO?OOOO"OOo
:!:                 '%o  OOOO"%OOOO%"%OOOOO"OOOOOO"OOO':
:!:                      `$"  `OOOO' `O"Y ' `OOOO'  o             .
:!:    .                  .     OP"          : o     .
:!:                              :
:!:                              .

::! [96m__          ___      [0m _    _ _   _ _ _ _
::! [96m\ \        / (_)     [0m| |  | | | (_) (_) |
::! [96m \ \  /\  / / _ _ __ [0m| |  | | |_ _| |_| |_ _   _
::! [96m  \ \/  \/ / | | '_ \[0m| |  | | __| | | | __| | | |
::! [96m   \  /\  /  | | | | |[0m |__| | |_| | | | |_| |_| |
::! [96m    \/  \/   |_|_| |_|[0m\____/ \__|_|_|_|\__|\__, |
::!                                             __/ |
::!                                            |___/