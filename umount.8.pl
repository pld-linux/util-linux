.\" {PTM/PB/0.1/02-04-1999/"odmontuj system plików"}
.\" Copyright (c) 1996 Andries Brouwer
.\" This page is somewhat derived from a page that was
.\" (c) 1980, 1989, 1991 The Regents of the University of California
.\" and had been heavily modified by Rik Faith and myself.
.\"
.\" This is free documentation; you can redistribute it and/or
.\" modify it under the terms of the GNU General Public License as
.\" published by the Free Software Foundation; either version 2 of
.\" the License, or (at your option) any later version.
.\"
.\" The GNU General Public License's references to "object code"
.\" and "executables" are to be interpreted as the output of any
.\" document formatting or typesetting system, including
.\" intermediate and printed output.
.\"
.\" This manual is distributed in the hope that it will be useful,
.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
.\" GNU General Public License for more details.
.\"
.\" You should have received a copy of the GNU General Public
.\" License along with this manual; if not, write to the Free
.\" Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139,
.\" USA.
.\"
.TH UMOUNT 8 "5 Lipiec 1996" "Linux 2.0" "Podrêcznik programisty linuksowego"
.SH NAZWA
umount \- odmontuj systemy plików
.SH SK£ADNIA
.B umount
.RB [ \-hV ]
.LP
.B umount -a
.RB [ \-nrv ]
.RB [ \-t 
.IR vfstype ]
.br
.B umount
.RB [ \-nrv ]
.IR device | dir
.RI [ ... ]
.SH OPIS
Polecenie
.B umount
od³±cza wymienione systemy plików z hierarchii plików. System plików mo¿na
podaæ zarówno przez podanie katalogu, w którym zosta³ zamontowany, jak i
przez podanie urz±dzenia, na którym istnieje.

Zauwa¿, ¿e system plików nie mo¿e byæ odmontowany gdy jest `busy' (zajêty) -
na przyk³ad, gdy s± na nim otwarte pliki, gdy jaki¶ proces ma tam swój
katalog roboczy, albo gdy w u¿ytku jest znajduj±cy siê na nim plik wymiany.
Przeszkadzaj±cym procesem mo¿e byæ nawet sam \fBumount\fP - otwiera on libc,
za¶ libc z kolei mo¿e otwieraæ na przyk³ad pliki ustawieñ locale.
.SH OPCJE
.TP
.B \-V
Wydrukuj wersjê i zakoñcz.
.TP
.B \-h
Wydrukuj informacjê o u¿yciu i zakoñcz.
.TP
.B \-v
Tryb verbose (gadatliwy).
.TP
.B \-n
Odmontuj bez zapisywania w
.IR /etc/mtab .
.TP
.B \-r
Je¶li odmontowanie nie powiedzie siê, spróbuj zamontowaæ ponownie w trybie
read-only.
.TP
.B \-a
Odmontuj wszystkie systemy plików opisane w
.IR /etc/mtab .
(W
.B umount
wersji 2.7 i pó¼niejszych nie jest od³±czany system plików
.IR proc .)
.TP
.BI \-t " vfstype"
Wska¿, ¿e akcje powinny byæ dokonywane tylko na systemach plików okre¶lonego
typu. Mo¿na podaæ wiêcej ni¿ jeden typ, u¿ywaj±c listy oddzielanej
przecinkami. Lista systemów plików mo¿e byæ poprzedzona s³owem
.BR no ,
aby wskazaæ, ¿e akcja wymienionych systemów plików nie dotyczy.
.TP
.B \-f
Wymu¶ odmontowanie (w przypadku nieosi±galnego systemu NFS).
Wymaga j±dra 2.1.116 lub pó¼niejszego.
.SH "URZ¡DZENIE PÊTLI ZWROTNEJ - LOOP DEVICE"
Polecenie
.B umount
mo¿e zwolniæ zwi±zane z montowaniem urz±dzenie pêtli zwrotnej.
Dzieje siê tak, gdy napotkana zostanie opcja `loop=...' w pliku
.IR /etc/mtab .
Pozosta³e urz±dzenia loop mog± byæ zwolnione przez `losetup -d', zobacz
.BR losetup (8).
.SH PLIKI
.I /etc/mtab
tabela zamontowanych systemów plików
.SH "ZOBACZ TAK¯E"
.BR umount (2),
.BR mount (8),
.BR losetup (8).
.SH HISTORIA
Polecenie
.B umount
pojawi³o siê w Wersji 6 AT&T UNIX.
