#!/bin/sh
# this is for dumping Android System logs shell script
#
# Rev: 1.0.0
# Author: Tody
# Copyright: 
#      (c) T-ware Inc.
#      2012/11/08

defTime=`date +"%y%m%d%H%M%S"`
defFiles="./dmesg.log ./logcat.log ./logcat_radio.log ./logcat_events.log"

if [ ! "" == "$1" ]; then
	defTime="$1"
fi

if [ "real" == "$1" ]; then
	adb logcat -v time
	exit 1
fi

echo "Waiting for Android devices ready..."
adb wait-for-devices

echo "Dumping dmesg..."
adb shell dmesg > dmesg.log

echo "Dumping logcat..."
adb logcat -v time -d >logcat.log

echo "Dumping radio..."
adb logcat -v time -d -b radio >logcat_radio.log

echo "Dumping events..."
adb logcat -v time -d -b events >logcat_events.log

# force update blocks to disk
sync

[ ! -d ./logs ] && mkdir ./logs

echo "Ziping files(logs_${defTime}.tar.gz)..."
sleep 2
tar -zcf logs/logs_${defTime}.tar.gz ${defFiles}
sync
echo "Removing files..."
rm -f ${defFiles}
echo "Dumping all system logs done."
