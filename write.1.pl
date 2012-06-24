.\" {PTM/PB/0.1/28-06-1999/"."}
.\" Copyright (c) 1989, 1993
.\"	The Regents of the University of California.  All rights reserved.
.\"
.\" This code is derived from software contributed to Berkeley by
.\" Jef Poskanzer and Craig Leres of the Lawrence Berkeley Laboratory.
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
.\"     @(#)write.1	8.1 (Berkeley) 6/6/93
.\"
.\" Modified for Linux, Sun Mar 12 10:21:01 1995, faith@cs.unc.edu
.\"
.TH WRITE 1 "12 Marca 1995" "" "Podr�cznik programisty Linuksa"
.SH NAZWA
write \- wy�lij komunikat do innego u�ytkownika
.SH SK�ADNIA
.BI write " u�ytkownik "
.RI [ nazwatty ]
.SH OPIS
.B Write
umo�liwia komunikowanie si� z innymi u�ytkownikami poprzez kopiowanie linii
z twojego terminala na ichnie.
.PP
Gdy pracujesz z komend� 
.BR write ,
u�ytkownik otrzyma komunikat w postaci:
.RS
Message from toty@tenhost on tw�jtty at hh:mm ...
.RE
Wszelkie dalsze linie, kt�re wprowadzisz, zostan� skopiowane na podany
terminal u�ytkownika. Je�li u�ytkownik chce ci odpowiedzie�, to musi
r�wnie� uruchomi� 
.BR write .
.PP
Gdy sko�czysz, wpisz znak ko�ca pliku. Drugi u�ytkownik zobaczy komunikat
.BR EOF ,
wskazuj�cy na koniec konweracji.
.PP
Mo�esz zabroni� ludziom (innym ni� superu�ytkownik) pisania do ciebie,
u�ywaj�c komendy
.BR mesg (1).
Niekt�re komendy, np.
.BR nroff (1)
czy
.BR pr (1),
mog� automatycznie uniemo�liwi� pisanie, aby twoje wyj�cie nie by�o
nadpisane.
.PP
Je�li u�ytkownik, do kt�rego chcesz pisa� jest zalogowany na wi�cej ni�
jednym terminalu, to mo�esz poda�, na kt�ry terminal piszesz, podaj�c nazw�
terminala jako drugi parametr
.BR write .
W innym wypadku,
.B write
wybierze jeden z terminali \- ten z najkr�tszym czasem nieaktywno�ci
u�ytkownika (idle). Tak wi�c wiadomo�� p�jdzie we w�a�ciwe miejsce.
.PP
Tradycyjnie przyj�to w pisaniu do innych, �e �a�cuch `-o' znajduj�cy si�
na ko�cu linii lub stanowi�cy odr�bn� lini� oznacza, �e nadesz�a kolej
na wypowied� naszego rozm�wcy. �a�cuch `oo' oznacza, �e osoba uwa�a
konwersacj� za sko�czon�.
.SH "ZOBACZ TAK�E"
.BR wall (1),
.BR mesg (1),
.BR talk (1),
.BR who (1)
.SH HISTORIA
Komenda \fBwrite\fR pojawi�a si� w wersji 6 AT&T UNIX.
