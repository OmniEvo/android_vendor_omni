PRODUCT_BRAND ?= omni

# use specific resolution for bootanimation
ifneq ($(TARGET_BOOTANIMATION_SIZE),)
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/bootanimation/res/$(TARGET_BOOTANIMATION_SIZE).zip:system/media/bootanimation.zip
else
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/bootanimation/bootanimation.zip:system/media/bootanimation.zip
endif

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# general properties
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    persist.sys.root_access=1

# OmniEvo property overides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.fw.bg_apps_limit=20 \
    pm.sleep.mode=1 \
    wifi.supplicant_scan_interval=180 \
    windowsmgr.max_events_per_sec=150 \
    debug.performance.tuning=1 \
    ro.ril.power_collapse=1 \
    persist.service.lgospd.enable=0 \
    persist.service.pcsync.enable=0 \
    ro.facelock.black_timeout=400 \
    ro.facelock.det_timeout=1500 \
    ro.facelock.rec_timeout=2500 \
    ro.facelock.lively_timeout=2500 \
    ro.facelock.est_max_time=600 \
    ro.facelock.use_intro_anim=false \
    ro.setupwizard.network_required=false \
    ro.setupwizard.gservices_delay=-1 \
    net.tethering.noprovisioning=true \
    persist.sys.dun.override=0 \
    ro.adb.secure=0

# enable ADB authentication if not on eng build
#ifneq ($(TARGET_BUILD_VARIANT),eng)
#ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
#endif

# Enable MTP by default
PRODUCT_PROPERTY_OVERRIDES += \
    sys.usb.config=mtp,adb \
    persist.sys.usb.config=mtp,adb

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/omni/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/omni/prebuilt/bin/50-hosts.sh:system/addon.d/50-hosts.sh \
    vendor/omni/prebuilt/bin/blacklist:system/addon.d/blacklist

<<<<<<< HEAD
# Assertive Disaply
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/etc/ad_calib.cfg:system/etc/ad_calib.cfg
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qcom.ad=1 \
    ro.qcom.ad.calib.data=/system/etc/ad_calib.cfg \
    persist.radio.add_power_save=1 \
    persist.radio.data_no_toggle=1
=======
# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/etc/sysconfig/backup.xml:system/etc/sysconfig/backup.xml
>>>>>>> c4f0640... Adapt to 6.0.1_r52 backup whitelist

# init.d support
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/omni/prebuilt/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/etc/init.d/90userinit:system/etc/init.d/90userinit

# Init script file with omni extras
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/etc/init.local.rc:root/init.omni.rc

# Google DNS server
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/etc/resolv.conf:system/etc/resolv.conf

# Enable SIP and VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml
    
# Busybox
PRODUCT_PACKAGES += \
    Busybox

# SuperSU FTW
PRODUCT_COPY_FILES += \
vendor/omni/prebuilt/supersu/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip

# Dashclock
#PRODUCT_COPY_FILES += \
#    vendor/omni/prebuilt/app/DashClock.apk:system/app/DashClock.apk

# Additional packages
-include vendor/omni/config/packages.mk

# Versioning
-include vendor/omni/config/version.mk

# Add our overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/omni/overlay/common

# Enable dexpreopt for all nightlies
ifeq ($(ROM_BUILDTYPE),NIGHTLY)
    WITH_DEXPREOPT := true
endif
