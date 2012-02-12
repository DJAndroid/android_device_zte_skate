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

# proprietary side of the device
$(call inherit-product-if-exists, vendor/zte/skate/skate-vendor.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := zte_skate
PRODUCT_DEVICE := skate
PRODUCT_MODEL := ZTE Skate

DEVICE_PACKAGE_OVERLAYS := device/zte/skate/overlay

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_LOCALES := en_GB
# Skate uses high-density artwork where available
PRODUCT_LOCALES += hdpi
PRODUCT_AAPT_CONFIG := hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Video Decoding
PRODUCT_PACKAGES += \
    libopencorehw \
    libstagefrighthw \
    libmm-omxcore \
    libOmxCore \

# Graphics
PRODUCT_PACKAGES += \
    hwcomposer.msm7x27 \
    copybit.msm7x27 \
    gralloc.msm7x27

# Apps
PRODUCT_PACKAGES += \
    Gallery2 \
    SkateParts

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default

# Other
PRODUCT_PACKAGES += \
    prox_cal \
    lights.skate \
    gps.skate \
    sensors.skate

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
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
    device/zte/skate/prebuilt/usr/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    device/zte/skate/prebuilt/usr/idc/synaptics-rmi4-ts.idc:system/usr/idc/synaptics-rmi4-ts.idc

# RIL
PRODUCT_COPY_FILES += \
    device/zte/skate/prebuilt/lib/libril.so:system/lib/libril.so \
    device/zte/skate/prebuilt/lib/libril.so:obj/lib/libril.so

# Vold
PRODUCT_COPY_FILES += \
    device/zte/skate/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# EGL and gralloc module from SEMC
PRODUCT_COPY_FILES += \
    device/zte/skate/prebuilt/lib/hw/gralloc.skate.so:system/lib/hw/gralloc.skate.so \
    device/zte/skate/prebuilt/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    device/zte/skate/prebuilt/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    device/zte/skate/prebuilt/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    device/zte/skate/prebuilt/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so 

# Audio
PRODUCT_COPY_FILES += \
    device/zte/skate/prebuilt/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/zte/skate/prebuilt/lib/hw/audio.primary.skate.so:system/lib/hw/audio.primary.skate.so \
    device/zte/skate/prebuilt/lib/hw/audio_policy.skate.so:system/lib/hw/audio_policy.skate.so

# Kernel Modules
PRODUCT_COPY_FILES += \
    device/zte/skate/prebuilt/lib/modules/dhd.ko:system/lib/modules/dhd.ko \
    device/zte/skate/prebuilt/lib/modules/2.6.35.7-pref+/zram.ko:system/lib/modules/2.6.35.7-pref+/zram.ko 

# WiFi
PRODUCT_COPY_FILES += \
    device/zte/skate/prebuilt/etc/fw_4319.bin:system/etc/fw_4319.bin \
    device/zte/skate/prebuilt/etc/fw_4319_apsta.bin:system/etc/fw_4319_apsta.bin \
    device/zte/skate/prebuilt/etc/nv_4319.txt:system/etc/nv_4319.txt \
    device/zte/skate/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/zte/skate/prebuilt/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

PRODUCT_PROPERTY_OVERRIDES += debug.sf.hw=1
PRODUCT_PROPERTY_OVERRIDES += debug.composition.type=mdp
PRODUCT_PROPERTY_OVERRIDES += debug.gr.numframebuffers=2

# HardwareRenderer properties
# dirty_regions: "false" to disable partial invalidates, override if enabletr=true
PRODUCT_PROPERTY_OVERRIDES += \
    hwui.render_dirty_regions=false \
    hwui.disable_vsync=true \
    hwui.print_config=choice \
    debug.enabletr=false

# Misc properties
# events_per_sec: default 90
PRODUCT_PROPERTY_OVERRIDES += \
    pm.sleep_mode=true \
    ro.telephony.call_ring.delay=2 \
    net.tcp.buffersize.default=4096,87380,256960,4096,16384,256960 \
    net.tcp.buffersize.wifi=4096,87380,256960,4096,16384,256960 \
    net.tcp.buffersize.umts=4096,87380,256960,4096,16384,256960 \
    net.tcp.buffersize.gprs=4096,87380,256960,4096,16384,256960 \
    net.tcp.buffersize.edge=4096,87380,256960,4096,16384,256960
