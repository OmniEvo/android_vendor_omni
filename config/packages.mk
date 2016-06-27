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
    KernelAdiutor \
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
    vim 

# NTFS support
PRODUCT_PACKAGES += \
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

# FFMPEG support
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so
