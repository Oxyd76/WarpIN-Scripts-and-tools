Working model of WarpINning ;-)
===============================

Every package in WarpIn Script (wis) have a numbered index.
Idea of working model: Before compiling wpi archive, content of every package
must be placed to numbered directory similar to package index in wis script.
For example:
- lSwitcher   -- root directory of the project.
- lSwithcer\1 -- Content of package 1 in wis script
- lSwithcer\2 -- Content of package 2 in wis script
- lSwithcer\3 -- Content of package 3 in wis script
- ...
- lSwithcer\n -- Content of package n in wis script
- lSwitcher\lswitcher.wis -- wis script, of course! ;-)

For happy WarpINnning:
- Add dir with WarpIN / wic.exe to PATH and LIBPATH (C:\ECS\Install\Warpin not in PATH / LIBPATH).
- Place this scripts to warpin directory.
- Reboot!
- Happy WarpINnning! :-)


Scripts descriptions
====================

- wpimake.cmd -- Simple make system for building wpi archive via working model.
- revisioner.cmd -- Change version in wis script, use template.
- wicunpack.cmd -- Unpack WPI archive install script & packages to working model dirs.
- inspackage -- Insert empty packkage directory and renumber all other dirs.
- delpackage -- Delete package directory(and content!) and renumber all other dirs.