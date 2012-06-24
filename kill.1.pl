.\" {PTM/LK/0.1/08-10-1998/"zako�czenie procesu"}
.\" T�umaczenie: 08-10-1998 �ukasz Kowalczyk (lukow@tempac.okwf.fuw.edu.pl)
.\" Copyright 1994 Salvatore Valente (svalente@mit.edu)
.\" Copyright 1992 Rickard E. Faith (faith@cs.unc.edu)
.\" May be distributed under the GNU General Public License
.TH KILL 1 "14 pa�dziernika 1994" "Programy u�ytkowe" "Instrukcja Programisty Linuksa"
.SH NAZWA
kill \- zako�cz proces
.SH SK�ADNIA
.BR "kill" " [ \-s sygna� | \-p ] " " [ -a ] " "pid ..."
.br
.B "kill -l [ sygna� ]"
.SH OPIS
.B kill
wysy�a podany sygna� do danego procesu. Je�eli nie podano numeru sygna�u,
wysy�any jest sygna� TERM. Sygna� TERM ko�czy te procesy, kt�re go nie
przechwytuj�. Dla innych proces�w niezb�dne mo�e si� okaza� u�ycie sygna�u
KILL (9), poniewa� nie mo�e on zosta� przechwycony.

Wi�kszo�� nowoczesnych shelli posiada wbudowane polecenie kill.
.SH OPCJE
.TP
.BR "pid ..."
Lista proces�w, kt�re maj� by� zako�czone. Ka�da opcja
.I pid
mo�e by� jedn� z nast�puj�cych:
.IR "nazwa procesu" ,
w�wczas sygna� zostanie wys�any do nazwanego procesu.
.IR n ,
gdzie
.I n
jest liczb� wi�ksz� od zera. Sygna� zostanie wys�any do procesu, kt�rego
pid jest r�wny
.IR n .
.IR -1 ,
w kt�rym to przypadku sygna� zostanie wys�any do wszystkich proces�w o
numerach pid o warto�ciach od MAX_INT do 2, je�eli pozwalaj� na to
uprawnienia u�ytkownika.
.\" (przyp. t�um.) to by� oryginalny tekst; moim zdaniem o to chodzi�o ^^^
.\" as allowed by the issuing user.
.IR -n ,
gdzie n jest wi�ksze od 1; sygna� zostanie wys�any do wszystkich proces�w
nale��cych do grupy o numerze
.IR n .
Je�eli 
.I n
jest ujemne, musi przed nim wyst�pi� numer sygna�u \- w przeciwnym wypadku
numer grupy zostanie potraktowany jako numer sygna�u do wys�ania.
.TP
.BR \-s
Rodzaj wysy�anego sygna�u. Mo�e by� podany jako nazwa lub numer.
.TP
.BR \-p
Polecenie wypisze jedynie numery proces�w (pid), do kt�rych zosta�by wys�any
sygna�, zamiast go rzeczywi�cie wysy�a�.
.TP
.BR \-l
Wypisz list� nazw sygna��w. Znajduje si� ona w pliku
.I /usr/include/linux/signal.h
.SH "ZOBACZ TAK�E"
.BR bash (1),
.BR tcsh (1),
.BR kill (2),
.BR sigvec (2)
.SH AUTOR
Program pochodzi z BSD 4.4. Mo�liwo�� t�umaczenia nazw proces�w na ich
numery zosta�a dodana przez Salvatore Valente <svalente@mit.edu>.
