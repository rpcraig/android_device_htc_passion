#Special stuff for drewis

#Nexus One Stock Boot Animation
PRODUCT_COPY_FILES += device/htc/passion/extras/nexus-bootanimation.zip:system/media/bootanimation.zip

#init.d
PRODUCT_COPY_FILES += \
    device/htc/passion/extras/system/bin/sysinit:system/bin/sysinit \
    device/htc/passion/extras/system/etc/init.local.rc:system/etc/init.local.rc \
    device/htc/passion/extras/system/etc/init.d/05mountsd:system/etc/init.d/05mountsd \
    device/htc/passion/extras/system/bin/mountsd:system/bin/mountsd

# I think this is needed for nano
PRODUCT_COPY_FILES += \
    device/htc/passion/extras/system/etc/profile:system/etc/profile \
    device/htc/passion/extras/system/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
    device/htc/passion/extras/system/etc/terminfo/u/unknown:system/etc/terminfo/u/unknown \

#xbin
PRODUCT_COPY_FILES += \
    device/htc/passion/extras/system/xbin/dropbear-keygen:system/xbin/dropbear-keygen \
    device/htc/passion/extras/system/xbin/htop:system/xbin/htop \
    device/htc/passion/extras/system/xbin/powertop:system/xbin/powertop \

##DT apps2sd v2.7.5.2 stable
#PRODUCT_COPY_FILES += \
#    device/htc/passion/extras/dt-apps2sd/bin/adbfix:system/bin/adbfix \
#    device/htc/passion/extras/dt-apps2sd/bin/a2sd:system/bin/a2sd \
#    device/htc/passion/extras/dt-apps2sd/bin/apps2sd.hlp:system/bin/apps2sd.hlp \
#    device/htc/passion/extras/dt-apps2sd/bin/chka2sd:system/bin/chka2sd \
#    device/htc/passion/extras/dt-apps2sd/bin/zipalign:system/bin/zipalign \
#    device/htc/passion/extras/dt-apps2sd/bin/launcha2sd:system/bin/launcha2sd \
#    device/htc/passion/extras/dt-apps2sd/bin/starta2sd:system/bin/starta2sd \
#    device/htc/passion/extras/dt-apps2sd/etc/init.d/99complete:system/etc/init.d/99complete
