LOCAL_PATH := $(call my-dir)

include $(call all-subdir-makefiles,$(LOCAL_PATH))

# Runtime overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/lighthouse-ui/overlay
DEVICE_PACKAGE_OVERLAYS += \
    vendor/lighthouse-ui/overlay/common/

# Bootanimation
ifeq ($(TARGET_BOOT_ANIMATION_RES),1080)
     PRODUCT_COPY_FILES += vendor/lighthouse-ui/bootanimation/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1440)
     PRODUCT_COPY_FILES += vendor/lighthouse-ui/bootanimation/bootanimation_1440.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),720)
     PRODUCT_COPY_FILES += vendor/lighthouse-ui/bootanimation/bootanimation_720.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else
    ifeq ($(TARGET_BOOT_ANIMATION_RES),)
        $(warning "LighthouseOS: TARGET_BOOT_ANIMATION_RES is undefined, assuming 1080p")
    else
        $(warning "LighthouseOS: Current bootanimation res is not supported, forcing 1080p")
    endif
    PRODUCT_COPY_FILES += vendor/lighthouse-ui/bootanimation/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
endif 
