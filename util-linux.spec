Summary:	Collection of basic system utilities for Linux
Summary(de):	Sammlung von grundlegenden Systemdienstprogrammen f�r Linux
Summary(fr):	Ensemble d'utilitaires syst�me de base pour Linux
Summary(pl):	Zbi�r podstawowych narz�dzi systemowych dla Linuxa
Summary(tr):	Temel sistem ara�lar�
Name:		util-linux
Version:	2.10b
Release:	1
Copyright:	distributable
Group:		Utilities/System
Group(pl):	Narz�dzia/System
Source0:	ftp://ftp.win.tue.nl/pub/linux-local/utils/util-linux/%{name}-%{version}.tar.gz
Source1:	chfn.pamd
Source2:	chsh.pamd
Source3:	login.pamd
Source4:	kill.1.pl
Source5:	arch.1.pl
Source6:	login.1.pl
Source7:	look.1.pl
Source8:	script.1.pl
Source9:	write.1.pl
Source10:	getopt.1.pl
Source11:	colrm.1.pl
Source12:	hexdump.1.pl
Source13:	ul.1.pl
Source14:	ipcrm.8.pl
Source15:	ipcs.8.pl
Source16:	kbdrate.8.pl
Source17:	fdformat.8.pl
Source18:	mkswap.8.pl
Source19:	fdisk.8.pl
Source20:	umount.8.pl
Source21:	mount.8.pl
Source22:	swapon.8.pl
Source23:	swapoff.8.pl
Source24:	fstab.5.pl
Source25:	chkdupexe.1.pl
Source26:	tunelp.8.pl
Patch0:		util-linux-MCONFIG.patch
Patch1:		util-linux-fdisk.patch
Patch2:		util-linux-po.patch
Patch3:		util-linux-utmpx.patch
Patch4:		util-linux-fhs.patch
Patch5:		util-linux-login.patch
#Patch6:		util-linux-cipher.patch
BuildRequires:	pam-devel >= 0.66
BuildRequires:	ncurses-devel >= 5.0
BuildRequires:	gettext-devel
Requires:	pam >= 0.66
Requires:	/sbin/install-info
Buildroot:	/tmp/%{name}-%{version}-root
Obsoletes:	util-linux-suids

%description
util-linux contains a large variety of low-level system utilities necessary
for a functional Linux system. This includes, among other things,
configuration tools such as fdisk and system programs such as login.

%description -l de
util-linux enth�lt eine gro�e Anzahl an low-level-Systemdienstprogrammen,
die f�r ein funktionierendes Linux-System erforderlich sind. Dazu geh�ren
Konfigurationstools wie 'fdisk' und Systemprogramme wie 'login'.

%description -l fr
util-linux contient une grande vari�t� d'utilitaire syst�me bas niveau
n�cessaires au fonctionnement d'un syst�me Linux. Cela comprend, entre
autres, les outils de configuration comme fdisk et des programmes
syst�mes comme login.

%description -l pl
Util-linux zawiera wiele r�nych, niskopoziomowych narz�dzi systemowych
niezb�dnych do prawid�owego dzia�ania Linuxa. W pakiecie znajduj� si� mi�dzy 
innymi, narz�dzia konfiguracyjne takie jak fdisk i programy systemowe takie 
jak login.

%description -l tr
�levsel durumdaki bir Linux sistemi i�in gerekli bir�ok alt d�zey sistem
ara�lar�n� i�erir. Bunlar aras�nda fdisk gibi yap�land�rma uygulamalar� ve
login gibi sistem programlar� say�labilir.

%package -n losetup
Summary:	programs for setting up and configuring loopback devices
Summary(de):	Programme zum Einrichten und Konfigurieren von Loopback-Ger�ten
Summary(fr):	programmes pour mettre en place et configurer les loopback
Summary(pl):	Program do konfiguracji urz�dzenia blokowego loopback
Summary(tr):	Yerel-�evrim ayg�tlar�n�n kurulmas� ve ayarlanmas� i�in programlar
Group:		Utilities/System
Group(pl):	Narz�dzia/System

%description -n losetup
Linux supports a special block device called the loopback device, which
maps a normal file onto a virtual block device. This package contains
programs for setting up and removing the mapping between files and loopback
devices. 

Block loopback devices should not be confused with the networking loopback
device, which is configured with the normal ifconfig command.

%description -l de -n losetup
Linux unterst�tzt ein spezielles Blockger�t, das sogenannte Loopback, das 
eine normale Datei auf ein virtuelles Blockger�t abbildet. Das Paket 
enth�lt Programme zum Einrichten und Entfernen der Zuordnung zwischen 
Dateien und Loopback-Ger�ten.  

%description -l fr -n losetup
Linux g�re un p�riph�rique bloc sp�cial appel� � loopback �, qui correspond
� un fichier normal sur un p�riph�rique bloc virtuel. Ce paquetage contient
les programmes pour configurer et supprimer la correspondance entre les
fichiers et les p�riph�riques loopback.

Les p�riph�riques bloc loopback ne doivent pas �tre confondus avec le
p�riph�rique loopback du r�seau, configur� avec la commande ifconfig normale.

%description -l pl -n losetup 
Linux ma wsparcie dla specjalnego urz�dzenia blokowego loopback, kt�re mapuje
normalny plik w wirtualne urz�dzenie blokowe. Pakiet ten zawiera program przy
pomocy kt�rego b�dziesz m�g� wykorzysta� to urz�dzenie. 

Urz�dzenie blokowe loopback nie powinno by� mylone z sieciowym interfejsem 
loopback, kt�ry jest konfigurowany przy pomocy polecenia ifconfig.

%description -l tr -n losetup
Linux �zel bir blok ayg�t olan yerel-�evrim ayg�t�n� (loopback device)
destekler. Bu ayg�t normal bir dosyan�n sanal bir blok ayg�t� �zerine
haritas�n� ��kar�r. Bu paket, dosyalar ve yerel-�evrim ayg�tlar� aras�ndaki
haritalama i�leminin kurulmas� ve kald�r�lmas� i�in programlar i�erir.
Blok yerel-�evrim ayg�t� ifconfig komutu ile yap�land�r�lan a� yerel-�evrim
ayg�t� ile kar��t�r�lmamal�d�r.

%package -n mount
Summary:	Programs for mounting and unmounting filesystems
Summary(de):	Programme zum Montieren und Abmontieren von Dateisystemen
Summary(fr):	Programme pour monter et d�monter des syst�mes de fichiers.
Summary(pl):	Programy do montowania i odmontowywania systemu plik�w
Summary(tr):	Dosya sistemlerini ba�lamak ve ��zmek i�in programlar
Group:		Utilities/System
Group(pl):	Narz�dzia/System

%description -n mount
Mount is used for adding new filesystems, both local and networked, to
your current directory structure. The filesystems must already exist for
this to work. It can also be used to change the access types the kernel
uses for already-mounted filesystems.

This package is critical for the functionality of your system.

%description -l de -n mount
Mount wird zum Hinzuf�gen neuer Dateisysteme (lokal und im Netzwerk)
zu Ihrer aktuellen Verzeichnisstruktur verwendet. Die Dateisysteme m�ssen
bereits existieren. Au�erdem k�nnen die Zugriffstypen ge�ndert werden, die
der Kernel f�r bereits montierte Dateisysteme verwendet.

Dieses Paket ist f�r Ihr System unbedingt erforderlich .

%description -l fr -n mount
mount sert � ajouter de nouveaux syst�mes de fichiers, locaux ou r�seaux,
� votre structure de r�pertoire. Les syst�mes de fichiers doivent d�j�
exister pour que cela fonctionne. Il peut aussi servir � changer les types
d'acc�s pour les syst�mes de fichiers d�j� mont�s.

Ce paquetage est critique pour le fonctionnement de votre syst�me.   

%description -l pl -n mount
Program mount jest u�ywany przez system do montowania systemu plik�w, zr�wno
lokalnych jak i sieciowych (np. NFS). 

Pakiet ten jest niezb�dny do prawid�owej pracy twojego Linuxa.

%description -l tr -n mount
mount, hem yerel hem de a� dosya sistemlerinin dizin yap�s�na eklenmesi i�in
kullan�l�r. Bunun i�in ba�lanacak dosya sisteminin �nceden haz�rlanm�� olmas�
gerekir. Ayn� zamanda �ekirde�in ba�lanm�� dosya sistemlerine eri�imini
de�i�tirmek i�in de kullan�l�r. Bu paket sisteminizin i�levselli�i a��s�ndan
kritiktir.

%package	chkdupexe
Summary:	chkdupexe - find duplicate executables
Summary(pl):	chkdupexe odszukuje powtarzaj�ce sie pliki uruchamialne
Group:		Utilities/System
Group(pl):      Narz�dzia/System

%description chkdupexe
chkdupexe  will  scan  the  union of $PATH and a hardcoded
list of common locations for  binaries.   It  will  report
dangling symlinks and duplicately-named binaries.

%description chkdupexe -l pl
chkdupexe przeszukuje katalogi z $PATH oraz inne powszechnie znane
katalogi z plikami uruchamialnymi i informuje o powtarzaj�cych si� plikach
w r�nych katalogach.

%package -n tunelp
Summary:        configures kernel parallel port driver
Summary(de):    konfiguriert den Kerneltreiber f�r den parallelen Port
Summary(fr):    Configure le pilote du port parall�le dans le noyau
Summary(pl):    Program do konfigurowania sterownika portu r�wnoleg�ego
Summary(tr):    �ekirde�in paralel ba�lant� noktas� s�r�c�s�n� ayarlar
Group:          Utilities/System
Group(pl):      Narz�dzia/System

%description -n tunelp
`tunelp' aids in configuring the kernel parallel port driver.

%description -n tunelp -l de
TUNELP hilft bei der Konfiguration des Kernel-Parallelport-Treibers.

%description -n tunelp -l fr
� tunelp � aide � configurer le pilote du noyau pour le port parall�le.

%description -n tunelp -l pl
Program do konfigurowania sterownika portu r�wnoleg�ego.

%description -n tunelp -l tr
Paralel ba�lant� noktas� s�r�c�s�n� ayarlar.

%prep
%setup  -q 
%patch0 -p1 
%patch1 -p1
%patch2 -p1 
%patch3 -p1 
%patch4 -p1
%patch5 -p1 
#%patch6 -p1

%build

%configure

make	OPT="$RPM_OPT_FLAGS" \
	MOREHELPDIR=%{_datadir}/misc

%install
rm -rf $RPM_BUILD_ROOT

install -d $RPM_BUILD_ROOT/{bin,sbin,etc/{pam.d,logrotate}} \
	$RPM_BUILD_ROOT{%{_bindir},%{_sbindir},%{_libdir},%{_infodir},%{_datadir}/misc} \
	$RPM_BUILD_ROOT%{_mandir}/{man{1,5,6,8},pl/man{1,5,6,8}}

make install \
	DESTDIR="$RPM_BUILD_ROOT" \
	INSTALLSUID="install -m 4711" \
	MOREHELPDIR=$RPM_BUILD_ROOT%{_datadir}/misc \
	localedir=$RPM_BUILD_ROOT%{_datadir}/locale \
	USE_TTY_GROUP=no

make -C po install \
	prefix=$RPM_BUILD_ROOT%{_prefix}

install %{SOURCE1} $RPM_BUILD_ROOT/etc/pam.d/chfn
install %{SOURCE2} $RPM_BUILD_ROOT/etc/pam.d/chsh
install %{SOURCE3} $RPM_BUILD_ROOT/etc/pam.d/login

install %{SOURCE4} $RPM_BUILD_ROOT%{_mandir}/pl/man1/kill.1
install %{SOURCE5} $RPM_BUILD_ROOT%{_mandir}/pl/man1/arch.1
install %{SOURCE6} $RPM_BUILD_ROOT%{_mandir}/pl/man1/login.1
install %{SOURCE7} $RPM_BUILD_ROOT%{_mandir}/pl/man1/look.1
install %{SOURCE8} $RPM_BUILD_ROOT%{_mandir}/pl/man1/script.1
install %{SOURCE9} $RPM_BUILD_ROOT%{_mandir}/pl/man1/write.1
install %{SOURCE10} $RPM_BUILD_ROOT%{_mandir}/pl/man1/getopt.1
install %{SOURCE11} $RPM_BUILD_ROOT%{_mandir}/pl/man1/colrm.1
install %{SOURCE12} $RPM_BUILD_ROOT%{_mandir}/pl/man1/hexdump.1
install %{SOURCE13} $RPM_BUILD_ROOT%{_mandir}/pl/man1/ul.1

install %{SOURCE14} $RPM_BUILD_ROOT%{_mandir}/pl/man8/ipcrm.8
install %{SOURCE15} $RPM_BUILD_ROOT%{_mandir}/pl/man8/ipcs.8
install %{SOURCE16} $RPM_BUILD_ROOT%{_mandir}/pl/man8/kbdrate.8
install %{SOURCE17} $RPM_BUILD_ROOT%{_mandir}/pl/man8/fdformat.8
install %{SOURCE18} $RPM_BUILD_ROOT%{_mandir}/pl/man8/mkswap.8

%ifarch %{ix86} alpha
install %{SOURCE19} $RPM_BUILD_ROOT%{_mandir}/pl/man8/fdisk.8
%endif

install %{SOURCE20} $RPM_BUILD_ROOT%{_mandir}/pl/man8/umount.8
install %{SOURCE21} $RPM_BUILD_ROOT%{_mandir}/pl/man8/mount.8
install %{SOURCE22} $RPM_BUILD_ROOT%{_mandir}/pl/man8/swapon.8
install %{SOURCE23} $RPM_BUILD_ROOT%{_mandir}/pl/man8/swapoff.8

install %{SOURCE24} $RPM_BUILD_ROOT%{_mandir}/pl/man5/fstab.5

install %{SOURCE25} $RPM_BUILD_ROOT%{_mandir}/pl/man1/chkdupexe.1

install %{SOURCE26} $RPM_BUILD_ROOT%{_mandir}/pl/man8/tunelp.8

install -d $RPM_BUILD_ROOT/{etc/security,var/lock}

touch $RPM_BUILD_ROOT/etc/security/{chsh,chfn}
:> $RPM_BUILD_ROOT/var/lock/wtmpxlock

strip $RPM_BUILD_ROOT/{bin/*,sbin/*,usr/bin/*,usr/sbin/*} || :

%ifarch %{ix86} 
ln -sf	hwclock $RPM_BUILD_ROOT/sbin/clock
echo	.so hwclock.8 > $RPM_BUILD_ROOT%{_mandir}/man8/clock.8
%endif

ln -sf swapon $RPM_BUILD_ROOT/sbin/swapoff

gzip -9fn $RPM_BUILD_ROOT%{_mandir}/{man*/*,pl/man*/*} \
	*/README.* $RPM_BUILD_ROOT%{_infodir}/*

%find_lang %{name}

%clean
rm -rf $RPM_BUILD_ROOT

%files -f %{name}.lang

%defattr(644,root,root,755)
%doc */README.*

%ifarch i386 i486 i586 i686
%attr(755,root,root) /sbin/clock
%attr(755,root,root) /sbin/hwclock

%{_mandir}/man8/hwclock.8.gz
%{_mandir}/man8/clock.8.gz
%endif

%attr(640,root,root) %config(noreplace) %verify(not mtime size md5) /etc/pam.d/login
%attr(640,root,root) %config(noreplace) %verify(not size mtime md5) /etc/fdprm

%attr(0755,root,root) /bin/arch
%attr(0755,root,root) /bin/dmesg
%attr(0755,root,root) /bin/kill
%attr(0755,root,root) /bin/login
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
%attr(0755,root,root) %{_sbindir}/rootflags
%attr(0755,root,root) /usr/games/banner
%attr(0755,root,root) %{_sbindir}/vipw
%attr(0755,root,root) %{_sbindir}/vigr
%attr(0755,root,root) %{_sbindir}/readprofile

%{_mandir}/man1/arch.1*
%{_mandir}/man1/readprofile.1*
%{_mandir}/man1/login.1*
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

%lang(pl) %{_mandir}/pl/man1/kill.1*
%lang(pl) %{_mandir}/pl/man1/arch.1*
%lang(pl) %{_mandir}/pl/man1/login.1*
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

%dir %{_libdir}/getopt
%attr(755,root,root) %{_libdir}/getopt/*
%{_datadir}/misc/more.help

%ifarch %{ix86} alpha
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
%endif

%ifnarch sparc
%attr(755,root,root) %{_bindir}/cytune
%endif

%ifarch %{ix86}
%attr(755,root,root) %{_sbindir}/rdev
%attr(755,root,root) %{_sbindir}/swapdev
%attr(755,root,root) %{_sbindir}/vidmode
%attr(755,root,root) %{_sbindir}/ramsize

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

%attr(755,root,root) /bin/mount
%attr(755,root,root) /bin/umount
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
