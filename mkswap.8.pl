.\" 2000 PTM Przemek Borys <pborys@dione.ids.pl>
.\" Copyright 1998 Andries E. Brouwer (aeb@cwi.nl)
.\"
.\" May be distributed under the GNU General Public License
.\" Rewritten for 2.1.117, aeb, 981010.
.\"
.TH MKSWAP 8 "25 marca 1999" "Linux 2.2.4" "Podrêcznik programisty linuksowego"
.SH NAZWA
mkswap \- skonfiguruj linuksowy obszar wymiany
.SH SK£ADNIA
.BI "mkswap [\-c] [\-v" N "] [\-f] [\-p " PSZ "] "urz±dzenie  " [" rozmiar "]"
.SH OPIS
.B mkswap
konfiguruje linuksowy obszar wymiany na urz±dzeniu lub w pliku.

(Po utworzeniu obszaru wymiany musisz u¿yæ polecenia
.B swapon
by go aktywowaæ. Zwykle obszary wymiany s± wymieniane w
.IR /etc/fstab ,
wiêc mog± byæ w³±czane do u¿ytku podczas startu systemu poleceniem
.B swapon -a
w skrypcie startowym.)

Argument
.I urz±dzenie
zwykle jest partycj± dyskow± (co¶ w rodzaju
.I /dev/hda4
lub
.IR /dev/sdb7 )
lecz mo¿e byæ równie¿ plikiem.
J±dro Linuksa nie zwa¿a na identyfikatory partycji, lecz wiele skryptów
instalacyjnych zak³ada, ¿e partycje typu 82 (szesnastkowo -- LINUX_SWAP) s±
partycjami wymiany. (Uwaga: Solaris równie¿ u¿ywa tego typu. Uwa¿aj by nie
zabiæ swoich partycji solarisowych.)

Parametr
.I rozmiar
jest niepotrzebny, lecz zachowany dla zgodno¶ci wstecznej. (Okre¶la on
potrzebny rozmiar obszaru wymiany w 1024 blokach.
.B mkswap
w przypadku pominiêcia tego parametru u¿ywa ca³ej partycji lub ca³ego pliku.
Podawanie tego parametru jest niem±dre -- literówka mo¿e zniszczyæ dysk.)

Parametr
.I PSZ
okre¶la rozmiar u¿ywanej strony. Podawanie go jest prawie zawsze
niepotrzebne (nawet niem±dre), lecz niektóre stare wersje libc k³ami± o
rozmiarze strony, wiêc 
.B mkswap
mo¿e siê pomyliæ. Symptomem jest to, ¿e kolejne
.B swapon
nie powodz± siê, gdy¿ nie znajduj± sygnatury wymiany. Typowymi warto¶ciami
.I PSZ
s± 4096 lub 8192.

Linux zna przynajmniej dwa rodzaje obszarów wymiany: stary i nowy. Ostatnie
10 bajtów pierwszej strony obszaru wymiany s³u¿± do rozró¿nienia: stary ma w
sygnaturze `SWAP_SPACE', nowy `SWAPSPACE2'.

W starym rodzaju dalszym ci±giem pierwszej strony by³a mapa bitowa, z jednym
bitem na ka¿d± u¿ywaln± stronê obszaru wymiany. Poniewa¿ pierwsza strona
przechowuje mapê bitow±, pierwszy bit jest zerowy. Ponadto ostatnie 10
bajtów przechowuje sygnaturê. Je¶li wiêc rozmiar strony wynosi S, to obszar
wymiany starego rodzaju mo¿e opisaæ najwy¿ej 8*(S-10)-1 stron przydatnych do
wymiany.
Przy S=4096 (jak w  i386), u¿ytecznym obszarem jest najwy¿ej 133890048
bajtów (prawie 128 MiB), a reszta jest marnowana. Na alfie i sparc64 o
S=8192, u¿ytecznym obszarem jest najwy¿ej 535560992 bajtów (prawie 512 MiB).

Stara konfiguracja marnuje wiêkszo¶æ tej strony mapy bitowej, gdy¿ bity
zerowe okre¶laj± uszkodzone lub bloki poza koñcem obszaru wymiany,
choæ do okre¶lenia rozmiaru obszaru wymiany wystarcza prosta liczba
ca³kowita, a uszkodzone bloki mo¿na umie¶ciæ na li¶cie. Nikt nie chce u¿ywaæ
obszaru wymiany z setkami uszkodzonych bloków. (Nie chcia³bym u¿ywaæ obszaru
nawet z 1 uszkodzonym blokiem.)
W nowym rodzaju obszaru wymiany zrobiono w³a¶nie to. Maksymalny rozmiar
obszaru wymiany zale¿y od architektury. Wynosi on 2GiB na i386, PPC, m68k,
ARM, 1GiB na sparku, 512MiB na mipsie i 128GIB na alfie oraz 3TiB na
sparc64.

Zauwa¿, ¿e przed 2.1.117 j±dro alokowa³o jeden bajt na ka¿d± stronê, a obecnie
alokuje dwa bajty,  wiêc wziêcie obszaru wymiany 2GiB mo¿e wymagaæ 2MiB
pamiêci j±drowej.

Obecnie Linux zezwala na 8 obszarów wymiany. U¿ywane obszary mo¿na zobaczyæ
w pliku
.I /proc/swaps
(od 2.1.25).

.B mkswap
odmawia utworzenia obszarów mniejszych ni¿ 10 stron.

Je¶li nie wiesz jakiego rozmiaru strony u¿ywa twoja maszyna, mo¿esz to
sprawdziæ poleceniem `cat /proc/cpuinfo' (lub nie mo¿esz -- zawarto¶æ tego
pliku zale¿y od architektury i wersji j±dra).

Aby skonfigurowaæ plik wymiany nale¿y utworzyæ ten plik przed
zainicjalizowaniem go poleceniem
.B mkswap ,
np. u¿ywaj±c polecenia w rodzaju

.nf
.RS
# dd if=/dev/zero of=swapfile bs=1024 count=65536
.RE
.fi

Zauwa¿, ¿e plik wymiany nie mo¿e zawieraæ dziur (wiêc u¿ywanie do jego
utworzenia
.BR cp (1)
jest niedopuszczalne).

.SH OPCJE
.TP
.B \-c
Sprawdzenie urz±dzenia (je¶li jest blokowe) w poszukiwaniu uszkodzonych bloków
przed utworzeniem obszaru wymiany. Je¶li jakie¶ zostan± znalezione, ich
liczba zostaje wydrukowana.
.TP
.B \-f
Wymuszenie dzia³ania nawet je¶li polecenie jest g³upie. Umo¿liwia to
tworzenie obszaru wymiany wiêkszego ni¿ plik lub partycja, na których on siê
znajduje. 
Na SPARC wymuszenie tworzenia obszaru wymiany.
Bez tej opcji
.B mkswap
odmówi tworzenia wymiany v0 na urz±dzeniu z prawid³owym superblokiem SPARC,
gdy¿ oznacza to ¿e kto¶ ma zamiar wymazaæ tablicê partycji.
.TP
.BI "\-p " PSZ
Okre¶lenie rozmiaru u¿ywanej strony.
.TP
.B \-v0
Utworzenie obszaru wymiany starego rodzaju.
.TP
.B \-v1
Utworzenie obszaru wymiany nowego rodzaju.

.LP
Je¶li opcja \-v nie jest podana,
.B mkswap
domy¶lnie u¿yje nowego rodzaju, lecz je¶li bie¿±ce j±dro jest starsze ni¿
2.1.117 (i równie¿ je¶li PAGE_SIZE jest mniejsze ni¿ 2048), u¿yj starszego
rodzaju.
Nag³ówek nowego rodzaju nie dotyka pierwszego bloku, wiêc mo¿e byæ
preferowany w przypadku gdy masz tam LILO lub etykietê dysku.
Je¶li musisz u¿ywaæ zarówno j±dra 2.0 jak i 2.2, u¿yj \-v0.

.SH "ZOBACZ TAK¯E"
.BR fdisk (8),
.BR swapon (8)
