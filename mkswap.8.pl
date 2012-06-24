.\" 2000 PTM Przemek Borys <pborys@dione.ids.pl>
.\" Copyright 1998 Andries E. Brouwer (aeb@cwi.nl)
.\"
.\" May be distributed under the GNU General Public License
.\" Rewritten for 2.1.117, aeb, 981010.
.\"
.TH MKSWAP 8 "25 marca 1999" "Linux 2.2.4" "Podr�cznik programisty linuksowego"
.SH NAZWA
mkswap \- skonfiguruj linuksowy obszar wymiany
.SH SK�ADNIA
.BI "mkswap [\-c] [\-v" N "] [\-f] [\-p " PSZ "] "urz�dzenie  " [" rozmiar "]"
.SH OPIS
.B mkswap
konfiguruje linuksowy obszar wymiany na urz�dzeniu lub w pliku.

(Po utworzeniu obszaru wymiany musisz u�y� polecenia
.B swapon
by go aktywowa�. Zwykle obszary wymiany s� wymieniane w
.IR /etc/fstab ,
wi�c mog� by� w��czane do u�ytku podczas startu systemu poleceniem
.B swapon -a
w skrypcie startowym.)

Argument
.I urz�dzenie
zwykle jest partycj� dyskow� (co� w rodzaju
.I /dev/hda4
lub
.IR /dev/sdb7 )
lecz mo�e by� r�wnie� plikiem.
J�dro Linuksa nie zwa�a na identyfikatory partycji, lecz wiele skrypt�w
instalacyjnych zak�ada, �e partycje typu 82 (szesnastkowo -- LINUX_SWAP) s�
partycjami wymiany. (Uwaga: Solaris r�wnie� u�ywa tego typu. Uwa�aj by nie
zabi� swoich partycji solarisowych.)

Parametr
.I rozmiar
jest niepotrzebny, lecz zachowany dla zgodno�ci wstecznej. (Okre�la on
potrzebny rozmiar obszaru wymiany w 1024 blokach.
.B mkswap
w przypadku pomini�cia tego parametru u�ywa ca�ej partycji lub ca�ego pliku.
Podawanie tego parametru jest niem�dre -- liter�wka mo�e zniszczy� dysk.)

Parametr
.I PSZ
okre�la rozmiar u�ywanej strony. Podawanie go jest prawie zawsze
niepotrzebne (nawet niem�dre), lecz niekt�re stare wersje libc k�ami� o
rozmiarze strony, wi�c 
.B mkswap
mo�e si� pomyli�. Symptomem jest to, �e kolejne
.B swapon
nie powodz� si�, gdy� nie znajduj� sygnatury wymiany. Typowymi warto�ciami
.I PSZ
s� 4096 lub 8192.

Linux zna przynajmniej dwa rodzaje obszar�w wymiany: stary i nowy. Ostatnie
10 bajt�w pierwszej strony obszaru wymiany s�u�� do rozr�nienia: stary ma w
sygnaturze `SWAP_SPACE', nowy `SWAPSPACE2'.

W starym rodzaju dalszym ci�giem pierwszej strony by�a mapa bitowa, z jednym
bitem na ka�d� u�ywaln� stron� obszaru wymiany. Poniewa� pierwsza strona
przechowuje map� bitow�, pierwszy bit jest zerowy. Ponadto ostatnie 10
bajt�w przechowuje sygnatur�. Je�li wi�c rozmiar strony wynosi S, to obszar
wymiany starego rodzaju mo�e opisa� najwy�ej 8*(S-10)-1 stron przydatnych do
wymiany.
Przy S=4096 (jak w  i386), u�ytecznym obszarem jest najwy�ej 133890048
bajt�w (prawie 128 MiB), a reszta jest marnowana. Na alfie i sparc64 o
S=8192, u�ytecznym obszarem jest najwy�ej 535560992 bajt�w (prawie 512 MiB).

Stara konfiguracja marnuje wi�kszo�� tej strony mapy bitowej, gdy� bity
zerowe okre�laj� uszkodzone lub bloki poza ko�cem obszaru wymiany,
cho� do okre�lenia rozmiaru obszaru wymiany wystarcza prosta liczba
ca�kowita, a uszkodzone bloki mo�na umie�ci� na li�cie. Nikt nie chce u�ywa�
obszaru wymiany z setkami uszkodzonych blok�w. (Nie chcia�bym u�ywa� obszaru
nawet z 1 uszkodzonym blokiem.)
W nowym rodzaju obszaru wymiany zrobiono w�a�nie to. Maksymalny rozmiar
obszaru wymiany zale�y od architektury. Wynosi on 2GiB na i386, PPC, m68k,
ARM, 1GiB na sparku, 512MiB na mipsie i 128GIB na alfie oraz 3TiB na
sparc64.

Zauwa�, �e przed 2.1.117 j�dro alokowa�o jeden bajt na ka�d� stron�, a obecnie
alokuje dwa bajty,  wi�c wzi�cie obszaru wymiany 2GiB mo�e wymaga� 2MiB
pami�ci j�drowej.

Obecnie Linux zezwala na 8 obszar�w wymiany. U�ywane obszary mo�na zobaczy�
w pliku
.I /proc/swaps
(od 2.1.25).

.B mkswap
odmawia utworzenia obszar�w mniejszych ni� 10 stron.

Je�li nie wiesz jakiego rozmiaru strony u�ywa twoja maszyna, mo�esz to
sprawdzi� poleceniem `cat /proc/cpuinfo' (lub nie mo�esz -- zawarto�� tego
pliku zale�y od architektury i wersji j�dra).

Aby skonfigurowa� plik wymiany nale�y utworzy� ten plik przed
zainicjalizowaniem go poleceniem
.B mkswap ,
np. u�ywaj�c polecenia w rodzaju

.nf
.RS
# dd if=/dev/zero of=swapfile bs=1024 count=65536
.RE
.fi

Zauwa�, �e plik wymiany nie mo�e zawiera� dziur (wi�c u�ywanie do jego
utworzenia
.BR cp (1)
jest niedopuszczalne).

.SH OPCJE
.TP
.B \-c
Sprawdzenie urz�dzenia (je�li jest blokowe) w poszukiwaniu uszkodzonych blok�w
przed utworzeniem obszaru wymiany. Je�li jakie� zostan� znalezione, ich
liczba zostaje wydrukowana.
.TP
.B \-f
Wymuszenie dzia�ania nawet je�li polecenie jest g�upie. Umo�liwia to
tworzenie obszaru wymiany wi�kszego ni� plik lub partycja, na kt�rych on si�
znajduje. 
Na SPARC wymuszenie tworzenia obszaru wymiany.
Bez tej opcji
.B mkswap
odm�wi tworzenia wymiany v0 na urz�dzeniu z prawid�owym superblokiem SPARC,
gdy� oznacza to �e kto� ma zamiar wymaza� tablic� partycji.
.TP
.BI "\-p " PSZ
Okre�lenie rozmiaru u�ywanej strony.
.TP
.B \-v0
Utworzenie obszaru wymiany starego rodzaju.
.TP
.B \-v1
Utworzenie obszaru wymiany nowego rodzaju.

.LP
Je�li opcja \-v nie jest podana,
.B mkswap
domy�lnie u�yje nowego rodzaju, lecz je�li bie��ce j�dro jest starsze ni�
2.1.117 (i r�wnie� je�li PAGE_SIZE jest mniejsze ni� 2048), u�yj starszego
rodzaju.
Nag��wek nowego rodzaju nie dotyka pierwszego bloku, wi�c mo�e by�
preferowany w przypadku gdy masz tam LILO lub etykiet� dysku.
Je�li musisz u�ywa� zar�wno j�dra 2.0 jak i 2.2, u�yj \-v0.

.SH "ZOBACZ TAK�E"
.BR fdisk (8),
.BR swapon (8)
