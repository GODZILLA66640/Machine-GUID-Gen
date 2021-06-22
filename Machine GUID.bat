@echo off
 call :isAdmin
 if %errorlevel% == 0 (
    goto :run
 ) else (
    echo Requesting administrative privileges...
    goto :UACPrompt
 )
 exit /b

 :isAdmin
    fsutil dirty query %systemdrive% >nul
 exit /b

 :run
color 4
title Machine GUID Generator

:Color Text
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)

call :colorEcho 0f "Your Machine GUID is"
echo.
for /f "tokens=2*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography" /v MachineGuid ^| findstr "REG_"') do @echo %%b
call :colorEcho 0f "Do you want a new Machine GUID"
echo.

call :colorEcho 04 "1.Generate new Machine GUID"
echo.
call :colorEcho 04 "2.Exit"
echo.
CHOICE /C 12 /M "Choose an option:"




:Choice
IF ERRORLEVEL 2 GOTO EXIT
IF ERRORLEVEL 1 GOTO A

:A
cls
Setlocal EnableDelayedExpansion
set AAAAD=8
set AAAAE=abcdef0123456789
set AAAAC=%AAAAE%987654321

:AAAAB
if not "%AAAAC:~18%"=="" set AAAAC=%AAAAC:~9%& set /A AAAAG+=9& goto :AAAAB
set AAAAF=%AAAAC:~9,1%
set /A AAAAG=AAAAG+AAAAF
set AAAAH=0
set AAAAI=

:AAAAJ
set /a AAAAH+=1
set AAAAK=%Random%
set /A AAAAK=AAAAK%%%AAAAG%
set AAAAI=!AAAAI!!AAAAE:~%AAAAK%,1!
if !AAAAH! lss %AAAAD% goto AAAAJ

set ZZZZD=4
set ZZZZE=abcdef0123456789
set ZZZZC=%ZZZZE%987654321

:ZZZZB
if not "%ZZZZC:~18%"=="" set ZZZZC=%ZZZZC:~9%& set /A ZZZZG+=9& goto :ZZZZB
set ZZZZF=%ZZZZC:~9,1%
set /A ZZZZG=ZZZZG+ZZZZF
set ZZZZH=0
set ZZZZI=

:ZZZZJ
set /a ZZZZH+=1
set ZZZZK=%Random%
set /A ZZZZK=ZZZZK%%%ZZZZG%
set ZZZZI=!ZZZZI!!ZZZZE:~%ZZZZK%,1!
if !ZZZZH! lss %ZZZZD% goto ZZZZJ

set YYYYD=4
set YYYYE=abcdef0123456789
set YYYYC=%YYYYE%987654321

:YYYYB
if not "%YYYYC:~18%"=="" set YYYYC=%YYYYC:~9%& set /A YYYYG+=9& goto :YYYYB
set YYYYF=%YYYYC:~9,1%
set /A YYYYG=YYYYG+YYYYF
set YYYYH=0
set YYYYI=

:YYYYJ
set /a YYYYH+=1
set YYYYK=%Random%
set /A YYYYK=YYYYK%%%YYYYG%
set YYYYI=!YYYYI!!YYYYE:~%YYYYK%,1!
if !YYYYH! lss %YYYYD% goto YYYYJ

set XXXXD=4
set XXXXE=abcdef0123456789
set XXXXC=%XXXXE%987654321

:XXXXB
if not "%XXXXC:~18%"=="" set XXXXC=%XXXXC:~9%& set /A XXXXG+=9& goto :XXXXB
set XXXXF=%XXXXC:~9,1%
set /A XXXXG=XXXXG+XXXXF
set XXXXH=0
set XXXXI=

:XXXXJ
set /a XXXXH+=1
set XXXXK=%Random%
set /A XXXXK=XXXXK%%%XXXXG%
set XXXXI=!XXXXI!!XXXXE:~%XXXXK%,1!
if !XXXXH! lss %XXXXD% goto XXXXJ

set WWWWD=12
set WWWWE=abcdef0123456789
set WWWWC=%WWWWE%987654321

:WWWWB
if not "%WWWWC:~18%"=="" set WWWWC=%WWWWC:~9%& set /A WWWWG+=9& goto :WWWWB
set WWWWF=%WWWWC:~9,1%
set /A WWWWG=WWWWG+WWWWF
set WWWWH=0
set WWWWI=

:WWWWJ
set /a WWWWH+=1
set WWWWK=%Random%
set /A WWWWK=WWWWK%%%WWWWG%
set WWWWI=!WWWWI!!WWWWE:~%WWWWK%,1!
if !WWWWH! lss %WWWWD% goto WWWWJ

:deez
set deez=!AAAAI!-!ZZZZI!-!YYYYI!-!XXXXI!-!WWWWI!
set deez=!deez!

:Reg DIR
reg delete "HKLM\SOFTWARE\Microsoft\Cryptography" /v MachineGuid /f >Nul
reg add "HKLM\SOFTWARE\Microsoft\Cryptography" /v MachineGuid /d !deez! >Nul


call :colorEcho 0f "==============================================================="
echo.
call :colorEcho 0f "["
call :colorEcho 0f "Your new Machine GUID is"
call :colorEcho 04 " !deez!"
call :colorEcho 0f "]"
echo.
call :colorEcho 0f "==============================================================="
echo.
call :colorEcho 04 "RESTART YOUR COMPUTER NOW!"
echo.
timeout 10 >nul
cls
goto run

:exit
exit

:colorEcho
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i

 exit /b

 :UACPrompt
   echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
   echo UAC.ShellExecute "cmd.exe", "/c %~s0 %~1", "", "runas", 1 >> "%temp%\getadmin.vbs"
   "%temp%\getadmin.vbs"
   del "%temp%\getadmin.vbs"
  exit /B`
