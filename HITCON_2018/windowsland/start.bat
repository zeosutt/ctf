rem reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\windowsland.exe" /v MaxLoaderThreads /t REG_DWORD /d 1
AppJailLauncher.exe windowsland.exe /timeout:12000000 /key:flag.txt /port:6677
