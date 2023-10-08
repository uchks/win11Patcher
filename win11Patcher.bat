@echo off
set ver=a0.2
rem fuck depression, you're loved <3
rem breaking tons of licenses w/ this.
chcp 65001 >nul
title uchks's Windows 11 Patcher %ver%

if not "%1"=="am_admin" (
    powershell start -WindowStyle maximized -verb runas '%0' am_admin & exit /b
)

:header
cls 
echo [40;36m:;;;;;;;;;;;;;;;;;d00d;;;;;;;;;;;;;;;;;:
echo ;;;;;;;;;;;;;;;;;;d00d;;;;;;;;;;;;;;;;;;
echo ;;;;;;;;;;;;;;;;;;d00d;;;;;;;;;;;;;;;;;;
echo ;;;;;;;;;;;;;;;;;;d00d;;;;;;;;;;;;;;;;;;
echo ;;;;;;;;;;;;;;;;;;d00d;;;;;;;;;;;;;;;;;;
echo ;;;;;;;;;;;;;;;;;;d00d;;;;;;;;;;;;;;;;;;
echo ;;;;;;;;;;;;;;;;;;d00d;;;;;;;;;;;;;;;;;;
echo ;;;;;;;;;;;;;;;;;;d00d;;;;;;;;;;;;;;;;;;
echo ;;;;;;;;;;;;;;;;;;d00d;;;;;;;;;;;;;;;;;;
echo xxxxxxxxxxxxxxxxxx0XX0xxxxxxxxxxxxxxxxxx
echo llllllllllllllllllkKKkllllllllllllllllll
echo ;;;;;;;;;;;;;;;;;;d00d;;;;;;;;;;;;;;;;;;
echo ;;;;;;;;;;;;;;;;;;d00d;;;;;;;;;;;;;;;;;;
echo ;;;;;;;;;;;;;;;;;;d00d;;;;;;;;;;;;;;;;;;
echo ;;;;;;;;;;;;;;;;;;d00d;;;;;;;;;;;;;;;;;;
echo ;;;;;;;;;;;;;;;;;;d00d;;;;;;;;;;;;;;;;;;
echo ;;;;;;;;;;;;;;;;;;d00d;;;;;;;;;;;;;;;;;;
echo ;;;;;;;;;;;;;;;;;;d00d;;;;;;;;;;;;;;;;;;
echo ;;;;;;;;;;;;;;;;;;d00d;;;;;;;;;;;;;;;;;;
echo :;;;;;;;;;;;;;;;;;d00d;;;;;;;;;;;;;;;;;:
echo.
echo [uchks's Windows 11 Patcher: %ver%
echo.
goto :eof

:mainmenu
call :header
echo 1. Insider Patch -
echo 	Changes Insider channel from Release Preview or Beta to Dev channel (Allows Windows 11 insider updates)
echo 	Bypasses TPM 2.0, Secure Boot, RAM, + Storage check on a reboot.
echo.
echo 2. ISO Patch [31m(Work in Progress)[37m -
echo 	Allows the upgrade to Windows 11 using the ISOs "Setup.exe" on unsupported hardware.
echo.
echo 3. Remove Build Info -
echo 	Remove build info in the bottom right from Windows 11 Insider Builds or Windows 10 Insider Builds.
echo.
echo 4. Microsoft Activation Scripts (MAS) by massgravel -
echo 	[31mPiracy.[37m If you have morals or something, this isn't for you. [31mArghh.[37m
echo.
echo 5. Update Patcher [31m(Work in Progress)[37m
echo 6. Restart Computer
echo 7. Credits
echo 8. Exit
echo.
set /p main= 
if %main% == 1 goto insiderpatch
if %main% == 2 goto mainmenu && rem This will be changed back to isopatch after proper implementation.
if %main% == 3 goto rmb
if %main% == 4 (
    start https://github.com/massgravel/Microsoft-Activation-Scripts
)
if %main% == 5 goto mainmenu && rem This will be changed back to update after proper implementation.
if %main% == 6 goto restart
if %main% == 7 goto credits
if %main% == 8 goto exit
cls
echo Please Select An Option On The Menu...
timeout 2 >nul
goto mainmenu

:insiderpatch
title Insider Dev Patch initializing...
call :header
echo If you're not already in the Release Preview insider ring, do that now. 
echo After you're done, press 'Enter' to continue.
pause >nul
cls
echo Installing and replacing registry key(s)...
timeout 1 >nul

set "RegKeys="
set "RegKeys=!RegKeys! HKLM\SOFTWARE\Microsoft\WindowsSelfHost\Applicability /v BranchName /t REG_SZ /d Dev /f"
set "RegKeys=!RegKeys! HKLM\SOFTWARE\Microsoft\WindowsSelfHost\Applicability /v Ring /t REG_SZ /d External /f"
set "RegKeys=!RegKeys! HKLM\SOFTWARE\Microsoft\WindowsSelfHost\Applicability /v ContentType /t REG_SZ /d Mainline /f"
set "RegKeys=!RegKeys! HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection /v UIUsage /t REG_DWORD /d 0 /f"
set "RegKeys=!RegKeys! HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection /v RegistrationFlow /t REG_SZ /d \"{...}\" /f"
set "RegKeys=!RegKeys! HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection /v ConfigurationBasicUIText /t REG_SZ /d \"{...}\" /f"
set "RegKeys=!RegKeys! HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection /v ConfigurationOptOutUIText /t REG_SZ /d \"{...}\" /f"
set "RegKeys=!RegKeys! HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection /v UIContentType /t REG_SZ /d Mainline /f"
set "RegKeys=!RegKeys! HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection /v UIBranch /t REG_SZ /d Dev /f"
set "RegKeys=!RegKeys! HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection /v UIRing /t REG_SZ /d External /f"
set "RegKeys=!RegKeys! HKLM\SYSTEM\Setup\LabConfig /v BypassTPMCheck /t REG_DWORD /d 1 /f"
set "RegKeys=!RegKeys! HKLM\SYSTEM\Setup\LabConfig /v BypassSecureBootCheck /t REG_DWORD /d 1 /f"
set "RegKeys=!RegKeys! HKLM\SYSTEM\Setup\LabConfig /v BypassRAMCheck /t REG_DWORD /d 1 /f"
set "RegKeys=!RegKeys! HKLM\SYSTEM\Setup\LabConfig /v BypassStorageCheck /t REG_DWORD /d 1 /f"

for %%K in (!RegKeys!) do (
    Reg.exe add %%K
)

cls
echo Successfully imported registry key(s).
echo We'll reboot your computer for you; please update in Updates & Security afterwards.
timeout 2 >nul
shutdown /r /c "uchks's Windows 11 Patcher: Restarting PC..." /t 5


:isopatch
rem Extract ISO to Script Path and Create Mount Directory
cd /d "%~dp0"
if not exist "DVD" md "DVD"
if not exist "Mount" md "Mount"
if not exist "MountRE" md "MountRE"
if not exist "MountBoot" md "MountBoot"
bin\7z.exe x -y -o"DVD" "ISO\*.iso"

:rmb
title Build Info Patch initializing...
call :header
echo Installing and replacing registry key(s). && timeout 1 >nul && cls && echo Installing and replacing registry key(s).. && timeout 1 >nul && cls && echo Installing and replacing registry key(s)... && timeout 1 >nul && cls
timeout 2 >nul
Reg.exe add "HKCU\Control Panel\Desktop" /v "PaintDesktopVersion" /t REG_DWORD /d "1" /f
cls && echo Successfully imported registry key(s). If this doesn't immediately change your build info in the bottom right, reboot or relogin.
echo Press 'Enter' to continue...
pause >nul
goto mainmenu

:update
title Updating...
call :header
curl -o "win11Patcher.bat" -s https://raw.githubusercontent.com/uchks/win11Patcher/main/win11Patcher.bat
timeout 5 >nul
goto mainmenu

:restart
title Restarting PC...
call :header
timeout 2 >nul
shutdown /r /c "uchks's Windows 11 Patcher: Restarting PC..." /t 5

:credits
title Credits
call :header
echo [40;37mChris Titus Tech - https://christitus.com/update-any-pc-to-windows11/#system-modifications
echo Microsoft - for their requirements
echo https://uupdump.net - for their work towards dumping updates as ISOs
timeout 10 >nul
goto mainmenu
