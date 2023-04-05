DISPLAY_MODULES_HARDWARE:= android.hardware.graphics.mapper@4.0-impl-qti-display \
                        vendor.qti.hardware.display.mapper@4.0.vendor \
                        vendor.qti.hardware.display.allocator-service

ifeq ($(TARGET_BUILD_VARIANT),userdebug)
    DISPLAY_MODULES_HARDWARE += libcomposertestservice
endif

TARGET_IS_HEADLESS := false
ifeq ($(TARGET_USES_COMPOSER3),true)
DISPLAY_MODULES_HARDWARE += vendor.qti.hardware.display.composer3-service
else
DISPLAY_MODULES_HARDWARE += vendor.qti.hardware.display.composer-service
endif

ifeq ($(TARGET_USES_QMAA),true)
    ifneq ($(TARGET_USES_QMAA_OVERRIDE_DISPLAY),true)
        #QMAA Mode is enabled
        TARGET_IS_HEADLESS := true
    endif
endif

#Packages that should not be installed in QMAA are enabled here
ifneq ($(TARGET_IS_HEADLESS),true)
    DISPLAY_MODULES_HARDWARE += libsdmcore \
                            libsdmdal \
                            libdrmutils \
                            libsdedrm\
                            libgpu_tonemapper \
                            libsdmutils \
                            libqdutils \
                            libqdMetaData \
                            libgralloc.qti \
                            vendor.display.config@2.0.vendor \
                            vendor.display.color@1.0-service \
                            init.qti.display_boot.sh \
                            libfilefinder \
                            vendor.qti.hardware.display.demura-service \
                            modetest
endif
