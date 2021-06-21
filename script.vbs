set x = createobject("Wscript.shell")
set c = createobject("Scripting.filesystemobject")
set objShell=createobject("Shell.Application")
on error resume next

Const HKEY_LOCAL_MACHINE = &H80000002
strComputer = "."


Set objReg=GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & _
 strComputer & "\root\default:StdRegProv")

 checkOSArch = WshShell.RegRead("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\PROCESSOR_ARCHITECTURE")
 if checkOSArch = "x86" Then
x.Run "reg add ""HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU"" /v NoAutoUpdate /t REG_DWORD /d 1 /f",true
else

x.Run """%programfiles%\DesktopCentral_Agent\bin\dctask64.exe"" invokeexe ""reg add """"HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU"""" /v NoAutoUpdate /t REG_DWORD /d 1 /f""",true
x.RegWrite"KEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\DisableChangePassword","1","REG_DWORD"
x.RegWrite"HKEY_CURRENT_USER\Control Panel\Bluetooth","1","REG_DWORD"
x.RegWrite"HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\EnableLUA","0","REG_DWORD"
x.RegWrite"HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop\NoChangingWallPaper","1","REG_DWORD"
x.RegWrite"HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system\ConsentPromptBehaviorAdmin","0","REG_DWORD"
x.RegWrite"HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Feeds","2","REG_DWORD"
x.RegWrite"HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\EnableBalloonTips","0","REG_DWORD"
x.RegWrite"HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoWinKeys","1","REG_DWORD"
x.RegWrite"HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\EncryptionContextMenu","1","REG_DWORD"
x.RegWrite"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NoLockScreen","1","REG_DWORD"
x.RegWrite"HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\DisableNotificationCenter","1","REG_DWORD"
x.RegWrite"HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\ClearPageFileAtShutDown","1","REG_DWORD"
x.RegWrite"HKLM\SOFTWARE\Policies\Microsoft\Windows\System\DisableLogonBackgroundImage","1","REG_DWORD"
x.RegWrite"HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize\AppsUseLightTheme","0","REG_DWORD"
x.RegWrite"HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\UseOLEDTaskbarTransparency","1","REG_DWORD"
x.RegWrite"SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools","1","REG_DWORD"
End if
