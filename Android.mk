LOCAL_PATH := $(call my-dir)

######### hans ##############
include $(CLEAR_VARS)

LOCAL_MODULE := hans

LOCAL_SRC_FILES := \
    src/auth.cpp \
    src/client.cpp \
    src/echo.cpp \
    src/exception.cpp \
    src/main.cpp \
    src/server.cpp \
    src/sha1.cpp \
    src/time.cpp \
    src/tun.cpp \
    src/tun_dev_linux.c \
    src/utility.cpp \
    src/worker.cpp \
LOCAL_C_INCLUDES := $(LOCAL_PATH)/src

LOCAL_CFLAGS := -O2 -g -c -DLINUX -DANDROID -DHAVE_LINUX_IF_TUN_H -fexceptions
LOCAL_LDFLAGS := -fPIE -pie
LOCAL_STATIC_LIBRARIES := libpcap

include $(BUILD_EXECUTABLE)


############ libpcap ##################

include $(CLEAR_VARS)

LOCAL_MODULE := libpcap

LOCAL_SRC_FILES := \
    libpcap/bpf_dump.c \
    libpcap/bpf/net/bpf_filter.c \
    libpcap/bpf_image.c \
    libpcap/etherent.c \
    libpcap/fad-gifc.c \
    libpcap/gencode.c \
    libpcap/grammar.c \
    libpcap/inet.c \
    libpcap/nametoaddr.c \
    libpcap/optimize.c \
    libpcap/pcap.c \
    libpcap/pcap-linux.c \
    libpcap/savefile.c \
    libpcap/scanner.c \
    libpcap/version.c
LOCAL_C_INCLUDES := $(LOCAL_PATH)/libpcap
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/libpcap

LOCAL_CFLAGS := -O2 -g
LOCAL_CFLAGS += -DHAVE_CONFIG_H -D_U_="__attribute__((unused))" -Dlinux -D__GLIBC__ -D_GNU_SOURCE

include $(BUILD_STATIC_LIBRARY)
