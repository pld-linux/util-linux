.\" {PTM/PB/0.1/01-02-1999/"skonfiguruj swap"}
.\" Translation 1999 Przemek Borys <pborys@dione.ids.pl>
.\" Copyright 1992, 1993 Rickard E. Faith (faith@cs.unc.edu)
.\" May be distributed under the GNU General Public License
.\" Modified with suggestions from Linus, Mon Feb  1 21:40:49 1993
.\" Modified with patches from Kai, Wed Jun 22 21:54:56 1994
.\" Patches from jaggy@purplet.demon.co.uk (Mike Jagdis), Wed Feb 8 1995
.\" Added comments from Nick Holloway, Sat Feb 11 1995, faith@cs.unc.edu
.\" "
.TH MKSWAP 8 "8 Luty 1995" "Linux 1.0" "Podrêcznik programisty linuxowego"
.SH NAZWA
mkswap \- skonfiguruj obszar swap dla linuxa
.SH SK£ADNIA
.B "mkswap [ \-c ]"
.IB urz±dzenie  " [" rozmiar-w-blokach "]"
.SH OPIS
.B mkswap
konfiguruje obszar swapu dla Linuxa na urz±dzeniu (lub w pliku).

.I Urz±dzenie
jest zwykle podawane w nastêpuj±cej postaci:

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
jest oczekiwanym rozmiarem systemu plików w blokach. Informacja ta mo¿e byæ
automatycznie rozpoznawana przez
.B mkswap
Liczniki bloków s± zaokr±glane w dó³ tak, aby rozmiar ca³kowity by³
ca³kowit± wielokrotno¶ci± rozmiaru stronicy maszyny. Dozwolone sa jedynie
liczniki w zakresie MINCOUNT..MAXCOUNT. Je¶li licznik przewy¿sza MAXCOUNT,
to jest skracany do tej warto¶ci i wy¶wietlane jest ostrze¿enie.

Warto¶ci MINCOUNT i MAXCOUNT dla obszaru swap to:

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

Jako, ¿e ka¿dy blok ma wielko¶æ 1KB, obszar swapu na tym przyk³adzie mo¿e
mieæ rozmiar, który znajduje siê w obszarze od 40KB do 127MB.

Je¶li nie wiesz jakiego rozmiaru stronicy u¿ywa twoja maszyna, mo¿esz
sprawdziæ to w /proc/cpuinfo.

Powodem ograniczenia MAXCOUNT jest to, ¿e pojedyncza strona u¿ywana jest do
przechowywania bitmapy swapu na pocz±tku obszaru swapu, w której ka¿dy bit
reprezentuje pojedyncz± stronê. Powodem -10 jest to, ¿e sygnatur± jest
"SWAP-SPACE", czyli 10 znaków.

Aby skonfigurowaæ plik swap niezbêdnym jest utworzenie pliku przed
uruchomieniem
.B mkswap .
Sekwencja podobna do nastêpuj±cych komend mia³aby sens dla takiego celu:

.nf
.RS
# dd if=/dev/zero of=swapfile bs=1024 count=8192
# mkswap swapfile 8192
# sync
# swapon swapfile
.RE
.fi

Zauwa¿, ¿e plik swap nie mo¿e zawieraæ dziur (wiêc uzywanie
.BR cp (1)
do utworzenia pliku nie jest zalecane).

.SH OPCJE
.TP
.B \-c
Sprawd¼ urz±dzenie w poszukiwaniu uszkodzonych bloków, przed utworzeniem
systemu plików. Je¶li takie siê znajd±, wydrukuj ich ilo¶æ. Opcja ta ma
zastosowanie tylko dla partycji swap i nie powinna byæ u¿ywana na zwyk³ych
plikach!
Aby upewniæ siê, ¿e zwyk³e pliki nie zawieraj± uszkodzonych bloków, partycja
na których one siê znajduj±, powinna by³a byæ utworzona poleceniem
.BR "mkfs -c" .
.SH "ZOBACZ TAK¯E"
.BR fsck (8),
.BR mkfs (8),
.BR fdisk (8)
.SH AUTOR
Linus Torvalds (torvalds@cs.helsinki.fi)
