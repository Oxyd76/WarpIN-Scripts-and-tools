/* Substitute $REV$ to version X\Y\Z (or any string :-)) in WIS scripts */

call RxFuncAdd 'SysLoadFuncs', 'RexxUtil', 'SysLoadFuncs'
call SysLoadFuncs
!Rev = '$REV$'

Parse arg Template Version Wis
Call Stream Template, 'C', 'Open Read'
Buffer = CharIn(Template, 1, chars(Template))
Call stream Template, 'c', 'Close'
!pos = Pos(!Rev, Buffer)
Do while !pos > 0
  Buffer = Delstr(Buffer, !pos, Length(!Rev))
  Buffer = Insert(Version, Buffer, !pos-1, Length(Version))
  !pos = Pos(!Rev, Buffer)
End
Call Stream Wis, 'C', 'Open Write'
Call  CharOut Wis, Buffer, 1
Call stream Wis, 'C', 'Close'
Exit