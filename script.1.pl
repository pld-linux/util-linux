.\" Copyright (c) 1980, 1990 Regents of the University of California.
.\" All rights reserved.
.\" {PTM/TW/0.1/17-04-1999/tworzy maszynopis sesji"}
.\" Translation (c) 1999 Tomasz Wendlandt <juggler@cp.pl>
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
.\"     This product includes software developed by the University of
.\"     California, Berkeley and its contributors.
.\" 4. Neither the name of the University nor the names of its contributors
.\"    may be used to endorse or promote products derived from this software
.\"    without specific prior written permission.
.\"
.\" THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS `AS IS'' AND
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
.\"     @(#)script.1    6.5 (Berkeley) 7/27/91
.\"
.Dd July 27, 1991
.Dt SCRIPT 1
.Os BSD 4
.Sh NAZWA
.Nm script
.Nd tworzy maszynopis sesji 
.Sh SK�ADNIA
.Nm script
.Op Fl a
.Op Ar plik
.Sh OPIS
.Nm Script
tworzy maszynopis wszystkiego co zosta�o wydrukowane na Twoim terminalu.
Jest to przydatne dla student�w, kt�rzy potrzebuj� wydruk zapisu interakcyjnej
sesji jako dow�d na wykonanie wyznaczonego zadania, maszynopis ten mo�e by�
wydrukowany p�niej za pomoc�
.Xr lpr 1 .
.Pp
Je�eli argument 
.Ar plik
jest podany
.Nm
zapisuje ca�y dialog w
.Ar pliku.
Je�eli nie zostanie podana nazwa pliku, w�wczas maszynopis jest zapisany w pliku
.Pa typescript  .
.Pp
Opcje:
.Bl -tag -width Ds
.It Fl a
Do��cza wyj�cie do
.Ar pliku
albo
.Pa typescript ,
zachowuj�c uprzedni� zawarto��.
.El
.Pp
Skrypt ko�czy si� kiedy wychodzisz z pow�oki
.Em control-D,
aby wyj�� z 
pow�oki Bourne
.Pf ( Xr sh 1 ) ,
i
.Em exit ,
.Em logout
albo
.Em control-d
(je�eli
.Em ignoreeof
nie jest ustawiona) dla
pow�oki C,
.Xr csh 1 ) .
.Pp
Pewne interakcyjne komendy, takie jak
.Xr vi 1 ,
tworz� �mieci w pliku maszynopisu
.Nm Script
dzia�a najlepiej z komendami, kt�re nie manipuluj� obrazem, rezultaty s�
s�absze od na�ladowanego wydruku terminala. 
.Sh �rodowisko
Nast�puj�ca zmienna �rodowiskowa jest wykorzystywana przez
.Nm script :
.Bl -tag -width SHELL
.It Ev SHELL
Je�eli zmienna
.Ev SHELL
istnieje, pow�oka rozwidlona przez
.Nm script
b�dzie t� pow�ok�. Je�eli 
.Ev SHELL
nie jest ustawiona, w�wczas przybierana jest pow�oka Bourne. (Wi�kszo��
pow�ok ustawia t� zmienn� automatycznie).
.El
.Sh ZOBACZ R�WNIE�
.Xr csh 1
(dla 
.Em historii 
mechanizmu). 
.Sh HISTORIA
Komenda
.Nm script
pojawi�a si� w
.Bx 3.0 .
.Sh B��DY
.Nm Script
umieszcza wszystko w pliku z logami, wliczaj�c znaki wysuwu wiersza i znaki
cofania si�(backspaces).
To nie jest to czego naiwny u�ytkownik si� spodziewa�.
