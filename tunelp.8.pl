.\" {PTM/PB/0.1/30-05-1999/"ustaw r�ne parametry urz�dzenia lp"}
.\" This file Copyright 1992 Michael K. Johnson (johnsonm@nigel.vnet.net)
.\" It may be distributed under the GNU Public License, version 2, or
.\" any higher version.  See section COPYING of the GNU Public license
.\" for conditions under which this file may be redistributed.
.\" $Id$
.TH tunelp 8 "26 Sierpie� 1992" "Cohesive Systems" "Podr�cznik programisty linuxowego"
.SH NAZWA
tunelp \- ustaw r�ne parametry urz�dzenia lp
.SH SK�ADNIA
\fBtunelp\fP \fI<urz�dzenie>\fP [-i \fI<IRQ>\fP | -t \fI<TIME>\fP | -c \fI<CHARS>\fP | -w \fI<WAIT>\fP | -a [on|off] | -o [on|off] | -C [on|off] | -r | -s | -q [on|off] ]
.SH OPIS
\fBtunelp\fP ustawia r�ne parametry urz�dze� /dev/lp\fI?\fP, umo�liwiaj�c
zrobienie z nich lepszego u�ytku ni� standardowo (lub te� jakikoliwek
u�ytek, je�li drukarka bez tego nie chce dzia�a�...) Bez parametr�w, m�wi
tylko, czy urz�dzenie u�ywa przerwa�, czy nie, a je�li tak, to kt�rych.
Z parametrami ustawia odpowiednio charakterystyk� urz�dzenia. Parametry to:

-i \fI<IRQ>\fP jest numerem IRQ, kt�rego u�ywa� dla danego portu
r�wnoleg�ego. Je�li jest to co� niezerowego, flagi -t i -c nie maj� efektu.
Je�li tw�j port nie obs�uguje przerwa�, opcja ta powstrzyma drukowanie.
.B tunelp -i 0
odnawia bezprzerwaniow� obs�ug� drukarki i powinna ona wtedy zn�w dzia�a�.
Je�li tw�j port r�wnoleg�y wspiera przerwania, to ich u�ycie przyspieszy
prac�.

-t \fI<TIME>\fP jest ilo�ci� czasu w jiffach, przez kt�r� sterownik czeka
je�li drukarka nie przyjmuje znaku przez okre�lon� liczb� pr�b, wskazanych
przez parametr -c. 10 jest warto�ci� domy�ln�. Je�li chcesz jak najszybszego
drukowania i nie obchodzi ci� obci��enie systemu, mo�esz ustawi� t� warto��
na zero. Je�li nie obchodzi ci�, jak szybko pracuje drukarka, lub je�li
drukujesz tekst na powolnej drukarce, to ustaw 500 (5 sekund). Warto�� ta
og�lnie powinna by� ni�sza przy drukowaniu grafiki ni� tekstu o wsp�czynnik
oko�o 10.

-c \fI<CHARS>\fP jest liczb� pr�b wydrukowania znaku na drukarce przed
za�ni�ciem na okres -t \fI<TIME>\fP. Jedy yo livxbs pr�b p�tli, kt�ra
pr�buje wys�a� znak na drukark�. 120 jest dobr� warto�ci� dla wi�kszo�ci
drukarek. Domy�ln� warto�ci� jest 250, poniewa� istniej� drukarki,
wymagaj�ce tak d�ugiej zw�oki, lecz mo�esz to zmieni�. Je�li masz bardzo
szybk� drukark�, jak np. HP laserjet 4, sens mo�e mie� warto�� 10. Je�li
masz naprawd� star� drukark�, mo�esz t� warto�� jeszcze zwi�kszy�.

Ustawienie -t \fI<TIME>\fP na 0 jest r�wnoznaczne z ustawieniem -c 
\fI<CHARS>\fP na niesko�czono��.

-w \fI<WAIT>\fP jest licznikiem zaj�tych p�tli dla sygna�u strobe. Podczas
gdy wi�kszo�� drukarek zdaje si� by� w stanie pracowa� z bardzo kr�tkim
strobe, niekt�re drukarki wymagaj� d�u�szego. Zwi�kszenie tej warto�ci z
domy�lnej 0 umo�liwi drukowanie na tych drukarkach. Mo�e to te� umo�liwi�
drukowanie na d�u�szych kablach.

-a [on|off] Okre�la to czy przerywa� po b��dzie drukarki -- domy�lnie nie
przerywa si�. Je�li siedzisz przy komputerze, to pewnie chcesz widzie� b��d
i go naprawi� i pozwoli� drukarce drukowa� dalej. Z drugiej strony, je�li
nie siedzisz, mo�esz raczej chcie�, by spooler zauwa�y�, �e drukarka nie
jest gotowa i zako�czy� pr�by, wysy�aj�c list z informacj�. Wyb�r jest tw�j.

-o [on|off] Bardzo podobne do -a. Powoduje to, �e ka�dy open(2) tego
urz�dzenia sprawdza, czy jest ono on-line i czy zg�asza jakie� b��dy w
rodzaju braku papieru. Jest to prawid�owe ustawienie dla wi�kszo�ci wersji
lpd.

-C [on|off] Opcja ta dodaje ekstra ("ostro�ne") sprawdzanie b��d�w. Je�li
opcja ta jest w��czona, sterownik drukarki b�dzie upewnia� si�, �e drukarka
jest on-line i nie zg�asza �adnych b��d�w braku papieru przed wysy�aniem do
niej danych. Jest to u�yteczne dla drukarek, kt�re normalnie przyjmuj� dane,
gdy s� wy�aczone.

-s Opcja ta zwraca obecny status drukarki, zar�wno jako liczb� 0..225, jak i
jako list� aktywnych flag. Gdy ta opcja jest podana, implikowane jest -q
off, wy��czaj�ce wy�wietlanie bie��cego IRQ.

-o, -C, i -s wymagaj� j�dra Linuxa w wersji 1.1.76 lub p�niejszej.

-r Opcja ta resetuje port. Wymaga j�dra linuxa w wersji 1.1.80 lub
p�niejszej.

-q [on|off] Opcja ta w��cza wy�wietlanie bie��cego ustawienia IRQ.
