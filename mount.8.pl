.\" {PTM/PB/0.1/02-02-1999/"montuj system plików"}
.\" Translation 1999 Przemek Borys <pborys@dione.ids.pl>
.\" Pfuh... to by³o wielkie... Ale ³atwe.
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
.TH MOUNT 8 "14 wrze¶nia 1997" "Linux 2.0" "Podrêcznik programisty linuksowego"
.SH NAZWA
mount \- montuj system plików
.SH SK£ADNIA
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
.IB "urz±dzenie " | " katalog"
.br
.B mount
.RB [ \-fnrsvw ]
.RB [ \-t
.IR typsystemu ]
.RB [ \-o
.IR opcje "] " "urz±dzenie katalog"
.SH OPIS
Wszystkie pliki dostêpne w systemie UNIX s± zorganizowane w jednym wielkim
drzewie, hierarchii plików, zakorzenionej w
.BR / .
Pliki te mog± byæ po³o¿one na wielu urz±dzeniach. Polecenie
.B mount
umo¿liwia przy³±czenie systemu plików znajduj±cego siê na danym urz±dzeniu
do wielkiego drzewa plików. Odwrotnie, polecenie
.BR umount (8)
powoduje od³±czenie go.

Standardowa postaæ polecenia
.B mount
to
.RS
.br
.BI "mount \-t" " typ urz±dzenie katalog"
.RE
Nakazuje j±dru, by przy³±czy³o system plików znaleziony na danym
.I urz±dzeniu
(które jest typu
.IR typ )
w zadanym
.IR katalogu .
Poprzednia zawarto¶æ (je¶li istnia³a) i w³a¶ciciel oraz prawa katalogu
.I dir
staj± siê niewidzialne na czas przy³±czenia (zamontowania) nowego systemu
plików. W tym czasie ¶cie¿ka
.I katalog
odnosi siê do korzenia systemu plików na podanym
.IR urz±dzeniu .

Trzy formy wywo³ania niczego faktycznie nie montuj±:
.RS
.br
.B "mount \-h"
.RE
wypisuje komunikat pomocy,
.RS
.br
.B "mount \-V"
.RE
wypisuje wersjê, a samo
.RS
.B mount
.RB [ -l ]
.RB [ -t
.IR typ ]
.RE
pokazuje listê wszystkich zamontowanych systemów plików
(typu
.IR typ ).
Opcja -l ujmuje w zestawieniu równie¿ etykiety (ext2 i XFS).
Patrz ni¿ej.

.\" Faktycznie od 2.3.99. Pocz±tkow± sk³adni± by³o: mount -t bind.
Od wersji 2.4.0 Linuksa mo¿liwe jest ponowne zamontowanie czê¶ci systemu
plików w innym miejscu. S³u¿y do tego wywo³anie:
.RS
.br
.B "mount --bind stary_katalog nowy_katalog"
.RE

System plików
.I proc
nie jest zwi±zany z ¿adnym urz±dzeniem specjalnym i podczas jego montowania
zamiast nazwy urz±dzenia mo¿na u¿yæ dowolnego s³owa kluczowego, np.
.IR proc .
(Zwyczajowy wybór
.I none
jest mniej udany: b³±d `none busy' od
.B umount
mo¿e byæ myl±cy.)

Wiêkszo¶æ urz±dzeñ jest wskazywanych przez nazwê pliku (specjalnego
urz±dzenia blokowego), jak np.
.IR /dev/sda1 ,
lecz istniej± inne mo¿liwo¶ci. Na przyk³ad w wypadku montowania NFS,
.I urz±dzenie
mo¿e wygl±daæ tak:
.IR knuth.cwi.nl:/dir .
Specjalne urz±dzenie blokowe mo¿na wskazaæ podaj±c etykietê wolumenu
lub  UUID (zob. opcje \-L i \-U poni¿ej).

Plik
.I /etc/fstab
(zobacz
.BR fstab (5)),
mo¿e zawieraæ wiersze opisuj±ce, jakie urz±dzenia gdzie s± zazwyczaj
montowane i przy u¿yciu jakich opcji. Plik ten mo¿e byæ u¿ywany na trzy
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
systemów plików (danego typu) wymienionych w
.IR fstab ,
poza tymi, których wpisy zawieraj± s³owo kluczowe
.BR noauto .
.LP
(ii) Podczas montowania systemu plików wymienionego w
.IR fstab ,
wystarczy podaæ tylko nazwê urz±dzenia lub tylko punkt montowania.
.LP
(iii) Tradycyjnie tylko superu¿ytkownik mo¿e montowaæ systemy plików. Jednak
je¶li
.I fstab
w danym wierszu zawiera opcjê
.BR user ,
to ka¿dy mo¿e zamontowaæ odpowiadaj±cy temu wpisowi system plików.
.LP
Tak wiêc, je¶li mamy wiersz
.RS
.br
.B "/dev/cdrom  /cd  iso9660  ro,user,noauto,unhide"
.RE
to dowolny u¿ytkownik mo¿e zamontowaæ system plików iso9660 umieszczony na
CD-ROM-ie, pos³uguj±c siê poleceniem
.RS
.br
.B "mount /dev/cdrom"
.RE
lub
.RS
.br
.B "mount /cd"
.RE
Szczegó³y opisuje
.BR fstab (5).
Tylko u¿ytkownik, który zamontowa³ system plików mo¿e ponownie go odmontowaæ.
Je¿eli zachodzi potrzeba, by odmotowaywaæ móg³ ka¿dy, w odpowiednim wierszu 
.I fstab
nale¿y
zamiast
.B user
wpisaæ
.BR users .
Opcja
.B owner
przypomina opcjê
.BR user ,
poza tym, ¿e dany u¿ytkownik musi byæ w³a¶cicielem odpowiedniego pliku
specjalnego. Jest przydatna np. w przypadku
.I /dev/fd
je¶li skrypt zg³oszeniowy (login script) czyni danego u¿ytkownika
korzystaj±cego z konsoli w³a¶cicielem tego urz±dzenia.

Programy
.B mount
i
.B umount
opiekuj± siê list± obecnie zamontowanych systemów plików, znajduj±c± siê
w pliku
.IR /etc/mtab .
Je¶li nie podano argumentów dla
.BR mount ,
to wypisywana jest ta lista.
Gdy zamontowany jest system plików
.I proc
(powiedzmy, ¿e w
.IR /proc ),
pliki
.I /etc/mtab
i
.I /proc/mounts
maj± bardzo podobn± zawarto¶æ. Pierwszy ma trochê wiêcej informacji, takich
jak opcje montowania, lecz niekoniecznie jest aktualny. (zobacz opcjê
.B \-n
poni¿ej).
Mo¿liwe jest zast±pienie
.I /etc/mtab
dowi±zaniem symbolicznym do
.IR /proc/mounts ,
ale w ten sposób tracona jest czê¶æ danych, a szczególnie mniej wygodna
bêdzie praca z urz±dzeniem loop.

.SH OPCJE
Pe³ny zestaw opcji u¿ywanych przy wywo³ywaniu
.B mount
jest ustalany przez pobranie opcji dla danego systemu plików z
.IR fstab ,
a nastêpnie zastosowanie wszelkich opcji podanych argumentem
.BR \-o ,
a na koniec opcji
.BR \-r " lub " \-w ,
o ile istniej±.

Opcje dostêpne dla polecenia
.BR mount :
.TP
.B \-V
Wypisuje wersjê.
.TP
.B \-h
Wypisuje komunikat pomocy.
.TP
.B \-v
Tryb verbose (gadatliwy).
.TP
.B \-a
Montuje wszystkie systemy plików (zadanych typów) ujête w
.IR fstab .
.TP
.B \-F
(U¿yte w po³±czeniu z
.BR \-a .)
Dla ka¿dego urz±dzenia tworzy nowy proces równoleg³y mount.
Powoduje to równoleg³y przebieg montowania ró¿nych urz±dzeñ lub ró¿nych
serwerów NFS. Zalet± jest wiêksza szybko¶æ: tak¿e przekroczenia czasu
dla NFS bêd± wyznaczane równolegle. Wad± jest to, ¿e montowania wykonywane
s± w niezdefiniowanej kolejno¶ci. Nie mo¿na zatem zastosowaæ tej opcji
do równoczesnego montowania
.I /usr
i
.IR /usr/spool .
.TP
.B \-f
Powoduje wykonywanie wszystkiego poza faktycznym wywo³aniem funkcji systemowej.
Je¶li nie jest to oczywiste: ,,udaje'' to montowanie systemu plików.
W po³±czeniu z flag±
.B \-v
przydaje siê do ustalenia, co usi³uje zrobiæ polecenie
.BR mount .
Mo¿e byæ te¿ u¿ywana do dodawania wpisów dla urz±dzeñ, które zamontowano
wcze¶niej z opcj± -n.
.TP
.B \-l
Dok³ada etykiety ext2 i XFS do wyj¶cia wypisywanego przez mount.
¯eby opcja ta mog³a dzia³aæ, mount musi mieæ prawo odczytu urz±dzania
dyskowego (np. suid root). Etykietê dla ext2 nadaje siê za pomoc± narzêdzia
.BR e2label (8),
za¶ dla XFS - stosuj±c
.BR xfs_admin (8).
.TP
.B \-n
Montuje bez zapisywania w
.IR /etc/mtab .
Jest to niezbêdne na przyk³ad gdy
.I /etc
jest systemem plików tylko dla odczytu.
.TP
.B \-s
Toleruje nieodpowiednie opcje montowania, zamiast koñczyæ pracê
niepowodzeniem. Powoduje to ignorowanie opcji montowania, które nie s±
obs³ugiwane przez dany system plików. Nie wszystkie systemy plików rozpoznaj±
tê opcjê. Istnieje ona dla wspomo¿enia Linuksowego automountera opartego
na autofs.
.TP
.B \-r
Montuje system plików w trybie tylko dla odczytu. Synonimem jest
.BR "\-o ro" .
.TP
.B \-w
Montuje system plików w trybie odczytu i zapisu. Tak jest domy¶lnie.
Synonimem jest
.BR "\-o rw" .
.TP
.BI \-L " label"
Montuje partycjê posiadaj±c± podan± etykietê
.IR label .
.TP
.BI \-U " uuid"
Montuje partycjê posiadaj±c± podany
.IR uuid .
Te dwie opcje wymagaj± istnienia pliku
.IR /proc/partitions
(obecnego od wersji 2.1.116 Linuksa).
.TP
.BI \-t " typ_systemu_plików"
Argument wystêpuj±cy po
.B \-t
jest u¿ywany do wskazania rodzaju systemu plików.
Obecnie obs³ugiwane s± :
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
Zauwa¿, ¿e coherent, sysv i xenix s± równowa¿ne i ¿e
.I xenix
oraz
.I coherent
zostan± kiedy¶ usuniête \(em nale¿y zamiast nich stosowaæ
.IR sysv .
Od j±dra wersji 2.1.21 typy
.I ext
i
.I xiafs
ju¿ nie istniej±.

Dla wiêkszo¶ci typów, jedyne, co robi program
.BR mount ,
to po prostu wywo³uje funkcjê systemow±
.IR mount (2),
i nie jest tu wymagana ¿adna szczegó³owa wiedza o danym systemie plików.
Jednak¿e dla kilku typów (jak np. nfs, smbfs, ncpfs) konieczny jest
niezaplanowany kod. Kod dla nfs jest wbudowany, ale smbfs i ncpfs maj±
osobny program montuj±cy. ¯eby umozliwiæ jednolite traktowanie wszystkich
typów, mount wywo³any z typem
.I TYP
uruchamia program
.I /sbin/mount.TYP
(je¶li takowy istnieje).
Poniewa¿ rozmaite wersje programu
.I smbmount
maj± ró¿ne konwencje wywo³añ, byæ mo¿e
.I /sbin/mount.smb
bêdzie musia³ byæ skryptem pow³oki, który dobierze w³a¶ciwe wywo³anie.

Typ
.I iso9660
jest domy¶lny. Je¶li nie poda siê opcji
.B \-t
lub je¶li podany zostanie typ
.BR auto ,
to typ systemu plików bêdzie wyszukiwany w superbloku.
Obs³ugiwane s±
.IR minix ", " ext ", " ext2 ", " xiafs ", " iso9660 ", " romfs
.RI , ufs ", " ntfs  ", " qnx4 ", " bfs ", " xfs ", " cramfs ", " hfs
.RI , hpfs ", " adfs .
Je¶li test ten nie powiedzie siê, mount próbuje odczytaæ plik
.IR /etc/filesystems ,
lub, je¶li on nie istnieje,
.IR /proc/filesystems .
Wypróbowane zostan± wszystkie wymienione tam systemy plików, poza tymi
które s± oznaczone jako "nodev" (np.
.IR devpts ,
.I proc
i
.IR nfs ).

Zauwa¿, ¿e
.B auto
mo¿e byæ przydatne dla montowanych przez u¿ytkownika dyskietek.
Utworzenie pliku
.I /etc/filesystems
przydaje siê do zmiany kolejno¶ci rozpoznawania (np. do próbowania vfat
przed msdos) lub w przypadku stosowania modu³u autoloader.
Uwaga: rozpoznawanie u¿ywa heurystyki (obecno¶æ odpowiedniej `magii')
i mo¿e rozpoznaæ z³y rodzaj systemu plików.

Mo¿na podaæ wiêcej ni¿ jeden typ, w postaci listy rozdzielonej przecinkami.
Lista typów systemów plików mo¿e byæ poprzedzona s³owem
.B no
aby okre¶liæ systemy plików, na których akcja nie powinna byæ wykonywana.
(Mo¿e to mieæ znaczenie z opcj±
.BR \-a .)

Na przyk³ad, polecenie:
.RS
.RS
.B "mount \-a \-t nomsdos,ext"
.RE
montuje wszystkie systemy plików poza tymi, które s± typu
.I msdos
lub
.IR ext .
.RE
.TP
.B \-o
Opcje podaje siê flag±
.BR \-o ,
po której nastêpuje oddzielony przecinkami ci±g opcji.
Niektóre z tych opcji s± u¿yteczne tylko je¶li pojawiaj± siê w pliku
.IR /etc/fstab .
Poni¿sze opcje dotycz± dowolnego montowanego systemu plików (choæ nie ka¿dy
z systemów plików faktycznie je honoruje, np. opcja
.B sync
obecnie wp³ywa tylko na ext2 i ufs):
.RS
.TP
.B async
Wszelkie operacje wej¶cia/wyj¶cia dla tego systemu plików powinny byæ
wykonywane asynchronicznie.
.TP
.B atime
Przy ka¿dym siêgniêciu do pliku aktualizuje czas dostêpu zapisany w i-wê¼le.
Tak jest domy¶lnie.
.TP
.B auto
System plików mo¿e byæ montowany opcj±
.BR \-a .
.TP
.B defaults
U¿ywa opcji domy¶lnych:
.BR rw ", " suid ", " dev ", " exec ", " auto ", " nouser " i " async.
.TP
.B dev
Interpretuje specjalne urz±dzenia blokowe i znakowe na danym systemie plików.
.TP
.B exec
Zezwala na uruchamianie binariów.
.TP
.B noatime
Nie wykonuje aktualizacji czasu dostêpu w i-wê¼le po³o¿onym na tym systemie
plików (np. w celu uzyskania szybszego dostêpu do bufora wiadomo¶ci, co
przyspiesza dzia³anie serwerów grup dyskusyjnych).
.TP
.B noauto
Dany system plików mo¿e byæ montowany tylko jawnie (np. opcja
.B \-a
nie spowoduje jego zamontowania).
.TP
.B nodev
Nie interpretuje specjalnych urz±dzeñ blokowych ani znakowych na systemie
plików.
.TP
.B noexec
Nie pozwala na uruchamianie ¿adnych binariów z tego systemu plików.
Opcja ta mo¿e byæ u¿yteczna dla serwera, który ma systemy plików
zawieraj±ce binaria dla architektur innych ni¿ jego w³asna.
.TP
.B nosuid
Nie pozwala na dzia³anie bitów set-user-id i set-group-id.
(Wygl±da na bezpieczn±, ale w rzeczywisto¶ci raczej taka nie jest je¶li
zainstalowano suidperl(1).)
.TP
.B nouser
Zabrania zwyk³emu u¿ytkownikowi (tzn. innemu ni¿ root) montowania systemu
plików. Tak jest domy¶lnie.
.TP
.B remount
Usi³uje ponownie zamontowaæ ju¿ zamontowany system plików. Czêsto u¿ywane
do zmiany flag montowania systemu, szczególnie aby umo¿liwiæ zapis
na systemach tylko dla odczytu. Nie zmienia urz±dzenia ani punktu montowania.
.TP
.B ro
Montuje system plików w trybie tylko dla odczytu.
.TP
.B rw
Montuje system plików w trybie odczytu i zapisu.
.TP
.B suid
Umo¿liwia dzia³anie bitom set-user-id i set-group-id.
.TP
.B sync
Wszelkie operacje wej¶cia/wyj¶cia dla tego systemu plików powinny byæ
wykonywane synchronicznie.
.TP
.B user
Pozwala na zamontowanie tego systemu plików przez zwyk³ego u¿ytkownika.
Opcja ta implikuje opcje
.BR noexec ", " nosuid ", i " nodev
(chyba ¿e s± przes³aniane przez nastêpne opcje, jak w linii
.BR user,exec,dev,suid ).
.RE

.SH "OPCJE MONTOWANIA SPECYFICZNE DLA RÓ¯NYCH SYSTEMÓW PLIKÓW"
Nastêpuj±ce opcje stosuje siê tylko do okre¶lonych systemów plików.
Uporz±dkowali¶my je wed³ug systemu plików. Wszystkie wystêpuj± po fladze
.BR \-o .

.SH "Opcje montowania dla adfs"
.TP
\fBuid=\fP\fIwarto¶æ\fP i \fBgid=\fP\fIwarto¶æ\fP
Ustawia w³a¶ciciela i grupê plików w danym systemie plików
(domy¶lnie: uid=gid=0).
.TP
\fBownmask=\fP\fIwarto¶æ\fP i \fBothmask=\fP\fIwarto¶æ\fP
Ustawia maskê praw dla, odpowiednio, 'w³a¶ciciela' i 'innych'
(domy¶lnie, odpowiednio: 0700 i 0077).
Zobacz tak¿e
.IR /usr/src/linux/Documentation/filesystems/adfs.txt .

.SH "Opcje montowania dla affs"
.TP
\fBuid=\fP\fIwarto¶æ\fP i \fBgid=\fP\fIwarto¶æ\fP
Ustawia w³a¶ciciela i grupê korzenia systemu plików (domy¶lnie: uid=gid=0), 
lecz opcje
.B uid
lub
.B gid
bez podanej warto¶ci pobieraj± uid i gid bie¿±cego procesu).
.TP
\fBsetuid=\fP\fIwarto¶æ\fP i \fBsetgid=\fP\fIwarto¶æ\fP
Ustawia w³a¶ciciela i grupê wszystkich plików.
.TP
.BI mode= warto¶æ
Ustawia prawa wszystkich plików na
.IR warto¶æ " & 0777,"
nie zwa¿aj±c na oryginalne prawa.
Dodaje prawa przeszukiwania dla katalogów, które maj± prawo odczytu.
Warto¶æ jest podawana ósemkowo.
.TP
.B protect
Nie dopuszcza do zmian w bitach ochrony systemu plików.
.TP
.B usemp
Ustawia uid i gid korzenia systemu plików na uid i gid punktu montowania, a¿
do pierwszego sync lub umount, a potem kasuje tê opcjê. Dziwne...
.TP
.B verbose
Wypisuje informacjê o ka¿dym pomy¶lnym montowaniu.
.TP
.BI prefix= napis
Przedrostek u¿ywany przed nazw± wolumenu, przy pod±¿aniu za dowi±zaniem.
.TP
.BI volume= napis
Przedrostek (d³ugo¶ci najwy¿ej 30), u¿ywany przed '/' przy pod±¿aniu
za dowi±zaniem symbolicznym.
.TP
.BI reserved= warto¶æ
(Domy¶lnie: 2.) Ilo¶æ nieu¿ytkowanych bloków na pocz±tku urz±dzenia.
.TP
.BI root= warto¶æ
Podaje jawnie lokalizacjê bloku korzenia (root block).
.TP
.BI bs= warto¶æ
Podaje rozmiar bloku. Dozwolone warto¶ci to 512, 1024, 2048, 4096.
.TP
.BR grpquota " / " noquota " / " quota " / " usrquota
Opcje te s± przyjmowane, lecz s± ignorowane.
(Jednak¿e narzêdzia przydzia³ów dyskowych (quota) mog± reagowaæ na takie
³añcuchy w
.IR /etc/fstab .)

.SH "Opcje montowania dla coherent"
Brak.

.SH "Opcje montowania dla devpts"
devpts jest pseudo-systemem plików, tradycyjnie montowanym w
.IR /dev/pts .
W celu uzyskania pseudo-terminala, proces otwiera
.IR /dev/ptmx .
Jest mu wówczas udostêpniany numer pseudo-terminala; podporz±dkowany
pseudo-terminal jest dostêpny jako
.IR /dev/pts/ <numer>.
.TP
\fBuid=\fP\fIwarto¶æ\fP i \fBgid=\fP\fIwarto¶æ\fP
Ustawia w³a¶ciciela lub grupê nowotworzonych PTY wed³ug zadanych warto¶ci.
Je¶li nie podano ¿adnych, to zostan± nadane UID i GID procesu tworz±cego.
Na przyk³ad, je¶li mamy grupê tty o GID=5, to
.B gid=5
spowoduje, ¿e nowotworzone PTY bêda nale¿eæ do grupy tty.
.TP
.BI mode= warto¶æ
Nadaje trybowi nowotworzonych PTY zadan± warto¶æ. Domy¶lnie jest to 0600.
Warto¶æ
.B mode=620
i 
.B gid=5
powoduje, ¿e dla nowoutworzonych PTY bêdzie domy¶lnie "mesg y".

.SH "Opcje montowania dla ext"
Brak.
Zauwa¿, ¿e system plików `ext' jest przedawniony. Nie u¿ywaj go.
Od Linuksa wersji 2.1.21 kod ¼ród³owy j±dra nie zawiera ju¿ extfs.

.SH "Opcje montowania dla ext2"
System plików `ext2' jest standardowym systemem plików Linuksa. Z powodu
b³êdu j±dra, mo¿e byæ montowany z dowolnymi opcjami montowania
(poprawiono w Linuksie 2.0.4).
.TP
.BR bsddf " / " minixdf
Ustala zachowanie dla funkcji systemowej
.IR statfs .
Zachowanie
.B minixdf
to zwracanie w polu
.I f_blocks
ca³kowitej ilo¶æ bloków systemu plików, podczas gdy zachowaniem
.B bsddf
(które jest domy¶lne) jest odejmowanie nadmiarowych bloków u¿ywanych przez
ext2 i niedostêpnych dla przechowywania plików. Tak wiêc
.RE
.nf

% mount /k -o minixdf; df /k; umount /k
Filesystem   1024-blocks  Used Available Capacity Mounted on
/dev/sda6      2630655   86954  2412169      3%   /k
% mount /k -o bsddf; df /k; umount /k
Filesystem   1024-blocks  Used Available Capacity Mounted on
/dev/sda6      2543714      13  2412169      0%   /k

.fi
(Zauwa¿, ¿e ten przyk³ad pokazuje, ¿e mo¿na dodaæ opcje wiersza poleceñ do
opcji podanych w
.IR /etc/fstab .)

.TP
.BR check " / " check=normal " / " check=strict
Ustawia poziom sprawdzania. Gdy ustawiona jest przynajmniej jedna z tych opcji (a
.B check=normal
jest ustawiane domy¶lnie), podczas montowania sprawdzane s± i-wêz³y i bitmapy
bloków (co na du¿ym dysku mo¿e zabraæ pó³ minuty lub co¶ ko³o tego i jest
raczej nieprzydatne). Przy dok³adnym (strict) sprawdzaniu, dealokacja bloków
sprawdza, czy blok do zwolnienia le¿y w strefie danych.
.TP
.BR check=none " / " nocheck
Bez sprawdzania. Tak jest szybko. Najnowsze j±dra nie maj± ju¿ opcji
sprawdzania - bardziej sensowna jest kontrola za pomoc±
.BR e2fsck (8).
ma wiêcej sensu.
.TP
.B debug
Wypisuje informacje diagnostyczne przy ka¿dym (re)montowaniu.
.TP
.BR errors=continue " / " errors=remount-ro " / " errors=panic
Definiuje zachowanie przy napotkaniu b³êdu.
(Albo ignoruje b³êdy, zaznaczaj±c tylko system plików jako b³êdny i kontynuuj±c,
albo ponownie montuje system plików na tylko do odczytu, albo panikuje
i zatrzymuje system.) Domy¶lne ustawienie jest wpisane w superbloku systemu
plików i mo¿e byæ zmienione za pomoc±
.BR tune2fs (8).
.TP
.BR grpid " lub " bsdgroups " / " nogrpid " lub " sysvgroups
Opcje te definiuj±, jaki identyfikator grupy (gid) otrzyma nowo utworzony
plik. Gdy ustawiony jest
.BR grpid ,
to pobiera gid katalogu, w którym jest utworzony; w przeciwnym wypadku
(domy¶lnie) bierze fsgid bie¿±cego procesu, chyba ¿e katalog ma ustawiony
bit setgid, wówczas pobiera gid katalogu rodzicielskiego i
dodatkowo otrzymuje bit setgid, je¶li sam jest katalogiem.
.TP
\fBresgid=\fP\fIn\fP i \fBresuid=\fP\fIn\fP
System plików ext2 rezerwuje pewn± ilo¶æ wolnego miejsca (domy¶lnie 5%,
zobacz
.BR mke2fs (8)
i
.BR tune2fs (8)).
Opcje te okre¶laj±, kto mo¿e u¿ywaæ zarezerwowanych bloków.
(Ogólnie: ka¿dy, kto ma podany uid lub nale¿y do podanej grupy.)
.TP
.BI sb= n
Zamiast bloku 1, jako superbloku u¿ywa bloku
.IR n .
Mo¿e to byæ przydatne, gdy system plików zosta³ uszkodzony. Zazwyczaj kopie
superbloku znajduj± siê co 8192 bloków: w bloku 1, 8193, 16385, ...
(Dlatego na du¿ym systemie plików istniej± setki, lub nawet tysi±ce kopii
superbloku. Od wersji 1.08,
.B mke2fs
ma opcjê \-s (sparse superblock), redukuj±c± liczbê zapasowych superbloków, 
a od wersji 1.15 jest ona domy¶lna. Zauwa¿, ¿e mo¿e to oznaczaæ, ¿e systemy
plików typu ext2 stworzone przez nowe
.B mke2fs
nie mog± byæ montowane do zapisu pod Linuksem 2.0.*.)
.TP
.BR grpquota " / " noquota " / " quota " / " usrquota
Opcje te s± przyjmowane, lecz ignorowane.

.SH "Opcje montowania dla fat"
(Uwaga:
.I fat
nie jest odrêbnym rodzajem systemu plików, ale wspóln± czê¶ci± systemów
plików
.IR msdos ,
.I umsdos
i
.IR vfat .)
.TP
.BR blocksize=512 " / " blocksize=1024 " / " blocksize=2048
Ustawia rozmiar bloku (domy¶lnie 512).
.TP
\fBuid=\fP\fIwarto¶æ\fP i \fBgid=\fP\fIwarto¶æ\fP
Ustawia w³a¶ciciela i grupê wszystkich plików (domy¶lnie: uid i gid bie¿±cego
procesu).
.TP
.BI umask= warto¶æ
Ustawia umask (maskê bitow± praw, które 
.B nie
wystêpuj±). Domy¶lnie przyjmuje siê warto¶æ umask bie¿±cego procesu.
Warto¶æ jest podawana ósemkowo.
.TP
.BI check= warto¶æ 
Mo¿na wybraæ trzy stopnie:
.RS
.TP
.B r[elaxed]
Akceptowane i równowa¿ne sobie s± zarówno wielkie, jak i ma³e litery.
Czê¶ci d³ugich nazw s± obcinane (np.
.I verylongname.foobar
staje siê
.IR verylong.foo ),
pocz±tkowe i wtr±cone spacje s± akceptowane jako czê¶æ nazwy (nazwa i
rozszerzenie).
.TP
.B n[ormal]
Podobnie jak "relaxed", lecz wiele znaków specjalnych (jak *, ?, <, spacje,
itp.) jest odrzucane. Tak jest domy¶lnie.
.TP
.B s[trict]
Jak "normal", lecz nazwy nie mog± zawieraæ d³ugich czê¶ci i znaków
specjalnych, które czasem s± u¿ywane pod Linuksem, lecz nie s± akceptowane
przez MS-DOS (+, =, spacje itp.)
.RE
.TP
.BI codepage= warto¶æ
Ustawia stronê kodow± do konwersji znaków krótkiej nazwy w systemach
plików FAT i VFAT. Domy¶lnie stosowana jest strona kodowa 437.
.TP
.BR conv=b[inary] " / " conv=t[ext] " / " conv=a[uto]
System plików
.I fat
mo¿e dokonywaæ konwersji CRLF-NL (format tekstowy MS-DOS na format tekstowy
UNIX) w j±drze. Dostêpne s± nastêpuj±ce tryby konwersji:
.RS
.TP
.B binary
brak konwersji. Domy¶lne.
.TP
.B text
Konwersja CRLF<-->NL wykonywana dla wszystkich plików.
.TP
.B auto
Konwersja CRLF<-->NL dla wszystkich plików, które nie maj± "ogólnie znanego
rozszerzenia binarnego". Listê znanych rozszerzeñ mo¿na znale¼æ na pocz±tku
.I fs/fat/misc.c
(w wersji 2.0, na li¶cie jest: exe, com, bin, app, sys, drv, ovl, ovr, obj,
lib, dll, pif, arc, zip, lha, lzh, zoo, tar, z, arj, tz, taz, tzp, tpz,
gz, tgz, deb, gif, bmp, tif, gl, jpg, pcx, tfm, vf, gf, pk, pxl, dvi).
.PP
Programy, które dokonuj± obliczonych lseek-ów, nie bêd± zadowolone z
konwersji. Niektórzy ludzie utracili dane przez tê translacjê. Strze¿cie
siê!

Dla systemów zamontowanych w trybie binarnym, dostêpne s± narzêdzia
konwersji (fromdos/todos).
.RE
.TP
.BI cvf_format= modu³
Wymusza na sterowniku stosowanie modu³u CVF (Compressed Volume File)
.RI cvf_ modu³
zamiast automatycznego wykrywania. Je¿eli j±dro obs³uguje kmod, to opcja
cvf_format=xxx steruje tak¿e ³adowaniem na ¿±danie modu³u CVF.
.TP
.BI cvf_option= opcja
Opcja przekazywana do modu³u CVF.
.TP
.B debug
W³±cza flagê
.IR debug .
Wypisana zostanie wersja i lista parametrów systemu plików (te
dane wypisywane s± te¿ je¶li parametry s± niespójne).
.TP
.BR fat=12 " / " fat=16
Okre¶la fat 12-, 16- lub 32-bitowy. To przes³ania procedurê
automatycznego wykrywania typu FAT. U¿ywaj ostro¿nie!
.TP
.BI iocharset= warto¶æ
Zestaw znaków u¿ywany do konwersji miêdzy znakami 8-bitowymi a 16-bitowymi
znakami Unikodu. Domy¶lnym jest iso8859-1. D³ugie nazwy plików s±
przechowywane na dysku w formacie Unicode.
.TP
.B quiet
W³±cza flagê
.I quiet
(cicho). Próby chown lub chmod nie zwracaj± b³êdów, chocia¿ siê nie udaj±.
U¿ywaj ostro¿nie!
.TP
.B "sys_immutable, showexec, dots, nodots, dotsOK=[yes|no]"
Ró¿ne bezmy¶lne próby wymuszenia konwencji Uniksa lub DOS-u na systemie
plików FAT.

.SH "Opcje montowania dla hpfs"
.TP
\fBuid=\fP\fIwarto¶æ\fP i \fBgid=\fP\fIwarto¶æ\fP
Ustawia w³a¶ciciela i grupê wszystkich plików (domy¶lnie: uid i gid bie¿±cego
procesu).
.TP
.BI umask= warto¶æ
Ustawia umask (maskê bitow± praw, które 
.B nie
wystêpuj±). Domy¶lnie u¿ywany jest umask bie¿±cego procesu.
Warto¶æ podawana jest ósemkowo.
.TP
.BR case=lower " / " case=asis
Konwertuje wszystkie nazwy plików na ma³e litery, lub pozostawia bez zmian.
(Domy¶lnie:
.BR case=lower .)
.TP
.BR conv=binary " / " conv=text " / " conv=auto
Dla
.BR conv=text ,
usuwa losowe znaki CR (konkretnie wszystkie, po których wystêpuje NL) podczas
odczytu pliku.
Dla
.BR conv=auto ,
wybiera mniej lub bardziej losowo miêdzy
.BR conv=binary " i " conv=text .
Dla
.BR conv=binary ,
po prostu czyta to, co jest w pliku. Tak jest domy¶lnie.
.TP
.B nocheck
Nie przerywa montowania gdy zawiod± pewne kontrole spójno¶ci.

.SH "Opcje montowania dla iso9660"
Normalne nazwy plików
.I iso9660
pojawiaj± siê w formacie 8.3 (tzn. wystêpuj± DOS-owe ograniczenia d³ugo¶ci
nazw plików), a w dodatku wszystkie znaki pisane s± wielkimi literami.
Poza tym nie ma pola w³a¶ciciela, ochrony, liczby dowi±zañ, zastrze¿eñ
dla urz±dzeñ znakowych/blokowych, itd.

Rozszerzeniem iso9660 jest Rock Ridge, który udostêpnia wszystkie te
uniksopodobne w³a¶ciwo¶ci. Najpro¶ciej mówi±c, dla ka¿dego wpisu katalogowego
istniej± w nim rozszerzenia, które uzupe³niaj± wszystkie informacje.
Gdy u¿ywane jest Rock Ridge, system plików jest nieodró¿nialny od normalnego
uniksowego systemu plików (poza tym, ¿e jest tylko do odczytu, oczywi¶cie).
.TP
.B norock
Wy³±cza korzystanie z rozszerzeñ Rock Ridge, nawet je¶li s± dostêpne. Zob.\&
.BR map .
.TP
.B nojoliet
Wy³±cza korzystanie z rozszerzeñ Joliet firmy Microsoft, nawet je¶li s±
dostêpne. Zob.\&
.BR map .
.TP
.BR check=r[elaxed] " / " check=s[trict]
Z
.BR check=relaxed ,
nazwa pliku przed dokonywaniem podgl±du jest najpierw przekszta³cana na
ma³e litery. Prawdopodobnie ma to znaczenie tylko razem z
.B norock
i
.BR map=normal .
(Domy¶lnie:
.BR check=strict .)
.TP
\fBuid=\fP\fIwarto¶æ\fP i \fBgid=\fP\fIwarto¶æ\fP
Nadaje wszystkim plikom systemu plików wskazany identyfikator u¿ytkownika
i grupy, byæ mo¿e przes³aniaj±c informacje znalezione w rozszerzeniach
Rock Ridge.
(Domy¶lnie:
.BR uid=0,gid=0 .)
.TP
.BR map=n[ormal] " / " map=o[ff] " / " map=a[corn]
Dla wolumenów typu innego ni¿ Rock Ridge, normalna translacja nazwy
odwzorowuje wielkie litery ASCII na ma³e, porzuca koñcz±ce `;1'
i zamienia `;' na `.'.
Z
.B map=off
nie jest dokonywana konwersja nazw. Zobacz
.BR norock .
(Domy¶lnie:
.BR map=normal .)
.B map=acorn
jest podobne do
.BR map=normal ,
ale stosuje tak¿e rozszerzenia Acorn je¶li wystêpuj±.
.TP
.BI mode= warto¶æ
Dla wolumenów typu innego ni¿ Rock Ridge, nadaje wszystkim plikom
wskazane prawa. (Domy¶lnie: prawa dla odczytu dla wszystkich.)
Od Linuksa 2.1.37 nie trzeba ju¿ podawaæ trybu dziesiêtnie - ósemkowy jest
wskazywany przez 0 na pocz±tku.
.TP
.B unhide
Pokazuje równie¿ pliki ukryte i zwi±zane.
.TP
.B block=[512|1024|2048]
Ustawia rozmiar bloku we wskazanym wolumenie.
(Domy¶lnie:
.BR block=1024 .)
.TP
.BR conv=a[uto] " / " conv=b[inary] " / " conv=m[text] " / " conv=t[ext]
(Domy¶lnie:
.BR conv=binary .)
Od Linuksa 1.3.54 opcja ta ju¿ nie dzia³a. (A niebinarne ustawienia bywa³y
bardzo niebezpieczne, czêsto prowadzi³y do milcz±cego niszczenia danych).
.TP
.B cruft
Je¶li starszy bajt d³ugo¶ci pliku zawiera inne ¶mieci, warto ustawiæ tê opcjê
montowania, aby by³ ignorowany. Powoduje to, ¿e maksymalny rozmiar pliku
nie mo¿e byæ wiêkszy ni¿ 16MB. Opcja `cruft' jest ustawiana automatycznie
je¶li ca³y CDROM ma dziwny rozmiar (ujemny lub wiêkszy ni¿ 800 MB). Jest te¿
ustawiana, gdy numery sekwencyjne wolumenu s± inne ni¿ 0 lub 1.
.TP
.B session=x
Wybiera numer sesji na CD wielosesyjnych. (Od 2.3.4.)
.TP
.B sbsector=xxx
Sesja zaczyna siê od sektora xxx. (Od 2.3.4.)

.SH "Opcje montowania dla miniksa"
Brak.

.SH "Opcje montowania dla msdos"
Zobacz opcje dla FAT.
Je¶li system plików
.I msdos
wykryje niespójno¶æ, zg³asza b³±d i ustawia system plików na tylko dla
odczytu. System plików mo¿e byæ znowu dostêpny do zapisu przez ponowne
zamontowanie.

.SH "Opcje montowania dla ncp"
Takie jak dla
.IR nfs ", implementacja " ncp
oczekuje binarnego argumentu
.RI ( "struct ncp_mount_data" )
funkcji systemowej mount. Argument ten jest konstruowany przez
.BR ncpmount (8),
a bie¿±ca wersja
.B mount
(2.6h) nic nie wie o ncp.

.SH "Opcje montowania dla nfs"
Zamiast tekstowych napisów opcji, przetwarzanych przez j±dro, system plików
.I nfs
oczekuje binarnych argumentów typu
.IR "struct nfs_mount_data" .
Program
.B mount
sam z siebie przetwarza nastêpuj±ce opcje (postaci `cecha=warto¶æ') i wstawia
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
Rozpoznawane s± równie¿ nastêpuj±ce opcje logiczne, które mog± byæ
poprzedzane s³owem
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
Szczegó³y znajdziesz w
.BR nfs (5).

Szczególnie u¿yteczne opcje obejmuj±
.TP
.B rsize=8192,wsize=8192
Uczyni to po³±czenie nfs du¿o szybszym ni¿ z domy¶lnym buforem wielko¶ci 1024.
(NFSv2 nie dzia³a z wiêkszymi warto¶ciami
.B rsize
i
.BR wsize .)
.TP
.B hard
Program siêgaj±cy do pliku na zamontowanym systemie plików NFS zawiesi siê,
gdy serwer padnie. Procesu takiego nie da siê przerwaæ ani zabiæ, chyba ¿e
podano równie¿
.BR intr .
Gdy serwer NFS stanie siê znowu aktywny, program bêdzie kontynuowa³
bez przeszkód od miejsca, w którym by³. Prawdopodobnie tego w³a¶nie chcesz.
.TP
.B soft
Opcja ta pozwala j±dru na koñczenie prób po up³yniêciu zadanego limitu czasu
(timeout) je¶li serwer nfs nie odpowiada przez jaki¶ czas.
Czas podaje siê za pomoc±
.BR timeo=time .
Opcja ta jest u¿yteczna je¶li serwer nfs czasem nie odpowiada lub jest
w trakcie ponownego uruchamiania w momencie gdy jaki¶ proces próbuje
uzyskaæ le¿±cy na nim plik.
Zwykle po prostu powoduje mnóstwo k³opotów.
.TP
.B nolock
Nie stosuje blokowania. Nie uruchamia procesu
.BR lockd (8).

.SH "Opcje montowania dla ntfs"
.TP
.BI iocharset= nazwa
Zestaw znaków stosowany przy zwracaniu nazw plików.
W przeciwieñstwie do VFAT, NTFS eliminuje nazwy zawieraj±ce znaki nie daj±ce
siê przekszta³ciæ.
.TP
.BR utf8
Do konwersji nazw plików stosuje UTF-8.
.TP
.B uni_xlate=[0|1|2]
Dla 0 (lub `no', albo `false') lub 1 (lub `yes', albo `true'):
dla nazw plików spoza bie¿±cego zestawu znaków u¿ywa kodowania w stylu VFAT.
Warto¶æ 2 wy³±cza kodowanie za pomoc± ":".
.TP
.B posix=[0|1]
je¶li jest w³±czone (posix=1), to system plików rozró¿nia wielkie i ma³e
litery. Nazwy zastêpcze 8.3 s± przedstawiane jako dowi±zania twarde, a nie
pomijane.
.TP
\fBuid=\fP\fIwarto¶æ\fP, \fBgid=\fP\fIwarto¶æ\fP i \fBumask=\fP\fIwarto¶æ\fP
Ustawia prawa plików dla danego systemu. Domy¶lnie ich w³a¶cicielem jest root
i nikt inny nie mo¿e ich czytaæ.

.SH "Opcje montowania dla systemu proc"
.TP
\fBuid=\fP\fIwarto¶æ\fP i \fBgid=\fP\fIwarto¶æ\fP
Opcje te s± rozpoznawane, lecz, o ile wiem, nie maj± ¿adnego efektu.

.SH "Opcje montowania dla romfs"
Brak.

.SH "Opcje montowania dla systemu smb"
Tak jak
.IR nfs ", implementacja " smb
oczekuje binarnego argumentu
.RI ( "struct smb_mount_data" )
do funkcji systemowej mount. Argument ten jest konstruowany przez
.BR smbmount (8)
a bie¿±ca wersja
.B mount
(2.9w) nie wie nic o smb.

.SH "Opcje montowania dla sysv"
Brak.

.SH "Opcje montowania dla udf"
.TP
.B gid=
Ustawia domy¶ln± grupê.
.TP
.B umask=
Ustawia domy¶lne umask.
.TP
.B uid=
Ustawia domy¶lnego u¿ytkownika.
.TP
.B unhide
Pokazuje pliki, które inaczej by³yby ukryte.
.TP
.B undelete
Pokazuje na listach pliku usuniête.
.TP
.B strict
Ustawia ¶cis³± zgodno¶æ (nieu¿ywane).
.TP
.B utf8
(nieu¿ywane).
.TP
.B iocharset
(nieu¿ywane).
.TP
.B bs=
Ustawia rozmiar bloku. (Mo¿e nie dzia³aæ, chyba ¿e 2048.)
.TP
.B novrs
Pomija rozpoznawanie numeru sekwencyjnego wolumenu.
.\" Skip volume sequence recognition.
.TP
.B session=
Ustawia sesjê CD-ROM licz±c od 0. Domy¶lnie: ostatnia sesja.
.TP
.B anchor=
Przes³ania po³o¿enie standardowego zakotwiczenia (anchor). Domy¶lnie: 256.
.TP
.B volume=
Przes³ania po³o¿enie VolumeDesc. (nieu¿ywane)
.TP
.B partition=
Przes³ania po³o¿enie PartitionDesc. (nieu¿ywane)
.TP
.B lastblock=
Ustawia ostatni blok systemu plików.
.TP
.B fileset=
Przes³ania po³o¿enie bloku zestawu plików (fileset block). (nieu¿ywane)
.TP
.B rootdir=
Przes³ania po³o¿enie katalogu g³ównego). (nieu¿ywane)

.SH "Opcje montowania dla ufs"
.TP
.BI ufstype= warto¶æ
UFS jest systemem plików szeroko wykorzystywanym w ró¿nych systemach
operacyjnych. Problem stanowi± róznice pomiêdzy implementacjami.
Cechy niektórych z nich s± nieudokumentowane, tak wiêc trudno rozpoznaæ
automatycznie typ ufs.
Z tego powodu u¿ytkownik musi okre¶liæ typ ufs za pomoca opcji montowania.
Mo¿liwe warto¶ci to:
.RS
.TP
.B old
Stary format ufs, jest to typ domy¶lny, tylko do odczytu.
.TP
.B 44bsd
Dla systemów plików utworzonych przez system typu BSD (NetBSD,FreeBSD,OpenBSD).
.TP
.B sun
Dla systemów plików utworzonych przez SunOS lub Solaris na komputarze Sparc.
.TP
.B sunx86
Dla systemów plików utworzonych przez Solaris na x86.
.TP
.B nextstep
Dla systemów plików utworzonych przez NeXTStep (na stacji roboczej NeXT)
(obecnie tylko do odczytu).
.TP
.B nextstep-cd
Dla CD-ROM-ów NextStep (block_size == 2048), tylko do odczytu.
.TP
.B openstep
Dla systemów plików utworzonych przez OpenStep (obecnie tylko do odczytu).
.RE
.TP
.BI onerror= warto¶æ
Ustala zachowanie w przypadku b³êdu:
.RS
.TP
.B panic
Je¶li napotkano b³±d, powoduje panikê j±dra.
.TP
.B [lock|umount|repair]
Te opcje montowania teraz nic nie robi±: po napotkaniu b³êdu wypisuj± tylko
komunikat na knsoli.
.RE

.SH "Opcje montowania dla umsdos"
Zobacz opcje dla msdos.
Opcja
.B dotsOK
jest jawnie ubijana przez
.IR umsdos .

.SH "Opcje montowania dla vfat"
Przede wszystkim, rozpoznawane s± wszystkie opcje dla
.IR fat .
Opcja
.B dotsOK
jest jawnie ubijana przez
.IR vfat .
Pnadto istniej±
.TP
.B uni_xlate
T³umaczy nieobs³ugiwane znaki Unicode na specjalne sekwencje unikowe.
To umo¿liwia ci wykonywanie kopii zapasowych i odtwarzanie plików o nazwach,
utworzonych ze znakami Unicode. Bez tej opcji, w wypadku braku mo¿liwo¶ci
konwersji u¿ywane jest '?'. Znakiem unikowym jest ':', poniewa¿ na systemie
vfat jest w innych wypadkach niedozwolony. Sekwencja specjalna, która by³aby
u¿yta dla znaku u, gdzie u jest znakiem unicodu to: ':', (u & 0x3f),
((u>>6) & 0x3f), (u>>12).
.TP
.B posix
Pozwala, by dwa pliki mia³y nazwy ró¿ni±ce siê tylko wielko¶ci± liter.
.TP
.B nonumtail
Zanim zacznie próbowaæ
.IR nazwa~nr.roz
najpierw próbuje zrobiæ krótk± nazwê bez numeru kolejnego.
.TP
.B utf8
UTF8 jest systemem plików bezpiecznego 8-bitowego kodowania Unicodu, który
jest wykorzystywany przez konsolê. T± opcj± mo¿na go w³±czyæ dla danego
systemu plików. Je¶li zostanie ustawione `uni_xlate', UTF8 jest wy³±czane.

.SH "Opcje montowania dla xenixa"
Brak.

.SH "Opcje montowania dla xfs"
.TP
.BI biosize= rozmiar
Ustawia preferowany rozmiar buforowanego wej¶cia/wyj¶cia (domy¶lnie 64K).
.I rozmiar
musi byæ wyra¿ony jako logarytm (o podstawie 2) po¿±danego rozmiaru I/O.
Poprawnymi warto¶ciami tej opcji s± 14 do 16, w³±cznie
(tzn. 16K, 32K i 64K bajtów).
Na komputerach z 4K rozmiarem strony, 13 (8K bajtów) jest równie¿ poprawnym
.IR rozmiarem .
Preferowany rozmiar buforowanego I/O mo¿na te¿ zmieniaæ dla poszczególnych
plików, korzystaj±c z funkcji systemowej
.BR ioctl (2).
.TP
.B dmapi " / " xdsm
W³±cza wyró¿nione zdarzenia DMAPI (Data Management API).
.\" event callouts.
.TP
.BI logbufs= warto¶æ
Ustala liczbê buforów pamiêciowych dziennika (in-memory log buffers).
Poprawne s± liczby z zakresu 2-8, w³±cznie.
Domy¶lna warto¶æ to 8 buforów dla systemów plików z blokiem o rozmiarze 64K,
4 bufory dla systemów o bloku 32K, 3 bufory dla systemów o bloku 16K,
i 2 bufory dla wszystkich innych konfiguracji.
Zwiêkszanie liczby buforów mo¿e poprawiæ wydajno¶æ przy niektórych
obci±¿eniach roboczych kosztem pamiêci wykorzystywanej na dodatkowe bufory
i zwi±zane z nimi struktury steruj±ce.
.TP
.BI logbsize= warto¶æ
Ustawia wielko¶æ ka¿dego z buforów pamiêciowych dziennika (in-memory
log buffers).
Poprawne warto¶ci to 16384 (16K) i 32768 (32K).
Domy¶lna warto¶æ dla komputerów o wiêcej ni¿ 32MB pamiêci to 32768,
komputery o mniejszej pamiêci stosuj± domy¶lnie 16384.
.TP
\fBlogdev=\fP\fIurz±dzenie\fP i \fBrtdev=\fP\fIurz±dzenie\fP
U¿ywa zewnêtrznego dziennika (rejestru metadanych) i/lub urz±dzenia czasu
rzeczywistego. System plików XFS ma do trzech czê¶ci: sekcji danych, sekcji
dziennika i sekcji czasu rzeczywistego. Sekcja czasu rzeczywistego jest
opcjonalna, a sekcja dziennika mo¿e byc osobna od sekcji danych albo mo¿e
byæ w niej zawarta.
Bli¿sze informacje podaje
.BR xfs (5).
.TP
.B noalign
Alokacja danych nie bêdzie wyrównywana na granicach jednostki paskowej
(stripe unit).
.TP
.B noatime
Podczas odczytu pliku nie s± aktualizowane znaczniki czasu dostêpu.
.TP
.B norecovery
System plików zostanie zamontowany bez uruchamiania odzyskiwania dziennika.
Je¶li system ten nie by³ poprawnie odmontowany, to mo¿liwe, ¿e montowany
w trybie
.B norecovery
bêdzie niespójny.
Czê¶æ plików lub katalogów mo¿e z tego powodu byæ niedostêpna.
Systemy plików przy w³±czeniu trybu
.B norecovery
musz± byæ montowane tylko do odczytu albo montowanie siê nie powiedzie.
.TP
.B osyncisdsync
Powoduje, ¿e zapisy do plików otwartych z ustawion± flag± O_SYNC bêd± siê
zachowywaæ jakby zamiast niej u¿yto flagi O_DSYNC. Mo¿e to daæ lepsz±
wydajno¶æ bez naruszenia bezpieczeñstwa danych. Jednak¿e, je¶li dzia³a
ta opcja, to w przypadku za³amania siê systemu mog± zostaæ utracone
aktualizacje znaczników czasu z O_SYNC.
.TP
.BR quota " / " usrquota " / " uqnoenforce
W³±czenie systemu rozliczania udzia³ów dyskowych (quota) u¿ytkowników
i wymuszenie (opcjonalnie) limitów.
.TP
.BR grpquota " / " gqnoenforce
W³±czenie systemu rozliczania udzia³ów dyskowych (quota) grup
i wymuszenie (opcjonalnie) limitów.
.TP
\fBsunit=\fP\fIwarto¶æ\fP i \fBswidth=\fP\fIwarto¶æ\fP
Stosowane do okre¶lenia jednostki i szeroko¶ci paska dla urz±dzenia RAID
lub wolumenu paskowego.
.I Warto¶æ
musi byæ podana jako liczba 512-bajtowych bloków.
Je¶li nie podano tej opcji, a system plików zosta³ utworzony na wolumenie
paskowym lub podczas korzystania z mkfs podano szeroko¶æ albo jednostkê
paska dla urz±dzenia RAID, to funkcja systemowa mount odtworzy tê warto¶æ
z superbloku.
Dla systemów plików utworzonych bezpo¶rednio na urz±dzeniach RAID, opcji
tych mo¿na u¿yæ do przes³oniêcia informacji z superbloku je¶li po stworzeniu
systemu zmieni³ siê odno¶ny uk³ad dysku.
Je¶li podano 
.BR sunit ,
to opcja
.B swidth
jest wymagana
i musi byæ wielokrotno¶ci± warto¶ci
.BR sunit .

.SH "Opcje montowania dla xiafs"
Brak. Chocia¿ xiafs nic nie dolega, nie jest on u¿ywany zbyt czêsto
i nie jest rozwijany. Prawdopodobnie nie powinno siê go u¿ywaæ.
Od Linuksa wersji 2.1.21 xiafs nie wystêpuje ju¿ w kodzie ¼ród³owym j±dra.

.SH "URZ¡DZENIE LOOP"
Kolejnym mo¿liwym typem jest montowanie poprzez urz±dzenie loop. Na przyk³ad,
polecenie

.nf
.B "  mount /tmp/fdimage /mnt -t msdos -o loop=/dev/loop3,blocksize=1024"
.fi

skonfiguruje urz±dzenie loop
.I /dev/loop3
tak, by odpowiada³o plikowi
.IR /tmp/fdimage ,
i zamontuje je w
.IR /mnt .
Ten typ montowania zna trzy opcje, konkretnie
.BR loop ", " offset " i " encryption ,
które s± w rzeczywisto¶ci opcjami dla
.BR losetup (8).
Je¶li nie podano jawnie urz±dzenia loop
(lecz tylko opcjê `\fB\-o loop\fP'), to
.B mount
spróbuje znale¼æ jakie¶ nieu¿ywane urz±dzenie loop i u¿yæ go.
Je¶li nie jest siê tak niem±drym, by zrobiæ 
.I /etc/mtab
dowi±zaniem symbolicznym do
.IR /proc/mounts ,
to ka¿de urz±dzenie loop przydzielone przez
.B mount
zostanie zwolnione przez
.BR umount .
Mo¿na te¿ zwalniaæ urz±dzenie loop rêcznie, stosuj±c `losetup -d' -- zobacz
.BR losetup (8).

.SH PLIKI
.I /etc/fstab
tabela systemów plików
.br
.I /etc/mtab
tabela zamontowanych systemów plików
.br
.I /etc/mtab~
plik blokuj±cy
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
.BR xfs (5),
.BR e2label (8),
.BR xfs_admin (8),
.BR mountd (8),
.BR nfsd (8),
.BR mke2fs (8),
.BR tune2fs (8),
.BR losetup (8)
.SH B£ÊDY
Jest mo¿liwe, ¿e uszkodzony system plików spowoduje za³amanie systemu.
.PP
Niektóre linuksowe systemy plików nie obs³uguj±
.B "\-o sync"
(ext2fs
.I wykonuje
synchroniczne od¶wie¿ania (updates) (a la BSD) gdy zostanie zamontowany
z opcj±
.BR sync ).
.PP
Opcja
.B "\-o remount"
mo¿e nie byæ w stanie zmieniæ parametrów montowania (np. wszystkie parametry
.IR ext2fs ,
poza
.BR sb ,
daj± siê zmieniaæ przy ponownym montowaniu, lecz nie mo¿na zmieniæ
.B gid
czy
.B umask
dla
.IR fatfs ).
.SH HISTORIA
Polecenie
.B mount
pojawi³o siê w wersji 5 AT&T UNIX.
