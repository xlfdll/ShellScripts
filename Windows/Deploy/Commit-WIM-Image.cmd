@echo off

rem Usage: Commit-WIM-Image <Mount Folder Path>

dism /unmount-wim /mountdir:%1 /commit
rd %1 /q