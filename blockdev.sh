#!/bin/sh

[ -f /etc/sysconfig/blockdev ] || exit 0

blockdevs=$(awk -F= '!/^#/ && !/^$/ {if ($2) print $1}' /etc/sysconfig/blockdev)
[ -n "$blockdevs" ] || exit 0

# Source blockdev configuration.
. /etc/sysconfig/blockdev

for var in $blockdevs; do
	realdrive=
	drive=${var#BLOCKDEV_}
	if [ -d "/sys/block/${drive}" -a -e "/dev/${drive}" ]; then
		realdrive="/dev/${drive}"
	elif [ -e "/dev/mapper/${drive}" ]; then
		realdrive="/dev/mapper/${drive}"
	elif drive=$(echo $drive | tr _ -) && [ -d "/sys/block/${drive}" -a -e "/dev/${drive}" ]; then
		realdrive="/dev/${drive}"
	elif [ -e "/dev/mapper/${drive}" ]; then
		realdrive="/dev/mapper/${drive}"
	fi

	if [ -n "$realdrive" ]; then
		eval PARAMS=\$$var
		if [ -n "${PARAMS}" ]; then
			/sbin/blockdev ${PARAMS} $realdrive
		fi
	fi
done

exit 0
