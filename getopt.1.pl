.\" {PTM/PB/0.1/02-10-1998/"analizuj opcje linii komend"}
.\" Translation (c) 1998 Przemek Borys <pborys@p-soft.silesia.linux.org.pl>
.Dd June 21, 1993
.Dt GETOPT 1
.Os
.Sh NAZWA
.Nm getopt
.Nd analizuj opcje linii komend
.Sh SK£ADNIA
.Nm set \-\- \`getopt optstring $*\`
.Sh OPIS
.Nm Getopt
jest u¿ywany do rozbijania opcji w liniach komend dla ³atwej analizy przez
procedury shellowe i do sprawdzania istnienia opcji legalnych.
.Op Optstring
jest ci±gniem rozpoznawalnych liter opcyjnych (zobacz
.Xr getopt 3
);
je¶li po literze nastêpuje ¶rednik, opcja ma w domy¶le argument, który mo¿e,
lecz nie musi byæ oddzielony od niej bia³± spacj±.
Opcja specjalna
.B \-\-
u¿ywana jest do wskazania koñca opcji.
.Nm Getopt
Podstawi
.B \-\-
w argumentach na samym koñcu opcji, lub rozpozna ten symbol, je¶li
wstawiono go jawnie.
Argumenty shellowe
(\fB$1 $2\fR ...) s± resetowane tak, ¿e ka¿da opcja jest poprzedzona znakiem
.B \-
i w swoim w³asnym argumencie shellowym; ka¿dy argument opcyjny jest tak¿e w
swoim w³asnym argumencie shellowym.
.Sh PRZYK£AD
Nastêpuj±cy fragment kodu pokazuj jak mo¿na przetworzyæ arumenty komendy,
która mo¿e pobieraæ opcje
.Op a
i
.Op b ,
a tak¿e opcjê
.Op o ,
która wymaga argumentu.
.Pp
.Bd -literal -offset indent
set \-\- \`getopt abo: $*\`
if test $? != 0
then
	echo 'U¿ycie: ...'
	exit 2
fi
for i
do
	case "$i"
	in
		\-a|\-b)
			flag=$i; shift;;
		\-o)
			oarg=$2; shift; shift;;
		\-\-)
			shift; break;;
	esac
done
.Ed
.Pp
Kod ten przyjmie dowone opcje z nastêpuj±cych jako identyczne:
.Pp
.Bd -literal -offset indent
cmd \-aoarg plik plik
cmd \-a \-o arg plik plik
cmd \-oarg -a plik plik
cmd \-a \-oarg \-\- plik plik
.Ed
.Sh ZOBACZ TAK¯E
.Xr sh 1 ,
.Xr getopt 3
.Sh DIAGNOSTYKA
.Nm Getopt
drukuje wiadomo¶æ o b³edzie, je¶li napotka literê opcyjn± nieza³±czon± w
stringu
.Op optstring .
.Sh HISTORIA
Napisane przez Henry'ego Spencera, pracuj±cego na podstawie strony man Bell
Labs. Zachowanie powinno byæ identyczne jak w wersji Bell.
.Sh B£ÊDY
Takie same jak w
.Xr getopt 3 .
.Pp
Arugmenty zawieraj±ce bia³e spacje, lub za³±czone metaznaki shella nie
prze¿yj± nienaruszone; wygl±da to na ³atwy do naprawienia b³±d, lecz tak nie
jest.
.Pp
Wiadomo¶æ o b³êdzie dla nieprawid³owej opcji jest wskazywana jako pochodz±ca
z programu
.Nm getopt
a nie z procedury shellowej, zawieraj±cej wywo³anie
.Nm getopt ;
jest to znowu trudne do naprawienia.
.Pp
Najlepsza droga, czyli
.Nm set
, do ustawiania argumentów bez rozrywania warto¶ci opcji shellowych zmienia
siê z jednej wersji shella na inn±.
