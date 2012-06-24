.\" {PTM/PB/0.1/02-04-1999/"odmontuj system plik�w"}
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
.TH UMOUNT 8 "5 Lipiec 1996" "Linux 2.0" "Podr�cznik programisty linuxowego"
.SH NAZWA
umount \- odmontuj systemy plik�w
.SH SK�ADNIA
.BI "umount [\-hV]"
.LP
.BI "umount -a [\-nv] [\-t " vfstype ]
.br
.BI "umount [\-nv] " "device " | " dir " [...]
.SH OPIS
Komenda
.B umount
od��cza wymienione systemy plik�w z hierarchii plik�w. System plik�w mo�na
poda� zar�wno przez podanie katalogu, w kt�rym zosta� zamontowany, jak i
przez podanie urz�dzenia, na kt�rym istnieje.

Zauwa�, �e system plik�w nie mo�e by� odmontowany gdy jest `busy' (zaj�ty) -
ba przyk�ad gdy s� na nim otwarte pliki, lub gdy jaki� proces ma jego
pracuj�ce drzewo katalog�w, lub gdy w u�ytku jest znajduj�cy si� na nim
plik swap.

Opcje komendy
.BR umount :
.TP
.B \-V
Drukuj wersj� i zako�cz.
.TP
.B \-h
Wydrukuj informacj� o u�yciu i zako�cz.
.TP
.B \-v
Tryb verbose (gadatliwy).
.TP
.B \-n
Odmontuj bez zapisywania w
.IR /etc/mtab .
.TP
.B \-a
Odmontuj wszystkie systemy plik�w opisane w
.IR /etc/mtab .
.TP
.BI \-t " vfstype"
Wska�, �e akcje powinny by� dokonywane tylko na systemach plik�w okre�lonego
typu. Mo�na poda� wi�cej ni� jeden typ, u�ywaj�c listy oddzielanej
przecinkami. Lista system�w plik�w mo�e by�poprzedzona s�owem
.BR no ,
aby wskaza�, �e akcja wymienionych system�w plik�w nie dotyczy.

.SH "URZ�DZENIE LOOP"
Komenda
.B umount
mo�e zwolni� zwi�zane z montowaniem urz�dzenie loop. Dzieje si� tak, gdy
napotkana zostanie opcja `loop=...' w pliku
.IR /etc/mtab .
Wszelkie urz�dzenia loop mog� by� zwolnione przez `losetup -d', zobacz
.BR losetup (8).


.SH PLIKI
.I /etc/mtab
tabela zamontowanych system�w plik�w

.SH "ZOBACZ TAK�E"
.BR umount (2),
.BR mount (8),
.BR losetup (8).

.SH HISTORIA
Komenda
.B umount
pojawi�a si� w Wersji 6 AT&T UNIX.
