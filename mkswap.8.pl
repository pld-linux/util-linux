.\" {PTM/PB/0.1/01-02-1999/"skonfiguruj swap"}
.\" Translation 1999 Przemek Borys <pborys@dione.ids.pl>
.\" Copyright 1992, 1993 Rickard E. Faith (faith@cs.unc.edu)
.\" May be distributed under the GNU General Public License
.\" Modified with suggestions from Linus, Mon Feb  1 21:40:49 1993
.\" Modified with patches from Kai, Wed Jun 22 21:54:56 1994
.\" Patches from jaggy@purplet.demon.co.uk (Mike Jagdis), Wed Feb 8 1995
.\" Added comments from Nick Holloway, Sat Feb 11 1995, faith@cs.unc.edu
.\" "
.TH MKSWAP 8 "8 Luty 1995" "Linux 1.0" "Podr�cznik programisty linuxowego"
.SH NAZWA
mkswap \- skonfiguruj obszar swap dla linuxa
.SH SK�ADNIA
.B "mkswap [ \-c ]"
.IB urz�dzenie  " [" rozmiar-w-blokach "]"
.SH OPIS
.B mkswap
konfiguruje obszar swapu dla Linuxa na urz�dzeniu (lub w pliku).

.I Urz�dzenie
jest zwykle podawane w nast�puj�cej postaci:

.nf
.RS
/dev/hda[1-8]
/dev/hdb[1-8]
/dev/sda[1-8]
/dev/sdb[1-8]
.RE
.fi

Parametr
.I rozmiar-w-blokach
jest oczekiwanym rozmiarem systemu plik�w w blokach. Informacja ta mo�e by�
automatycznie rozpoznawana przez
.B mkswap
Liczniki blok�w s� zaokr�glane w d� tak, aby rozmiar ca�kowity by�
ca�kowit� wielokrotno�ci� rozmiaru stronicy maszyny. Dozwolone sa jedynie
liczniki w zakresie MINCOUNT..MAXCOUNT. Je�li licznik przewy�sza MAXCOUNT,
to jest skracany do tej warto�ci i wy�wietlane jest ostrze�enie.

Warto�ci MINCOUNT i MAXCOUNT dla obszaru swap to:

.RS
MINCOUNT = 10 * ROZMIAR_STRONICY / 1024
.br
MAXCOUNT = (ROZMIAR_STRONICY - 10) * 8 * ROZMIAR_STRONICY / 1024
.RE

Np, na maszynie ze stronicami 4KB (np. x86) uzyskujemy:

.RS
MINCOUNT = 10 * 4096 / 1024 = 40
.br
MAXCOUNT = (4096 - 10) * 8 * 4096 / 1024 = 130752
.RE

Jako, �e ka�dy blok ma wielko�� 1KB, obszar swapu na tym przyk�adzie mo�e
mie� rozmiar, kt�ry znajduje si� w obszarze od 40KB do 127MB.

Je�li nie wiesz jakiego rozmiaru stronicy u�ywa twoja maszyna, mo�esz
sprawdzi� to w /proc/cpuinfo.

Powodem ograniczenia MAXCOUNT jest to, �e pojedyncza strona u�ywana jest do
przechowywania bitmapy swapu na pocz�tku obszaru swapu, w kt�rej ka�dy bit
reprezentuje pojedyncz� stron�. Powodem -10 jest to, �e sygnatur� jest
"SWAP-SPACE", czyli 10 znak�w.

Aby skonfigurowa� plik swap niezb�dnym jest utworzenie pliku przed
uruchomieniem
.B mkswap .
Sekwencja podobna do nast�puj�cych komend mia�aby sens dla takiego celu:

.nf
.RS
# dd if=/dev/zero of=swapfile bs=1024 count=8192
# mkswap swapfile 8192
# sync
# swapon swapfile
.RE
.fi

Zauwa�, �e plik swap nie mo�e zawiera� dziur (wi�c uzywanie
.BR cp (1)
do utworzenia pliku nie jest zalecane).

.SH OPCJE
.TP
.B \-c
Sprawd� urz�dzenie w poszukiwaniu uszkodzonych blok�w, przed utworzeniem
systemu plik�w. Je�li takie si� znajd�, wydrukuj ich ilo��. Opcja ta ma
zastosowanie tylko dla partycji swap i nie powinna by� u�ywana na zwyk�ych
plikach!
Aby upewni� si�, �e zwyk�e pliki nie zawieraj� uszkodzonych blok�w, partycja
na kt�rych one si� znajduj�, powinna by�a by� utworzona poleceniem
.BR "mkfs -c" .
.SH "ZOBACZ TAK�E"
.BR fsck (8),
.BR mkfs (8),
.BR fdisk (8)
.SH AUTOR
Linus Torvalds (torvalds@cs.helsinki.fi)
