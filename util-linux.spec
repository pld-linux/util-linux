Summary:	Collection of basic system utilities for Linux
Summary(de):	Sammlung von grundlegenden Systemdienstprogrammen f�r Linux
Summary(fr):	Ensemble d'utilitaires syst�me de base pour Linux
Summary(pl):	Zbi�r podstawowych narz�dzi systemowych dla Linuxa
Summary(tr):	Temel sistem ara�lar�
Name:		util-linux
Version:	2.9o
Release:	1
Copyright:	distributable
Group:		Utilities/System
Group(pl):	Narz�dzia/System
Source0:	ftp://ftp.win.tue.nl/pub/linux-local/utils/util-linux/%{name}-%{version}.tar.gz
Source1:	chfn.pamd
Source2:	chsh.pamd
Source3:	login.pamd
Patch0:		%{name}-openpty.patch
Patch1:		%{name}-config.patch
Patch2:		%{name}-nochkdupexe.patch
Patch3:		%{name}-shutdown.patch
Patch4:		%{name}-chfn.patch
Requires:	pam >= 0.66
Buildroot:	/tmp/%{name}-%{version}-root

%description
util-linux contains a large variety of low-level system utilities
necessary for a functional Linux system.  This includes, among other
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

%package	suid
Summary:	Programs: chfn and chsh -- use it on own risc..
Summary(pl):	Programy: chfn and chsh -- skrajnie niebezpiecznie.
Group:		Utilities/System
Group(pl):	Narz�dzia/System
Requires:	pam >= 0.66

%description suid -l pl
Programy: chfn and chsh -- skrajnie niebezpiecznie. 
Mo�esz ich u�ywa� tylko na w�asne ryzyko ;)

%description suid 
Programs: chfn and chsh -- use it on own risc...

%package -n losetup
Summary:     programs for setting up and configuring loopback devices
Summary(de): Programme zum Einrichten und Konfigurieren von Loopback-Ger�ten
Summary(fr): programmes pour mettre en place et configurer les loopback
Summary(pl): Program do konfiguracji urz�dzenia blokowego loopback
Summary(tr): Yerel-�evrim ayg�tlar�n�n kurulmas� ve ayarlanmas� i�in programlar
Group:       Utilities/System
Group(pl):   Narz�dzia/System

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

%prep
%setup -q 
%patch0 -p1 
%patch1 -p1 
%patch2 -p1 
%patch3 -p1 
%patch4 -p1 

%build
cp login-utils/login.c login-utils/login.c.new
sed -e "s/#define DO_PS_FIDDLING//" \
login-utils/login.c.new > login-utils/login.c

./configure

make OPT="$RPM_OPT_FLAGS"

%install
rm -rf $RPM_BUILD_ROOT

install -d $RPM_BUILD_ROOT/{bin,etc/pam.d,sbin}
install -d $RPM_BUILD_ROOT/usr/{bin,info,lib,man/man1,man/man6,man/man8,sbin}

make install \
    DESTDIR=$RPM_BUILD_ROOT \
    INSTALLSUID="install -m 4711" \
    USE_TTY_GROUP=no 

%ifarch i386
mv -f $RPM_BUILD_ROOT/usr/bin/rdev $RPM_BUILD_ROOT/usr/sbin
%endif

mv $RPM_BUILD_ROOT/usr/bin/{swapdev,vidmode,ramsize,rootflags,readprofile} \
$RPM_BUILD_ROOT/usr/sbin

install %{SOURCE1} $RPM_BUILD_ROOT/etc/pam.d/chfn
install %{SOURCE2} $RPM_BUILD_ROOT/etc/pam.d/chsh
install %{SOURCE3} $RPM_BUILD_ROOT/etc/pam.d/login

install -d $RPM_BUILD_ROOT/etc/security

touch $RPM_BUILD_ROOT/etc/security/{chsh,chfn}

strip $RPM_BUILD_ROOT/{bin/*,sbin/*,usr/bin/*,usr/sbin/*} || :

%ifarch i386
ln -sf	hwclock $RPM_BUILD_ROOT/sbin/clock
echo	.so hwclock.8 > $RPM_BUILD_ROOT/usr/man/man8/clock.8
%endif

ln -sf swapon $RPM_BUILD_ROOT/sbin/swapoff

gzip -9fn $RPM_BUILD_ROOT/usr/man/man[1568]/* \
	*/README.*

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)
%doc */README.*

/usr/info/ipc.info

%ifarch i386
%attr(755,root,root) /sbin/clock
%attr(755,root,root) /sbin/hwclock

/usr/man/man8/hwclock.8.gz
/usr/man/man8/clock.8.gz
%endif

%attr(640,root,root) %config(noreplace) %verify(not mtime size md5) /etc/pam.d/login

%ifarch i386 alpha
%attr(755,root,root) /sbin/fdisk
%attr(755,root,root) /sbin/cfdisk
%attr(755,root,root) /sbin/fsck.minix
%attr(755,root,root) /sbin/mkfs.minix
%attr(755,root,root) /sbin/sfdisk
%endif

%attr(755,root,root) /sbin/mkfs
%attr(755,root,root) /sbin/mkswap

%attr(755,root,root) /usr/bin/fdformat
%attr(755,root,root) /usr/bin/setfdprm
%attr(640,root,root) %config(noreplace) %verify(not size mtime md5) /etc/fdprm

/usr/man/man8/fdformat.8.gz
/usr/man/man8/mkswap.8.gz
/usr/man/man8/setfdprm.8.gz

%attr(755,root,root) /usr/games/banner
/usr/man/man6/banner.6.gz

%attr(755,root,root) /usr/bin/ddate
/usr/man/man1/ddate.1.gz

%attr(755,root,root) /bin/login


%attr(755,root,root) /usr/bin/newgrp
%attr(755,root,root) /usr/sbin/vipw
%attr(755,root,root) /usr/sbin/vigr

/usr/man/man1/login.1.gz
/usr/man/man1/newgrp.1.gz
/usr/man/man8/vipw.8.gz

%attr(0755,root,root) /bin/kill
%attr(0755,root,root) /usr/bin/cal
%attr(0755,root,root) /usr/bin/logger
%attr(0755,root,root) /usr/bin/look
%attr(0755,root,root) /usr/bin/mcookie
%attr(0755,root,root) /usr/bin/namei
%attr(0755,root,root) /usr/bin/script
%attr(0755,root,root) /usr/bin/setterm
%attr(0755,root,root) /usr/bin/whereis
%attr(2711,root, tty) /usr/bin/write
%attr(0755,root,root) /usr/bin/getopt

/usr/man/man1/cal.1.gz
/usr/man/man1/kill.1.gz
/usr/man/man1/logger.1.gz
/usr/man/man1/look.1.gz
/usr/man/man1/mcookie.1.gz
/usr/man/man1/namei.1.gz
/usr/man/man1/script.1.gz
/usr/man/man1/setterm.1.gz
/usr/man/man1/whereis.1.gz
/usr/man/man1/write.1.gz
/usr/man/man1/getopt.1.gz

%attr(755,root,root) /bin/dmesg

%attr(755,root,root) /sbin/ctrlaltdel
%attr(755,root,root) /sbin/kbdrate
%attr(755,root,root) /bin/arch
%attr(755,root,root) /usr/bin/ipcrm
%attr(755,root,root) /usr/bin/ipcs
%attr(755,root,root) /usr/bin/renice
%attr(755,root,root) /usr/sbin/readprofile
%attr(755,root,root) /usr/bin/setsid
%attr(755,root,root) /usr/sbin/ramsize

%attr(755,root,root) /usr/bin/tunelp

%ifnarch sparc
%attr(755,root,root) /usr/bin/cytune
%attr(755,root,root) /usr/sbin/swapdev
%attr(755,root,root) /usr/sbin/vidmode
%endif

%attr(755,root,root) /usr/sbin/rootflags

/usr/man/man1/arch.1.gz
/usr/man/man1/readprofile.1.gz
/usr/man/man8/cytune.8.gz
/usr/man/man8/ctrlaltdel.8.gz
/usr/man/man8/dmesg.8.gz
/usr/man/man8/ipcrm.8.gz
/usr/man/man8/ipcs.8.gz
/usr/man/man8/kbdrate.8.gz
/usr/man/man8/ramsize.8.gz
/usr/man/man8/renice.8.gz
/usr/man/man8/rootflags.8.gz
/usr/man/man8/setsid.8.gz
/usr/man/man8/swapdev.8.gz
/usr/man/man8/vidmode.8.gz
/usr/man/man8/tunelp.8.gz

%ifarch i386
%attr(755,root,root) /usr/sbin/rdev
/usr/man/man8/rdev.8.gz
%endif

%attr(755,root,root) /usr/bin/col
%attr(755,root,root) /usr/bin/colcrt
%attr(755,root,root) /usr/bin/colrm
%attr(755,root,root) /usr/bin/column
%attr(755,root,root) /usr/bin/hexdump
%attr(755,root,root) /usr/bin/rev
%attr(755,root,root) /usr/bin/ul

/usr/man/man1/col.1.gz
/usr/man/man1/colcrt.1.gz
/usr/man/man1/colrm.1.gz
/usr/man/man1/column.1.gz
/usr/man/man1/hexdump.1.gz
/usr/man/man1/rev.1.gz
/usr/man/man1/ul.1.gz

%attr(755,root,root) /bin/more
/usr/man/man1/more.1.gz

%dir /usr/lib/getopt
%attr(755,root,root) /usr/lib/getopt/*

%config /usr/lib/more.help

%ifnarch sparc
/usr/man/man8/fsck.minix.8.gz
/usr/man/man8/mkfs.minix.8.gz
/usr/man/man8/mkfs.8.gz
%endif

%ifarch i386 alpha
/usr/man/man8/fdisk.8.gz
/usr/man/man8/cfdisk.8.gz
/usr/man/man8/sfdisk.8.gz
%endif

%files suid
%defattr(640,root,root,755)

%config(noreplace) %verify(not mtime size md5) /etc/pam.d/chfn
%config(noreplace) %verify(not mtime size md5) /etc/pam.d/chsh
%config(noreplace) %verify(not mtime size md5) /etc/security/*

%attr(4711,root,root) /usr/bin/chfn
%attr(4711,root,root) /usr/bin/chsh

/usr/man/man1/chfn.1.gz
/usr/man/man1/chsh.1.gz

%files -n mount
%defattr(644,root,root,755)

%attr(755,root,root) /bin/mount
%attr(755,root,root) /bin/umount
%attr(755,root,root) /sbin/swapon
%attr(755,root,root) /sbin/swapoff

/usr/man/man5/fstab.5.gz
/usr/man/man5/nfs.5.gz
/usr/man/man8/mount.8.gz
/usr/man/man8/swapoff.8.gz
/usr/man/man8/swapon.8.gz
/usr/man/man8/umount.8.gz

%files -n losetup
%defattr(644,root,root,755)

/usr/man/man8/losetup.8.gz
%attr(755,root,root) /sbin/losetup

%changelog
* Thu Mar 25 1999 Artur Frysiak <wiget@pld.org.pl>
  [2.9o-1]
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
- by Arkadiusz Mi�kiewicz <misiek@linstar.zsz2.starachowice.pl>
  fixed login.c
  
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
- reconfigure spec to build non root
- link man clock to hwclock for i386
- few simplification in %install
- added full %attr description in %files

* Sun Aug 23 1998 Jeff Johnson <jbj@redhat.com>
- add cbm1581 floppy definitions (problem #787)

* Mon Jun 29 1998 Jeff Johnson <jbj@redhat.com>
- remove /etc/nologin at end of shutdown/halt.

* Fri Jun 19 1998 Jeff Johnson <jbj@redhat.com>
- add mount/losetup.

* Thu Jun 18 1998 Jeff Johnson <jbj@redhat.com>
- update to 2.8 with 2.8b clean up. hostid now defunct?

* Mon Jun 01 1998 David S. Miller <davem@dm.cobaltmicro.com>
- "more" now works properly on sparc

* Sat May 02 1998 Jeff Johnson <jbj@redhat.com>
- Fix "fdisk -l" fault on mounted cdrom. (prob #513)

* Fri Apr 24 1998 Prospector System <bugs@redhat.com>
- translations modified for de, fr, tr

* Sat Apr 11 1998 Cristian Gafton <gafton@redhat.com>
- manhattan rebuild

* Mon Dec 29 1997 Erik Troan <ewt@redhat.com>
- more didn't suspend properly on glibc
- use proper tc*() calls rather then ioctl's

* Sun Dec 21 1997 Cristian Gafton <gafton@redhat.com>
- fixed a security problem in chfn and chsh accepting too 
  long gecos fields

* Fri Dec 19 1997 Mike Wangsmo <wanger@redhat.com>
- removed "." from default path

* Tue Dec 02 1997 Cristian Gafton <gafton@redhat.com>
- added (again) the vipw patch

* Wed Oct 22 1997 Michael Fulbright <msf@redhat.com>
- minor cleanups for glibc 2.1

* Fri Oct 17 1997 Michael Fulbright <msf@redhat.com>
- added vfat32 filesystem type to list recognized by fdisk

* Fri Oct 10 1997 Erik Troan <ewt@redhat.com>
- don't build clock on the alpha 
- don't install chkdupexe

* Thu Oct 02 1997 Michael K. Johnson <johnsonm@redhat.com>
- Update to new pam standard.
- BuildRoot.

* Thu Sep 25 1997 Cristian Gafton <gafton@redhat.com>
- added rootok and setproctitle patches
- updated pam config files for chfn and chsh

* Tue Sep 02 1997 Erik Troan <ewt@redhat.com>
- updated MCONFIG to automatically determine the architecture
- added glibc header hacks to fdisk code
- rdev is only available on the intel

* Fri Jul 18 1997 Erik Troan <ewt@redhat.com>
- update to util-linux 2.7, fixed login problems

* Wed Jun 25 1997 Erik Troan <ewt@redhat.com>
- Merged Red Hat changes into main util-linux source, updated package to
  development util-linux (nearly 2.7).

* Tue Apr 22 1997 Michael K. Johnson <johnsonm@redhat.com>
- LOG_AUTH --> LOG_AUTHPRIV in login and shutdown

* Mon Mar 03 1997 Michael K. Johnson <johnsonm@redhat.com>
- Moved to new pam and from pam.conf to pam.d

* Tue Feb 25 1997 Michael K. Johnson <johnsonm@redhat.com>
- pam.patch differentiated between different kinds of bad logins.
  In particular, "user does not exist" and "bad password" were treated
  differently.  This was a minor security hole.
