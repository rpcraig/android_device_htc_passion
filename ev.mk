$(call inherit-product, device/htc/passion/full_passion.mk)

# Inherit some common evervolv stuff.
$(call inherit-product, vendor/ev/config/common_full_phone.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := ev_passion
PRODUCT_BRAND := google
PRODUCT_DEVICE := passion
PRODUCT_MODEL := Nexus One
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=passion BUILD_ID=GRK39F \
BUILD_FINGERPRINT=google/passion/passion:2.3.6/GRK39F/189904:user/release-keys \
PRIVATE_BUILD_DESC="passion-user 2.3.6 GRK39F 189904 release-keys"

#
# Set up the product codename, build version & MOTD.
#
PRODUCT_CODENAME := Perdo
#PRODUCT_VERSION_DEVICE_SPECIFIC := p2
ifeq ($(NIGHTLY_BUILD),true)
    BUILD_VERSION := 2.0.0p1-$(shell date +%m%d%Y)-NIGHTLY
else
    BUILD_VERSION := 2.0.0p1
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.romversion=Evervolv-$(PRODUCT_CODENAME)-$(BUILD_VERSION)

PRODUCT_MOTD :="\n\n\n--------------------MESSAGE---------------------\nThank you for choosing Evervolv for your Google Nexus One\nPlease visit us at \#evervolv on irc.freenode.net\nFollow @preludedrew for the latest Evervolv updates\nGet the latest rom at evervolv.com\n------------------------------------------------\n"

#
# Extra Packages
#
PRODUCT_PACKAGES += \
    Camera \
    Stk

# Extra RIL settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2

# Hot Reboot overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/ev/overlay/hot_reboot

# Copy hdpi specific bootanimation
#PRODUCT_COPY_FILES +=  \
#    vendor/ev/prebuilt/hvga/media/bootanimation.zip:system/media/bootanimation.zip
# Use the n1 stock boot animation until we get a custom evervolv one.
$(call inherit-product-if-exists, device/htc/passion/extras/extras.mk)
