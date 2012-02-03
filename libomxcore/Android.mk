ifneq ($(BUILD_TINY_ANDROID),true)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

#===============================================================================
#             Figure out the targets
#===============================================================================

MM_CORE_TARGET = 7x27
ifeq "$(findstring msm7625,$(QCOM_TARGET_PRODUCT))" "msm7625"
MM_CORE_TARGET = 7x25
endif

#===============================================================================
#             Deploy the headers that can be exposed
#===============================================================================

LOCAL_COPY_HEADERS_TO   := mm-core/omxcore
LOCAL_COPY_HEADERS      := inc/OMX_Audio.h
LOCAL_COPY_HEADERS      += inc/OMX_Component.h
LOCAL_COPY_HEADERS      += inc/OMX_ContentPipe.h
LOCAL_COPY_HEADERS      += inc/OMX_Core.h
LOCAL_COPY_HEADERS      += inc/OMX_Image.h
LOCAL_COPY_HEADERS      += inc/OMX_Index.h
LOCAL_COPY_HEADERS      += inc/OMX_IVCommon.h
LOCAL_COPY_HEADERS      += inc/OMX_Other.h
LOCAL_COPY_HEADERS      += inc/OMX_QCOMExtns.h
LOCAL_COPY_HEADERS      += inc/OMX_Types.h
LOCAL_COPY_HEADERS      += inc/OMX_Video.h
LOCAL_COPY_HEADERS      += inc/qc_omx_common.h
LOCAL_COPY_HEADERS      += inc/qc_omx_component.h
LOCAL_COPY_HEADERS      += inc/qc_omx_msg.h
LOCAL_COPY_HEADERS      += inc/QOMX_AudioExtensions.h
LOCAL_COPY_HEADERS      += inc/QOMX_AudioIndexExtensions.h


#===============================================================================
#             LIBRARY for Android apps
#===============================================================================

LOCAL_C_INCLUDES        := $(LOCAL_PATH)/src/common
LOCAL_C_INCLUDES        += $(LOCAL_PATH)/inc
LOCAL_PRELINK_MODULE    := false
LOCAL_MODULE            := libOmxCore
LOCAL_SHARED_LIBRARIES  := liblog libdl

LOCAL_SRC_FILES         := src/common/omx_core_cmp.cpp
LOCAL_SRC_FILES         += src/common/qc_omx_core.c
LOCAL_SRC_FILES         += src/7k/qc_registry_table_android.c

include $(BUILD_SHARED_LIBRARY)

#===============================================================================
#             LIBRARY for command line test apps
#===============================================================================

include $(CLEAR_VARS)

LOCAL_C_INCLUDES        := $(LOCAL_PATH)/src/common
LOCAL_C_INCLUDES        += $(LOCAL_PATH)/inc
LOCAL_PRELINK_MODULE    := false
LOCAL_MODULE            := libmm-omxcore
LOCAL_SHARED_LIBRARIES  := liblog libdl
LOCAL_CFLAGS            := $(OMXCORE_CFLAGS)

LOCAL_SRC_FILES         := src/common/omx_core_cmp.cpp
LOCAL_SRC_FILES         += src/common/qc_omx_core.c
LOCAL_SRC_FILES         += src/$(MM_CORE_TARGET)/qc_registry_table.c

include $(BUILD_SHARED_LIBRARY)

endif #BUILD_TINY_ANDROID
