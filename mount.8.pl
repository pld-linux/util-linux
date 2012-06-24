.\" {PTM/PB/0.1/02-02-1999/"montuj system plik�w"}
.\" Translation 1999 Przemek Borys <pborys@dione.ids.pl>
.\" Pfuh... to by�o wielkie... Ale �atwe.
.\" Aktualizacja: PTM/WK/2001/IX
.\"
.\" Copyright (c) 1996 Andries Brouwer
.\"
.\" This page is somewhat derived from a page that was
.\" (c) 1980, 1989, 1991 The Regents of the University of California
.\" and had been heavily modified by Rik Faith and myself.
.\" (Probably no BSD text remains.)
.\" Fragments of text were written by Werner Almesberger, Remy Card,
.\" Stephen Tweedie and Eric Youngdale.
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
.\" 960705, aeb: version for mount-2.7g
.\" 970114, aeb: xiafs and ext are dead; romfs is new
.\" 970623, aeb: -F option
.\" 970914, reg: -s option
.\" 981111, K.Garloff: /etc/filesystems
.\" 990111, aeb: documented /sbin/mount.smbfs
.\" 990730, Yann Droneaud <lch@multimania.com>: updated page
.\" 991214, Elrond <Elrond@Wunder-Nett.org>: added some docs on devpts
.\"
.TH MOUNT 8 "14 wrze�nia 1997" "Linux 2.0" "Podr�cznik programisty linuksowego"
.SH NAZWA
mount \- montuj system plik�w
.SH SK�ADNIA
.B mount
.RB [ \-lhV ]
.LP
.B mount \-a
.RB [ \-fFnrsvw ]
.RB [ \-t 
.IR typsystemu ]
.br
.B mount
.RB [ \-fnrsvw ]
.RB [ \-o
.IR opcje " [,...]]
.IB "urz�dzenie " | " katalog"
.br
.B mount
.RB [ \-fnrsvw ]
.RB [ \-t
.IR typsystemu ]
.RB [ \-o
.IR opcje "] " "urz�dzenie katalog"
.SH OPIS
Wszystkie pliki dost�pne w systemie UNIX s� zorganizowane w jednym wielkim
drzewie, hierarchii plik�w, zakorzenionej w
.BR / .
Pliki te mog� by� po�o�one na wielu urz�dzeniach. Polecenie
.B mount
umo�liwia przy��czenie systemu plik�w znajduj�cego si� na danym urz�dzeniu
do wielkiego drzewa plik�w. Odwrotnie, polecenie
.BR umount (8)
powoduje od��czenie go.

Standardowa posta� polecenia
.B mount
to
.RS
.br
.BI "mount \-t" " typ urz�dzenie katalog"
.RE
Nakazuje j�dru, by przy��czy�o system plik�w znaleziony na danym
.I urz�dzeniu
(kt�re jest typu
.IR typ )
w zadanym
.IR katalogu .
Poprzednia zawarto�� (je�li istnia�a) i w�a�ciciel oraz prawa katalogu
.I dir
staj� si� niewidzialne na czas przy��czenia (zamontowania) nowego systemu
plik�w. W tym czasie �cie�ka
.I katalog
odnosi si� do korzenia systemu plik�w na podanym
.IR urz�dzeniu .

Trzy formy wywo�ania niczego faktycznie nie montuj�:
.RS
.br
.B "mount \-h"
.RE
wypisuje komunikat pomocy,
.RS
.br
.B "mount \-V"
.RE
wypisuje wersj�, a samo
.RS
.B mount
.RB [ -l ]
.RB [ -t
.IR typ ]
.RE
pokazuje list� wszystkich zamontowanych system�w plik�w
(typu
.IR typ ).
Opcja -l ujmuje w zestawieniu r�wnie� etykiety (ext2 i XFS).
Patrz ni�ej.

.\" Faktycznie od 2.3.99. Pocz�tkow� sk�adni� by�o: mount -t bind.
Od wersji 2.4.0 Linuksa mo�liwe jest ponowne zamontowanie cz�ci systemu
plik�w w innym miejscu. S�u�y do tego wywo�anie:
.RS
.br
.B "mount --bind stary_katalog nowy_katalog"
.RE

System plik�w
.I proc
nie jest zwi�zany z �adnym urz�dzeniem specjalnym i podczas jego montowania
zamiast nazwy urz�dzenia mo�na u�y� dowolnego s�owa kluczowego, np.
.IR proc .
(Zwyczajowy wyb�r
.I none
jest mniej udany: b��d `none busy' od
.B umount
mo�e by� myl�cy.)

Wi�kszo�� urz�dze� jest wskazywanych przez nazw� pliku (specjalnego
urz�dzenia blokowego), jak np.
.IR /dev/sda1 ,
lecz istniej� inne mo�liwo�ci. Na przyk�ad w wypadku montowania NFS,
.I urz�dzenie
mo�e wygl�da� tak:
.IR knuth.cwi.nl:/dir .
Specjalne urz�dzenie blokowe mo�na wskaza� podaj�c etykiet� wolumenu
lub  UUID (zob. opcje \-L i \-U poni�ej).

Plik
.I /etc/fstab
(zobacz
.BR fstab (5)),
mo�e zawiera� wiersze opisuj�ce, jakie urz�dzenia gdzie s� zazwyczaj
montowane i przy u�yciu jakich opcji. Plik ten mo�e by� u�ywany na trzy
sposoby:
.LP
(i) Polecenie
.RS
.br
.B mount \-a
.RB [ -t
.IR typ ]
.RE
(zwykle podawane w skryptach startowych) powoduje zamontowanie wszystkich
system�w plik�w (danego typu) wymienionych w
.IR fstab ,
poza tymi, kt�rych wpisy zawieraj� s�owo kluczowe
.BR noauto .
.LP
(ii) Podczas montowania systemu plik�w wymienionego w
.IR fstab ,
wystarczy poda� tylko nazw� urz�dzenia lub tylko punkt montowania.
.LP
(iii) Tradycyjnie tylko superu�ytkownik mo�e montowa� systemy plik�w. Jednak
je�li
.I fstab
w danym wierszu zawiera opcj�
.BR user ,
to ka�dy mo�e zamontowa� odpowiadaj�cy temu wpisowi system plik�w.
.LP
Tak wi�c, je�li mamy wiersz
.RS
.br
.B "/dev/cdrom  /cd  iso9660  ro,user,noauto,unhide"
.RE
to dowolny u�ytkownik mo�e zamontowa� system plik�w iso9660 umieszczony na
CD-ROM-ie, pos�uguj�c si� poleceniem
.RS
.br
.B "mount /dev/cdrom"
.RE
lub
.RS
.br
.B "mount /cd"
.RE
Szczeg�y opisuje
.BR fstab (5).
Tylko u�ytkownik, kt�ry zamontowa� system plik�w mo�e ponownie go odmontowa�.
Je�eli zachodzi potrzeba, by odmotowaywa� m�g� ka�dy, w odpowiednim wierszu 
.I fstab
nale�y
zamiast
.B user
wpisa�
.BR users .
Opcja
.B owner
przypomina opcj�
.BR user ,
poza tym, �e dany u�ytkownik musi by� w�a�cicielem odpowiedniego pliku
specjalnego. Jest przydatna np. w przypadku
.I /dev/fd
je�li skrypt zg�oszeniowy (login script) czyni danego u�ytkownika
korzystaj�cego z konsoli w�a�cicielem tego urz�dzenia.

Programy
.B mount
i
.B umount
opiekuj� si� list� obecnie zamontowanych system�w plik�w, znajduj�c� si�
w pliku
.IR /etc/mtab .
Je�li nie podano argument�w dla
.BR mount ,
to wypisywana jest ta lista.
Gdy zamontowany jest system plik�w
.I proc
(powiedzmy, �e w
.IR /proc ),
pliki
.I /etc/mtab
i
.I /proc/mounts
maj� bardzo podobn� zawarto��. Pierwszy ma troch� wi�cej informacji, takich
jak opcje montowania, lecz niekoniecznie jest aktualny. (zobacz opcj�
.B \-n
poni�ej).
Mo�liwe jest zast�pienie
.I /etc/mtab
dowi�zaniem symbolicznym do
.IR /proc/mounts ,
ale w ten spos�b tracona jest cz�� danych, a szczeg�lnie mniej wygodna
b�dzie praca z urz�dzeniem loop.

.SH OPCJE
Pe�ny zestaw opcji u�ywanych przy wywo�ywaniu
.B mount
jest ustalany przez pobranie opcji dla danego systemu plik�w z
.IR fstab ,
a nast�pnie zastosowanie wszelkich opcji podanych argumentem
.BR \-o ,
a na koniec opcji
.BR \-r " lub " \-w ,
o ile istniej�.

Opcje dost�pne dla polecenia
.BR mount :
.TP
.B \-V
Wypisuje wersj�.
.TP
.B \-h
Wypisuje komunikat pomocy.
.TP
.B \-v
Tryb verbose (gadatliwy).
.TP
.B \-a
Montuje wszystkie systemy plik�w (zadanych typ�w) uj�te w
.IR fstab .
.TP
.B \-F
(U�yte w po��czeniu z
.BR \-a .)
Dla ka�dego urz�dzenia tworzy nowy proces r�wnoleg�y mount.
Powoduje to r�wnoleg�y przebieg montowania r�nych urz�dze� lub r�nych
serwer�w NFS. Zalet� jest wi�ksza szybko��: tak�e przekroczenia czasu
dla NFS b�d� wyznaczane r�wnolegle. Wad� jest to, �e montowania wykonywane
s� w niezdefiniowanej kolejno�ci. Nie mo�na zatem zastosowa� tej opcji
do r�wnoczesnego montowania
.I /usr
i
.IR /usr/spool .
.TP
.B \-f
Powoduje wykonywanie wszystkiego poza faktycznym wywo�aniem funkcji systemowej.
Je�li nie jest to oczywiste: ,,udaje'' to montowanie systemu plik�w.
W po��czeniu z flag�
.B \-v
przydaje si� do ustalenia, co usi�uje zrobi� polecenie
.BR mount .
Mo�e by� te� u�ywana do dodawania wpis�w dla urz�dze�, kt�re zamontowano
wcze�niej z opcj� -n.
.TP
.B \-l
Dok�ada etykiety ext2 i XFS do wyj�cia wypisywanego przez mount.
�eby opcja ta mog�a dzia�a�, mount musi mie� prawo odczytu urz�dzania
dyskowego (np. suid root). Etykiet� dla ext2 nadaje si� za pomoc� narz�dzia
.BR e2label (8),
za� dla XFS - stosuj�c
.BR xfs_admin (8).
.TP
.B \-n
Montuje bez zapisywania w
.IR /etc/mtab .
Jest to niezb�dne na przyk�ad gdy
.I /etc
jest systemem plik�w tylko dla odczytu.
.TP
.B \-s
Toleruje nieodpowiednie opcje montowania, zamiast ko�czy� prac�
niepowodzeniem. Powoduje to ignorowanie opcji montowania, kt�re nie s�
obs�ugiwane przez dany system plik�w. Nie wszystkie systemy plik�w rozpoznaj�
t� opcj�. Istnieje ona dla wspomo�enia Linuksowego automountera opartego
na autofs.
.TP
.B \-r
Montuje system plik�w w trybie tylko dla odczytu. Synonimem jest
.BR "\-o ro" .
.TP
.B \-w
Montuje system plik�w w trybie odczytu i zapisu. Tak jest domy�lnie.
Synonimem jest
.BR "\-o rw" .
.TP
.BI \-L " label"
Montuje partycj� posiadaj�c� podan� etykiet�
.IR label .
.TP
.BI \-U " uuid"
Montuje partycj� posiadaj�c� podany
.IR uuid .
Te dwie opcje wymagaj� istnienia pliku
.IR /proc/partitions
(obecnego od wersji 2.1.116 Linuksa).
.TP
.BI \-t " typ_systemu_plik�w"
Argument wyst�puj�cy po
.B \-t
jest u�ywany do wskazania rodzaju systemu plik�w.
Obecnie obs�ugiwane s� :
.IR adfs ,
.IR affs ,
.IR autofs ,
.IR coda ,
.IR coherent ,
.IR cramfs ,
.IR devpts ,
.IR efs ,
.IR ext ,
.IR ext2 ,
.IR hfs ,
.IR hpfs ,
.IR iso9660 ,
.IR minix ,
.IR msdos ,
.IR ncpfs ,
.IR nfs ,
.IR ntfs ,
.IR proc ,
.IR qnx4 ,
.IR romfs ,
.IR smbfs ,
.IR sysv ,
.IR udf ,
.IR ufs ,
.IR umsdos ,
.IR vfat ,
.IR xenix ,
.IR xfs ,
.IR xiafs .
Zauwa�, �e coherent, sysv i xenix s� r�wnowa�ne i �e
.I xenix
oraz
.I coherent
zostan� kiedy� usuni�te \(em nale�y zamiast nich stosowa�
.IR sysv .
Od j�dra wersji 2.1.21 typy
.I ext
i
.I xiafs
ju� nie istniej�.

Dla wi�kszo�ci typ�w, jedyne, co robi program
.BR mount ,
to po prostu wywo�uje funkcj� systemow�
.IR mount (2),
i nie jest tu wymagana �adna szczeg�owa wiedza o danym systemie plik�w.
Jednak�e dla kilku typ�w (jak np. nfs, smbfs, ncpfs) konieczny jest
niezaplanowany kod. Kod dla nfs jest wbudowany, ale smbfs i ncpfs maj�
osobny program montuj�cy. �eby umozliwi� jednolite traktowanie wszystkich
typ�w, mount wywo�any z typem
.I TYP
uruchamia program
.I /sbin/mount.TYP
(je�li takowy istnieje).
Poniewa� rozmaite wersje programu
.I smbmount
maj� r�ne konwencje wywo�a�, by� mo�e
.I /sbin/mount.smb
b�dzie musia� by� skryptem pow�oki, kt�ry dobierze w�a�ciwe wywo�anie.

Typ
.I iso9660
jest domy�lny. Je�li nie poda si� opcji
.B \-t
lub je�li podany zostanie typ
.BR auto ,
to typ systemu plik�w b�dzie wyszukiwany w superbloku.
Obs�ugiwane s�
.IR minix ", " ext ", " ext2 ", " xiafs ", " iso9660 ", " romfs
.RI , ufs ", " ntfs  ", " qnx4 ", " bfs ", " xfs ", " cramfs ", " hfs
.RI , hpfs ", " adfs .
Je�li test ten nie powiedzie si�, mount pr�buje odczyta� plik
.IR /etc/filesystems ,
lub, je�li on nie istnieje,
.IR /proc/filesystems .
Wypr�bowane zostan� wszystkie wymienione tam systemy plik�w, poza tymi
kt�re s� oznaczone jako "nodev" (np.
.IR devpts ,
.I proc
i
.IR nfs ).

Zauwa�, �e
.B auto
mo�e by� przydatne dla montowanych przez u�ytkownika dyskietek.
Utworzenie pliku
.I /etc/filesystems
przydaje si� do zmiany kolejno�ci rozpoznawania (np. do pr�bowania vfat
przed msdos) lub w przypadku stosowania modu�u autoloader.
Uwaga: rozpoznawanie u�ywa heurystyki (obecno�� odpowiedniej `magii')
i mo�e rozpozna� z�y rodzaj systemu plik�w.

Mo�na poda� wi�cej ni� jeden typ, w postaci listy rozdzielonej przecinkami.
Lista typ�w system�w plik�w mo�e by� poprzedzona s�owem
.B no
aby okre�li� systemy plik�w, na kt�rych akcja nie powinna by� wykonywana.
(Mo�e to mie� znaczenie z opcj�
.BR \-a .)

Na przyk�ad, polecenie:
.RS
.RS
.B "mount \-a \-t nomsdos,ext"
.RE
montuje wszystkie systemy plik�w poza tymi, kt�re s� typu
.I msdos
lub
.IR ext .
.RE
.TP
.B \-o
Opcje podaje si� flag�
.BR \-o ,
po kt�rej nast�puje oddzielony przecinkami ci�g opcji.
Niekt�re z tych opcji s� u�yteczne tylko je�li pojawiaj� si� w pliku
.IR /etc/fstab .
Poni�sze opcje dotycz� dowolnego montowanego systemu plik�w (cho� nie ka�dy
z system�w plik�w faktycznie je honoruje, np. opcja
.B sync
obecnie wp�ywa tylko na ext2 i ufs):
.RS
.TP
.B async
Wszelkie operacje wej�cia/wyj�cia dla tego systemu plik�w powinny by�
wykonywane asynchronicznie.
.TP
.B atime
Przy ka�dym si�gni�ciu do pliku aktualizuje czas dost�pu zapisany w i-w�le.
Tak jest domy�lnie.
.TP
.B auto
System plik�w mo�e by� montowany opcj�
.BR \-a .
.TP
.B defaults
U�ywa opcji domy�lnych:
.BR rw ", " suid ", " dev ", " exec ", " auto ", " nouser " i " async.
.TP
.B dev
Interpretuje specjalne urz�dzenia blokowe i znakowe na danym systemie plik�w.
.TP
.B exec
Zezwala na uruchamianie binari�w.
.TP
.B noatime
Nie wykonuje aktualizacji czasu dost�pu w i-w�le po�o�onym na tym systemie
plik�w (np. w celu uzyskania szybszego dost�pu do bufora wiadomo�ci, co
przyspiesza dzia�anie serwer�w grup dyskusyjnych).
.TP
.B noauto
Dany system plik�w mo�e by� montowany tylko jawnie (np. opcja
.B \-a
nie spowoduje jego zamontowania).
.TP
.B nodev
Nie interpretuje specjalnych urz�dze� blokowych ani znakowych na systemie
plik�w.
.TP
.B noexec
Nie pozwala na uruchamianie �adnych binari�w z tego systemu plik�w.
Opcja ta mo�e by� u�yteczna dla serwera, kt�ry ma systemy plik�w
zawieraj�ce binaria dla architektur innych ni� jego w�asna.
.TP
.B nosuid
Nie pozwala na dzia�anie bit�w set-user-id i set-group-id.
(Wygl�da na bezpieczn�, ale w rzeczywisto�ci raczej taka nie jest je�li
zainstalowano suidperl(1).)
.TP
.B nouser
Zabrania zwyk�emu u�ytkownikowi (tzn. innemu ni� root) montowania systemu
plik�w. Tak jest domy�lnie.
.TP
.B remount
Usi�uje ponownie zamontowa� ju� zamontowany system plik�w. Cz�sto u�ywane
do zmiany flag montowania systemu, szczeg�lnie aby umo�liwi� zapis
na systemach tylko dla odczytu. Nie zmienia urz�dzenia ani punktu montowania.
.TP
.B ro
Montuje system plik�w w trybie tylko dla odczytu.
.TP
.B rw
Montuje system plik�w w trybie odczytu i zapisu.
.TP
.B suid
Umo�liwia dzia�anie bitom set-user-id i set-group-id.
.TP
.B sync
Wszelkie operacje wej�cia/wyj�cia dla tego systemu plik�w powinny by�
wykonywane synchronicznie.
.TP
.B user
Pozwala na zamontowanie tego systemu plik�w przez zwyk�ego u�ytkownika.
Opcja ta implikuje opcje
.BR noexec ", " nosuid ", i " nodev
(chyba �e s� przes�aniane przez nast�pne opcje, jak w linii
.BR user,exec,dev,suid ).
.RE

.SH "OPCJE MONTOWANIA SPECYFICZNE DLA RӯNYCH SYSTEM�W PLIK�W"
Nast�puj�ce opcje stosuje si� tylko do okre�lonych system�w plik�w.
Uporz�dkowali�my je wed�ug systemu plik�w. Wszystkie wyst�puj� po fladze
.BR \-o .

.SH "Opcje montowania dla adfs"
.TP
\fBuid=\fP\fIwarto��\fP i \fBgid=\fP\fIwarto��\fP
Ustawia w�a�ciciela i grup� plik�w w danym systemie plik�w
(domy�lnie: uid=gid=0).
.TP
\fBownmask=\fP\fIwarto��\fP i \fBothmask=\fP\fIwarto��\fP
Ustawia mask� praw dla, odpowiednio, 'w�a�ciciela' i 'innych'
(domy�lnie, odpowiednio: 0700 i 0077).
Zobacz tak�e
.IR /usr/src/linux/Documentation/filesystems/adfs.txt .

.SH "Opcje montowania dla affs"
.TP
\fBuid=\fP\fIwarto��\fP i \fBgid=\fP\fIwarto��\fP
Ustawia w�a�ciciela i grup� korzenia systemu plik�w (domy�lnie: uid=gid=0), 
lecz opcje
.B uid
lub
.B gid
bez podanej warto�ci pobieraj� uid i gid bie��cego procesu).
.TP
\fBsetuid=\fP\fIwarto��\fP i \fBsetgid=\fP\fIwarto��\fP
Ustawia w�a�ciciela i grup� wszystkich plik�w.
.TP
.BI mode= warto��
Ustawia prawa wszystkich plik�w na
.IR warto�� " & 0777,"
nie zwa�aj�c na oryginalne prawa.
Dodaje prawa przeszukiwania dla katalog�w, kt�re maj� prawo odczytu.
Warto�� jest podawana �semkowo.
.TP
.B protect
Nie dopuszcza do zmian w bitach ochrony systemu plik�w.
.TP
.B usemp
Ustawia uid i gid korzenia systemu plik�w na uid i gid punktu montowania, a�
do pierwszego sync lub umount, a potem kasuje t� opcj�. Dziwne...
.TP
.B verbose
Wypisuje informacj� o ka�dym pomy�lnym montowaniu.
.TP
.BI prefix= napis
Przedrostek u�ywany przed nazw� wolumenu, przy pod��aniu za dowi�zaniem.
.TP
.BI volume= napis
Przedrostek (d�ugo�ci najwy�ej 30), u�ywany przed '/' przy pod��aniu
za dowi�zaniem symbolicznym.
.TP
.BI reserved= warto��
(Domy�lnie: 2.) Ilo�� nieu�ytkowanych blok�w na pocz�tku urz�dzenia.
.TP
.BI root= warto��
Podaje jawnie lokalizacj� bloku korzenia (root block).
.TP
.BI bs= warto��
Podaje rozmiar bloku. Dozwolone warto�ci to 512, 1024, 2048, 4096.
.TP
.BR grpquota " / " noquota " / " quota " / " usrquota
Opcje te s� przyjmowane, lecz s� ignorowane.
(Jednak�e narz�dzia przydzia��w dyskowych (quota) mog� reagowa� na takie
�a�cuchy w
.IR /etc/fstab .)

.SH "Opcje montowania dla coherent"
Brak.

.SH "Opcje montowania dla devpts"
devpts jest pseudo-systemem plik�w, tradycyjnie montowanym w
.IR /dev/pts .
W celu uzyskania pseudo-terminala, proces otwiera
.IR /dev/ptmx .
Jest mu w�wczas udost�pniany numer pseudo-terminala; podporz�dkowany
pseudo-terminal jest dost�pny jako
.IR /dev/pts/ <numer>.
.TP
\fBuid=\fP\fIwarto��\fP i \fBgid=\fP\fIwarto��\fP
Ustawia w�a�ciciela lub grup� nowotworzonych PTY wed�ug zadanych warto�ci.
Je�li nie podano �adnych, to zostan� nadane UID i GID procesu tworz�cego.
Na przyk�ad, je�li mamy grup� tty o GID=5, to
.B gid=5
spowoduje, �e nowotworzone PTY b�da nale�e� do grupy tty.
.TP
.BI mode= warto��
Nadaje trybowi nowotworzonych PTY zadan� warto��. Domy�lnie jest to 0600.
Warto��
.B mode=620
i 
.B gid=5
powoduje, �e dla nowoutworzonych PTY b�dzie domy�lnie "mesg y".

.SH "Opcje montowania dla ext"
Brak.
Zauwa�, �e system plik�w `ext' jest przedawniony. Nie u�ywaj go.
Od Linuksa wersji 2.1.21 kod �r�d�owy j�dra nie zawiera ju� extfs.

.SH "Opcje montowania dla ext2"
System plik�w `ext2' jest standardowym systemem plik�w Linuksa. Z powodu
b��du j�dra, mo�e by� montowany z dowolnymi opcjami montowania
(poprawiono w Linuksie 2.0.4).
.TP
.BR bsddf " / " minixdf
Ustala zachowanie dla funkcji systemowej
.IR statfs .
Zachowanie
.B minixdf
to zwracanie w polu
.I f_blocks
ca�kowitej ilo�� blok�w systemu plik�w, podczas gdy zachowaniem
.B bsddf
(kt�re jest domy�lne) jest odejmowanie nadmiarowych blok�w u�ywanych przez
ext2 i niedost�pnych dla przechowywania plik�w. Tak wi�c
.RE
.nf

% mount /k -o minixdf; df /k; umount /k
Filesystem   1024-blocks  Used Available Capacity Mounted on
/dev/sda6      2630655   86954  2412169      3%   /k
% mount /k -o bsddf; df /k; umount /k
Filesystem   1024-blocks  Used Available Capacity Mounted on
/dev/sda6      2543714      13  2412169      0%   /k

.fi
(Zauwa�, �e ten przyk�ad pokazuje, �e mo�na doda� opcje wiersza polece� do
opcji podanych w
.IR /etc/fstab .)

.TP
.BR check " / " check=normal " / " check=strict
Ustawia poziom sprawdzania. Gdy ustawiona jest przynajmniej jedna z tych opcji (a
.B check=normal
jest ustawiane domy�lnie), podczas montowania sprawdzane s� i-w�z�y i bitmapy
blok�w (co na du�ym dysku mo�e zabra� p� minuty lub co� ko�o tego i jest
raczej nieprzydatne). Przy dok�adnym (strict) sprawdzaniu, dealokacja blok�w
sprawdza, czy blok do zwolnienia le�y w strefie danych.
.TP
.BR check=none " / " nocheck
Bez sprawdzania. Tak jest szybko. Najnowsze j�dra nie maj� ju� opcji
sprawdzania - bardziej sensowna jest kontrola za pomoc�
.BR e2fsck (8).
ma wi�cej sensu.
.TP
.B debug
Wypisuje informacje diagnostyczne przy ka�dym (re)montowaniu.
.TP
.BR errors=continue " / " errors=remount-ro " / " errors=panic
Definiuje zachowanie przy napotkaniu b��du.
(Albo ignoruje b��dy, zaznaczaj�c tylko system plik�w jako b��dny i kontynuuj�c,
albo ponownie montuje system plik�w na tylko do odczytu, albo panikuje
i zatrzymuje system.) Domy�lne ustawienie jest wpisane w superbloku systemu
plik�w i mo�e by� zmienione za pomoc�
.BR tune2fs (8).
.TP
.BR grpid " lub " bsdgroups " / " nogrpid " lub " sysvgroups
Opcje te definiuj�, jaki identyfikator grupy (gid) otrzyma nowo utworzony
plik. Gdy ustawiony jest
.BR grpid ,
to pobiera gid katalogu, w kt�rym jest utworzony; w przeciwnym wypadku
(domy�lnie) bierze fsgid bie��cego procesu, chyba �e katalog ma ustawiony
bit setgid, w�wczas pobiera gid katalogu rodzicielskiego i
dodatkowo otrzymuje bit setgid, je�li sam jest katalogiem.
.TP
\fBresgid=\fP\fIn\fP i \fBresuid=\fP\fIn\fP
System plik�w ext2 rezerwuje pewn� ilo�� wolnego miejsca (domy�lnie 5%,
zobacz
.BR mke2fs (8)
i
.BR tune2fs (8)).
Opcje te okre�laj�, kto mo�e u�ywa� zarezerwowanych blok�w.
(Og�lnie: ka�dy, kto ma podany uid lub nale�y do podanej grupy.)
.TP
.BI sb= n
Zamiast bloku 1, jako superbloku u�ywa bloku
.IR n .
Mo�e to by� przydatne, gdy system plik�w zosta� uszkodzony. Zazwyczaj kopie
superbloku znajduj� si� co 8192 blok�w: w bloku 1, 8193, 16385, ...
(Dlatego na du�ym systemie plik�w istniej� setki, lub nawet tysi�ce kopii
superbloku. Od wersji 1.08,
.B mke2fs
ma opcj� \-s (sparse superblock), redukuj�c� liczb� zapasowych superblok�w, 
a od wersji 1.15 jest ona domy�lna. Zauwa�, �e mo�e to oznacza�, �e systemy
plik�w typu ext2 stworzone przez nowe
.B mke2fs
nie mog� by� montowane do zapisu pod Linuksem 2.0.*.)
.TP
.BR grpquota " / " noquota " / " quota " / " usrquota
Opcje te s� przyjmowane, lecz ignorowane.

.SH "Opcje montowania dla fat"
(Uwaga:
.I fat
nie jest odr�bnym rodzajem systemu plik�w, ale wsp�ln� cz�ci� system�w
plik�w
.IR msdos ,
.I umsdos
i
.IR vfat .)
.TP
.BR blocksize=512 " / " blocksize=1024 " / " blocksize=2048
Ustawia rozmiar bloku (domy�lnie 512).
.TP
\fBuid=\fP\fIwarto��\fP i \fBgid=\fP\fIwarto��\fP
Ustawia w�a�ciciela i grup� wszystkich plik�w (domy�lnie: uid i gid bie��cego
procesu).
.TP
.BI umask= warto��
Ustawia umask (mask� bitow� praw, kt�re 
.B nie
wyst�puj�). Domy�lnie przyjmuje si� warto�� umask bie��cego procesu.
Warto�� jest podawana �semkowo.
.TP
.BI check= warto�� 
Mo�na wybra� trzy stopnie:
.RS
.TP
.B r[elaxed]
Akceptowane i r�wnowa�ne sobie s� zar�wno wielkie, jak i ma�e litery.
Cz�ci d�ugich nazw s� obcinane (np.
.I verylongname.foobar
staje si�
.IR verylong.foo ),
pocz�tkowe i wtr�cone spacje s� akceptowane jako cz�� nazwy (nazwa i
rozszerzenie).
.TP
.B n[ormal]
Podobnie jak "relaxed", lecz wiele znak�w specjalnych (jak *, ?, <, spacje,
itp.) jest odrzucane. Tak jest domy�lnie.
.TP
.B s[trict]
Jak "normal", lecz nazwy nie mog� zawiera� d�ugich cz�ci i znak�w
specjalnych, kt�re czasem s� u�ywane pod Linuksem, lecz nie s� akceptowane
przez MS-DOS (+, =, spacje itp.)
.RE
.TP
.BI codepage= warto��
Ustawia stron� kodow� do konwersji znak�w kr�tkiej nazwy w systemach
plik�w FAT i VFAT. Domy�lnie stosowana jest strona kodowa 437.
.TP
.BR conv=b[inary] " / " conv=t[ext] " / " conv=a[uto]
System plik�w
.I fat
mo�e dokonywa� konwersji CRLF-NL (format tekstowy MS-DOS na format tekstowy
UNIX) w j�drze. Dost�pne s� nast�puj�ce tryby konwersji:
.RS
.TP
.B binary
brak konwersji. Domy�lne.
.TP
.B text
Konwersja CRLF<-->NL wykonywana dla wszystkich plik�w.
.TP
.B auto
Konwersja CRLF<-->NL dla wszystkich plik�w, kt�re nie maj� "og�lnie znanego
rozszerzenia binarnego". List� znanych rozszerze� mo�na znale�� na pocz�tku
.I fs/fat/misc.c
(w wersji 2.0, na li�cie jest: exe, com, bin, app, sys, drv, ovl, ovr, obj,
lib, dll, pif, arc, zip, lha, lzh, zoo, tar, z, arj, tz, taz, tzp, tpz,
gz, tgz, deb, gif, bmp, tif, gl, jpg, pcx, tfm, vf, gf, pk, pxl, dvi).
.PP
Programy, kt�re dokonuj� obliczonych lseek-�w, nie b�d� zadowolone z
konwersji. Niekt�rzy ludzie utracili dane przez t� translacj�. Strze�cie
si�!

Dla system�w zamontowanych w trybie binarnym, dost�pne s� narz�dzia
konwersji (fromdos/todos).
.RE
.TP
.BI cvf_format= modu�
Wymusza na sterowniku stosowanie modu�u CVF (Compressed Volume File)
.RI cvf_ modu�
zamiast automatycznego wykrywania. Je�eli j�dro obs�uguje kmod, to opcja
cvf_format=xxx steruje tak�e �adowaniem na ��danie modu�u CVF.
.TP
.BI cvf_option= opcja
Opcja przekazywana do modu�u CVF.
.TP
.B debug
W��cza flag�
.IR debug .
Wypisana zostanie wersja i lista parametr�w systemu plik�w (te
dane wypisywane s� te� je�li parametry s� niesp�jne).
.TP
.BR fat=12 " / " fat=16
Okre�la fat 12-, 16- lub 32-bitowy. To przes�ania procedur�
automatycznego wykrywania typu FAT. U�ywaj ostro�nie!
.TP
.BI iocharset= warto��
Zestaw znak�w u�ywany do konwersji mi�dzy znakami 8-bitowymi a 16-bitowymi
znakami Unikodu. Domy�lnym jest iso8859-1. D�ugie nazwy plik�w s�
przechowywane na dysku w formacie Unicode.
.TP
.B quiet
W��cza flag�
.I quiet
(cicho). Pr�by chown lub chmod nie zwracaj� b��d�w, chocia� si� nie udaj�.
U�ywaj ostro�nie!
.TP
.B "sys_immutable, showexec, dots, nodots, dotsOK=[yes|no]"
R�ne bezmy�lne pr�by wymuszenia konwencji Uniksa lub DOS-u na systemie
plik�w FAT.

.SH "Opcje montowania dla hpfs"
.TP
\fBuid=\fP\fIwarto��\fP i \fBgid=\fP\fIwarto��\fP
Ustawia w�a�ciciela i grup� wszystkich plik�w (domy�lnie: uid i gid bie��cego
procesu).
.TP
.BI umask= warto��
Ustawia umask (mask� bitow� praw, kt�re 
.B nie
wyst�puj�). Domy�lnie u�ywany jest umask bie��cego procesu.
Warto�� podawana jest �semkowo.
.TP
.BR case=lower " / " case=asis
Konwertuje wszystkie nazwy plik�w na ma�e litery, lub pozostawia bez zmian.
(Domy�lnie:
.BR case=lower .)
.TP
.BR conv=binary " / " conv=text " / " conv=auto
Dla
.BR conv=text ,
usuwa losowe znaki CR (konkretnie wszystkie, po kt�rych wyst�puje NL) podczas
odczytu pliku.
Dla
.BR conv=auto ,
wybiera mniej lub bardziej losowo mi�dzy
.BR conv=binary " i " conv=text .
Dla
.BR conv=binary ,
po prostu czyta to, co jest w pliku. Tak jest domy�lnie.
.TP
.B nocheck
Nie przerywa montowania gdy zawiod� pewne kontrole sp�jno�ci.

.SH "Opcje montowania dla iso9660"
Normalne nazwy plik�w
.I iso9660
pojawiaj� si� w formacie 8.3 (tzn. wyst�puj� DOS-owe ograniczenia d�ugo�ci
nazw plik�w), a w dodatku wszystkie znaki pisane s� wielkimi literami.
Poza tym nie ma pola w�a�ciciela, ochrony, liczby dowi�za�, zastrze�e�
dla urz�dze� znakowych/blokowych, itd.

Rozszerzeniem iso9660 jest Rock Ridge, kt�ry udost�pnia wszystkie te
uniksopodobne w�a�ciwo�ci. Najpro�ciej m�wi�c, dla ka�dego wpisu katalogowego
istniej� w nim rozszerzenia, kt�re uzupe�niaj� wszystkie informacje.
Gdy u�ywane jest Rock Ridge, system plik�w jest nieodr�nialny od normalnego
uniksowego systemu plik�w (poza tym, �e jest tylko do odczytu, oczywi�cie).
.TP
.B norock
Wy��cza korzystanie z rozszerze� Rock Ridge, nawet je�li s� dost�pne. Zob.\&
.BR map .
.TP
.B nojoliet
Wy��cza korzystanie z rozszerze� Joliet firmy Microsoft, nawet je�li s�
dost�pne. Zob.\&
.BR map .
.TP
.BR check=r[elaxed] " / " check=s[trict]
Z
.BR check=relaxed ,
nazwa pliku przed dokonywaniem podgl�du jest najpierw przekszta�cana na
ma�e litery. Prawdopodobnie ma to znaczenie tylko razem z
.B norock
i
.BR map=normal .
(Domy�lnie:
.BR check=strict .)
.TP
\fBuid=\fP\fIwarto��\fP i \fBgid=\fP\fIwarto��\fP
Nadaje wszystkim plikom systemu plik�w wskazany identyfikator u�ytkownika
i grupy, by� mo�e przes�aniaj�c informacje znalezione w rozszerzeniach
Rock Ridge.
(Domy�lnie:
.BR uid=0,gid=0 .)
.TP
.BR map=n[ormal] " / " map=o[ff] " / " map=a[corn]
Dla wolumen�w typu innego ni� Rock Ridge, normalna translacja nazwy
odwzorowuje wielkie litery ASCII na ma�e, porzuca ko�cz�ce `;1'
i zamienia `;' na `.'.
Z
.B map=off
nie jest dokonywana konwersja nazw. Zobacz
.BR norock .
(Domy�lnie:
.BR map=normal .)
.B map=acorn
jest podobne do
.BR map=normal ,
ale stosuje tak�e rozszerzenia Acorn je�li wyst�puj�.
.TP
.BI mode= warto��
Dla wolumen�w typu innego ni� Rock Ridge, nadaje wszystkim plikom
wskazane prawa. (Domy�lnie: prawa dla odczytu dla wszystkich.)
Od Linuksa 2.1.37 nie trzeba ju� podawa� trybu dziesi�tnie - �semkowy jest
wskazywany przez 0 na pocz�tku.
.TP
.B unhide
Pokazuje r�wnie� pliki ukryte i zwi�zane.
.TP
.B block=[512|1024|2048]
Ustawia rozmiar bloku we wskazanym wolumenie.
(Domy�lnie:
.BR block=1024 .)
.TP
.BR conv=a[uto] " / " conv=b[inary] " / " conv=m[text] " / " conv=t[ext]
(Domy�lnie:
.BR conv=binary .)
Od Linuksa 1.3.54 opcja ta ju� nie dzia�a. (A niebinarne ustawienia bywa�y
bardzo niebezpieczne, cz�sto prowadzi�y do milcz�cego niszczenia danych).
.TP
.B cruft
Je�li starszy bajt d�ugo�ci pliku zawiera inne �mieci, warto ustawi� t� opcj�
montowania, aby by� ignorowany. Powoduje to, �e maksymalny rozmiar pliku
nie mo�e by� wi�kszy ni� 16MB. Opcja `cruft' jest ustawiana automatycznie
je�li ca�y CDROM ma dziwny rozmiar (ujemny lub wi�kszy ni� 800 MB). Jest te�
ustawiana, gdy numery sekwencyjne wolumenu s� inne ni� 0 lub 1.
.TP
.B session=x
Wybiera numer sesji na CD wielosesyjnych. (Od 2.3.4.)
.TP
.B sbsector=xxx
Sesja zaczyna si� od sektora xxx. (Od 2.3.4.)

.SH "Opcje montowania dla miniksa"
Brak.

.SH "Opcje montowania dla msdos"
Zobacz opcje dla FAT.
Je�li system plik�w
.I msdos
wykryje niesp�jno��, zg�asza b��d i ustawia system plik�w na tylko dla
odczytu. System plik�w mo�e by� znowu dost�pny do zapisu przez ponowne
zamontowanie.

.SH "Opcje montowania dla ncp"
Takie jak dla
.IR nfs ", implementacja " ncp
oczekuje binarnego argumentu
.RI ( "struct ncp_mount_data" )
funkcji systemowej mount. Argument ten jest konstruowany przez
.BR ncpmount (8),
a bie��ca wersja
.B mount
(2.6h) nic nie wie o ncp.

.SH "Opcje montowania dla nfs"
Zamiast tekstowych napis�w opcji, przetwarzanych przez j�dro, system plik�w
.I nfs
oczekuje binarnych argument�w typu
.IR "struct nfs_mount_data" .
Program
.B mount
sam z siebie przetwarza nast�puj�ce opcje (postaci `cecha=warto��') i wstawia
je do wymienionej struktury:
.BI rsize= n,
.BI wsize= n,
.BI timeo= n,
.BI retrans= n,
.BI acregmin= n,
.BI acregmax= n,
.BI acdirmin= n,
.BI acdirmax= n,
.BI actimeo= n,
.BI retry= n,
.BI port= n,
.BI mountport= n,
.BI mounthost= name,
.BI mountprog= n,
.BI mountvers= n,
.BI nfsprog= n,
.BI nfsvers= n,
.BI namlen= n.
Opcja
.BI addr= n
jest akceptowana, lecz ignorowana.
Rozpoznawane s� r�wnie� nast�puj�ce opcje logiczne, kt�re mog� by�
poprzedzane s�owem
.BR no :
.BR bg ,
.BR fg ,
.BR soft ,
.BR hard ,
.BR intr ,
.BR posix ,
.BR cto ,
.BR ac ,
.BR tcp ,
.BR udp .
Szczeg�y znajdziesz w
.BR nfs (5).

Szczeg�lnie u�yteczne opcje obejmuj�
.TP
.B rsize=8192,wsize=8192
Uczyni to po��czenie nfs du�o szybszym ni� z domy�lnym buforem wielko�ci 1024.
(NFSv2 nie dzia�a z wi�kszymi warto�ciami
.B rsize
i
.BR wsize .)
.TP
.B hard
Program si�gaj�cy do pliku na zamontowanym systemie plik�w NFS zawiesi si�,
gdy serwer padnie. Procesu takiego nie da si� przerwa� ani zabi�, chyba �e
podano r�wnie�
.BR intr .
Gdy serwer NFS stanie si� znowu aktywny, program b�dzie kontynuowa�
bez przeszk�d od miejsca, w kt�rym by�. Prawdopodobnie tego w�a�nie chcesz.
.TP
.B soft
Opcja ta pozwala j�dru na ko�czenie pr�b po up�yni�ciu zadanego limitu czasu
(timeout) je�li serwer nfs nie odpowiada przez jaki� czas.
Czas podaje si� za pomoc�
.BR timeo=time .
Opcja ta jest u�yteczna je�li serwer nfs czasem nie odpowiada lub jest
w trakcie ponownego uruchamiania w momencie gdy jaki� proces pr�buje
uzyska� le��cy na nim plik.
Zwykle po prostu powoduje mn�stwo k�opot�w.
.TP
.B nolock
Nie stosuje blokowania. Nie uruchamia procesu
.BR lockd (8).

.SH "Opcje montowania dla ntfs"
.TP
.BI iocharset= nazwa
Zestaw znak�w stosowany przy zwracaniu nazw plik�w.
W przeciwie�stwie do VFAT, NTFS eliminuje nazwy zawieraj�ce znaki nie daj�ce
si� przekszta�ci�.
.TP
.BR utf8
Do konwersji nazw plik�w stosuje UTF-8.
.TP
.B uni_xlate=[0|1|2]
Dla 0 (lub `no', albo `false') lub 1 (lub `yes', albo `true'):
dla nazw plik�w spoza bie��cego zestawu znak�w u�ywa kodowania w stylu VFAT.
Warto�� 2 wy��cza kodowanie za pomoc� ":".
.TP
.B posix=[0|1]
je�li jest w��czone (posix=1), to system plik�w rozr�nia wielkie i ma�e
litery. Nazwy zast�pcze 8.3 s� przedstawiane jako dowi�zania twarde, a nie
pomijane.
.TP
\fBuid=\fP\fIwarto��\fP, \fBgid=\fP\fIwarto��\fP i \fBumask=\fP\fIwarto��\fP
Ustawia prawa plik�w dla danego systemu. Domy�lnie ich w�a�cicielem jest root
i nikt inny nie mo�e ich czyta�.

.SH "Opcje montowania dla systemu proc"
.TP
\fBuid=\fP\fIwarto��\fP i \fBgid=\fP\fIwarto��\fP
Opcje te s� rozpoznawane, lecz, o ile wiem, nie maj� �adnego efektu.

.SH "Opcje montowania dla romfs"
Brak.

.SH "Opcje montowania dla systemu smb"
Tak jak
.IR nfs ", implementacja " smb
oczekuje binarnego argumentu
.RI ( "struct smb_mount_data" )
do funkcji systemowej mount. Argument ten jest konstruowany przez
.BR smbmount (8)
a bie��ca wersja
.B mount
(2.9w) nie wie nic o smb.

.SH "Opcje montowania dla sysv"
Brak.

.SH "Opcje montowania dla udf"
.TP
.B gid=
Ustawia domy�ln� grup�.
.TP
.B umask=
Ustawia domy�lne umask.
.TP
.B uid=
Ustawia domy�lnego u�ytkownika.
.TP
.B unhide
Pokazuje pliki, kt�re inaczej by�yby ukryte.
.TP
.B undelete
Pokazuje na listach pliku usuni�te.
.TP
.B strict
Ustawia �cis�� zgodno�� (nieu�ywane).
.TP
.B utf8
(nieu�ywane).
.TP
.B iocharset
(nieu�ywane).
.TP
.B bs=
Ustawia rozmiar bloku. (Mo�e nie dzia�a�, chyba �e 2048.)
.TP
.B novrs
Pomija rozpoznawanie numeru sekwencyjnego wolumenu.
.\" Skip volume sequence recognition.
.TP
.B session=
Ustawia sesj� CD-ROM licz�c od 0. Domy�lnie: ostatnia sesja.
.TP
.B anchor=
Przes�ania po�o�enie standardowego zakotwiczenia (anchor). Domy�lnie: 256.
.TP
.B volume=
Przes�ania po�o�enie VolumeDesc. (nieu�ywane)
.TP
.B partition=
Przes�ania po�o�enie PartitionDesc. (nieu�ywane)
.TP
.B lastblock=
Ustawia ostatni blok systemu plik�w.
.TP
.B fileset=
Przes�ania po�o�enie bloku zestawu plik�w (fileset block). (nieu�ywane)
.TP
.B rootdir=
Przes�ania po�o�enie katalogu g��wnego). (nieu�ywane)

.SH "Opcje montowania dla ufs"
.TP
.BI ufstype= warto��
UFS jest systemem plik�w szeroko wykorzystywanym w r�nych systemach
operacyjnych. Problem stanowi� r�znice pomi�dzy implementacjami.
Cechy niekt�rych z nich s� nieudokumentowane, tak wi�c trudno rozpozna�
automatycznie typ ufs.
Z tego powodu u�ytkownik musi okre�li� typ ufs za pomoca opcji montowania.
Mo�liwe warto�ci to:
.RS
.TP
.B old
Stary format ufs, jest to typ domy�lny, tylko do odczytu.
.TP
.B 44bsd
Dla system�w plik�w utworzonych przez system typu BSD (NetBSD,FreeBSD,OpenBSD).
.TP
.B sun
Dla system�w plik�w utworzonych przez SunOS lub Solaris na komputarze Sparc.
.TP
.B sunx86
Dla system�w plik�w utworzonych przez Solaris na x86.
.TP
.B nextstep
Dla system�w plik�w utworzonych przez NeXTStep (na stacji roboczej NeXT)
(obecnie tylko do odczytu).
.TP
.B nextstep-cd
Dla CD-ROM-�w NextStep (block_size == 2048), tylko do odczytu.
.TP
.B openstep
Dla system�w plik�w utworzonych przez OpenStep (obecnie tylko do odczytu).
.RE
.TP
.BI onerror= warto��
Ustala zachowanie w przypadku b��du:
.RS
.TP
.B panic
Je�li napotkano b��d, powoduje panik� j�dra.
.TP
.B [lock|umount|repair]
Te opcje montowania teraz nic nie robi�: po napotkaniu b��du wypisuj� tylko
komunikat na knsoli.
.RE

.SH "Opcje montowania dla umsdos"
Zobacz opcje dla msdos.
Opcja
.B dotsOK
jest jawnie ubijana przez
.IR umsdos .

.SH "Opcje montowania dla vfat"
Przede wszystkim, rozpoznawane s� wszystkie opcje dla
.IR fat .
Opcja
.B dotsOK
jest jawnie ubijana przez
.IR vfat .
Pnadto istniej�
.TP
.B uni_xlate
T�umaczy nieobs�ugiwane znaki Unicode na specjalne sekwencje unikowe.
To umo�liwia ci wykonywanie kopii zapasowych i odtwarzanie plik�w o nazwach,
utworzonych ze znakami Unicode. Bez tej opcji, w wypadku braku mo�liwo�ci
konwersji u�ywane jest '?'. Znakiem unikowym jest ':', poniewa� na systemie
vfat jest w innych wypadkach niedozwolony. Sekwencja specjalna, kt�ra by�aby
u�yta dla znaku u, gdzie u jest znakiem unicodu to: ':', (u & 0x3f),
((u>>6) & 0x3f), (u>>12).
.TP
.B posix
Pozwala, by dwa pliki mia�y nazwy r�ni�ce si� tylko wielko�ci� liter.
.TP
.B nonumtail
Zanim zacznie pr�bowa�
.IR nazwa~nr.roz
najpierw pr�buje zrobi� kr�tk� nazw� bez numeru kolejnego.
.TP
.B utf8
UTF8 jest systemem plik�w bezpiecznego 8-bitowego kodowania Unicodu, kt�ry
jest wykorzystywany przez konsol�. T� opcj� mo�na go w��czy� dla danego
systemu plik�w. Je�li zostanie ustawione `uni_xlate', UTF8 jest wy��czane.

.SH "Opcje montowania dla xenixa"
Brak.

.SH "Opcje montowania dla xfs"
.TP
.BI biosize= rozmiar
Ustawia preferowany rozmiar buforowanego wej�cia/wyj�cia (domy�lnie 64K).
.I rozmiar
musi by� wyra�ony jako logarytm (o podstawie 2) po��danego rozmiaru I/O.
Poprawnymi warto�ciami tej opcji s� 14 do 16, w��cznie
(tzn. 16K, 32K i 64K bajt�w).
Na komputerach z 4K rozmiarem strony, 13 (8K bajt�w) jest r�wnie� poprawnym
.IR rozmiarem .
Preferowany rozmiar buforowanego I/O mo�na te� zmienia� dla poszczeg�lnych
plik�w, korzystaj�c z funkcji systemowej
.BR ioctl (2).
.TP
.B dmapi " / " xdsm
W��cza wyr�nione zdarzenia DMAPI (Data Management API).
.\" event callouts.
.TP
.BI logbufs= warto��
Ustala liczb� bufor�w pami�ciowych dziennika (in-memory log buffers).
Poprawne s� liczby z zakresu 2-8, w��cznie.
Domy�lna warto�� to 8 bufor�w dla system�w plik�w z blokiem o rozmiarze 64K,
4 bufory dla system�w o bloku 32K, 3 bufory dla system�w o bloku 16K,
i 2 bufory dla wszystkich innych konfiguracji.
Zwi�kszanie liczby bufor�w mo�e poprawi� wydajno�� przy niekt�rych
obci��eniach roboczych kosztem pami�ci wykorzystywanej na dodatkowe bufory
i zwi�zane z nimi struktury steruj�ce.
.TP
.BI logbsize= warto��
Ustawia wielko�� ka�dego z bufor�w pami�ciowych dziennika (in-memory
log buffers).
Poprawne warto�ci to 16384 (16K) i 32768 (32K).
Domy�lna warto�� dla komputer�w o wi�cej ni� 32MB pami�ci to 32768,
komputery o mniejszej pami�ci stosuj� domy�lnie 16384.
.TP
\fBlogdev=\fP\fIurz�dzenie\fP i \fBrtdev=\fP\fIurz�dzenie\fP
U�ywa zewn�trznego dziennika (rejestru metadanych) i/lub urz�dzenia czasu
rzeczywistego. System plik�w XFS ma do trzech cz�ci: sekcji danych, sekcji
dziennika i sekcji czasu rzeczywistego. Sekcja czasu rzeczywistego jest
opcjonalna, a sekcja dziennika mo�e byc osobna od sekcji danych albo mo�e
by� w niej zawarta.
Bli�sze informacje podaje
.BR xfs (5).
.TP
.B noalign
Alokacja danych nie b�dzie wyr�wnywana na granicach jednostki paskowej
(stripe unit).
.TP
.B noatime
Podczas odczytu pliku nie s� aktualizowane znaczniki czasu dost�pu.
.TP
.B norecovery
System plik�w zostanie zamontowany bez uruchamiania odzyskiwania dziennika.
Je�li system ten nie by� poprawnie odmontowany, to mo�liwe, �e montowany
w trybie
.B norecovery
b�dzie niesp�jny.
Cz�� plik�w lub katalog�w mo�e z tego powodu by� niedost�pna.
Systemy plik�w przy w��czeniu trybu
.B norecovery
musz� by� montowane tylko do odczytu albo montowanie si� nie powiedzie.
.TP
.B osyncisdsync
Powoduje, �e zapisy do plik�w otwartych z ustawion� flag� O_SYNC b�d� si�
zachowywa� jakby zamiast niej u�yto flagi O_DSYNC. Mo�e to da� lepsz�
wydajno�� bez naruszenia bezpiecze�stwa danych. Jednak�e, je�li dzia�a
ta opcja, to w przypadku za�amania si� systemu mog� zosta� utracone
aktualizacje znacznik�w czasu z O_SYNC.
.TP
.BR quota " / " usrquota " / " uqnoenforce
W��czenie systemu rozliczania udzia��w dyskowych (quota) u�ytkownik�w
i wymuszenie (opcjonalnie) limit�w.
.TP
.BR grpquota " / " gqnoenforce
W��czenie systemu rozliczania udzia��w dyskowych (quota) grup
i wymuszenie (opcjonalnie) limit�w.
.TP
\fBsunit=\fP\fIwarto��\fP i \fBswidth=\fP\fIwarto��\fP
Stosowane do okre�lenia jednostki i szeroko�ci paska dla urz�dzenia RAID
lub wolumenu paskowego.
.I Warto��
musi by� podana jako liczba 512-bajtowych blok�w.
Je�li nie podano tej opcji, a system plik�w zosta� utworzony na wolumenie
paskowym lub podczas korzystania z mkfs podano szeroko�� albo jednostk�
paska dla urz�dzenia RAID, to funkcja systemowa mount odtworzy t� warto��
z superbloku.
Dla system�w plik�w utworzonych bezpo�rednio na urz�dzeniach RAID, opcji
tych mo�na u�y� do przes�oni�cia informacji z superbloku je�li po stworzeniu
systemu zmieni� si� odno�ny uk�ad dysku.
Je�li podano 
.BR sunit ,
to opcja
.B swidth
jest wymagana
i musi by� wielokrotno�ci� warto�ci
.BR sunit .

.SH "Opcje montowania dla xiafs"
Brak. Chocia� xiafs nic nie dolega, nie jest on u�ywany zbyt cz�sto
i nie jest rozwijany. Prawdopodobnie nie powinno si� go u�ywa�.
Od Linuksa wersji 2.1.21 xiafs nie wyst�puje ju� w kodzie �r�d�owym j�dra.

.SH "URZ�DZENIE LOOP"
Kolejnym mo�liwym typem jest montowanie poprzez urz�dzenie loop. Na przyk�ad,
polecenie

.nf
.B "  mount /tmp/fdimage /mnt -t msdos -o loop=/dev/loop3,blocksize=1024"
.fi

skonfiguruje urz�dzenie loop
.I /dev/loop3
tak, by odpowiada�o plikowi
.IR /tmp/fdimage ,
i zamontuje je w
.IR /mnt .
Ten typ montowania zna trzy opcje, konkretnie
.BR loop ", " offset " i " encryption ,
kt�re s� w rzeczywisto�ci opcjami dla
.BR losetup (8).
Je�li nie podano jawnie urz�dzenia loop
(lecz tylko opcj� `\fB\-o loop\fP'), to
.B mount
spr�buje znale�� jakie� nieu�ywane urz�dzenie loop i u�y� go.
Je�li nie jest si� tak niem�drym, by zrobi� 
.I /etc/mtab
dowi�zaniem symbolicznym do
.IR /proc/mounts ,
to ka�de urz�dzenie loop przydzielone przez
.B mount
zostanie zwolnione przez
.BR umount .
Mo�na te� zwalnia� urz�dzenie loop r�cznie, stosuj�c `losetup -d' -- zobacz
.BR losetup (8).

.SH PLIKI
.I /etc/fstab
tabela system�w plik�w
.br
.I /etc/mtab
tabela zamontowanych system�w plik�w
.br
.I /etc/mtab~
plik blokuj�cy
.br
.I /etc/mtab.tmp
plik tymczasowy
.SH "ZOBACZ TAK�E"
.BR mount (2),
.BR umount (2),
.BR fstab (5),
.BR umount (8),
.BR swapon (8),
.BR nfs (5),
.BR xfs (5),
.BR e2label (8),
.BR xfs_admin (8),
.BR mountd (8),
.BR nfsd (8),
.BR mke2fs (8),
.BR tune2fs (8),
.BR losetup (8)
.SH B��DY
Jest mo�liwe, �e uszkodzony system plik�w spowoduje za�amanie systemu.
.PP
Niekt�re linuksowe systemy plik�w nie obs�uguj�
.B "\-o sync"
(ext2fs
.I wykonuje
synchroniczne od�wie�ania (updates) (a la BSD) gdy zostanie zamontowany
z opcj�
.BR sync ).
.PP
Opcja
.B "\-o remount"
mo�e nie by� w stanie zmieni� parametr�w montowania (np. wszystkie parametry
.IR ext2fs ,
poza
.BR sb ,
daj� si� zmienia� przy ponownym montowaniu, lecz nie mo�na zmieni�
.B gid
czy
.B umask
dla
.IR fatfs ).
.SH HISTORIA
Polecenie
.B mount
pojawi�o si� w wersji 5 AT&T UNIX.
