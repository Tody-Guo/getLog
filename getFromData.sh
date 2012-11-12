#!/bin/sh

adb pull /data/kmsg.log $1_kmsg.log
adb pull /data/logcat.log $1_logcat.log

