@echo off

rem Must run this script under Windows 7 AIK Command Prompt
rem Using other environments (like Windows 10) may not work

if [%1] == [] (
	goto :Error
) else (
	goto :Main
)

:Error

echo ERROR: WIM distribution name must be specified.
goto:eof

:Main

md sp1
windows6.1-KB976932-X64.exe /X:.\sp1

pushd sp1

expand -F:* windows6.1-KB976932-X64.cab .
expand -F:* NestedMPPContent.cab .
expand -F:* KB976933-LangsCab0.cab .
expand -F:* KB976933-LangsCab1.cab .
expand -F:* KB976933-LangsCab2.cab .
expand -F:* KB976933-LangsCab3.cab .
expand -F:* KB976933-LangsCab4.cab .
expand -F:* KB976933-LangsCab5.cab .
expand -F:* KB976933-LangsCab6.cab .

echo Now edit the following files with changes:
echo.
echo --- Windows7SP1-KB976933~31bf3856ad364e35~amd64~~6.1.1.17514.mum ---
echo # allowedOffline="false"
echo # =^> allowedOffline="true"
notepad Windows7SP1-KB976933~31bf3856ad364e35~amd64~~6.1.1.17514.mum
echo.
echo --- update.mum ---
echo # allowedOffline="false"
echo # =^> allowedOffline="true"
notepad update.mum
echo.
echo --- update.ses ---
echo (offline sections only)
echo # targetState="Absent"
echo # =^> targetState="Installed"
notepad update.ses
echo.

popd

call Mount-WIM-Image.cmd .\sources\install.wim %1 .\offline

dism /image:.\offline /add-package /packagepath:.\sp1

call Commit-WIM-Image.cmd .\offline

rd sp1 /s /q
del *.cmd /q

echo Done.
echo.