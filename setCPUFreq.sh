#!/bin/sh

adb shell 'echo 800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq'
adb shell 'cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq'
