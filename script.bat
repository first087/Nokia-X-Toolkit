@echo off
color 4e
mode con:cols=52 lines=52
if %1==-run (
	goto menu_work
)
goto end

:clear_var
set menu=-1
set menutext=
set reject=0
goto :eof

:head
cls
echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo  ³                                                ³
echo  ³          Nokia X Toolkit Version 1.20          ³
echo  ³                Develop by Ethan                ³
echo  ³             http://www.artit-k.com             ³
echo  ³                                                ³
echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
goto :eof

:show_work
call :head
echo.
echo    %menutext%
echo   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
goto :eof

:menu_work
call :clear_var
call :head
echo.
echo    Select menu, or x to exit
echo   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo.
echo   Ú Root file (Send to device) ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo   ³[ 1] Superuser 3.1.3   - ChainsDD
echo   ³[ 2] SuperSU 2.01      - Chainfire
echo   ³[ 3] Superuser 1.0.3.0 - ClockworkMod
echo   ³[ 4] Unroot - COMING SOON!
echo.
echo   Ú Google Play Services file (Send to device) ÄÄÄ
echo   ³[ 5] Install           [ 6] Uninstall
echo.
echo   Ú Fix Calendar Sync App file (Send to device) ÄÄ
echo   ³[ 7] For firmware 1.1.2.2 and older
echo   ³[ 8] For firmware 1.1.2.2 and 1.2.4.1
echo.
echo   Ú Recovery ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo   ³[11] Boot to Recovery
echo   ³[12] Boot to ClockworkMod Recovery 6.0.4.8
echo   ³[13] Flash ClockworkMod Recovery 6.0.4.8
echo.
echo   Ú Batch ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo   ³[21] Root [1]+[12]      [22] Root [2]+[12]
echo   ³[23] Root [3]+[12] *
echo   ³
echo   ³[25] Install   Google Play Services [5]+[12] *
echo   ³[26] Uninstall Google Play Services [6]+[12]
echo   ³
echo   ³[27] Install Fix Calendar Sync App [7]+[12]
echo   ³[28] Install Fix Calendar Sync App [8]+[12]
echo.
echo.
echo    [ 0] Clean send file(s)
echo.
echo    [u] Download Nokia X USB Driver for Windows
echo    [h] How to Enable USB debugging
echo.
echo    [d] DONATE!             [x] EXIT
echo.
echo    * = Recommend
echo.
echo.
set /P menu= Type menu number then press ENTER: 
if %menu%==1 (
	set menutext=Send file Superuser - ChainsDD
	call :push_file root Superuser-3.1.3-arm-signed.zip
	pause
)
if %menu%==2 (
	set menutext=Send file SuperSU - Chainfire
	call :push_file root UPDATE-SuperSU-v2.01.zip
	pause
)
if %menu%==3 (
	set menutext=Send file Superuser - ClockworkMod
	call :push_file root superuser_1.0.3.0.zip
	pause
)
if %menu%==5 (
	set menutext=Send file Install Google Play
	call :push_file gapps Nokia-X_GApps_Install-signed.zip
	pause
)
if %menu%==6 (
	set menutext=Send file Uninstall Google Play
	call :push_file gapps Nokia-X_GApps_Uninstall-signed.zip
	pause
)
if %menu%==7 (
	set menutext=Send file Fix Calendar Sync App
	call :push_file fix CalendarProvider1122_Install-signed.zip
	pause
)
if %menu%==8 (
	set menutext=Send file Fix Calendar Sync App
	call :push_file fix CalendarProvider1241_Install-signed.zip
	pause
)
if %menu%==11 (
	set menutext=Boot to Recovery
	call :boot_recovery
	pause
)
if %menu%==12 (
	set menutext=Boot to ClockworkMod Recovery
	call :boot_cwm h
	pause
)
if %menu%==13 (
	set menutext=Flash ClockworkMod Recovery
	call :flash_cwm
	pause
)
if %menu%==21 (
	set menutext=Root by Superuser - ChainsDD
	call :push_file root Superuser-3.1.3-arm-signed.zip
	call :boot_cwm x
	call :flash_zip Superuser-3.1.3-arm-signed.zip
	pause
	call :like_toolkit
)
if %menu%==22 (
	set menutext=Root by SuperSU - Chainfire
	call :push_file root UPDATE-SuperSU-v2.01.zip
	call :boot_cwm x
	call :flash_zip UPDATE-SuperSU-v2.01.zip
	pause
	call :like_toolkit
)
if %menu%==23 (
	set menutext=Root by Superuser - ClockworkMod
	call :push_file root superuser_1.0.3.0.zip
	call :boot_cwm x
	call :flash_zip superuser_1.0.3.0.zip
	pause
	call :like_toolkit
)
if %menu%==25 (
	set menutext=Install Google Play Services
	call :push_file gapps Nokia-X_GApps_Install-signed.zip
	call :boot_cwm x
	call :flash_zip Nokia-X_GApps_Install-signed.zip
	pause
	call :like_toolkit
)
if %menu%==26 (
	set menutext=Uninstall Google Play Services
	call :push_file gapps Nokia-X_GApps_Uninstall-signed.zip
	call :boot_cwm x
	call :flash_zip Nokia-X_GApps_Uninstall-signed.zip
	pause
	call :like_toolkit
)
if %menu%==27 (
	set menutext=Install Fix Calendar Sync App
	call :push_file fix CalendarProvider1122_Install-signed.zip
	call :boot_cwm x
	call :flash_zip CalendarProvider1122_Install-signed.zip
	pause
	call :like_toolkit
)
if %menu%==28 (
	set menutext=Install Fix Calendar Sync App
	call :push_file fix CalendarProvider1241_Install-signed.zip
	call :boot_cwm x
	call :flash_zip CalendarProvider1241_Install-signed.zip
	pause
	call :like_toolkit
)
if %menu%==0 (
	set menutext=Clean send file^(s^)
	call :clean_files
	pause
)
if %menu%==u call :download_driver
if %menu%==h call :usbdebug
if %menu%==d call :donate
if %menu%==x goto end
goto menu_work

:toolkit_site
start http://www.artit-k.com/mobile/nokia-x-platform/tool/nokia-x-toolkit/
goto :eof

:download_toolkit_part
echo.
echo      Download %1 Part!
echo.
echo.
echo.
set dl=-1
set /P dl= Type [d] for Download then press ENTER: 
if %dl%==d call :toolkit_site
goto :eof

:download_driver
start http://tools.nokia.com/nokia-x/repository/nokia_x_usb_driver.zip
goto :eof

REM :unknown_source
REM start info\Unknown_sources.png
REM goto :eof

:usbdebug
start info\USB_debugging.png
goto :eof

:donate
start http://www.artit-k.com/nokia-x-platform/tool/nokia-x-toolkit/donate.php
goto :eof

:like_toolkit
call :head
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo             If you like Nokia X Toolkit           
echo             Please donate to developer
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo  Press any key for donate, or type [NO] for cancel 
set like=-1
set /P like= then press ENTER: 
if %like%==NO goto :eof
call :donate
goto :eof

REM :set_unknown_source
REM call :unknown_source
REM echo.
REM echo      Open Settings ^> Security
REM echo  Check Unknown sources
REM pause
REM goto :eof

:test_usb_debugging
echo.
echo      Open device normally and connect to PC.
echo  With USB Debugging option
adb wait-for-device > nul
goto :eof

:push_file
call :show_work
if not exist %1\%2 (
	set reject=1
	call :download_toolkit_part "Flashable"
	goto :eof
)
call :test_usb_debugging
echo.
echo ^> Put file...
adb push %1\%2 /sdcard/ > nul
goto :eof

:clean_files
call :show_work
call :test_usb_debugging
echo.
echo ^> Delete file^(s^)...
adb shell rm /sdcard/Superuser-3.1.3-arm-signed.zip
adb shell rm /sdcard/UPDATE-SuperSU-v1.94.zip
adb shell rm /sdcard/UPDATE-SuperSU-v2.01.zip
adb shell rm /sdcard/superuser_1.0.3.0.zip
adb shell rm /sdcard/Nokia-X_GApps_Install-signed.zip
adb shell rm /sdcard/Nokia-X_GApps_Uninstall-signed.zip
adb shell rm /sdcard/CalendarProvider1122_Install-signed.zip
adb shell rm /sdcard/CalendarProvider1241_Install-signed.zip
goto :eof

:boot_bootloader
echo.
echo ^> Reboot to bootloader...
adb reboot-bootloader > nul
goto :eof

:boot_recovery
call :show_work
call :test_usb_debugging
echo.
echo ^> Reboot to recovery...
adb reboot recovery > nul
goto :eof

:boot_cwm
if %reject%==1 goto :eof
if %1==h call :show_work
if not exist recovery\cwm-6048-normandy.img (
	set reject=1
	call :download_toolkit_part "Custom Recovery"
	goto :eof
)
if %1==h call :test_usb_debugging
call :boot_bootloader
echo.
echo ^> Wait for bootloader ready...
echo ^> and boot to ClockworkMod...
fastboot -i 0x0421 boot recovery\cwm-6048-normandy.img
goto :eof

:flash_cwm
if %reject%==1 goto :eof
call :show_work
if not exist recovery\cwm-6048-normandy.img (
	set reject=1
	call :download_toolkit_part "Custom Recovery"
	goto :eof
)
call :test_usb_debugging
call :boot_bootloader
echo.
echo ^> Wait for bootloader ready...
echo ^> and flash ClockworkMod...
fastboot -i 0x0421 flash recovery recovery\cwm-6048-normandy.img
goto :eof

:flash_zip
if %reject%==1 goto :eof
REM echo      Select menu install zip from sdcard
REM echo  choose zip from internal sdcard
echo.
echo      Select menu install zip
echo  choose zip from /storage/sdcard0
echo  and Choose file %1
REM echo  in /sdcard
goto :eof

:end
adb kill-server > nul
call :head
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                     Have fun!!
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
call :toolkit_site
pause > nul
exit
