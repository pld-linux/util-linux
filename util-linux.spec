#
# Conditional build:	
# _without_crypto	- without kerneli cryptography
# _with_pivot_root
#
# TODO:
# - move raw to /sbin (potentially can be used before mount partitions)??
%define		_kernel_ver	%(grep UTS_RELEASE %{_kernelsrcdir}/include/linux/version.h 2>/dev/null | cut -d'"' -f2)
%define		_kernel24	%(echo %{_kernel_ver} | grep -q '2\.[012]\.' ; echo $?)
%if %{_kernel24}
%define		_kernel_series	2.4
%else
%define		_kernel_series	2.2
%endif

%define		rel	6

Summary:	Collection of basic system utilities for Linux
Summary(de):	Sammlung von grundlegenden Systemdienstprogrammen f�r Linux
Summary(fr):	Ensemble d'utilitaires syst�me de base pour Linux
Summary(pl):	Zbi�r podstawowych narz�dzi systemowych dla Linuksa
Summary(tr):	Temel sistem ara�lar�
Summary(pt_BR):	Colet�nea de utilit�rios b�sicos de sistema para Linux
Summary(es):	Colect�nea de utilitarios b�sicos de sistema para Linux
Name:		util-linux
Version:	2.11g
Release:	%{rel}
License:	Distributable
Group:		Applications/System
Group(de):	Applikationen/System
Group(pl):	Aplikacje/System
Source0:	ftp://ftp.win.tue.nl/pub/linux-local/utils/util-linux/%{name}-%{version}.tar.gz
Source1:	login.pamd
Source2:	kill.1.pl
Source3:	arch.1.pl
Source4:	login.1.pl
Source5:	look.1.pl
Source6:	script.1.pl
Source7:	write.1.pl
Source8:	getopt.1.pl
Source9:	colrm.1.pl
Source10:	hexdump.1.pl
Source11:	ul.1.pl
Source12:	ipcrm.8.pl
Source13:	ipcs.8.pl
Source15:	fdformat.8.pl
Source16:	mkswap.8.pl
Source17:	fdisk.8.pl
Source18:	umount.8.pl
Source19:	mount.8.pl
Source20:	swapon.8.pl
Source21:	swapoff.8.pl
Source22:	fstab.5.pl
Source23:	chkdupexe.1.pl
Source24:	tunelp.8.pl
Source25:	rawdevices-init
Source26:	rawdevices-sysconfig
Patch0:		%{name}-MCONFIG.patch
Patch1:		%{name}-fdisk.patch
Patch2:		%{name}-utmpx.patch
Patch3:		%{name}-fhs.patch
Patch4:		%{name}-login.patch
Patch5:		%{name}-kerneli.patch
Patch6:		%{name}-info.patch
Patch7:		%{name}-fdisk2.patch
Patch9:		%{name}-mount-rpc.patch
Patch10:	ftp://ftp.linuxnfs.sourceforge.org:/pub/nfs/%{name}-2.10m-mount-compat.patch
Patch11:	%{name}-syscall.patch
Patch13:	%{name}-raw.patch
Patch14:	%{name}-gecos.patch
Patch15:	%{name}-glibc.patch
Patch16:	%{name}-s390.patch
Patch18:	%{name}-kerneli-2.4.patch
Patch20:	%{name}-qnx4.patch
Patch21:	%{name}-losetup-getpass.patch
Patch22:	%{name}-login-problems.patch
BuildRequires:	pam-devel >= 0.66
BuildRequires:	ncurses-devel >= 5.0
BuildRequires:	gettext-devel
BuildRequires:	texinfo
Requires:	pam >= 0.66
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)
Obsoletes:	util-linux-suids

%define		debugcflags	-O1 -g

%description
util-linux contains a large variety of low-level system utilities
necessary for a functional Linux system. This includes, among other
things, configuration tools such as fdisk and system programs such as
logger.

%description -l de
util-linux enth�lt eine gro�e Anzahl an
low-level-Systemdienstprogrammen, die f�r ein funktionierendes
Linux-System erforderlich sind. Dazu geh�ren Konfigurationstools wie
'fdisk' und Systemprogramme wie 'logger'.

%description -l fr
util-linux contient une grande vari�t� d'utilitaire syst�me bas niveau
n�cessaires au fonctionnement d'un syst�me Linux. Cela comprend, entre
autres, les outils de configuration comme fdisk et des programmes
syst�mes comme logger.

%description -l pl
Util-linux zawiera wiele r�nych, niskopoziomowych narz�dzi
systemowych niezb�dnych do prawid�owego dzia�ania Linuksa. W pakiecie
znajduj� si� mi�dzy innymi, narz�dzia konfiguracyjne takie jak fdisk i
programy systemowe takie jak logger.

%description -l tr
�levsel durumdaki bir Linux sistemi i�in gerekli bir�ok alt d�zey
sistem ara�lar�n� i�erir. Bunlar aras�nda fdisk gibi yap�land�rma
uygulamalar� ve logger gibi sistem programlar� say�labilir.

%description -l pt_BR
util-Linux cont�m uma grande variedade de utilit�rios de sistema
de baixo-n�vel necess�rios para um sistema Linux funcional. Isso
inclui, entre outras coisas, ferramentas de configura��o como fdisk
e programas de sistema como login.

%description -l es
util-Linux contiene una gran variedad de utilitarios de sistema de
bajo nivel necesarios a un sistema Linux funcional. Esto incluye,
entre otras cosas, herramientas de configuraci�n como fdisk y
programas de sistema como login.

%package -n losetup
Summary:	Programs for setting up and configuring loopback devices
Summary(de):	Programme zum Einrichten und Konfigurieren von Loopback-Ger�ten
Summary(fr):	Programmes pour mettre en place et configurer les loopback
Summary(pl):	Program do konfiguracji urz�dzenia blokowego loopback
Summary(tr):	Yerel-�evrim ayg�tlar�n�n kurulmas� ve ayarlanmas� i�in programlar
Group:		Applications/System
Group(de):	Applikationen/System
Group(pl):	Aplikacje/System
Release:	%{rel}@%{_kernel_series}
%if %{_kernel24}
Conflicts:	kernel < 2.3.0
%else
Conflicts:	kernel >= 2.3.0
%endif

%description -n losetup
Linux supports a special block device called the loopback device,
which maps a normal file onto a virtual block device. This package
contains programs for setting up and removing the mapping between
files and loopback devices.

Block loopback devices should not be confused with the networking
loopback device, which is configured with the normal ifconfig command.

%description -n losetup -l de
Linux unterst�tzt ein spezielles Blockger�t, das sogenannte Loopback,
das eine normale Datei auf ein virtuelles Blockger�t abbildet. Das
Paket enth�lt Programme zum Einrichten und Entfernen der Zuordnung
zwischen Dateien und Loopback-Ger�ten.

%description -n losetup -l fr
Linux g�re un p�riph�rique bloc sp�cial appel� � loopback �, qui
correspond � un fichier normal sur un p�riph�rique bloc virtuel. Ce
paquetage contient les programmes pour configurer et supprimer la
correspondance entre les fichiers et les p�riph�riques loopback.

Les p�riph�riques bloc loopback ne doivent pas �tre confondus avec le
p�riph�rique loopback du r�seau, configur� avec la commande ifconfig
normale.

%description -n losetup -l pl
Linux ma wsparcie dla specjalnego urz�dzenia blokowego loopback, kt�re
mapuje normalny plik w wirtualne urz�dzenie blokowe. Pakiet ten
zawiera program przy pomocy kt�rego b�dziesz m�g� wykorzysta� to
urz�dzenie.

Urz�dzenie blokowe loopback nie powinno by� mylone z sieciowym
interfejsem loopback, kt�ry jest konfigurowany przy pomocy polecenia
ifconfig.

%description -n losetup -l tr
Linux �zel bir blok ayg�t olan yerel-�evrim ayg�t�n� (loopback device)
destekler. Bu ayg�t normal bir dosyan�n sanal bir blok ayg�t� �zerine
haritas�n� ��kar�r. Bu paket, dosyalar ve yerel-�evrim ayg�tlar�
aras�ndaki haritalama i�leminin kurulmas� ve kald�r�lmas� i�in
programlar i�erir. Blok yerel-�evrim ayg�t� ifconfig komutu ile
yap�land�r�lan a� yerel-�evrim ayg�t� ile kar��t�r�lmamal�d�r.

%package -n mount
Summary:	Programs for mounting and unmounting filesystems
Summary(de):	Programme zum Montieren und Abmontieren von Dateisystemen
Summary(fr):	Programme pour monter et d�monter des syst�mes de fichiers.
Summary(pl):	Programy do montowania i odmontowywania systemu plik�w
Summary(tr):	Dosya sistemlerini ba�lamak ve ��zmek i�in programlar
Group:		Applications/System
Group(de):	Applikationen/System
Group(pl):	Aplikacje/System
Release:	%{rel}@%{_kernel_series}
%if %{_kernel24}
Conflicts:	kernel < 2.3.0
%else
Conflicts:	kernel >= 2.3.0
%endif

%description -n mount
Mount is used for adding new filesystems, both local and networked, to
your current directory structure. The filesystems must already exist
for this to work. It can also be used to change the access types the
kernel uses for already-mounted filesystems.

This package is critical for the functionality of your system.

%description -n mount -l de
Mount wird zum Hinzuf�gen neuer Dateisysteme (lokal und im Netzwerk)
zu Ihrer aktuellen Verzeichnisstruktur verwendet. Die Dateisysteme
m�ssen bereits existieren. Au�erdem k�nnen die Zugriffstypen ge�ndert
werden, die der Kernel f�r bereits montierte Dateisysteme verwendet.

Dieses Paket ist f�r Ihr System unbedingt erforderlich .

%description -n mount -l fr
mount sert � ajouter de nouveaux syst�mes de fichiers, locaux ou
r�seaux, � votre structure de r�pertoire. Les syst�mes de fichiers
doivent d�j� exister pour que cela fonctionne. Il peut aussi servir �
changer les types d'acc�s pour les syst�mes de fichiers d�j� mont�s.

Ce paquetage est critique pour le fonctionnement de votre syst�me.

%description -n mount -l pl
Program mount jest u�ywany przez system do montowania systemu plik�w,
zar�wno lokalnych jak i sieciowych (np. NFS).

Pakiet ten jest niezb�dny do prawid�owej pracy twojego Linuksa.

%description -n mount -l tr
mount, hem yerel hem de a� dosya sistemlerinin dizin yap�s�na
eklenmesi i�in kullan�l�r. Bunun i�in ba�lanacak dosya sisteminin
�nceden haz�rlanm�� olmas� gerekir. Ayn� zamanda �ekirde�in ba�lanm��
dosya sistemlerine eri�imini de�i�tirmek i�in de kullan�l�r. Bu paket
sisteminizin i�levselli�i a��s�ndan kritiktir.

%package chkdupexe
Summary:	chkdupexe - find duplicate executables
Summary(pl):	chkdupexe odszukuje powtarzaj�ce si� pliki uruchamialne
Group:		Applications/System
Group(de):	Applikationen/System
Group(pl):	Aplikacje/System

%description chkdupexe
chkdupexe will scan the union of $PATH and a hardcoded list of common
locations for binaries. It will report dangling symlinks and
duplicately-named binaries.

%description chkdupexe -l pl
chkdupexe przeszukuje katalogi z $PATH oraz inne powszechnie znane
katalogi z plikami uruchamialnymi i informuje o powtarzaj�cych si�
plikach w r�nych katalogach.

%package -n tunelp
Summary:	Configures kernel parallel port driver
Summary(de):	Konfiguriert den Kerneltreiber f�r den parallelen Port
Summary(fr):	Configure le pilote du port parall�le dans le noyau
Summary(pl):	Program do konfigurowania sterownika portu r�wnoleg�ego
Summary(tr):	�ekirde�in paralel ba�lant� noktas� s�r�c�s�n� ayarlar
Group:		Applications/System
Group(de):	Applikationen/System
Group(pl):	Aplikacje/System

%description -n tunelp
`tunelp' aids in configuring the kernel parallel port driver.

%description -n tunelp -l de
TUNELP hilft bei der Konfiguration des Kernel-Parallelport-Treibers.

%description -n tunelp -l fr
� tunelp � aide � configurer le pilote du noyau pour le port
parall�le.

%description -n tunelp -l pl
Program do konfigurowania sterownika portu r�wnoleg�ego.

%description -n tunelp -l tr
Paralel ba�lant� noktas� s�r�c�s�n� ayarlar.

%package -n login
Summary:	login is used when signing onto a system
Summary(pl):	login jest u�ywany do rozpocz�cia pracy w systemie
Group:		Applications/System
Group(de):	Applikationen/System
Group(pl):	Aplikacje/System
Obsoletes:	heimdal-login
Requires:	pam-pld

%description -n login
login is used when signing onto a system. It can also be used to
switch from one user to another at any time (most modern shells have
support for this feature built into them, however).

%description -n login -l pl
login jest u�ywany do rozpocz�cia pracy w systemie. Mo�e by� u�ywany
do prze��czania z jednego u�ytkownika na innego w ka�dym momencie
(jednak wi�kszo�� nowoczesnych pow�ok ma takie funkcje wbudowane).

%package -n agetty
Summary:	Alternative Linux getty
Summary(pl):	Alternatywny getty 
Group:		Applications/System
Group(de):	Applikationen/System
Group(pl):	Aplikacje/System
Requires:	login

%description -n agetty
agetty is simple Linux getty with serial support.

%description -n agetty -l pl
agetty jest prostym linuksowym getty z obs�ug� portu szeregowego.

%package -n rawdevices
Summary:	Support for raw-devices
Summary(pl):	Obs�uga raw-device'�w
Group:		Applications/System
Group(de):	Applikationen/System
Group(pl):	Aplikacje/System
Requires:	chkconfig

%description -n rawdevices
Support for raw-devices.

%description -n rawdevices -l pl
Obs�uga raw-device'�w.

%prep
%setup -q
%patch0 -p1
%patch1 -p1
%patch2 -p1
%patch3 -p1
%patch4 -p1
%if %{_kernel24}
%{!?_without_crypto:%patch18 -p1}
%else
%{!?_without_crypto:%patch5 -p1}
%endif
%patch6 -p1
%patch7 -p1
%patch9 -p1
%patch10 -p1
%patch11 -p1
%patch13 -p1
%patch14 -p1
%patch15 -p1
%patch16 -p1
%patch20 -p1
%if !%{_kernel24}
%patch21 -p1
%endif
%patch22 -p1

%build
CFLAGS="%{rpmcflags} -I%{_includedir}/ncurses -I%{_kernelsrcdir}/include"
%configure2_13

%{__make} OPT="%{rpmcflags}" \
	MOREHELPDIR=%{_datadir}/misc \
	ADD_RAW="yes"

(cd sys-utils; makeinfo ipc.texi)

%install
rm -rf $RPM_BUILD_ROOT

install -d $RPM_BUILD_ROOT/{bin,sbin,etc/{pam.d,logrotate,rc.d/init.d,sysconfig}} \
	$RPM_BUILD_ROOT{%{_bindir},%{_sbindir},%{_infodir},%{_datadir}/misc} \
	$RPM_BUILD_ROOT{%{_examplesdir},%{_mandir}/{man{1,5,6,8},pl/man{1,5,6,8}}}

%{__make} install \
	DESTDIR="$RPM_BUILD_ROOT" \
	INSTALLSUID="install -m 755" \
	MOREHELPDIR=$RPM_BUILD_ROOT%{_datadir}/misc \
	GETOPTDIR=$RPM_BUILD_ROOT%{_examplesdir}/getopt \
	USRGAMESDIR=$RPM_BUILD_ROOT%{_bindir} \
	USE_TTY_GROUP=no \
	ADD_RAW="yes"

install %{SOURCE1} $RPM_BUILD_ROOT/etc/pam.d/login

install %{SOURCE2} $RPM_BUILD_ROOT%{_mandir}/pl/man1/kill.1
install %{SOURCE3} $RPM_BUILD_ROOT%{_mandir}/pl/man1/arch.1
install %{SOURCE4} $RPM_BUILD_ROOT%{_mandir}/pl/man1/login.1
install %{SOURCE5} $RPM_BUILD_ROOT%{_mandir}/pl/man1/look.1
install %{SOURCE6} $RPM_BUILD_ROOT%{_mandir}/pl/man1/script.1
install %{SOURCE7} $RPM_BUILD_ROOT%{_mandir}/pl/man1/write.1
install %{SOURCE8} $RPM_BUILD_ROOT%{_mandir}/pl/man1/getopt.1
install %{SOURCE9} $RPM_BUILD_ROOT%{_mandir}/pl/man1/colrm.1
install %{SOURCE10} $RPM_BUILD_ROOT%{_mandir}/pl/man1/hexdump.1
install %{SOURCE11} $RPM_BUILD_ROOT%{_mandir}/pl/man1/ul.1

install %{SOURCE12} $RPM_BUILD_ROOT%{_mandir}/pl/man8/ipcrm.8
install %{SOURCE13} $RPM_BUILD_ROOT%{_mandir}/pl/man8/ipcs.8
install %{SOURCE15} $RPM_BUILD_ROOT%{_mandir}/pl/man8/fdformat.8
install %{SOURCE16} $RPM_BUILD_ROOT%{_mandir}/pl/man8/mkswap.8
install %{SOURCE17} $RPM_BUILD_ROOT%{_mandir}/pl/man8/fdisk.8
install %{SOURCE18} $RPM_BUILD_ROOT%{_mandir}/pl/man8/umount.8
install %{SOURCE19} $RPM_BUILD_ROOT%{_mandir}/pl/man8/mount.8
install %{SOURCE20} $RPM_BUILD_ROOT%{_mandir}/pl/man8/swapon.8
install %{SOURCE21} $RPM_BUILD_ROOT%{_mandir}/pl/man8/swapoff.8

install %{SOURCE22} $RPM_BUILD_ROOT%{_mandir}/pl/man5/fstab.5

install %{SOURCE23} $RPM_BUILD_ROOT%{_mandir}/pl/man1/chkdupexe.1

install %{SOURCE24} $RPM_BUILD_ROOT%{_mandir}/pl/man8/tunelp.8

install %{SOURCE25} $RPM_BUILD_ROOT/etc/rc.d/init.d/rawdevices
install %{SOURCE26} $RPM_BUILD_ROOT/etc/sysconfig/rawdevices

install -d $RPM_BUILD_ROOT/{etc/security,var/lock}

touch $RPM_BUILD_ROOT/etc/security/blacklist.login

:> $RPM_BUILD_ROOT/var/lock/wtmpxlock

ln -sf hwclock $RPM_BUILD_ROOT/sbin/clock
echo '.so hwclock.8' > $RPM_BUILD_ROOT%{_mandir}/man8/clock.8

ln -sf swapon $RPM_BUILD_ROOT/sbin/swapoff

gzip -9nf */README.*

%find_lang %{name}

%post
[ ! -x /usr/sbin/fix-info-dir ] || /usr/sbin/fix-info-dir -c %{_infodir} >/dev/null 2>&1

%postun
[ ! -x /usr/sbin/fix-info-dir ] || /usr/sbin/fix-info-dir -c %{_infodir} >/dev/null 2>&1

%post -n rawdevices
/sbin/chkconfig --add rawdevices
if [ -f /var/lock/subsys/rawdevices ]; then
	/etc/rc.d/init.d/rawdevices restart 1>&2
else
	echo "Run \"/etc/rc.d/init.d/rawdevices start\" to start rawdevices."
fi

%preun -n rawdevices
if [ -f /var/lock/subsys/rawdevices ]; then
	/etc/rc.d/init.d/rawdevices stop 1>&2
fi
/sbin/chkconfig --del rawdevices

%clean
rm -rf $RPM_BUILD_ROOT

%files -f %{name}.lang
%defattr(644,root,root,755)
%doc */README.*

%attr(755,root,root) /sbin/clock
%attr(755,root,root) /sbin/hwclock

%{_mandir}/man8/clock.8*
%{_mandir}/man8/hwclock.8*

%attr(640,root,root) %config(noreplace) %verify(not md5 size mtime) %{_sysconfdir}/fdprm

%attr(0755,root,root) /bin/arch
%attr(0755,root,root) /bin/dmesg
%attr(0755,root,root) /bin/kill
%attr(0755,root,root) /bin/more
%attr(0755,root,root) /sbin/blockdev
%attr(0755,root,root) /sbin/mkfs
%attr(0755,root,root) /sbin/mkswap
%attr(0755,root,root) /sbin/ctrlaltdel
%attr(0755,root,root) /sbin/elvtune
%attr(0755,root,root) %{_bindir}/banner
%attr(0755,root,root) %{_bindir}/cal
%attr(0755,root,root) %{_bindir}/col
%attr(0755,root,root) %{_bindir}/colcrt
%attr(0755,root,root) %{_bindir}/colrm
%attr(0755,root,root) %{_bindir}/column
%attr(0755,root,root) %{_bindir}/ddate
%attr(0755,root,root) %{_bindir}/fdformat
%attr(0755,root,root) %{_bindir}/getopt
%attr(0755,root,root) %{_bindir}/hexdump
%attr(0755,root,root) %{_bindir}/ipcrm
%attr(0755,root,root) %{_bindir}/ipcs
%attr(0755,root,root) %{_bindir}/isosize
%attr(0755,root,root) %{_bindir}/logger
%attr(0755,root,root) %{_bindir}/look
%attr(0755,root,root) %{_bindir}/mcookie
%attr(0755,root,root) %{_bindir}/namei
%attr(4755,root,root) %{_bindir}/newgrp
%attr(0755,root,root) %{_bindir}/renice
%attr(0755,root,root) %{_bindir}/rev
%attr(0755,root,root) %{_bindir}/script
%attr(0755,root,root) %{_bindir}/setsid
%attr(0755,root,root) %{_bindir}/setfdprm
%attr(0755,root,root) %{_bindir}/setterm
%attr(0755,root,root) %{_bindir}/ul
%attr(0755,root,root) %{_bindir}/whereis
%attr(2755,root,tty) %{_bindir}/write
%attr(0755,root,root) %{_sbindir}/readprofile
%attr(0755,root,root) %{_sbindir}/vigr
%attr(0755,root,root) %{_sbindir}/vipw

%{_mandir}/man1/arch.1*
%{_mandir}/man1/cal.1*
%{_mandir}/man1/col.1*
%{_mandir}/man1/colcrt.1*
%{_mandir}/man1/colrm.1*
%{_mandir}/man1/column.1*
%{_mandir}/man1/ddate.1*
%{_mandir}/man1/getopt.1*
%{_mandir}/man1/hexdump.1*
%{_mandir}/man1/kill.1*
%{_mandir}/man1/logger.1*
%{_mandir}/man1/look.1*
%{_mandir}/man1/mcookie.1*
%{_mandir}/man1/more.1*
%{_mandir}/man1/namei.1*
%{_mandir}/man1/newgrp.1*
%{_mandir}/man1/script.1*
%{_mandir}/man1/setterm.1*
%{_mandir}/man1/readprofile.1*
%{_mandir}/man1/rev.1*
%{_mandir}/man1/ul.1*
%{_mandir}/man1/whereis.1*
%{_mandir}/man1/write.1*

%{_mandir}/man6/banner.6*

%{_mandir}/man8/blockdev.8*
%{_mandir}/man8/cytune.8*
%{_mandir}/man8/ctrlaltdel.8*
%{_mandir}/man8/dmesg.8*
%{_mandir}/man8/elvtune.8*
%{_mandir}/man8/fdformat.8*
%{_mandir}/man8/ipcrm.8*
%{_mandir}/man8/ipcs.8*
%{_mandir}/man8/isosize.8*
%{_mandir}/man8/mkswap.8*
%{_mandir}/man8/renice.8*
%{_mandir}/man8/setsid.8*
%{_mandir}/man8/setfdprm.8*
%{_mandir}/man8/vipw.8*

%lang(pl) %{_mandir}/pl/man1/arch.1*
%lang(pl) %{_mandir}/pl/man1/colrm.1*
%lang(pl) %{_mandir}/pl/man1/getopt.1*
%lang(pl) %{_mandir}/pl/man1/hexdump.1*
%lang(pl) %{_mandir}/pl/man1/kill.1*
%lang(pl) %{_mandir}/pl/man1/look.1*
%lang(pl) %{_mandir}/pl/man1/script.1*
%lang(pl) %{_mandir}/pl/man1/ul.1*
%lang(pl) %{_mandir}/pl/man1/write.1*

%lang(pl) %{_mandir}/pl/man8/fdformat.8*
%lang(pl) %{_mandir}/pl/man8/ipcrm.8*
%lang(pl) %{_mandir}/pl/man8/ipcs.8*
%lang(pl) %{_mandir}/pl/man8/mkswap.8*

%dir %{_examplesdir}/getopt
%attr(755,root,root) %{_examplesdir}/getopt/*
%{_datadir}/misc/more.help

%attr(755,root,root) /sbin/cfdisk
%attr(755,root,root) /sbin/fdisk
%attr(755,root,root) /sbin/fsck.minix
%attr(755,root,root) /sbin/mkfs.minix
%attr(755,root,root) /sbin/sfdisk

%{_mandir}/man8/cfdisk.8*
%{_mandir}/man8/fdisk.8*
%{_mandir}/man8/sfdisk.8*
%{_mandir}/man8/fsck.minix.8*
%{_mandir}/man8/mkfs.minix.8*
%{_mandir}/man8/mkfs.8*

%lang(pl) %{_mandir}/pl/man8/fdisk.8*

%attr(755,root,root) %{_bindir}/cytune

%ifarch %{ix86}
%attr(755,root,root) %{_sbindir}/ramsize
%attr(755,root,root) %{_sbindir}/rdev
%attr(755,root,root) %{_sbindir}/rootflags
%attr(755,root,root) %{_sbindir}/vidmode

%{_mandir}/man8/ramsize.8*
%{_mandir}/man8/rdev.8*
%{_mandir}/man8/rootflags.8*
%{_mandir}/man8/vidmode.8*
%endif

%{_infodir}/ipc*

%ghost /var/lock/wtmpxlock

%files -n mount
%defattr(644,root,root,755)

%attr(4755,root,root) /bin/mount
%attr(4755,root,root) /bin/umount
%{?_with_pivot_root:%attr(755,root,root) /sbin/pivot_root}
%attr(755,root,root) /sbin/swapon
%attr(755,root,root) /sbin/swapoff

%{_mandir}/man5/fstab.5*
%{_mandir}/man5/nfs.5*

%{_mandir}/man8/mount.8*
%{_mandir}/man8/umount.8*
%{?_with_pivot_root:%{_mandir}/man8/pivot_root.8*}
%{_mandir}/man8/swapon.8*
%{_mandir}/man8/swapoff.8*

%lang(pl) %{_mandir}/pl/man8/mount.8*
%lang(pl) %{_mandir}/pl/man8/umount.8*
%lang(pl) %{_mandir}/pl/man8/swapon.8*
%lang(pl) %{_mandir}/pl/man8/swapoff.8*

%lang(pl) %{_mandir}/pl/man5/fstab.5*

%files -n losetup
%defattr(644,root,root,755)

%{_mandir}/man8/losetup.8*
%attr(755,root,root) /sbin/losetup

%files chkdupexe
%defattr(644,root,root,755)
%attr(0755,root,root) %{_bindir}/chkdupexe
%{_mandir}/man1/chkdupexe.1*

%lang(pl) %{_mandir}/pl/man1/chkdupexe.1*

%files -n tunelp
%defattr(644,root,root,755)
%attr(0755,root,root) %{_sbindir}/tunelp
%{_mandir}/man8/tunelp.8*
%lang(pl) %{_mandir}/pl/man8/tunelp.8*

%files -n login
%defattr(644,root,root,755)
%attr(640,root,root) %config(noreplace) %verify(not mtime size md5) /etc/pam.d/login
%attr(640,root,root) %config(noreplace) %verify(not size mtime md5) /etc/security/blacklist.login
%attr(0755,root,root) /bin/login
%{_mandir}/man1/login.1*
%lang(pl) %{_mandir}/pl/man1/login.1*

%files -n agetty
%defattr(644,root,root,755)
%attr(0755,root,root) /sbin/agetty
%{_mandir}/man8/agetty.8*

%files -n rawdevices
%defattr(644,root,root,755)
%attr(0755,root,root) %{_bindir}/raw
%attr(0750,root,root) /etc/rc.d/init.d/rawdevices
%attr(0640,root,root) %config(noreplace) /etc/sysconfig/rawdevices
%{_mandir}/man8/raw.8*
