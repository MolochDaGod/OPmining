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

set "POOL=asia-btg.2miners.com:14040"
set "WALLET=GcK4pcrrkm8dWHynmycC7bJJVrWzf7mk8T.workerName"
set "ALGO=EQUI144_5"
set "PERSONALIZATION=BgoldPoW"									

Rem #################################
Rem ##  End of user-editable part  ##
Rem #################################

lolMiner.exe -a !ALGO! --pers !PERSONALIZATION! --pool !POOL! --user !WALLET! --computemode
timeout 10

