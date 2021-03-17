@echo off

rem Usage: Make-Win-ISO-Image <Windows Setup Root Path> <ISO File Name>

oscdimg.exe -m -o -u2 -udfver102 -bootdata:2#p0,e,b%1\boot\etfsboot.com#pEF,e,b%1\efi\microsoft\boot\efisys.bin %1 %2