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
fstab \- statyczna informacja o systemach plików
.SH SK£ADNIA
.B #include <fstab.h>
.SH OPIS
Plik
.B fstab
zawiera opisowe informacje na temat ró¿nych systemów plików.
.B fstab
jest czytany wy³±cznie przez programy i nie jest przez nie zapisywany;
zadaniem administratora jest prawid³owe stworzenie tego pliku i
zarz±dzanie nim. Ka¿dy system plików jest opisywany przez osobne linie;
pola w ka¿dej linii s± oddzielane przez znak spacji, lub tabulatora.
Uk³ad pól w pliku
.B fstab
jest wa¿ny, poniewa¿
.BR fsck "(8), " mount "(8), and " umount "(8)"
sekwencyjnie pobieraj± dane z pliku
.B fstab
w celu wykonania swoich zadañ.

Pierwsze pole,
.RI ( fs_spec ),
opisje specjalne urz±dzenie blokowe, lub zdalny system plików,
przeznaczony do zamontowania.

Drugie pole,
.RI ( fs_file ),
wskazuje na miejsce, w którym ma byæ dany system plików zamoontowany. Dla
partycji wymiany (ang. "swap partition") to pole powinno zawieraæ warto¶æ
``none''.

Trzecie pole,
.RI ( fs_vfstype ),
opisuje typ systemy plików. Obecnie system obs³uguje trzy rodzaje systemów
plików:
.TP
.I minix
lokalny system plików, obs³uguj±cy nazwy plików o d³ugo¶ci 14, lub 30
znaków.
.TP
.I ext
lokalny system plików z d³u¿szymi nazwami plików i wiêkszymi "inodes".
Ten system plików zosta³ zast±piony systemem plików
.I ext2
i nie powinien byæ u¿ywany.
.TP
.I ext2
lokalny system plików z d³u¿szymi nazwami plików, wiêkszymi "inodes" i
wieloma innymi dodatkami.
.TP
.I xiafs
lokalny system plików z d³u¿szymi nazwami plików, wiêkszymi "inodes" i
wieloma innymi dodatkami.
.TP
.I msdos
lokalny system plików dla partycji MS-DOS.
.TP
.I hpfs
lokalny system plików dla partycji HPFS.
.TP
.I iso9660
lokalny system plików, u¿ywany przez stacje CD-ROM.
.TP
.I nfs
system plików, s³u¿±cy do montowania partycji z systemów zdalnych.
.TP
.I swap 
partycja dysku, u¿¿ywana jako przestrzeñ wymiany.
.PP
Je¿eli
.I vfs_fstype
jest ustawiony jako ``ignore'', to pole jest ignorowane. Jest to
u¿yteczne, aby pokazaæ, które partycje dysku s± aktualnie nieu¿ywane.

Czwarte pole,
.RI ( fs_mntops ),
opisuje opcje montowania, zwi±zane z danymi systemami plików.

Jest sformatowane jako lista opcji, oddzielonych przecinkami. Zawiera co
najmniej typ montowania oraz jakiekolwiek opcje, odpowiednie do danego
typu systemu plików.
Aby uzyskaæ dokumentacjê dostêpnych opcji dla nie-nfs'owych systemów
plików, zobacz
.BR mount (8).
Aby uzyskaæ dokumentacjê wszystkich opcji, specyficznych dla nfs, zobacz
.BR nfs (5).
Wspóln± opcj± dla wszystkich typów systemów plików jest opcja ``noauto''
(nie montuj, gdy "mount -a" jest dane, np. podczas ³adowania systemu),
i ``user'' (pozwala u¿ytkownikowi na montowanie). Aby dowiedzieæ siê
wiêcej, zobacz
.BR mount (8).

Pi±te pole,
.RI ( fs_freq ),
jest u¿ywane przez komendê
.BR dump (8)
aby wykryæ, który system plików musi byæ od³±czony. Je¿eli nie ma
informacji o tym polu, zwracana jest warto¶æ 0 i 
.B dump
przujmie, ¿e dany sustem plików nie musi byæ od³±czany.

Szóste pole,
.RI ( fs_passno ),
jest u¿ywane przez program
.BR fsck (8)
aby zadecydowaæ, jaka powinna byæ kolejno¶æ spradzania systemów plików
podczas ³adowania systemu. G³ówny system plików powinien mieæ
.I fs_passno
równ± 1, za¶ inne systemy plików powinny mieæ
.I fs_passno
równe 2. Systemy plików w obrêbie dysku bêd± sprawdzane sekwencyjnie, ale
systemy plików na innych dyskach bêd± sprawdzane w tym samym czasie, aby
zu¿ytkowaæ pararelizm, dostêpny w sprzêcie. Je¿eli szóste pole jest nie
podane, zostaje zwrócona warto¶æ zero i
.B fsck
zadecyduje, ¿e dany system plików nie musi byæ sprawdzany.

Aby poprawnie czytaæ pola z
.B fstab
nale¿y u¿ywaæ
.BR getmntent (3).
.SH PLIKI
.I /etc/fstab
Plik
.B fstab
jest przechowywany w 
.IR /etc .
.SH B£ÊDY
Dokumentacja w 
.BR mount (8)
jest czê¶ciej aktualna.
.SH "ZOBACZ TAK¯E"
.BR getmntent "(3), " mount "(8), " swapon "(8), " nfs (5)
.SH HISTORIA
Format pliku
.B fstab
pojawi³ siê w 4.0BSD.

