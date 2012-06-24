.\" 1999 PTM Przemek Borys
.\" Copyright 1992, 1993 Rickard E. Faith (faith@cs.unc.edu)
.\" May be distributed under the GNU General Public License
.TH FDISK 8 "3 Czerwca 1995" "Linux 1.0" "Linux Programmer's Manual"
.SH NAZWA
fdisk \- Obs�uga tablicy partycji dla Linuxa
.SH SK�ADNIA
.B fdisk
.B "[ \-l ] [ \-v ] [ \-s partition] ["
urz�dzenie
.B ]
.SH OPIS
.B fdisk
to obs�ugiwany z pomoc� menu program do dzia�ania na tablicy partycji dysku
twardego.
.I Urz�dzenie
jest zwykle jednym z:
.sp
.nf
.RS
/dev/hda
/dev/hdb
/dev/sda
/dev/sdb
.RE
.fi
.I Partycja
to nazwa
.I urz�dzenia
\fR, za kt�r� nast�puje liczba. Na przyk�ad,
.B /dev/hda1
jest pierwsz� partycj� pierwszego dysku twardego systemu.

Je�li jest to mo�liwe,
.B fdisk
automatycznie uzyska informacje o geometrii dysku. 
.I Niekoniecznie
musi to by�
.I fizyczna
geometria, lecz geometria, kt�rej u�ywa MS-DOS dla tablicy partycji. Je�li
.B fdisk
ostrze�e ci�, �e musisz ustawi� geometri� dysku, uwierz mu i ustaw j�.
Procedura ta jest konieczna tylko dla niekt�rych adapter�w SCSI (kt�rych
sterowniki s� jednak szybko modyfikowane, aby da� t� informacj� automatycznie).

Gdy drukowana jest tablica partycji, dokonywane jest sprawdzenie
konsystencji wpis�w tablicy. Sprawdzenie por�wnuje fizyczne i logiczne
punkty startowe i ko�cowe, oraz �e partycja rozpoczyna si� i ko�czy w
granicach cylindr�w (poza pierwsz� partycj�).

Stare wersje fdiska (przed 1.1r, ��cznie z 0.93) niew�a�ciwie mapowa�y
parametry cylindra/g�owicy/sektora na sektory. Mog�o to powodowa�
nieprzechodzenie pierwszej partycji przez sprawdzenia konsystencji. Je�li do
bootowania u�ywasz LILO, sytuacja ta mo�e by� zignorowana. Jednak s�
raporty, �e mened�er OS/2 nie wystartuje z partycji o niekonsystentnych
danych.

Niekt�re wersje MS-DOS tworz� pierwsz� partycj�, kt�ra nie rozpoczyna si� na
granicy cylindra, lecz na 2 sektorze pierwszego cylindra. Partycje
rozpoczynaj�ce si� na cylindrze 1 nie mog� rozpoczyna� si� na granicy
cylindra, lecz raczej nie powinno to sprawia� problem�w, chyba �e u�ywasz
OS/2.

W wersji 1.1r, ioctl() BLKRRPART jest dokonywane (o ile zmieniono tablic�
partycji) przed wyj�ciem. Zapewnia to, �e wymienne dyski SCSI b�d� mia�y
odnowion� tablic�. Je�li j�dro nie od�wierzy swojej tablicy partycji, fdisk
zasugeruje reboot. Je�li po otrzymaniu tego ostrze�enia nie prze�adujesz
systemu, mo�esz straci�, lub uszkodzi� dane na tym dysku. Czasami BLKRRPART
nie zg�asza niepowodzenia, podczas instalowania Linuxa powiniene�
.I zawsze
prze�adowa� system po edycji tablicy partycji.

.SH "OSTRZE�ENIE DOS 6.x"

Komenda FORMAT z DOS 6.x szuka informacji w pierwszym sektorze obszaru
danych partycji i traktuje je jako godniejsze zaufania ni� tablica partycji.
Dosowy FORMAT oczekuje od dosowego FDISK-a, �e ten wyczy�ci pierwsze 512
bajt�w obszar�w danych przy ka�dej zmianie rozmiar�w. Dosowy FORMAT zajrzy
do tych dodatkowych danych nawet z flag� /U -- uwa�amy to za b��d tych 
program�w.

Je�li wi�c u�ywasz cfdisk'a, lub fdiska do zmiany rozmiaru partycji dosowej,
musisz te� u�y� 
.B dd
do wyzerowania pierwszych 512 bajt�w tej partycji przed u�yciem dosowego
FORMAT. Na przyk�ad, je�li u�ywasz do tworzenia dosowej partycji programu
cfdisk, to po zako�czeniu pracy powiniene� wykona� polecenie
"dd if=/dev/zero of=/dev/hda1 bs=512 count=1" kt�ra zeruje pierwszych 512
bajt�w partycji.
.B B�D� NIEWYOBRA�ALNIE OSTRO�NY
przy u�ywaniu komendy
.BR dd ,
gdy� ma�a pomy�ka mo�e spowodowa� zniszczenie wszystkich danych z dysku.

Dla najlepszych wynik�w, zawsze powiniene� u�ywa� fdiska specyficznego danemu
systemowi operacyjnemu. Na przyk�ad, partycje dosowe powiniene� tworzy�
dosowym FDISK-iem, a linuxowe linuxowym fdiskiem, lub cfdiskiem.

.SH OPCJE
.TP
.B \-v
Drukuje numer wersji
.BR fdiska .
.TP
.B \-l
Drukuje tablice partycji dla
.BR /dev/hda ,
.BR /dev/hdb ,
.BR /dev/sda ,
.BR /dev/sdb ,
.BR /dev/sdc ,
.BR /dev/sdd ,
.BR /dev/sde ,
.BR /dev/sdf ,
.BR /dev/sdg ,
.BR /dev/sdh ,
i ko�czy.
.TP
.BI \-s partycja
Je�li
.I partycja
nie jest partycj� dosow� (np. jej id jest wi�ksze ni� 10), to na stdout
drukowany jest
.I rozmiar
tej partycji. Warto�� ta jest zwykle u�ywana jako argument dla programu
.BR mkfs (8)
do podawania rozmiaru formatowanej partycji.
.SH B��DY
Chocia� ta strona podr�cznika (napisana przez faith@cs.unc.edu) jest cienka
jak barszcz, to istnieje
.I doskona�a
dokumentacja w pliku README.fdisk (napisanym przez LeBlanc@mcc.ac.uk), kt�ra
powinna przychodzi� z ka�d� dystrybucj� fdiska. Je�li nie mo�esz znale��
tego pliku w katalogu
.I util-linux-*
lub przy pliku �r�d�owym
.IR fdisk.c ,
to powiniene� napisa� do dystrybutora swojej wersji
.B fdiska
i zacz�� narzeka�, �e nie masz dokumentacji.
.SH AUTOR
A. V. Le Blanc (LeBlanc@mcc.ac.uk)
.br
v1.0r: Dodana obs�uga SCSI i extfs /Rik Faith (faith@cs.unc.edu)/
.br
v1.1r: Poprawki i rozszerzenia /Rik Faith (faith@cs.unc.edu), ze
szczeg�lnymi podzi�kowaniami dla Michaela Bischoffa (i1041905@ws.rz.tu-bs.de
lub mbi@mo.math.nat.tu-bs.de).
.br
v1.3: Najnowsze rozszerzenia i poprawki A. V. Le Blanca, ��cznie z dodaniem
opcji
.BR \-s .
.bt
v2.0: Obs�uga dysk�w wi�kszych ni� 2GB, podzi�kowania za llseek(2)a dla
Remy'ego Carda.
