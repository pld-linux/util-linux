#
# Conditional build:
# _without_dist_kernel	- do nothing for now
# _with_uClibc		- don't build few utilities
#
# TODO:
# - move raw to /sbin (potentially can be used before mount partitions)??

Summary:	Collection of basic system utilities for Linux
Summary(de):	Sammlung von grundlegenden Systemdienstprogrammen für Linux
Summary(es):	Colectánea de utilitarios básicos de sistema para Linux
Summary(fr):	Ensemble d'utilitaires système de base pour Linux
Summary(pl):	Zbiór podstawowych narzêdzi systemowych dla Linuksa
Summary(pt_BR):	Coletânea de utilitários básicos de sistema para Linux
Summary(ru):	îÁÂÏÒ ÂÁÚÏ×ÙÈ ÓÉÓÔÅÍÎÙÈ ÕÔÉÌÉÔ ÄÌÑ Linux
Summary(tr):	Temel sistem araçlarý
Summary(uk):	îÁÂ¦Ò ÂÁÚÏ×ÉÈ ÓÉÓÔÅÍÎÉÈ ÕÔÉÌ¦Ô ÄÌÑ Linux
Name:		util-linux
Version:	2.12
%define _rel 4
Release:	%{_rel}
License:	distributable
Group:		Applications/System
Source0:	http://ftp.cwi.nl/aeb/util-linux/%{name}-%{version}.tar.gz
# Source0-md5:	997adf78b98d9d1c5db4f37ea982acff
Source1:	http://www.mif.pg.gda.pl/homepages/ankry/man-PLD/%{name}-non-english-man-pages.tar.bz2
# Source1-md5:	3c940c7e7fe699eaa2ddb1bffb3de2fe
Source2:	login.pamd
Source3:	rawdevices.init
Source4:	rawdevices.sysconfig
Patch0:		%{name}-MCONFIG.patch
Patch1:		%{name}-fdisk.patch
Patch2:		%{name}-utmpx.patch
Patch3:		%{name}-fhs.patch
Patch4:		%{name}-login.patch
Patch5:		%{name}-info.patch
Patch6:		ftp://ftp.linuxnfs.sourceforge.org/pub/nfs/%{name}-2.10m-mount-compat.patch
Patch7:		%{name}-syscall.patch
Patch8:		%{name}-raw.patch
Patch9:		%{name}-gecos.patch
Patch10:	%{name}-glibc.patch
Patch11:	%{name}-posixsh.patch
Patch12:	%{name}-ppc-hwclock.patch
Patch13:	%{name}-no_multiline.patch
BuildRequires:	gettext-devel
BuildRequires:	grep
%{!?_with_uClibc:BuildRequires:	ncurses-devel >= 5.0}
%{!?_with_uClibc:BuildRequires:	pam-devel >= 0.77.3}
BuildRequires:	texinfo
BuildRequires:	textutils
%{!?_with_uClibc:BuildRequires:	zlib-devel}
%{!?_with_uClibc:Requires:	pam >= 0.77.3}
Provides:	fdisk
Obsoletes:	cramfs
Obsoletes:	util-linux-suids
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%define		debugcflags	-O1 -g

%description
util-linux contains a large variety of low-level system utilities
necessary for a functional Linux system. This includes, among other
things, configuration tools such as fdisk and system programs such as
logger.

%description -l de
util-linux enthält eine große Anzahl an
low-level-Systemdienstprogrammen, die für ein funktionierendes
Linux-System erforderlich sind. Dazu gehören Konfigurationstools wie
'fdisk' und Systemprogramme wie 'logger'.

%description -l es
util-linux contiene una gran variedad de utilitarios de sistema de
bajo nivel necesarios a un sistema Linux funcional. Esto incluye,
entre otras cosas, herramientas de configuración como fdisk y
programas de sistema como login.

%description -l fr
util-linux contient une grande variété d'utilitaire système bas niveau
nécessaires au fonctionnement d'un système Linux. Cela comprend, entre
autres, les outils de configuration comme fdisk et des programmes
systèmes comme logger.

%description -l pl
util-linux zawiera wiele ró¿nych, niskopoziomowych narzêdzi
systemowych niezbêdnych do prawid³owego dzia³ania Linuksa. W pakiecie
znajduj± siê miêdzy innymi narzêdzia konfiguracyjne, takie jak fdisk i
programy systemowe, takie jak logger.

%description -l pt_BR
util-linux contém uma grande variedade de utilitários de sistema de
baixo-nível necessários para um sistema Linux funcional. Isso inclui,
entre outras coisas, ferramentas de configuração como fdisk e
programas de sistema como login.

%description -l ru
üÔÏÔ ÐÁËÅÔ ÓÏÄÅÒÖÉÔ ÂÏÌØÛÏÊ ÎÁÂÏÒ ÓÉÓÔÅÍÎÙÈ ÕÔÉÌÉÔ ÎÉÚËÏÇÏ ÕÒÏ×ÎÑ,
ËÏÔÏÒÙÅ ÎÅÏÂÈÏÄÉÍÙ ÄÌÑ ÆÕÎËÃÉÏÎÉÒÏ×ÁÎÉÑ ÓÉÓÔÅÍÙ Linux. ïÎ ×ËÌÀÞÁÅÔ, ×
ÞÉÓÌÅ ÐÒÏÞÉÈ, ÉÎÓÔÒÕÍÅÎÔÙ ËÏÎÆÉÇÕÒÁÃÉÉ, ÔÁËÉÅ ËÁË fdisk, É ÓÉÓÔÅÍÎÙÅ
ÐÒÏÇÒÁÍÍÙ, ÔÁËÉÅ ËÁË login.

%description -l tr
þlevsel durumdaki bir Linux sistemi için gerekli birçok alt düzey
sistem araçlarýný içerir. Bunlar arasýnda fdisk gibi yapýlandýrma
uygulamalarý ve logger gibi sistem programlarý sayýlabilir.

%description -l uk
ãÅÊ ÐÁËÅÔ Í¦ÓÔÉÔØ ×ÅÌÉËÉÊ ÎÁÂ¦Ò ÓÉÓÔÅÍÎÉÈ ÕÔÉÌ¦Ô ÎÉÚØËÏÇÏ Ò¦×ÎÑ, ÑË¦
ÎÅÏÂÈ¦ÄÎ¦ ÄÌÑ ÆÕÎËÃ¦ÏÎÕ×ÁÎÎÑ ÓÉÓÔÅÍÉ Linux. ÷¦Î Í¦ÓÔÉÔØ, ÏËÒ¦Í ¦ÎÛÉÈ,
ËÏÎÆ¦ÇÕÒÁÃ¦ÊÎ¦ ¦ÎÓÔÒÕÍÅÎÔÉ (ÔÁË¦ ÑË fdisk) ÔÁ ÓÉÓÔÅÍÎ¦ ÐÒÏÇÒÁÍÉ (ÔÁË¦
ÑË login).

%package -n losetup
Summary:	Programs for setting up and configuring loopback devices
Summary(de):	Programme zum Einrichten und Konfigurieren von Loopback-Geräten
Summary(fr):	Programmes pour mettre en place et configurer les loopback
Summary(pl):	Program do konfiguracji urz±dzenia blokowego loopback
Summary(tr):	Yerel-çevrim aygýtlarýnýn kurulmasý ve ayarlanmasý için programlar
Summary(ru):	ðÒÏÇÒÁÍÍÙ ÄÌÑ ÎÁÓÔÒÏÊËÉ loopback-ÕÓÔÒÏÊÓÔ×
Summary(uk):	ðÒÏÇÒÁÍÉ ÄÌÑ ËÏÎÆ¦ÇÕÒÁÃ¦§ loopback-ÐÒÉÓÔÒÏ§×
Group:		Applications/System
Release:      %{_rel}@%{_kernel_ver_str}

%description -n losetup
Linux supports a special block device called the loopback device,
which maps a normal file onto a virtual block device. This package
contains programs for setting up and removing the mapping between
files and loopback devices.

Block loopback devices should not be confused with the networking
loopback device, which is configured with the normal ifconfig command.

%description -n losetup -l de
Linux unterstützt ein spezielles Blockgerät, das sogenannte Loopback,
das eine normale Datei auf ein virtuelles Blockgerät abbildet. Das
Paket enthält Programme zum Einrichten und Entfernen der Zuordnung
zwischen Dateien und Loopback-Geräten.

%description -n losetup -l fr
Linux gère un périphérique bloc spécial appelé « loopback », qui
correspond à un fichier normal sur un périphérique bloc virtuel. Ce
paquetage contient les programmes pour configurer et supprimer la
correspondance entre les fichiers et les périphériques loopback.

Les périphériques bloc loopback ne doivent pas être confondus avec le
périphérique loopback du réseau, configuré avec la commande ifconfig
normale.

%description -n losetup -l pl
Linux wspiera specjalne urz±dzenie blokowe loopback, które mapuje
normalny plik w wirtualne urz±dzenie blokowe. Pakiet ten zawiera
program, przy pomocy którego bêdziesz móg³ je skonfigurowaæ.

Urz±dzenie blokowe loopback nie powinno byæ mylone z sieciowym
interfejsem loopback, który jest konfigurowany przy pomocy polecenia
ifconfig.

%description -n losetup -l ru
Linux ÐÏÄÄÅÒÖÉ×ÁÅÔ ÓÐÅÃÉÁÌØÎÏÅ ÂÌÏÞÎÏÅ ÕÓÔÒÏÊÓÔ×Ï, ÎÁÚÙ×ÁÅÍÏÅ
loopback, ËÏÔÏÒÏÅ ÏÔÏÂÒÁÖÁÅÔ ÏÂÙÞÎÙÊ ÆÁÊÌ × ×ÉÒÔÕÁÌØÎÏÅ ÂÌÏÞÎÏÅ
ÕÓÔÒÏÊÓÔ×Ï. üÔÏ ÐÏÚ×ÏÌÑÅÔ ÉÓÐÏÌØÚÏ×ÁÔØ ÆÁÊÌ ËÁË ×ÉÒÔÕÁÌØÎÕÀ ÆÁÊÌÏ×ÕÀ
ÓÉÓÔÅÍÕ. Losetup ÉÓÐÏÌØÚÕÅÔÓÑ ÄÌÑ Ó×ÑÚÉ loopback-ÕÓÔÒÏÊÓÔ× Ó ÏÂÙÞÎÙÍÉ
ÆÁÊÌÁÍÉ ÉÌÉ ÂÌÏÞÎÙÍÉ ÕÓÔÒÏÊÓÔ×ÁÍÉ, ÄÌÑ ÏÔÓÏÅÄÉÎÅÎÉÑ loopback-ÕÓÔÒÏÊÓÔ×
É ÚÁÐÒÏÓÏ× ÉÈ ÓÔÁÔÕÓÁ.

%description -n losetup -l tr
Linux özel bir blok aygýt olan yerel-çevrim aygýtýný (loopback device)
destekler. Bu aygýt normal bir dosyanýn sanal bir blok aygýtý üzerine
haritasýný çýkarýr. Bu paket, dosyalar ve yerel-çevrim aygýtlarý
arasýndaki haritalama iþleminin kurulmasý ve kaldýrýlmasý için
programlar içerir. Blok yerel-çevrim aygýtý ifconfig komutu ile
yapýlandýrýlan að yerel-çevrim aygýtý ile karýþtýrýlmamalýdýr.

%description -n losetup -l uk
Linux Ð¦ÄÔÒÉÍÕ¤ ÓÐÅÃ¦ÁÌØÎÉÊ ÂÌÏÞÎÉÊ ÐÒÉÓÔÒ¦Ê, loopback, ÑËÉÊ
×¦ÄÏÂÒÁÖÕ¤ Ú×ÉÞÁÊÎÉÊ ÆÁÊÌ Õ ×¦ÒÔÕÁÌØÎÉÊ ÂÌÏÞÎÉÊ ÐÒÉÓÔÒ¦Ê. ãÅ ÄÏÚ×ÏÌÑ¤
×ÉËÏÒÉÓÔÏ×Õ×ÁÔÉ ÆÁÊÌ ÑË ×¦ÒÔÕÁÌØÎÕ ÆÁÊÌÏ×Õ ÓÉÓÔÅÍÕ. Losetup
×ÉËÏÒÉÓÔÏ×ÕÀÔØ ÄÌÑ Ú×'ÑÚËÕ loopback-ÐÒÉÓÔÒÏ§× Ú¦ Ú×ÉÞÁÊÎÉÍÉ ÆÁÊÌÁÍÉ
ÁÂÏ ÂÌÏÞÎÉÍÉ ÐÒÉÓÔÒÏÑÍÉ, ÄÌÑ ×¦Ä'¤ÄÎÁÎÎÑ loopback-ÐÒÉÓÔÒÏ§× ÔÁ
ÚÁÐÒÏÓ¦× §È ÓÔÁÎÕ.

%package -n mount
Summary:	Programs for mounting and unmounting filesystems
Summary(de):	Programme zum montieren und abmontieren von Dateisystemen
Summary(fr):	Programme pour monter et démonter des systèmes de fichiers
Summary(pl):	Programy do montowania i odmontowywania systemów plików
Summary(tr):	Dosya sistemlerini baðlamak ve çözmek için programlar
Summary(uk):	ðÒÏÇÒÁÍÉ ÄÌÑ ÍÏÎÔÕ×ÁÎÎÑ ÔÁ ÒÏÚÍÏÎÔÕ×ÁÎÎÑ ÆÁÊÌÏ×ÉÈ ÓÉÓÔÅÍ
Summary(ru):	ðÒÏÇÒÁÍÍÙ ÄÌÑ ÍÏÎÔÉÒÏ×ÁÎÉÑ É ÒÁÚÍÏÎÔÉÒÏ×ÁÎÉÑ ÆÁÊÌÏ×ÙÈ ÓÉÓÔÅÍ
Group:		Applications/System
Release:      %{_rel}@%{_kernel_ver_str}

%description -n mount
mount is used for adding new filesystems, both local and networked, to
your current directory structure. The filesystems must already exist
for this to work. It can also be used to change the access types the
kernel uses for already-mounted filesystems.

This package is critical for the functionality of your system.

%description -n mount -l de
mount wird zum Hinzufügen neuer Dateisysteme (lokal und im Netzwerk)
zu Ihrer aktuellen Verzeichnisstruktur verwendet. Die Dateisysteme
müssen bereits existieren. Außerdem können die Zugriffstypen geändert
werden, die der Kernel für bereits montierte Dateisysteme verwendet.

Dieses Paket ist für Ihr System unbedingt erforderlich.

%description -n mount -l fr
mount sert à ajouter de nouveaux systèmes de fichiers, locaux ou
réseaux, à votre structure de répertoire. Les systèmes de fichiers
doivent déjà exister pour que cela fonctionne. Il peut aussi servir à
changer les types d'accès pour les systèmes de fichiers déjà montés.

Ce paquetage est critique pour le fonctionnement de votre système.

%description -n mount -l pl
Program mount jest u¿ywany przez system do montowania systemów plików,
zarówno lokalnych jak i sieciowych (np. NFS).

Pakiet ten jest niezbêdny do prawid³owej pracy twojego Linuksa.

%description -n mount -l ru
ðÁËÅÔ mount ÓÏÄÅÒÖÉÔ ÐÒÏÇÒÁÍÍÙ mount, umount, swapon É swapoff. æÁÊÌÙ
× ×ÁÛÅÊ ÓÉÓÔÅÍÅ ÏÒÇÁÎÉÚÏ×ÁÎÙ × ×ÉÄÅ ÏÄÎÏÇÏ ÂÏÌØÛÏÇÏ ÄÅÒÅ×Á ÉÌÉ
ÉÅÒÁÒÈÉÉ. üÔÉ ÆÁÊÌÙ ÍÏÇÕÔ ÂÙÔØ ÒÁÚÍÅÝÅÎÙ ÎÁ ÒÁÚÎÙÈ ÕÓÔÒÏÊÓÔ×ÁÈ.
ëÏÍÁÎÄÁ mount ÐÒÉÓÏÅÄÉÎÑÅÔ ÆÁÊÌÏ×ÕÀ ÓÉÓÔÅÍÕ ÎÁ ÎÅËÏÔÏÒÏÍ ÕÓÔÒÏÊÓÔ×Å Ë
ÄÅÒÅ×Õ ÆÁÊÌÏ× ×ÁÛÅÊ ÓÉÓÔÅÍÙ. ëÏÍÁÎÄÁ umount ÏÔÓÏÅÄÉÎÑÅÔ ÆÁÊÌÏ×ÕÀ
ÓÉÓÔÅÍÕ ÏÔ ÄÅÒÅ×Á. Swapon É swapoff, ÓÏÏÔ×ÅÔÓÔ×ÅÎÎÏ, ÒÁÚÒÅÛÁÅÔ É
ÚÁÐÒÅÝÁÅÔ Ó×ÏÐÐÉÎÇ × ÏÐÒÅÄÅÌÅÎÎÙÅ ÆÁÊÌÙ É ÕÓÔÒÏÊÓÔ×Á.

%description -n mount -l tr
mount, hem yerel hem de að dosya sistemlerinin dizin yapýsýna
eklenmesi için kullanýlýr. Bunun için baðlanacak dosya sisteminin
önceden hazýrlanmýþ olmasý gerekir. Ayný zamanda çekirdeðin baðlanmýþ
dosya sistemlerine eriþimini deðiþtirmek için de kullanýlýr. Bu paket
sisteminizin iþlevselliði açýsýndan kritiktir.

%description -n mount -l uk
ðÁËÅÔ mount Í¦ÓÔÉÔØ ÐÒÏÇÒÁÍÉ mount, umount, swapon ÔÁ swapoff. æÁÊÌÉ Õ
×ÁÛ¦Ê ÓÉÓÔÅÍ¦ ÏÒÇÁÎ¦ÚÏ×ÁÎ¦ Õ ×ÉÇÌÑÄ¦ ÏÄÎÏÇÏ ×ÅÌÉËÏÇÏ ÄÅÒÅ×Á ÁÂÏ
¦¤ÒÁÒÈ¦§. ã¦ ÆÁÊÌÉ ÍÏÖÕÔØ ÂÕÔÉ ÒÏÚÔÁÛÏ×ÁÎ¦ ÎÁ Ò¦ÚÎÉÈ ÐÒÉÓÔÒÏÑÈ.
ëÏÍÁÎÄÁ mount Ð¦Ä'¤ÄÎÕ¤ ÆÁÊÌÏ×Õ ÓÉÓÔÅÍÕ ÎÁ ÄÅÑËÏÍÕ ÐÒÉÓÔÒÏ§ ÄÏ ÄÅÒÅ×Á
ÆÁÊÌ¦× ×ÁÛÏ§ ÓÉÓÔÅÍÉ. ëÏÍÁÎÄÁ umount ×¦Ä'¤ÄÎÕ¤ ÆÁÊÌÏ×Õ ÓÉÓÔÅÍÕ ×¦Ä
ÄÅÒÅ×Á. Swapon ÔÁ swapoff, ×¦ÄÐÏ×¦ÄÎÏ, ÄÏÚ×ÏÌÑ¤ ÔÁ ÚÁÂÏÒÏÎÀ¤ Ó×ÏÐ¦ÎÇ Õ
×ÉÚÎÁÞÅÎ¦ ÆÁÊÌÉ ÁÂÏ ÐÒÉÓÔÒÏ§.

%package chkdupexe
Summary:	chkdupexe - find duplicate executables
Summary(pl):	chkdupexe odszukuje powtarzaj±ce siê pliki uruchamialne
Group:		Applications/System

%description chkdupexe
chkdupexe will scan the union of $PATH and a hardcoded list of common
locations for binaries. It will report dangling symlinks and
duplicately-named binaries.

%description chkdupexe -l pl
chkdupexe przeszukuje katalogi z $PATH oraz inne powszechnie znane
katalogi z plikami uruchamialnymi i informuje o powtarzaj±cych siê
plikach w ró¿nych katalogach.

%package -n tunelp
Summary:	Configures kernel parallel port driver
Summary(de):	Konfiguriert den Kerneltreiber für den parallelen Port
Summary(fr):	Configure le pilote du port parallèle dans le noyau
Summary(pl):	Program do konfigurowania sterownika portu równoleg³ego
Summary(tr):	Çekirdeðin paralel baðlantý noktasý sürücüsünü ayarlar
Group:		Applications/System

%description -n tunelp
tunelp aids in configuring the kernel parallel port driver.

%description -n tunelp -l de
tunelp hilft bei der Konfiguration des Kernel-Parallelport-Treibers.

%description -n tunelp -l fr
« tunelp » aide à configurer le pilote du noyau pour le port
parallèle.

%description -n tunelp -l pl
Program do konfigurowania sterownika portu równoleg³ego.

%description -n tunelp -l tr
Paralel baðlantý noktasý sürücüsünü ayarlar.

%package -n login
Summary:	login is used when signing onto a system
Summary(pl):	login jest u¿ywany do rozpoczêcia pracy w systemie
Group:		Applications/System
Requires:	pam >= 0.77.3
Obsoletes:	heimdal-login

%description -n login
login is used when signing onto a system. It can also be used to
switch from one user to another at any time (most modern shells have
support for this feature built into them, however).

%description -n login -l pl
login jest u¿ywany do rozpoczêcia pracy w systemie. Mo¿e byæ u¿ywany
do prze³±czania z jednego u¿ytkownika na innego w ka¿dym momencie
(jednak wiêkszo¶æ nowoczesnych pow³ok ma takie funkcje wbudowane).

%package -n agetty
Summary:	Alternative Linux getty
Summary(pl):	Alternatywny getty
Group:		Applications/System
Requires:	login

%description -n agetty
agetty is simple Linux getty with serial support.

%description -n agetty -l pl
agetty jest prostym linuksowym getty z obs³ug± portu szeregowego.

%package -n rawdevices
Summary:	Support for raw-devices
Summary(pl):	Obs³uga raw-device'ów
Group:		Applications/System
PreReq:		rc-scripts
Requires(post,preun):	/sbin/chkconfig

%description -n rawdevices
Support for raw-devices.

%description -n rawdevices -l pl
Obs³uga raw-device'ów.

%prep
%setup -q -a1
%patch0 -p1
%patch1 -p1
%patch2 -p1
%patch3 -p1
%patch4 -p1
%patch5 -p1
%patch6 -p1
%patch7 -p1
%patch8 -p1
%patch9 -p1
%patch10 -p1
%patch11 -p1
%patch12 -p1
%patch13 -p0

%build
CC="%{__cc}"
LDFLAGS="%{rpmldflags}"
CFLAGS="%{rpmcflags} -I%{_includedir}/ncurses"
export CC CFLAGS LDFLAGS
# using %%configure2_13 isn't very wise here, it is not autoconf generated
# configure and it doesn't take any parameters
./configure

%{?_with_uClibc:echo 'char *nl_langinfo (nl_item x){return "";}' >> misc-utils/cal.c}
%{__make} \
	OPT="%{rpmcflags}" \
	MOREHELPDIR=%{_datadir}/misc \
	%{!?_with_uClibc:ADD_RAW="yes"} \
	%{?_with_uClibc:HAVE_RAW_H="no" HAVE_PAM="no"}

%ifarch ppc
%{__cc} %{rpmcflags} %{rpmldflags} clock-ppc.c -o clock-ppc
%endif

cd sys-utils
makeinfo ipc.texi

%install
rm -rf $RPM_BUILD_ROOT

install -d $RPM_BUILD_ROOT{/bin,/sbin,/etc/{pam.d,logrotate,rc.d/init.d,sysconfig}} \
	$RPM_BUILD_ROOT{%{_bindir},%{_sbindir},%{_infodir},%{_datadir}/misc} \
	$RPM_BUILD_ROOT{%{_examplesdir},%{_mandir}/man{1,5,6,8}}

%{__make} install \
	DESTDIR=$RPM_BUILD_ROOT \
	INSTALLSUID="install -m 755" \
	MOREHELPDIR=$RPM_BUILD_ROOT%{_datadir}/misc \
	GETOPTDIR=$RPM_BUILD_ROOT%{_examplesdir}/getopt \
	USRGAMESDIR=$RPM_BUILD_ROOT%{_bindir} \
	USE_TTY_GROUP=no \
	%{!?_with_uClibc:ADD_RAW="yes"} \
	%{?_with_uClibc:HAVE_RAW_H="no" HAVE_PAM="no"}

install %{SOURCE2} $RPM_BUILD_ROOT/etc/pam.d/login
install %{SOURCE3} $RPM_BUILD_ROOT/etc/rc.d/init.d/rawdevices
install %{SOURCE4} $RPM_BUILD_ROOT/etc/sysconfig/rawdevices

install -d $RPM_BUILD_ROOT{/etc/security,/var/lock}

> $RPM_BUILD_ROOT/etc/security/blacklist.login

:> $RPM_BUILD_ROOT/var/lock/wtmpxlock

%ifarch ppc
mv -f $RPM_BUILD_ROOT/sbin/hwclock $RPM_BUILD_ROOT/sbin/hwclock.rtc
install clock-ppc $RPM_BUILD_ROOT/sbin/hwclock.adb
#yneed fix:
# hwclock.adb is for PowerMac (default)
# hwclock.rtc is for RS/6000 (PreP,CHRP)
ln -sf hwclock.adb $RPM_BUILD_ROOT/sbin/hwclock
%endif

ln -sf hwclock $RPM_BUILD_ROOT/sbin/clock
echo '.so hwclock.8' > $RPM_BUILD_ROOT%{_mandir}/man8/clock.8

ln -sf swapon $RPM_BUILD_ROOT/sbin/swapoff

for d in cs de es fi fr hu id it ja ko nl pl ; do
	for m in man1 man5 man8 ; do
		if [ -d man/$d/$m ]; then
			install -d $RPM_BUILD_ROOT%{_mandir}/$d/$m
			install man/$d/$m/* $RPM_BUILD_ROOT%{_mandir}/$d/$m
		fi
	done
done

# cleanup, remove files not included in package
rm -f $RPM_BUILD_ROOT%{_bindir}/{chfn,chsh,newgrp}
rm -f $RPM_BUILD_ROOT%{_sbindir}/vipw
rm -f $RPM_BUILD_ROOT%{_mandir}/man1/chfn.1*
rm -f $RPM_BUILD_ROOT%{_mandir}/man1/chsh.1*
rm -f $RPM_BUILD_ROOT%{_mandir}/man1/newgrp.1*
rm -f $RPM_BUILD_ROOT%{_mandir}/man8/sln.8*
rm -f $RPM_BUILD_ROOT%{_mandir}/man8/vigr.8*
rm -f $RPM_BUILD_ROOT%{_mandir}/man8/vipw.8*

%{!?_with_uClibc:%find_lang %{name}}

%clean
rm -rf $RPM_BUILD_ROOT

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

%files %{!?_with_uClibc:-f %{name}.lang}
%defattr(644,root,root,755)
%doc */README.* text-utils/LICENSE.pg

%attr(755,root,root) /sbin/clock
%ifarch ppc
%attr(755,root,root) %config(noreplace) %verify(not link) /sbin/hwclock
%attr(755,root,root) /sbin/hwclock.adb
%attr(755,root,root) /sbin/hwclock.rtc
%else
%attr(755,root,root) /sbin/hwclock*
%endif

%{_mandir}/man8/clock.8*
%{_mandir}/man8/hwclock.8*
%lang(es) %{_mandir}/es/man8/clock.8*
%lang(es) %{_mandir}/es/man8/hwclock.8*
%lang(ja) %{_mandir}/ja/man8/clock.8*
%lang(ja) %{_mandir}/ja/man8/hwclock.8*

%attr(640,root,root) %config(noreplace) %verify(not md5 size mtime) %{_sysconfdir}/fdprm

%attr(0755,root,root) /bin/arch
%attr(0755,root,root) /bin/dmesg
%attr(0755,root,root) /bin/kill
%{!?_with_uClibc:%attr(0755,root,root) /bin/more}
%attr(0755,root,root) /sbin/blockdev
%attr(0755,root,root) /sbin/mkfs
%attr(0755,root,root) /sbin/mkswap
%attr(0755,root,root) /sbin/ctrlaltdel
%attr(0755,root,root) /sbin/elvtune
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
%attr(0755,root,root) %{_bindir}/renice
%attr(0755,root,root) %{_bindir}/rev
%attr(0755,root,root) %{_bindir}/script
%attr(0755,root,root) %{_bindir}/setsid
%attr(0755,root,root) %{_bindir}/setfdprm
%{!?_with_uClibc:%attr(0755,root,root) %{_bindir}/pg}
%attr(0755,root,root) %{_bindir}/line
%attr(0755,root,root) %{_bindir}/rename
%{!?_with_uClibc:%attr(0755,root,root) %{_bindir}/setterm}
%{!?_with_uClibc:%attr(0755,root,root) %{_bindir}/ul}
%attr(0755,root,root) %{_bindir}/whereis
%attr(2755,root,tty) %{_bindir}/write
%attr(0755,root,root) %{_bindir}/tailf
%attr(0755,root,root) %{_sbindir}/readprofile

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
%{_mandir}/man1/line.1*
%{_mandir}/man1/logger.1*
%{_mandir}/man1/look.1*
%{_mandir}/man1/mcookie.1*
%{!?_with_uClibc:%{_mandir}/man1/more.1*}
%{_mandir}/man1/namei.1*
%{!?_with_uClibc:%{_mandir}/man1/pg.1*}
%{_mandir}/man1/readprofile.1*
%{_mandir}/man1/rev.1*
%{_mandir}/man1/rename.1*
%{_mandir}/man1/script.1*
%{!?_with_uClibc:%{_mandir}/man1/setterm.1*}
%{!?_with_uClibc:%{_mandir}/man1/ul.1*}
%{_mandir}/man1/whereis.1*
%{_mandir}/man1/write.1*
%{_mandir}/man1/tailf.1*

%{_mandir}/man8/blockdev.8*
%{_mandir}/man8/ctrlaltdel.8*
%{_mandir}/man8/cytune.8*
%{_mandir}/man8/dmesg.8*
%{_mandir}/man8/elvtune.8*
%{_mandir}/man8/fdformat.8*
%{_mandir}/man8/ipcrm.8*
%{_mandir}/man8/ipcs.8*
%{_mandir}/man8/isosize.8*
%{_mandir}/man8/mkswap.8*
%{_mandir}/man8/renice.8*
%{_mandir}/man8/setfdprm.8*
%{_mandir}/man8/setsid.8*

%lang(de) %{_mandir}/de/man1/kill.1*
%lang(de) %{_mandir}/de/man1/more.1*
%lang(de) %{_mandir}/de/man1/write.1*

%lang(de) %{_mandir}/de/man8/fdformat.8*

%lang(es) %{_mandir}/es/man1/arch.1*
%lang(es) %{_mandir}/es/man1/colrm.1*
%lang(es) %{_mandir}/es/man1/column.1*
%lang(es) %{_mandir}/es/man1/ddate.1*
%lang(es) %{_mandir}/es/man1/getopt.1*
%lang(es) %{_mandir}/es/man1/look.1*
%lang(es) %{_mandir}/es/man1/more.1*
%lang(es) %{_mandir}/es/man1/namei.1*
%lang(es) %{_mandir}/es/man1/readprofile.1*
%lang(es) %{_mandir}/es/man1/rev.1*
%lang(es) %{_mandir}/es/man1/script.1*
%lang(es) %{_mandir}/es/man1/setterm.1*
%lang(es) %{_mandir}/es/man1/ul.1*
%lang(es) %{_mandir}/es/man1/whereis.1*
%lang(es) %{_mandir}/es/man1/write.1*

%lang(es) %{_mandir}/es/man8/cytune.8*
%lang(es) %{_mandir}/es/man8/ctrlaltdel.8*
%lang(es) %{_mandir}/es/man8/ipcrm.8*
%lang(es) %{_mandir}/es/man8/ipcs.8*
%lang(es) %{_mandir}/es/man8/mkswap.8*
%lang(es) %{_mandir}/es/man8/renice.8*
%lang(es) %{_mandir}/es/man8/setfdprm.8*
%lang(es) %{_mandir}/es/man8/setsid.8*

%lang(fi) %{_mandir}/fi/man1/arch.1*
%lang(fi) %{_mandir}/fi/man1/cal.1*
%lang(fi) %{_mandir}/fi/man1/column.1*
%lang(fi) %{_mandir}/fi/man1/kill.1*
%lang(fi) %{_mandir}/fi/man1/more.1*
%lang(fi) %{_mandir}/fi/man1/whereis.1*
%lang(fi) %{_mandir}/fi/man1/write.1*

%lang(fr) %{_mandir}/fr/man1/arch.1*
%lang(fr) %{_mandir}/fr/man1/cal.1*
%lang(fr) %{_mandir}/fr/man1/col.1*
%lang(fr) %{_mandir}/fr/man1/kill.1*
%lang(fr) %{_mandir}/fr/man1/more.1*
%lang(fr) %{_mandir}/fr/man1/whereis.1*
%lang(fr) %{_mandir}/fr/man1/write.1*

%lang(fr) %{_mandir}/fr/man8/ctrlaltdel.8*
%lang(fr) %{_mandir}/fr/man8/dmesg.8*
%lang(fr) %{_mandir}/fr/man8/fdformat.8*
%lang(fr) %{_mandir}/fr/man8/ipcrm.8*
%lang(fr) %{_mandir}/fr/man8/ipcs.8*
%lang(fr) %{_mandir}/fr/man8/setsid.8*

%lang(hu) %{_mandir}/hu/man1/arch.1*
%lang(hu) %{_mandir}/hu/man1/cal.1*
%lang(hu) %{_mandir}/hu/man1/colrm.1*
%lang(hu) %{_mandir}/hu/man1/hexdump.1*
%lang(hu) %{_mandir}/hu/man1/kill.1*
%lang(hu) %{_mandir}/hu/man1/logger.1*
%lang(hu) %{_mandir}/hu/man1/more.1*
%lang(hu) %{_mandir}/hu/man1/setterm.1*
%lang(hu) %{_mandir}/hu/man1/whereis.1*
%lang(hu) %{_mandir}/hu/man1/write.1*

%lang(hu) %{_mandir}/hu/man8/ctrlaltdel.8*
%lang(hu) %{_mandir}/hu/man8/fdformat.8*
%lang(hu) %{_mandir}/hu/man8/mkswap.8*

%lang(id) %{_mandir}/id/man1/cal.1*
%lang(id) %{_mandir}/id/man1/kill.1*
%lang(id) %{_mandir}/id/man1/logger.1*
%lang(id) %{_mandir}/id/man1/more.1*
%lang(id) %{_mandir}/id/man1/script.1*
%lang(id) %{_mandir}/id/man1/write.1*

%lang(id) %{_mandir}/id/man8/fdformat.8*

%lang(it) %{_mandir}/it/man1/arch.1*
%lang(it) %{_mandir}/it/man1/kill.1*

%lang(it) %{_mandir}/it/man8/mkswap.8*
%lang(it) %{_mandir}/it/man8/setsid.8*

%lang(ja) %{_mandir}/ja/man1/arch.1*
%lang(ja) %{_mandir}/ja/man1/cal.1*
%lang(ja) %{_mandir}/ja/man1/col.1*
%lang(ja) %{_mandir}/ja/man1/colcrt.1*
%lang(ja) %{_mandir}/ja/man1/colrm.1*
%lang(ja) %{_mandir}/ja/man1/column.1*
%lang(ja) %{_mandir}/ja/man1/ddate.1*
%lang(ja) %{_mandir}/ja/man1/getopt.1*
%lang(ja) %{_mandir}/ja/man1/hexdump.1*
%lang(ja) %{_mandir}/ja/man1/kill.1*
%lang(ja) %{_mandir}/ja/man1/line.1*
%lang(ja) %{_mandir}/ja/man1/logger.1*
%lang(ja) %{_mandir}/ja/man1/look.1*
%lang(ja) %{_mandir}/ja/man1/mcookie.1*
%lang(ja) %{_mandir}/ja/man1/more.1*
%lang(ja) %{_mandir}/ja/man1/namei.1*
%lang(ja) %{_mandir}/ja/man1/readprofile.1*
%lang(ja) %{_mandir}/ja/man1/rename.1*
%lang(ja) %{_mandir}/ja/man1/rev.1*
%lang(ja) %{_mandir}/ja/man1/script.1*
%lang(ja) %{_mandir}/ja/man1/setterm.1*
%lang(ja) %{_mandir}/ja/man1/ul.1*
%lang(ja) %{_mandir}/ja/man1/whereis.1*
%lang(ja) %{_mandir}/ja/man1/write.1*

%lang(ja) %{_mandir}/ja/man8/blockdev.8*
%lang(ja) %{_mandir}/ja/man8/ctrlaltdel.8*
%lang(ja) %{_mandir}/ja/man8/cytune.8*
%lang(ja) %{_mandir}/ja/man8/dmesg.8*
%lang(ja) %{_mandir}/ja/man8/elvtune.8*
%lang(ja) %{_mandir}/ja/man8/fdformat.8*
%lang(ja) %{_mandir}/ja/man8/ipcrm.8*
%lang(ja) %{_mandir}/ja/man8/ipcs.8*
%lang(ja) %{_mandir}/ja/man8/isosize.8*
%lang(ja) %{_mandir}/ja/man8/mkswap.8*
%lang(ja) %{_mandir}/ja/man8/renice.8*
%lang(ja) %{_mandir}/ja/man8/setfdprm.8*
%lang(ja) %{_mandir}/ja/man8/setsid.8*

%lang(ko) %{_mandir}/ko/man1/arch.1*
%lang(ko) %{_mandir}/ko/man1/cal.1*
%lang(ko) %{_mandir}/ko/man1/col.1*
%lang(ko) %{_mandir}/ko/man1/colcrt.1*
%lang(ko) %{_mandir}/ko/man1/colrm.1*
%lang(ko) %{_mandir}/ko/man1/column.1*
%lang(ko) %{_mandir}/ko/man1/ddate.1*
%lang(ko) %{_mandir}/ko/man1/getopt.1*
%lang(ko) %{_mandir}/ko/man1/hexdump.1*
%lang(ko) %{_mandir}/ko/man1/kill.1*
%lang(ko) %{_mandir}/ko/man1/logger.1*
%lang(ko) %{_mandir}/ko/man1/look.1*
%lang(ko) %{_mandir}/ko/man1/mcookie.1*
%lang(ko) %{_mandir}/ko/man1/more.1*
%lang(ko) %{_mandir}/ko/man1/namei.1*
%lang(ko) %{_mandir}/ko/man1/readprofile.1*
%lang(ko) %{_mandir}/ko/man1/rev.1*
%lang(ko) %{_mandir}/ko/man1/script.1*
%lang(ko) %{_mandir}/ko/man1/setterm.1*
%lang(ko) %{_mandir}/ko/man1/ul.1*
%lang(ko) %{_mandir}/ko/man1/whereis.1*
%lang(ko) %{_mandir}/ko/man1/write.1*

%lang(ko) %{_mandir}/ko/man8/ctrlaltdel.8*
%lang(ko) %{_mandir}/ko/man8/dmesg.8*
%lang(ko) %{_mandir}/ko/man8/fdformat.8*
%lang(ko) %{_mandir}/ko/man8/ipcrm.8*
%lang(ko) %{_mandir}/ko/man8/ipcs.8*
%lang(ko) %{_mandir}/ko/man8/mkswap.8*
%lang(ko) %{_mandir}/ko/man8/renice.8*
%lang(ko) %{_mandir}/ko/man8/setfdprm.8*
%lang(ko) %{_mandir}/ko/man8/setsid.8*

%lang(nl) %{_mandir}/nl/man1/kill.1*

%lang(pl) %{_mandir}/pl/man1/arch.1*
%lang(pl) %{_mandir}/pl/man1/cal.1*
%lang(pl) %{_mandir}/pl/man1/col.1*
%lang(pl) %{_mandir}/pl/man1/colcrt.1*
%lang(pl) %{_mandir}/pl/man1/colrm.1*
%lang(pl) %{_mandir}/pl/man1/getopt.1*
%lang(pl) %{_mandir}/pl/man1/hexdump.1*
%lang(pl) %{_mandir}/pl/man1/kill.1*
%lang(pl) %{_mandir}/pl/man1/look.1*
%lang(pl) %{_mandir}/pl/man1/logger.1*
%lang(pl) %{_mandir}/pl/man1/more.1*
%lang(pl) %{_mandir}/pl/man1/rev.1*
%lang(pl) %{_mandir}/pl/man1/script.1*
%lang(pl) %{_mandir}/pl/man1/setterm.1*
%lang(pl) %{_mandir}/pl/man1/ul.1*
%lang(pl) %{_mandir}/pl/man1/whereis.1*
%lang(pl) %{_mandir}/pl/man1/write.1*

%lang(pl) %{_mandir}/pl/man8/ctrlaltdel.8*
%lang(pl) %{_mandir}/pl/man8/dmesg.8*
%lang(pl) %{_mandir}/pl/man8/fdformat.8*
%lang(pl) %{_mandir}/pl/man8/ipcrm.8*
%lang(pl) %{_mandir}/pl/man8/ipcs.8*
%lang(pl) %{_mandir}/pl/man8/mkswap.8*
%lang(pl) %{_mandir}/pl/man8/renice.8*
%lang(pl) %{_mandir}/pl/man8/setfdprm.8*

%dir %{_examplesdir}/getopt
%attr(755,root,root) %{_examplesdir}/getopt/*

%attr(755,root,root) /sbin/fdisk
%attr(755,root,root) /sbin/fsck.minix
%attr(755,root,root) /sbin/mkfs.minix
%ifnarch sparc sparc64
%{!?_with_uClibc:%attr(755,root,root) /sbin/cfdisk}
%attr(755,root,root) /sbin/sfdisk
%endif

%{_mandir}/man8/fdisk.8*
%ifnarch sparc sparc64
%{!?_with_uClibc:%{_mandir}/man8/cfdisk.8*}
%{_mandir}/man8/sfdisk.8*
%endif
%{_mandir}/man8/fsck.minix.8*
%{_mandir}/man8/mkfs.bfs.8*
%{_mandir}/man8/mkfs.minix.8*
%{_mandir}/man8/mkfs.8*

%lang(es) %{_mandir}/es/man8/fdisk.8*
%lang(es) %{_mandir}/es/man8/fsck.minix.8*
%lang(es) %{_mandir}/es/man8/mkfs.minix.8*
%lang(es) %{_mandir}/es/man8/mkfs.8*

%lang(fr) %{_mandir}/fr/man8/fdisk.8*
%ifnarch sparc sparc64
%{!?_with_uClibc:%lang(fr) %{_mandir}/fr/man8/cfdisk.8*}
%lang(fr) %{_mandir}/fr/man8/sfdisk.8*
%endif
%lang(fr) %{_mandir}/fr/man8/mkfs.minix.8*
%lang(fr) %{_mandir}/fr/man8/mkfs.8*

%lang(hu) %{_mandir}/hu/man8/mkfs.8*

%lang(it) %{_mandir}/it/man8/fdisk.8*
%ifnarch sparc sparc64
%{!?_with_uClibc:%lang(it) %{_mandir}/it/man8/cfdisk.8*}
%endif

%lang(ja) %{_mandir}/ja/man8/fdisk.8*
%ifnarch sparc sparc64
%{!?_with_uClibc:%lang(ja) %{_mandir}/ja/man8/cfdisk.8*}
%lang(ja) %{_mandir}/ja/man8/sfdisk.8*
%endif
%lang(ja) %{_mandir}/ja/man8/fsck.minix.8*
%lang(ja) %{_mandir}/ja/man8/mkfs.bfs.8*
%lang(ja) %{_mandir}/ja/man8/mkfs.minix.8*
%lang(ja) %{_mandir}/ja/man8/mkfs.8*

%lang(ko) %{_mandir}/ko/man8/fdisk.8*
%lang(ko) %{_mandir}/ko/man8/fsck.minix.8*
%lang(ko) %{_mandir}/ko/man8/mkfs.minix.8*
%lang(ko) %{_mandir}/ko/man8/mkfs.8*

%lang(pl) %{_mandir}/pl/man8/fdisk.8*
%lang(pl) %{_mandir}/pl/man8/fsck.minix.8*
%lang(pl) %{_mandir}/pl/man8/mkfs.minix.8*
%lang(pl) %{_mandir}/pl/man8/mkfs.8*

%{!?_with_uClibc:%attr(755,root,root) /sbin/fsck.cramfs}
%{!?_with_uClibc:%attr(755,root,root) /sbin/mkfs.cramfs}
%attr(755,root,root) /sbin/mkfs.bfs

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

%lang(de) %{_mandir}/de/man8/ramsize.8*
%lang(de) %{_mandir}/de/man8/rdev.8*
%lang(de) %{_mandir}/de/man8/rootflags.8*
%lang(de) %{_mandir}/de/man8/vidmode.8*

%lang(es) %{_mandir}/es/man8/ramsize.8*
%lang(es) %{_mandir}/es/man8/rdev.8*
%lang(es) %{_mandir}/es/man8/rootflags.8*
%lang(es) %{_mandir}/es/man8/vidmode.8*

%lang(ja) %{_mandir}/ja/man8/ramsize.8*
%lang(ja) %{_mandir}/ja/man8/rdev.8*
%lang(ja) %{_mandir}/ja/man8/rootflags.8*
%lang(ja) %{_mandir}/ja/man8/vidmode.8*

%lang(ko) %{_mandir}/ko/man8/ramsize.8*
%lang(ko) %{_mandir}/ko/man8/rdev.8*
%lang(ko) %{_mandir}/ko/man8/rootflags.8*
%lang(ko) %{_mandir}/ko/man8/vidmode.8*

%lang(pl) %{_mandir}/pl/man8/ramsize.8*
%lang(pl) %{_mandir}/pl/man8/rdev.8*
%lang(pl) %{_mandir}/pl/man8/rootflags.8*
%lang(pl) %{_mandir}/pl/man8/vidmode.8*
%endif

%{_infodir}/ipc*

%ghost /var/lock/wtmpxlock

%files -n mount
%defattr(644,root,root,755)

%attr(4755,root,root) /bin/mount
%attr(4755,root,root) /bin/umount
%attr(755,root,root) /sbin/pivot_root
%attr(755,root,root) /sbin/swapon
%attr(755,root,root) /sbin/swapoff

%{_mandir}/man5/fstab.5*
%{_mandir}/man5/nfs.5*

%{_mandir}/man8/mount.8*
%{_mandir}/man8/umount.8*
%{_mandir}/man8/pivot_root.8*
%{_mandir}/man8/swapon.8*
%{_mandir}/man8/swapoff.8*

%lang(cs) %{_mandir}/cs/man5/fstab.5*

%lang(de) %{_mandir}/de/man5/fstab.5*
%lang(de) %{_mandir}/de/man5/nfs.5*

%lang(es) %{_mandir}/es/man5/fstab.5*
%lang(es) %{_mandir}/es/man5/nfs.5*

%lang(es) %{_mandir}/es/man8/mount.8*
%lang(es) %{_mandir}/es/man8/umount.8*
%lang(es) %{_mandir}/es/man8/swapon.8*
%lang(es) %{_mandir}/es/man8/swapoff.8*

%lang(fr) %{_mandir}/fr/man5/fstab.5*
%lang(fr) %{_mandir}/fr/man5/nfs.5*

%lang(fr) %{_mandir}/fr/man8/mount.8*
%lang(fr) %{_mandir}/fr/man8/umount.8*

%lang(hu) %{_mandir}/hu/man5/fstab.5*

%lang(hu) %{_mandir}/hu/man8/mount.8*
%lang(hu) %{_mandir}/hu/man8/umount.8*

%lang(it) %{_mandir}/it/man5/fstab.5*
%lang(it) %{_mandir}/it/man5/nfs.5*

%lang(it) %{_mandir}/it/man8/mount.8*
%lang(it) %{_mandir}/it/man8/umount.8*
%lang(it) %{_mandir}/it/man8/swapon.8*
%lang(it) %{_mandir}/it/man8/swapoff.8*

%lang(ja) %{_mandir}/ja/man5/fstab.5*
%lang(ja) %{_mandir}/ja/man5/nfs.5*

%lang(ja) %{_mandir}/ja/man8/mount.8*
%lang(ja) %{_mandir}/ja/man8/umount.8*
%lang(ja) %{_mandir}/ja/man8/pivot_root.8*
%lang(ja) %{_mandir}/ja/man8/swapon.8*
%lang(ja) %{_mandir}/ja/man8/swapoff.8*

%lang(ko) %{_mandir}/ko/man5/fstab.5*
%lang(ko) %{_mandir}/ko/man5/nfs.5*

%lang(ko) %{_mandir}/ko/man8/mount.8*
%lang(ko) %{_mandir}/ko/man8/umount.8*
%lang(ko) %{_mandir}/ko/man8/swapon.8*
%lang(ko) %{_mandir}/ko/man8/swapoff.8*

%lang(pl) %{_mandir}/pl/man5/fstab.5*
%lang(pl) %{_mandir}/pl/man5/nfs.5*

%lang(pl) %{_mandir}/pl/man8/mount.8*
%lang(pl) %{_mandir}/pl/man8/umount.8*
%lang(pl) %{_mandir}/pl/man8/swapon.8*
%lang(pl) %{_mandir}/pl/man8/swapoff.8*

%files -n losetup
%defattr(644,root,root,755)
%attr(755,root,root) /sbin/losetup

%{_mandir}/man8/losetup.8*
%lang(fr) %{_mandir}/fr/man8/losetup.8*
%lang(it) %{_mandir}/it/man8/losetup.8*
%lang(ja) %{_mandir}/ja/man8/losetup.8*
%lang(ko) %{_mandir}/ko/man8/losetup.8*
%lang(pl) %{_mandir}/pl/man8/losetup.8*

%files chkdupexe
%defattr(644,root,root,755)
%attr(755,root,root) %{_bindir}/chkdupexe

%{_mandir}/man1/chkdupexe.1*
%lang(ja) %{_mandir}/ja/man1/chkdupexe.1*
%lang(ko) %{_mandir}/ko/man1/chkdupexe.1*
%lang(pl) %{_mandir}/pl/man1/chkdupexe.1*

%files -n tunelp
%defattr(644,root,root,755)
%attr(755,root,root) %{_sbindir}/tunelp

%{_mandir}/man8/tunelp.8*
%lang(es) %{_mandir}/es/man8/tunelp.8*
%lang(ja) %{_mandir}/ja/man8/tunelp.8*
%lang(pl) %{_mandir}/pl/man8/tunelp.8*

%if %{?_with_uClibc:0}%{!?_with_uClibc:1}
%files -n login
%defattr(644,root,root,755)
%attr(640,root,root) %config(noreplace) %verify(not size mtime md5) /etc/pam.d/login
%attr(640,root,root) %config(noreplace) %verify(not size mtime md5) /etc/security/blacklist.login
%attr(755,root,root) /bin/login

%{_mandir}/man1/login.1*
%lang(de) %{_mandir}/de/man1/login.1*
%lang(es) %{_mandir}/es/man1/login.1*
%lang(hu) %{_mandir}/hu/man1/login.1*
%lang(id) %{_mandir}/id/man1/login.1*
%lang(ja) %{_mandir}/ja/man1/login.1*
%lang(ko) %{_mandir}/ko/man1/login.1*
%lang(pl) %{_mandir}/pl/man1/login.1*
%endif

%files -n agetty
%defattr(644,root,root,755)
%attr(0755,root,root) /sbin/agetty

%{_mandir}/man8/agetty.8*
%lang(es) %{_mandir}/es/man8/agetty.8*
%lang(ja) %{_mandir}/ja/man8/agetty.8*

%if %{?_with_uClibc:0}%{!?_with_uClibc:1}
%files -n rawdevices
%defattr(644,root,root,755)
%attr(755,root,root) %{_bindir}/raw
%attr(754,root,root) /etc/rc.d/init.d/rawdevices
%attr(640,root,root) %config(noreplace) %verify(not size mtime md5) /etc/sysconfig/rawdevices

%{_mandir}/man8/raw.8*
%lang(ja) %{_mandir}/ja/man8/raw.8*
%endif
