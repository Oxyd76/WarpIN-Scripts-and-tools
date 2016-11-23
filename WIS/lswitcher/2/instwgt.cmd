/* Install / Uninstall localisations for widget */

Parse upper arg Path Type LNG
If Path = '' Then Call Usage
If Type = '' Then Call Usage
If LNG = '' Then Call Usage
Select
  When Type = 'I' Then Do
    If LNG = 'EN' Then Do
      Address CMD "@copy lswitch.hlp "Strip(Path, 'T', '\')"\ 2>&1 > NUL"
      Address CMD "@copy lswitch.sym "Strip(Path, 'T', '\')"\ 2>&1 > NUL"
      Address CMD "@copy lswitch.xqs "Strip(Path, 'T', '\')"\ 2>&1 > NUL"
    End
    Address CMD "@copy lswres"LNG".dll "Strip(Path, 'T', '\')"\ 2>&1 > NUL"
    Say '['LNG']=============> INSTALLED <================='
  End
  When Type = 'U' Then Do
    If LNG = 'EN' Then Do
      Address CMD "@del "Strip(Path, 'T', '\')"\lswitch.hlp 2>&1 > NUL"
      Address CMD "@del "Strip(Path, 'T', '\')"\lswitch.sym 2>&1 > NUL"
      Address CMD "@del "Strip(Path, 'T', '\')"\lswitch.xqs 2>&1 > NUL"
    End
    Address CMD "@"Directory()"\unlock "Strip(Path, 'T', '\')"\lswres"LNG".dll 2>&1 > NUL"
    Address CMD "@del "Strip(Path, 'T', '\')"\lswres"LNG".dll 2>&1 > NUL"
    Say '['LNG']============> UNINSTALLED <================'
  End
Otherwise Call Usage
End
Exit

Usage:
Say 'InstWgt.cmd uses from install/uninstall from WarpIN'
Say 'Usage: <Path to $XWP\plugins\XCenter> <U|I> <LNG>'
Exit 10