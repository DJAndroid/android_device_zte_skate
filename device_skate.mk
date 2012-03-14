# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Proprietary and common side of the device
$(call inherit-product, vendor/zte/skate/skate-vendor.mk)
$(call inherit-product, device/zte/common/device_zte.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := zte_skate
PRODUCT_DEVICE := skate
PRODUCT_MODEL := ZTE Skate

# Libs
PRODUCT_PACKAGES += \
    lights.skate \
    sensors.skate \
    camera.skate \
    copybit.skate \
    gralloc.skate \
    audio.primary.skate \
    audio_policy.skate

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# Init
PRODUCT_COPY_FILES += \
    device/zte/skate/prebuilt/init.skate.rc:root/init.skate.rc \
    device/zte/skate/prebuilt/init.skate.usb.rc:root/init.skate.usb.rc \
    device/zte/skate/prebuilt/ueventd.skate.rc:root/ueventd.skate.rc \
    device/zte/skate/prebuilt/usbconfig:root/sbin/usbconfig

# Keypad files
PRODUCT_COPY_FILES += \
    device/zte/skate/prebuilt/usr/keylayout/skate_keypad.kl:system/usr/keylayout/skate_keypad.kl \
    device/zte/skate/prebuilt/usr/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    device/zte/skate/prebuilt/usr/keylayout/Generic.kl:system/usr/keylayout/Generic.kl

# Gralloc (from paul-xxx as I can't get ones that I compiled to work)
#PRODUCT_COPY_FILES += \
#    device/zte/skate/prebuilt/lib/hw/gralloc.skate.so:system/lib/hw/gralloc.skate.so

# WiFi
PRODUCT_COPY_FILES += \
    device/zte/skate/prebuilt/lib/modules/dhd.ko:system/lib/modules/dhd.ko \
    device/zte/skate/prebuilt/etc/fw_4319.bin:system/etc/fw_4319.bin \
    device/zte/skate/prebuilt/etc/fw_4319_apsta.bin:system/etc/fw_4319_apsta.bin \
    device/zte/skate/prebuilt/etc/nv_4319.txt:system/etc/nv_4319.txt
