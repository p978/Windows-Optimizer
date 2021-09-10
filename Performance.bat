echo "WARNING YOU NEED TO BE ON THE LATEST VERSION TO CONTINUE IF YOU ARE NOT ON THE LATEST VERSION OF WINDOWS THIS MAY BREAK YOUR PC DO YOU WISH TO CONTINIUE DO YOU WISH TO CONTIUE"

@echo off
:choice
set /p choice=_<Confirm Message>_
if /I %choice% EQU "N" exit
if /I %choice% EQU "Y" (goto continue) else (goto choice)
goto choice

