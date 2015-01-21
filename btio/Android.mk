LOCAL_PATH:= $(call my-dir)

#
# libbtio
#

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	btio.c

LOCAL_CFLAGS:= \
	-DVERSION=\"4.101\" \

LOCAL_C_INCLUDES:= \
	$(LOCAL_PATH)/../lib \
	$(LOCAL_PATH)/../gdbus \
	$(call include-path-for, glib) \

LOCAL_SHARED_LIBRARIES := \
	libcutils \
	libbluetooth \
        libglib

#LOCAL_STATIC_LIBRARIES := \
#	libglib_static \

LOCAL_MODULE:=libbtio

LOCAL_MODULE_TAGS:=optional

include $(BUILD_SHARED_LIBRARY)
