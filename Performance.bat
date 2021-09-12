@echo off
echo WARNIG THIS MAY BREAK YOUR PC IF YOU ARE NOT AT THE LATEST VERSION OF WINDOWS10 PRO DO YOU WISH TO CONTINIUE(y/n)

set /p Input=Enter Yes or No:
If /I "%Input%"=="y" goto yes
goto no
:yes
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "<RestorePointName>", 100, 7
echo A restore point has been created 
cd Debloat-Windows-10
cd scripts
Set-ExecutionPolicy Unrestricted -Scope CurrentUser
ls -Recurse *.ps*1 | Unblock-File
PowerShell.exe -command "./block-telemetry.ps1"
PowerShell.exe -command "./disable-services.ps1"
PowerShell.exe -command "./expermimental_unfuckery.ps1"
PowerShell.exe -command "./fix-privacy-settings.ps1"
PowerShell.exe -command "./optimize-user-interface.ps1"
PowerShell.exe -command "./optimize-windows-update.ps1"
PowerShell.exe -command "./remove-default-apps.ps1"
PowerShell.exe -command "./remove-onedrive.ps1"
echo Done!
:no
exit
cmd /k
