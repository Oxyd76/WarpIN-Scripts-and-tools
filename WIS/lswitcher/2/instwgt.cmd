/* Install / Uninstall localisations for widget */

LNG = ''
Parse upper arg LNG
Say LNG
If LNG = '' Then LNG = EN
rc = stream(XWPPath()'\lswres'LNG'.dll', 'C', 'Query Exists')
If rc = '' Then Do
  If LNG = 'EN' Then Do
    Address CMD "@copy lswitch.hlp "XWPPath()" 2>&1 > NUL"
  End
  Address CMD "@copy lswres"LNG".dll "XWPPath()" 2>&1 > NUL"
  Say '['LNG']=============> INSTALLED <================='
End
Else Do
  If LNG = 'EN' Then Do
    Address CMD "@del "XWPPath()"\lswitch.hlp 2>&1 > NUL"
  End
  Address CMD "@del "XWPPath()"\lswres"LNG".dll 2>&1 > NUL"
  Say '['LNG']============> UNINSTALLED <================'
End
Exit

XWPPath:
Return Strip(SysIni('User', 'XWorkplace', 'XFolderPath'), 'T',X2C(0))'\PLUGINS\XCENTER'