.\" {PTM/PB/0.1/28-09-1998/"usuñ z pliku kolumny"}
.\" Copyright (c) 1980, 1990 The Regents of the University of California.
.\" All rights reserved.
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
.\"     @(#)colrm.1	6.6 (Berkeley) 3/14/91
.\"
.\" Translation (c) 1998 Przemek Borys <pborys@p-soft.silesia.linux.org.pl>
.Dd March 14, 1991
.Dt COLRM 1
.Os BSD 3
.Sh NAZWA
.Nm colrm
.Nd usuñ z pliku kolumny
.Sh SK£ADNIA
.Nm colrm
.Op Ar startcol Op Ar endcol
.Sh OPIS
.Nm Colrm
usuwa zaznaczone kolumny z pliku. Wej¶cie pobierane jest ze standardowego
wej¶cia. Wyj¶cie jest wysy³ane na standardowe wyj¶cie.
.Pp
Je¶li program jest wywo³ywany z jednym parametrem, kolumny ka¿dej linii bêd±
usuwane poczynaj±c od podanej. Je¶li program wywo³a siê z dwoma parametrami,
bêd± one oznaczaæ odpowiednio pierwsz± i ostatni± usuwan± kolumnê.
.Pp
Numerowanie kolumn zaczyna siê od kolumny pierwszej.
.Sh ZOBACZ TAK¯E
.Xr awk 1 ,
.Xr column 1 ,
.Xr expand 1 ,
.Xr paste 1
.Sh HISTORIA
Komenda
.Nm
pojawi³a siê w
.Bx 3.0 .
