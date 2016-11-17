/* Insert empty package directory BEFORE listed in argument */
/* And renumber all other dirs                              */

Parse arg beforeN
Call SysFileTree Directory()'\*.*', 'Dirs', 'DO'
Do !idx = beforeN To Dirs.0
  Address CMD "@move "!idx" "!idx+1"- 2>&1 >NUL"
End
Call SysMkDir beforeN
Do !idx = beforeN+1 To Dirs.0+1
  Address CMD "@move "!idx"- "!idx" 2>&1 >NUL"
End
Exit