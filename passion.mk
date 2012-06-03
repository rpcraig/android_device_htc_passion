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

# Overlay
DEVICE_PACKAGE_OVERLAYS := device/htc/passion/overlay

# General properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    windowsmgr.max_events_per_sec=120 \
    ro.media.dec.jpeg.memcap=20000000 \
    ro.opengles.version=131072

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

# Sensors
PRODUCT_PACKAGES += \
    gps.mahimahi \
    lights.mahimahi \
    sensors.mahimahi \
    camera.qsd8k

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

# Prebuilt Modules
ifeq (,$(BUILD_KERNEL))
PRODUCT_COPY_FILES += \
    device/htc/passion/prebuilt/bcm4329.ko:system/lib/modules/bcm4329.ko
endif

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/passion/media_profiles.xml:system/etc/media_profiles.xml

# media profiles and capabilities spec
$(call inherit-product, device/htc/passion/media_a1026.mk)

# Common qsd8k stuff
$(call inherit-product, device/htc/qsd8k-common/qsd8k.mk)

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/passion/passion-vendor.mk)
