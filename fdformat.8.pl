.\" {PTM/PB/0.1/02-10-1998/"niskopoziomowe formatowanie dyskietki"}
.\" Translation (c) 1999 Przemek Borys <pborys@dione.ids.pl>
.\" Copyright 1992, 1993 Rickard E. Faith (faith@cs.unc.edu)
.\" May be distributed under the GNU General Public License
.TH FDFORMAT 8 "1 lutego 1993" "Linux 0.99" "Podrêcznik programisty linuksowego"
.SH NAZWA
fdformat \- niskopoziomowe formatowanie dyskietki
.SH SK£ADNIA
.B fdformat
.RB [ \-n ]
.I urz±dzenie
.SH OPIS
.B fdformat
formatuje niskopoziomowo dyskietkê.
.I urz±dzenie
jest zazwyczaj jednym z nastêpuj±cych (dla stacji dysków numer g³ówny
(major) to dwa, a poboczny (minor) jest pokazany tylko dla celów
informacyjnych):
.sp
.nf
.RS
/dev/fd0d360  (minor = 4)
/dev/fd0h1200 (minor = 8)
/dev/fd0D360  (minor = 12)
/dev/fd0H360  (minor = 12)
/dev/fd0D720  (minor = 16)
/dev/fd0H720  (minor = 16)
/dev/fd0h360  (minor = 20)
/dev/fd0h720  (minor = 24)
/dev/fd0H1440 (minor = 28)

/dev/fd1d360  (minor = 5)
/dev/fd1h1200 (minor = 9)
/dev/fd1D360  (minor = 13)
/dev/fd1H360  (minor = 13)
/dev/fd1D720  (minor = 17)
/dev/fd1H720  (minor = 17)
/dev/fd1h360  (minor = 21)
/dev/fd1h720  (minor = 25)
/dev/fd1H1440 (minor = 29)
.RE
.fi

Standardowe stacje dysków, /dev/fd0 i /dev/fd1 nie bêd± dzia³a³y z
.B fdformat
kiedy u¿ywa siê niestandardowego formatu lub kiedy format nie zosta³
wcze¶niej automatycznie wykryty. W tym wypadku u¿yj
.BR setfdprm (8)
aby za³adowaæ parametry dysku.

.SH OPCJE
.TP
.B \-n
Bez weryfikacji. Ta opcja wy³±czy weryfikacjê, która jest dokonywana po
formatowaniu.
.SH "ZOBACZ TAK¯E"
.BR fd (4),
.BR setfdprm (8),
.BR mkfs (8),
.BR emkfs (8)
.SH AUTOR
Werner Almesberger (almesber@nessie.cs.id.ethz.ch)
