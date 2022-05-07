# TODO
# - remote chfn/chsh (BR: libuser >= 0.58)? - but PLD uses pwdutils/shadow implementation currently
# - verify initrd tools set:
#   - I've taken list from 2.21.3 package, but there was no explicit list, so
#     there are probably some unneeded tools
#   - chrt is not built now (because of --disable-schedutils), but it's probably not needed
#   - fsck is not built now (because of --disable-libmount)
#   - maybe we want some more now?
# - agetty: Documentation/releases/v2.32-ReleaseNotes:54:   - add support for /etc/issue.d  [Karel Zak]
#   https://github.com/karelzak/util-linux/commit/1fc82a1360305f696dc1be6105c9c56a9ea03f52#diff-d7efd2b3dbb10e54185f001dc21d43db
#
# Conditional build:
%bcond_with	initrd		# initrd version
%bcond_with	uClibc		# link initrd version with static glibc instead of uClibc
%bcond_without	dietlibc	# link initrd version with dietlibc instead of uClibc
%bcond_without	apidocs		# API documentation for libraries
%bcond_without	selinux		# SELinux support
%bcond_without	su		# su/runuser programs
%bcond_without	systemd		# systemd support

%define		pam_ver 1:1.1.8-5

Summary:	Collection of basic system utilities for Linux
Summary(de.UTF-8):	Sammlung von grundlegenden Systemdienstprogrammen für Linux
Summary(es.UTF-8):	Colectánea de utilitarios básicos de sistema para Linux
Summary(fr.UTF-8):	Ensemble d'utilitaires système de base pour Linux
Summary(pl.UTF-8):	Zbiór podstawowych narzędzi systemowych dla Linuksa
Summary(pt_BR.UTF-8):	Coletânea de utilitários básicos de sistema para Linux
Summary(ru.UTF-8):	Набор базовых системных утилит для Linux
Summary(tr.UTF-8):	Temel sistem araçları
Summary(uk.UTF-8):	Набір базових системних утиліт для Linux
Name:		util-linux
Version:	2.38
Release:	1
License:	GPL v2+, GPL v3 (hwclock)
Group:		Applications/System
# https://github.com/karelzak/util-linux (GitHub backup)
Source0:	https://www.kernel.org/pub/linux/utils/util-linux/v2.38/%{name}-%{version}.tar.xz
# Source0-md5:	fffdc126809a6d4c1789a9efc1b96623
Source1:	%{name}-non-english-man-pages.tar.bz2
# Source1-md5:	3c940c7e7fe699eaa2ddb1bffb3de2fe
Source2:	login.pamd
Source3:	%{name}-blockdev.init
Source4:	%{name}-blockdev.sysconfig
Source6:	su.pamd
Source7:	su-l.pamd
Source8:	runuser.pamd
Source9:	runuser-l.pamd
Source12:	blockdev.service
Source13:	blockdev.sh
Patch0:		%{name}-fdformat-ide.patch
Patch1:		%{name}-fhs.patch
Patch2:		%{name}-login-lastlog.patch
Patch3:		%{name}-procpartitions.patch
Patch4:		su-paths.patch
Patch5:		%{name}-ac.patch
Patch6:		%{name}-diet.patch
Patch7:		%{name}-man-asciidoctor.patch
URL:		https://github.com/karelzak/util-linux
BuildRequires:	audit-libs-devel >= 1.0.6
BuildRequires:	autoconf >= 2.64
BuildRequires:	automake >= 1:1.10
BuildRequires:	gettext-tools >= 0.21
# for fallocate
BuildRequires:	glibc-devel >= 6:2.11
%if %{with apidocs}
BuildRequires:	gtk-doc >= 1.10
BuildRequires:	gtk-doc-automake >= 1.10
%endif
BuildRequires:	libcap-ng-devel
%ifarch ppc ppc64
# for lscpu
BuildRequires:	librtas-devel
%endif
%{?with_selinux:BuildRequires:	libselinux-devel >= 2.5}
%{?with_selinux:BuildRequires:	libsepol-devel}
BuildRequires:	libtool >= 2:2.2
BuildRequires:	linux-libc-headers >= 7:2.6.27
BuildRequires:	ncurses-devel >= 5.0
BuildRequires:	pam-devel >= %{pam_ver}
BuildRequires:	pkgconfig
BuildRequires:	po4a
BuildRequires:	python3-devel
BuildRequires:	readline-devel
BuildRequires:	rpm >= 4.4.9-56
BuildRequires:	rpmbuild(macros) >= 1.752
BuildRequires:	ruby-asciidoctor
BuildRequires:	sed >= 4.0
%{?with_systemd:BuildRequires:	systemd-devel >= 1:209}
BuildRequires:	tar >= 1:1.22
BuildRequires:	udev-devel
BuildRequires:	xz
BuildRequires:	zlib-devel
%if %{with initrd}
	%if %{with uClibc}
BuildRequires:	uClibc-static >= 2:0.9.29
	%else
		%if %{with dietlibc}
BuildRequires:	dietlibc-static >= 2:0.32-14
		%else
BuildRequires:	glibc-static
		%endif
	%endif
%endif
Requires:	libblkid = %{version}-%{release}
Requires:	libfdisk = %{version}-%{release}
Requires:	libmount = %{version}-%{release}
%{?with_selinux:Requires:	libselinux >= 2.5}
Requires:	libsmartcols = %{version}-%{release}
# for uuidparse
Requires:	libuuid= %{version}-%{release}
Requires:	pam >= %{pam_ver}
Provides:	eject = %{version}-%{release}
Provides:	fdisk
Provides:	hardlink
Provides:	linux32
Provides:	sparc32
Obsoletes:	cramfs < 1.2
Obsoletes:	eject < 2.2
Obsoletes:	hardlink < 1.1
Obsoletes:	ionice < 0.2
Obsoletes:	linux32 < 1.1
Obsoletes:	rawdevices < 2.14
Obsoletes:	rfkill < 1.1
Obsoletes:	schedutils < 1.4
Obsoletes:	setarch < 1.8
Obsoletes:	sparc32 < 1.2
Obsoletes:	util-linux-chkdupexe < 2.23
Obsoletes:	util-linux-ng < 2.20-1
Obsoletes:	util-linux-suid < 2.9o-10
Conflicts:	SysVinit-tools < 2.88-15
Conflicts:	e2fsprogs < 1.41.8-5
Conflicts:	rc-scripts < 0.4.9-2
Conflicts:	shadow-extras < 1:4.0.3-6
%if %{with su}
Conflicts:	coreutils < 8.19
%endif
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%define		debugcflags	-O1 -g

# for some reason known only to rpm there must be "\\|" not "\|" here
%define		dietarch	%(echo %{_target_cpu} | sed -e 's/i.86\\|pentium.\\|athlon/i386/;s/amd64/x86_64/;s/armv.*/arm/')
%define		dietlibdir	%{_prefix}/lib/dietlibc/lib-%{dietarch}

%ifarch ppc ppc64
# for dietlibc
%define		filterout_ld	-Wl,-z,relro
%endif

%description
util-linux contains a large variety of low-level system utilities
necessary for a functional Linux system. This includes, among other
things, configuration tools such as fdisk and system programs such as
logger.

%description -l de.UTF-8
util-linux enthält eine große Anzahl an
low-level-Systemdienstprogrammen, die für ein funktionierendes
Linux-System erforderlich sind. Dazu gehören Konfigurationstools wie
'fdisk' und Systemprogramme wie 'logger'.

%description -l es.UTF-8
util-linux contiene una gran variedad de utilitarios de sistema de
bajo nivel necesarios a un sistema Linux funcional. Esto incluye,
entre otras cosas, herramientas de configuración como fdisk y
programas de sistema como logger.

%description -l fr.UTF-8
util-linux contient une grande variété d'utilitaire système bas niveau
nécessaires au fonctionnement d'un système Linux. Cela comprend, entre
autres, les outils de configuration comme fdisk et des programmes
systèmes comme logger.

%description -l pl.UTF-8
util-linux zawiera wiele różnych, niskopoziomowych narzędzi
systemowych niezbędnych do prawidłowego działania Linuksa. W pakiecie
znajdują się między innymi narzędzia konfiguracyjne, takie jak fdisk i
programy systemowe, takie jak logger.

%description -l pt_BR.UTF-8
util-linux contém uma grande variedade de utilitários de sistema de
baixo-nível necessários para um sistema Linux funcional. Isso inclui,
entre outras coisas, ferramentas de configuração como fdisk e
programas de sistema como logger.

%description -l ru.UTF-8
Этот пакет содержит большой набор системных утилит низкого уровня,
которые необходимы для функционирования системы Linux. Он включает, в
числе прочих, инструменты конфигурации, такие как fdisk, и системные
программы, такие как logger.

%description -l tr.UTF-8
şlevsel durumdaki bir Linux sistemi için gerekli birçok alt düzey
sistem araçlarını içerir. Bunlar arasında fdisk gibi yapılandırma
uygulamaları ve logger gibi sistem programları sayılabilir.

%description -l uk.UTF-8
Цей пакет містить великий набір системних утиліт низького рівня, які
необхідні для функціонування системи Linux. Він містить, окрім інших,
конфігураційні інструменти (такі як fdisk) та системні програми (такі
як logger).

%package -n blockdev
Summary:	Support for blockdev
Summary(pl.UTF-8):	Obsługa blockdev
License:	GPL v2+
Group:		Applications/System
Requires(post,preun):	/sbin/chkconfig
Requires(post,preun,postun):	systemd-units >= 38
Requires:	coreutils
Requires:	rc-scripts >= 0.4.3.0
Requires:	systemd-units >= 38

%description -n blockdev
The utility blockdev allows one to call block device ioctls from the
command line. This package also includes initscript to set blockdev
parameters at system startup.

%description -n blockdev -l pl.UTF-8
Narzędzie blockdev pozwala na wywołania ioctl dla urządzeń blokowych z
linii poleceń. Ten pakiet zawiera także skrypt inicjalizacyjny do
ustawiania parametrów blockdev przy starcie systemu.

%package -n losetup
Summary:	Programs for setting up and configuring loopback devices
Summary(de.UTF-8):	Programme zum Einrichten und Konfigurieren von Loopback-Geräten
Summary(fr.UTF-8):	Programmes pour mettre en place et configurer les loopback
Summary(pl.UTF-8):	Program do konfiguracji urządzenia blokowego loopback
Summary(ru.UTF-8):	Программы для настройки loopback-устройств
Summary(tr.UTF-8):	Yerel-çevrim aygıtlarının kurulması ve ayarlanması için programlar
Summary(uk.UTF-8):	Програми для конфігурації loopback-пристроїв
License:	GPL v2+
Group:		Applications/System
Requires:	libsmartcols = %{version}-%{release}

%description -n losetup
Linux supports a special block device called the loopback device,
which maps a normal file onto a virtual block device. This package
contains programs for setting up and removing the mapping between
files and loopback devices.

Block loopback devices should not be confused with the networking
loopback device, which is configured with the normal ifconfig command.

%description -n losetup -l de.UTF-8
Linux unterstützt ein spezielles Blockgerät, das sogenannte Loopback,
das eine normale Datei auf ein virtuelles Blockgerät abbildet. Das
Paket enthält Programme zum Einrichten und Entfernen der Zuordnung
zwischen Dateien und Loopback-Geräten.

%description -n losetup -l fr.UTF-8
Linux gère un périphérique bloc spécial appelé « loopback », qui
correspond à un fichier normal sur un périphérique bloc virtuel. Ce
paquetage contient les programmes pour configurer et supprimer la
correspondance entre les fichiers et les périphériques loopback.

Les périphériques bloc loopback ne doivent pas être confondus avec le
périphérique loopback du réseau, configuré avec la commande ifconfig
normale.

%description -n losetup -l pl.UTF-8
Linux wspiera specjalne urządzenie blokowe loopback, które mapuje
normalny plik w wirtualne urządzenie blokowe. Pakiet ten zawiera
program, przy pomocy którego będziesz mógł je skonfigurować.

Urządzenie blokowe loopback nie powinno być mylone z sieciowym
interfejsem loopback, który jest konfigurowany przy pomocy polecenia
ifconfig.

%description -n losetup -l ru.UTF-8
Linux поддерживает специальное блочное устройство, называемое
loopback, которое отображает обычный файл в виртуальное блочное
устройство. Это позволяет использовать файл как виртуальную файловую
систему. Losetup используется для связи loopback-устройств с обычными
файлами или блочными устройствами, для отсоединения loopback-устройств
и запросов их статуса.

%description -n losetup -l tr.UTF-8
Linux özel bir blok aygıt olan yerel-çevrim aygıtını (loopback device)
destekler. Bu aygıt normal bir dosyanın sanal bir blok aygıtı üzerine
haritasını çıkarır. Bu paket, dosyalar ve yerel-çevrim aygıtları
arasındaki haritalama işleminin kurulması ve kaldırılması için
programlar içerir. Blok yerel-çevrim aygıtı ifconfig komutu ile
yapılandırılan ağ yerel-çevrim aygıtı ile karıştırılmamalıdır.

%description -n losetup -l uk.UTF-8
Linux підтримує спеціальний блочний пристрій, loopback, який
відображує звичайний файл у віртуальний блочний пристрій. Це дозволяє
використовувати файл як віртуальну файлову систему. Losetup
використовують для зв'язку loopback-пристроїв зі звичайними файлами
або блочними пристроями, для від'єднання loopback-пристроїв та
запросів їх стану.

%package -n mount
Summary:	Programs for mounting and unmounting filesystems
Summary(de.UTF-8):	Programme zum montieren und abmontieren von Dateisystemen
Summary(fr.UTF-8):	Programme pour monter et démonter des systèmes de fichiers
Summary(pl.UTF-8):	Programy do montowania i odmontowywania systemów plików
Summary(ru.UTF-8):	Программы для монтирования и размонтирования файловых систем
Summary(tr.UTF-8):	Dosya sistemlerini bağlamak ve çözmek için programlar
Summary(uk.UTF-8):	Програми для монтування та розмонтування файлових систем
License:	GPL v2+
Group:		Applications/System
Requires:	libmount = %{version}-%{release}
Requires:	libsmartcols = %{version}-%{release}
Conflicts:	SysVinit < 2.86-26
# C: nfs-utils-common is opposite to http://cvs.pld-linux.org/packages/nfs-utils/nfs-utils.spec?r1=1.165&r2=1.166
Conflicts:	nfs-utils-common < 1.1.3-3

%description -n mount
mount is used for adding new filesystems, both local and networked, to
your current directory structure. The filesystems must already exist
for this to work. It can also be used to change the access types the
kernel uses for already-mounted filesystems.

This package is critical for the functionality of your system.

%description -n mount -l de.UTF-8
mount wird zum Hinzufügen neuer Dateisysteme (lokal und im Netzwerk)
zu Ihrer aktuellen Verzeichnisstruktur verwendet. Die Dateisysteme
müssen bereits existieren. Außerdem können die Zugriffstypen geändert
werden, die der Kernel für bereits montierte Dateisysteme verwendet.

Dieses Paket ist für Ihr System unbedingt erforderlich.

%description -n mount -l fr.UTF-8
mount sert à ajouter de nouveaux systèmes de fichiers, locaux ou
réseaux, à votre structure de répertoire. Les systèmes de fichiers
doivent déjà exister pour que cela fonctionne. Il peut aussi servir à
changer les types d'accès pour les systèmes de fichiers déjà montés.

Ce paquetage est critique pour le fonctionnement de votre système.

%description -n mount -l pl.UTF-8
Program mount jest używany przez system do montowania systemów plików,
zarówno lokalnych jak i sieciowych (np. NFS).

Pakiet ten jest niezbędny do prawidłowej pracy twojego Linuksa.

%description -n mount -l ru.UTF-8
Пакет mount содержит программы mount, umount, swapon и swapoff. Файлы
в вашей системе организованы в виде одного большого дерева или
иерархии. Эти файлы могут быть размещены на разных устройствах.
Команда mount присоединяет файловую систему на некотором устройстве к
дереву файлов вашей системы. Команда umount отсоединяет файловую
систему от дерева. Swapon и swapoff, соответственно, разрешает и
запрещает своппинг в определенные файлы и устройства.

%description -n mount -l tr.UTF-8
mount, hem yerel hem de ağ dosya sistemlerinin dizin yapısına
eklenmesi için kullanılır. Bunun için bağlanacak dosya sisteminin
önceden hazırlanmış olması gerekir. Aynı zamanda çekirdeğin bağlanmış
dosya sistemlerine erişimini değiştirmek için de kullanılır. Bu paket
sisteminizin işlevselliği açısından kritiktir.

%description -n mount -l uk.UTF-8
Пакет mount містить програми mount, umount, swapon та swapoff. Файли у
вашій системі організовані у вигляді одного великого дерева або
ієрархії. Ці файли можуть бути розташовані на різних пристроях.
Команда mount під'єднує файлову систему на деякому пристрої до дерева
файлів вашої системи. Команда umount від'єднує файлову систему від
дерева. Swapon та swapoff, відповідно, дозволяє та заборонює свопінг у
визначені файли або пристрої.

%package -n tunelp
Summary:	Configures kernel parallel port driver
Summary(de.UTF-8):	Konfiguriert den Kerneltreiber für den parallelen Port
Summary(fr.UTF-8):	Configure le pilote du port parallèle dans le noyau
Summary(pl.UTF-8):	Program do konfigurowania sterownika portu równoległego
Summary(tr.UTF-8):	Çekirdeğin paralel bağlantı noktası sürücüsünü ayarlar
License:	GPL v2+
Group:		Applications/System

%description -n tunelp
tunelp aids in configuring the kernel parallel port driver.

%description -n tunelp -l de.UTF-8
tunelp hilft bei der Konfiguration des Kernel-Parallelport-Treibers.

%description -n tunelp -l fr.UTF-8
« tunelp » aide à configurer le pilote du noyau pour le port
parallèle.

%description -n tunelp -l pl.UTF-8
Program do konfigurowania sterownika portu równoległego.

%description -n tunelp -l tr.UTF-8
Paralel bağlantı noktası sürücüsünü ayarlar.

%package -n login
Summary:	login is used when signing onto a system
Summary(pl.UTF-8):	login jest używany do rozpoczęcia pracy w systemie
License:	GPL v2+
Group:		Applications/System
Requires:	pam >= %{pam_ver}
Obsoletes:	heimdal-login

%description -n login
login is used when signing onto a system. It can also be used to
switch from one user to another at any time (most modern shells have
support for this feature built into them, however).

%description -n login -l pl.UTF-8
login jest używany do rozpoczęcia pracy w systemie. Może być używany
do przełączania z jednego użytkownika na innego w każdym momencie
(jednak większość nowoczesnych powłok ma takie funkcje wbudowane).

%package -n agetty
Summary:	Alternative Linux getty
Summary(pl.UTF-8):	Alternatywny getty
License:	GPL v2+
Group:		Applications/System
Requires:	login

%description -n agetty
agetty is simple Linux getty with serial support.

%description -n agetty -l pl.UTF-8
agetty jest prostym linuksowym getty z obsługą portu szeregowego.

%package -n libblkid
Summary:	Library to handle device identification and token extraction
Summary(pl.UTF-8):	Biblioteka do obsługi identyfikacji urządzeń
License:	LGPL v2.1+
Group:		Libraries
Obsoletes:	util-linux-ng-libs < 2.20-1

%description -n libblkid
Library to handle device identification and token extraction.

%description -n libblkid -l pl.UTF-8
Biblioteka do obsługi identyfikacji urządzeń i wydobywania tokenów.

%package -n libblkid-devel
Summary:	Header files for blkid library
Summary(pl.UTF-8):	Pliki nagłówkowe biblioteki blkid
License:	LGPL v2.1+
Group:		Development/Libraries
Requires:	libblkid = %{version}-%{release}
Obsoletes:	util-linux-ng-devel < 2.20-1

%description -n libblkid-devel
Header files for blkid library.

%description -n libblkid-devel -l pl.UTF-8
Pliki nagłówkowe biblioteki blkid.

%package -n libblkid-static
Summary:	Static library to handle device identification and token extraction
Summary(pl.UTF-8):	Statyczna biblioteka do obsługi identyfikacji urządzeń
License:	LGPL v2.1+
Group:		Development/Libraries
Requires:	libblkid-devel = %{version}-%{release}
Obsoletes:	util-linux-ng-static < 2.20-1

%description -n libblkid-static
Static library to handle device identification and token extraction.

%description -n libblkid-static -l pl.UTF-8
Statyczna biblioteka do obsługi identyfikacji urządzeń i wydobywania
tokenów.

%package -n libblkid-dietlibc
Summary:	Static dietlibc library to handle device identification and token extraction
Summary(pl.UTF-8):	Statyczna biblioteka dietlibc do obsługi identyfikacji urządzeń
License:	LGPL v2.1+
Group:		Development/Libraries
Requires:	libblkid-devel = %{version}-%{release}

%description -n libblkid-dietlibc
Library to handle device identification and token extraction - static
dietlibc version.

%description -n libblkid-dietlibc -l pl.UTF-8
Biblioteka do obsługi identyfikacji urządzeń i wydobywania tokenów -
wersja statyczna dla dietlibc.

%package -n libblkid-apidocs
Summary:	libblkid API documentation
Summary(pl.UTF-8):	Dokumentacja API libblkid
Group:		Documentation
Requires:	gtk-doc-common
BuildArch:	noarch

%description -n libblkid-apidocs
libblkid API documentation.

%description -n libblkid-apidocs -l pl.UTF-8
Dokumentacja API libblkid.

%package -n libuuid
Summary:	Library for accessing and manipulating UUID
Summary(pl.UTF-8):	Biblioteka umożliwiająca dostęp i zmiany UUID
License:	BSD
Group:		Libraries
Conflicts:	e2fsprogs < 1.34-3

%description -n libuuid
Library for accessing and manipulating UUID.

%description -n libuuid -l pl.UTF-8
Biblioteka umożliwiająca dostęp i zmiany UUID.

%package -n libuuid-devel
Summary:	Header files for library for accessing and manipulating UUID
Summary(pl.UTF-8):	Pliki nagłówkowe biblioteki umożliwiającej dostęp i zmiany UUID
License:	BSD
Group:		Development/Libraries
Requires:	libuuid = %{version}-%{release}
Conflicts:	e2fsprogs-devel < 1.34-3

%description -n libuuid-devel
Library for accessing and manipulating UUID - development files.

%description -n libuuid-devel -l pl.UTF-8
Biblioteka umożliwiająca dostęp i zmiany UUID - pliki dla
programistów.

%package -n libuuid-static
Summary:	Static library for accessing and manipulating UUID
Summary(pl.UTF-8):	Statyczna biblioteka umożliwiająca dostęp i zmiany UUID
License:	BSD
Group:		Development/Libraries
Requires:	libuuid-devel = %{version}-%{release}
Conflicts:	e2fsprogs-static < 1.34-3

%description -n libuuid-static
Library for accessing and manipulating UUID - static version.

%description -n libuuid-static -l pl.UTF-8
Biblioteka umożliwiająca dostęp i zmiany UUID - wersja statyczna.

%package -n libuuid-dietlibc
Summary:	Static dietlibc library for accessing and manipulating UUID
Summary(pl.UTF-8):	Statyczna biblioteka dietlibc umożliwiająca dostęp i zmiany UUID
License:	BSD
Group:		Development/Libraries
Requires:	libuuid-devel = %{version}-%{release}
Conflicts:	e2fsprogs-static < 1.34-3

%description -n libuuid-dietlibc
Library for accessing and manipulating UUID - static dietlibc version.

%description -n libuuid-dietlibc -l pl.UTF-8
Biblioteka umożliwiająca dostęp i zmiany UUID - wersja statyczna dla
dietlibc.

%package -n uuidd
Summary:	Helper daemon to guarantee uniqueness of time-based UUIDs
Summary(pl.UTF-8):	Pomocniczy demon gwarantujący unikalność UUID-ów opartych na czasie
License:	GPL v2+
Group:		Daemons
Requires(postun):	/usr/sbin/groupdel
Requires(postun):	/usr/sbin/userdel
Requires(pre):	/bin/id
Requires(pre):	/usr/bin/getgid
Requires(pre):	/usr/sbin/groupadd
Requires(pre):	/usr/sbin/groupmod
Requires(pre):	/usr/sbin/useradd
Requires(pre):	/usr/sbin/usermod
Requires(post,preun,postun):	systemd-units >= 38
Requires:	libuuid = %{version}-%{release}
Requires:	systemd-units >= 38
Provides:	group(uuidd)
Provides:	user(uuidd)
Conflicts:	libuuid < 1.40.5-0.1

%description -n uuidd
The uuidd package contains a userspace daemon (uuidd) which guarantees
uniqueness of time-based UUID generation even at very high rates on
SMP systems.

%description -n uuidd -l pl.UTF-8
Ten pakiet zawiera działającego w przestrzeni użytkownika demona
(uuidd) gwarantującego unikalność generowania UUID-ów opartych na
czasie nawet przy bardzo dużej częstotliwości na systemach SMP.

%package -n libfdisk
Summary:	fdisk library
Summary(pl.UTF-8):	Biblioteka fdisk
License:	LGPL v2.1+
Group:		Libraries
Requires:	libblkid = %{version}-%{release}
Requires:	libuuid = %{version}-%{release}

%description -n libfdisk
fdisk library.

%description -n libfdisk -l pl.UTF-8
Biblioteka fdisk.

%package -n libfdisk-devel
Summary:	Header files for fdisk library
Summary(pl.UTF-8):	Pliki nagłówkowe biblioteki fdisk
License:	LGPL v2.1+
Group:		Development/Libraries
Requires:	libblkid-devel = %{version}-%{release}
Requires:	libfdisk = %{version}-%{release}
Requires:	libuuid-devel = %{version}-%{release}

%description -n libfdisk-devel
Header files for fdisk library.

%description -n libfdisk-devel -l pl.UTF-8
Pliki nagłówkowe biblioteki fdisk.

%package -n libfdisk-static
Summary:	Static version of fdisk library
Summary(pl.UTF-8):	Statyczna wersja biblioteki fdisk
License:	LGPL v2.1+
Group:		Development/Libraries
Requires:	libfdisk-devel = %{version}-%{release}

%description -n libfdisk-static
Static version of fdisk library.

%description -n libfdisk-static -l pl.UTF-8
Statyczna wersja biblioteki fdisk.

%package -n libfdisk-apidocs
Summary:	libfdisk API documentation
Summary(pl.UTF-8):	Dokumentacja API libfdisk
Group:		Documentation
Requires:	gtk-doc-common
BuildArch:	noarch

%description -n libfdisk-apidocs
libfdisk API documentation.

%description -n libfdisk-apidocs -l pl.UTF-8
Dokumentacja API libfdisk.

%package -n libmount
Summary:	Library to handle mounting-related tasks
Summary(pl.UTF-8):	Biblioteka obsługująca zadania związane z montowaniem
License:	LGPL v2.1+
Group:		Libraries
Requires:	libblkid = %{version}-%{release}

%description -n libmount
Library to handle mounting-related tasks.

%description -n libmount -l pl.UTF-8
Biblioteka obsługująca zadania związane z montowaniem.

%package -n libmount-devel
Summary:	Header files for mount library
Summary(pl.UTF-8):	Pliki nagłówkowe biblioteki mount
License:	LGPL v2.1+
Group:		Development/Libraries
Requires:	libblkid-devel = %{version}-%{release}
Requires:	libmount = %{version}-%{release}

%description -n libmount-devel
Header files for mount library.

%description -n libmount-devel -l pl.UTF-8
Pliki nagłówkowe biblioteki mount.

%package -n libmount-static
Summary:	Static version of mount library
Summary(pl.UTF-8):	Statyczna wersja biblioteki mount
License:	LGPL v2.1+
Group:		Development/Libraries
Requires:	libmount-devel = %{version}-%{release}

%description -n libmount-static
Static version of mount library.

%description -n libmount-static -l pl.UTF-8
Statyczna wersja biblioteki mount.

%package -n libmount-apidocs
Summary:	libmount API documentation
Summary(pl.UTF-8):	Dokumentacja API libmount
Group:		Documentation
Requires:	gtk-doc-common
BuildArch:	noarch

%description -n libmount-apidocs
libmount API documentation.

%description -n libmount-apidocs -l pl.UTF-8
Dokumentacja API libmount.

%package -n python3-libmount
Summary:	Python 3.x libmount bindings
Summary(pl.UTF-8):	Wiązania Pythona 3.x do biblioteki libmount
License:	LGPL v3+
Group:		Libraries/Python
Requires:	libmount = %{version}-%{release}

%description -n python3-libmount
Python 3.x libmount bindings.

%description -n python3-libmount -l pl.UTF-8
Wiązania Pythona 3.x do biblioteki libmount.

%package -n fsck
Summary:	Check and repair a Linux file system
Summary(pl.UTF-8):	Sprawdzanie i naprawa linuksowego systemu plików
License:	GPL v2+
Group:		Applications/System
Requires:	libblkid = %{version}-%{release}

%description -n fsck
Check and repair a Linux file system.

%description -n fsck -l pl.UTF-8
Sprawdzanie i naprawa linuksowego systemu plików.

%package -n libsmartcols
Summary:	Library to handle tables and trees
Summary(pl.UTF-8):	Biblioteka do obsługi tabelek i drzewek
License:	LGPL v2+
Group:		Libraries

%description -n libsmartcols
Library to handle tables and trees.

%description -n libsmartcols -l pl.UTF-8
Biblioteka do obsługi tabelek i drzewek.

%package -n libsmartcols-devel
Summary:	Header files for smartcols library
Summary(pl.UTF-8):	Pliki nagłówkowe biblioteki smartcols
License:	LGPL v2+
Group:		Development/Libraries
Requires:	libsmartcols = %{version}-%{release}

%description -n libsmartcols-devel
Header files for smartcols library.

%description -n libsmartcols-devel -l pl.UTF-8
Pliki nagłówkowe biblioteki smartcols.

%package -n libsmartcols-static
Summary:	Static version of smartcols library
Summary(pl.UTF-8):	Statyczna wersja biblioteki smartcols
License:	LGPL v2+
Group:		Development/Libraries
Requires:	libsmartcols-devel = %{version}-%{release}

%description -n libsmartcols-static
Static version of smartcols library.

%description -n libsmartcols-static -l pl.UTF-8
Statyczna wersja biblioteki smartcols.

%package -n libsmartcols-apidocs
Summary:	libsmartcols API documentation
Summary(pl.UTF-8):	Dokumentacja API libsmartcols
Group:		Documentation
Requires:	gtk-doc-common
BuildArch:	noarch

%description -n libsmartcols-apidocs
libsmartcols API documentation.

%description -n libsmartcols-apidocs -l pl.UTF-8
Dokumentacja API libsmartcols.

%package initrd
Summary:	blkid - initrd version
Summary(pl.UTF-8):	blkid - wersja dla initrd
License:	GPL v2+
Group:		Base
Obsoletes:	util-linux-ng-initrd < 2.20-1
Conflicts:	geninitrd < 10000.10

%description initrd
This package includes a blkid utility to recognize partitions by label
or UUID - staticaly linked for initrd.

%description initrd -l pl.UTF-8
Pakiet ten zawiera narzędzie blkid do rozpoznawania partycji przez
etykietę lub UUID - statycznie skonsolidowane na potrzeby initrd.

%package -n bash-completion-util-linux
Summary:	bash completion for util-linux commands
Summary(pl.UTF-8):	Bashowe dopełnianie parametrów dla poleceń z pakietu util-linux
License:	GPL v2+
Group:		Applications/Shells
Requires:	%{name} = %{version}-%{release}
Requires:	bash-completion >= 2.0
Requires:	gawk
BuildArch:	noarch

%description -n bash-completion-util-linux
Bash completion for util-linux commands.

%description -n bash-completion-util-linux -l pl.UTF-8
Bashowe dopełnianie parametrów dla poleceń z pakietu util-linux.

%prep
%setup -q -a1
%patch0 -p1
%patch1 -p1
%patch2 -p1
%patch3 -p1
%patch4 -p1
%patch5 -p1
%patch7 -p1
%{?with_initrd:%patch6 -p1}

# obsolete programs, remove non-english man pages
%{__rm} man/*/man1/{arch,chkdupexe,ddate,reset}.1 \
	man/*/man5/nfs.5 \
	man/*/man8/{cytune,elvtune,setfdprm,sln,ramsize,raw,rdev,rootflags,vidmode}.8

# it's been moved from man1 to man8
for d in es ja ko ; do
	%{__mv} man/$d/man1/readprofile.1 \
		man/$d/man8/readprofile.8
	%{__sed} -i -e 's/READPROFILE 1/READPROFILE 8/' man/$d/man8/readprofile.8
done

%{__rm} po/stamp-po

%build
%{__gettextize}
%{__libtoolize}
%{__aclocal} -I m4
%{__autoconf}
%{__autoheader}
%{__automake}

export CPPFLAGS="%{rpmcppflags} -I/usr/include/ncurses -DHAVE_LSEEK64_PROTOTYPE -DHAVE_LLSEEK_PROTOTYPE"
%if %{with initrd}
%{?with_uClibc:xCC="%{_target_cpu}-uclibc-gcc"}
%{?with_dietlibc:xCC="%{__cc}"; xCC="diet ${xCC#*ccache }"}
%configure \
%if %{with dietlibc}
	ac_cv_header_crypt_h=no \
	ac_cv_header_stdio_ext_h=no \
%endif
	CC="$xCC" \
%if "%{?configure_cache}" == "1"
	--cache-file=%{?configure_cache_file}%{!?configure_cache_file:configure}-initrd.cache \
%endif
	--exec-prefix= \
	--bindir=/bin \
	--sbindir=/sbin \
	--libdir=/%{_lib} \
	--disable-shared \
	--enable-static \
	--enable-libmount-force-mountinfo \
	--disable-agetty \
	--disable-chfn-chsh \
	--disable-cramfs \
	--disable-kill \
	--disable-ldattach \
	--disable-libmount \
	--disable-login \
	--disable-losetup \
	--disable-makeinstall-chown \
	--disable-makeinstall-setuid \
	--disable-minix \
	--disable-newgrp \
	--disable-partx \
	--disable-raw \
	--disable-runuser \
	--disable-schedutils \
	--disable-setarch \
	--disable-silent-rules \
	--disable-su \
	--disable-sulogin \
	--disable-tunelp \
	--disable-use-tty-group \
	--disable-utmpdump \
	--disable-uuidd \
	--disable-vipw \
	--disable-wall \
	--without-audit \
	--without-ncurses \
	--without-selinux \
	--without-smack

# configure gets it unconditionally wrong
%{__sed} -i -e 's/#define HAVE_WIDECHAR 1//' config.h

%{__make} \
%if %{with uClibc}
	LDFLAGS="-Wl,-static"
%endif
%if %{with dietlibc}
	CPPFLAGS="$CPPFLAGS -D_BSD_SOURCE" \
	LDFLAGS="-lcompat"
%endif

%{__make} install \
	DESTDIR=$(pwd)/initrd

%{__make} clean
%endif

# raw is obsolete
# wall is packaged in SysVinit-tools
%configure \
	--bindir=/bin \
	--sbindir=/sbin \
	%{?with_apidocs:--docdir=%{_gtkdocdir}} \
	--enable-libmount-support-mtab \
	--disable-makeinstall-chown \
	--disable-makeinstall-setuid \
	--disable-raw \
	--disable-silent-rules \
	--disable-use-tty-group \
	--disable-wall \
	--enable-chfn-chsh \
	--enable-fdformat \
	%{?with_apidocs:--enable-gtk-doc} \
	--enable-kill \
	--enable-libblkid \
	--enable-line \
	--enable-login \
	--enable-login-chown-vcs \
	--enable-newgrp \
	--enable-partx \
	--enable-poman \
	--enable-pg \
	--enable-runuser%{!?with_su:=no} \
	--enable-su%{!?with_su:=no} \
	--enable-sulogin \
	--enable-tunelp \
	--enable-utmpdump \
	--enable-vipw \
	--enable-write \
	--with-python=3 \
	--with-audit \
	--with-bashcompletiondir=/usr/share/bash-completion/completions \
	--with-selinux%{!?with_selinux:=no} \
	--with-smack \
	--with-readline \
	%{!?with_systemd:--without-systemd}

%{__make}

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT/etc/{pam.d,rc.d/init.d,sysconfig,security,terminal-colors.d} \
	$RPM_BUILD_ROOT{/%{_lib},/var/{lock,lib/libuuid}} \
	$RPM_BUILD_ROOT{/lib/systemd/pld-helpers.d,%{systemdunitdir}}
%{?with_dietlibc:install -d $RPM_BUILD_ROOT%{dietlibdir}}

%{__make} install \
	DESTDIR=$RPM_BUILD_ROOT

%{__mv} $RPM_BUILD_ROOT%{_sbindir}/{addpart,delpart,partx} $RPM_BUILD_ROOT/sbin

cp -p %{SOURCE2} $RPM_BUILD_ROOT/etc/pam.d/login
install -p %{SOURCE3} $RPM_BUILD_ROOT/etc/rc.d/init.d/blockdev
cp -p %{SOURCE4} $RPM_BUILD_ROOT/etc/sysconfig/blockdev
cp -p %{SOURCE12} $RPM_BUILD_ROOT%{systemdunitdir}/blockdev.service
cp -p %{SOURCE13} $RPM_BUILD_ROOT/lib/systemd/pld-helpers.d/blockdev.sh
%if %{with su}
ln -s ../sbin/runuser $RPM_BUILD_ROOT/bin/runuser
cp -p %{SOURCE6} $RPM_BUILD_ROOT/etc/pam.d/su
cp -p %{SOURCE7} $RPM_BUILD_ROOT/etc/pam.d/su-l
cp -p %{SOURCE8} $RPM_BUILD_ROOT/etc/pam.d/runuser
cp -p %{SOURCE9} $RPM_BUILD_ROOT/etc/pam.d/runuser-l
%endif

:> $RPM_BUILD_ROOT/etc/security/blacklist.login
:> $RPM_BUILD_ROOT/var/lock/wtmpxlock
:> $RPM_BUILD_ROOT%{_sysconfdir}/blkid.tab

for lib in blkid fdisk mount smartcols uuid; do
	%{__mv} $RPM_BUILD_ROOT%{_libdir}/lib${lib}.so.* $RPM_BUILD_ROOT/%{_lib}
	ln -sf /%{_lib}/$(basename $RPM_BUILD_ROOT/%{_lib}/lib${lib}.so.*.*.*) \
		 $RPM_BUILD_ROOT%{_libdir}/lib${lib}.so
done

# python module
%{__rm} $RPM_BUILD_ROOT%{py3_sitedir}/libmount/pylibmount.la
# obsoleted by pkg-config (libuuid.la temporarily kept because of packages built with it)
%{__rm} $RPM_BUILD_ROOT%{_libdir}/lib{blkid,fdisk,mount,smartcols}.la

ln -s hwclock $RPM_BUILD_ROOT/sbin/clock
echo '.so man8/hwclock.8' > $RPM_BUILD_ROOT%{_mandir}/man8/clock.8
echo '.so man8/hwclock.8' > $RPM_BUILD_ROOT%{_mandir}/de/man8/clock.8
echo '.so man8/hwclock.8' > $RPM_BUILD_ROOT%{_mandir}/fr/man8/clock.8
echo '.so man8/hwclock.8' > $RPM_BUILD_ROOT%{_mandir}/sr/man8/clock.8

ln -s utmpdump $RPM_BUILD_ROOT%{_bindir}/utmpx-dump
ln -s mkswap $RPM_BUILD_ROOT/sbin/mkfs.swap

# install non-english man pages, but prefer upstream translations over Source1
for d in cs de es fi fr hu id it ja ko nl pl ; do
	for m in man1 man5 man8 ; do
		if [ -d man/$d/$m ]; then
			install -d $RPM_BUILD_ROOT%{_mandir}/$d/$m
			for f in man/$d/$m/* ; do
				if [ ! -f $RPM_BUILD_ROOT%{_mandir}/$d/$m/$(basename $f) ]; then
					cp -p "$f" $RPM_BUILD_ROOT%{_mandir}/$d/$m
				fi
			done
		fi
	done
done

# obsolete
%{__rm} $RPM_BUILD_ROOT%{_mandir}/*/man8/raw.8

# packaged in SysVinit-tools
%{__rm} $RPM_BUILD_ROOT%{_mandir}/*/man1/wall.1

# packaged in pwdutils / shadow
%{__rm} $RPM_BUILD_ROOT%{_bindir}/{chfn,chsh,newgrp} \
	$RPM_BUILD_ROOT%{_sbindir}/{vigr,vipw} \
	$RPM_BUILD_ROOT%{_mandir}/man1/{chfn,chsh,newgrp}.1 \
	$RPM_BUILD_ROOT%{_mandir}/man8/{vigr,vipw}.8 \
	$RPM_BUILD_ROOT%{_mandir}/*/man1/{chfn,chsh,newgrp}.1 \
	$RPM_BUILD_ROOT%{_mandir}/*/man8/{vigr,vipw}.8 \
	$RPM_BUILD_ROOT%{bash_compdir}/{chfn,chsh,newgrp}

%ifarch sparc sparcv9 sparc64
# programs not built on sparc
%{__rm} $RPM_BUILD_ROOT%{_mandir}/*/man8/{cfdisk,sfdisk}.8
%endif

%if %{with apidocs}
# examples
%{__rm} $RPM_BUILD_ROOT%{_gtkdocdir}/getopt-example.{bash,tcsh}
%else
%{__rm} $RPM_BUILD_ROOT%{_docdir}/%{name}/getopt-example.{bash,tcsh}
%endif

%if %{with initrd}
install -d $RPM_BUILD_ROOT%{_libdir}/initrd
install -p initrd/bin/* $RPM_BUILD_ROOT%{_libdir}/initrd
install -p initrd/sbin/* $RPM_BUILD_ROOT%{_libdir}/initrd
ln -s fsck $RPM_BUILD_ROOT%{_libdir}/initrd/e2fsck

# We don't need those
%{__rm} $RPM_BUILD_ROOT%{_libdir}/initrd/{cal,col,colcrt,colrm,column,ctrlaltdel,dmesg,flock,fsfreeze,fstrim,getopt,hexdump,ipcmk,ipcrm,ipcs,isosize,logger,lslocks,mcookie,mkfs*,readprofile,renice,rev,rtcwake,script,scriptreplay,setsid,tunelp,wdctl,whereis}
%{__rm} $RPM_BUILD_ROOT%{_libdir}/lib{blkid,mount}.la

%if %{with dietlibc}
cp -a initrd/%{_lib}/lib*.a $RPM_BUILD_ROOT%{dietlibdir}
%endif
%endif

%find_lang %{name}

%clean
rm -rf $RPM_BUILD_ROOT

%post -n blockdev
/sbin/chkconfig --add blockdev
%service blockdev restart
%systemd_post blockdev.service

%preun -n blockdev
if [ "$1" = "0" ]; then
	%service blockdev stop
	/sbin/chkconfig --del blockdev
fi
%systemd_preun blockdev.service

%postun -n blockdev
%systemd_reload

%triggerpostun -n blockdev -- blockdev < 2.24-4
%systemd_trigger blockdev.service

%post	-n libblkid -p /sbin/ldconfig
%postun -n libblkid -p /sbin/ldconfig

%post   -n libuuid -p /sbin/ldconfig
%postun -n libuuid -p /sbin/ldconfig

%pre    -n uuidd
if [ "$(getgid libuuid 2>/dev/null)" = "222" ]; then
	/usr/sbin/groupmod -n uuidd libuuid
fi
%groupadd -g 222 uuidd
if [ "$(id -u libuuid 2>/dev/null)" = "222" ]; then
	/usr/sbin/usermod -l uuidd libuuid
fi
%useradd -u 222 -r -d /var/lib/libuuid -s /bin/false -c "UUID generator helper daemon" -g uuidd uuidd

%postun -n uuidd
if [ "$1" = "0" ]; then
	%userremove uuidd
	%groupremove uuidd
fi

%post	-n libfdisk -p /sbin/ldconfig
%postun -n libfdisk -p /sbin/ldconfig

%post	-n libmount -p /sbin/ldconfig
%postun -n libmount -p /sbin/ldconfig

%post	-n libsmartcols -p /sbin/ldconfig
%postun -n libsmartcols -p /sbin/ldconfig

%files -f %{name}.lang
%defattr(644,root,root,755)
%doc AUTHORS ChangeLog NEWS README README.licensing Documentation misc-utils/getopt-example.{bash,tcsh}
%dir /etc/terminal-colors.d

%attr(755,root,root) /sbin/clock
%attr(755,root,root) /sbin/hwclock*
%{_mandir}/man5/adjtime_config.5*
%{_mandir}/man8/clock.8*
%{_mandir}/man8/hwclock.8*
%lang(de) %{_mandir}/de/man5/adjtime_config.5*
%lang(de) %{_mandir}/de/man8/clock.8*
%lang(de) %{_mandir}/de/man8/hwclock.8*
%lang(es) %{_mandir}/es/man8/clock.8*
%lang(es) %{_mandir}/es/man8/hwclock.8*
%lang(fr) %{_mandir}/fr/man8/clock.8*
%lang(fr) %{_mandir}/fr/man8/hwclock.8*
%lang(ja) %{_mandir}/ja/man8/clock.8*
%lang(ja) %{_mandir}/ja/man8/hwclock.8*
%lang(sr) %{_mandir}/sr/man5/adjtime_config.5*
%lang(sr) %{_mandir}/sr/man8/clock.8*
%lang(sr) %{_mandir}/sr/man8/hwclock.8*

%attr(755,root,root) /sbin/nologin
%{_mandir}/man8/nologin.8*
%lang(de) %{_mandir}/de/man8/nologin.8*
%lang(sr) %{_mandir}/sr/man8/nologin.8*

%ghost %{_sysconfdir}/blkid.tab
%attr(755,root,root) /sbin/blkid
%attr(755,root,root) /sbin/findfs
%{_mandir}/man8/blkid.8*
%{_mandir}/man8/findfs.8*
%lang(de) %{_mandir}/de/man8/blkid.8*
%lang(de) %{_mandir}/de/man8/findfs.8*
%lang(fr) %{_mandir}/fr/man8/blkid.8*
%lang(fr) %{_mandir}/fr/man8/findfs.8*
%lang(sr) %{_mandir}/sr/man8/blkid.8*
%lang(sr) %{_mandir}/sr/man8/findfs.8*

%attr(755,root,root) %{_bindir}/linux*
%attr(755,root,root) %{_bindir}/setarch
%{_mandir}/man8/linux*.8*
%{_mandir}/man8/setarch.8*
%lang(de) %{_mandir}/de/man8/setarch.8*
%lang(fr) %{_mandir}/fr/man8/setarch.8*
%lang(sr) %{_mandir}/sr/man8/setarch.8*
%ifarch s390 s390x
%attr(755,root,root) %{_bindir}/s390*
%{_mandir}/man8/s390*.8*
%endif
%ifarch %{ix86} %{x8664} x32 ia64
%attr(755,root,root) %{_bindir}/i386
%{_mandir}/man8/i386.8*
%endif
%ifarch %{x8664} x32
%attr(755,root,root) %{_bindir}/x86_64
%{_mandir}/man8/x86_64*.8*
%endif
%ifarch ia64
%attr(755,root,root) %{_bindir}/ia64
%{_mandir}/man8/ia64.8*
%endif
%ifarch ppc ppc64
%attr(755,root,root) %{_bindir}/ppc*
%{_mandir}/man8/ppc*.8*
%endif
%ifarch sparc sparc64
%attr(755,root,root) %{_bindir}/sparc*
%{_mandir}/man8/sparc*.8*
%endif

%attr(755,root,root) /bin/dmesg
%attr(755,root,root) /bin/kill
%attr(755,root,root) /bin/lsblk
%attr(755,root,root) /bin/lsfd
%attr(755,root,root) /bin/more
%attr(755,root,root) /bin/wdctl

%attr(755,root,root) /sbin/addpart
%attr(755,root,root) /sbin/blkdiscard
%attr(755,root,root) /sbin/blkzone
%attr(755,root,root) /sbin/chcpu
%attr(755,root,root) /sbin/ctrlaltdel
%attr(755,root,root) /sbin/delpart
%attr(755,root,root) /sbin/fsfreeze
%attr(755,root,root) /sbin/fstrim
%attr(755,root,root) /sbin/partx
%attr(755,root,root) /sbin/sulogin
%attr(755,root,root) /sbin/swaplabel
%attr(755,root,root) /sbin/switch_root
%attr(755,root,root) /sbin/wipefs
%attr(755,root,root) /sbin/zramctl
%attr(755,root,root) %{_bindir}/cal
%attr(755,root,root) %{_bindir}/choom
%attr(755,root,root) %{_bindir}/chmem
%attr(755,root,root) %{_bindir}/chrt
%attr(755,root,root) %{_bindir}/col
%attr(755,root,root) %{_bindir}/colcrt
%attr(755,root,root) %{_bindir}/colrm
%attr(755,root,root) %{_bindir}/column
%attr(755,root,root) %{_bindir}/eject
%attr(755,root,root) %{_bindir}/fallocate
%attr(755,root,root) %{_bindir}/fincore
%attr(755,root,root) %{_bindir}/flock
%attr(755,root,root) %{_bindir}/getopt
%attr(755,root,root) %{_bindir}/hardlink
%attr(755,root,root) %{_bindir}/hexdump
%attr(755,root,root) %{_bindir}/ionice
%attr(755,root,root) %{_bindir}/ipcmk
%attr(755,root,root) %{_bindir}/ipcrm
%attr(755,root,root) %{_bindir}/ipcs
%attr(755,root,root) %{_bindir}/irqtop
%attr(755,root,root) %{_bindir}/isosize
%attr(755,root,root) %{_bindir}/line
%attr(755,root,root) %{_bindir}/last
%attr(755,root,root) %{_bindir}/lastb
%attr(755,root,root) %{_bindir}/logger
%attr(755,root,root) %{_bindir}/look
%attr(755,root,root) %{_bindir}/lscpu
%attr(755,root,root) %{_bindir}/lsipc
%attr(755,root,root) %{_bindir}/lsirq
%attr(755,root,root) %{_bindir}/lslocks
%attr(755,root,root) %{_bindir}/lslogins
%attr(755,root,root) %{_bindir}/lsmem
%attr(755,root,root) %{_bindir}/lsns
%attr(755,root,root) %{_bindir}/mesg
%attr(755,root,root) %{_bindir}/mcookie
%attr(755,root,root) %{_bindir}/namei
%attr(755,root,root) %{_bindir}/nsenter
%attr(755,root,root) %{_bindir}/pg
%attr(755,root,root) %{_bindir}/prlimit
%attr(755,root,root) %{_bindir}/rename
%attr(755,root,root) %{_bindir}/renice
%attr(755,root,root) %{_bindir}/rev
%attr(755,root,root) %{_bindir}/script
%attr(755,root,root) %{_bindir}/scriptlive
%attr(755,root,root) %{_bindir}/scriptreplay
%attr(755,root,root) %{_bindir}/setpriv
%attr(755,root,root) %{_bindir}/setsid
%attr(755,root,root) %{_bindir}/setterm
%attr(755,root,root) %{_bindir}/taskset
%attr(755,root,root) %{_bindir}/uclampset
%attr(755,root,root) %{_bindir}/uuidparse
%attr(755,root,root) %{_bindir}/ul
%attr(755,root,root) %{_bindir}/uname26
%attr(755,root,root) %{_bindir}/unshare
%attr(755,root,root) %{_bindir}/utmpdump
%attr(755,root,root) %{_bindir}/utmpx-dump
%attr(755,root,root) %{_bindir}/whereis
%attr(2755,root,tty) %{_bindir}/write
%attr(755,root,root) %{_sbindir}/fdformat
%attr(755,root,root) %{_sbindir}/ldattach
%attr(755,root,root) %{_sbindir}/readprofile
%attr(755,root,root) %{_sbindir}/resizepart
%attr(755,root,root) %{_sbindir}/rfkill
%attr(755,root,root) %{_sbindir}/rtcwake

%if %{with systemd}
%{systemdunitdir}/fstrim.service
%{systemdunitdir}/fstrim.timer
%endif

%{_mandir}/man1/cal.1*
%{_mandir}/man1/choom.1*
%{_mandir}/man1/chrt.1*
%{_mandir}/man1/col.1*
%{_mandir}/man1/colcrt.1*
%{_mandir}/man1/colrm.1*
%{_mandir}/man1/column.1*
%{_mandir}/man1/dmesg.1*
%{_mandir}/man1/eject.1*
%{_mandir}/man1/fallocate.1*
%{_mandir}/man1/fincore.1*
%{_mandir}/man1/flock.1*
%{_mandir}/man1/getopt.1*
%{_mandir}/man1/hardlink.1*
%{_mandir}/man1/hexdump.1*
%{_mandir}/man1/ionice.1*
%{_mandir}/man1/ipcrm.1*
%{_mandir}/man1/ipcmk.1*
%{_mandir}/man1/ipcs.1*
%{_mandir}/man1/irqtop.1*
%{_mandir}/man1/kill.1*
%{_mandir}/man1/last.1*
%{_mandir}/man1/lastb.1*
%{_mandir}/man1/line.1*
%{_mandir}/man1/logger.1*
%{_mandir}/man1/look.1*
%{_mandir}/man1/lscpu.1*
%{_mandir}/man1/lsfd.1*
%{_mandir}/man1/lsipc.1*
%{_mandir}/man1/lsirq.1*
%{_mandir}/man1/lslogins.1*
%{_mandir}/man1/lsmem.1*
%{_mandir}/man1/mcookie.1*
%{_mandir}/man1/mesg.1*
%{_mandir}/man1/more.1*
%{_mandir}/man1/namei.1*
%{_mandir}/man1/nsenter.1*
%{_mandir}/man1/prlimit.1*
%{_mandir}/man1/pg.1*
%{_mandir}/man1/renice.1*
%{_mandir}/man1/rev.1*
%{_mandir}/man1/rename.1*
%{_mandir}/man1/setpriv.1*
%{_mandir}/man1/setsid.1*
%{_mandir}/man1/script.1*
%{_mandir}/man1/scriptlive.1*
%{_mandir}/man1/scriptreplay.1*
%{_mandir}/man1/setterm.1*
%{_mandir}/man1/taskset.1*
%{_mandir}/man1/uclampset.1*
%{_mandir}/man1/ul.1*
%{_mandir}/man1/unshare.1*
%{_mandir}/man1/utmpdump.1*
%{_mandir}/man1/uuidparse.1*
%{_mandir}/man1/whereis.1*
%{_mandir}/man1/write.1*
# common for many utilities (hexdump,cal,dmesg,fdisk,cfdisk - not libraries)
%{_mandir}/man5/terminal-colors.d.5*
%{_mandir}/man8/addpart.8*
%{_mandir}/man8/blkdiscard.8*
%{_mandir}/man8/blkzone.8*
%{_mandir}/man8/delpart.8*
%{_mandir}/man8/partx.8*
%{_mandir}/man8/lsblk.8*
%{_mandir}/man8/lsns.8*
%{_mandir}/man8/chcpu.8*
%{_mandir}/man8/chmem.8*
%{_mandir}/man8/ctrlaltdel.8*
%{_mandir}/man8/fdformat.8*
%{_mandir}/man8/fsfreeze.8*
%{_mandir}/man8/fstrim.8*
%{_mandir}/man8/isosize.8*
%{_mandir}/man8/ldattach.8*
%{_mandir}/man8/lslocks.8*
%{_mandir}/man8/readprofile.8*
%{_mandir}/man8/resizepart.8*
%{_mandir}/man8/rfkill.8*
%{_mandir}/man8/rtcwake.8*
%{_mandir}/man8/swaplabel.8*
%{_mandir}/man8/switch_root.8*
%{_mandir}/man8/sulogin.8*
%{_mandir}/man8/uname26.8*
%{_mandir}/man8/wdctl.8*
%{_mandir}/man8/wipefs.8*
%{_mandir}/man8/zramctl.8*
%lang(de) %{_mandir}/de/man1/cal.1*
%lang(de) %{_mandir}/de/man1/choom.1*
%lang(de) %{_mandir}/de/man1/chrt.1*
%lang(de) %{_mandir}/de/man1/col.1*
%lang(de) %{_mandir}/de/man1/colcrt.1*
%lang(de) %{_mandir}/de/man1/colrm.1*
%lang(de) %{_mandir}/de/man1/column.1*
%lang(de) %{_mandir}/de/man1/dmesg.1*
%lang(de) %{_mandir}/de/man1/eject.1*
%lang(de) %{_mandir}/de/man1/fallocate.1*
%lang(de) %{_mandir}/de/man1/fincore.1*
%lang(de) %{_mandir}/de/man1/flock.1*
%lang(de) %{_mandir}/de/man1/getopt.1*
%lang(de) %{_mandir}/de/man1/hardlink.1*
%lang(de) %{_mandir}/de/man1/hexdump.1*
%lang(de) %{_mandir}/de/man1/ionice.1*
%lang(de) %{_mandir}/de/man1/ipcmk.1*
%lang(de) %{_mandir}/de/man1/ipcrm.1*
%lang(de) %{_mandir}/de/man1/ipcs.1*
%lang(de) %{_mandir}/de/man1/irqtop.1*
%lang(de) %{_mandir}/de/man1/kill.1*
%lang(de) %{_mandir}/de/man1/last.1*
%lang(de) %{_mandir}/de/man1/lastb.1*
%lang(de) %{_mandir}/de/man1/line.1*
%lang(de) %{_mandir}/de/man1/logger.1*
%lang(de) %{_mandir}/de/man1/look.1*
%lang(de) %{_mandir}/de/man1/lscpu.1*
%lang(de) %{_mandir}/de/man1/lsfd.1*
%lang(de) %{_mandir}/de/man1/lsipc.1*
%lang(de) %{_mandir}/de/man1/lsirq.1*
%lang(de) %{_mandir}/de/man1/lslogins.1*
%lang(de) %{_mandir}/de/man1/lsmem.1*
%lang(de) %{_mandir}/de/man1/mcookie.1*
%lang(de) %{_mandir}/de/man1/mesg.1*
%lang(de) %{_mandir}/de/man1/more.1*
%lang(de) %{_mandir}/de/man1/namei.1*
%lang(de) %{_mandir}/de/man1/nsenter.1*
%lang(de) %{_mandir}/de/man1/pg.1*
%lang(de) %{_mandir}/de/man1/prlimit.1*
%lang(de) %{_mandir}/de/man1/rename.1*
%lang(de) %{_mandir}/de/man1/renice.1*
%lang(de) %{_mandir}/de/man1/rev.1*
%lang(de) %{_mandir}/de/man1/script.1*
%lang(de) %{_mandir}/de/man1/scriptlive.1*
%lang(de) %{_mandir}/de/man1/scriptreplay.1*
%lang(de) %{_mandir}/de/man1/setpriv.1*
%lang(de) %{_mandir}/de/man1/setsid.1*
%lang(de) %{_mandir}/de/man1/setterm.1*
%lang(de) %{_mandir}/de/man1/taskset.1*
%lang(de) %{_mandir}/de/man1/uclampset.1*
%lang(de) %{_mandir}/de/man1/ul.1*
%lang(de) %{_mandir}/de/man1/unshare.1*
%lang(de) %{_mandir}/de/man1/utmpdump.1*
%lang(de) %{_mandir}/de/man1/uuidparse.1*
%lang(de) %{_mandir}/de/man1/whereis.1*
%lang(de) %{_mandir}/de/man1/write.1*
%lang(de) %{_mandir}/de/man5/terminal-colors.d.5*
%lang(de) %{_mandir}/de/man8/addpart.8*
%lang(de) %{_mandir}/de/man8/blkdiscard.8*
%lang(de) %{_mandir}/de/man8/blkzone.8*
%lang(de) %{_mandir}/de/man8/chcpu.8*
%lang(de) %{_mandir}/de/man8/chmem.8*
%lang(de) %{_mandir}/de/man8/ctrlaltdel.8*
%lang(de) %{_mandir}/de/man8/delpart.8*
%lang(de) %{_mandir}/de/man8/fdformat.8*
%lang(de) %{_mandir}/de/man8/fsfreeze.8*
%lang(de) %{_mandir}/de/man8/fstrim.8*
%lang(de) %{_mandir}/de/man8/isosize.8*
%lang(de) %{_mandir}/de/man8/ldattach.8*
%lang(de) %{_mandir}/de/man8/lsblk.8*
%lang(de) %{_mandir}/de/man8/lslocks.8*
%lang(de) %{_mandir}/de/man8/lsns.8*
%lang(de) %{_mandir}/de/man8/partx.8*
%lang(de) %{_mandir}/de/man8/readprofile.8*
%lang(de) %{_mandir}/de/man8/resizepart.8*
%lang(de) %{_mandir}/de/man8/rfkill.8*
%lang(de) %{_mandir}/de/man8/rtcwake.8*
%lang(de) %{_mandir}/de/man8/sulogin.8*
%lang(de) %{_mandir}/de/man8/swaplabel.8*
%lang(de) %{_mandir}/de/man8/switch_root.8*
%lang(de) %{_mandir}/de/man8/wdctl.8*
%lang(de) %{_mandir}/de/man8/wipefs.8*
%lang(de) %{_mandir}/de/man8/zramctl.8*
%lang(es) %{_mandir}/es/man1/colrm.1*
%lang(es) %{_mandir}/es/man1/column.1*
%lang(es) %{_mandir}/es/man1/getopt.1*
%lang(es) %{_mandir}/es/man1/last.1*
%lang(es) %{_mandir}/es/man1/lastb.1*
%lang(es) %{_mandir}/es/man1/line.1*
%lang(es) %{_mandir}/es/man1/look.1*
%lang(es) %{_mandir}/es/man1/more.1*
%lang(es) %{_mandir}/es/man1/namei.1*
%lang(es) %{_mandir}/es/man1/renice.1*
%lang(es) %{_mandir}/es/man1/rev.1*
%lang(es) %{_mandir}/es/man1/script.1*
%lang(es) %{_mandir}/es/man1/setsid.1*
%lang(es) %{_mandir}/es/man1/setterm.1*
%lang(es) %{_mandir}/es/man1/ul.1*
%lang(es) %{_mandir}/es/man1/whereis.1*
%lang(es) %{_mandir}/es/man1/write.1*
%lang(es) %{_mandir}/es/man8/addpart.8*
%lang(es) %{_mandir}/es/man8/ctrlaltdel.8*
%lang(es) %{_mandir}/es/man8/delpart.8*
%lang(es) %{_mandir}/es/man8/fdformat.8*
%lang(es) %{_mandir}/es/man8/ipcrm.8*
%lang(es) %{_mandir}/es/man8/ipcs.8*
%lang(es) %{_mandir}/es/man8/readprofile.8*
%lang(es) %{_mandir}/es/man8/renice.8*
%lang(es) %{_mandir}/es/man8/resizepart.8*
%lang(es) %{_mandir}/es/man8/setsid.8*
%lang(fi) %{_mandir}/fi/man1/cal.1*
%lang(fi) %{_mandir}/fi/man1/column.1*
%lang(fi) %{_mandir}/fi/man1/kill.1*
%lang(fi) %{_mandir}/fi/man1/more.1*
%lang(fi) %{_mandir}/fi/man1/whereis.1*
%lang(fi) %{_mandir}/fi/man1/write.1*
%lang(fr) %{_mandir}/fr/man1/cal.1*
%lang(fr) %{_mandir}/fr/man1/chrt.1*
%lang(fr) %{_mandir}/fr/man1/col.1*
%lang(fr) %{_mandir}/fr/man1/dmesg.1*
%lang(fr) %{_mandir}/fr/man1/fallocate.1*
%lang(fr) %{_mandir}/fr/man1/flock.1*
%lang(fr) %{_mandir}/fr/man1/getopt.1*
%lang(fr) %{_mandir}/fr/man1/ionice.1*
%lang(fr) %{_mandir}/fr/man1/ipcmk.1*
%lang(fr) %{_mandir}/fr/man1/ipcrm.1*
%lang(fr) %{_mandir}/fr/man1/ipcs.1*
%lang(fr) %{_mandir}/fr/man1/kill.1*
%lang(fr) %{_mandir}/fr/man1/last.1*
%lang(fr) %{_mandir}/fr/man1/lastb.1*
%lang(fr) %{_mandir}/fr/man1/line.1*
%lang(fr) %{_mandir}/fr/man1/logger.1*
%lang(fr) %{_mandir}/fr/man1/lscpu.1*
%lang(fr) %{_mandir}/fr/man1/mcookie.1*
%lang(fr) %{_mandir}/fr/man1/mesg.1*
%lang(fr) %{_mandir}/fr/man1/more.1*
%lang(fr) %{_mandir}/fr/man1/namei.1*
%lang(fr) %{_mandir}/fr/man1/nsenter.1*
%lang(fr) %{_mandir}/fr/man1/prlimit.1*
%lang(fr) %{_mandir}/fr/man1/rename.1*
%lang(fr) %{_mandir}/fr/man1/renice.1*
%lang(fr) %{_mandir}/fr/man1/rev.1*
%lang(fr) %{_mandir}/fr/man1/script.1*
%lang(fr) %{_mandir}/fr/man1/scriptreplay.1*
%lang(fr) %{_mandir}/fr/man1/setsid.1*
%lang(fr) %{_mandir}/fr/man1/setterm.1*
%lang(fr) %{_mandir}/fr/man1/taskset.1*
%lang(fr) %{_mandir}/fr/man1/unshare.1*
%lang(fr) %{_mandir}/fr/man1/utmpdump.1*
%lang(fr) %{_mandir}/fr/man1/whereis.1*
%lang(fr) %{_mandir}/fr/man1/write.1*
%lang(fr) %{_mandir}/fr/man5/terminal-colors.d.5*
%lang(fr) %{_mandir}/fr/man8/addpart.8*
%lang(fr) %{_mandir}/fr/man8/blkdiscard.8*
%lang(fr) %{_mandir}/fr/man8/chcpu.8*
%lang(fr) %{_mandir}/fr/man8/ctrlaltdel.8*
%lang(fr) %{_mandir}/fr/man8/delpart.8*
%lang(fr) %{_mandir}/fr/man8/dmesg.8*
%lang(fr) %{_mandir}/fr/man8/fdformat.8*
%lang(fr) %{_mandir}/fr/man8/fsfreeze.8*
%lang(fr) %{_mandir}/fr/man8/fstrim.8*
%lang(fr) %{_mandir}/fr/man8/ipcrm.8*
%lang(fr) %{_mandir}/fr/man8/ipcs.8*
%lang(fr) %{_mandir}/fr/man8/isosize.8*
%lang(fr) %{_mandir}/fr/man8/ldattach.8*
%lang(fr) %{_mandir}/fr/man8/lsblk.8*
%lang(fr) %{_mandir}/fr/man8/lslocks.8*
%lang(fr) %{_mandir}/fr/man8/partx.8*
%lang(fr) %{_mandir}/fr/man8/readprofile.8*
%lang(fr) %{_mandir}/fr/man8/resizepart.8*
%lang(fr) %{_mandir}/fr/man8/rtcwake.8*
%lang(fr) %{_mandir}/fr/man8/setsid.8*
%lang(fr) %{_mandir}/fr/man8/sulogin.8*
%lang(fr) %{_mandir}/fr/man8/swaplabel.8*
%lang(fr) %{_mandir}/fr/man8/switch_root.8*
%lang(fr) %{_mandir}/fr/man8/wdctl.8*
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
%lang(id) %{_mandir}/id/man1/cal.1*
%lang(id) %{_mandir}/id/man1/kill.1*
%lang(id) %{_mandir}/id/man1/logger.1*
%lang(id) %{_mandir}/id/man1/more.1*
%lang(id) %{_mandir}/id/man1/script.1*
%lang(id) %{_mandir}/id/man1/write.1*
%lang(id) %{_mandir}/id/man8/fdformat.8*
%lang(it) %{_mandir}/it/man1/kill.1*
%lang(it) %{_mandir}/it/man8/setsid.8*
%lang(ja) %{_mandir}/ja/man1/cal.1*
%lang(ja) %{_mandir}/ja/man1/col.1*
%lang(ja) %{_mandir}/ja/man1/colcrt.1*
%lang(ja) %{_mandir}/ja/man1/colrm.1*
%lang(ja) %{_mandir}/ja/man1/column.1*
%lang(ja) %{_mandir}/ja/man1/getopt.1*
%lang(ja) %{_mandir}/ja/man1/hexdump.1*
%lang(ja) %{_mandir}/ja/man1/kill.1*
%lang(ja) %{_mandir}/ja/man1/line.1*
%lang(ja) %{_mandir}/ja/man1/logger.1*
%lang(ja) %{_mandir}/ja/man1/look.1*
%lang(ja) %{_mandir}/ja/man1/mcookie.1*
%lang(ja) %{_mandir}/ja/man1/more.1*
%lang(ja) %{_mandir}/ja/man1/namei.1*
%lang(ja) %{_mandir}/ja/man1/rename.1*
%lang(ja) %{_mandir}/ja/man1/rev.1*
%lang(ja) %{_mandir}/ja/man1/script.1*
%lang(ja) %{_mandir}/ja/man1/setterm.1*
%lang(ja) %{_mandir}/ja/man1/ul.1*
%lang(ja) %{_mandir}/ja/man1/whereis.1*
%lang(ja) %{_mandir}/ja/man1/write.1*
%lang(ja) %{_mandir}/ja/man8/ctrlaltdel.8*
%lang(ja) %{_mandir}/ja/man8/dmesg.8*
%lang(ja) %{_mandir}/ja/man8/fdformat.8*
%lang(ja) %{_mandir}/ja/man8/ipcrm.8*
%lang(ja) %{_mandir}/ja/man8/ipcs.8*
%lang(ja) %{_mandir}/ja/man8/isosize.8*
%lang(ja) %{_mandir}/ja/man8/readprofile.8*
%lang(ja) %{_mandir}/ja/man8/renice.8*
%lang(ja) %{_mandir}/ja/man8/setsid.8*
%lang(ko) %{_mandir}/ko/man1/cal.1*
%lang(ko) %{_mandir}/ko/man1/col.1*
%lang(ko) %{_mandir}/ko/man1/colcrt.1*
%lang(ko) %{_mandir}/ko/man1/colrm.1*
%lang(ko) %{_mandir}/ko/man1/column.1*
%lang(ko) %{_mandir}/ko/man1/getopt.1*
%lang(ko) %{_mandir}/ko/man1/hexdump.1*
%lang(ko) %{_mandir}/ko/man1/kill.1*
%lang(ko) %{_mandir}/ko/man1/logger.1*
%lang(ko) %{_mandir}/ko/man1/look.1*
%lang(ko) %{_mandir}/ko/man1/mcookie.1*
%lang(ko) %{_mandir}/ko/man1/more.1*
%lang(ko) %{_mandir}/ko/man1/namei.1*
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
%lang(ko) %{_mandir}/ko/man8/readprofile.8*
%lang(ko) %{_mandir}/ko/man8/renice.8*
%lang(ko) %{_mandir}/ko/man8/setsid.8*
%lang(nl) %{_mandir}/nl/man1/kill.1*
%lang(pl) %{_mandir}/pl/man1/cal.1*
%lang(pl) %{_mandir}/pl/man1/col.1*
%lang(pl) %{_mandir}/pl/man1/colcrt.1*
%lang(pl) %{_mandir}/pl/man1/colrm.1*
%lang(pl) %{_mandir}/pl/man1/getopt.1*
%lang(pl) %{_mandir}/pl/man1/hexdump.1*
%lang(pl) %{_mandir}/pl/man1/kill.1*
%lang(pl) %{_mandir}/pl/man1/logger.1*
%lang(pl) %{_mandir}/pl/man1/look.1*
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
%lang(pl) %{_mandir}/pl/man8/renice.8*
%lang(pt_BR) %{_mandir}/pt_BR/man8/addpart.8*
%lang(pt_BR) %{_mandir}/pt_BR/man8/delpart.8*
%lang(pt_BR) %{_mandir}/pt_BR/man8/fdformat.8*
%lang(pt_BR) %{_mandir}/pt_BR/man8/isosize.8*
%lang(pt_BR) %{_mandir}/pt_BR/man8/partx.8*
%lang(pt_BR) %{_mandir}/pt_BR/man8/resizepart.8*
%lang(pt_BR) %{_mandir}/pt_BR/man8/swaplabel.8*
%lang(sr) %{_mandir}/sr/man1/cal.1*
%lang(sr) %{_mandir}/sr/man1/choom.1*
%lang(sr) %{_mandir}/sr/man1/chrt.1*
%lang(sr) %{_mandir}/sr/man1/col.1*
%lang(sr) %{_mandir}/sr/man1/colcrt.1*
%lang(sr) %{_mandir}/sr/man1/colrm.1*
%lang(sr) %{_mandir}/sr/man1/column.1*
%lang(sr) %{_mandir}/sr/man1/dmesg.1*
%lang(sr) %{_mandir}/sr/man1/eject.1*
%lang(sr) %{_mandir}/sr/man1/fallocate.1*
%lang(sr) %{_mandir}/sr/man1/fincore.1*
%lang(sr) %{_mandir}/sr/man1/flock.1*
%lang(sr) %{_mandir}/sr/man1/getopt.1*
%lang(sr) %{_mandir}/sr/man1/hexdump.1*
%lang(sr) %{_mandir}/sr/man1/ionice.1*
%lang(sr) %{_mandir}/sr/man1/ipcmk.1*
%lang(sr) %{_mandir}/sr/man1/ipcrm.1*
%lang(sr) %{_mandir}/sr/man1/ipcs.1*
%lang(sr) %{_mandir}/sr/man1/irqtop.1*
%lang(sr) %{_mandir}/sr/man1/kill.1*
%lang(sr) %{_mandir}/sr/man1/last.1*
%lang(sr) %{_mandir}/sr/man1/lastb.1*
%lang(sr) %{_mandir}/sr/man1/line.1*
%lang(sr) %{_mandir}/sr/man1/logger.1*
%lang(sr) %{_mandir}/sr/man1/look.1*
%lang(sr) %{_mandir}/sr/man1/lscpu.1*
%lang(sr) %{_mandir}/sr/man1/lsipc.1*
%lang(sr) %{_mandir}/sr/man1/lsirq.1*
%lang(sr) %{_mandir}/sr/man1/lslogins.1*
%lang(sr) %{_mandir}/sr/man1/lsmem.1*
%lang(sr) %{_mandir}/sr/man1/mcookie.1*
%lang(sr) %{_mandir}/sr/man1/mesg.1*
%lang(sr) %{_mandir}/sr/man1/more.1*
%lang(sr) %{_mandir}/sr/man1/namei.1*
%lang(sr) %{_mandir}/sr/man1/nsenter.1*
%lang(sr) %{_mandir}/sr/man1/pg.1*
%lang(sr) %{_mandir}/sr/man1/prlimit.1*
%lang(sr) %{_mandir}/sr/man1/rename.1*
%lang(sr) %{_mandir}/sr/man1/renice.1*
%lang(sr) %{_mandir}/sr/man1/rev.1*
%lang(sr) %{_mandir}/sr/man1/script.1*
%lang(sr) %{_mandir}/sr/man1/scriptlive.1*
%lang(sr) %{_mandir}/sr/man1/scriptreplay.1*
%lang(sr) %{_mandir}/sr/man1/setpriv.1*
%lang(sr) %{_mandir}/sr/man1/setsid.1*
%lang(sr) %{_mandir}/sr/man1/setterm.1*
%lang(sr) %{_mandir}/sr/man1/taskset.1*
%lang(sr) %{_mandir}/sr/man1/uclampset.1*
%lang(sr) %{_mandir}/sr/man1/ul.1*
%lang(sr) %{_mandir}/sr/man1/unshare.1*
%lang(sr) %{_mandir}/sr/man1/utmpdump.1*
%lang(sr) %{_mandir}/sr/man1/uuidparse.1*
%lang(sr) %{_mandir}/sr/man1/whereis.1*
%lang(sr) %{_mandir}/sr/man1/write.1*
%lang(sr) %{_mandir}/sr/man5/terminal-colors.d.5*
%lang(sr) %{_mandir}/sr/man8/addpart.8*
%lang(sr) %{_mandir}/sr/man8/blkdiscard.8*
%lang(sr) %{_mandir}/sr/man8/blkzone.8*
%lang(sr) %{_mandir}/sr/man8/chcpu.8*
%lang(sr) %{_mandir}/sr/man8/chmem.8*
%lang(sr) %{_mandir}/sr/man8/ctrlaltdel.8*
%lang(sr) %{_mandir}/sr/man8/delpart.8*
%lang(sr) %{_mandir}/sr/man8/fdformat.8*
%lang(sr) %{_mandir}/sr/man8/fsfreeze.8*
%lang(sr) %{_mandir}/sr/man8/fstrim.8*
%lang(sr) %{_mandir}/sr/man8/isosize.8*
%lang(sr) %{_mandir}/sr/man8/ldattach.8*
%lang(sr) %{_mandir}/sr/man8/lsblk.8*
%lang(sr) %{_mandir}/sr/man8/lslocks.8*
%lang(sr) %{_mandir}/sr/man8/lsns.8*
%lang(sr) %{_mandir}/sr/man8/partx.8*
%lang(sr) %{_mandir}/sr/man8/readprofile.8*
%lang(sr) %{_mandir}/sr/man8/resizepart.8*
%lang(sr) %{_mandir}/sr/man8/rfkill.8*
%lang(sr) %{_mandir}/sr/man8/rtcwake.8*
%lang(sr) %{_mandir}/sr/man8/sulogin.8*
%lang(sr) %{_mandir}/sr/man8/swaplabel.8*
%lang(sr) %{_mandir}/sr/man8/switch_root.8*
%lang(sr) %{_mandir}/sr/man8/wdctl.8*
%lang(sr) %{_mandir}/sr/man8/wipefs.8*
%lang(sr) %{_mandir}/sr/man8/zramctl.8*
%lang(uk) %{_mandir}/uk/man1/line.1*
%lang(uk) %{_mandir}/uk/man1/rev.1*
%lang(uk) %{_mandir}/uk/man8/addpart.8*
%lang(uk) %{_mandir}/uk/man8/delpart.8*
%lang(uk) %{_mandir}/uk/man8/fdformat.8*
%lang(uk) %{_mandir}/uk/man8/isosize.8*
%lang(uk) %{_mandir}/uk/man8/resizepart.8*

%attr(755,root,root) /sbin/fdisk
%{_mandir}/man8/fdisk.8*
%lang(de) %{_mandir}/de/man8/fdisk.8*
%lang(es) %{_mandir}/es/man8/fdisk.8*
%lang(fr) %{_mandir}/fr/man8/fdisk.8*
%lang(it) %{_mandir}/it/man8/fdisk.8*
%lang(ja) %{_mandir}/ja/man8/fdisk.8*
%lang(ko) %{_mandir}/ko/man8/fdisk.8*
%lang(pl) %{_mandir}/pl/man8/fdisk.8*
%lang(pt_BR) %{_mandir}/pt_BR/man8/fdisk.8*
%lang(sr) %{_mandir}/sr/man8/fdisk.8*

%ifnarch sparc sparc64
%attr(755,root,root) /sbin/cfdisk
%attr(755,root,root) /sbin/sfdisk
%{_mandir}/man8/cfdisk.8*
%{_mandir}/man8/sfdisk.8*
%lang(de) %{_mandir}/de/man8/cfdisk.8*
%lang(de) %{_mandir}/de/man8/sfdisk.8*
%lang(fr) %{_mandir}/fr/man8/cfdisk.8*
%lang(fr) %{_mandir}/fr/man8/sfdisk.8*
%lang(it) %{_mandir}/it/man8/cfdisk.8*
%lang(ja) %{_mandir}/ja/man8/cfdisk.8*
%lang(ja) %{_mandir}/ja/man8/sfdisk.8*
%lang(pt_BR) %{_mandir}/pt_BR/man8/cfdisk.8*
%lang(pt_BR) %{_mandir}/pt_BR/man8/sfdisk.8*
%lang(sr) %{_mandir}/sr/man8/cfdisk.8*
%lang(sr) %{_mandir}/sr/man8/sfdisk.8*
%lang(uk) %{_mandir}/uk/man8/cfdisk.8*
%endif

%attr(755,root,root) /sbin/mkfs
%attr(755,root,root) /sbin/mkfs.swap
%attr(755,root,root) /sbin/mkswap
%{_mandir}/man8/mkfs.8*
%{_mandir}/man8/mkswap.8*
%lang(de) %{_mandir}/de/man8/mkfs.8*
%lang(de) %{_mandir}/de/man8/mkswap.8*
%lang(es) %{_mandir}/es/man8/mkfs.8*
%lang(es) %{_mandir}/es/man8/mkswap.8*
%lang(fr) %{_mandir}/fr/man8/mkfs.8*
%lang(fr) %{_mandir}/fr/man8/mkswap.8*
%lang(hu) %{_mandir}/hu/man8/mkfs.8*
%lang(hu) %{_mandir}/hu/man8/mkswap.8*
%lang(it) %{_mandir}/it/man8/mkswap.8*
%lang(ja) %{_mandir}/ja/man8/mkfs.8*
%lang(ja) %{_mandir}/ja/man8/mkswap.8*
%lang(ko) %{_mandir}/ko/man8/mkfs.8*
%lang(ko) %{_mandir}/ko/man8/mkswap.8*
%lang(pl) %{_mandir}/pl/man8/mkfs.8*
%lang(pl) %{_mandir}/pl/man8/mkswap.8*
%lang(pt_BR) %{_mandir}/pt_BR/man8/mkfs.8*
%lang(pt_BR) %{_mandir}/pt_BR/man8/mkfs.minix.8*
%lang(sr) %{_mandir}/sr/man8/mkfs.8*
%lang(sr) %{_mandir}/sr/man8/mkswap.8*

%attr(755,root,root) /sbin/mkfs.bfs
%{_mandir}/man8/mkfs.bfs.8*
%lang(de) %{_mandir}/de/man8/mkfs.bfs.8*
%lang(fr) %{_mandir}/fr/man8/mkfs.bfs.8*
%lang(ja) %{_mandir}/ja/man8/mkfs.bfs.8*
%lang(pt_BR) %{_mandir}/pt_BR/man8/mkfs.bfs.8*
%lang(sr) %{_mandir}/sr/man8/mkfs.bfs.8*

%attr(755,root,root) /sbin/fsck.cramfs
%attr(755,root,root) /sbin/mkfs.cramfs
%{_mandir}/man8/fsck.cramfs.8*
%{_mandir}/man8/mkfs.cramfs.8*
%lang(de) %{_mandir}/de/man8/fsck.cramfs.8*
%lang(de) %{_mandir}/de/man8/mkfs.cramfs.8*
%lang(fr) %{_mandir}/fr/man8/fsck.cramfs.8*
%lang(fr) %{_mandir}/fr/man8/mkfs.cramfs.8*
%lang(pt_BR) %{_mandir}/pt_BR/man8/fsck.cramfs.8*
%lang(pt_BR) %{_mandir}/pt_BR/man8/mkfs.cramfs.8*
%lang(sr) %{_mandir}/sr/man8/fsck.cramfs.8*
%lang(sr) %{_mandir}/sr/man8/mkfs.cramfs.8*
%lang(uk) %{_mandir}/uk/man8/fsck.cramfs.8*

%attr(755,root,root) /sbin/fsck.minix
%attr(755,root,root) /sbin/mkfs.minix
%{_mandir}/man8/fsck.minix.8*
%{_mandir}/man8/mkfs.minix.8*
%lang(de) %{_mandir}/de/man8/fsck.minix.8*
%lang(de) %{_mandir}/de/man8/mkfs.minix.8*
%lang(es) %{_mandir}/es/man8/fsck.minix.8*
%lang(es) %{_mandir}/es/man8/mkfs.minix.8*
%lang(fr) %{_mandir}/fr/man8/fsck.minix.8*
%lang(fr) %{_mandir}/fr/man8/mkfs.minix.8*
%lang(ja) %{_mandir}/ja/man8/fsck.minix.8*
%lang(ja) %{_mandir}/ja/man8/mkfs.minix.8*
%lang(ko) %{_mandir}/ko/man8/fsck.minix.8*
%lang(ko) %{_mandir}/ko/man8/mkfs.minix.8*
%lang(pl) %{_mandir}/pl/man8/fsck.minix.8*
%lang(pl) %{_mandir}/pl/man8/mkfs.minix.8*
%lang(pt_BR) %{_mandir}/pt_BR/man8/fsck.minix.8*
%lang(sr) %{_mandir}/sr/man8/fsck.minix.8*
%lang(sr) %{_mandir}/sr/man8/mkfs.minix.8*

%if %{with su}
%attr(755,root,root) /bin/runuser
%attr(755,root,root) /sbin/runuser
%attr(4755,root,root) /bin/su
%attr(640,root,root) %config(noreplace) %verify(not md5 mtime size) /etc/pam.d/runuser
%attr(640,root,root) %config(noreplace) %verify(not md5 mtime size) /etc/pam.d/runuser-l
%attr(640,root,root) %config(noreplace) %verify(not md5 mtime size) /etc/pam.d/su
%attr(640,root,root) %config(noreplace) %verify(not md5 mtime size) /etc/pam.d/su-l
%{_mandir}/man1/runuser.1*
%{_mandir}/man1/su.1*
%lang(de) %{_mandir}/de/man1/runuser.1*
%lang(de) %{_mandir}/de/man1/su.1*
%lang(fr) %{_mandir}/fr/man1/runuser.1*
%lang(sr) %{_mandir}/sr/man1/runuser.1*
%lang(sr) %{_mandir}/sr/man1/su.1*
%endif

%ghost /var/lock/wtmpxlock

%files -n blockdev
%defattr(644,root,root,755)
%attr(754,root,root) /etc/rc.d/init.d/blockdev
%attr(640,root,root) %config(noreplace) %verify(not md5 mtime size) /etc/sysconfig/blockdev
%attr(755,root,root) /sbin/blockdev
%{_mandir}/man8/blockdev.8*
%lang(de) %{_mandir}/de/man8/blockdev.8*
%lang(fr) %{_mandir}/fr/man8/blockdev.8*
%lang(ja) %{_mandir}/ja/man8/blockdev.8*
%lang(pt_BR) %{_mandir}/pt_BR/man8/blockdev.8*
%lang(sr) %{_mandir}/sr/man8/blockdev.8*
%lang(uk) %{_mandir}/uk/man8/blockdev.8*
%{systemdunitdir}/blockdev.service
%attr(755,root,root) /lib/systemd/pld-helpers.d/blockdev.sh

%files -n mount
%defattr(644,root,root,755)
%attr(755,root,root) /bin/findmnt
%attr(755,root,root) /bin/mountpoint
%attr(4755,root,root) /bin/mount
%attr(4755,root,root) /bin/umount
%attr(755,root,root) /sbin/pivot_root
%attr(755,root,root) /sbin/swapon
%attr(755,root,root) /sbin/swapoff

%{_mandir}/man1/mountpoint.1*
%{_mandir}/man5/fstab.5*
%{_mandir}/man8/findmnt.8*
%{_mandir}/man8/mount.8*
%{_mandir}/man8/umount.8*
%{_mandir}/man8/pivot_root.8*
%{_mandir}/man8/swapon.8*
%{_mandir}/man8/swapoff.8*
%lang(cs) %{_mandir}/cs/man5/fstab.5*
%lang(de) %{_mandir}/de/man1/mountpoint.1*
%lang(de) %{_mandir}/de/man5/fstab.5*
%lang(de) %{_mandir}/de/man8/findmnt.8*
%lang(de) %{_mandir}/de/man8/mount.8*
%lang(de) %{_mandir}/de/man8/umount.8*
%lang(de) %{_mandir}/de/man8/pivot_root.8*
%lang(de) %{_mandir}/de/man8/swapon.8*
%lang(de) %{_mandir}/de/man8/swapoff.8*
%lang(es) %{_mandir}/es/man5/fstab.5*
%lang(es) %{_mandir}/es/man8/mount.8*
%lang(es) %{_mandir}/es/man8/umount.8*
%lang(es) %{_mandir}/es/man8/swapon.8*
%lang(es) %{_mandir}/es/man8/swapoff.8*
%lang(fr) %{_mandir}/fr/man1/mountpoint.1*
%lang(fr) %{_mandir}/fr/man5/fstab.5*
%lang(fr) %{_mandir}/fr/man8/findmnt.8*
%lang(fr) %{_mandir}/fr/man8/mount.8*
%lang(fr) %{_mandir}/fr/man8/umount.8*
%lang(fr) %{_mandir}/fr/man8/pivot_root.8*
%lang(fr) %{_mandir}/fr/man8/swapon.8*
%lang(fr) %{_mandir}/fr/man8/swapoff.8*
%lang(hu) %{_mandir}/hu/man5/fstab.5*
%lang(hu) %{_mandir}/hu/man8/mount.8*
%lang(hu) %{_mandir}/hu/man8/umount.8*
%lang(it) %{_mandir}/it/man5/fstab.5*
%lang(it) %{_mandir}/it/man8/mount.8*
%lang(it) %{_mandir}/it/man8/umount.8*
%lang(it) %{_mandir}/it/man8/swapon.8*
%lang(it) %{_mandir}/it/man8/swapoff.8*
%lang(ja) %{_mandir}/ja/man5/fstab.5*
%lang(ja) %{_mandir}/ja/man8/mount.8*
%lang(ja) %{_mandir}/ja/man8/umount.8*
%lang(ja) %{_mandir}/ja/man8/pivot_root.8*
%lang(ja) %{_mandir}/ja/man8/swapon.8*
%lang(ja) %{_mandir}/ja/man8/swapoff.8*
%lang(ko) %{_mandir}/ko/man5/fstab.5*
%lang(ko) %{_mandir}/ko/man8/mount.8*
%lang(ko) %{_mandir}/ko/man8/umount.8*
%lang(ko) %{_mandir}/ko/man8/swapon.8*
%lang(ko) %{_mandir}/ko/man8/swapoff.8*
%lang(pl) %{_mandir}/pl/man5/fstab.5*
%lang(pl) %{_mandir}/pl/man8/mount.8*
%lang(pl) %{_mandir}/pl/man8/umount.8*
%lang(pl) %{_mandir}/pl/man8/swapon.8*
%lang(pl) %{_mandir}/pl/man8/swapoff.8*
%lang(sr) %{_mandir}/sr/man1/mountpoint.1*
%lang(sr) %{_mandir}/sr/man5/fstab.5*
%lang(sr) %{_mandir}/sr/man8/findmnt.8*
%lang(sr) %{_mandir}/sr/man8/mount.8*
%lang(sr) %{_mandir}/sr/man8/umount.8*
%lang(sr) %{_mandir}/sr/man8/pivot_root.8*
%lang(sr) %{_mandir}/sr/man8/swapon.8*
%lang(sr) %{_mandir}/sr/man8/swapoff.8*

%files -n losetup
%defattr(644,root,root,755)
%attr(755,root,root) /sbin/losetup
%{_mandir}/man8/losetup.8*
%lang(de) %{_mandir}/de/man8/losetup.8*
%lang(fr) %{_mandir}/fr/man8/losetup.8*
%lang(it) %{_mandir}/it/man8/losetup.8*
%lang(ja) %{_mandir}/ja/man8/losetup.8*
%lang(ko) %{_mandir}/ko/man8/losetup.8*
%lang(pl) %{_mandir}/pl/man8/losetup.8*
%lang(sr) %{_mandir}/sr/man8/losetup.8*

%files -n tunelp
%defattr(644,root,root,755)
%attr(755,root,root) %{_sbindir}/tunelp
%{_mandir}/man8/tunelp.8*
%lang(de) %{_mandir}/de/man8/tunelp.8*
%lang(es) %{_mandir}/es/man8/tunelp.8*
%lang(ja) %{_mandir}/ja/man8/tunelp.8*
%lang(pl) %{_mandir}/pl/man8/tunelp.8*
%lang(sr) %{_mandir}/sr/man8/tunelp.8*

%files -n login
%defattr(644,root,root,755)
%attr(640,root,root) %config(noreplace) %verify(not md5 mtime size) /etc/pam.d/login
%attr(640,root,root) %config(noreplace) %verify(not md5 mtime size) /etc/security/blacklist.login
%attr(755,root,root) /bin/login
%{_mandir}/man1/login.1*
%lang(de) %{_mandir}/de/man1/login.1*
%lang(es) %{_mandir}/es/man1/login.1*
%lang(hu) %{_mandir}/hu/man1/login.1*
%lang(id) %{_mandir}/id/man1/login.1*
%lang(ja) %{_mandir}/ja/man1/login.1*
%lang(ko) %{_mandir}/ko/man1/login.1*
%lang(pl) %{_mandir}/pl/man1/login.1*
%lang(sr) %{_mandir}/sr/man1/login.1*

%files -n agetty
%defattr(644,root,root,755)
%attr(755,root,root) /sbin/agetty
%{_mandir}/man8/agetty.8*
%lang(de) %{_mandir}/de/man8/agetty.8*
%lang(es) %{_mandir}/es/man8/agetty.8*
%lang(fr) %{_mandir}/fr/man8/agetty.8*
%lang(ja) %{_mandir}/ja/man8/agetty.8*
%lang(sr) %{_mandir}/sr/man8/agetty.8*

%files -n libblkid
%defattr(644,root,root,755)
%attr(755,root,root) /%{_lib}/libblkid.so.*.*
%attr(755,root,root) %ghost /%{_lib}/libblkid.so.1

%files -n libblkid-devel
%defattr(644,root,root,755)
%attr(755,root,root) %{_libdir}/libblkid.so
%{_includedir}/blkid
%{_pkgconfigdir}/blkid.pc
%{_mandir}/man3/libblkid.3*
%lang(de) %{_mandir}/de/man3/libblkid.3*
%lang(fr) %{_mandir}/fr/man3/libblkid.3*
%lang(sr) %{_mandir}/sr/man3/libblkid.3*

%files -n libblkid-static
%defattr(644,root,root,755)
%{_libdir}/libblkid.a

%if %{with initrd} && %{with dietlibc}
%files -n libblkid-dietlibc
%defattr(644,root,root,755)
%{dietlibdir}/libblkid.a
%endif

%if %{with apidocs}
%files -n libblkid-apidocs
%defattr(644,root,root,755)
%{_gtkdocdir}/libblkid
%endif

%files -n libuuid
%defattr(644,root,root,755)
%attr(755,root,root) %{_bindir}/uuidgen
%attr(755,root,root) /%{_lib}/libuuid.so.*.*
%attr(755,root,root) %ghost /%{_lib}/libuuid.so.1
%{_mandir}/man1/uuidgen.1*
%lang(de) %{_mandir}/de/man1/uuidgen.1*
%lang(sr) %{_mandir}/sr/man1/uuidgen.1*

%files -n libuuid-devel
%defattr(644,root,root,755)
%attr(755,root,root) %{_libdir}/libuuid.so
%{_libdir}/libuuid.la
%{_includedir}/uuid
%{_pkgconfigdir}/uuid.pc
%{_mandir}/man3/uuid*.3*
%lang(de) %{_mandir}/de/man3/uuid*.3*
%lang(es) %{_mandir}/es/man3/uuid*.3*
%lang(fr) %{_mandir}/fr/man3/uuid*.3*
%lang(sr) %{_mandir}/sr/man3/uuid*.3*

%files -n libuuid-static
%defattr(644,root,root,755)
%{_libdir}/libuuid.a

%if %{with initrd} && %{with dietlibc}
%files -n libuuid-dietlibc
%defattr(644,root,root,755)
%{dietlibdir}/libuuid.a
%endif

%files -n uuidd
%defattr(644,root,root,755)
%attr(6755,uuidd,uuidd) %{_sbindir}/uuidd
%attr(2775,uuidd,uuidd) /var/lib/libuuid
%{_mandir}/man8/uuidd.8*
%lang(de) %{_mandir}/de/man8/uuidd.8*
%lang(fr) %{_mandir}/fr/man8/uuidd.8*
%lang(sr) %{_mandir}/sr/man8/uuidd.8*
%if %{with systemd}
%{systemdunitdir}/uuidd.service
%{systemdunitdir}/uuidd.socket
%endif

%files -n libfdisk
%defattr(644,root,root,755)
%doc libfdisk/COPYING
%attr(755,root,root) /%{_lib}/libfdisk.so.*.*
%attr(755,root,root) %ghost /%{_lib}/libfdisk.so.1

%files -n libfdisk-devel
%defattr(644,root,root,755)
%attr(755,root,root) %{_libdir}/libfdisk.so
%{_includedir}/libfdisk
%{_pkgconfigdir}/fdisk.pc

%files -n libfdisk-static
%defattr(644,root,root,755)
%{_libdir}/libfdisk.a

%if %{with apidocs}
%files -n libfdisk-apidocs
%defattr(644,root,root,755)
%{_gtkdocdir}/libfdisk
%endif

%files -n libmount
%defattr(644,root,root,755)
%doc libmount/COPYING
%attr(755,root,root) /%{_lib}/libmount.so.*.*
%attr(755,root,root) %ghost /%{_lib}/libmount.so.1

%files -n libmount-devel
%defattr(644,root,root,755)
%attr(755,root,root) %{_libdir}/libmount.so
%{_includedir}/libmount
%{_pkgconfigdir}/mount.pc

%files -n libmount-static
%defattr(644,root,root,755)
%{_libdir}/libmount.a

%if %{with apidocs}
%files -n libmount-apidocs
%defattr(644,root,root,755)
%{_gtkdocdir}/libmount
%endif

%files -n python3-libmount
%defattr(644,root,root,755)
%dir %{py3_sitedir}/libmount
%attr(755,root,root) %{py3_sitedir}/libmount/pylibmount.so
%{py3_sitedir}/libmount/__init__.py
%{py3_sitedir}/libmount/__pycache__

%files -n fsck
%defattr(644,root,root,755)
%attr(755,root,root) /sbin/fsck
%{_mandir}/man8/fsck.8*
%lang(de) %{_mandir}/de/man8/fsck.8*
%lang(fr) %{_mandir}/fr/man8/fsck.8*
%lang(pt_BR) %{_mandir}/pt_BR/man8/fsck.8*
%lang(sr) %{_mandir}/sr/man8/fsck.8*

%files -n libsmartcols
%defattr(644,root,root,755)
%attr(755,root,root) /%{_lib}/libsmartcols.so.*.*.*
%attr(755,root,root) %ghost /%{_lib}/libsmartcols.so.1

%files -n libsmartcols-devel
%defattr(644,root,root,755)
%attr(755,root,root) %{_libdir}/libsmartcols.so
%{_includedir}/libsmartcols
%{_pkgconfigdir}/smartcols.pc

%files -n libsmartcols-static
%defattr(644,root,root,755)
%{_libdir}/libsmartcols.a

%if %{with apidocs}
%files -n libsmartcols-apidocs
%defattr(644,root,root,755)
%{_gtkdocdir}/libsmartcols
%endif

%if %{with initrd}
%files initrd
%defattr(644,root,root,755)
%attr(755,root,root) %{_libdir}/initrd/blkid
%attr(755,root,root) %{_libdir}/initrd/blockdev
%attr(755,root,root) %{_libdir}/initrd/fdformat
%attr(755,root,root) %{_libdir}/initrd/fdisk
%attr(755,root,root) %{_libdir}/initrd/findfs
%attr(755,root,root) %{_libdir}/initrd/hwclock
%attr(755,root,root) %{_libdir}/initrd/look
%attr(755,root,root) %{_libdir}/initrd/mkswap
%attr(755,root,root) %{_libdir}/initrd/namei
%attr(755,root,root) %{_libdir}/initrd/rename
%ifnarch sparc sparcv9 sparc64
%attr(755,root,root) %{_libdir}/initrd/sfdisk
%endif
%attr(755,root,root) %{_libdir}/initrd/swaplabel
%attr(755,root,root) %{_libdir}/initrd/uuidgen
%attr(755,root,root) %{_libdir}/initrd/wipefs
# not needed?
#%attr(755,root,root) %{_libdir}/initrd/chrt
# not built because of disabled libmount
#%attr(755,root,root) %{_libdir}/initrd/e2fsck
#%attr(755,root,root) %{_libdir}/initrd/fsck
%endif

%files -n bash-completion-util-linux
%defattr(644,root,root,755)
%{bash_compdir}/addpart
%{bash_compdir}/blkdiscard
%{bash_compdir}/blkid
%{bash_compdir}/blkzone
%{bash_compdir}/blockdev
%{bash_compdir}/cal
%{bash_compdir}/cfdisk
%{bash_compdir}/chcpu
%{bash_compdir}/chmem
%{bash_compdir}/chrt
%{bash_compdir}/col
%{bash_compdir}/colcrt
%{bash_compdir}/colrm
%{bash_compdir}/column
%{bash_compdir}/ctrlaltdel
%{bash_compdir}/delpart
%{bash_compdir}/dmesg
%{bash_compdir}/eject
%{bash_compdir}/fallocate
%{bash_compdir}/fdformat
%{bash_compdir}/fdisk
%{bash_compdir}/fincore
%{bash_compdir}/findfs
%{bash_compdir}/findmnt
%{bash_compdir}/flock
%{bash_compdir}/fsck
%{bash_compdir}/fsck.cramfs
%{bash_compdir}/fsck.minix
%{bash_compdir}/fsfreeze
%{bash_compdir}/fstrim
%{bash_compdir}/getopt
%{bash_compdir}/hardlink
%{bash_compdir}/hexdump
%{bash_compdir}/hwclock
%{bash_compdir}/ionice
%{bash_compdir}/ipcmk
%{bash_compdir}/ipcrm
%{bash_compdir}/ipcs
%{bash_compdir}/irqtop
%{bash_compdir}/isosize
%{bash_compdir}/last
%{bash_compdir}/lastb
%{bash_compdir}/ldattach
%{bash_compdir}/logger
%{bash_compdir}/look
%{bash_compdir}/losetup
%{bash_compdir}/lsblk
%{bash_compdir}/lscpu
%{bash_compdir}/lsipc
%{bash_compdir}/lsirq
%{bash_compdir}/lslocks
%{bash_compdir}/lslogins
%{bash_compdir}/lsmem
%{bash_compdir}/lsns
%{bash_compdir}/mcookie
%{bash_compdir}/mesg
%{bash_compdir}/mkfs
%{bash_compdir}/mkfs.bfs
%{bash_compdir}/mkfs.cramfs
%{bash_compdir}/mkfs.minix
%{bash_compdir}/mkswap
%{bash_compdir}/more
%{bash_compdir}/mount
%{bash_compdir}/mountpoint
%{bash_compdir}/namei
%{bash_compdir}/nsenter
%{bash_compdir}/partx
%{bash_compdir}/pg
%{bash_compdir}/pivot_root
%{bash_compdir}/prlimit
%{bash_compdir}/readprofile
%{bash_compdir}/rename
%{bash_compdir}/renice
%{bash_compdir}/resizepart
%{bash_compdir}/rev
%{bash_compdir}/rfkill
%{bash_compdir}/rtcwake
%{bash_compdir}/runuser
%{bash_compdir}/script
%{bash_compdir}/scriptlive
%{bash_compdir}/scriptreplay
%{bash_compdir}/setarch
%{bash_compdir}/setpriv
%{bash_compdir}/setsid
%{bash_compdir}/setterm
%{bash_compdir}/sfdisk
%{bash_compdir}/su
%{bash_compdir}/swaplabel
%{bash_compdir}/swapoff
%{bash_compdir}/swapon
%{bash_compdir}/taskset
%{bash_compdir}/tunelp
%{bash_compdir}/uclampset
%{bash_compdir}/ul
%{bash_compdir}/umount
%{bash_compdir}/unshare
%{bash_compdir}/utmpdump
%{bash_compdir}/uuidd
%{bash_compdir}/uuidgen
%{bash_compdir}/uuidparse
%{bash_compdir}/wdctl
%{bash_compdir}/whereis
%{bash_compdir}/wipefs
%{bash_compdir}/write
%{bash_compdir}/zramctl
