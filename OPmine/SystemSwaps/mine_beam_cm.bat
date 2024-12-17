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

set "POOL=beam.sunpool.top:3334"
set "WALLET=32f2e8765c2e8f5ea41becc5f397024c94d80cc5fc50ee917af23b260ecb3a5f.testRun"										

Rem #################################
Rem ##  End of user-editable part  ##
Rem #################################

lolMiner.exe --coin BEAM --pool !POOL! --user !WALLET! --computemode
timeout 10

