.\" {PTM/PB/0.1/02-02-1999/"W³±cz/wy³±cz urz±dzenia swapowe"}
.\" Translation 1999 Przemek Borys <pborys@dione.ids.pl>
.\" Copyright (c) 1980, 1991 Regents of the University of California.
.\" All rights reserved.
.\"
.\" Redistribution and use in source and binary forms, with or without
.\" modification, are permitted provided that the following conditions
.\" are met:
.\" 1. Redistributions of source code must retain the above copyright
.\"    notice, this list of conditions and the following disclaimer.
.\" 2. Redistributions in binary form must reproduce the above copyright
.\"    notice, this list of conditions and the following disclaimer in the
.\"    documentation and/or other materials provided with the distribution.
.\" 3. All advertising materials mentioning features or use of this software
.\"    must display the following acknowledgement:
.\"	This product includes software developed by the University of
.\"	California, Berkeley and its contributors.
.\" 4. Neither the name of the University nor the names of its contributors
.\"    may be used to endorse or promote products derived from this software
.\"    without specific prior written permission.
.\"
.\" THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
.\" ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
.\" IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
.\" ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
.\" FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
.\" DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
.\" OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
.\" HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
.\" LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
.\" OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
.\" SUCH DAMAGE.
.\"
.\"     @(#)swapon.8	6.3 (Berkeley) 3/16/91
.\"
.\" Sun Dec 27 12:31:30 1992: Modified by faith@cs.unc.edu
.\" Sat Mar  6 20:46:02 1993: Modified by faith@cs.unc.edu
.\" Sat Oct  9 09:35:30 1993: Converted to man format by faith@cs.unc.edu
.\" Sat Nov 27 20:22:42 1993: Updated authorship information, faith@cs.unc.edu
.\" Mon Sep 25 14:12:38 1995: Added -v and -p information
.\" Tue Apr 30 03:32:07 1996: Added some text from A. Koppenhoefer
.\"
.TH SWAPON 8 "25 Wrzesieñ 1995" "Linux 1.x" "Podrêcznik programisty linuxowego"
.SH NAZWA
swapon, swapoff \- w³±cz/wy³±cz urz±dzenia i pliki swapu
.SH SK£ADNIA
.B /sbin/swapon [\-h \-V]
.br
.B /sbin/swapon \-a [\-v]
.br
.BI "/sbin/swapon [\-v] [\-p " "priority" "] " " specialfile " ...
.br
.B /sbin/swapoff [\-h \-V]
.br
.B /sbin/swapoff \-a
.br
.BI /sbin/swapoff " specialfile " ...
.SH OPIS
.B Swapon
jest u¿ywany do okre¶lania urz±dzeñ na których ma miejsce swapowanie i
stronicowanie. Odwo³anie do
.B swapon
normalnie powinno pojawiaæ siê w systemowym pliku inicjalizacyjnym
.I /etc/rc,
udostêpniaj±c wszystkie urz±dzenia swapu.

Normalnie u¿ywana jest pierwsza postaæ:
.TP
.B \-h
Udostêpnij pomoc.
.TP
.B \-V
Wy¶wietl wersjê.
.TP
.B \-a
Udostêpnij wszystkie urz±dzenia zaznaczone w
.I /etc/fstab
jako ``sw''.
.TP
.BI \-p " priority"
Ustaw priorytet dla
.BR swapon .
Opcja ta jest dostêpna tylko je¶li
.B swapon
zosta³ skompilowany pod j±drem 1.3.2 lub nowszym.
.I priority
jest warto¶ci± z przedzia³u 0 do 32767. Zobacz
.BR swapon (2)
dla kompletnego opisu priorytetów swapowych. Do /etc/fstab mo¿esz dodaæ pole
.BI pri= value
dla u¿ytku z
.BR "swapon -a" .
.PP
.B Swapoff
wy³±cza swapowanie na wybranych urz±dzeniach i plikach, lub na wszystkich
wpisach swapu z
.I /etc/fstab
o ile zostanie mu przekazana flaga
.BR \-a .
.SH ZOBACZ TAK¯E
.BR swapon "(2), " swapoff "(2), " fstab "(5), " init "(8), " mkswap (8),
.BR rc "(8), " mount (8)
.SH PLIKI
.I /dev/hd??
standardowe urz±dzenia stronicuj±ce
.br
.I /dev/sd??
standardowe urz±dzenia stronicuj±ce (SCSI)
.br
.I /etc/fstab
tablica opisu systemów plików (ascii)
.SH HISTORIA
Komenda
.B swapon
pojawi³a siê w 4.0BSD.
.SH AUTORZY
Zobacz stronê
.BR mount (8)
dla listy autorów. Najwiêcej pracy w³o¿yli 
Doug Quale, H. J. Lu, Rick Sladkey, i Stephen Tweedie.
