.\" {PTM/PB/0.1/20-06-1999/"zrzut ascii, dziesi�tny, �semkowy, szesnastkowy"}
.\"
.\" Nie jestem 1000%. pewien tego fragmentu o formatach, kt�re nie
.\" wype�niaj� ca�kowicie bloku...
.\"
.\" Copyright (c) 1989, 1990, 1993
.\"	The Regents of the University of California.  All rights reserved.
.\"
.\" Redistribution and use in source and binary forms, with or without
.\" modification, are permitted provided that the following conditions
.\" are met:
.\" 1. Redistributions of source code must retain the above copyright
.\"    notice, this list of conditions and the following disclaimer.
.\" 2. Redistributions in binary form must reproduce the above copyright
.\"    notice, this list of conditions and the following disclaimer in the
.\"    documentation and/or other materials provided with the distribution.
.\" 3. All advertising materials mentioning features or use of this software
.\"    must display the following acknowledgement:
.\"	This product includes software developed by the University of
.\"	California, Berkeley and its contributors.
.\" 4. Neither the name of the University nor the names of its contributors
.\"    may be used to endorse or promote products derived from this software
.\"    without specific prior written permission.
.\"
.\" THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
.\" ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
.\" IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
.\" ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
.\" FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
.\" DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
.\" OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
.\" HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
.\" LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
.\" OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
.\" SUCH DAMAGE.
.\"
.\"	@(#)hexdump.1	8.2 (Berkeley) 4/18/94
.\"
.Dd April 18, 1994
.Dt HEXDUMP 1
.Os
.Sh NAZWA
.Nm hexdump
.Nd zrzut ascii, dziesi�tny, szesnastkowy, �semkowy
.Sh SK�ADNIA
.Nm hexdump
.Op Fl bcdovx
.Op Fl e Ar string_formatu
.Op Fl f Ar plik_formatu
.Op Fl n Ar d�ugo��
.Bk -words
.Op Fl s Ar pomi�
.Ek
.Ar plik  ...
.Sh OPIS
Narz�dzie hexdump jest filtrem, kt�ry wy�wietla podane pliki, lub
standardowe wej�cie, je�li nie podano plik�w, u�ywaj�c do tego celu podanego
przez u�ytkownika formatu.
.Pp
Opcje s� nast�puj�ce
.Bl -tag -width Fl
.It Fl b
.Em Jednobajtowe wy�wietlanie �semkowe .
Wy�wietl szesnastkowo offset wej�ciowy, a za nim szesna�cie,
tr�jkolumnowych, oddzielonych spacjami, wype�nionych zerami bajt�w
wej�ciowych w formacie �semkowym.
.It Fl c
.Em Jednobajtowe wy�wietlanie znakowe .
Wy�wietl szesnastkowo offset wej�ciowy, a za nim szesna�cie,
tr�jkolumnowych, oddzielonych spacjami bajt�w w formacie ascii.
.It Fl d
.Em Dwubajtowe wy�wietlanie dziesi�tne.
Wy�wietl szesnastkowo offset wej�ciowy, a za nim osiem, pi�ciokolumnowych,
oddzielonych spacjami, wype�nionych zerami jednostek dwubajtowych,
zawieraj�cych dane wej�ciowe, w formacie dziesi�tnym.
.It Fl e Ar string_formatu
Podaje string formatuj�cy, kt�rego u�y� do wy�wietlania danych.
.It Fl f Ar plik_formatu
Podaje plik, kt�ry zawiera jeden, lub wi�cej, oddzielonych now� lini�
string�w formatuj�cych. Puste linie, oraz linie zaczynaj�ce si� od krzy�yka
.Pf ( Cm \&# )
s� ignorowane.
.It Fl n Ar d�ugo��
Interpretuj tylko
.Ar d�ugo��
bajt�w wej�cia.
.It Fl o
.Em Dwubajtowe wy�wietlanie �semkowe .
Wy�wietl szesnastkowo offset wej�ciowy, a za nim osiem szeciokolumnowych,
oddzielonych spacjami, wype�nionych zerami, dwubajtowych fragment�w danych
wej�ciowych, w formacie �semkowym.
.It Fl s Ar offset 
Pomi�
.Ar offset
bajt�w, licz�c od pocz�tku wej�cia.
Domy�lnie 
.Ar offset
jest interpretowany jako liczba dziesi�tna.
Po poprzedzeniu go przedrostkiem
.Cm 0x
lub
.Cm 0X ,
jest interpretowany jako liczba szesnastkowa, a je�li jest poprzedzony
prowadz�cym
.Cm 0 ,
to jest interpretowany jako liczba �semkowa.
Do��czenie do offsetu znaku
.Cm b ,
.Cm k ,
lub
.Cm m
powoduje, �e jest on interpretowany jako wielokrotno�� odpowiednio
.Li 512 ,
.Li 1024 ,
lub
.Li 1048576 .
.It Fl v
Opcja
.Fl v
Powoduje wy�wietlenie zrzutu wszystkich danych wej�ciowych.
Bez opcji
.Fl v ,
dowolna liczba grup linii wyj�ciowych, kt�ra b�dzie identyczna z
bezpo�rednio poprzedzaj�c� grup� linii (poza offsetami wej�ciowymi), b�dzie
zamieniana lini� z gwiazdk�.
.It Fl x
.Em Dwubajtowe wy�wietlanie szesnastkowe .
Wy�wietl szesnastkowo offset wej�ciowy, a za nim osiem, oddzielonych
spacjami, czterokolumnowych, wype�nionych zerami, dwubajtowych fragment�w
danych wej�ciowych, w formacie szesnastkowym.
.El
.Pp
Dla ka�dego pliku wej�ciowego
.Nm hexdump
kopiuje dane wej�ciowe na standardowe wyj�cie, przekszta�caj�c dane wed�ug
string�w formatuj�cych, podanych w opcjach
.Fl e
i
.Fl f ,
w wypadku gdy by�y one podane.
.Ss Formaty
String formatuj�cy sk�ada si� z dowolnej ilo�ci jednostek formatuj�cych,
oddzielonych bia�� spacj�.
Jednostka formatuj�ca sk�ada si� z maksymalnie trzech element�w: licznika
iteracji, licznika bajt�w i formatu.
.Pp
Licznik iteracji jest opcjonaln� dodatni� liczb� ca�kowit�, kt�rej warto��
domy�lna to jeden.
Ka�dy format jest za��czany tyle razy, ile wskazano w liczniku iteracji.
.Pp
Licznik bajt�w jest opcjonaln� dodatni� liczb� ca�kowit�. Je�li zostanie
podana, to definiuje liczb� bajt�w, kt�re nale�y zinterpretowa� w ka�dej
iteracji formatu.
.Pp
Je�li podano licznik iteracji i/lub bajt�w, to po liczniku iteracji i/lub
przed licznikiem bajt�w trzeba umie�ci� slash, aby m�c je rozr�ni�.
Bia�e spacje przed slashem s� ignorowane.
.Pp
Format jest cz�ci� wymagan� i musi by� uj�ty w podw�jne cudzys�owy
(" ").
Jest on interpretowany jak string formatuj�cy fprintf (zobacz
.Xr fprintf 3 ) ,
lecz z nast�puj�cymi wyj�tkami:
.Bl -bullet -offset indent
.It
Gwiazdka (*) nie mo�e by� u�ywana do okre�lania precyzji, lub szeroko�ci
pola.
.It
Liczba bajt�w, lub dok�adno�� pola 
.Em jest
wymagana dla ka�dego znaku konwersji ``s'' (w przeciwie�stwie do
.Xr fprintf 3
gdzie domy�lnie, bez podanej precyzji, drukowany jest ca�y string).
.It
Znaki konwersji ``h'', ``l'', ``n'', ``p'' i ``q'' nie 
s� obs�ugiwane.
.It
Obs�ugiwane s� nast�puj�ce sekwencje eskejpowe pojedynczych znak�w, opisane
w standardzie C:
.Bd -ragged -offset indent -compact
.Bl -column <alert_character>
.It NUL	\e0
.It <alert character>	\ea
.It <backspace>	\eb
.It <form-feed>	\ef
.It <newline>	\en
.It <carriage return>	\er
.It <tab>	\et
.It <vertical tab>	\ev
.El
.Ed
.El
.Pp
Hexdump obs�uguje r�wnie� nast�puj�ce dodatkowe stringi konwersji:
.Bl -tag -width Fl
.It Cm \&_a Ns Op Cm dox 
Wy�wietl offset wej�ciowy, kumuluj�cy si� na przestrzeni plik�w wej�ciowych,
wskazuj�cy nast�pny wy�wietlany bajt.
Dodane znaki
.Cm d ,
.Cm o ,
i
.Cm x
wskazuj� format wy�wietlenia jako dziesi�tny, �semkowy, lub szesnastkowy.
.It Cm \&_A Ns Op Cm dox 
Identyczne ze stringiem konwersji
.Cm \&_a
z t� tylko r�nic�, �e jest dokonywane tylko raz, po przetworzeniu
wszystkich danych wej�ciowych.
.It Cm \&_c
Drukuj znaki z domy�lnego zestawu znak�w.
Niedrukowalne znaki s� wy�wietlane w tr�jznakowych, wype�nionych zerami
sekwencjach �semkowych, poza tymi, kt�re s� reprezentowane standardow�
notacj� eskejpow� (patrz wy�ej), kt�re s� wy�wietlane jako stringi znakowe.
.It Cm _p
Drukuj znaki z domy�lnego zestawu znak�w. Niedrukowane znaki s� wy�wietlane
jako pojedyncza kropka
.Dq Cm \&. .
.It Cm _u
Wy�wietlaj znaki US-ASCII, za wyj�tkiem znak�w steruj�cych, kt�re s�
wy�wietlane w nast�puj�cych okre�leniach.
Znaki wi�ksze ni� 0xff, s� wy�wietlane jako stringi szesnastkowe.
.Bl -column \&000_nu \&001_so \&002_st \&003_et \&004_eo
.It \&000\ nul\t001\ soh\t002\ stx\t003\ etx\t004\ eot\t005\ enq
.It \&006\ ack\t007\ bel\t008\ bs\t009\ ht\t00A\ lf\t00B\ vt
.It \&00C\ ff\t00D\ cr\t00E\ so\t00F\ si\t010\ dle\t011\ dc1
.It \&012\ dc2\t013\ dc3\t014\ dc4\t015\ nak\t016\ syn\t017\ etb
.It \&018\ can\t019\ em\t01A\ sub\t01B\ esc\t01C\ fs\t01D\ gs
.It \&01E\ rs\t01F\ us\t0FF\ del
.El
.El
.Pp
Domy�lne i wspierane liczniki bajt�w dla znak�w konwersji s� nast�puj�ce:
.Bl -tag -width  "Xc,_Xc,_Xc,_Xc,_Xc,_Xc" -offset indent
.It Li \&%_c , \&%_p , \&%_u , \&%c
Tylko liczniki jednobajtowe.
.It Xo
.Li \&%d , \&%i , \&%o ,
.Li \&%u , \&%X , \&%x 
.Xc
Domy�lnie cztery bajty, wspierane s� te� liczniki jedno i dwubajtowe.
.It Xo
.Li \&%E , \&%e , \&%f ,
.Li \&%G , \&%g 
.Xc
Domy�lnie osiem bajt�w, wspierane s� te� liczniki czterobajtowe.
.El
.Pp
Ilo�� danych, interpretowanych przez ka�dy string formatuj�cy jest sum�
danych wymaganych przez ka�d� jednostk� formatuj�c�, kt�ra jest obliczana
jako iteracja razy licznik bajt�w.
.Pp
Wej�cie jest obs�ugiwane w ``blokach'', gdzie blok jest zdefiniowany jako
najwi�ksza porcja danych, podanych przez dowolny ze string�w formatuj�cych.
Stringi formatuj�ce, kt�re interpretuj� mniej danych ni� zawartych jest w
bloku wej�ciowym, w kt�rym ostatnia jednostka formatuj�ca interpretuje pewn�
liczb� bajt�w i nie ma ustawionego okre�lonwego licznka iteracji, maj�
zwi�kszany licznik iteracji, a� ca�y blok nie zostanie przetworzony, lub a�
zabraknie danych do zadowolenia stringu formatuj�cego.
.Pp
Je�li w wyniku specyfikacji u�ytkownika, lub modyfikacji licznika iteracji
przez hexdump, licznik iteracji jest wi�kszy ni� jeden, to podczas ostatniej
iteracji nie s� wy�wietlane ko�cowe bia�e spacje.
.Pp
B��dem jest podawanie licznika bajt�w razem z wieloma znakami/stringami
konwersji, chyba �e wszystkie poza jednym znakiem/stringiem konwersji s�
.Cm \&_a
lub
.Cm \&_A .
.Pp
Je�li w wyniku podania opcji
.Fl n
osi�gni�ty zostanie EOF, dane wej�ciowe zadowol� string formatuj�cy tylko
cz�ciowo, blok wej�ciowy jest wype�niony zerami, wystarczaj�co aby
wy�wietli� wszystkie dost�pne dane (np. wszystkie jednostki formatuj�ce,
zachodz�ce za koniec danych b�d� wy�wietla�y jak�� liczb� bajt�w zera).
.Pp
Dalsze wyj�cie takich string�w formatuj�cych jest zamieniane odpowiadaj�c�
ilo�ci� spacji. Odpowiadaj�ca ilo�� spacji jest zdefiniowana jako liczba
wyj�cia spacji przez znak konwersji
.Cm s
z tym samym polem i precyzj� co oryginalny znak konwersji, lub string
konwersji, lecz z usuni�tymi wszelkimi znakami flag
.Dq Li \&+ ,
.Dq \&\ \& ,
.Dq Li \&#
i wskazuj�cym na string NULL.
.Pp
Je�li nie podano string�w formatuj�cych, domy�lne wy�wietlanie jest
r�wnowa�ne podaniu opcji
.Fl x .
.Pp
.Nm hexdump
ko�czy dzia�anie z kodem zera po sukcesie i wi�kszym od zera po b��dzie.
.Sh PRZYK�ADY
Wy�wietl wyj�cie w przestudiowanym formacie:
.Bd -literal -offset indent
"%06.6_ao "  12/1 "%3_u "
"\et\et" "%_p "
"\en"
.Ed
.Pp
Implementuj opcj� \-x:
.Bd -literal -offset indent
"%07.7_Ax\en"
"%07.7_ax  " 8/2 "%04x " "\en"
.Ed
.Sh ZOBACZ TAK�E
.Xr adb 1
