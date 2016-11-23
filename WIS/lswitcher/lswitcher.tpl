<WARPIN VERSION="0.9.20">

<HEAD>

<!-- Find DLL directory ?:\ECS\DLL for eCS or ?:\OS2\APPS\DLL for classic OS/2 Warp -->
<REXX NAME="HookPath">
  Call RxFuncAdd 'SysLoadFuncs', 'RexxUtil', 'SysLoadFuncs'
  Call SysLoadFuncs
  BootDrive=GetBDrive()':\'
  Call SysFileTree BootDrive'ECS', 'Ecs', 'DO', '*****'
  If Ecs.0=0 Then Return BootDrive'OS2\APPS\DLL'
  Else Return BootDrive'ECS\DLL'

/* Getting bootdrive letter (compatible with all versions Warp-like OS-es) */
  GetBDrive:
  buf=value('PATH',,'OS2ENVIRONMENT')
  Parse upper value buf with left ':\OS2;' right
  Return Right(left,1)
</REXX>

<PCK INDEX=1
     PACKAGEID="Netlabs\lSwitcher\Hook\$REV$"
     TARGET="=("HookPath")"
     FIXED
     TITLE="lSwitcher Hook"
     SELECT
     NODESELECT
     KILLPROCESS=lswhook.dll

     >This package contains the OS/2 "lSwitcher Hook" utility.

     It must be installed in order for lSwitcher to
     function. If you are using the stand alone version
     of lSwither it can either be in the lSwitcher
     directory or in your LIB PATH. It defaults to
     eCS\dll. It must be in your LIB PATH if you wish
     to use the X(E)workplace widget.
     </PCK>

<PCK INDEX=2
     PACKAGEID="Netlabs\lSwitcher\Base\$REV$"
     TARGET="$(WARPIN_DEFAULTTOOLSPATH)\lSwitcher"
     BASE
     TITLE="lSwitcher"
     SELECT
     NODESELECT
     REQUIRES=1
     CREATEOBJECT="WPFolder|lSwitcher|<WP_DESKTOP>|OBJECTID=<LSWITCHER_FOLDER>"
     CREATEOBJECT="WPProgram|lSwitcher|<LSWITCHER_FOLDER>|EXENAME=$(2)\lswitch.exe;OBJECTID=<LSWITCHER>"
     CREATEOBJECT="WPProgram|lSwitcher Online Help|<LSWITCHER_FOLDER>|EXENAME=VIEW.EXE;PARAMETERS=$(2)\lswitch.HLP;OBJECTID=<LSWITCHERHELP>;"
     CREATEOBJECT="WPProgram|Read me|<LSWITCHER_FOLDER>|EXENAME=E.EXE;PARAMETERS=$(2)\Readme;OBJECTID=<LSWITCHERREADME>;"
     CREATEOBJECT="WPProgram|History|<LSWITCHER_FOLDER>|EXENAME=E.EXE;PARAMETERS=$(2)\history;OBJECTID=<LSWITCHERHISTORY>;"
     CREATEOBJECT="WPProgram|GNU Public License|<LSWITCHER_FOLDER>|EXENAME=E.EXE;PARAMETERS=$(2)\copying;OBJECTID=<LSWITCHERLICENSE>;"
     CLEARPROFILE="USER\lSwitcher"
     >This package contains the OS/2 "lSwitcher" utility.

     If you install lSwitcher and lSwitcher X(E)Workplace plugin,
     you can use one or the other not both. See the readme
     file for more details.
     </PCK>

<PCK INDEX=3
     PACKAGEID="Netlabs\lSwitcher\Xcenter plugin\$REV$"
     TARGET="$(Ulrich M”ller\XWorkplace\Kernel)\plugins\xcenter"
     FIXED
     TITLE="lSwitcher Plugin for X(E)Center"
     REQUIRES=1
     REQUIRES=2
     SELECT
     EXECUTE="$(2)\instwgt.cmd $(Ulrich M”ller\XWorkplace\Kernel)\plugins\xcenter I EN"
     DEEXECUTE="$(2)\instwgt.cmd $(Ulrich M”ller\XWorkplace\Kernel)\plugins\xcenter U EN"

     >This package contains the OS/2 "lSwitcher X(E)Workplace plugin" utility.

     If you install lSwitcher and lSwitcher X(E)Workplace plugin,
     you can use one or the other not both. See the readme
     file for more details.
     </PCK>

<GROUP TITLE="Localisations">
<PCK INDEX=4
     PACKAGEID="Netlabs\lSwitcher\NSL-CZ\$REV$"
     TARGET="$(2)"
     FIXED
     TITLE="lSwitcher CZ language"
     REQUIRES=2
     EXECUTE="$(2)\instwgt.cmd $(Ulrich M”ller\XWorkplace\Kernel)\plugins\xcenter I CZ"
     DEEXECUTE="$(2)\instwgt.cmd $(Ulrich M”ller\XWorkplace\Kernel)\plugins\xcenter U CZ"
     >This package contains the OS/2 "lSwitcher CZ language" resources.
     </PCK>

<PCK INDEX=5
     PACKAGEID="Netlabs\lSwitcher\NSL-RU\$REV$"
     TARGET="$(2)"
     FIXED
     TITLE="lSwitcher RU language"
     REQUIRES=2
     EXECUTE="$(2)\instwgt.cmd $(Ulrich M”ller\XWorkplace\Kernel)\plugins\xcenter I RU"
     DEEXECUTE="$(2)\instwgt.cmd $(Ulrich M”ller\XWorkplace\Kernel)\plugins\xcenter U RU"
     >This package contains the OS/2 "lSwitcher RU language" resources.
     </PCK>

<PCK INDEX=6
     PACKAGEID="Netlabs\lSwitcher\NSL-DE\$REV$"
     TARGET="$(2)\lSwitcher"
     FIXED
     TITLE="lSwitcher DE language"
     REQUIRES=2
     EXECUTE="$(2)\instwgt.cmd $(Ulrich M”ller\XWorkplace\Kernel)\plugins\xcenter I DE"
     DEEXECUTE="$(2)\instwgt.cmd $(Ulrich M”ller\XWorkplace\Kernel)\plugins\xcenter U DE"
     >This package contains the OS/2 "lSwitcher DE language" resources.
     </PCK>

<PCK INDEX=7
     PACKAGEID="Netlabs\lSwitcher\NSL-ES\$REV$"
     TARGET="$(2)\lSwitcher"
     FIXED
     TITLE="lSwitcher ES language"
     REQUIRES=2
     EXECUTE="$(2)\instwgt.cmd $(Ulrich M”ller\XWorkplace\Kernel)\plugins\xcenter I ES"
     DEEXECUTE="$(2)\instwgt.cmd $(Ulrich M”ller\XWorkplace\Kernel)\plugins\xcenter U ES"
     >This package contains the OS/2 "lSwitcher ES language" resources.
     </PCK>
</GROUP>
</HEAD>

<BODY>

<PAGE INDEX=1 TYPE=README>
<NEXTBUTTON TARGET=2>~Next</NEXTBUTTON>
<TEXT>NOTE:  A special thanks to Andrei Los for originally developing this program as open source software. Thanks also goes to others who have worked to improve and enhance this great program.</TEXT>
<README FORMAT=PLAIN EXTRACTFROMPCK="2">readme</README>
</PAGE>

<PAGE INDEX=2 TYPE=README>
<NEXTBUTTON TARGET=3>~I agree</NEXTBUTTON>
<TEXT>lSwitcher License: By pressing the "I agree" button, you agree to all terms and conditions of the license agreement below.</TEXT>
<README EXTRACTFROMPCK="2">copying</README>
</PAGE>

<PAGE INDEX=3 TYPE=README>
<NEXTBUTTON TARGET=4>~I WARNED!</NEXTBUTTON>
<TEXT>Warning note about localisations uninstall.</TEXT>
<README FORMAT=HTML>
<P>If you plan deinstall language pack(s) separately:
<OL>
  <LI>Go to settings(widget or standalone) ==> Miscellaneous.
  <LI>Switch to English, and save settings.
  <LI>You may deinstall additional language pack(s) safety.
</OL>
<P>Bugs and wishes (about this REPACK) send me on e-mail: <B><A HREF="mailto:oxyd76@gmail.com">oxyd76@gmail.com</A></b> with subj <I><B>WarpIN</B></I><BR>
Or make issue on <B><A HREF="https://github.com/Oxyd76/WarpIN-Scripts-and-tools/issues">https://github.com/Oxyd76/WarpIN-Scripts-and-tools/issues</A></B><BR>
<P>Oxyd.
</README>
</PAGE>

<PAGE INDEX=4 TYPE=CONTAINER>
<NEXTBUTTON TARGET=5>~Next</NEXTBUTTON>
<TEXT>Select your installation directory.</TEXT>
</PAGE>

<PAGE INDEX=5 TYPE=CONFIGURE>
<NEXTBUTTON TARGET=0>I~nstall</NEXTBUTTON>
<TEXT>Please select/deselect the desired configuration option(s).</TEXT>
</PAGE>

</BODY>
</WARPIN>

