@echo off

rem Usage: Get-WIM-Image-Info <WIM File Name>

dism /get-wiminfo /wimfile:%1