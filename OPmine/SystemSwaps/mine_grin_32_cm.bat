@echo off

setlocal enableDelayedExpansion

<!-- : --- Self-Elevating Batch Script ---------------------------
@whoami /groups | find "S-1-16-12288" > nul && goto :admin
set "ELEVATE_CMDLINE=cd /d "%~dp0" & call "%~f0" %*"
cscript //nologo "%~f0?.wsf" //job:Elevate & exit /b

-->
<job id="Elevate"><script language="VBScript">
  Set objShell = CreateObject("Shell.Application")
  Set objWshShell = WScript.CreateObject("WScript.Shell")
  Set objWshProcessEnv = objWshShell.Environment("PROCESS")
  strCommandLine = Trim(objWshProcessEnv("ELEVATE_CMDLINE"))
  objShell.ShellExecute "cmd", "/c " & strCommandLine, "", "runas"
</script></job>
:admin -----------------------------------------------------------

Rem #################################
Rem ## Begin of user-editable part ##
Rem #################################

set "POOL=asia-grin.2miners.com:3030"
set "WALLET=2aHR0cHM6Ly9ncmluLmJpdG1lc2guY29tL3d1Q3BLeW5kVllZanFQQm1ldHRCNWJjMjE2.WorkerName"
set "PASS=x"																			

Rem #################################
Rem ##  End of user-editable part  ##
Rem #################################


set "PARAMS=--profile %PROFILE%"

setx GPU_FORCE_64BIT_PTR 1
setx GPU_MAX_HEAP_SIZE 100
setx GPU_USE_SYNC_OBJECTS 1
setx GPU_MAX_ALLOC_PERCENT 100
setx GPU_SINGLE_ALLOC_PERCENT 100

lolMiner.exe --coin GRIN-C32 --pool !POOL! --user !WALLET! --pass !PASS! --computemode
timeout 10

