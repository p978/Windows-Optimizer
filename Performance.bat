@echo off
echo WARINIG THIS MAY BREAK YOUR PC IF YOU ARE NOT AT THE LATEST VERSION OF WINDOWS DO YOU WISH TO CONTINIUE
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "<RestorePointName>", 100, 7
echo A restore point has been created 
cd Debloat Windows 10
cd scripts
Set-ExecutionPolicy Unrestricted -Scope CurrentUser
ls -Recurse *.ps*1 | Unblock-File
./block-telemetry.ps1
./disable-services.ps1
./expermimental_unfuckery.ps1
./fix-privacy-settings.ps1
./optimize-user-interface.ps1
./optimize-windows-update.ps1
./remove-default-apps.ps1
./remove-onedrive.ps1
cmd /k
