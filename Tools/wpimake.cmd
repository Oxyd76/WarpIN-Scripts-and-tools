/*                             WPI maker                             */
/*                       By Oxyd. osFree team.                       */
/*                                                                   */
/* 1. Place this script in directory in PATH environment.            */
/* 2. Create numbered directories in empty WORK dir(1\, 2\, 3\ etc). */
/*    Each directory should contain files corresponding to the       */
/*    packet number in the installation script.                      */
/* 3. Place your *.wis script into WORK dir. NAME of script must be  */
/*    correspond to target *.wpi archive!                            */
/* 4. Goto WORK directory, type "wpimake YourScript.wis" Press enter */
/*    .....                                                          */
/* 5. Profit!                                                        */
/*                         ...And Enjoy!                             */


call RxFuncAdd 'SysLoadFuncs', 'RexxUtil', 'SysLoadFuncs'
call SysLoadFuncs
!wic = 'wic '
!add = ' -a '
!wpi = '.wpi '
!mask = ' *'
!env = 'Address CMD "'
!quote = '"'
!scolon = '; '
!recurs = ' -r '
!dir = '-c'
!script = '-s '
Buffer = ''
Parse arg Name '.' !wis
!wis = '.'!wis
Call SysFileTree Directory()'\*.*', 'Dirs', 'DO'
Do !idx = 1 To Dirs.0
  Buffer = Buffer || !env || !wic || Name || !add || FileSpec('N', Dirs.!idx) || !recurs || !dir || Dirs.!idx || !mask || !quote || !scolon
End
Buffer = Buffer || !env || !wic || Name || !wpi || !script || Name || !wis || !quote
Interpret Buffer
Exit