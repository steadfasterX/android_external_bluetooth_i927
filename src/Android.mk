LOCAL_PATH:= $(call my-dir)

#
# libbluetoothd
#

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	android_bluez.c \
	agent.c \
	dbus-common.c \
	device.c \
	eir.c \
	error.c \
	event.c \
	log.c \
	main.c \
	manager.c \
	oob.c \
	oui.c \
	plugin.c \
	rfkill.c \
	sdpd-service.c \
	sdpd-database.c \
	sdp-xml.c \
	storage.c \
	textfile.c \
	attrib-server.c \
	../attrib/att.c \
	../attrib/client.c \
	../attrib/gatt.c \
	../attrib/gattrib.c \
	../attrib/utils.c \

ifneq ($(BOARD_HAVE_BLUETOOTH_STE),true)
LOCAL_SRC_FILES+= \
	sdpd-request.c \
	sdpd-server.c \
	glib-helper.c \
	adapter.c
else
LOCAL_SRC_FILES+= \
	ste-sdpd-request.c \
	ste-sdpd-server.c \
	ste-adapter.c \
	ste-glib-helper.c \
	sdp-client.c
endif

LOCAL_CFLAGS:= \
	-DVERSION=\"4.101\" \
	-DSTORAGEDIR=\"/data/misc/bluetoothd\" \
	-DCONFIGDIR=\"/etc/bluetooth\" \
	-DSERVICEDIR=\"/system/bin\" \
	-DPLUGINDIR=\"/system/lib/bluez-plugin\" \
	-DANDROID_SET_AID_AND_CAP \
	-DANDROID_EXPAND_NAME \
	-DOUIFILE=\"/data/misc/bluetoothd/ouifile\" \

ifeq ($(BOARD_HAVE_BLUETOOTH_BCM),true)
LOCAL_CFLAGS += \
	-DBOARD_HAVE_BLUETOOTH_BCM
endif

LOCAL_C_INCLUDES:= \
	$(LOCAL_PATH)/../attrib \
	$(LOCAL_PATH)/../btio \
	$(LOCAL_PATH)/../lib \
	$(LOCAL_PATH)/../gdbus \
	$(LOCAL_PATH)/../plugins \
	$(call include-path-for, glib) \
	$(call include-path-for, glib)/glib \
	$(call include-path-for, dbus)

LOCAL_SHARED_LIBRARIES := \
	libdl \
	libbluetooth \
	libbtio \
	libdbus \
	libcutils \
	libglib \

LOCAL_STATIC_LIBRARIES := \
	libbuiltinplugin \
	libgdbus_static

LOCAL_MODULE:=libbluetoothd

include $(BUILD_SHARED_LIBRARY)

#
# bluetoothd
#

include $(CLEAR_VARS)

LOCAL_SHARED_LIBRARIES := \
	libbluetoothd

LOCAL_MODULE:=bluetoothd

include $(BUILD_EXECUTABLE)
