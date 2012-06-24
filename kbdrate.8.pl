.\" {PTM/PB/0.1/18-05-1999/"zresetuj cz�stotliwo�� samopowtarzania i op�nienia klawiatury"}
.\" Copyright 1992, 1994 Rickard E. Faith (faith@cs.unc.edu)
.\" May be distributed under the GNU General Public License
.\" Updated Wed Jun 22 21:09:43 1994, faith@cs.unc.edu
.TH KBDRATE 8 "22 June 1994" "Linux 1.1.19" "Podr�cznik programisty linuxowego"
.SH NAZWA
kbdrate \- zresetuj cz�sto�� samopowtarzania i op�nienia klawiatury
.SH SK�ADNIA
.B "kbdrate [ \-s ] [ \-r"
cz�sto��
.B "] [ \-d"
op�nienie
.B ]
.SH OPIS
.B kbdrate
jest u�ywane do zmiany cz�stotliwo�ci samopowtarzania i op�nienia
klawiatury IBM. Op�nienie jest ilo�ci� czasu, przez kt�ry klawisz musi by�
wci�ni�ty, nim zacznie si� automatycznie powtarza�.

U�ywanie 
.B kbdrate
bez opcji zresetuje cz�stotliwo�� na 10,9 znak�w na sekund� (cps) i ustawi
op�nienie na 250 milisekund (mS). S� to warto�ci domy�lne IBM.
.SH OPCJE
.TP
.B \-s
Cicho. Nie drukuj �adnych komunikat�w.
.TP
.BI \-r " cz�sto��"
Zmie� cz�sto�� na
.I cz�sto��
cps.  Dopuszczalny zasi�g waha si� w zakresie 2.0 do 30.0 cps. Mo�liwe s�
tylko niekt�re warto�ci, a program sam wybierze te, kt�re s� najbli�sze
podanej warto�ci. Mo�liwe warto�ci, w znakach na sekund� to:
2.0, 2.1, 2.3, 2.5, 2.7, 3.0, 3.3, 3.7, 4.0, 4.3, 4.6,
5.0, 5.5, 6.0, 6.7, 7.5, 8.0, 8.6, 9.2, 10.0, 10.9, 12.0, 13.3, 15.0, 16.0,
17.1, 18.5, 20.0, 21.8, 24.0, 26.7, 30.0.
.TP
.BI \-d " op�nienie"
Zmie� op�nienie na
.I op�nienie
milisekund. Dopuszczalny zakres jest od 250 do 1000 mS, lecz jedynymi
dopuszczalnymi warto�ciami (opartymi na ograniczeniach sprz�towych) s�:
250mS, 500mS, 750mS i 1000mS.
.SH B��DY
Nie wszystkie klawiatury obs�uguj� wszystkie cz�sto�ci.
.PP
Nie wszystkie cz�sto�ci s� mapowane tak samo.
.PP
Ustawianie cz�sto��i powtarzania nie dzia�a na klawiaturze Gateway AnyKey.
Jeli kto� z t� klawiatur� wie jak programowa� t� klawiatur�, to niech wy�le
wiadomo�� do faith@cs.unc.edu.
.SH PLIKI
.I /etc/rc.local
.br
.I /dev/port
.SH AUTOR
Rik Faith (faith@cs.unc.edu)
