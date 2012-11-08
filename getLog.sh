#!/bin/sh
defTime=`date +"%y%m%d%k%M%S"`
defFiles="./dmesg.log ./logcat.log ./logcat_radio.log ./logcat_events.log"

echo Waiting for Android devices ready...
adb wait-for-devices
echo Dumping dmesg...
adb shell dmesg > dmesg.log
echo Dumping logcat...
adb logcat -v time -d >logcat.log
echo Dumping radio...
adb logcat -v time -d -b radio >logcat_radio.log
echo Dumping events...
adb logcat -v time -d -b events >logcat_events.log
echo "Ziping files(logs_${defTime}.tar.gz)..."
sleep 3
tar -zcf logs_${defTime}.tar.gz ${defFiles}
echo Removing files...
rm -f ${defFiles}
echo Dumping all system logs done.

