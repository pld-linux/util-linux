.\" {PTM/LK/0.1/10-10-1998/"wejd¼ do systemu"}
.\" T³umaczenie: 10-10-1998 £ukasz Kowalczyk (lukow@tempac.okwf.fuw.edu.pl)
.\" Copyright 1993 Rickard E. Faith (faith@cs.unc.edu)
.\" May be distributed under the GNU General Public License
.TH LOGIN 1 "4 listopada 1996" "Programy u¿ytkowe 1.6" "Instrukcja programisty Linuksa"
.SH NAZWA
login \- zalogowanie siê w systemie
.SH SK£ADNIA
.BR "login [ " nazwa " ]"
.br
.B "login \-p"
.br
.BR "login \-h " nazwa_serwera
.br
.BR "login \-f " nazwa
.SH OPIS
.B login
jest u¿ywany, aby dostaæ siê do systemu. Mo¿e byæ równie¿ u¿yty do
prze³±czania siê miêdzy ró¿nymi kontami (jednak wiêkszo¶æ nowoczesnych
shelli ma tê mo¿liwo¶æ wbudowan±).

Je¿eli nie podano ¿adnego argumentu,
.B login
prosi o nazwê u¿ytkownika.

Je¿eli u¿ytkownik nie jest super-userem (rootem) oraz istnieje plik
.IR /etc/nologin ,
wypisywana jest zawarto¶æ tego pliku i proces logowania jest koñczony
(pora¿k±). Ten sposób jest zwykle u¿ywany podczas wy³±czania systemu.

Je¿eli danego u¿ytkownika dotycz± ograniczenia opisane w pliku
.IR /etc/usertty ,
musz± byæ spe³nione ich warunki; w przeciwnym wypadku wstêp do systemu
zostanie uniemo¿liwiony i odpowiedni komunikat zostanie umieszczony w logu
systemowym. Zajrzyj do sekcji "Special Access Restrictions".

Je¿eli u¿ytkownik jest super-userem, zalogowanie mo¿e doj¶æ do skutku tylko
z jednej z konsol wymienionych w pliku
.IR /etc/securetty .
Nieudane próby zalogowania siê bêd± notowane za pomoc± funkcji
.BR syslog .

Po sprawdzeniu tych warunków, sprawdzone zostanie has³o (je¿eli jest
wymagane dla danego u¿ytkownika). Mo¿liwych jest dziesiêæ prób, ale po
pierwszych trzech kolejne ¿±dania pojawiaj± siê po odczekaniu pewnego czasu.
Nieudane próby zalogowania s± notowane funkcj±
.BR syslog .
Notowane s± równie¿ udane logowania super-usera.

Je¿eli istnieje plik
.IR .hushlogin ,
wówczas wykonywane jest "ciche" logowanie do systemu, czyli nie jest
sprawdzana skrzynka pocztowa, nie jest wypisywany czas poprzedniego
zalogowania oraz wiadomo¶æ dnia (message of the day). W przeciwnym wypadku,
je¿eli istnieje plik
.IR /var/log/lastlog ,
wypisywany jest czas poprzedniego zalogowania oraz zapisywany jest czas
bie¿±cego loginu.

Wykonywane s± rozmaite zadania administracyjne takie, jak ustawianie numerów
UID oraz GID terminala (tty). Zachowywana jest zmienna ¶rodowiskowa TERM,
je¿eli istnieje. Inne zmienne s± zachowywane, je¿eli u¿yto opcji
.BR \-p .
Ustawiane s± nastêpnie zmienne HOME, PATH, SHELL, TERM, MAIL i LOGNAME.
Zmienna PATH dostaje domy¶ln± warto¶æ
.I /usr/local/bin:/bin:/usr/bin:.
dla zwyk³ego u¿ytkownika, lub
.I /sbin:/bin:/usr/sbin:/usr/bin
dla super-usera. Na koñcu, je¿eli logowanie nie jest "ciche", wypisywana
jest wiadomo¶æ dnia oraz sprawdzany jest plik o nazwie u¿ytkownika w katalogu
.IR /usr/spool/mail ;
je¿eli ma niezerow± d³ugo¶æ, wypisywana jest odpowiednia wiadomo¶æ ("You
have new mail" - przyp. t³um.).

Nastêpnie uruchamiany jest shell u¿ytkownika. Je¿eli w pliku
.B /etc/passwd 
u¿ytkownikowi nie jest przypisany ¿aden shell, u¿ywany jest wówczas
.BR /bin/sh .
Je¿eli w tym¿e pliku nie wymieniono nazwy katalogu domowego u¿ytkownika,
u¿ywany jest katalog g³ówny (/). W katalogu domowym jest poszukiwany plik 
.IR .hushlogin ,
wspomniany powy¿ej.
.SH OPCJE
.TP
.B \-p
U¿ywany przez 
.BR getty (8) ,
by 
.B login
nie usuwa³ zmiennych ¶rodowiskowych.
.TP
.B \-f
Opcja u¿ywana do ominiêcia drugiej autoryzacji u¿ytkownika. Ta opcja nie
dzia³a dla super-usera i wydaje siê nie dzia³aæ pod Linuksem.
.TP
.B \-h
Opcja u¿ywana przez inne serwery (np. 
.BR telnetd (8))
do przekazania nazwy zdalnego komputera programowi
.BR login ,
by mo¿na j± by³o umie¶ciæ w plikach utmp oraz wtmp. Tej opcji mo¿e u¿ywaæ
wy³acznie super-user.

.SH "WYJ¡TKOWE OGRANICZENIA DOSTÊPU"
W pliku
.I /etc/securetty
wymienione s± nazwy terminali, z których wy³±cznie mo¿e siê logowaæ
super-user. W ka¿dej linii podawana jest nazwa jednego urz±dzenia tty (bez
przedrostka /dev/). Je¿eli ten plik nie istnieje, super-user mo¿e siê
zalogowaæ z dowolnego terminala.

.PP
Plik
.I /etc/usertty
wprowadza dodatkowe ograniczenia dostêpu dla konkretnych u¿ytkowników.
Je¿eli ten plik nie istnieje, nie s± narzucane ¿adne dodatkowe ograniczenia
dostêpu. W pliku znajduj± siê kolejne sekcje. Istniej± ich trzy typy: 
CLASSES, GROUPS i USERS. 
Sekcja CLASSES definiuje klasy terminali i wzorce dla nazw serwerów. Sekcja
GROUPS definiuje dozwolone terminale i komputery w ramach grupy, natomiast
sekcja USERS definuje powy¿sze dla konkretnych u¿ytkowników.

.PP
D³ugo¶æ ¿adnej linii z tego pliku nie mo¿e przekroczyæ 255 znaków.
Komentarze zaczynaj± siê od znaku #; wszystkie znaki po # a¿ do koñca linii s±
ignorowane.

.PP
.SS "Sekcja CLASSES"
Sekcja CLASSES rozpoczyna siê s³owem CLASSES na pocz±tku linii (same wielkie
litery). Wszystkie kolejne linie do rozpoczêcia kolejnej sekcji lub do koñca
pliku sk³adaj± siê z sekwencji s³ów rozdzielonych spacjami lub tabulatorami.
Ka¿da linia definiuje klasê terminali i wzorzec nazwy serwera.

.PP
Pierwsze s³owo w linii staje siê wspóln± nazw± dla terminali i wzorców nazw
serwerów opisanych w dalszej czê¶ci linii. Wspólna nazwa mo¿e byæ u¿ywana
w nastêpuj±cych ni¿ej sekcjach GROUPS i USERS. ¯adna z takich nazw klas nie
mo¿e wyst±piæ w tre¶ci definicji klasy, by unikn±æ prób rekurencyjnego opisu
klas.
.PP
Przyk³adowa sekcja CLASSES:
.PP
.nf
.in +.5
CLASSES
mojaklasa1		tty1 tty2
mojaklasa2		tty3 @.foo.com
.in -.5
.fi
.PP
Definuje ona klasy
.I mojaklasa1
oraz
.I mojaklasa2
jako opis tre¶ci wystêpuj±cej po prawych stronach obu linijek.
.PP

.SS "Sekcja GROUPS"
Sekcja GROUPS definiuje terminale i serwery dozwolone dla grupy. Je¿eli
u¿ytkownik, zgodnie z plikami
.I /etc/passwd
i
.IR /etc/group ,
nale¿y do grupy oraz jego grupa jest wymieniona w sekcji GROUPS w pliku
.IR /etc/usertty ,
wówczas mo¿e siê zalogowaæ, je¿eli jest to dozwolone dla grupy.

.PP
Sekcja GROUPS rozpoczyna siê od s³owa GROUPS na pocz±tku linii (same wielkie
litery); ka¿da nastêpna linia sk³ada siê z ci±gu s³ów porodzielanych
spacjami lub tabulatorami. Pierwsze s³owo w linii jest nazw± grupy, a
nastêpne okre¶laj± terminale i serwery, z których cz³onkowie tej grupy maj±
dostêp. Mo¿e to wymagaæ u¿ycia klas zdefiniowanych w jednej z
poprzedzaj±cych sekcji CLASSES.
.PP
Przyk³adowa sekcja GROUPS.
.PP
.nf
.in +0.5
GROUPS
sys		tty1 @.bar.edu
stud		mojaklasa1 tty4
.in -0.5
.fi
.PP
Ten przyk³ad pozwala cz³onkom grupy
.I sys
logowaæ siê na terminalu tty1 z serwerów w domenie bar.edu. U¿ytkownicy
nale¿±cy do grupy
.I stud
mog± logowaæ siê z terminali/serwerów wymienionych w klasie mojaklasa1 lub z
terminala tty4.

.PP
.SS "Sekcja USERS"
Sekcja USERS rozpoczyna siê od s³owa USERS na pocz±tku linii (same wielkie
litery); ka¿da nastêpna linia sk³ada siê z ci±gu s³ów porodzielanych
spacjami lub tabulatorami. Pierwsze s³owo w linii jest nazw± u¿ytkownika,
któremu wolno logowaæ siê z terminali i serwerów wymienionych w dalszej
czê¶ci linii. Mo¿e to wymagaæ u¿ycia nazwy klasy zdefiniowanej w jednej z
poprzedzaj±cych sekcji CLASSES. Je¿eli na pocz±tku pliku nie ma nag³ówka,
pierwsza sekcja jest domy¶lnie sekcj± USERS.
.PP
Przyk³adowa sekcja USERS:
.PP
.nf
.in +0.5
USERS
zacho		tty1 @130.225.16.0/255.255.255.0
blue		tty3 mojaklasa2
.in -0.5
.fi
.PP
U¿ytkownik zacho mo¿e logowaæ siê tylko z terminala tty1 i z serwerów o
adresach IP w zakresie od 130.225.16.0 do 130.225.16.255. U¿ytkownik blue
mo¿e logowaæ siê z terminala tty3 oraz z terminali/serwerów wymienionych w
klasie mojaklasa2.
.PP
W sekcji USERS mo¿e wyst±piæ linia rozpoczynaj±ca siê od *. Taka definicja
bêdzie siê odnosi³a do wszystkich u¿ytkowników nie zdefiniowanych oddzielnie
w ¿adnej linii (domy¶lny u¿ytkownik).
.PP
Je¿eli u¿ytkownik odpowiada zarówno jednej z linii w sekcji USERS, jak i w
sekcji GROUPS, ma on dostêp do systemu z wszystkich terminali/serwerów
wymienionych w obydwu dotycz±cych go liniach.

.SS ¬ród³a
Definicje terminali i serwerów u¿ywane w specyfikacjach klas nazywane s±
¼ród³ami (origins). Opis ¼ród³a mo¿e mieæ jedn± z poni¿szych postaci:
.IP o 
Nazwa terminala bez przedrostka /dev/; na przyk³ad tty1 lub ttyS0.
.PP
.IP o
Ci±g @localhost, oznaczaj±cy, ¿e u¿ytkownik mo¿e siê po³±czyæ przez telnet
lub rlogin z lokalnego serwera do niego samego. Pozwala to równie¿ na
wykonywanie np. polecenia xterm -e /bin/login.
.PP
.IP o
Przyrostek z nazw± domeny, np. @.jaka¶.domena oznaczajacy, ¿e u¿ytkownik
mo¿e ³±czyæ siê przez rlogin/telnet z dowolnego serwera, którego nazwa domeny
koñczy siê na .jaka¶.domena.
.PP
.IP o
Zakres adresów IPv4, zapisany jako @x.x.x.x/y.y.y.y, gdzie x.x.x.x jest
adresem IP w zwyk³ej notacji (liczby dziesiêtne rozdzielone kropkami), a
y.y.y.y jest mask± bitow± w tej samej notacji okre¶laj±c±, które bity w
adresie nale¿y porównaæ z adresem zdalnego serwera. Na przyk³ad,
@130.225.16.0/255.255.254.0 oznacza, ¿e u¿ytkownik mo¿e siê ³±czyæ przez
rlogin/telnet z dowolnego serwera, które adres le¿y w zakresie 130.225.16.0 \-
130.225.17.255.
.PP
Ka¿de z powy¿szych ¼róde³ mo¿e byæ poprzedzone okre¶leniem czasu zgodnie z
nastêpuj±c± sk³adni±:
.PP
.nf
czas              ::= '[' <dzieñ-lub-godz> [':' <dzieñ-lub-godz>]* ']'
dzieñ             ::= 'mon' | 'tue' | 'wed' | 'thu' | 'fri' | 'sat' | 'sun'
godz              ::= '0' | '1' | ... | '23'
zakres_godzin     ::= <godz> | <godz> '\-' <godz>
dzieñ-lub-godzina ::= <dzieñ> | <zakres_godzin>
.fi
.PP
Na przyk³ad, ¼ród³o postaci [mon:tue:wed:thu:fri:8\-17]tty3 oznacza, ¿e
logowanie siê jest dozwolone od poniedzia³ku do pi±tku miêdzy godzin± 8:00,
a 17:59 na terminalu tty3. Widaæ równie¿, ¿e zakres godzin a\-b obejmuje
ca³y czas pomiêdzy a:00, a b:59. Pojedyncza godzina (np. 10) oznacza czas
pomiêdzy 10:00, a 10:59.
.PP
Nieokre¶lanie zakresu czasu przed terminalem/serwerem oznacza, ¿e logowanie
z tego ¼ród³a jest dozwolone w dowolnym momencie. Je¿eli okre¶lasz czas,
miej pewno¶æ, ¿e okre¶lasz zarówno zakres dni, jak i godzin (lub pojedyncz±
godzinê). W okre¶leniu czasu nie mog± siê znajdowaæ ¿adne bia³e spacje.
.PP
Je¿eli nie istnieje domy¶lny u¿ytkownik (*), u¿ytkownicy nie
wymienieni w ¿adnej z linii pliku
.I /etc/usertty
mog± siê logowaæ sk±dkolwiek, co odpowiada standardowemu zachowaniu siê
programu
.IR login .

.PP
.SH PLIKI
.nf
.I /var/run/utmp
.I /var/log/wtmp
.I /var/log/lastlog
.I /usr/spool/mail/*
.I /etc/motd
.I /etc/passwd
.I /etc/nologin
.I /etc/usertty
.I .hushlogin
.fi
.SH "ZOBACZ TAK¯E"
.BR init (8),
.BR getty (8),
.BR mail (1),
.BR passwd (1),
.BR passwd (5),
.BR environ (7),
.BR shutdown (8)
.SH PROBLEMY

Linux, w przeciwnieñstwie do innych systemów operacyjnych o drakoñskich
restrykcjach, nie sprawdza kwot dyskowych.

Nieudokumentowana opcja
.B \-r
z systemu BSD nie dzia³a. Mo¿e to byc wymagane przez niektóre programy
.BR rlogind "(8)."
.SH AUTOR
Program pochodzi od oryginalnej wersji BSD login 5.40 (9-5-89), 
której autorem by³ Michael Glad (glad@daimi.dk) (dla systemu HP-UX).
.br
DOstosowanie do Linuxa 0.12: Peter Orbaek (poe@daimi.aau.dk)
