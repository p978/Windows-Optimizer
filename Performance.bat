@echo off
echo WARNING THIS MAY BREAK YOUR PC IF YOU ARE NOT USING WINDOWS 10 PRO, DO YOU WISH TO CONTINIUE(y/n)

set /p Input=Enter Yes or No:
If /I "%Input%" EQU "y" goto yes
goto no
:yes
echo  ____  _             _   _
echo / ___^|^| ^|_ __ _ _ __^| ^|_(_)_ __   __ _
echo \___ \^| __/ _` ^| '__^| __^| ^| '_ \ / _` ^|
echo  ___) ^| ^|^| (_^| ^| ^|  ^| ^|_^| ^| ^| ^| ^| (_^| ^|
echo ^|____/ \__\__,_^|_^|   \__^|_^|_^| ^|_^|\__, ^|
echo                                  ^|___/
echo Creating a Restore Point
rstrui.exe /offline:C:\windows=active
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Undo Changes Done by App", 100, 7
echo A restore point has been created 
echo Preparing
git clone https://github.com/W4RH4WK/Debloat-Windows-10.git
cd Debloat-Windows-10
cd scripts
echo Loaing Scripts
PowerShell.exe -command Set-ExecutionPolicy Unrestricted -Scope CurrentUser
PowerShell.exe -command ls -Recurse *.ps*1 | PowerShell.exe -command Unblock-File
echo Starting Operation. Press any key if you wish to continue..
pause>nul
PowerShell.exe -command ".\block-telemetry.ps1"
PowerShell.exe -command ".\disable-services.ps1"
PowerShell.exe -command ".\expermimental_unfuckery.ps1"
PowerShell.exe -command ".\fix-privacy-settings.ps1"
PowerShell.exe -command ".\optimize-user-interface.ps1"
PowerShell.exe -command ".\optimize-windows-update.ps1"
PowerShell.exe -command ".\remove-default-apps.ps1"
PowerShell.exe -command ".\remove-onedrive.ps1"
echo Done! The Operation has been completed
echo Press any key to exit
pause>nul
:no
exit