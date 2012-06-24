.\" {PTM/LK/0.1/10-10-1998/"wejd� do systemu"}
.\" T�umaczenie: 10-10-1998 �ukasz Kowalczyk (lukow@tempac.okwf.fuw.edu.pl)
.\" Copyright 1993 Rickard E. Faith (faith@cs.unc.edu)
.\" May be distributed under the GNU General Public License
.TH LOGIN 1 "4 listopada 1996" "Programy u�ytkowe 1.6" "Instrukcja programisty Linuksa"
.SH NAZWA
login \- zalogowanie si� w systemie
.SH SK�ADNIA
.BR "login [ " nazwa " ]"
.br
.B "login \-p"
.br
.BR "login \-h " nazwa_serwera
.br
.BR "login \-f " nazwa
.SH OPIS
.B login
jest u�ywany, aby dosta� si� do systemu. Mo�e by� r�wnie� stosowany do
prze��czania si� mi�dzy r�nymi kontami (jednak wi�kszo�� nowoczesnych
pow�ok ma t� mo�liwo�� wbudowan�).

Je�eli nie podano �adnego argumentu,
.B login
prosi o nazw� u�ytkownika.

Je�eli u�ytkownik nie jest superu�ytkownikiem (rootem) oraz istnieje plik
.IR /etc/nologin ,
wypisywana jest zawarto�� tego pliku i proces logowania jest ko�czony
(pora�k�). Ten spos�b jest zwykle u�ywany podczas wy��czania systemu.

Je�eli danego u�ytkownika dotycz� ograniczenia opisane w pliku
.IR /etc/usertty ,
musz� by� spe�nione ich warunki; w przeciwnym wypadku wst�p do systemu
zostanie uniemo�liwiony i odpowiedni komunikat zostanie umieszczony w logu
systemowym. Zajrzyj do sekcji "Wyj�tkowe ograniczenia dost�pu".

Je�eli u�ytkownik jest superu�ytkownikiem, zalogowanie mo�e doj�� do skutku tylko
z jednej z konsol wymienionych w pliku
.IR /etc/securetty .
Nieudane pr�by zalogowania si� b�d� notowane za pomoc� funkcji
.BR syslog .

Po sprawdzeniu tych warunk�w, sprawdzone zostanie has�o (je�eli jest
wymagane dla danego u�ytkownika). Mo�liwych jest dziesi�� pr�b, ale po
pierwszych trzech kolejne ��dania pojawiaj� si� po odczekaniu pewnego czasu.
Nieudane pr�by zalogowania s� notowane funkcj�
.BR syslog .
Notowane s� r�wnie� udane logowania superu�ytkownika.

Je�eli istnieje plik
.IR .hushlogin ,
w�wczas wykonywane jest "ciche" logowanie do systemu, czyli nie jest
sprawdzana skrzynka pocztowa, nie jest wypisywany czas poprzedniego
zalogowania oraz wiadomo�� dnia (message of the day). W przeciwnym wypadku,
je�eli istnieje plik
.IR /var/log/lastlog ,
wypisywany jest czas poprzedniego zalogowania oraz zapisywany jest czas
bie��cego rozpocz�cia sesji.

Wykonywane s� rozmaite zadania administracyjne takie, jak ustawianie numer�w
UID oraz GID terminala (tty). Zachowywana jest zmienna �rodowiskowa TERM,
je�eli istnieje. Inne zmienne s� zachowywane, je�eli u�yto opcji
.BR \-p .
Ustawiane s� nast�pnie zmienne HOME, PATH, SHELL, TERM, MAIL i LOGNAME.
Zmienna PATH dostaje domy�ln� warto��
.I /usr/local/bin:/bin:/usr/bin:.
dla zwyk�ego u�ytkownika, lub
.I /sbin:/bin:/usr/sbin:/usr/bin
dla superu�ytkownika. Na ko�cu, je�eli logowanie nie jest "ciche", wypisywana
jest wiadomo�� dnia oraz sprawdzany jest plik o nazwie u�ytkownika w katalogu
.IR /usr/spool/mail ;
je�eli ma niezerow� d�ugo��, wypisywana jest odpowiednia wiadomo�� ("You
have new mail" - przyp. t�um.).

Nast�pnie uruchamiana jest pow�oka u�ytkownika. Je�eli w pliku
.B /etc/passwd 
u�ytkownikowi nie jest przypisany �adna pow�oka, u�ywany jest w�wczas
.BR /bin/sh .
Je�eli w tym�e pliku nie wymieniono nazwy katalogu domowego u�ytkownika,
u�ywany jest katalog g��wny (/). W katalogu domowym jest poszukiwany plik 
.IR .hushlogin ,
wspomniany powy�ej.
.SH OPCJE
.TP
.B \-p
U�ywany przez 
.BR getty (8) ,
by 
.B login
nie usuwa� zmiennych �rodowiskowych.
.TP
.B \-f
Opcja u�ywana do omini�cia drugiej autoryzacji u�ytkownika. Ta opcja nie
dzia�a dla superu�ytkownika i wydaje si� nie dzia�a� pod Linuksem.
.TP
.B \-h
Opcja u�ywana przez inne serwery (np. 
.BR telnetd (8))
do przekazania nazwy zdalnego komputera programowi
.BR login ,
by mo�na j� by�o umie�ci� w plikach utmp oraz wtmp. Tej opcji mo�e u�ywa�
wy��cznie superu�ytkownik.

.SH "WYJ�TKOWE OGRANICZENIA DOST�PU"
Superu�ytkownik mo�e logowa� si� wy��cznie z tych terminali, kt�rych nazwy
wymieniono w pliku
.IR /etc/securetty .
W ka�dej linii podawana jest nazwa jednego urz�dzenia tty (bez
przedrostka /dev/). Je�eli ten plik nie istnieje, superu�ytkownik mo�e si�
zalogowa� z dowolnego terminala.

.PP
Plik
.I /etc/usertty
wprowadza dodatkowe ograniczenia dost�pu dla konkretnych u�ytkownik�w.
Je�eli ten plik nie istnieje, nie s� narzucane �adne dodatkowe ograniczenia
dost�pu. W pliku znajduj� si� kolejne sekcje. Istniej� ich trzy typy: 
CLASSES, GROUPS i USERS. 
Sekcja CLASSES definiuje klasy terminali i wzorce dla nazw serwer�w. Sekcja
GROUPS definiuje dozwolone terminale i komputery w ramach grupy, natomiast
sekcja USERS definiuje powy�sze dla konkretnych u�ytkownik�w.

.PP
D�ugo�� �adnej linii tego pliku nie mo�e przekroczy� 255 znak�w.
Komentarze zaczynaj� si� od znaku #; wszystkie nast�pne znaki a� do ko�ca linii s�
ignorowane.

.PP
.SS "Sekcja CLASSES"
Sekcja CLASSES rozpoczyna si� s�owem CLASSES na pocz�tku linii (same wielkie
litery). Wszystkie kolejne linie do rozpocz�cia kolejnej sekcji lub do ko�ca
pliku sk�adaj� si� z sekwencji s��w rozdzielonych spacjami lub tabulatorami.
Ka�da linia definiuje klas� terminali i wzorzec nazwy serwera.

.PP
Pierwsze s�owo w linii staje si� wsp�ln� nazw� dla terminali i wzorc�w nazw
serwer�w opisanych w dalszej cz�ci linii. Wsp�lna nazwa mo�e by� u�ywana
w nast�puj�cych ni�ej sekcjach GROUPS i USERS. �adna z takich nazw klas nie
mo�e wyst�pi� w tre�ci definicji klasy, by unikn�� pr�b rekurencyjnego opisu
klas.
.PP
Przyk�adowa sekcja CLASSES:
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
jako opis tre�ci wyst�puj�cej po prawych stronach obu linijek.
.PP

.SS "Sekcja GROUPS"
Sekcja GROUPS definiuje terminale i serwery dozwolone dla grupy. Je�eli
u�ytkownik, zgodnie z plikami
.I /etc/passwd
i
.IR /etc/group ,
nale�y do grupy oraz jego grupa jest wymieniona w sekcji GROUPS w pliku
.IR /etc/usertty ,
w�wczas mo�e si� zalogowa�, je�eli jest to dozwolone dla grupy.

.PP
Sekcja GROUPS rozpoczyna si� od s�owa GROUPS na pocz�tku linii (same wielkie
litery); ka�da nast�pna linia sk�ada si� z ci�gu s��w porozdzielanych
spacjami lub tabulatorami. Pierwsze s�owo w linii jest nazw� grupy, a
nast�pne okre�laj� terminale i serwery, z kt�rych cz�onkowie tej grupy maj�
dost�p. Mo�e to wymaga� u�ycia klas zdefiniowanych w jednej z
poprzedzaj�cych sekcji CLASSES.
.PP
Przyk�adowa sekcja GROUPS.
.PP
.nf
.in +0.5
GROUPS
sys		tty1 @.bar.edu
stud		mojaklasa1 tty4
.in -0.5
.fi
.PP
Ten przyk�ad pozwala cz�onkom grupy
.I sys
logowa� si� na terminalu tty1 z serwer�w w domenie bar.edu. U�ytkownicy
nale��cy do grupy
.I stud
mog� logowa� si� z terminali/serwer�w wymienionych w klasie mojaklasa1 lub z
terminala tty4.

.PP
.SS "Sekcja USERS"
Sekcja USERS rozpoczyna si� od s�owa USERS na pocz�tku linii (same wielkie
litery); ka�da nast�pna linia sk�ada si� z ci�gu s��w porozdzielanych
spacjami lub tabulatorami. Pierwsze s�owo w linii jest nazw� u�ytkownika,
kt�remu wolno logowa� si� z terminali i serwer�w wymienionych w dalszej
cz�ci linii. Mo�e to wymaga� u�ycia nazwy klasy zdefiniowanej w jednej z
poprzedzaj�cych sekcji CLASSES. Je�eli na pocz�tku pliku nie ma nag��wka,
pierwsza sekcja jest domy�lnie sekcj� USERS.
.PP
Przyk�adowa sekcja USERS:
.PP
.nf
.in +0.5
USERS
zacho		tty1 @130.225.16.0/255.255.255.0
blue		tty3 mojaklasa2
.in -0.5
.fi
.PP
U�ytkownik zacho mo�e logowa� si� tylko z terminala tty1 i z serwer�w o
adresach IP w zakresie od 130.225.16.0 do 130.225.16.255. U�ytkownik blue
mo�e logowa� si� z terminala tty3 oraz z terminali/serwer�w wymienionych w
klasie mojaklasa2.
.PP
W sekcji USERS mo�e wyst�pi� linia rozpoczynaj�ca si� od *. Taka definicja
b�dzie si� odnosi�a do wszystkich u�ytkownik�w nie zdefiniowanych oddzielnie
w innej linii (domy�lny u�ytkownik).
.PP
Je�eli u�ytkownik odpowiada zar�wno jednej z linii w sekcji USERS, jak i w
sekcji GROUPS, ma on dost�p do systemu z wszystkich terminali/serwer�w
wymienionych w obydwu dotycz�cych go liniach.

.SS �r�d�a
Definicje terminali i serwer�w u�ywane w specyfikacjach klas nazywane s�
�r�d�ami (origins). Opis �r�d�a mo�e mie� jedn� z poni�szych postaci:
.IP o 
Nazwa terminala bez przedrostka /dev/; na przyk�ad tty1 lub ttyS0.
.PP
.IP o
Ci�g @localhost, oznaczaj�cy, �e u�ytkownik mo�e si� po��czy� przez telnet
lub rlogin z lokalnego serwera do niego samego. Pozwala to r�wnie� na
wykonywanie np. polecenia xterm -e /bin/login.
.PP
.IP o
Przyrostek z nazw� domeny, np. @.jaka�.domena oznaczajacy, �e u�ytkownik
mo�e ��czy� si� przez rlogin/telnet z dowolnego serwera, kt�rego nazwa domeny
ko�czy si� na .jaka�.domena.
.PP
.IP o
Zakres adres�w IPv4, zapisany jako @x.x.x.x/y.y.y.y, gdzie x.x.x.x jest
adresem IP w zwyk�ej notacji (liczby dziesi�tne rozdzielone kropkami), a
y.y.y.y jest mask� bitow� w tej samej notacji okre�laj�c�, kt�re bity w
adresie nale�y por�wna� z adresem zdalnego serwera. Na przyk�ad,
@130.225.16.0/255.255.254.0 oznacza, �e u�ytkownik mo�e si� ��czy� przez
rlogin/telnet z dowolnego serwera, kt�re adres le�y w zakresie 130.225.16.0 \-
130.225.17.255.
.PP
Ka�de z powy�szych �r�de� mo�e by� poprzedzone okre�leniem czasu zgodnie z
nast�puj�c� sk�adni�:
.PP
.nf
czas              ::= '[' <dzie�-lub-godz> [':' <dzie�-lub-godz>]* ']'
dzie�             ::= 'mon' | 'tue' | 'wed' | 'thu' | 'fri' | 'sat' | 'sun'
godz              ::= '0' | '1' | ... | '23'
zakres_godzin     ::= <godz> | <godz> '\-' <godz>
dzie�-lub-godzina ::= <dzie�> | <zakres_godzin>
.fi
.PP
Na przyk�ad, �r�d�o postaci [mon:tue:wed:thu:fri:8\-17]tty3 oznacza, �e
logowanie si� jest dozwolone od poniedzia�ku do pi�tku mi�dzy godzin� 8:00,
a 17:59 na terminalu tty3. Wida� r�wnie�, �e zakres godzin a\-b obejmuje
ca�y czas pomi�dzy a:00, a b:59. Pojedyncza godzina (np. 10) oznacza czas
pomi�dzy 10:00, a 10:59.
.PP
Nieokre�lanie zakresu czasu przed terminalem/serwerem oznacza, �e logowanie
z tego �r�d�a jest dozwolone w dowolnym momencie. Je�eli okre�lasz czas,
miej pewno��, �e okre�lasz zar�wno zakres dni, jak i godzin (lub pojedyncz�
godzin�). W okre�leniu czasu nie mog� si� znajdowa� �adne bia�e spacje.
.PP
Je�eli nie istnieje domy�lny u�ytkownik (*), u�ytkownicy nie
wymienieni w �adnej z linii pliku
.I /etc/usertty
mog� si� logowa� sk�dkolwiek, co odpowiada standardowemu zachowaniu si�
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
.SH "ZOBACZ TAK�E"
.BR init (8),
.BR getty (8),
.BR mail (1),
.BR passwd (1),
.BR passwd (5),
.BR environ (7),
.BR shutdown (8)
.SH PROBLEMY

GNU/Linux, w przeciwie�stwie do innych system�w operacyjnych o drako�skich
restrykcjach, nie sprawdza udzia��w (quotas) dyskowych.

Nieudokumentowana opcja
.B \-r
z systemu BSD nie dzia�a. Mo�e to by� wymagane przez niekt�re programy
.BR rlogind "(8)."
.SH AUTOR
Program pochodzi od oryginalnej wersji BSD login 5.40 (9-5-89), 
kt�rej autorem by� Michael Glad (glad@daimi.dk) (dla systemu HP-UX).
.br
Dostosowanie do Linuksa 0.12: Peter Orbaek (poe@daimi.aau.dk)
