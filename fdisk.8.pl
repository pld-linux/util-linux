.\" 1999 PTM Przemek Borys
.\" Copyright 1992, 1993 Rickard E. Faith (faith@cs.unc.edu)
.\" May be distributed under the GNU General Public License
.TH FDISK 8 "3 Czerwca 1995" "Linux 1.0" "Linux Programmer's Manual"
.SH NAZWA
fdisk \- Obs³uga tablicy partycji dla Linuxa
.SH SK£ADNIA
.B fdisk
.B "[ \-l ] [ \-v ] [ \-s partition] ["
urz±dzenie
.B ]
.SH OPIS
.B fdisk
to obs³ugiwany z pomoc± menu program do dzia³ania na tablicy partycji dysku
twardego.
.I Urz±dzenie
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
.I urz±dzenia
\fR, za któr± nastêpuje liczba. Na przyk³ad,
.B /dev/hda1
jest pierwsz± partycj± pierwszego dysku twardego systemu.

Je¶li jest to mo¿liwe,
.B fdisk
automatycznie uzyska informacje o geometrii dysku. 
.I Niekoniecznie
musi to byæ
.I fizyczna
geometria, lecz geometria, której u¿ywa MS-DOS dla tablicy partycji. Je¶li
.B fdisk
ostrze¿e ciê, ¿e musisz ustawiæ geometriê dysku, uwierz mu i ustaw j±.
Procedura ta jest konieczna tylko dla niektórych adapterów SCSI (których
sterowniki s± jednak szybko modyfikowane, aby daæ t± informacjê automatycznie).

Gdy drukowana jest tablica partycji, dokonywane jest sprawdzenie
konsystencji wpisów tablicy. Sprawdzenie porównuje fizyczne i logiczne
punkty startowe i koñcowe, oraz ¿e partycja rozpoczyna siê i koñczy w
granicach cylindrów (poza pierwsz± partycj±).

Stare wersje fdiska (przed 1.1r, ³±cznie z 0.93) niew³a¶ciwie mapowa³y
parametry cylindra/g³owicy/sektora na sektory. Mog³o to powodowaæ
nieprzechodzenie pierwszej partycji przez sprawdzenia konsystencji. Je¶li do
bootowania u¿ywasz LILO, sytuacja ta mo¿e byæ zignorowana. Jednak s±
raporty, ¿e mened¿er OS/2 nie wystartuje z partycji o niekonsystentnych
danych.

Niektóre wersje MS-DOS tworz± pierwsz± partycjê, która nie rozpoczyna siê na
granicy cylindra, lecz na 2 sektorze pierwszego cylindra. Partycje
rozpoczynaj±ce siê na cylindrze 1 nie mog± rozpoczynaæ siê na granicy
cylindra, lecz raczej nie powinno to sprawiaæ problemów, chyba ¿e u¿ywasz
OS/2.

W wersji 1.1r, ioctl() BLKRRPART jest dokonywane (o ile zmieniono tablicê
partycji) przed wyj¶ciem. Zapewnia to, ¿e wymienne dyski SCSI bêd± mia³y
odnowion± tablicê. Je¶li j±dro nie od¶wierzy swojej tablicy partycji, fdisk
zasugeruje reboot. Je¶li po otrzymaniu tego ostrze¿enia nie prze³adujesz
systemu, mo¿esz straciæ, lub uszkodziæ dane na tym dysku. Czasami BLKRRPART
nie zg³asza niepowodzenia, podczas instalowania Linuxa powiniene¶
.I zawsze
prze³adowaæ system po edycji tablicy partycji.

.SH "OSTRZE¯ENIE DOS 6.x"

Komenda FORMAT z DOS 6.x szuka informacji w pierwszym sektorze obszaru
danych partycji i traktuje je jako godniejsze zaufania ni¿ tablica partycji.
Dosowy FORMAT oczekuje od dosowego FDISK-a, ¿e ten wyczy¶ci pierwsze 512
bajtów obszarów danych przy ka¿dej zmianie rozmiarów. Dosowy FORMAT zajrzy
do tych dodatkowych danych nawet z flag± /U -- uwa¿amy to za b³±d tych 
programów.

Je¶li wiêc u¿ywasz cfdisk'a, lub fdiska do zmiany rozmiaru partycji dosowej,
musisz te¿ u¿yæ 
.B dd
do wyzerowania pierwszych 512 bajtów tej partycji przed u¿yciem dosowego
FORMAT. Na przyk³ad, je¶li u¿ywasz do tworzenia dosowej partycji programu
cfdisk, to po zakoñczeniu pracy powiniene¶ wykonaæ polecenie
"dd if=/dev/zero of=/dev/hda1 bs=512 count=1" która zeruje pierwszych 512
bajtów partycji.
.B B¡D¬ NIEWYOBRA¯ALNIE OSTRO¯NY
przy u¿ywaniu komendy
.BR dd ,
gdy¿ ma³a pomy³ka mo¿e spowodowaæ zniszczenie wszystkich danych z dysku.

Dla najlepszych wyników, zawsze powiniene¶ u¿ywaæ fdiska specyficznego danemu
systemowi operacyjnemu. Na przyk³ad, partycje dosowe powiniene¶ tworzyæ
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
i koñczy.
.TP
.BI \-s partycja
Je¶li
.I partycja
nie jest partycj± dosow± (np. jej id jest wiêksze ni¿ 10), to na stdout
drukowany jest
.I rozmiar
tej partycji. Warto¶æ ta jest zwykle u¿ywana jako argument dla programu
.BR mkfs (8)
do podawania rozmiaru formatowanej partycji.
.SH B£ÊDY
Chocia¿ ta strona podrêcznika (napisana przez faith@cs.unc.edu) jest cienka
jak barszcz, to istnieje
.I doskona³a
dokumentacja w pliku README.fdisk (napisanym przez LeBlanc@mcc.ac.uk), która
powinna przychodziæ z ka¿d± dystrybucj± fdiska. Je¶li nie mo¿esz znale¼æ
tego pliku w katalogu
.I util-linux-*
lub przy pliku ¼ród³owym
.IR fdisk.c ,
to powiniene¶ napisaæ do dystrybutora swojej wersji
.B fdiska
i zacz±æ narzekaæ, ¿e nie masz dokumentacji.
.SH AUTOR
A. V. Le Blanc (LeBlanc@mcc.ac.uk)
.br
v1.0r: Dodana obs³uga SCSI i extfs /Rik Faith (faith@cs.unc.edu)/
.br
v1.1r: Poprawki i rozszerzenia /Rik Faith (faith@cs.unc.edu), ze
szczególnymi podziêkowaniami dla Michaela Bischoffa (i1041905@ws.rz.tu-bs.de
lub mbi@mo.math.nat.tu-bs.de).
.br
v1.3: Najnowsze rozszerzenia i poprawki A. V. Le Blanca, ³±cznie z dodaniem
opcji
.BR \-s .
.bt
v2.0: Obs³uga dysków wiêkszych ni¿ 2GB, podziêkowania za llseek(2)a dla
Remy'ego Carda.
