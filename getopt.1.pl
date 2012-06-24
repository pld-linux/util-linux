.\" {PTM/PB/0.1/02-10-1998/"analizuj opcje linii komend"}
.\" Translation (c) 1998 Przemek Borys <pborys@p-soft.silesia.linux.org.pl>
.Dd June 21, 1993
.Dt GETOPT 1
.Os
.Sh NAZWA
.Nm getopt
.Nd analizuj opcje linii komend
.Sh SK�ADNIA
.Nm set \-\- \`getopt optstring $*\`
.Sh OPIS
.Nm Getopt
jest u�ywany do rozbijania opcji w liniach komend dla �atwej analizy przez
procedury shellowe i do sprawdzania istnienia opcji legalnych.
.Op Optstring
jest ci�gniem rozpoznawalnych liter opcyjnych (zobacz
.Xr getopt 3
);
je�li po literze nast�puje �rednik, opcja ma w domy�le argument, kt�ry mo�e,
lecz nie musi by� oddzielony od niej bia�� spacj�.
Opcja specjalna
.B \-\-
u�ywana jest do wskazania ko�ca opcji.
.Nm Getopt
Podstawi
.B \-\-
w argumentach na samym ko�cu opcji, lub rozpozna ten symbol, je�li
wstawiono go jawnie.
Argumenty shellowe
(\fB$1 $2\fR ...) s� resetowane tak, �e ka�da opcja jest poprzedzona znakiem
.B \-
i w swoim w�asnym argumencie shellowym; ka�dy argument opcyjny jest tak�e w
swoim w�asnym argumencie shellowym.
.Sh PRZYK�AD
Nast�puj�cy fragment kodu pokazuj jak mo�na przetworzy� arumenty komendy,
kt�ra mo�e pobiera� opcje
.Op a
i
.Op b ,
a tak�e opcj�
.Op o ,
kt�ra wymaga argumentu.
.Pp
.Bd -literal -offset indent
set \-\- \`getopt abo: $*\`
if test $? != 0
then
	echo 'U�ycie: ...'
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
Kod ten przyjmie dowone opcje z nast�puj�cych jako identyczne:
.Pp
.Bd -literal -offset indent
cmd \-aoarg plik plik
cmd \-a \-o arg plik plik
cmd \-oarg -a plik plik
cmd \-a \-oarg \-\- plik plik
.Ed
.Sh ZOBACZ TAK�E
.Xr sh 1 ,
.Xr getopt 3
.Sh DIAGNOSTYKA
.Nm Getopt
drukuje wiadomo�� o b�edzie, je�li napotka liter� opcyjn� nieza��czon� w
stringu
.Op optstring .
.Sh HISTORIA
Napisane przez Henry'ego Spencera, pracuj�cego na podstawie strony man Bell
Labs. Zachowanie powinno by� identyczne jak w wersji Bell.
.Sh B��DY
Takie same jak w
.Xr getopt 3 .
.Pp
Arugmenty zawieraj�ce bia�e spacje, lub za��czone metaznaki shella nie
prze�yj� nienaruszone; wygl�da to na �atwy do naprawienia b��d, lecz tak nie
jest.
.Pp
Wiadomo�� o b��dzie dla nieprawid�owej opcji jest wskazywana jako pochodz�ca
z programu
.Nm getopt
a nie z procedury shellowej, zawieraj�cej wywo�anie
.Nm getopt ;
jest to znowu trudne do naprawienia.
.Pp
Najlepsza droga, czyli
.Nm set
, do ustawiania argument�w bez rozrywania warto�ci opcji shellowych zmienia
si� z jednej wersji shella na inn�.
