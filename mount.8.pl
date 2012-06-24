.\" {PTM/PB/0.1/02-02-1999/"montuj system plik�w"}
.\" Translation 1999 Przemek Borys <pborys@dione.ids.pl>
.\" Pfuh... to by�o wielkie... Ale �atwe.
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
.\" 960705, aeb: version for mount-2.5k
.\"
.TH MOUNT 8 "5 Lipiec 1996" "Linux 2.0" "Podr�cznik programisty linuxowego"
.SH NAZWA
mount \- montuj system plik�w
.SH SK�ADNIA
.BI "mount [\-hV]"
.LP
.BI "mount \-a [\-fnrvw] [\-t " vfstype ]
.br
.BI "mount [\-fnrvw] [\-o " options " [,...]] " "device " | " dir"
.br
.BI "mount [\-fnrvw] [\-t " vfstype "] [\-o " options "] " "device dir"
.SH OPIS
Wszystkie pliki dost�pne w systemie UNIX s� skupione w jednym wielkim
drzewie, hierarchii plik�w, zakorzenionej w
.BR / .
Pliki te mog� by� podzielone mi�dzy wieloma urz�dzeniami. Komenda
.B mount
umo�liwia przy��czenie systemu plik�w znajduj�cego si� na danym urz�dzeniu
do wielkiego drzewa plik�w. Odwrotnie, komenda
.BR umount (8)
powoduje od��czenie go.

Standardowa posta� komendy
.B mount
to
.RS
.br
.BI "mount \-t" " type device dir"
.RE
M�wi to j�dru by przy��czy� system plik�w znaleziony na urz�dzeniu
.I device
(kt�ry jest typu
.IR type )
w katalogu
.IR dir .
Poprzednia zawarto�� (je�li istnia�a) i w�a�ciciel oraz prawa katalogu
.I dir
staj� si� niewidzialne na czas zamontowania nowego systemu plik�w. W tym
czasie �cie�ka
.I dir
odnosi si� do korzenia systemu plik�w na urz�dzeniu
.IR device .

Trzy formy wywo�ania niczego nie montuj�:
.RS
.br
.B "mount \-h"
.RE
drukuje informacj� o pomocy;
.RS
.br
.B "mount \-V"
.RE
drukuje wersj�; i po prostu
.RS
.BI "mount [-t" " type" ]
.RE
listuje wszystkie zamontowane systemy plik�w (typu
.IR type )
- patrz ni�ej.

System plik�w
.I proc
nie jest zwi�zany z �adnym specjalnym urz�dzeniem i podczas jego montowania
zamiast nazwy urz�dzenia mo�na u�y� s�owa kluczowego, takiego jak
.IR proc .
(Zwyczajowy wyb�r
.I none
jest mniej fortunny: b��d `none busy' od
.B umount
mo�e by� niezrozumia�y.)

Wi�kszo�� urz�dze� jest wskazywanych przez nazw� pliku (specjalnego
urz�dzenia blokowego), jak np.
.IR /dev/sda1 ,
lecz istniej� inne mo�liwo�ci. Na przyk�ad w wypadku montowania NFS,
urz�dzenie
.I device
mo�e wygl�da� jak
.IR knuth.cwi.nl:/dir .

Plik
.I /etc/fstab
(zobacz
.BR fstab (5)),
mo�e zawiera� linie opisuj�ce, jakie urz�dzenie gdzie s� zazwyczaj montowane
i przy u�yciu jakich opcji. Plik ten mo�e by� u�ywany na trzy sposoby:
.LP
(i) Komenda
.RS
.br
.BI "mount \-a [-t" " type" ]
.RE
(zwykle podawana w skryptach startowych) powoduje zamontowanie wszystkich
system�w plik�w (odpowiadaj�cego typu) wymienionych w
.IR fstab ,
poza tymi, kt�rych wpisy zawieraj� s�owo kluczowe
.BR noauto .
.LP
(ii) Podczas montowania systemu plik�w wymienionego w
.IR fstab ,
wystarcza poda� tylko nazw� urz�dzenia, lub tylko punkt montowania.
.LP
(iii) Tradycyjnie tylko superu�ytkownik mo�e montowa� systemy plik�w. Jednak
je�li
.I fstab
zawiera opcj�
.B user
w linii, to ka�dy mo�e zamontowa� odpowiadaj�cy jej system plik�w.
.LP
Tak wi�c przy linii
.RS
.br
.B "/dev/cdrom  /cd  iso9660  ro,user,noauto,unhide"
.RE
dowolny u�ytkownik mo�e montowa� system plik�w iso9660 ze swojego CD-ROM,
u�ywaj�c komendy
.RS
.br
.B "mount /dev/cdrom"
.RE
lub
.RS
.br
.B "mount /cd"
.RE
Dla dalszych szczeg��w odsy�amy do
.BR fstab (5).

Programy
.B mount
i
.B umount
opiekuj� si� list� obecnie zamontowanych system�w plik�w, kt�ra znajduje si�
w pliku
.IR /etc/mtab .
Je�li nie podano argument�w dla
.BR mount ,
to drukowana jest ta lista.
Gdy zamontowany jest system plik�w
.I proc
(powiedzmy, �e w
.IR /proc ),
pliki
.I /etc/mtab
i
.I /proc/mounts
maj� bardzo podobn� zawarto��. Poprzedni ma troch� wi�cej informacji, takich
jak opcje montowania, lecz niekoniecznie jest aktualny. (zobacz opcj�
.B \-n
poni�ej).

.SH OPCJE
Pe�ny zestaw opcji u�ywanych przy wywo�ywaniu
.B mount
jest okre�lany przez ekstrakcj� opcji dla danego systemu plik�w, zadanych w
.IR fstab ,
a potem przez stosowanie wszelkich opcji podanych przez argument
.B \-o
a na koniec opcji
.BR \-r " lub " \-w
o ile istniej�.

Opcje dost�pne dla komendy
.BR mount :
.TP
.B \-v
Tryb verbose (gadatliwy).
.TP
.B \-f
Powoduje, �e wszystko si� wykonuje poza rzeczywistym wywo�aniem systemowym;
je�li nie jest to oczywiste, ``udaje'' to montowanie systemu plik�w. Opcja
ta jest przydatna w po�aczeniu z flag�
.B \-v
do zrozumienia, co komenda
.B mount
usi�uje zrobi�.
.TP
.B \-n
Montuj bez zapisywania w
.IR /etc/mtab .
Jest to niezb�dne na przyk�ad gdy
.I /etc
jest systemem plik�w tylko dla odczytu.
.TP
.B \-r
Montuj system plik�w w trybie tylko dla odczytu. Synonimem jest
.BR "\-o ro" .
.TP
.B \-w
Montuj system plik�w w trybie odczytu i zapisu. Tak jest domy�lnie.
Synonimem jest
.BR "\-o rw" .
.TP
.BI \-t " vfstype"
Argument, kt�ry pod��a za
.B \-t
jest u�ywany do wskazania rodzaju systemu plik�w. Wspierane obecnie systemy
plik�w s� wymienione w
.IR linux/fs/filesystems.c :
.IR minix ", " ext ", " ext2 ", " xiafs ", " hpfs ,
.IR fat ", " msdos ", " umsdos ", " vfat ,
.IR proc ", " nfs ", " iso9660 ", " smb ", " ncp ", " affs ", " ufs ,
.IR sysv ", " xenix ", " coherent .
Zauwa�, �e ostatnie trzy s� ekwiwalentne i �e
.I xenix
oraz
.I coherent
zostan� usuni�te w pewnym momencie w przysz�o�ci \(em u�ywaj zamiast nich
.IR sysv .

Typ
.I iso9660
jest domy�lny. Je�li nie poda si� opcji
.B \-t
lub je�li podany zostanie typ
.BR auto ,
to superblok zostanie przetestowany w poszukiwaniu typu systemu plik�w
Wspierane s�
.RI minix ", " ext ", " ext2 ", " xia ", " iso9660 ")."
Je�li test ten nie powiedzie si�, a istnieje
.IR /proc/filesystems ,
To wypr�bowane zostan� wszystkie wylistowane tam systemy plik�w, poza tymi
kt�re s� oznaczone jako "nodev" (np.
.I proc
czy
.IR nfs ).

Zauwa�, �e
.B auto
mo�e by� u�yteczne dla montowanych przez u�ytkownika dyskietek.
Uwaga: testowanie u�ywa herystyki i mo�e rozpozna� z�y rodzaj systemu
plik�w.

Wi�cej ni� jeden mo�e by� podany w li�cie oddzielanej przecinkami.
Lista typ�w system�w plik�w mo�e by� poprzedzona s�owem
.B no
aby okre�li� systemy plik�w, na kt�rych akcja nie powinna by� wykonywana.
(Mo�e to mie� znaczenie z opcj�
.BR \-a .)

Na przyk�ad, komenda:
.RS
.RS
.B "mount \-a \-t nomsdos,ext"
.RE
montuje wszystkie systemy plik�w poza tymi, kt�re s� typu
.I msdos
i
.IR ext .
.RE
.TP
.B \-o
Opcje s� podawane z flag�
.B \-o
po kt�re nast�puje oddzielony przecinkami ci�g opcji.
Niekt�re z tych opcji s� u�yteczne tylko je�li pojawiaj� si� w pliku
.IR /etc/fstab .
Nast�puj�ce opcje dotycz� dowolnego systemu plik�w, kt�ry jest montowany:
.RS
.TP
.B async
Wszelkie I/O do system�w plik�w powinno by� wykonywane asynchronicznie.
.TP
.B auto
Mo�e by� montowany z opcj�
.BR \-a .
.TP
.B defaults
U�ywaj opcji domy�lnych:
.BR rw ", " suid ", " dev ", " exec ", " auto ", " nouser ", and " async.
.TP
.B dev
Interpretuj specjalne urz�dzenia blokowe i znakowe na systemie plik�w.
.TP
.B exec
Zezw�l na uruchamianie binari�w.
.TP
.B noauto
Mo�e by� montowany tylko wyj�tkowo (np. opcja
.B \-a
nie spowoduje zamontowania systemu).
.TP
.B nodev
Nie interpretuj specjalnych urz�dze� blokowych ani znakowych na systemie
plik�w.
.TP
.B noexec
Nie zezw�l na uruchamianie �adnych binari�w na zamontowanym systemie plik�w.
Opcja ta mo�e by� u�yteczna dla serwera, kt�ry ma systemy plik�w,
zawieraj�ce binaria dla architektur innych ni� jego.
.TP
.B nosuid
Nie zezw�l na dzia�anie bit�w set-user-id i set-group-id.
.TP
.B nouser
Zabro� zwyk�emu u�ytkownikowi montowania systemu plik�w. Tak jest domy�lnie.
.TP
.B remount
Spr�buj remontowa� ju� zamontowany system plik�w. Jest to cz�sto u�ywane do
zmieniania flag montowania dla systemu plik�w, szczeg�lnie aby umo�liwi�
zapis na systemach tylko dla odczytu.
.TP
.B ro
Montuj system plik�w w trybie tylko dla odczytu.
.TP
.B rw
Montuj system plik�w w trybie odczytu i zapisu.
.TP
.B suid
Umo�liw dzia�anie bitom set-user-id i set-group-id.
.TP
.B sync
Wszelkie I/O do systemu plik�w powinno by� wykonywane synchronicznie.
.TP
.B user
Umo�liw zwyk�emu u�ytkownikowi zamontowa� system plik�w. Opcja ta implikuje
opcje
.BR noexec ", " nosuid ", i " nodev
(chyba, �e s� przeci��one przez opcje, jak w linii
.BR user,exec,dev,suid ).
.RE

.SH "SPECYFICZNE SYSTEMOWI PLIK�W OPCJE MONTOWANIA"
Nast�puj�ce opcje stosuje si� tylko do okre�lonych system�w plik�w.
Sortujemy je wed�ug systemu plik�w. Wszystkie pod��aj� za flag�
.BR \-o .

.SH "Opcje montowania dla affs"
.TP
\fBuid=\fP\fIvalue\fP i \fBgid=\fP\fIvalue\fP
Ustaw w�a�ciciela i grup� korzenia systemu plik�w (domy�lnie: uid=gid=0,
lecz opcje
.B uid
lub
.B gid
bez podanej warto�ci pobieraj� uid i gid bie��cego procesu).
.TP
\fBsetuid=\fP\fIvalue\fP i \fBsetgid=\fP\fIvalue\fP
Ustaw w�a�ciciela i grup� wszystkich plik�w.
.TP
.BI mode= value
Ustaw prawa wszystkich plik�w na
.IR value " & 0777"
nie zwa�aj�c na oryginalne prawa.
Dodaj prawa przeszukiwania na katalogi, kt�re maj� prawo odczytu.
Warto�� jest podawana �semkowo.
.TP
.B protect
Nie dopuszczaj do zmian w bitach ochrony systemu plik�w.
.TP
.B usemp
Ustaw uid i gid korzenia systemu plik�w na uid i gid punktu montowania, a�
do pierwszego sync lub umount, a potem wyczy�� t� opcj�. Dziwne...
.TP
.B verbose
Drukuj informacje o ka�dym pomy�lnym montowaniu.
.TP
.BI prefix= string
Przedrostek u�ywany przed nazw� wolumenu, gdy pod��a za linkiem.
.TP
.BI volume= string
Przedrostek (d�ugo�ci najwy�ej 30), u�ywany przed '/' gdy pod��a za linkiem
symbolicznym.
.TP
.BI reserved= value
(Domy�lnie: 2.) Ilo�� nieu�ytych blok�w na pocz�tku urz�dzenia.
.TP
.BI root= value
Podaj wyj�tkowo lokalizacj� bloku korzenia. (root block).
.TP
.BI bs= value
Podaj rozmiar bloku. Dozwolone warto�ci to 512, 1024, 2048, 4096.
.TP
.BR grpquota " / " noquota " / " quota " / " usrquota
Opcje te s� przyjmowane, lecz s� ignorowane.

.SH "Opcje montowania dla coherent"
Brak.

.SH "Opcje montowania dla ext"
Brak.
Zauwa�, �e system plik�w `ext' jest przedawniony. Nie u�ywaj go.

.SH "Opcje montowania dla ext2"
System plik�w `ext2' jest standardowym systemem plik�w Linuxa. Z powodu
b��du j�dra, mo�e by� montowany z r�nymi opcjami montowania (Linux 2.0)/
.TP
.BR bsddf " / " minixdf
Ustaw zachowanie dla wywo�ania systemowego
.IR statfs .
Zachowanie
.B minixdf
to zwracanie w polu
.I f_blocks
ca�kowit� ilo�� blok�w systemu plik�w, podczas gdy zachowaniem
.B bsddf
(co jest domy�lne) jest odejmowanie kosztownych blok�w u�ywanych przez ext2
i niedost�pnych dla przechowywania plik�w. Tak wi�c
.RE
.nf

% mount /k -o minixdf; df /k; umount /k
Filesystem   1024-blocks  Used Available Capacity Mounted on
/dev/sda6      2630655   86954  2412169      3%   /k
% mount /k -o bsddf; df /k; umount /k
Filesystem   1024-blocks  Used Available Capacity Mounted on
/dev/sda6      2543714      13  2412169      0%   /k

.fi
(Zauwa�, �e ten przyk�ad pokazuje, �e mo�na doda� opcje linii komend do
opcji podanych w
.IR /etc/fstab .)

.TP
.BR check " / " check=normal " / " check=strict
Ustaw poziom sprawdzania. Gdy przynajmniej jedna z tych opcji jest ustawiona (a
.B check=normal
jest ustawiane domy�lnie), inody i bitmapy blok�w s� sprawdzane podczas
montowania (co mo�e zabra� p� minuty lub co� podobnego na du�ym dysku).
Z ostrym (strict) sprawdzaniem, dealokacja blok�w sprawdza, czy blok do
zwolnienia le�y w strefie danych.
.TP
.BR check=none " / " nocheck
Nie dokonuje si� sprawdzania.
.TP
.B debug
Drukuj informacje debuggowe przy ka�dym (re)montowaniu.
.TP
.BR errors=continue " / " errors=remount-ro " / " errors=panic
Zdefiniuj zachowanie przy napotkaniu b�edu.
(Albo ignoruj b��dy i tylko zaznaczaj system plik�w jako b��dny i kontynuuj,
lub remontuj system plik�w na tylko do odczytu, lub te� panikuj i zatrzymaj
system.) Domy�lne ustawienie jest wyryte w superbloku systemu plik�w i mo�e
by� zmienione przy u�yciu
.BR tune2fs (8).
.TP
.BR grpid " lub " bsdgroups " / " nogrpid " lub " sysvgroups
Opcje te definiuj�, jaki gid otrzymuje nowo utworzony plik.
Gdy ustawiony jest
.BR grpid ,
to pobiera gid katalogu, w kt�rym jest utworzony; w przeciwnym wypadku
(domy�lnie) bierze fsgid bie��cego procesu, chyba �e katalog ma ustawiony
bit setgid, w kt�rym wypadku pobiera gid katalogu rodzicielskiego i
dodatkowo otrzymuje bit setgid, je�li jest katalogiem.
.TP
\fBresgid=\fP\fIn\fP i \fBresuid=\fP\fIn\fP
System plik�w ext2 rezerwuje pewn� ilo�� wolnego miejsca (domy�lnie 5%,
zobacz
.BR mke2fs (8)
i
.BR tune2fs (8)).
Opcje te okre�laj�, kto mo�e u�ywa� zarezerwowanych blok�w.
(Og�lnie: ka�dy, kto ma podany uid, lub nale�y do podanej grupy.)
.TP
.BI sb= n
Zamiast bloku 1, jako superblok u�yj bloku
.IR n .
Mo�e to by� przydatne, gdy system plik�w jest uszkodzony. Zazwyczaj kopie
superbloku znajduj� si� co 8192 blok�w: w bloku 1, 8193, 16385, ...
(Dlatego na du�ym systemie plik�w istniej� setki, lub nawet tysi�ce kopii
superbloku. Nie znam opcji mke2fs, kt�re zmniejsza�yby t� liczb�).
.TP
.BR grpquota " / " noquota " / " quota " / " usrquota
Opcje te s� przyjmowane, lecz ignorowane.

.SH "Opcje montowania dla fat"
.TP
.BR blocksize=512 " / " blocksize=1024
Ustaw rozmiar bloku (domy�lnie 512).
.TP
\fBuid=\fP\fIvalue\fP i \fBgid=\fP\fIvalue\fP
Ustaw w�a�ciciela i grup� wszystkich plik�w (domy�lnie: uid i gid bie��cego
procesu).
.TP
.BI umask= value
Ustaw umask� (mask� bitow� praw, kt�re 
.B nie
s� obecne). Domy�lnie przyjmuje si� umask� procesu bie��cego.
Warto�� jest podawana �semkowo.
.TP
.BI check= value 
Mo�na wybra� trzy stopnie:
.RS
.TP
.B r[elaxed]
Du�e i ma�e litery s� przyjmowane i ekwiwalentne, cz�ci d�ugich nazw s�
skracane (np.
.I verylongname.foobar
staje si�
.IR verylong.foo ),
prowadz�ce i za��czone spacje s� akceptowane jako cz�� nazwy (nazwa i
rozszerzenie).
.TP
.B n[ormal]
Podobnie jak "relaxed", lecz wiele znak�w specjalnych (jak *, ?, <, spacje,
itp.) s� odrzucane. Tak jest domy�lnie.
.TP
.B s[trict]
Jak "normal", lecz nazwy nie mog� zawiera� d�ugich cz�ci i znak�w
specjalnych, kt�re czasem s� u�ywane pod linuxem, lecz nie s� akceptowane
przez MS-DOS (+, =, spacje itp.)
.RE
.TP
.BR conv=b[inary] " / " conv=t[ext] " / " conv=a[uto]
System plik�w
.I fat
mo�e dokonywa� konwersji CRLF-NL (Format tekstowy MS-DOS na format tekstowy
UNIX) w j�drze. Nast�puj�ce tryby konwersji s� dost�pne:
.RS
.TP
.B binary
brak konwersji. Domy�lne.
.TP
.B text
Konwersja CRLF<-->NL na wszystkich plikach.
.TP
.B auto
Konwersja CRLF<-->NL na wszystkich plikach, kt�re nie maj� "og�lnie znanego
rozszerzenia binarnego". Lista znanych rozszerze� mo�e by� znaleziona na
pocz�tku
.I fs/fat/misc.c
(w wersji 2.0, list� jest: exe, com, bin, app, sys, drv, ovl, ovr, obj,
lib, dll, pif, arc, zip, lha, lzh, zoo, tar, z, arj, tz, taz, tzp, tpz,
gz, tgz, deb, gif, bmp, tif, gl, jpg, pcx, tfm, vf, gf, pk, pxl, dvi).
.PP
Programy, kt�re dokonuj� obliczonych lseek'�w, nie b�d� zadowolone z
konwersji. Niekt�rzy ludzie utracili dane przez t� translacj�. Strze�cie
sie!

Dla system�w zamontowanych w trybie binarnym, dost�pne s� narz�dzia
konwersji (fromdos/todos).
.RE
.TP
.B debug
W��cz flag�
.IR debug .
Wydrukowany zostanie string wersji i lista parametr�w systemu plik�w (te
dane drukowane s� te� je�li parametry wydaj� si� by� niekonsystentne).
.TP
.BR fat=12 " / " fat=16
Okre�l albo fat 12-bitowy, albo fat 16-bitowy. To przeci��a procedur�
automatycznej detekcji fatu. Ostro�nie.
.TP
.B quiet
W��cz flag�
.I quiet
(cicho). Pr�by chown lub chmod nie zwracaj� b��d�w, chocia� si� nie powodz�.
U�ywaj ostro�nie!
.TP
.B "sys_immutable, showexec, dots, nodots, dotsOK=[yes|no]"
R�ne bezmy�lne pr�by wymuszenia konwencji Unixa lub Dosa na systemie plik�w
fat.

.SH "Opcje montowania dla hpfs"
.TP
\fBuid=\fP\fIvalue\fP i \fBgid=\fP\fIvalue\fP
Ustaw w�a�ciciela i grup� wszystkich plik�w (domy�lnie: uid i gid bie��cego
procesu).
.TP
.BI umask= value
Ustaw umask� (mask� bitow� praw, kt�re 
.B nie
s� obecne). Domy�lnie u�ywana jest umaska bie��cego procesu.
Warto�� podawana jest �semkowo.
.TP
.BR case=lower " / " case=asis
Konwertuj wszystkie nazwy plik�w na ma�e litery, lub pozostaw bez zmian.
(Domy�lnie:
.BR case=lower .)
.TP
.BR conv=binary " / " conv=text " / " conv=auto
Dla
.BR conv=text ,
kasuj losowe CR-y (praktycznie wszystkie, za kt�rymi pod��a NL) podczas
odczytu pliku.
Dla
.BR conv=auto ,
wybieraj mniej lub bardziej losowo mi�dzy
.BR conv=binary " i " conv=text .
Dla
.BR conv=binary ,
po prostu czytaj co jest w pliku. Tak jest domy�lnie.
.TP
.B nocheck
Nie przerywaj montowania gdy okre�lone sprawdzanie konsystentno�ci
zawiedzie.

.SH "Opcje montowania dla iso9660"
Normalne nazwy plik�w
.I iso9660
pojawiaj� si� w formacie 8.3 (np. ograniczenia dosopodobne dla d�ugo�ci
plik�w), a w dodatku wszystkie znaki pisane du�ymi literami. Poza tym nie ma
pola dla w�a�ciciela, ochrony, liczby link�w, prowizji na urz�dzenia
znakowe/blokowe, etc.

Rozszerzeniem iso9660 jest Rock Ridge, kt�ry udost�pnia wszystkie te
unixopodobne w�a�ciwo�ci. Og�lnie, istniej� rozszerzenia do ka�dego rekordu
katalogowego, kt�re uzupe�niaj� informacje, a gdy Rock Ridge jest w u�yciu,
system plik�w jest nieodr�nialny od normalnego unixowego systemu plik�w
(poza faktem bycia tylko do odczytu).
.TP
.B norock
Wy��cza u�ycie z rozszerze� Rock Ridge, nawet je�li s� dost�pne. Zob.\&
.BR map .
.TP
.BR check=r[elaxed] " / " check=s[trict]
Z
.BR check=relaxed ,
nazwa plik�w jest najpierw konwertowana do ma�ych liter przed dokonywaniem
podgl�du. Jest to prawdopodobnie u�yteczne w po��czeniu z
.B norock
i
.BR map=normal .
(Domy�lnie:
.BR check=strict .)
.TP
\fBuid=\fP\fIvalue\fP i \fBgid=\fP\fIvalue\fP
Nadaje wszystkim plikom systemu plik�w wskazany uid i gid, prawdopodobnie
przedefiniowuj�c informacje znalezione w rozszerzeniach Rock Ridge.
(Domy�lnie:
.BR uid=0,gid=0 .)
.TP
.BR map=n[ormal] " / " map=o[ff]
Dla nie-Rock Ridge'owych wolumen�w, normlana translacja nazwy mapuje du�e
litery na ma�e, porzuca ko�cz�ce `;1' i konwertuje `;' na `.'.
Z
.B map=off
nie jest dokonywana translacja nazw. Zobacz
.BR norock .
(Domy�lnie:
.BR map=normal .)
.TP
.BI mode= value
Dla nie-Rock Ridge'owych wolumen�w, nadaj wszystkim plikom wskazane prawa.
(Domy�lnie: prawa dla odczytu dla wszystkich.)
.TP
.B unhide
Poka� te� pliki ukryte i zwi�zane.
.TP
.B block=[512|1024|2048]
Ustaw rozmiar bloku we wskazywanym wolumenie.
(Domy�lnie:
.BR block=1024 .)
.TP
.BR conv=a[uto] " / " conv=b[inary] " / " conv=m[text] " / " conv=t[ext]
(Domy�lnie:
.BR conv=binary .)
Od Linuxa 1.3.54 opcja ta nie dzia�a. (A niebinarne ustawienia by�y bardzo
niebezpieczne, cz�sto prowadzi�y do cichego niszczenia danych).
.TP
.B cruft
Je�li starszy bajt d�ugo�ci pliku zawiera inne �mieci, ustaw t� opcj�
montowania, aby ignorowa�a go. Implikuje to maksymalny rozmiar pliku nie
wi�kszy ni� 16MB. Opcja `cruft' jest ustawiana automatycznie je�li ca�y
CDROM ma dziwny rozmiar (ujemny, lub wi�kszy ni� 800 MB). Jest te�
ustawiana, gdy numery sekwencji wolumenu s� inne ni� 0 lub 1.

.SH "Opcje montowania w miniksie"
Brak.

.SH "Opcje montowania dla msdos"
Zobacz opcje dla FAT.
Je�li system plik�w
.I msdos
wykryje niekonsystentno��, zg�asza b��d i ustawia system plik�w na tylko dla
odczytu. System plik�w mo�e by� przeznaczony ponownie do zapisu przez
romontowanie.

.SH "Opcje montowania dla ncp"
Takie jak dla
.IR nfs ", a implementacja " ncp
oczekuje binarnego argumentu (
.IR "struct ncp_mount_data" )
do wywo�ania systemowego mount. Argument ten jest konstruowany przez
.BR ncpmount (8)
i bie��ca wersja
.B mount
(2.5k) nic ju� nie wie o ncp.

.SH "Opcje montowania dla nfs"
Zamiast tekstowych string�w opcji, przetwarzanych przez j�dro, system plik�w
.I nfs
oczekuje binarnych argument�w typu
.IR "struct nfs_mount_data" .
Program
.B mount
sam z siebie przetwarza nast�puj�ce opcje w formie `tag=warto��', i wstawia
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
Rozpoznawane s� r�wnie� nast�puj�ce opcje logiczne, prawdopodobnie
poprzedzane przez
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
Dla szczeg��w zobacz
.BR nfs (5).

Szczeg�lnie u�yteczne opcje zawieraj�
.TP
.B rsize=8192,wsize=8192
Uczyni to po��czenie nfs du�o szybszym ni� z domy�lnym buforem wielko�ci 1024.
.TP
.B soft
Opcja ta umo�liwia j�dru timeout je�li serwer nfs nie odpowiada przez jaki�
czas, w przeciwnym razie b�dzie pr�bowa� wiecznie. Czas mo�e by� podany
przez
.BR timeo=time .
Opcja ta jest u�yteczna je�li tw�j serwer nfs czasem nie odpowiada, lub bywa
rebootowany podczas gdy jaki� proces pr�buje si� z nim ��czy�.

.SH "Opcje montowania dla systemu proc"
.TP
\fBuid=\fP\fIvalue\fP i \fBgid=\fP\fIvalue\fP
Opcje te s� rozpoznawane, lecz nie maj� wg. mnie �adnego efektu.

.SH "Opcje montowania dla systemu smb"
Tak jak
.IR nfs ", implementacja " smb
oczekuje binarnego argumentu (
.IR "struct smb_mount_data" )
do wywo�ania systemowego mount. Argument ten jest konstruowany przez
.BR smbmount (8)
a bie��ca wersja
.B mount
(2.5k) nie wie nic o smb.

.SH "Opcje montowania dla sysv"
Brak.

.SH "Opcje montowania dla ufs"
Brak.

.SH "Opcje montowania dla umsdos"
Zobacz opcje dla msdos.

.SH "Opcje montowania dla vfat"
Przede wszystkim, rozpoznawane s� wszystkie opcje dla fat.
Co wi�cej, istniej�
.TP
.B uni_xlate
T�umacz nieobs�ugiwane znaki unicode na specjalne sekwencje eskejpowe.
To umo�liwia ci backupowanie i odtwarzanie nazw plik�w, kt�re by�y utworzone
ze znakami unicode. Bez tej opcji w wypadku braku mo�liwej translacji,
u�ywane jest '?'. Znakiem eskejpowym jest ':' poniewa� jest w innych
wypadkach nielegalny na systemi vfat. Sekwencja eskejpowa, kt�ra by�aby
u�yta dla znaku u to: ':', (u & 0x3f), ((u>>6) & 0x3f), (u>>12).
.TP
.B posix
Zezw�l na dwa pliki, kt�rych nazwy r�ni� si� wielko�ci� liter.
.TP
.B nonumtail
Najpierw spr�buj zrobi� kr�tk� nazw� bez numeru sekwencji, zanim zaczniesz
pr�bowa�
.IR name~num.ext .

.SH "Opcje montowania dla xenixa"
Brak.

.SH "Opcje montowania dla xiafs"
Brak. Chocia� nic nie ma z�ego w xiafs, nie jest on u�ywany zbyt cz�sto i
nie jest rozwijany. Prawdopodobnie nie powinno si� go u�ywa�.

.SH "URZ�DZENIE LOOP"
Kolejnym mo�liwym typem jest montowanie poprzez urz�dzenie loop. Na przyk�ad
komenda

.nf
.B "  mount /tmp/fdimage /mnt -t msdos -o loop=/dev/loop3,blocksize=1024"
.fi

Skonfiguruje urz�dzenie loop
.I /dev/loop3
na odpowiadaj�ce plikowi
.IR /tmp/fdimage ,
i zamontuje to urz�dzenie w
.IR /mnt .
Ten typ montowania wie o trzech opcjach, konkretnie
.BR loop ", " offset " i " encryption ,
kt�re s� w rzeczywisto�ci opcjami dla
.BR losetup (8).
Je�li nie podano wyj�tkowo urz�dzenia loop
(lecz tylko opcj� `\fB\-o loop\fP'), to
.B mount
spr�buje znale�� jakie� nieu�ywane urz�dzenie loop i u�y� go.

.SH PLIKI
.I /etc/fstab
tabela system�w plik�w
.br
.I /etc/mtab
tabela zamontowanych system�w plik�w
.br
.I /etc/mtab~
plik lockuj�cy
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
.BR mountd (8),
.BR nfsd (8),
.BR mke2fs (8),
.BR tune2fs (8),
.BR losetup (8)
.SH B��DY
Jest mo�liwe, �e uszkodzony system plik�w spowoduje `pad'.
.PP
Niekt�re linuxowe systemy plik�w nie wspieraj�
.B "\-o sync"
(ext2fs
.I wspiera
synchroniczne od�wierzania (updates) (a la BSD) gdy jest zamontowany z
opcj�
.BR sync .)
.PP
Opcja
.B "\-o remount"
mo�e nie by� w stanie zmieni� parametr�w montowania (np. wszystkie parametry
.I ext2fs
poza
.BR  sb ,
s� zmienialne remountem, lecz nie mo�na zmieni�
.B gid
czy
.B umask
dla
.IR fatfs ).
.SH HISTORIA
Komenda
.B mount
pojawi�a si� w wersji 6 AT&T UNIX.
