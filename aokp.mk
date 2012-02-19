$(call inherit-product, device/zte/skate/device_skate.mk)

PRODUCT_RELEASE_NAME := Skate

$(call inherit-product, vendor/aokp/products/common.mk)

$(call inherit-product, vendor/aokp/products/common_versions.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_NAME := aokp_skate
PRODUCT_DEVICE := skate
