#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

# Overlay / Locale
DEVICE_PACKAGE_OVERLAYS := device/htc/passion/overlay
PRODUCT_LOCALES := en

# Passion uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# General propreties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    windowsmgr.max_events_per_sec=120 \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=45 \
    ro.media.dec.jpeg.memcap=20000000 \
    ro.opengles.version=131072

# Dalvik properties
# dexop-flags: "v=" n|r|a, "o=" n|v|a|f, "m=y" register map
# v=verify o=optimize: n=none r=remote a=all f=full v=verified
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.checkjni=false

# Default heap settings for 512mb device
include frameworks/base/build/phone-hdpi-512-dalvik-heap.mk

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Ril properties
# default_network: 0 => GSM/WCDMA (WCDMA preferred), 3 => GSM/WCDMA (auto mode)
# ril.v3: Also available: skipbrokendatacall,facilitylock,datacall,icccardstatus
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2 \
    ro.ril.hsxpa=2 \
    ro.ril.gprsclass=10 \
    ro.ril.disable.power.collapse=0 \
    rild.libpath=/system/lib/libhtc_ril.so \
    ro.telephony.call_ring.delay=2 \
    ro.telephony.ril.v3=signalstrength,singlepdp \
    ro.telephony.default_network=0

# Don't set /proc/sys/vm/dirty_ratio to 0 when USB mounting
PRODUCT_PROPERTY_OVERRIDES += ro.vold.umsdirtyratio=20

# Enable gpu composition: 0 => cpu composition, 1 => gpu composition
# Note: must be 1 for debug.composition.type to work
PRODUCT_PROPERTY_OVERRIDES += debug.sf.hw=1

# Enable copybit composition
PRODUCT_PROPERTY_OVERRIDES += debug.composition.type=mdp

# Force 2 buffers - gralloc defaults to 3 and we only have 2
PRODUCT_PROPERTY_OVERRIDES += debug.gr.numframebuffers=2

# HardwareRenderer properties
# dirty_regions: "false" to disable partial invalidates, override if enabletr=true
PRODUCT_PROPERTY_OVERRIDES += \
    hwui.render_dirty_regions=false \
    hwui.disable_vsync=true \
    hwui.print_config=choice \
    debug.enabletr=false

# Set usb type
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mass_storage \
    persist.service.adb.enable=1

# Scrolling cache 0:enable, 1:default enable, 2:default disable, 3:disable
#ADDITIONAL_DEFAULT_PROPERTIES += \
#    persist.sys.scrollingcache=2

#
# Packages needed for Passion
#
# Camera
PRODUCT_PACKAGES += \
    Camera

# Sensors
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    gps.mahimahi \
    lights.mahimahi \
    sensors.mahimahi \
    librs_jni \
    camera.qsd8k
# Audio
PRODUCT_PACKAGES += \
    libaudioutils \
    audio.a2dp.default \
    audio.primary.qsd8k \
    audio_policy.qsd8k
# GPU
PRODUCT_PACKAGES += \
    copybit.qsd8k \
    gralloc.qsd8k \
    hwcomposer.qsd8k \
    libgenlock \
    libmemalloc \
    libtilerenderer \
    libQcomUI
# Omx
PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVidEnc \
    libOmxVdec \
    libstagefrighthw

# Prebuilt files/configs
PRODUCT_COPY_FILES += \
    device/htc/passion/init.mahimahi.rc:root/init.mahimahi.rc \
    device/htc/passion/init.mahimahi.usb.rc:root/init.mahimahi.usb.rc \
    device/htc/passion/ueventd.mahimahi.rc:root/ueventd.mahimahi.rc \
    device/htc/passion/mahimahi-keypad.kl:system/usr/keylayout/mahimahi-keypad.kl \
    device/htc/passion/mahimahi-keypad.kcm:system/usr/keychars/mahimahi-keypad.kcm \
    device/htc/passion/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/passion/mahimahi-nav.idc:system/usr/idc/mahimahi-nav.idc \
    device/htc/passion/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/passion/vold.fstab:system/etc/vold.fstab \
    device/htc/passion/sysctl.conf:system/etc/sysctl.conf

ifeq ($(TARGET_PREBUILT_WIFI_MODULE),)
LOCAL_WIFI_MODULE := kernel/msm/drivers/net/wireless/bcm4329/bcm4329.ko
else
LOCAL_WIFI_MODULE := $(TARGET_PREBUILT_WIFI_MODULE)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_WIFI_MODULE):system/lib/modules/bcm4329.ko

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := kernel/msm/arch/arm/boot/zImage
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distict.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/passion/media_profiles.xml:system/etc/media_profiles.xml

# bind mount cache partition script
PRODUCT_COPY_FILES += \
    device/htc/passion/relocate.sh:system/bin/relocate.sh

# media profiles and capabilities spec
$(call inherit-product, device/htc/passion/media_a1026.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/passion/passion-vendor.mk)

## Get some Gapps
$(call inherit-product-if-exists, vendor/google/gapps/gapps.mk)
