$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/huawei/u9200/u9200-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/huawei/u9200/overlay

LOCAL_PATH := device/huawei/u9200
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

#init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/init.rc:root/init.rc \
    $(LOCAL_PATH)/prebuilt/init.omap4460.rc:root/init.omap4460.rc \
    $(LOCAL_PATH)/prebuilt/init.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/prebuilt/init.omap4460.usb.rc:root/init.omap4460.usb.rc \
    $(LOCAL_PATH)/prebuilt/ueventd.omap4460.rc:root/ueventd.omap4460.rc

# vold
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/vold.fstab:system/etc/vold.fstab

#configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/configs/gpsconfig.xml:system/etc/gpsconfig.xml \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# extra permission
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/permissions/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    $(LOCAL_PATH)/prebuilt/permissions/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    $(LOCAL_PATH)/prebuilt/permissions/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    $(LOCAL_PATH)/prebuilt/permissions/android.hardware.faketouch.multitouch.distinct.xml:system/etc/permissions/android.hardware.faketouch.multitouch.distinct.xml \
    $(LOCAL_PATH)/prebuilt/permissions/android.hardware.faketouch.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.faketouch.multitouch.jazzhand.xml \
    $(LOCAL_PATH)/prebuilt/permissions/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
    $(LOCAL_PATH)/prebuilt/permissions/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    $(LOCAL_PATH)/prebuilt/permissions/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml \
    $(LOCAL_PATH)/prebuilt/permissions/android.hardware.screen.landscape.xml:system/etc/permissions/android.hardware.screen.landscape.xml \
    $(LOCAL_PATH)/prebuilt/permissions/android.hardware.screen.portrait.xml:system/etc/permissions/android.hardware.screen.portrait.xml \
    $(LOCAL_PATH)/prebuilt/permissions/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    $(LOCAL_PATH)/prebuilt/permissions/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    $(LOCAL_PATH)/prebuilt/permissions/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    $(LOCAL_PATH)/prebuilt/permissions/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    $(LOCAL_PATH)/prebuilt/permissions/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    $(LOCAL_PATH)/prebuilt/permissions/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    $(LOCAL_PATH)/prebuilt/permissions/com.ti.fm.fmradioif.xml:system/etc/permissions/com.ti.fm.fmradioif.xml \
    $(LOCAL_PATH)/prebuilt/permissions/com.google.widevine.software.drm.xml:system/etc/permissions/com.google.widevine.software.drm.xml \
    $(LOCAL_PATH)/prebuilt/permissions/com.ti.s3d.xml:system/etc/permissions/com.ti.s3d.xml \

# Key maps
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/omap4-keypad.kcm:system/usr/keylayout/omap4-keypad.kl \
    $(LOCAL_PATH)/configs/omap4-keypad.kcm:system/usr/keychars/omap4-keypad.kcm \
    $(LOCAL_PATH)/configs/omap4-keypad.kcm:system/usr/keylayout/twl6030_pwrbutton.kl

# Input device calibration files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/syn_tm12xx_ts_2.idc:system/usr/idc/syn_tm12xx_ts_2.idc

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	e2fsck \
	setup_fs

# Audio
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product, hardware/ti/omap4xxx/omap4.mk)

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_u9200
PRODUCT_DEVICE := u9200
