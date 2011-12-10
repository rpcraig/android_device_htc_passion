# Inherit AOSP device configuration for passion.
$(call inherit-product, device/htc/passion/full_passion.mk)

###############TODO################
# Inherit some common evervolv stuff.
#$(call inherit-product, vendor/ev/config/common_full_phone.mk)

# Include GSM stuff
#$(call inherit-product, vendor/ev/config/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := ev_passion
PRODUCT_BRAND := google
PRODUCT_DEVICE := passion
PRODUCT_MODEL := Nexus One
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=passion BUILD_ID=GRK39F BUILD_FINGERPRINT=google/passion/passion:2.3.6/GRK39F/189904:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.6 GRK39F 189904 release-keys"

# Extra RIL settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2

# Release name and versioning -- leaving this for now, and we'll take care of it like we did in GB evervolv.
PRODUCT_RELEASE_NAME := N1
PRODUCT_VERSION_DEVICE_SPECIFIC := -drewis-$(shell date +%m%d%Y)

PRODUCT_PACKAGES += \
    Camera

#Temp packages
PRODUCT_PACKAGES += \
    bash vim nano libncurses ssh rsync \
    Stk \
    e2fsck resize2fs e2fsck \
    libext2_com_err libext2_profile libext2_blkid libext2_e2p libext2_uuid libext2fs

#Get eng stuff on our userdebug builds
# Turn on checkjni for non-user builds.
ADDITIONAL_BUILD_PROPERTIES += ro.kernel.android.checkjni=1
# Set device insecure for non-user builds.
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
# Allow mock locations by default for non user builds
ADDITIONAL_DEFAULT_PROPERTIES += ro.allow.mock.location=1
# Disable visual strict mode, even on eng builds ----- We shouldn't need this now since we're using userdebug builds, or am i wrong?
#PRODUCT_DEFAULT_PROPERTY += persist.sys.strictmode.visual=0
# USB
#ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.usb.config=mass_storage,adb
#ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.usb.config=mtp,adb

#My extras -- removing this for now, for stuff like the dta2sd I'd like to get that in the vendor config for all devices to have - preludedrew
#$(call inherit-product-if-exists, device/htc/passion/extras/extras.mk)

#Get some Gapps 
#$(call inherit-product-if-exists, gapps/gapps.mk)
