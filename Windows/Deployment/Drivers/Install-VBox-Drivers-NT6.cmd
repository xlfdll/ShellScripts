@echo off
pushd %WINDIR%\Temp
pushd %WINDIR%\Temp\cert
VBoxCertUtil.exe add-trusted-publisher vbox*.cer --root vbox*.cer
popd
VBoxWindowsAdditions.exe /S /with_wddm
popd