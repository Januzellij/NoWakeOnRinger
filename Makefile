TARGET = :clang
ARCHS = armv7 arm64
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)
TWEAK_NAME = NoWakeOnRinger
NoWakeOnRinger_FILES = Tweak.xm
NoWakeOnRinger_CFLAGS = -fobjc-arc

include theos/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
