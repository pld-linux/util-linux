.\" {PTM/PB/0.1/30-05-1999/"ustaw ró¿ne parametry urz±dzenia lp"}
.\" This file Copyright 1992 Michael K. Johnson (johnsonm@nigel.vnet.net)
.\" It may be distributed under the GNU Public License, version 2, or
.\" any higher version.  See section COPYING of the GNU Public license
.\" for conditions under which this file may be redistributed.
.\" $Id$
.TH tunelp 8 "26 Sierpieñ 1992" "Cohesive Systems" "Podrêcznik programisty linuxowego"
.SH NAZWA
tunelp \- ustaw ró¿ne parametry urz±dzenia lp
.SH SK£ADNIA
\fBtunelp\fP \fI<urz±dzenie>\fP [-i \fI<IRQ>\fP | -t \fI<TIME>\fP | -c \fI<CHARS>\fP | -w \fI<WAIT>\fP | -a [on|off] | -o [on|off] | -C [on|off] | -r | -s | -q [on|off] ]
.SH OPIS
\fBtunelp\fP ustawia ró¿ne parametry urz±dzeñ /dev/lp\fI?\fP, umo¿liwiaj±c
zrobienie z nich lepszego u¿ytku ni¿ standardowo (lub te¿ jakikoliwek
u¿ytek, je¶li drukarka bez tego nie chce dzia³aæ...) Bez parametrów, mówi
tylko, czy urz±dzenie u¿ywa przerwañ, czy nie, a je¶li tak, to których.
Z parametrami ustawia odpowiednio charakterystykê urz±dzenia. Parametry to:

-i \fI<IRQ>\fP jest numerem IRQ, którego u¿ywaæ dla danego portu
równoleg³ego. Je¶li jest to co¶ niezerowego, flagi -t i -c nie maj± efektu.
Je¶li twój port nie obs³uguje przerwañ, opcja ta powstrzyma drukowanie.
.B tunelp -i 0
odnawia bezprzerwaniow± obs³ugê drukarki i powinna ona wtedy znów dzia³aæ.
Je¶li twój port równoleg³y wspiera przerwania, to ich u¿ycie przyspieszy
pracê.

-t \fI<TIME>\fP jest ilo¶ci± czasu w jiffach, przez któr± sterownik czeka
je¶li drukarka nie przyjmuje znaku przez okre¶lon± liczbê prób, wskazanych
przez parametr -c. 10 jest warto¶ci± domy¶ln±. Je¶li chcesz jak najszybszego
drukowania i nie obchodzi ciê obci±¿enie systemu, mo¿esz ustawiæ tê warto¶æ
na zero. Je¶li nie obchodzi ciê, jak szybko pracuje drukarka, lub je¶li
drukujesz tekst na powolnej drukarce, to ustaw 500 (5 sekund). Warto¶æ ta
ogólnie powinna byæ ni¿sza przy drukowaniu grafiki ni¿ tekstu o wspó³czynnik
oko³o 10.

-c \fI<CHARS>\fP jest liczb± prób wydrukowania znaku na drukarce przed
za¶niêciem na okres -t \fI<TIME>\fP. Jedy yo livxbs prób pêtli, która
próbuje wys³aæ znak na drukarkê. 120 jest dobr± warto¶ci± dla wiêkszo¶ci
drukarek. Domy¶ln± warto¶ci± jest 250, poniewa¿ istniej± drukarki,
wymagaj±ce tak d³ugiej zw³oki, lecz mo¿esz to zmieniæ. Je¶li masz bardzo
szybk± drukarkê, jak np. HP laserjet 4, sens mo¿e mieæ warto¶æ 10. Je¶li
masz naprawdê star± drukarkê, mo¿esz t± warto¶æ jeszcze zwiêkszyæ.

Ustawienie -t \fI<TIME>\fP na 0 jest równoznaczne z ustawieniem -c 
\fI<CHARS>\fP na nieskoñczono¶æ.

-w \fI<WAIT>\fP jest licznikiem zajêtych pêtli dla sygna³u strobe. Podczas
gdy wiêkszo¶æ drukarek zdaje siê byæ w stanie pracowaæ z bardzo krótkim
strobe, niektóre drukarki wymagaj± d³u¿szego. Zwiêkszenie tej warto¶ci z
domy¶lnej 0 umo¿liwi drukowanie na tych drukarkach. Mo¿e to te¿ umo¿liwiæ
drukowanie na d³u¿szych kablach.

-a [on|off] Okre¶la to czy przerywaæ po b³êdzie drukarki -- domy¶lnie nie
przerywa siê. Je¶li siedzisz przy komputerze, to pewnie chcesz widzieæ b³±d
i go naprawiæ i pozwoliæ drukarce drukowaæ dalej. Z drugiej strony, je¶li
nie siedzisz, mo¿esz raczej chcieæ, by spooler zauwa¿y³, ¿e drukarka nie
jest gotowa i zakoñczy³ próby, wysy³aj±c list z informacj±. Wybór jest twój.

-o [on|off] Bardzo podobne do -a. Powoduje to, ¿e ka¿dy open(2) tego
urz±dzenia sprawdza, czy jest ono on-line i czy zg³asza jakie¶ b³êdy w
rodzaju braku papieru. Jest to prawid³owe ustawienie dla wiêkszo¶ci wersji
lpd.

-C [on|off] Opcja ta dodaje ekstra ("ostro¿ne") sprawdzanie b³êdów. Je¶li
opcja ta jest w³±czona, sterownik drukarki bêdzie upewnia³ siê, ¿e drukarka
jest on-line i nie zg³asza ¿adnych b³êdów braku papieru przed wysy³aniem do
niej danych. Jest to u¿yteczne dla drukarek, które normalnie przyjmuj± dane,
gdy s± wy³aczone.

-s Opcja ta zwraca obecny status drukarki, zarówno jako liczbê 0..225, jak i
jako listê aktywnych flag. Gdy ta opcja jest podana, implikowane jest -q
off, wy³±czaj±ce wy¶wietlanie bie¿±cego IRQ.

-o, -C, i -s wymagaj± j±dra Linuxa w wersji 1.1.76 lub pó¼niejszej.

-r Opcja ta resetuje port. Wymaga j±dra linuxa w wersji 1.1.80 lub
pó¼niejszej.

-q [on|off] Opcja ta w³±cza wy¶wietlanie bie¿±cego ustawienia IRQ.
