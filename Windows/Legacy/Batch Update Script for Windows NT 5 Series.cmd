@echo off

rem Add Hotfixes Package filenames to Update.txt using dir *.exe/b>update.txt in Command Prompt.

echo Batch Update Script for Windows NT 5 Series
echo Build by Xlfdll Workstation

for /f "eol=@" %%i in (Update.txt) do .\%%i /passive /norestart
QChain.exe update.log
exit
