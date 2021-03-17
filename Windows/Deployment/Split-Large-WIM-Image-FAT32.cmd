@echo off

rem Usage: Split-Large-WIM-Image-FAT32 <Source Drive> <Target Drive>

dism /Split-Image /ImageFile:%1\sources\install.wim /SWMFile:%2\sources\install.swm /FileSize:4096