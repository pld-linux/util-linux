.\" {PTM/PB/0.1/28-09-1998/"wydrukuj architekturę maszyny"}
.\" arch.1 -- 
.\" Copyright 1993 Rickard E. Faith (faith@cs.unc.edu)
.\" Public domain: may be freely distributed.
.\" Translation (c) 1998 Przemek Borys <pborys@p-soft.silesia.linux.org.pl>
.TH ARCH 1 "4 lipca 1997" "Linux 2.0" "Podręcznik linuksowego programisty"
.SH NAZWA
arch \- wydrukuj architekturę maszyny
.SH SKŁADNIA
.B arch
.SH OPIS
.B arch
jest równoważny do
.B uname -m

Na dzisiejszych systemach linuksowych
.B arch
drukuje "i386", "i486",  "i586", "alpha", "sparc", "arm", "m68k", "mips", "ppc".
.SH ZOBACZ TAKŻE
.BR uname (1) ", " uname (2)
