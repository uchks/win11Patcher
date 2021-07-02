@echo off
rem fuck depression, you're loved <3
rem breaking tons of licenses w/ this.
chcp 65001 >nul
title revisitable's Windows 11 Patcher
if not "%1" == "max" start /MAX cmd /c %0 max & exit/b

:admincheck
echo Checking for Administrator Permissions...
    timeout 2 >nul
    net session >nul 2>&1
    if %errorLevel% == 0 (
	goto mainmenu
    ) else (
        cls & echo Error: Please Run As Administrator.
	timeout 2 >nul
	exit /b 1
    )

:mainmenu
title revisitable's Windows 11 Patcher
cls && echo [40;36m:;;;;;;;;;;;;;;;;;d00d;;;;;;;;;;;;;;;;;:
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
echo [37mrevisitable's Windows 11 Patcher
echo Windows 11 TPM 2.0 and Secure Boot Setup.exe/Registry bypass
echo https://discord.iloveemogirls.com && rem This is my Discord server, drop by and say Hi!
echo.
echo 1. Insider Patch -
echo 	Changes Insider channel from Release Preview or Beta to Dev channel (Allows Windows 11 insider updates)
echo 	Bypasses TPM 2.0 check and Secure Boot check on a reboot.
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
echo 5. Update Patcher
echo 6. Restart Computer
echo 7. Credits
echo 8. Exit
echo.
set /p main= 
if %main% == 1 goto insiderpatch
if %main% == 2 goto mainmenu && rem This will be changed back to isopatch after proper implementation.
if %main% == 3 goto rmb
if %main% == 4 rundll32 url.dll,FileProtocolHandler https://github.com/massgravel/Microsoft-Activation-Scripts
if %main% == 5 goto update
if %main% == 6 goto restart
if %main% == 7 goto credits
if %main% == 8 goto exit
cls
echo Please Select An Option On The Menu...
timeout 2 >nul
goto mainmenu

:insiderpatch
cls && title Insider Dev Patch initializing...
echo If you're not already in the Release Preview insider ring do that now. After you're done, press 'Enter' to continue.
pause >nul
cls && echo Installing and replacing registry key(s). && timeout 1 >nul && cls && echo Installing and replacing registry key(s).. && timeout 1 >nul && cls && echo Installing and replacing registry key(s)... && timeout 1 >nul && cls
timeout 2 >nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /v "BranchName" /t REG_SZ /d "Dev" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /v "Ring" /t REG_SZ /d "External" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /v "ContentType" /t REG_SZ /d "Mainline" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection" /v "UIUsage" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection" /v "RegistrationFlow" /t REG_SZ /d "{\"InfoPage\":{\"Title\":\"Join the Windows Insider Program\",\"PrimaryButtonText\":\"Sign Up\",\"SecondaryButtonText\":\"Close\",\"ParagraphText\":\"Be the first to access upcoming Windows features by becoming a Windows Insider. Once you are an Insider, you'll be able to install Windows Insider Previews and start giving feedback directly to Windows engineers. You'll receive a Welcome email and periodic newsletters with updates on the latest preview features, as well as occasional surveys and invites to special events. \",\"IsPrimaryButtonEnabled\":true,\"IsSecondaryButtonEnabled\":true},\"LegalAgreement\":{\"PrivacyPolicyLinkText\":\"Read the Microsoft Insider Privacy Statement\",\"InsiderAgreementLinkText\":\"Read the Windows Insider Program Agreement\",\"CheckBoxTextKey\":\"I've read and accept the terms of this agreement\",\"Title\":\"You are almost there\",\"PrimaryButtonText\":\"Submit\",\"SecondaryButtonText\":\"Close\",\"ParagraphText\":\"All you need to do is read the program agreement and the privacy statement, click that you accept the terms of the program agreement and hit the Submit button \",\"IsPrimaryButtonEnabled\":true,\"IsSecondaryButtonEnabled\":true},\"FinishedPage\":{\"Title\":\"You're good to go\",\"PrimaryButtonText\":\"Close\",\"SecondaryButtonText\":\"\",\"ParagraphText\":\"Thank you for registering for the Windows Insider Program.  Now let's get your device set up.\",\"IsPrimaryButtonEnabled\":true,\"IsSecondaryButtonEnabled\":false},\"ErrorUnknownPage\":{\"ShouldShowErrorCode\":true,\"Title\":\"We encountered an error\",\"PrimaryButtonText\":\"Close\",\"SecondaryButtonText\":\"\",\"ParagraphText\":\"Something has gone wrong and we are unable to continue.  Try again later.\",\"IsPrimaryButtonEnabled\":true,\"IsSecondaryButtonEnabled\":false},\"ErrorRegistrationCallFailedPage\":{\"ShouldShowErrorCode\":true,\"Title\":\"Error\",\"PrimaryButtonText\":\"Close\",\"SecondaryButtonText\":\"\",\"ParagraphText\":\"Something unexpected has gone wrong\",\"IsPrimaryButtonEnabled\":true,\"IsSecondaryButtonEnabled\":false},\"RegisterServiceCallLoadingPage\":{\"LoadingText\":\"Registering...\"}}" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection" /v "ConfigurationBasicUIText" /t REG_SZ /d "{\"Title\":\"Pick your Insider settings\",\"Description\":\"Choose the channel you want to receive Windows 10 Insider Preview Builds from on this device.\"}" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection" /v "ConfigurationOptOutUIText" /t REG_SZ /d "{\"Title\":\"Stop getting preview builds when the next version of Windows releases\",\"Description\":\"\",\"ToggleTitle\":\"Available for Beta and Release Preview channels. Turn this on to stop getting Windows 10 Insider Preview Builds when the next major release of Windows 10 launches to the public. Until then, your device will get Insider Preview builds and updates to keep it secure. You’ll keep all your apps, drivers, and settings even after you stop getting preview builds.\",\"ToggleOnText\":\"On\",\"ToggleOffText\":\"Off\",\"LinkText\":\"\",\"LinkLocation\":\"\"}" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection" /v "UIContentType" /t REG_SZ /d "Mainline" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection" /v "UIBranch" /t REG_SZ /d "Dev" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection" /v "UIRing" /t REG_SZ /d "External" /f
Reg.exe add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassTPMCheck" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassSecureBootCheck" /t REG_DWORD /d "1" /f
cls && echo Successfully imported registry key(s). && echo We'll reboot your computer for you, please update in Updates & Security afterwards.
timeout 2 >nul
shutdown /r /c "revisitable's Windows 11 Patcher: Restarting PC..." /t 5

:isopatch

:rmb
cls && title Build Info Patch initializing...
echo Installing and replacing registry key(s). && timeout 1 >nul && cls && echo Installing and replacing registry key(s).. && timeout 1 >nul && cls && echo Installing and replacing registry key(s)... && timeout 1 >nul && cls
timeout 2 >nul
Reg.exe add "HKCU\Control Panel\Desktop" /v "PaintDesktopVersion" /t REG_DWORD /d "1" /f
cls && echo Successfully imported registry key(s). If this doesn't immediately change your build info in the bottom right, reboot or relogin.
echo Press 'Enter' to continue...
pause >nul
goto mainmenu

:update
cls & title Updating...
%userprofile%\Desktop\wget.exe -q -O %userprofile%/Desktop/win11Patcher.bat https://raw.githubusercontent.com/revisitable/win11Patcher/main/win11Patcher.bat
timeout 5 >nul
goto mainmenu

:restart
cls && title Restarting PC...
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
timeout 2 >nul
shutdown /r /c "revisitable's Windows 11 Patcher: Restarting PC..." /t 5

:credits
cls && title Credits
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
echo [40;37mChris Titus Tech - https://christitus.com/update-any-pc-to-windows11/#system-modifications
timeout 10 >nul
goto mainmenu
