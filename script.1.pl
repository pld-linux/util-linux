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
.Sh SK£ADNIA
.Nm script
.Op Fl a
.Op Ar plik
.Sh OPIS
.Nm Script
tworzy maszynopis wszystkiego co zosta³o wydrukowane na Twoim terminalu.
Jest to przydatne dla studentów, którzy potrzebuj± wydruk zapisu interakcyjnej
sesji jako dowód na wykonanie wyznaczonego zadania, maszynopis ten mo¿e byæ
wydrukowany pó¼niej za pomoc±
.Xr lpr 1 .
.Pp
Je¿eli argument 
.Ar plik
jest podany
.Nm
zapisuje ca³y dialog w
.Ar pliku.
Je¿eli nie zostanie podana nazwa pliku, wówczas maszynopis jest zapisany w pliku
.Pa typescript  .
.Pp
Opcje:
.Bl -tag -width Ds
.It Fl a
Do³±cza wyj¶cie do
.Ar pliku
albo
.Pa typescript ,
zachowuj±c uprzedni± zawarto¶æ.
.El
.Pp
Skrypt koñczy siê kiedy wychodzisz z pow³oki
.Em control-D,
aby wyj¶æ z 
pow³oki Bourne
.Pf ( Xr sh 1 ) ,
i
.Em exit ,
.Em logout
albo
.Em control-d
(je¿eli
.Em ignoreeof
nie jest ustawiona) dla
pow³oki C,
.Xr csh 1 ) .
.Pp
Pewne interakcyjne komendy, takie jak
.Xr vi 1 ,
tworz± ¶mieci w pliku maszynopisu
.Nm Script
dzia³a najlepiej z komendami, które nie manipuluj± obrazem, rezultaty s±
s³absze od na¶ladowanego wydruku terminala. 
.Sh ¦rodowisko
Nastêpuj±ca zmienna ¶rodowiskowa jest wykorzystywana przez
.Nm script :
.Bl -tag -width SHELL
.It Ev SHELL
Je¿eli zmienna
.Ev SHELL
istnieje, pow³oka rozwidlona przez
.Nm script
bêdzie t± pow³ok±. Je¿eli 
.Ev SHELL
nie jest ustawiona, wówczas przybierana jest pow³oka Bourne. (Wiêkszo¶æ
pow³ok ustawia t± zmienn± automatycznie).
.El
.Sh ZOBACZ RÓWNIE¯
.Xr csh 1
(dla 
.Em historii 
mechanizmu). 
.Sh HISTORIA
Komenda
.Nm script
pojawi³a siê w
.Bx 3.0 .
.Sh B£ÊDY
.Nm Script
umieszcza wszystko w pliku z logami, wliczaj±c znaki wysuwu wiersza i znaki
cofania siê(backspaces).
To nie jest to czego naiwny u¿ytkownik siê spodziewa³.
