.\" {PTM/PB/0.1/02-03-1999/"udostêpnij informacje o urz±dzeniach ipc"}
.\" Translation 1999 Przemek Borys <pborys@dione.ids.pl>
.\" Copyright 1993 Rickard E. Faith (faith@cs.unc.edu)
.\" May be distributed under the GNU General Public License
.TH IPCS 8 "9 October 1993" "Linux 0.99" "Linux Programmer's Manual"
.SH NAZWA
ipcs \- udostêpnij informacje o urz±dzeniach ipc
.SH SK£ADNIA
.B ipcs [ \-asmq ] [ \-tclup ]
.br
.BI "ipcs [ \-smq ] \-i " id
.br
.B ipcs \-h
.SH OPIS
.B ipcs
udostêpnia informacje o urz±dzeniach IPC, do których ma dostêp proces
wywo³uj±cy.

Opcja
.B \-i
umo¿liwia podanie konkretnego identyfikatora (\fIid\fR)
zasobu. Wtedy drukowane bêd± tylko dane dotycz±ce tego
.IR id .

Zasoby mog± byæ okre¶lane nastêpuj±co:
.TP
.B \-m
segmenty dzielonej pamiêci
.TP
.B \-q
kolejki komunikatów
.TP
.B \-s
tablice semaforów
.TP
.B \-a
wszystko (domy¶lnie)
.PP
Format wyj¶ciowy mo¿e byæ okre¶lony nastêpuj±co
.TP
.B \-t
czas
.TP
.B \-p
pid
.TP
.B \-c
twórca
.TP
.B \-l
limity
.TP
.B \-u
ogólnie
.SH ZOBACZ TAK¯E
.BR ipcrm (8)
.SH AUTOR
krishna balasubramanian (balasub@cis.ohio-state.edu)
