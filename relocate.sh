#!/system/bin/sh

result=$(df cache | awk '{print $2}' | tail -n 1 | sed s/M//)
if [ $result -le 5 ]
then
    mkdir /data/local/cache
    chmod 770 /data/local/cache
    chown system /data/local/cache
    chgrp cache /data/local/cache
    mount -o bind /data/local/cache /cache
fi
