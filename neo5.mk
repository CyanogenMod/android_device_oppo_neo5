TARGET_USES_QCOM_BSP := true
TARGET_USES_QCA_NFC := other

ifeq ($(TARGET_USES_QCOM_BSP), true)
# Add QC Video Enhancements flag
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
endif #TARGET_USES_QCOM_BSP

DEVICE_PACKAGE_OVERLAYS := device/qcom/msm8226/overlay

#TARGET_DISABLE_DASH := true
#TARGET_DISABLE_OMX_SECURE_TEST_APP := true

# media_profiles and media_codecs xmls for 8226
ifeq ($(TARGET_ENABLE_QC_AV_ENHANCEMENTS), true)
PRODUCT_COPY_FILES += device/qcom/msm8226/media/media_profiles_8226.xml:system/etc/media_profiles.xml \
                      device/qcom/msm8226/media/media_codecs_8226.xml:system/etc/media_codecs.xml
endif

$(call inherit-product, device/qcom/common/common.mk)

# Audio configuration file
PRODUCT_COPY_FILES += \
    device/qcom/msm8226/audio_policy.conf:system/etc/audio_policy.conf \
    device/qcom/msm8226/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    device/qcom/msm8226/mixer_paths.xml:system/etc/mixer_paths.xml

PRODUCT_PACKAGES += \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcompostprocbundle

# Bluetooth configuration files
#PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

#fstab.qcom
PRODUCT_PACKAGES += fstab.qcom
#wlan driver
PRODUCT_COPY_FILES += \
    device/qcom/msm8226/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/qcom/msm8226/WCNSS_qcom_wlan_nv.bin:persist/WCNSS_qcom_wlan_nv.bin

PRODUCT_PACKAGES += \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf

PRODUCT_PACKAGES += wcnss_service \
		    pronto_wlan.ko

#ANT stack
PRODUCT_PACKAGES += \
    AntHalService \
    libantradio \
    antradio_app


PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml

# Enable strict operation
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.strict_op_enable=false

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1
