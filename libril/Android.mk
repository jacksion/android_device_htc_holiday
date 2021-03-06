# Copyright 2006 The Android Open Source Project

ifeq ($(BOARD_PROVIDES_LIBRIL),true)
ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),holiday)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
    ril.cpp \
    ril_event.cpp

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libutils \
    libbinder \
    libcutils \
    libhardware_legacy \
	librilutils

LOCAL_CFLAGS :=
ifdef BOARD_USE_NEW_LIBRIL_HTC
    LOCAL_CFLAGS += -DNEW_LIBRIL_HTC
endif

LOCAL_MODULE:= libril

LOCAL_LDLIBS += -lpthread

include $(BUILD_SHARED_LIBRARY)


# For RdoServD which needs a static library
# =========================================
ifneq ($(ANDROID_BIONIC_TRANSITION),)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
    ril.cpp

LOCAL_STATIC_LIBRARIES := \
    libutils_static \
    libcutils \
	librilutils_static

LOCAL_CFLAGS :=

LOCAL_MODULE:= libril_static

LOCAL_LDLIBS += -lpthread

include $(BUILD_STATIC_LIBRARY)
endif # ANDROID_BIONIC_TRANSITION
endif # BOARD_BOOTLOADER_BOARD_NAME
endif # BOARD_PROVIDES_LIBRIL
