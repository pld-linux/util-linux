.\" {PTM/PB/0.1/02-02-1999/"montuj system plików"}
.\" Translation 1999 Przemek Borys <pborys@dione.ids.pl>
.\" Pfuh... to by³o wielkie... Ale ³atwe.
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
.TH MOUNT 8 "5 Lipiec 1996" "Linux 2.0" "Podrêcznik programisty linuxowego"
.SH NAZWA
mount \- montuj system plików
.SH SK£ADNIA
.BI "mount [\-hV]"
.LP
.BI "mount \-a [\-fnrvw] [\-t " vfstype ]
.br
.BI "mount [\-fnrvw] [\-o " options " [,...]] " "device " | " dir"
.br
.BI "mount [\-fnrvw] [\-t " vfstype "] [\-o " options "] " "device dir"
.SH OPIS
Wszystkie pliki dostêpne w systemie UNIX s± skupione w jednym wielkim
drzewie, hierarchii plików, zakorzenionej w
.BR / .
Pliki te mog± byæ podzielone miêdzy wieloma urz±dzeniami. Komenda
.B mount
umo¿liwia przy³±czenie systemu plików znajduj±cego siê na danym urz±dzeniu
do wielkiego drzewa plików. Odwrotnie, komenda
.BR umount (8)
powoduje od³±czenie go.

Standardowa postaæ komendy
.B mount
to
.RS
.br
.BI "mount \-t" " type device dir"
.RE
Mówi to j±dru by przy³±czy³ system plików znaleziony na urz±dzeniu
.I device
(który jest typu
.IR type )
w katalogu
.IR dir .
Poprzednia zawarto¶æ (je¶li istnia³a) i w³a¶ciciel oraz prawa katalogu
.I dir
staj± siê niewidzialne na czas zamontowania nowego systemu plików. W tym
czasie ¶cie¿ka
.I dir
odnosi siê do korzenia systemu plików na urz±dzeniu
.IR device .

Trzy formy wywo³ania niczego nie montuj±:
.RS
.br
.B "mount \-h"
.RE
drukuje informacjê o pomocy;
.RS
.br
.B "mount \-V"
.RE
drukuje wersjê; i po prostu
.RS
.BI "mount [-t" " type" ]
.RE
listuje wszystkie zamontowane systemy plików (typu
.IR type )
- patrz ni¿ej.

System plików
.I proc
nie jest zwi±zany z ¿adnym specjalnym urz±dzeniem i podczas jego montowania
zamiast nazwy urz±dzenia mo¿na u¿yæ s³owa kluczowego, takiego jak
.IR proc .
(Zwyczajowy wybór
.I none
jest mniej fortunny: b³±d `none busy' od
.B umount
mo¿e byæ niezrozumia³y.)

Wiêkszo¶æ urz±dzeñ jest wskazywanych przez nazwê pliku (specjalnego
urz±dzenia blokowego), jak np.
.IR /dev/sda1 ,
lecz istniej± inne mo¿liwo¶ci. Na przyk³ad w wypadku montowania NFS,
urz±dzenie
.I device
mo¿e wygl±daæ jak
.IR knuth.cwi.nl:/dir .

Plik
.I /etc/fstab
(zobacz
.BR fstab (5)),
mo¿e zawieraæ linie opisuj±ce, jakie urz±dzenie gdzie s± zazwyczaj montowane
i przy u¿yciu jakich opcji. Plik ten mo¿e byæ u¿ywany na trzy sposoby:
.LP
(i) Komenda
.RS
.br
.BI "mount \-a [-t" " type" ]
.RE
(zwykle podawana w skryptach startowych) powoduje zamontowanie wszystkich
systemów plików (odpowiadaj±cego typu) wymienionych w
.IR fstab ,
poza tymi, których wpisy zawieraj± s³owo kluczowe
.BR noauto .
.LP
(ii) Podczas montowania systemu plików wymienionego w
.IR fstab ,
wystarcza podaæ tylko nazwê urz±dzenia, lub tylko punkt montowania.
.LP
(iii) Tradycyjnie tylko superu¿ytkownik mo¿e montowaæ systemy plików. Jednak
je¶li
.I fstab
zawiera opcjê
.B user
w linii, to ka¿dy mo¿e zamontowaæ odpowiadaj±cy jej system plików.
.LP
Tak wiêc przy linii
.RS
.br
.B "/dev/cdrom  /cd  iso9660  ro,user,noauto,unhide"
.RE
dowolny u¿ytkownik mo¿e montowaæ system plików iso9660 ze swojego CD-ROM,
u¿ywaj±c komendy
.RS
.br
.B "mount /dev/cdrom"
.RE
lub
.RS
.br
.B "mount /cd"
.RE
Dla dalszych szczegó³ów odsy³amy do
.BR fstab (5).

Programy
.B mount
i
.B umount
opiekuj± siê list± obecnie zamontowanych systemów plików, która znajduje siê
w pliku
.IR /etc/mtab .
Je¶li nie podano argumentów dla
.BR mount ,
to drukowana jest ta lista.
Gdy zamontowany jest system plików
.I proc
(powiedzmy, ¿e w
.IR /proc ),
pliki
.I /etc/mtab
i
.I /proc/mounts
maj± bardzo podobn± zawarto¶æ. Poprzedni ma trochê wiêcej informacji, takich
jak opcje montowania, lecz niekoniecznie jest aktualny. (zobacz opcjê
.B \-n
poni¿ej).

.SH OPCJE
Pe³ny zestaw opcji u¿ywanych przy wywo³ywaniu
.B mount
jest okre¶lany przez ekstrakcjê opcji dla danego systemu plików, zadanych w
.IR fstab ,
a potem przez stosowanie wszelkich opcji podanych przez argument
.B \-o
a na koniec opcji
.BR \-r " lub " \-w
o ile istniej±.

Opcje dostêpne dla komendy
.BR mount :
.TP
.B \-v
Tryb verbose (gadatliwy).
.TP
.B \-f
Powoduje, ¿e wszystko siê wykonuje poza rzeczywistym wywo³aniem systemowym;
je¶li nie jest to oczywiste, ``udaje'' to montowanie systemu plików. Opcja
ta jest przydatna w po³aczeniu z flag±
.B \-v
do zrozumienia, co komenda
.B mount
usi³uje zrobiæ.
.TP
.B \-n
Montuj bez zapisywania w
.IR /etc/mtab .
Jest to niezbêdne na przyk³ad gdy
.I /etc
jest systemem plików tylko dla odczytu.
.TP
.B \-r
Montuj system plików w trybie tylko dla odczytu. Synonimem jest
.BR "\-o ro" .
.TP
.B \-w
Montuj system plików w trybie odczytu i zapisu. Tak jest domy¶lnie.
Synonimem jest
.BR "\-o rw" .
.TP
.BI \-t " vfstype"
Argument, który pod±¿a za
.B \-t
jest u¿ywany do wskazania rodzaju systemu plików. Wspierane obecnie systemy
plików s± wymienione w
.IR linux/fs/filesystems.c :
.IR minix ", " ext ", " ext2 ", " xiafs ", " hpfs ,
.IR fat ", " msdos ", " umsdos ", " vfat ,
.IR proc ", " nfs ", " iso9660 ", " smb ", " ncp ", " affs ", " ufs ,
.IR sysv ", " xenix ", " coherent .
Zauwa¿, ¿e ostatnie trzy s± ekwiwalentne i ¿e
.I xenix
oraz
.I coherent
zostan± usuniête w pewnym momencie w przysz³o¶ci \(em u¿ywaj zamiast nich
.IR sysv .

Typ
.I iso9660
jest domy¶lny. Je¶li nie poda siê opcji
.B \-t
lub je¶li podany zostanie typ
.BR auto ,
to superblok zostanie przetestowany w poszukiwaniu typu systemu plików
Wspierane s±
.RI minix ", " ext ", " ext2 ", " xia ", " iso9660 ")."
Je¶li test ten nie powiedzie siê, a istnieje
.IR /proc/filesystems ,
To wypróbowane zostan± wszystkie wylistowane tam systemy plików, poza tymi
które s± oznaczone jako "nodev" (np.
.I proc
czy
.IR nfs ).

Zauwa¿, ¿e
.B auto
mo¿e byæ u¿yteczne dla montowanych przez u¿ytkownika dyskietek.
Uwaga: testowanie u¿ywa herystyki i mo¿e rozpoznaæ z³y rodzaj systemu
plików.

Wiêcej ni¿ jeden mo¿e byæ podany w li¶cie oddzielanej przecinkami.
Lista typów systemów plików mo¿e byæ poprzedzona s³owem
.B no
aby okre¶liæ systemy plików, na których akcja nie powinna byæ wykonywana.
(Mo¿e to mieæ znaczenie z opcj±
.BR \-a .)

Na przyk³ad, komenda:
.RS
.RS
.B "mount \-a \-t nomsdos,ext"
.RE
montuje wszystkie systemy plików poza tymi, które s± typu
.I msdos
i
.IR ext .
.RE
.TP
.B \-o
Opcje s± podawane z flag±
.B \-o
po które nastêpuje oddzielony przecinkami ci±g opcji.
Niektóre z tych opcji s± u¿yteczne tylko je¶li pojawiaj± siê w pliku
.IR /etc/fstab .
Nastêpuj±ce opcje dotycz± dowolnego systemu plików, który jest montowany:
.RS
.TP
.B async
Wszelkie I/O do systemów plików powinno byæ wykonywane asynchronicznie.
.TP
.B auto
Mo¿e byæ montowany z opcj±
.BR \-a .
.TP
.B defaults
U¿ywaj opcji domy¶lnych:
.BR rw ", " suid ", " dev ", " exec ", " auto ", " nouser ", and " async.
.TP
.B dev
Interpretuj specjalne urz±dzenia blokowe i znakowe na systemie plików.
.TP
.B exec
Zezwól na uruchamianie binariów.
.TP
.B noauto
Mo¿e byæ montowany tylko wyj±tkowo (np. opcja
.B \-a
nie spowoduje zamontowania systemu).
.TP
.B nodev
Nie interpretuj specjalnych urz±dzeñ blokowych ani znakowych na systemie
plików.
.TP
.B noexec
Nie zezwól na uruchamianie ¿adnych binariów na zamontowanym systemie plików.
Opcja ta mo¿e byæ u¿yteczna dla serwera, który ma systemy plików,
zawieraj±ce binaria dla architektur innych ni¿ jego.
.TP
.B nosuid
Nie zezwól na dzia³anie bitów set-user-id i set-group-id.
.TP
.B nouser
Zabroñ zwyk³emu u¿ytkownikowi montowania systemu plików. Tak jest domy¶lnie.
.TP
.B remount
Spróbuj remontowaæ ju¿ zamontowany system plików. Jest to czêsto u¿ywane do
zmieniania flag montowania dla systemu plików, szczególnie aby umo¿liwiæ
zapis na systemach tylko dla odczytu.
.TP
.B ro
Montuj system plików w trybie tylko dla odczytu.
.TP
.B rw
Montuj system plików w trybie odczytu i zapisu.
.TP
.B suid
Umo¿liw dzia³anie bitom set-user-id i set-group-id.
.TP
.B sync
Wszelkie I/O do systemu plików powinno byæ wykonywane synchronicznie.
.TP
.B user
Umo¿liw zwyk³emu u¿ytkownikowi zamontowaæ system plików. Opcja ta implikuje
opcje
.BR noexec ", " nosuid ", i " nodev
(chyba, ¿e s± przeci±¿one przez opcje, jak w linii
.BR user,exec,dev,suid ).
.RE

.SH "SPECYFICZNE SYSTEMOWI PLIKÓW OPCJE MONTOWANIA"
Nastêpuj±ce opcje stosuje siê tylko do okre¶lonych systemów plików.
Sortujemy je wed³ug systemu plików. Wszystkie pod±¿aj± za flag±
.BR \-o .

.SH "Opcje montowania dla affs"
.TP
\fBuid=\fP\fIvalue\fP i \fBgid=\fP\fIvalue\fP
Ustaw w³a¶ciciela i grupê korzenia systemu plików (domy¶lnie: uid=gid=0,
lecz opcje
.B uid
lub
.B gid
bez podanej warto¶ci pobieraj± uid i gid bie¿±cego procesu).
.TP
\fBsetuid=\fP\fIvalue\fP i \fBsetgid=\fP\fIvalue\fP
Ustaw w³a¶ciciela i grupê wszystkich plików.
.TP
.BI mode= value
Ustaw prawa wszystkich plików na
.IR value " & 0777"
nie zwa¿aj±c na oryginalne prawa.
Dodaj prawa przeszukiwania na katalogi, które maj± prawo odczytu.
Warto¶æ jest podawana ósemkowo.
.TP
.B protect
Nie dopuszczaj do zmian w bitach ochrony systemu plików.
.TP
.B usemp
Ustaw uid i gid korzenia systemu plików na uid i gid punktu montowania, a¿
do pierwszego sync lub umount, a potem wyczy¶æ tê opcjê. Dziwne...
.TP
.B verbose
Drukuj informacje o ka¿dym pomy¶lnym montowaniu.
.TP
.BI prefix= string
Przedrostek u¿ywany przed nazw± wolumenu, gdy pod±¿a za linkiem.
.TP
.BI volume= string
Przedrostek (d³ugo¶ci najwy¿ej 30), u¿ywany przed '/' gdy pod±¿a za linkiem
symbolicznym.
.TP
.BI reserved= value
(Domy¶lnie: 2.) Ilo¶æ nieu¿ytych bloków na pocz±tku urz±dzenia.
.TP
.BI root= value
Podaj wyj±tkowo lokalizacjê bloku korzenia. (root block).
.TP
.BI bs= value
Podaj rozmiar bloku. Dozwolone warto¶ci to 512, 1024, 2048, 4096.
.TP
.BR grpquota " / " noquota " / " quota " / " usrquota
Opcje te s± przyjmowane, lecz s± ignorowane.

.SH "Opcje montowania dla coherent"
Brak.

.SH "Opcje montowania dla ext"
Brak.
Zauwa¿, ¿e system plików `ext' jest przedawniony. Nie u¿ywaj go.

.SH "Opcje montowania dla ext2"
System plików `ext2' jest standardowym systemem plików Linuxa. Z powodu
b³êdu j±dra, mo¿e byæ montowany z ró¿nymi opcjami montowania (Linux 2.0)/
.TP
.BR bsddf " / " minixdf
Ustaw zachowanie dla wywo³ania systemowego
.IR statfs .
Zachowanie
.B minixdf
to zwracanie w polu
.I f_blocks
ca³kowit± ilo¶æ bloków systemu plików, podczas gdy zachowaniem
.B bsddf
(co jest domy¶lne) jest odejmowanie kosztownych bloków u¿ywanych przez ext2
i niedostêpnych dla przechowywania plików. Tak wiêc
.RE
.nf

% mount /k -o minixdf; df /k; umount /k
Filesystem   1024-blocks  Used Available Capacity Mounted on
/dev/sda6      2630655   86954  2412169      3%   /k
% mount /k -o bsddf; df /k; umount /k
Filesystem   1024-blocks  Used Available Capacity Mounted on
/dev/sda6      2543714      13  2412169      0%   /k

.fi
(Zauwa¿, ¿e ten przyk³ad pokazuje, ¿e mo¿na dodaæ opcje linii komend do
opcji podanych w
.IR /etc/fstab .)

.TP
.BR check " / " check=normal " / " check=strict
Ustaw poziom sprawdzania. Gdy przynajmniej jedna z tych opcji jest ustawiona (a
.B check=normal
jest ustawiane domy¶lnie), inody i bitmapy bloków s± sprawdzane podczas
montowania (co mo¿e zabraæ pó³ minuty lub co¶ podobnego na du¿ym dysku).
Z ostrym (strict) sprawdzaniem, dealokacja bloków sprawdza, czy blok do
zwolnienia le¿y w strefie danych.
.TP
.BR check=none " / " nocheck
Nie dokonuje siê sprawdzania.
.TP
.B debug
Drukuj informacje debuggowe przy ka¿dym (re)montowaniu.
.TP
.BR errors=continue " / " errors=remount-ro " / " errors=panic
Zdefiniuj zachowanie przy napotkaniu b³edu.
(Albo ignoruj b³êdy i tylko zaznaczaj system plików jako b³êdny i kontynuuj,
lub remontuj system plików na tylko do odczytu, lub te¿ panikuj i zatrzymaj
system.) Domy¶lne ustawienie jest wyryte w superbloku systemu plików i mo¿e
byæ zmienione przy u¿yciu
.BR tune2fs (8).
.TP
.BR grpid " lub " bsdgroups " / " nogrpid " lub " sysvgroups
Opcje te definiuj±, jaki gid otrzymuje nowo utworzony plik.
Gdy ustawiony jest
.BR grpid ,
to pobiera gid katalogu, w którym jest utworzony; w przeciwnym wypadku
(domy¶lnie) bierze fsgid bie¿±cego procesu, chyba ¿e katalog ma ustawiony
bit setgid, w którym wypadku pobiera gid katalogu rodzicielskiego i
dodatkowo otrzymuje bit setgid, je¶li jest katalogiem.
.TP
\fBresgid=\fP\fIn\fP i \fBresuid=\fP\fIn\fP
System plików ext2 rezerwuje pewn± ilo¶æ wolnego miejsca (domy¶lnie 5%,
zobacz
.BR mke2fs (8)
i
.BR tune2fs (8)).
Opcje te okre¶laj±, kto mo¿e u¿ywaæ zarezerwowanych bloków.
(Ogólnie: ka¿dy, kto ma podany uid, lub nale¿y do podanej grupy.)
.TP
.BI sb= n
Zamiast bloku 1, jako superblok u¿yj bloku
.IR n .
Mo¿e to byæ przydatne, gdy system plików jest uszkodzony. Zazwyczaj kopie
superbloku znajduj± siê co 8192 bloków: w bloku 1, 8193, 16385, ...
(Dlatego na du¿ym systemie plików istniej± setki, lub nawet tysi±ce kopii
superbloku. Nie znam opcji mke2fs, które zmniejsza³yby tê liczbê).
.TP
.BR grpquota " / " noquota " / " quota " / " usrquota
Opcje te s± przyjmowane, lecz ignorowane.

.SH "Opcje montowania dla fat"
.TP
.BR blocksize=512 " / " blocksize=1024
Ustaw rozmiar bloku (domy¶lnie 512).
.TP
\fBuid=\fP\fIvalue\fP i \fBgid=\fP\fIvalue\fP
Ustaw w³a¶ciciela i grupê wszystkich plików (domy¶lnie: uid i gid bie¿±cego
procesu).
.TP
.BI umask= value
Ustaw umaskê (maskê bitow± praw, które 
.B nie
s± obecne). Domy¶lnie przyjmuje siê umaskê procesu bie¿±cego.
Warto¶æ jest podawana ósemkowo.
.TP
.BI check= value 
Mo¿na wybraæ trzy stopnie:
.RS
.TP
.B r[elaxed]
Du¿e i ma³e litery s± przyjmowane i ekwiwalentne, czê¶ci d³ugich nazw s±
skracane (np.
.I verylongname.foobar
staje siê
.IR verylong.foo ),
prowadz±ce i za³±czone spacje s± akceptowane jako czê¶æ nazwy (nazwa i
rozszerzenie).
.TP
.B n[ormal]
Podobnie jak "relaxed", lecz wiele znaków specjalnych (jak *, ?, <, spacje,
itp.) s± odrzucane. Tak jest domy¶lnie.
.TP
.B s[trict]
Jak "normal", lecz nazwy nie mog± zawieraæ d³ugich czê¶ci i znaków
specjalnych, które czasem s± u¿ywane pod linuxem, lecz nie s± akceptowane
przez MS-DOS (+, =, spacje itp.)
.RE
.TP
.BR conv=b[inary] " / " conv=t[ext] " / " conv=a[uto]
System plików
.I fat
mo¿e dokonywaæ konwersji CRLF-NL (Format tekstowy MS-DOS na format tekstowy
UNIX) w j±drze. Nastêpuj±ce tryby konwersji s± dostêpne:
.RS
.TP
.B binary
brak konwersji. Domy¶lne.
.TP
.B text
Konwersja CRLF<-->NL na wszystkich plikach.
.TP
.B auto
Konwersja CRLF<-->NL na wszystkich plikach, które nie maj± "ogólnie znanego
rozszerzenia binarnego". Lista znanych rozszerzeñ mo¿e byæ znaleziona na
pocz±tku
.I fs/fat/misc.c
(w wersji 2.0, list± jest: exe, com, bin, app, sys, drv, ovl, ovr, obj,
lib, dll, pif, arc, zip, lha, lzh, zoo, tar, z, arj, tz, taz, tzp, tpz,
gz, tgz, deb, gif, bmp, tif, gl, jpg, pcx, tfm, vf, gf, pk, pxl, dvi).
.PP
Programy, które dokonuj± obliczonych lseek'ów, nie bêd± zadowolone z
konwersji. Niektórzy ludzie utracili dane przez tê translacjê. Strze¿cie
sie!

Dla systemów zamontowanych w trybie binarnym, dostêpne s± narzêdzia
konwersji (fromdos/todos).
.RE
.TP
.B debug
W³±cz flagê
.IR debug .
Wydrukowany zostanie string wersji i lista parametrów systemu plików (te
dane drukowane s± te¿ je¶li parametry wydaj± siê byæ niekonsystentne).
.TP
.BR fat=12 " / " fat=16
Okre¶l albo fat 12-bitowy, albo fat 16-bitowy. To przeci±¿a procedurê
automatycznej detekcji fatu. Ostro¿nie.
.TP
.B quiet
W³±cz flagê
.I quiet
(cicho). Próby chown lub chmod nie zwracaj± b³êdów, chocia¿ siê nie powodz±.
U¿ywaj ostro¿nie!
.TP
.B "sys_immutable, showexec, dots, nodots, dotsOK=[yes|no]"
Ró¿ne bezmy¶lne próby wymuszenia konwencji Unixa lub Dosa na systemie plików
fat.

.SH "Opcje montowania dla hpfs"
.TP
\fBuid=\fP\fIvalue\fP i \fBgid=\fP\fIvalue\fP
Ustaw w³a¶ciciela i grupê wszystkich plików (domy¶lnie: uid i gid bie¿±cego
procesu).
.TP
.BI umask= value
Ustaw umaskê (maskê bitow± praw, które 
.B nie
s± obecne). Domy¶lnie u¿ywana jest umaska bie¿±cego procesu.
Warto¶æ podawana jest ósemkowo.
.TP
.BR case=lower " / " case=asis
Konwertuj wszystkie nazwy plików na ma³e litery, lub pozostaw bez zmian.
(Domy¶lnie:
.BR case=lower .)
.TP
.BR conv=binary " / " conv=text " / " conv=auto
Dla
.BR conv=text ,
kasuj losowe CR-y (praktycznie wszystkie, za którymi pod±¿a NL) podczas
odczytu pliku.
Dla
.BR conv=auto ,
wybieraj mniej lub bardziej losowo miêdzy
.BR conv=binary " i " conv=text .
Dla
.BR conv=binary ,
po prostu czytaj co jest w pliku. Tak jest domy¶lnie.
.TP
.B nocheck
Nie przerywaj montowania gdy okre¶lone sprawdzanie konsystentno¶ci
zawiedzie.

.SH "Opcje montowania dla iso9660"
Normalne nazwy plików
.I iso9660
pojawiaj± siê w formacie 8.3 (np. ograniczenia dosopodobne dla d³ugo¶ci
plików), a w dodatku wszystkie znaki pisane du¿ymi literami. Poza tym nie ma
pola dla w³a¶ciciela, ochrony, liczby linków, prowizji na urz±dzenia
znakowe/blokowe, etc.

Rozszerzeniem iso9660 jest Rock Ridge, który udostêpnia wszystkie te
unixopodobne w³a¶ciwo¶ci. Ogólnie, istniej± rozszerzenia do ka¿dego rekordu
katalogowego, które uzupe³niaj± informacje, a gdy Rock Ridge jest w u¿yciu,
system plików jest nieodró¿nialny od normalnego unixowego systemu plików
(poza faktem bycia tylko do odczytu).
.TP
.B norock
Wy³±cza u¿ycie z rozszerzeñ Rock Ridge, nawet je¶li s± dostêpne. Zob.\&
.BR map .
.TP
.BR check=r[elaxed] " / " check=s[trict]
Z
.BR check=relaxed ,
nazwa plików jest najpierw konwertowana do ma³ych liter przed dokonywaniem
podgl±du. Jest to prawdopodobnie u¿yteczne w po³±czeniu z
.B norock
i
.BR map=normal .
(Domy¶lnie:
.BR check=strict .)
.TP
\fBuid=\fP\fIvalue\fP i \fBgid=\fP\fIvalue\fP
Nadaje wszystkim plikom systemu plików wskazany uid i gid, prawdopodobnie
przedefiniowuj±c informacje znalezione w rozszerzeniach Rock Ridge.
(Domy¶lnie:
.BR uid=0,gid=0 .)
.TP
.BR map=n[ormal] " / " map=o[ff]
Dla nie-Rock Ridge'owych wolumenów, normlana translacja nazwy mapuje du¿e
litery na ma³e, porzuca koñcz±ce `;1' i konwertuje `;' na `.'.
Z
.B map=off
nie jest dokonywana translacja nazw. Zobacz
.BR norock .
(Domy¶lnie:
.BR map=normal .)
.TP
.BI mode= value
Dla nie-Rock Ridge'owych wolumenów, nadaj wszystkim plikom wskazane prawa.
(Domy¶lnie: prawa dla odczytu dla wszystkich.)
.TP
.B unhide
Poka¿ te¿ pliki ukryte i zwi±zane.
.TP
.B block=[512|1024|2048]
Ustaw rozmiar bloku we wskazywanym wolumenie.
(Domy¶lnie:
.BR block=1024 .)
.TP
.BR conv=a[uto] " / " conv=b[inary] " / " conv=m[text] " / " conv=t[ext]
(Domy¶lnie:
.BR conv=binary .)
Od Linuxa 1.3.54 opcja ta nie dzia³a. (A niebinarne ustawienia by³y bardzo
niebezpieczne, czêsto prowadzi³y do cichego niszczenia danych).
.TP
.B cruft
Je¶li starszy bajt d³ugo¶ci pliku zawiera inne ¶mieci, ustaw tê opcjê
montowania, aby ignorowa³a go. Implikuje to maksymalny rozmiar pliku nie
wiêkszy ni¿ 16MB. Opcja `cruft' jest ustawiana automatycznie je¶li ca³y
CDROM ma dziwny rozmiar (ujemny, lub wiêkszy ni¿ 800 MB). Jest te¿
ustawiana, gdy numery sekwencji wolumenu s± inne ni¿ 0 lub 1.

.SH "Opcje montowania w miniksie"
Brak.

.SH "Opcje montowania dla msdos"
Zobacz opcje dla FAT.
Je¶li system plików
.I msdos
wykryje niekonsystentno¶æ, zg³asza b³±d i ustawia system plików na tylko dla
odczytu. System plików mo¿e byæ przeznaczony ponownie do zapisu przez
romontowanie.

.SH "Opcje montowania dla ncp"
Takie jak dla
.IR nfs ", a implementacja " ncp
oczekuje binarnego argumentu (
.IR "struct ncp_mount_data" )
do wywo³ania systemowego mount. Argument ten jest konstruowany przez
.BR ncpmount (8)
i bie¿±ca wersja
.B mount
(2.5k) nic ju¿ nie wie o ncp.

.SH "Opcje montowania dla nfs"
Zamiast tekstowych stringów opcji, przetwarzanych przez j±dro, system plików
.I nfs
oczekuje binarnych argumentów typu
.IR "struct nfs_mount_data" .
Program
.B mount
sam z siebie przetwarza nastêpuj±ce opcje w formie `tag=warto¶æ', i wstawia
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
Rozpoznawane s± równie¿ nastêpuj±ce opcje logiczne, prawdopodobnie
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
Dla szczegó³ów zobacz
.BR nfs (5).

Szczególnie u¿yteczne opcje zawieraj±
.TP
.B rsize=8192,wsize=8192
Uczyni to po³±czenie nfs du¿o szybszym ni¿ z domy¶lnym buforem wielko¶ci 1024.
.TP
.B soft
Opcja ta umo¿liwia j±dru timeout je¶li serwer nfs nie odpowiada przez jaki¶
czas, w przeciwnym razie bêdzie próbowaæ wiecznie. Czas mo¿e byæ podany
przez
.BR timeo=time .
Opcja ta jest u¿yteczna je¶li twój serwer nfs czasem nie odpowiada, lub bywa
rebootowany podczas gdy jaki¶ proces próbuje siê z nim ³±czyæ.

.SH "Opcje montowania dla systemu proc"
.TP
\fBuid=\fP\fIvalue\fP i \fBgid=\fP\fIvalue\fP
Opcje te s± rozpoznawane, lecz nie maj± wg. mnie ¿adnego efektu.

.SH "Opcje montowania dla systemu smb"
Tak jak
.IR nfs ", implementacja " smb
oczekuje binarnego argumentu (
.IR "struct smb_mount_data" )
do wywo³ania systemowego mount. Argument ten jest konstruowany przez
.BR smbmount (8)
a bie¿±ca wersja
.B mount
(2.5k) nie wie nic o smb.

.SH "Opcje montowania dla sysv"
Brak.

.SH "Opcje montowania dla ufs"
Brak.

.SH "Opcje montowania dla umsdos"
Zobacz opcje dla msdos.

.SH "Opcje montowania dla vfat"
Przede wszystkim, rozpoznawane s± wszystkie opcje dla fat.
Co wiêcej, istniej±
.TP
.B uni_xlate
T³umacz nieobs³ugiwane znaki unicode na specjalne sekwencje eskejpowe.
To umo¿liwia ci backupowanie i odtwarzanie nazw plików, które by³y utworzone
ze znakami unicode. Bez tej opcji w wypadku braku mo¿liwej translacji,
u¿ywane jest '?'. Znakiem eskejpowym jest ':' poniewa¿ jest w innych
wypadkach nielegalny na systemi vfat. Sekwencja eskejpowa, która by³aby
u¿yta dla znaku u to: ':', (u & 0x3f), ((u>>6) & 0x3f), (u>>12).
.TP
.B posix
Zezwól na dwa pliki, których nazwy ró¿ni± siê wielko¶ci± liter.
.TP
.B nonumtail
Najpierw spróbuj zrobiæ krótk± nazwê bez numeru sekwencji, zanim zaczniesz
próbowaæ
.IR name~num.ext .

.SH "Opcje montowania dla xenixa"
Brak.

.SH "Opcje montowania dla xiafs"
Brak. Chocia¿ nic nie ma z³ego w xiafs, nie jest on u¿ywany zbyt czêsto i
nie jest rozwijany. Prawdopodobnie nie powinno siê go u¿ywaæ.

.SH "URZ¡DZENIE LOOP"
Kolejnym mo¿liwym typem jest montowanie poprzez urz±dzenie loop. Na przyk³ad
komenda

.nf
.B "  mount /tmp/fdimage /mnt -t msdos -o loop=/dev/loop3,blocksize=1024"
.fi

Skonfiguruje urz±dzenie loop
.I /dev/loop3
na odpowiadaj±ce plikowi
.IR /tmp/fdimage ,
i zamontuje to urz±dzenie w
.IR /mnt .
Ten typ montowania wie o trzech opcjach, konkretnie
.BR loop ", " offset " i " encryption ,
które s± w rzeczywisto¶ci opcjami dla
.BR losetup (8).
Je¶li nie podano wyj±tkowo urz±dzenia loop
(lecz tylko opcjê `\fB\-o loop\fP'), to
.B mount
spróbuje znale¼æ jakie¶ nieu¿ywane urz±dzenie loop i u¿yæ go.

.SH PLIKI
.I /etc/fstab
tabela systemów plików
.br
.I /etc/mtab
tabela zamontowanych systemów plików
.br
.I /etc/mtab~
plik lockuj±cy
.br
.I /etc/mtab.tmp
plik tymczasowy
.SH "ZOBACZ TAK¯E"
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
.SH B£ÊDY
Jest mo¿liwe, ¿e uszkodzony system plików spowoduje `pad'.
.PP
Niektóre linuxowe systemy plików nie wspieraj±
.B "\-o sync"
(ext2fs
.I wspiera
synchroniczne od¶wierzania (updates) (a la BSD) gdy jest zamontowany z
opcj±
.BR sync .)
.PP
Opcja
.B "\-o remount"
mo¿e nie byæ w stanie zmieniæ parametrów montowania (np. wszystkie parametry
.I ext2fs
poza
.BR  sb ,
s± zmienialne remountem, lecz nie mo¿na zmieniæ
.B gid
czy
.B umask
dla
.IR fatfs ).
.SH HISTORIA
Komenda
.B mount
pojawi³a siê w wersji 6 AT&T UNIX.
