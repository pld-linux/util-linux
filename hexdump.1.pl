.\" {PTM/PB/0.1/20-06-1999/"zrzut ascii, dziesiêtny, ósemkowy, szesnastkowy"}
.\"
.\" Nie jestem 1000%. pewien tego fragmentu o formatach, które nie
.\" wype³niaj± ca³kowicie bloku...
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
.Nd zrzut ascii, dziesiêtny, szesnastkowy, ósemkowy
.Sh SK£ADNIA
.Nm hexdump
.Op Fl bcdovx
.Op Fl e Ar string_formatu
.Op Fl f Ar plik_formatu
.Op Fl n Ar d³ugo¶æ
.Bk -words
.Op Fl s Ar pomiñ
.Ek
.Ar plik  ...
.Sh OPIS
Narzêdzie hexdump jest filtrem, który wy¶wietla podane pliki, lub
standardowe wej¶cie, je¶li nie podano plików, u¿ywaj±c do tego celu podanego
przez u¿ytkownika formatu.
.Pp
Opcje s± nastêpuj±ce
.Bl -tag -width Fl
.It Fl b
.Em Jednobajtowe wy¶wietlanie ósemkowe .
Wy¶wietl szesnastkowo offset wej¶ciowy, a za nim szesna¶cie,
trójkolumnowych, oddzielonych spacjami, wype³nionych zerami bajtów
wej¶ciowych w formacie ósemkowym.
.It Fl c
.Em Jednobajtowe wy¶wietlanie znakowe .
Wy¶wietl szesnastkowo offset wej¶ciowy, a za nim szesna¶cie,
trójkolumnowych, oddzielonych spacjami bajtów w formacie ascii.
.It Fl d
.Em Dwubajtowe wy¶wietlanie dziesiêtne.
Wy¶wietl szesnastkowo offset wej¶ciowy, a za nim osiem, piêciokolumnowych,
oddzielonych spacjami, wype³nionych zerami jednostek dwubajtowych,
zawieraj±cych dane wej¶ciowe, w formacie dziesiêtnym.
.It Fl e Ar string_formatu
Podaje string formatuj±cy, którego u¿yæ do wy¶wietlania danych.
.It Fl f Ar plik_formatu
Podaje plik, który zawiera jeden, lub wiêcej, oddzielonych now± lini±
stringów formatuj±cych. Puste linie, oraz linie zaczynaj±ce siê od krzy¿yka
.Pf ( Cm \&# )
s± ignorowane.
.It Fl n Ar d³ugo¶æ
Interpretuj tylko
.Ar d³ugo¶æ
bajtów wej¶cia.
.It Fl o
.Em Dwubajtowe wy¶wietlanie ósemkowe .
Wy¶wietl szesnastkowo offset wej¶ciowy, a za nim osiem szeciokolumnowych,
oddzielonych spacjami, wype³nionych zerami, dwubajtowych fragmentów danych
wej¶ciowych, w formacie ósemkowym.
.It Fl s Ar offset 
Pomiñ
.Ar offset
bajtów, licz±c od pocz±tku wej¶cia.
Domy¶lnie 
.Ar offset
jest interpretowany jako liczba dziesiêtna.
Po poprzedzeniu go przedrostkiem
.Cm 0x
lub
.Cm 0X ,
jest interpretowany jako liczba szesnastkowa, a je¶li jest poprzedzony
prowadz±cym
.Cm 0 ,
to jest interpretowany jako liczba ósemkowa.
Do³±czenie do offsetu znaku
.Cm b ,
.Cm k ,
lub
.Cm m
powoduje, ¿e jest on interpretowany jako wielokrotno¶æ odpowiednio
.Li 512 ,
.Li 1024 ,
lub
.Li 1048576 .
.It Fl v
Opcja
.Fl v
Powoduje wy¶wietlenie zrzutu wszystkich danych wej¶ciowych.
Bez opcji
.Fl v ,
dowolna liczba grup linii wyj¶ciowych, która bêdzie identyczna z
bezpo¶rednio poprzedzaj±c± grup± linii (poza offsetami wej¶ciowymi), bêdzie
zamieniana lini± z gwiazdk±.
.It Fl x
.Em Dwubajtowe wy¶wietlanie szesnastkowe .
Wy¶wietl szesnastkowo offset wej¶ciowy, a za nim osiem, oddzielonych
spacjami, czterokolumnowych, wype³nionych zerami, dwubajtowych fragmentów
danych wej¶ciowych, w formacie szesnastkowym.
.El
.Pp
Dla ka¿dego pliku wej¶ciowego
.Nm hexdump
kopiuje dane wej¶ciowe na standardowe wyj¶cie, przekszta³caj±c dane wed³ug
stringów formatuj±cych, podanych w opcjach
.Fl e
i
.Fl f ,
w wypadku gdy by³y one podane.
.Ss Formaty
String formatuj±cy sk³ada siê z dowolnej ilo¶ci jednostek formatuj±cych,
oddzielonych bia³± spacj±.
Jednostka formatuj±ca sk³ada siê z maksymalnie trzech elementów: licznika
iteracji, licznika bajtów i formatu.
.Pp
Licznik iteracji jest opcjonaln± dodatni± liczb± ca³kowit±, której warto¶æ
domy¶lna to jeden.
Ka¿dy format jest za³±czany tyle razy, ile wskazano w liczniku iteracji.
.Pp
Licznik bajtów jest opcjonaln± dodatni± liczb± ca³kowit±. Je¶li zostanie
podana, to definiuje liczbê bajtów, które nale¿y zinterpretowaæ w ka¿dej
iteracji formatu.
.Pp
Je¶li podano licznik iteracji i/lub bajtów, to po liczniku iteracji i/lub
przed licznikiem bajtów trzeba umie¶ciæ slash, aby móc je rozró¿niæ.
Bia³e spacje przed slashem s± ignorowane.
.Pp
Format jest czê¶ci± wymagan± i musi byæ ujêty w podwójne cudzys³owy
(" ").
Jest on interpretowany jak string formatuj±cy fprintf (zobacz
.Xr fprintf 3 ) ,
lecz z nastêpuj±cymi wyj±tkami:
.Bl -bullet -offset indent
.It
Gwiazdka (*) nie mo¿e byæ u¿ywana do okre¶lania precyzji, lub szeroko¶ci
pola.
.It
Liczba bajtów, lub dok³adno¶æ pola 
.Em jest
wymagana dla ka¿dego znaku konwersji ``s'' (w przeciwieñstwie do
.Xr fprintf 3
gdzie domy¶lnie, bez podanej precyzji, drukowany jest ca³y string).
.It
Znaki konwersji ``h'', ``l'', ``n'', ``p'' i ``q'' nie 
s± obs³ugiwane.
.It
Obs³ugiwane s± nastêpuj±ce sekwencje eskejpowe pojedynczych znaków, opisane
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
Hexdump obs³uguje równie¿ nastêpuj±ce dodatkowe stringi konwersji:
.Bl -tag -width Fl
.It Cm \&_a Ns Op Cm dox 
Wy¶wietl offset wej¶ciowy, kumuluj±cy siê na przestrzeni plików wej¶ciowych,
wskazuj±cy nastêpny wy¶wietlany bajt.
Dodane znaki
.Cm d ,
.Cm o ,
i
.Cm x
wskazuj± format wy¶wietlenia jako dziesiêtny, ósemkowy, lub szesnastkowy.
.It Cm \&_A Ns Op Cm dox 
Identyczne ze stringiem konwersji
.Cm \&_a
z t± tylko ró¿nic±, ¿e jest dokonywane tylko raz, po przetworzeniu
wszystkich danych wej¶ciowych.
.It Cm \&_c
Drukuj znaki z domy¶lnego zestawu znaków.
Niedrukowalne znaki s± wy¶wietlane w trójznakowych, wype³nionych zerami
sekwencjach ósemkowych, poza tymi, które s± reprezentowane standardow±
notacj± eskejpow± (patrz wy¿ej), które s± wy¶wietlane jako stringi znakowe.
.It Cm _p
Drukuj znaki z domy¶lnego zestawu znaków. Niedrukowane znaki s± wy¶wietlane
jako pojedyncza kropka
.Dq Cm \&. .
.It Cm _u
Wy¶wietlaj znaki US-ASCII, za wyj±tkiem znaków steruj±cych, które s±
wy¶wietlane w nastêpuj±cych okre¶leniach.
Znaki wiêksze ni¿ 0xff, s± wy¶wietlane jako stringi szesnastkowe.
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
Domy¶lne i wspierane liczniki bajtów dla znaków konwersji s± nastêpuj±ce:
.Bl -tag -width  "Xc,_Xc,_Xc,_Xc,_Xc,_Xc" -offset indent
.It Li \&%_c , \&%_p , \&%_u , \&%c
Tylko liczniki jednobajtowe.
.It Xo
.Li \&%d , \&%i , \&%o ,
.Li \&%u , \&%X , \&%x 
.Xc
Domy¶lnie cztery bajty, wspierane s± te¿ liczniki jedno i dwubajtowe.
.It Xo
.Li \&%E , \&%e , \&%f ,
.Li \&%G , \&%g 
.Xc
Domy¶lnie osiem bajtów, wspierane s± te¿ liczniki czterobajtowe.
.El
.Pp
Ilo¶æ danych, interpretowanych przez ka¿dy string formatuj±cy jest sum±
danych wymaganych przez ka¿d± jednostk± formatuj±c±, która jest obliczana
jako iteracja razy licznik bajtów.
.Pp
Wej¶cie jest obs³ugiwane w ``blokach'', gdzie blok jest zdefiniowany jako
najwiêksza porcja danych, podanych przez dowolny ze stringów formatuj±cych.
Stringi formatuj±ce, które interpretuj± mniej danych ni¿ zawartych jest w
bloku wej¶ciowym, w którym ostatnia jednostka formatuj±ca interpretuje pewn±
liczbê bajtów i nie ma ustawionego okre¶lonwego licznka iteracji, maj±
zwiêkszany licznik iteracji, a¿ ca³y blok nie zostanie przetworzony, lub a¿
zabraknie danych do zadowolenia stringu formatuj±cego.
.Pp
Je¶li w wyniku specyfikacji u¿ytkownika, lub modyfikacji licznika iteracji
przez hexdump, licznik iteracji jest wiêkszy ni¿ jeden, to podczas ostatniej
iteracji nie s± wy¶wietlane koñcowe bia³e spacje.
.Pp
B³êdem jest podawanie licznika bajtów razem z wieloma znakami/stringami
konwersji, chyba ¿e wszystkie poza jednym znakiem/stringiem konwersji s±
.Cm \&_a
lub
.Cm \&_A .
.Pp
Je¶li w wyniku podania opcji
.Fl n
osi±gniêty zostanie EOF, dane wej¶ciowe zadowol± string formatuj±cy tylko
czê¶ciowo, blok wej¶ciowy jest wype³niony zerami, wystarczaj±co aby
wy¶wietliæ wszystkie dostêpne dane (np. wszystkie jednostki formatuj±ce,
zachodz±ce za koniec danych bêd± wy¶wietla³y jak±¶ liczbê bajtów zera).
.Pp
Dalsze wyj¶cie takich stringów formatuj±cych jest zamieniane odpowiadaj±c±
ilo¶ci± spacji. Odpowiadaj±ca ilo¶æ spacji jest zdefiniowana jako liczba
wyj¶cia spacji przez znak konwersji
.Cm s
z tym samym polem i precyzj± co oryginalny znak konwersji, lub string
konwersji, lecz z usuniêtymi wszelkimi znakami flag
.Dq Li \&+ ,
.Dq \&\ \& ,
.Dq Li \&#
i wskazuj±cym na string NULL.
.Pp
Je¶li nie podano stringów formatuj±cych, domy¶lne wy¶wietlanie jest
równowa¿ne podaniu opcji
.Fl x .
.Pp
.Nm hexdump
koñczy dzia³anie z kodem zera po sukcesie i wiêkszym od zera po b³êdzie.
.Sh PRZYK£ADY
Wy¶wietl wyj¶cie w przestudiowanym formacie:
.Bd -literal -offset indent
"%06.6_ao "  12/1 "%3_u "
"\et\et" "%_p "
"\en"
.Ed
.Pp
Implementuj opcjê \-x:
.Bd -literal -offset indent
"%07.7_Ax\en"
"%07.7_ax  " 8/2 "%04x " "\en"
.Ed
.Sh ZOBACZ TAK¯E
.Xr adb 1
