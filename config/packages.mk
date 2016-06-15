# Additional packages
ifneq ($(TARGET_LOW_RAM_DEVICE), true)
PRODUCT_PACKAGES += \
    Basic \
    Development
endif

# Additional apps
PRODUCT_PACKAGES += \
    AdAway \
    Apollo \
    Chromium \
    MonthCalendarWidget \
    OmniSwitch \
    OmniJaws \
    OmniStyle \
    SlimOTA


ifneq ($(TARGET_NO_DSPMANAGER), true)
PRODUCT_PACKAGES += \
    audio_effects.conf \
    DSPManager \
    libcyanogen-dsp
endif

PRODUCT_PACKAGES += \
    CellBroadcastReceiver

# Additional tools
PRODUCT_PACKAGES += \
    bash \
    bzip2 \
    curl \
    e2fsck \
    htop \
    libsepol \
    lsof \
    mke2fs \
    nano \
    openvpn \
    powertop \
    strace \
    tune2fs \
    vim \
    mkfs.ntfs \
    mount.ntfs \
    fsck.ntfs

# exFAT support
WITH_EXFAT ?= true
ifeq ($(WITH_EXFAT),true)
TARGET_USES_EXFAT := true
PRODUCT_PACKAGES += \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat
endif

