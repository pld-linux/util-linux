Summary:	Collection of basic system utilities for Linux
Summary(de):	Sammlung von grundlegenden Systemdienstprogrammen f�r Linux
Summary(fr):	Ensemble d'utilitaires syst�me de base pour Linux
Summary(pl):	Zbi�r podstawowych narz�dzi systemowych dla Linuxa
Summary(tr):	Temel sistem ara�lar�
Name:		util-linux
Version:	2.9r
Release:	4
Copyright:	distributable
Group:		Utilities/System
Group(pl):	Narz�dzia/System
URL:		ftp://ftp.win.tue.nl/pub/linux-local/utils/util-linux
Source0:	%{name}-%{version}.tar.bz2
Source1:	chfn.pamd
Source2:	chsh.pamd
Source3:	login.pamd
Patch0:		util-linux-MCONFIG.patch
Patch1:		util-linux-chfn.patch
Patch2:		util-linux-fdisk.patch
Patch3:		util-linux-login.patch
Patch4:		util-linux-misc.patch
Patch5:		util-linux-mkswap.patch
Patch6:		util-linux-more.patch
Patch7:		util-linux-po.patch
Patch8:		util-linux-shutdown.patch
Patch9:		util-linux-kernel23.patch
Patch10:	util-linux-utmpx.patch
Patch11:	util-linux-fhs.patch
BuildPrereq:	pam-devel >= 0.66
BuildPrereq:	ncurses-devel
BuildPrereq:	gettext
Requires:	pam >= 0.66
Requires:	/sbin/install-info
Buildroot:	/tmp/%{name}-%{version}-root
Obsoletes:	util-linux-suids

%description
util-linux contains a large variety of low-level system utilities
necessary for a functional Linux system. This includes, among other
things, configuration tools such as fdisk and system programs such
as login.

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

%package -n	losetup
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

%description -l pl -n losetup 
Linux ma wsparcie dla specjalnego urz�dzenia blokowego loopback, kt�re mapuje
normalny plik w wirtualne urz�dzenie blokowe. Pakiet ten zawiera program przy
pomocy kt�rego b�dziesz m�g� wykorzysta� to urz�dzenie. 

Urz�dzenie blokowe loopback nie powinno by� mylone z sieciowym interfejsem 
loopback, kt�ry jest konfigurowany przy pomocy polecenia ifconfig.

%description -l de -n losetup
Linux unterst�tzt ein spezielles Blockger�t, das sogenannte Loopback, das 
eine normale Datei auf ein virtuelles Blockger�t abbildet. Das Paket 
enth�lt Programme zum Einrichten und Entfernen der Zuordnung zwischen 
Dateien und Loopback-Ger�ten.  

%description -l tr -n losetup
Linux �zel bir blok ayg�t olan yerel-�evrim ayg�t�n� (loopback device)
destekler. Bu ayg�t normal bir dosyan�n sanal bir blok ayg�t� �zerine
haritas�n� ��kar�r. Bu paket, dosyalar ve yerel-�evrim ayg�tlar� aras�ndaki
haritalama i�leminin kurulmas� ve kald�r�lmas� i�in programlar i�erir.
Blok yerel-�evrim ayg�t� ifconfig komutu ile yap�land�r�lan a� yerel-�evrim
ayg�t� ile kar��t�r�lmamal�d�r.

%description -l fr -n losetup
Linux g�re un p�riph�rique bloc sp�cial appel� � loopback �, qui correspond
� un fichier normal sur un p�riph�rique bloc virtuel. Ce paquetage contient
les programmes pour configurer et supprimer la correspondance entre les
fichiers et les p�riph�riques loopback.

Les p�riph�riques bloc loopback ne doivent pas �tre confondus avec le
p�riph�rique loopback du r�seau, configur� avec la commande ifconfig normale.

%package -n	mount
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

%description -l pl -n mount
Program mount jest u�ywany przez system do montowania systemu plik�w, zr�wno
lokalnych jak i sieciowych (np. NFS). 

Pakiet ten jest niezb�dny do prawid�owej pracy twojego Linuxa.

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

%description -l tr -n mount
mount, hem yerel hem de a� dosya sistemlerinin dizin yap�s�na eklenmesi i�in
kullan�l�r. Bunun i�in ba�lanacak dosya sisteminin �nceden haz�rlanm�� olmas�
gerekir. Ayn� zamanda �ekirde�in ba�lanm�� dosya sistemlerine eri�imini
de�i�tirmek i�in de kullan�l�r. Bu paket sisteminizin i�levselli�i a��s�ndan
kritiktir.

%package	uprogs
Summary:	Users programs for manipulate /etc/passwd
Summary(pl):	Programy u�ytkownik�w do manipulacji /etc/passwd 
Group:		Utilities/System
Group(pl):	Narz�dzia/System
Requires:	pam >= 0.66

%description uprogs -l pl
Programy do manipulacji plikiem /etc/passwd. 

%description uprogs
Users programs for manipulate /etc/passwd file.

%prep
%setup   -q 
%patch0  -p1 
%patch1  -p1 
%patch2  -p1 
%patch3  -p1 
%patch4  -p1 
%patch5  -p1 
%patch6  -p1 
%patch7  -p1 
%patch8  -p1 
%patch10 -p1 
%patch11 -p1

%build
# First check running Linux release ... 
RELEASE=`uname -r | head -c 3`
if [ "$RELEASE" = "2.3" ]; then
    patch -p1 < $RPM_SOURCE_DIR/%{name}-kernel23.patch
fi

%configure

make OPT="$RPM_OPT_FLAGS"

%install
rm -rf $RPM_BUILD_ROOT

install -d $RPM_BUILD_ROOT/{bin,sbin,etc/{pam.d,logrotate}}
install -d $RPM_BUILD_ROOT/usr/{bin,sbin,lib,share/{info,misc,man/man{1,5,6,8}}}

make install \
	DESTDIR="$RPM_BUILD_ROOT" \
	INSTALLSUID="install -m 4711" \
	DATAMISCDIR=$RPM_BUILD_ROOT%{_datadir}/misc \
	USE_TTY_GROUP=no

%ifarch i386 i486 i586 i686
mv -f $RPM_BUILD_ROOT%{_bindir}/{swapdev,vidmode,ramsize,rootflags,rdev} \
	$RPM_BUILD_ROOT%{_sbindir}
%endif

mv $RPM_BUILD_ROOT%{_bindir}/readprofile $RPM_BUILD_ROOT%{_sbindir}

install %{SOURCE1} $RPM_BUILD_ROOT/etc/pam.d/chfn
install %{SOURCE2} $RPM_BUILD_ROOT/etc/pam.d/chsh
install %{SOURCE3} $RPM_BUILD_ROOT/etc/pam.d/login

install -d $RPM_BUILD_ROOT/{etc/security,var/lock}

touch $RPM_BUILD_ROOT/etc/security/{chsh,chfn}
:> $RPM_BUILD_ROOT/var/lock/wtmpxlock

strip $RPM_BUILD_ROOT/{bin/*,sbin/*,usr/bin/*,usr/sbin/*} || :

%ifarch i386 i486 i586 i686 
ln -sf	hwclock $RPM_BUILD_ROOT/sbin/clock
echo	.so hwclock.8 > $RPM_BUILD_ROOT%{_mandir}/man8/clock.8
%endif

ln -sf swapon $RPM_BUILD_ROOT/sbin/swapoff

gzip -9fn $RPM_BUILD_ROOT%{_mandir}/man[1568]/* \
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
%attr(0755,root,root) %{_bindir}/tunelp
%attr(0755,root,root) %{_bindir}/whereis
%attr(2711,root, tty) %{_bindir}/write
%attr(0755,root,root) %{_bindir}/getopt
%attr(0755,root,root) %{_bindir}/ipcrm
%attr(0755,root,root) %{_bindir}/ipcs
%attr(0755,root,root) %{_bindir}/renice
%attr(0755,root,root) %{_sbindir}/rootflags
%attr(0755,root,root) /usr/games/banner
%attr(0755,root,root) %{_sbindir}/vipw
%attr(0755,root,root) %{_sbindir}/vigr
%attr(0755,root,root) %{_sbindir}/readprofile

%{_mandir}/man1/arch.1.gz
%{_mandir}/man1/readprofile.1.gz
%{_mandir}/man1/login.1.gz
%{_mandir}/man1/newgrp.1.gz
%{_mandir}/man1/ddate.1.gz
%{_mandir}/man1/cal.1.gz
%{_mandir}/man1/kill.1.gz
%{_mandir}/man1/logger.1.gz
%{_mandir}/man1/look.1.gz
%{_mandir}/man1/mcookie.1.gz
%{_mandir}/man1/more.1.gz
%{_mandir}/man1/namei.1.gz
%{_mandir}/man1/script.1.gz
%{_mandir}/man1/setterm.1.gz
%{_mandir}/man1/whereis.1.gz
%{_mandir}/man1/write.1.gz
%{_mandir}/man1/getopt.1.gz
%{_mandir}/man1/col.1.gz
%{_mandir}/man1/colcrt.1.gz
%{_mandir}/man1/colrm.1.gz
%{_mandir}/man1/column.1.gz
%{_mandir}/man1/hexdump.1.gz
%{_mandir}/man1/rev.1.gz
%{_mandir}/man1/ul.1.gz

%{_mandir}/man6/banner.6.gz

%{_mandir}/man8/cytune.8.gz
%{_mandir}/man8/ctrlaltdel.8.gz
%{_mandir}/man8/dmesg.8.gz
%{_mandir}/man8/ipcrm.8.gz
%{_mandir}/man8/ipcs.8.gz
%{_mandir}/man8/kbdrate.8.gz
%{_mandir}/man8/renice.8.gz
%{_mandir}/man8/setsid.8.gz
%{_mandir}/man8/tunelp.8.gz
%{_mandir}/man8/vipw.8.gz
%{_mandir}/man8/fdformat.8.gz
%{_mandir}/man8/mkswap.8.gz
%{_mandir}/man8/setfdprm.8.gz

%dir %{_libdir}/getopt
%attr(755,root,root) %{_libdir}/getopt/*
%{_datadir}/misc/more.help

%ifarch i386 i486 i586 i686 alpha
%attr(755,root,root) /sbin/fdisk
%attr(755,root,root) /sbin/cfdisk
%attr(755,root,root) /sbin/fsck.minix
%attr(755,root,root) /sbin/mkfs.minix
%attr(755,root,root) /sbin/sfdisk

%{_mandir}/man8/fdisk.8.gz
%{_mandir}/man8/cfdisk.8.gz
%{_mandir}/man8/sfdisk.8.gz
%{_mandir}/man8/fsck.minix.8.gz
%{_mandir}/man8/mkfs.minix.8.gz
%{_mandir}/man8/mkfs.8.gz
%endif

%ifnarch sparc
%attr(755,root,root) %{_bindir}/cytune
%endif

%ifarch i386 i486 i586 i686
%attr(755,root,root) %{_sbindir}/rdev
%attr(755,root,root) %{_sbindir}/swapdev
%attr(755,root,root) %{_sbindir}/vidmode
%attr(755,root,root) %{_sbindir}/ramsize

%{_mandir}/man8/rdev.8.gz
%{_mandir}/man8/rootflags.8.gz
%{_mandir}/man8/swapdev.8.gz
%{_mandir}/man8/vidmode.8.gz
%{_mandir}/man8/ramsize.8.gz
%endif

%{_infodir}/ipc*

%ghost /var/lock/wtmpxlock

%files -n mount
%defattr(644,root,root,755)

%attr(755,root,root) /bin/mount
%attr(755,root,root) /bin/umount
%attr(755,root,root) /sbin/swapon
%attr(755,root,root) /sbin/swapoff

%{_mandir}/man5/fstab.5.gz
%{_mandir}/man5/nfs.5.gz

%{_mandir}/man8/mount.8.gz
%{_mandir}/man8/swapoff.8.gz
%{_mandir}/man8/swapon.8.gz
%{_mandir}/man8/umount.8.gz

%files -n losetup
%defattr(644,root,root,755)

%{_mandir}/man8/losetup.8.gz
%attr(755,root,root) /sbin/losetup

%files uprogs
%defattr(640,root,root,755)

%config(noreplace) %verify(not mtime size md5) /etc/pam.d/chfn
%config(noreplace) %verify(not mtime size md5) /etc/pam.d/chsh
%config(noreplace) %verify(not mtime size md5) /etc/security/*

%attr(4711,root,root) %{_bindir}/chfn
%attr(4711,root,root) %{_bindir}/chsh

%{_mandir}/man1/chfn.1.gz
%{_mandir}/man1/chsh.1.gz

%changelog
* Sun May 23 1999 Wojtek �lusarczyk <wojtek@shadow.eu.org>
  [2.9r-2]
- fixes all patches,
- added patch for possibility build on linux 2.3.x -- dirty but ...,
- FHS 2.0,
- added uprogs sub-pakage.

* Thu Apr 22 1999 Tomasz K�oczko <kloczek@rudy.mif.pg.gda.pl>
  [2.9o-10]
- fixed installing .mo files (util-linux-DESTDIR.patch),
- removed suid subpackage (added to Obsoletes),
- recompiles on new rpm.

* Thu Mar 25 1999 Artur Frysiak <wiget@pld.org.pl>
- changed Source URL
- added calling ./configure script
- gziping docs
- removed ANNOUNCE from docs
- removed man group from man pages
- compiled on rpm 3

* Mon Feb 15 1999 Wojtek �lusarczyk <wojtek@shadow.eu.org>
- updated to 2.9i,
- fixed Group(pl),

  by Maciek R�ycki <macro@ds2.amg.gda.pl>

- added openpty && nochkdupexe patches.

* Sun Jan 31 1999 Wojtek �lusarczyk <wojtek@shadow.eu.org>
  [2.9h-1d]
- update to latest version,
- added suid sub-package,
- Require: pam >= 0.66 in both subpackages,
- compressed man pages && documentation,
- other changes ...

* Sun Nov 01 1998 Wojtek �lusarczyk <wojtek@shadow.eu.org>
  [2.9-2d]
- updated to util-linux-2.9c,
- added mount and loopback subpackage,
- fixed pl translation.
- removed tsort -- provides by textutils,

    Arkadiusz Mi�kiewicz <misiek@linstar.zsz2.starachowice.pl>

- fixed login.c
  
* Mon Oct 26 1998 Wojtek �lusarczyk <wojtek@shadow.eu.org>
  [2.9-1d]
- updated to 2.9a,
- minor changes.

* Mon Oct 05 1998 Wojtek �lusarczyk <wojtek@shadow.eu.org>
  [2.8-6d]
- build against PLD Tornado -- GNU libc-2.1, 
- restricted ELF binaries permissions,
- fixed pl translation,
- added new PAM config for login, chsh, chfn,
- removed sln (now is in glibc-2.1),
- macro %%{SOURCE{1,2,3}} in %install,
- removed symlink hwclock.8,
- macro %%{name} in Source & Patch,
- added /etc/security/{chsh,chfn},
- fixed all files permissions,
- minor modifications of the spec file.

* Sat Aug 29 1998 Konrad St�pie� <konrad@interdata.com.pl>
  [2.8-6]
- reconfigure spec to build non root,
- link man clock to hwclock for i386,
- few simplification in %install,
- added full %attr description in %files,
- start at RH spec.
