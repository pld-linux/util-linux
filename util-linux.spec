Summary:	Collection of basic system utilities for Linux
Summary(de):	Sammlung von grundlegenden Systemdienstprogrammen für Linux
Summary(fr):	Ensemble d'utilitaires système de base pour Linux
Summary(pl):	Zbiór podstawowych narzêdzi systemowych dla Linuxa
Summary(tr):	Temel sistem araçlarý
Name:		util-linux
Version:	2.10o
Release:	5
License:	Distributable
Group:		Utilities/System
Group(pl):	Narzêdzia/System
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
Source14:	kbdrate.8.pl
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
Patch0:		util-linux-MCONFIG.patch
Patch1:		util-linux-fdisk.patch
Patch2:		util-linux-utmpx.patch
Patch3:		util-linux-fhs.patch
Patch4:		util-linux-login.patch
%{?nocrypto:#}Patch5:		util-linux-kerneli.patch
Patch6:		util-linux-info.patch
Patch7:		util-linux-fdisk2.patch
Patch8:		ftp://ftp.sourceforge.net/pub/nfs/util-linux-2.10f-mount-tcp.patch
Patch9:		ftp://ftp.sourceforge.net/pub/nfs/util-linux-2.10m-mount-compat.patch
Patch10:	ftp://ftp.sourceforge.net/pub/nfs/util-linux-2.10m-mount-nfsv3.patch
Patch11:	ftp://ftp.sourceforge.net/pub/nfs/util-linux-2.10m-mount-rpc.patch
Patch12:	util-linux-syscall.patch 
%{?norawio:#}Patch13:	util-linux-2.10o-rawio.patch
BuildRequires:	pam-devel >= 0.66
BuildRequires:	ncurses-devel >= 5.0
BuildRequires:	gettext-devel
BuildRequires:	texinfo
Requires:	pam >= 0.66
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)
Obsoletes:	util-linux-suids

%description
util-linux contains a large variety of low-level system utilities
necessary for a functional Linux system. This includes, among other
things, configuration tools such as fdisk and system programs such as
login.

%description -l de
util-linux enthält eine große Anzahl an
low-level-Systemdienstprogrammen, die für ein funktionierendes
Linux-System erforderlich sind. Dazu gehören Konfigurationstools wie
'fdisk' und Systemprogramme wie 'login'.

%description -l fr
util-linux contient une grande variété d'utilitaire système bas niveau
nécessaires au fonctionnement d'un système Linux. Cela comprend, entre
autres, les outils de configuration comme fdisk et des programmes
systèmes comme login.

%description -l pl
Util-linux zawiera wiele ró¿nych, niskopoziomowych narzêdzi
systemowych niezbêdnych do prawid³owego dzia³ania Linuxa. W pakiecie
znajduj± siê miêdzy innymi, narzêdzia konfiguracyjne takie jak fdisk i
programy systemowe takie jak login.

%description -l tr
þlevsel durumdaki bir Linux sistemi için gerekli birçok alt düzey
sistem araçlarýný içerir. Bunlar arasýnda fdisk gibi yapýlandýrma
uygulamalarý ve login gibi sistem programlarý sayýlabilir.

%package -n losetup
Summary:	programs for setting up and configuring loopback devices
Summary(de):	Programme zum Einrichten und Konfigurieren von Loopback-Geräten
Summary(fr):	programmes pour mettre en place et configurer les loopback
Summary(pl):	Program do konfiguracji urz±dzenia blokowego loopback
Summary(tr):	Yerel-çevrim aygýtlarýnýn kurulmasý ve ayarlanmasý için programlar
Group:		Utilities/System
Group(pl):	Narzêdzia/System

%description -n losetup
Linux supports a special block device called the loopback device,
which maps a normal file onto a virtual block device. This package
contains programs for setting up and removing the mapping between
files and loopback devices.

Block loopback devices should not be confused with the networking
loopback device, which is configured with the normal ifconfig command.

%description -l de -n losetup
Linux unterstützt ein spezielles Blockgerät, das sogenannte Loopback,
das eine normale Datei auf ein virtuelles Blockgerät abbildet. Das
Paket enthält Programme zum Einrichten und Entfernen der Zuordnung
zwischen Dateien und Loopback-Geräten.

%description -l fr -n losetup
Linux gère un périphérique bloc spécial appelé « loopback », qui
correspond à un fichier normal sur un périphérique bloc virtuel. Ce
paquetage contient les programmes pour configurer et supprimer la
correspondance entre les fichiers et les périphériques loopback.

Les périphériques bloc loopback ne doivent pas être confondus avec le
périphérique loopback du réseau, configuré avec la commande ifconfig
normale.

%description -l pl -n losetup 
Linux ma wsparcie dla specjalnego urz±dzenia blokowego loopback, które
mapuje normalny plik w wirtualne urz±dzenie blokowe. Pakiet ten
zawiera program przy pomocy którego bêdziesz móg³ wykorzystaæ to
urz±dzenie.

Urz±dzenie blokowe loopback nie powinno byæ mylone z sieciowym
interfejsem loopback, który jest konfigurowany przy pomocy polecenia
ifconfig.

%description -l tr -n losetup
Linux özel bir blok aygýt olan yerel-çevrim aygýtýný (loopback device)
destekler. Bu aygýt normal bir dosyanýn sanal bir blok aygýtý üzerine
haritasýný çýkarýr. Bu paket, dosyalar ve yerel-çevrim aygýtlarý
arasýndaki haritalama iþleminin kurulmasý ve kaldýrýlmasý için
programlar içerir. Blok yerel-çevrim aygýtý ifconfig komutu ile
yapýlandýrýlan að yerel-çevrim aygýtý ile karýþtýrýlmamalýdýr.

%package -n mount
Summary:	Programs for mounting and unmounting filesystems
Summary(de):	Programme zum Montieren und Abmontieren von Dateisystemen
Summary(fr):	Programme pour monter et démonter des systèmes de fichiers.
Summary(pl):	Programy do montowania i odmontowywania systemu plików
Summary(tr):	Dosya sistemlerini baðlamak ve çözmek için programlar
Group:		Utilities/System
Group(pl):	Narzêdzia/System

%description -n mount
Mount is used for adding new filesystems, both local and networked, to
your current directory structure. The filesystems must already exist
for this to work. It can also be used to change the access types the
kernel uses for already-mounted filesystems.

This package is critical for the functionality of your system.

%description -l de -n mount
Mount wird zum Hinzufügen neuer Dateisysteme (lokal und im Netzwerk)
zu Ihrer aktuellen Verzeichnisstruktur verwendet. Die Dateisysteme
müssen bereits existieren. Außerdem können die Zugriffstypen geändert
werden, die der Kernel für bereits montierte Dateisysteme verwendet.

Dieses Paket ist für Ihr System unbedingt erforderlich .

%description -l fr -n mount
mount sert à ajouter de nouveaux systèmes de fichiers, locaux ou
réseaux, à votre structure de répertoire. Les systèmes de fichiers
doivent déjà exister pour que cela fonctionne. Il peut aussi servir à
changer les types d'accès pour les systèmes de fichiers déjà montés.

Ce paquetage est critique pour le fonctionnement de votre système.

%description -l pl -n mount
Program mount jest u¿ywany przez system do montowania systemu plików,
zrówno lokalnych jak i sieciowych (np. NFS).

Pakiet ten jest niezbêdny do prawid³owej pracy twojego Linuxa.

%description -l tr -n mount
mount, hem yerel hem de að dosya sistemlerinin dizin yapýsýna
eklenmesi için kullanýlýr. Bunun için baðlanacak dosya sisteminin
önceden hazýrlanmýþ olmasý gerekir. Ayný zamanda çekirdeðin baðlanmýþ
dosya sistemlerine eriþimini deðiþtirmek için de kullanýlýr. Bu paket
sisteminizin iþlevselliði açýsýndan kritiktir.

%package chkdupexe
Summary:	chkdupexe - find duplicate executables
Summary(pl):	chkdupexe odszukuje powtarzaj±ce sie pliki uruchamialne
Group:		Utilities/System
Group(pl):	Narzêdzia/System

%description chkdupexe
chkdupexe will scan the union of $PATH and a hardcoded list of common
locations for binaries. It will report dangling symlinks and
duplicately-named binaries.

%description chkdupexe -l pl
chkdupexe przeszukuje katalogi z $PATH oraz inne powszechnie znane
katalogi z plikami uruchamialnymi i informuje o powtarzaj±cych siê
plikach w ró¿nych katalogach.

%package -n tunelp
Summary:	configures kernel parallel port driver
Summary(de):	konfiguriert den Kerneltreiber für den parallelen Port
Summary(fr):	Configure le pilote du port parallèle dans le noyau
Summary(pl):	Program do konfigurowania sterownika portu równoleg³ego
Summary(tr):	Çekirdeðin paralel baðlantý noktasý sürücüsünü ayarlar
Group:		Utilities/System
Group(pl):	Narzêdzia/System

%description -n tunelp
`tunelp' aids in configuring the kernel parallel port driver.

%description -n tunelp -l de
TUNELP hilft bei der Konfiguration des Kernel-Parallelport-Treibers.

%description -n tunelp -l fr
« tunelp » aide à configurer le pilote du noyau pour le port
parallèle.

%description -n tunelp -l pl
Program do konfigurowania sterownika portu równoleg³ego.

%description -n tunelp -l tr
Paralel baðlantý noktasý sürücüsünü ayarlar.

%package -n login
Summary:	login is used when signing onto a system
Group:		Utilities/System
Group(pl):	Narzêdzia/System
Obsoletes:	heimdal-login

%description -n login
login is used when signing onto a system. It can also be used to
switch from one user to another at any time (most modern shells have
support for this feature built into them, however).

%prep
%setup  -q 
%patch0 -p1 
%patch1 -p1
%patch2 -p1 
%patch3 -p1 
%patch4 -p1
%{?nocrypto:#}%patch5 -p1
%patch6 -p1
%patch7 -p1
%patch8 -p1
%patch9 -p1
%patch10 -p1
%patch11 -p1
%patch12 -p1
%{?norawio:#}%patch13 -p1


%build

CFLAGS="%{!?debug:$RPM_OPT_FLAGS}%{?debug:-O -g} -I%{_includedir}/ncurses"
%configure

make	OPT="%{!?debug:$RPM_OPT_FLAGS}%{?debug:-O -g}" \
	MOREHELPDIR=%{_datadir}/misc

(cd sys-utils; makeinfo ipc.texi)

%install
rm -rf $RPM_BUILD_ROOT

install -d $RPM_BUILD_ROOT/{bin,sbin,etc/{pam.d,logrotate}} \
	$RPM_BUILD_ROOT{%{_bindir},%{_sbindir},%{_infodir},%{_datadir}/misc} \
	$RPM_BUILD_ROOT{%{_examplesdir},%{_mandir}/{man{1,5,6,8},pl/man{1,5,6,8}}}

%{__make} install \
	DESTDIR="$RPM_BUILD_ROOT" \
	INSTALLSUID="install -m 755" \
	MOREHELPDIR=$RPM_BUILD_ROOT%{_datadir}/misc \
	GETOPTDIR=$RPM_BUILD_ROOT%{_examplesdir}/getopt \
	USE_TTY_GROUP=no

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
install %{SOURCE14} $RPM_BUILD_ROOT%{_mandir}/pl/man8/kbdrate.8
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

install -d $RPM_BUILD_ROOT/{etc/security,var/lock}

touch $RPM_BUILD_ROOT/etc/security/blacklist.login

:> $RPM_BUILD_ROOT/var/lock/wtmpxlock

ln -sf	hwclock $RPM_BUILD_ROOT/sbin/clock
echo	'.so hwclock.8' > $RPM_BUILD_ROOT%{_mandir}/man8/clock.8

ln -sf swapon $RPM_BUILD_ROOT/sbin/swapoff

gzip -9fn */README.*

%find_lang %{name}

%post
[ ! -x /usr/sbin/fix-info-dir ] || /usr/sbin/fix-info-dir -c %{_infodir} >/dev/null 2>&1

%postun
[ ! -x /usr/sbin/fix-info-dir ] || /usr/sbin/fix-info-dir -c %{_infodir} >/dev/null 2>&1

%clean
rm -rf $RPM_BUILD_ROOT

%files -f %{name}.lang
%defattr(644,root,root,755)
%doc */README.*

%attr(755,root,root) /sbin/clock
%attr(755,root,root) /sbin/hwclock

%{_mandir}/man8/hwclock.8*
%{_mandir}/man8/clock.8*

%attr(640,root,root) %config(noreplace) %verify(not size mtime md5) /etc/fdprm

%attr(0755,root,root) /bin/arch
%attr(0755,root,root) /bin/dmesg
%attr(0755,root,root) /bin/kill
%attr(0755,root,root) /bin/more
%attr(0755,root,root) /sbin/mkfs
%attr(0755,root,root) /sbin/mkswap
%attr(0755,root,root) /sbin/ctrlaltdel
%attr(0755,root,root) /sbin/kbdrate
%attr(0755,root,root) %{_bindir}/cal
%attr(0755,root,root) %{_bindir}/col
%attr(0755,root,root) %{_bindir}/colcrt
%attr(0755,root,root) %{_bindir}/colrm
%attr(0755,root,root) %{_bindir}/column
%attr(0755,root,root) %{_bindir}/hexdump
%attr(0755,root,root) %{_bindir}/rev
%attr(0755,root,root) %{_bindir}/ul
%attr(0755,root,root) %{_bindir}/ddate
%attr(0755,root,root) %{_bindir}/fdformat
%attr(0755,root,root) %{_bindir}/newgrp
%attr(0755,root,root) %{_bindir}/setfdprm
%attr(0755,root,root) %{_bindir}/logger
%attr(0755,root,root) %{_bindir}/look
%attr(0755,root,root) %{_bindir}/mcookie
%attr(0755,root,root) %{_bindir}/namei
%attr(0755,root,root) %{_bindir}/script
%attr(0755,root,root) %{_bindir}/setsid
%attr(0755,root,root) %{_bindir}/setterm
%attr(0755,root,root) %{_bindir}/whereis
%attr(2755,root, tty) %{_bindir}/write
%attr(0755,root,root) %{_bindir}/getopt
%attr(0755,root,root) %{_bindir}/ipcrm
%attr(0755,root,root) %{_bindir}/ipcs
%attr(0755,root,root) %{_bindir}/renice
%{?norawio:#}%attr(0755,root,root) %{_bindir}/raw
%attr(0755,root,root) /usr/games/banner
%attr(0755,root,root) %{_sbindir}/vipw
%attr(0755,root,root) %{_sbindir}/vigr
%attr(0755,root,root) %{_sbindir}/readprofile

%{_mandir}/man1/arch.1*
%{_mandir}/man1/readprofile.1*
%{_mandir}/man1/newgrp.1*
%{_mandir}/man1/ddate.1*
%{_mandir}/man1/cal.1*
%{_mandir}/man1/kill.1*
%{_mandir}/man1/logger.1*
%{_mandir}/man1/look.1*
%{_mandir}/man1/mcookie.1*
%{_mandir}/man1/more.1*
%{_mandir}/man1/namei.1*
%{_mandir}/man1/script.1*
%{_mandir}/man1/setterm.1*
%{_mandir}/man1/whereis.1*
%{_mandir}/man1/write.1*
%{_mandir}/man1/getopt.1*
%{_mandir}/man1/col.1*
%{_mandir}/man1/colcrt.1*
%{_mandir}/man1/colrm.1*
%{_mandir}/man1/column.1*
%{_mandir}/man1/hexdump.1*
%{_mandir}/man1/rev.1*
%{_mandir}/man1/ul.1*

%{_mandir}/man6/banner.6*

%{_mandir}/man8/cytune.8*
%{_mandir}/man8/ctrlaltdel.8*
%{_mandir}/man8/dmesg.8*
%{_mandir}/man8/ipcrm.8*
%{_mandir}/man8/ipcs.8*
%{_mandir}/man8/kbdrate.8*
%{_mandir}/man8/renice.8*
%{_mandir}/man8/setsid.8*
%{_mandir}/man8/vipw.8*
%{_mandir}/man8/fdformat.8*
%{_mandir}/man8/mkswap.8*
%{_mandir}/man8/setfdprm.8*
%{?norawio:#}%{_mandir}/man8/raw.8*

%lang(pl) %{_mandir}/pl/man1/kill.1*
%lang(pl) %{_mandir}/pl/man1/arch.1*
%lang(pl) %{_mandir}/pl/man1/look.1*
%lang(pl) %{_mandir}/pl/man1/script.1*
%lang(pl) %{_mandir}/pl/man1/write.1*
%lang(pl) %{_mandir}/pl/man1/getopt.1*
%lang(pl) %{_mandir}/pl/man1/colrm.1*
%lang(pl) %{_mandir}/pl/man1/hexdump.1*
%lang(pl) %{_mandir}/pl/man1/ul.1*

%lang(pl) %{_mandir}/pl/man8/ipcrm.8*
%lang(pl) %{_mandir}/pl/man8/ipcs.8*
%lang(pl) %{_mandir}/pl/man8/kbdrate.8*
%lang(pl) %{_mandir}/pl/man8/fdformat.8*
%lang(pl) %{_mandir}/pl/man8/mkswap.8*

%dir %{_examplesdir}/getopt
%attr(755,root,root) %{_examplesdir}/getopt/*
%{_datadir}/misc/more.help

%attr(755,root,root) /sbin/fdisk
%attr(755,root,root) /sbin/cfdisk
%attr(755,root,root) /sbin/fsck.minix
%attr(755,root,root) /sbin/mkfs.minix
%attr(755,root,root) /sbin/sfdisk

%{_mandir}/man8/fdisk.8*
%{_mandir}/man8/cfdisk.8*
%{_mandir}/man8/sfdisk.8*
%{_mandir}/man8/fsck.minix.8*
%{_mandir}/man8/mkfs.minix.8*
%{_mandir}/man8/mkfs.8*

%lang(pl) %{_mandir}/pl/man8/fdisk.8*

%attr(755,root,root) %{_bindir}/cytune

%ifarch %{ix86}
%attr(755,root,root) %{_sbindir}/rdev
%attr(755,root,root) %{_sbindir}/swapdev
%attr(755,root,root) %{_sbindir}/vidmode
%attr(755,root,root) %{_sbindir}/ramsize
%attr(755,root,root) %{_sbindir}/rootflags

%{_mandir}/man8/rdev.8*
%{_mandir}/man8/rootflags.8*
%{_mandir}/man8/swapdev.8*
%{_mandir}/man8/vidmode.8*
%{_mandir}/man8/ramsize.8*
%endif

%{_infodir}/ipc*

%ghost /var/lock/wtmpxlock

%files -n mount
%defattr(644,root,root,755)

%attr(4755,root,root) /bin/mount
%attr(4755,root,root) /bin/umount
%attr(755,root,root) /sbin/swapon
%attr(755,root,root) /sbin/swapoff

%{_mandir}/man5/fstab.5*
%{_mandir}/man5/nfs.5*

%{_mandir}/man8/mount.8*
%{_mandir}/man8/swapoff.8*
%{_mandir}/man8/swapon.8*
%{_mandir}/man8/umount.8*

%lang(pl) %{_mandir}/pl/man8/umount.8*
%lang(pl) %{_mandir}/pl/man8/mount.8*
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

%files -n login
%defattr(644,root,root,755)
%attr(640,root,root) %config(noreplace) %verify(not mtime size md5) /etc/pam.d/login
%attr(640,root,root) %config(noreplace) %verify(not size mtime md5) /etc/security/blacklist.login
%attr(0755,root,root) /bin/login
%{_mandir}/man1/login.1*
%lang(pl) %{_mandir}/pl/man1/login.1*
