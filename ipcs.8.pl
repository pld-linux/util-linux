.\" {PTM/PB/0.1/02-03-1999/"udost�pnij informacje o urz�dzeniach ipc"}
.\" Translation 1999 Przemek Borys <pborys@dione.ids.pl>
.\" Copyright 1993 Rickard E. Faith (faith@cs.unc.edu)
.\" May be distributed under the GNU General Public License
.TH IPCS 8 "9 October 1993" "Linux 0.99" "Linux Programmer's Manual"
.SH NAZWA
ipcs \- udost�pnij informacje o urz�dzeniach ipc
.SH SK�ADNIA
.B ipcs [ \-asmq ] [ \-tclup ]
.br
.BI "ipcs [ \-smq ] \-i " id
.br
.B ipcs \-h
.SH OPIS
.B ipcs
udost�pnia informacje o urz�dzeniach IPC, do kt�rych ma dost�p proces
wywo�uj�cy.

Opcja
.B \-i
umo�liwia podanie konkretnego identyfikatora (\fIid\fR)
zasobu. Wtedy drukowane b�d� tylko dane dotycz�ce tego
.IR id .

Zasoby mog� by� okre�lane nast�puj�co:
.TP
.B \-m
segmenty dzielonej pami�ci
.TP
.B \-q
kolejki komunikat�w
.TP
.B \-s
tablice semafor�w
.TP
.B \-a
wszystko (domy�lnie)
.PP
Format wyj�ciowy mo�e by� okre�lony nast�puj�co
.TP
.B \-t
czas
.TP
.B \-p
pid
.TP
.B \-c
tw�rca
.TP
.B \-l
limity
.TP
.B \-u
og�lnie
.SH ZOBACZ TAK�E
.BR ipcrm (8)
.SH AUTOR
krishna balasubramanian (balasub@cis.ohio-state.edu)
