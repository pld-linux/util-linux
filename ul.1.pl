.\" 1999 PTM Przemek Borys
.\" Copyright (c) 1980, 1991, 1993
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
.\"     @(#)ul.1	8.1 (Berkeley) 6/6/93
.\"
.Dd 6 Czerwca 1993
.Dt UL 1
.Os BSD 4
.Sh NAZWA
.Nm ul
.Nd dokonaj podkre¶lenia
.Sh SK£ADNIA
.Nm ul
.Op Fl i
.Op Fl t Ar terminal
.Op Ar name Ar ...
.Sh OPIS
.Nm Ul
czyta podane pliki (lub standardowe wej¶cie gdy nie s± podane pliki) i t³umaczy
pojawiaj±ce siê podkre¶lenia na sekwencje podkre¶leñ, dzia³aj±ce na danym
terminalu, okre¶lonym przez zmienn± ¶rodowiskow±
.Ev TERM .

Plik
.Pa /etc/termcap
zawiera sekwencje potrzebne do robienia podkre¶leñ.

Je¶li terminal nie potrafi podkre¶laæ, lecz mo¿e dawaæ tryb wyt³uszczony, to
jest on u¿ywany. 

Je¶li terminal potrafi nadstukiwaæ znaki, to
.Nm ul
degeneruje do zwyk³ego
.Xr cat 1 .

Je¶li terminal nie potrafi podkre¶laæ, podkre¶lanie jest ignorowane.
.Pp
Dostêpne s± nastêpuj±ce opcje:
.Bl -tag -width Ds
.It Fl i
Podkre¶lenie jest wskazywane przez oddzieln± liniê, zawieraj±c± odpowiednie
kreski `\-'; jest to przydatne gdy chcesz zobaczyæ podkre¶lenie w strumieniu
wyj¶ciowym
.Xr nroff
na terminalu crt.
.It Fl t Ar terminal
Przeci±¿a rodzaj terminala podany w ¶rodowisku na warto¶æ
.Ar terminal .
.El
.Sh ¦RODOWISKO
U¿ywana jest nastêpuj±ca zmienna ¶rodowiskowa:
.Bl -tag -width TERM
.It Ev TERM
Zmienna
.Ev TERM
jest u¿ywana do wi±zania urz±dzenia tty z opisem jego w³a¶ciwo¶ci (zobacz
.Xr termcap 5 ) .
.Ev TERM
jest ustawiane podczas logowania.
.El
.Sh ZOBACZ TAK¯E
.Xr man 1 ,
.Xr nroff 1 ,
.Xr colcrt 1
.Sh B£ÊDY
.Xr Nroff
zazwyczaj wydaje serie backspace'ów i podkre¶leñ, wymieszanych z tekstem.
Wskazuje to na podkre¶lenie. Nie s± czynione ¿adne próby zoptymalizowania
ruchów wstecznych.
.Sh HISTORIA
Komenda
.Nm
pojawi³a siê w
.Bx 3.0 .
