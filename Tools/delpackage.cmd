/* Delete package directory listed in argument   */
/* And renumber all other dirs                   */
/* WARNING! All files in directory will be lost! */

Parse arg Delnum

Deldir = Directory()'\'Delnum
Call SysFileTree Directory()'\*.*', 'Dirs', 'DO'
Do !idx = Delnum+1 To Dirs.0
  Address CMD "@move "!idx" "!idx-1||"- 2>&1 >NUL"
End
Call SysFileTree Deldir'\*.*', 'Files', 'FOS', '*****'
Do !idx = 1 to Files.0
  Call SysFileDelete Files.!idx
End
Call SysFileTree Deldir'\*.*', 'Files', 'DOS', '*****'
Do !idx = 1 to Files.0
  Count = Files.0 + 1 - !idx
  Call SysRmDir Files.Count
End
  Call SysRmDir Deldir
Do !idx = Delnum To Dirs.0-1
  Address CMD "@move "!idx"- "!idx" 2>&1 >NUL"
End
Exit

