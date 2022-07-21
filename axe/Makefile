TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = Axe

Axe_FILES = XXXRootListController.m
Axe_FRAMEWORKS = UIKit
Axe_PRIVATE_FRAMEWORKS = Preferences
Axe_INSTALL_PATH = /Library/PreferenceBundles
Axe_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
