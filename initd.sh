#!/system/bin/sh
# Init.d support
INITPATH=system/etc/init.d
sleep 5

if [ ! -d $INITPATH ] ; then
    mount -o remount,rw /
    mkdir $INITPATH
    chmod 755 $INITPATH
    chmod 755 $INITPATH/*
    /system/xbin/curl -s -k -L --fail --show-error -o  $INITPATH/55wooper https://raw.githubusercontent.com/707zalamah/wooper/main/55wooper
    chmod +x $INITPATH/55wooper
    /system/xbin/curl -s -k -L --fail --show-error -o  $INITPATH/55cron https://raw.githubusercontent.com/707zalamah/wooper/main/55cron 
    chmod +x $INITPATH/55cron
    mount -o remount,ro /
fi
toybox run-parts $INITPATH
