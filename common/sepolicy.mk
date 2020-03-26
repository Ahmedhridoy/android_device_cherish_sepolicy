#
# This policy configuration will be used by all products that
# inherit from PixelExperience
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    device/cherish/sepolicy/common/public

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/cherish/sepolicy/common/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/cherish/sepolicy/common/dynamic \
    device/cherish/sepolicy/common/system
else
BOARD_SEPOLICY_DIRS += \
    device/cherish/sepolicy/common/dynamic \
    device/cherish/sepolicy/common/vendor
endif

# Selectively include legacy rules defined by the products
-include device/cherish/sepolicy/legacy-common/sepolicy.mk
