#Special stuff for drewis

# Get some gapps
ifeq ($(GAPPS),true)
$(call inherit-product, vendor/ev/prebuilt/gapps/gapps.mk)
endif

ifeq ($(MINISKIRT),true)
# Needed by a2sd but not included in userdebug builds
PRODUCT_PACKGES+= \
    bash \
    e2fsck \
    tune2fs
endif

# Nexus One Stock Boot Animation
PRODUCT_COPY_FILES += device/htc/passion/extras/nexus-bootanimation.zip:system/media/bootanimation.zip

# Started as DT 2.7.5.3 Beta 4a
# Ended as my own little a2sd script
PRODUCT_COPY_FILES += \
    device/htc/passion/extras/a2sd/system/etc/init.d/10apps2sd:system/etc/init.d/10apps2sd

#    device/htc/passion/extras/a2sd/system/bin/fix_permissions:system/bin/fix_permissions \
#    device/htc/passion/extras/a2sd/system/bin/zipalign:system/bin/zipalign \
#    device/htc/passion/extras/a2sd/system/bin/a2sd:system/bin/a2sd \
#    device/htc/passion/extras/a2sd/system/bin/apps2sd.hlp:system/bin/apps2sd.hlp \
#    device/htc/passion/extras/a2sd/system/bin/chka2sd:system/bin/chka2sd \
#    device/htc/passion/extras/a2sd/system/bin/launcha2sd:system/bin/launcha2sd \
#    device/htc/passion/extras/a2sd/system/bin/starta2sd:system/bin/starta2sd \
#    device/htc/passion/extras/a2sd/system/etc/init.d/99complete:system/etc/init.d/99complete \
#    device/htc/passion/extras/a2sd/system/etc/init.d/dtapp:system/etc/init.d/06dtapp
#    device/htc/passion/extras/a2sd/system/bin/adbfix:system/bin/adbfix \
#    device/htc/passion/extras/a2sd/system/bin/dtinstall:system/bin/dtinstall \
