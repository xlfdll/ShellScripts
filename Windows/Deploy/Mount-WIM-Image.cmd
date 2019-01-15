@echo off

rem Usage: Mount-WIM-Image <WIM FIle Name> <Edition Name> <Mount Folder Path>

md %3
Dism /Mount-WIM /WimFile:%1 /Name:%2 /MountDir:%3