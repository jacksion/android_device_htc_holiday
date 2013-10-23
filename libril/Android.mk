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
    libhardware_legacy

LOCAL_CFLAGS :=

ifeq ($(BOARD_RIL_NO_CELLINFOLIST),true)
LOCAL_CFLAGS += -DRIL_NO_CELL_INFO_LIST
endif

LOCAL_MODULE:= libril

LOCAL_LDLIBS += -lpthread

include $(BUILD_SHARED_LIBRARY)

endif # BOARD_BOOTLOADER_BOARD_NAME
endif # BOARD_PROVIDES_LIBRIL
