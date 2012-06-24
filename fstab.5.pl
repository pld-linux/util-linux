.\" Copyright (c) 1980, 1989, 1991 The Regents of the University of California.
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
.\"     @(#)fstab.5	6.5 (Berkeley) 5/10/91
.\"
.\" Modified Sat Mar  6 20:45:03 1993, faith@cs.unc.edu, for Linux
.\" Sat Oct  9 10:07:10 1993: converted to man format by faith@cs.unc.edu
.\" Sat Nov 20 20:47:38 1993: hpfs documentation added
.\" Sat Nov 27 20:23:32 1993: Updated authorship information
.\" Wed Jul 26 00:00:00 1995: Updated some nfs stuff, joey@infodrom.north.de
.\" Tue Apr  2 00:38:28 1996: added info about "noauto", "user", etc.
.\" Translation (c) 1998 "Wiktor J. Lukasik" <wiktorlu@technologist.com>
.\"
.TH FSTAB 5 "27 Grudnia 1993" "Linux 0.99" "Poradnik Programisty Linux'a"
.SH NAZWA
fstab \- statyczna informacja o systemach plik�w
.SH SK�ADNIA
.B #include <fstab.h>
.SH OPIS
Plik
.B fstab
zawiera opisowe informacje na temat r�nych system�w plik�w.
.B fstab
jest czytany wy��cznie przez programy i nie jest przez nie zapisywany;
zadaniem administratora jest prawid�owe stworzenie tego pliku i
zarz�dzanie nim. Ka�dy system plik�w jest opisywany przez osobne linie;
pola w ka�dej linii s� oddzielane przez znak spacji, lub tabulatora.
Uk�ad p�l w pliku
.B fstab
jest wa�ny, poniewa�
.BR fsck "(8), " mount "(8), and " umount "(8)"
sekwencyjnie pobieraj� dane z pliku
.B fstab
w celu wykonania swoich zada�.

Pierwsze pole,
.RI ( fs_spec ),
opisje specjalne urz�dzenie blokowe, lub zdalny system plik�w,
przeznaczony do zamontowania.

Drugie pole,
.RI ( fs_file ),
wskazuje na miejsce, w kt�rym ma by� dany system plik�w zamoontowany. Dla
partycji wymiany (ang. "swap partition") to pole powinno zawiera� warto��
``none''.

Trzecie pole,
.RI ( fs_vfstype ),
opisuje typ systemy plik�w. Obecnie system obs�uguje trzy rodzaje system�w
plik�w:
.TP
.I minix
lokalny system plik�w, obs�uguj�cy nazwy plik�w o d�ugo�ci 14, lub 30
znak�w.
.TP
.I ext
lokalny system plik�w z d�u�szymi nazwami plik�w i wi�kszymi "inodes".
Ten system plik�w zosta� zast�piony systemem plik�w
.I ext2
i nie powinien by� u�ywany.
.TP
.I ext2
lokalny system plik�w z d�u�szymi nazwami plik�w, wi�kszymi "inodes" i
wieloma innymi dodatkami.
.TP
.I xiafs
lokalny system plik�w z d�u�szymi nazwami plik�w, wi�kszymi "inodes" i
wieloma innymi dodatkami.
.TP
.I msdos
lokalny system plik�w dla partycji MS-DOS.
.TP
.I hpfs
lokalny system plik�w dla partycji HPFS.
.TP
.I iso9660
lokalny system plik�w, u�ywany przez stacje CD-ROM.
.TP
.I nfs
system plik�w, s�u��cy do montowania partycji z system�w zdalnych.
.TP
.I swap 
partycja dysku, u��ywana jako przestrze� wymiany.
.PP
Je�eli
.I vfs_fstype
jest ustawiony jako ``ignore'', to pole jest ignorowane. Jest to
u�yteczne, aby pokaza�, kt�re partycje dysku s� aktualnie nieu�ywane.

Czwarte pole,
.RI ( fs_mntops ),
opisuje opcje montowania, zwi�zane z danymi systemami plik�w.

Jest sformatowane jako lista opcji, oddzielonych przecinkami. Zawiera co
najmniej typ montowania oraz jakiekolwiek opcje, odpowiednie do danego
typu systemu plik�w.
Aby uzyska� dokumentacj� dost�pnych opcji dla nie-nfs'owych system�w
plik�w, zobacz
.BR mount (8).
Aby uzyska� dokumentacj� wszystkich opcji, specyficznych dla nfs, zobacz
.BR nfs (5).
Wsp�ln� opcj� dla wszystkich typ�w system�w plik�w jest opcja ``noauto''
(nie montuj, gdy "mount -a" jest dane, np. podczas �adowania systemu),
i ``user'' (pozwala u�ytkownikowi na montowanie). Aby dowiedzie� si�
wi�cej, zobacz
.BR mount (8).

Pi�te pole,
.RI ( fs_freq ),
jest u�ywane przez komend�
.BR dump (8)
aby wykry�, kt�ry system plik�w musi by� od��czony. Je�eli nie ma
informacji o tym polu, zwracana jest warto�� 0 i 
.B dump
przujmie, �e dany sustem plik�w nie musi by� od��czany.

Sz�ste pole,
.RI ( fs_passno ),
jest u�ywane przez program
.BR fsck (8)
aby zadecydowa�, jaka powinna by� kolejno�� spradzania system�w plik�w
podczas �adowania systemu. G��wny system plik�w powinien mie�
.I fs_passno
r�wn� 1, za� inne systemy plik�w powinny mie�
.I fs_passno
r�wne 2. Systemy plik�w w obr�bie dysku b�d� sprawdzane sekwencyjnie, ale
systemy plik�w na innych dyskach b�d� sprawdzane w tym samym czasie, aby
zu�ytkowa� pararelizm, dost�pny w sprz�cie. Je�eli sz�ste pole jest nie
podane, zostaje zwr�cona warto�� zero i
.B fsck
zadecyduje, �e dany system plik�w nie musi by� sprawdzany.

Aby poprawnie czyta� pola z
.B fstab
nale�y u�ywa�
.BR getmntent (3).
.SH PLIKI
.I /etc/fstab
Plik
.B fstab
jest przechowywany w 
.IR /etc .
.SH B��DY
Dokumentacja w 
.BR mount (8)
jest cz�ciej aktualna.
.SH "ZOBACZ TAK�E"
.BR getmntent "(3), " mount "(8), " swapon "(8), " nfs (5)
.SH HISTORIA
Format pliku
.B fstab
pojawi� si� w 4.0BSD.

