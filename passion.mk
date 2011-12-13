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

# Overlay files
DEVICE_PACKAGE_OVERLAYS := device/htc/passion/overlay

# General propreties
PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=240 \
    rild.libpath=/system/lib/libhtc_ril.so \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=15 \
    ro.ril.hsxpa=2 \
    ro.ril.gprsclass=10 \
    ro.media.dec.jpeg.memcap=20000000

# Default network type.
# 0 => /* GSM/WCDMA (WCDMA preferred) */
# 1 => /* GSM only */
# 3 => /* GSM/WCDMA (auto mode, according to PRL) */
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=3

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

# This is a high density device with more memory, so larger vm heaps for it.
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=48m

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Ril workaround
ADDITIONAL_BUILD_PROPERTIES += \
    ro.telephony.ril.v3=signalstrength
    #,skipbrokendatacall,facilitylock,datacall,icccardstatus

# Disable HWAccel for now
ADDITIONAL_BUILD_PROPERTIES += \
    ro.config.disable_hw_accel=true

#
# Packages needed for Passion
#
# Sensors and stuff
PRODUCT_PACKAGES := \
    com.android.future.usb.accessory \
    gps.mahimahi \
    librs_jni \
    libOmxCore \
    libOmxVidEnc \
    lights.mahimahi \
    sensors.mahimahi
# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.qsd8k \
    audio_policy.qsd8k
# GPU
PRODUCT_PACKAGES += \
    copybit.qsd8k \
    gralloc.qsd8k \
    hwcomposer.default \
#    hwcomposer.mahimahi \
#    libgenlock \
#    libmemalloc \
#    libtilerenderer

PRODUCT_LOCALES := en

# Passion uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Prebuilt files/configs
PRODUCT_COPY_FILES := \
    device/htc/passion/init.mahimahi.rc:root/init.mahimahi.rc \
    device/htc/passion/init.mahimahi.usb.rc:root/init.mahimahi.usb.rc \
    device/htc/passion/ueventd.mahimahi.rc:root/ueventd.mahimahi.rc \
    device/htc/passion/mahimahi-keypad.kl:system/usr/keylayout/mahimahi-keypad.kl \
    device/htc/passion/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/passion/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/passion/vold.fstab:system/etc/vold.fstab

# Prebuilt Modules
PRODUCT_COPY_FILES += \
    device/htc/passion/prebuilt/bcm4329.ko:system/lib/modules/bcm4329.ko \
    device/htc/passion/prebuilt/fuse.ko:system/lib/modules/fuse.ko

# Prebuilt Kernel
PRODUCT_COPY_FILES += \
    device/htc/passion/prebuilt/kernel:kernel

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
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/passion/media_profiles.xml:system/etc/media_profiles.xml

# Proprietary makefile
$(call inherit-product-if-exists, vendor/htc/passion/passion-vendor.mk)

# media profiles and capabilities spec
$(call inherit-product, device/htc/passion/media_a1026.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/passion/passion-vendor.mk)
