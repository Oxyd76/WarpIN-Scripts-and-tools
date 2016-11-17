/* REXX */
call RxFuncAdd 'SysLoadFuncs', 'RexxUtil', 'SysLoadFuncs'
call SysLoadFuncs

Parse arg Wpi
Parse value Wpi with name '.' ext
WpiDir = Directory()
WisDir = WpiDir'\'name'\'
Call SysMkDir Strip(WisDir, 'T', '\')
Call GoDir Strip(WisDir, 'T', '\')
Say Directory()
Address CMD 'wic -X 'WpiDir'\'Wpi
Wis = WisDir || name'.wis'
Call stream Wis, 'C', 'Open Read'
Buffer = CharIn(Wis, 1, chars(Wis))
Do while Buffer \= ''
  Parse value Buffer with Stripped '<PCK INDEX=' Buffer
  Call SysMkdir WisDir || substr(Buffer, 1, 1)
  Call GoDir WisDir || substr(Buffer, 1, 1)
  Say substr(Buffer, 1, 1)
  If substr(Buffer, 1, 1) \= '' Then
    Address CMD 'wic 'WpiDir'\'Wpi' -x 'substr(Buffer, 1, 1)
  Call GoDir Strip(WisDir, 'T', '\')
End
Exit

GoDir:
Parse arg dirname
Call Directory dirname
Return