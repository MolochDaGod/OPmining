@cd /d "%~dp0"
nbminer -a ethash -o stratum+tcp://asia2.ethermine.org:14444 -u 0x4296116d44a4a7259B52B1A756e19083e675062A.default -log -pl 70%% -cclock @1400 -mclock 1000 -fan 100
pause