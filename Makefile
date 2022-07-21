THEOS_DEVICE_IP=<192.168.1.185>
TARGET := iphone:clang:latest:13.0
INSTALL_TARGET_PROCESSES = SpringBoard

DEBUG = 0
FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Axe

Axe_FILES = Tweak.x
Axe_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += axe
include $(THEOS_MAKE_PATH)/aggregate.mk
