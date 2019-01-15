@echo off

rem Usage: Discard-WIM-Image <Mount Folder Path>

dism /unmount-wim /mountdir:%1 /discard
rd %1 /q