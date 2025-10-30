##############################
# Hello Cdev Module Package  #
##############################

HELLO_CDEV_VERSION = 1.0.0

HELLO_CDEV_SITE = package/hello-cdev/src
HELLO_CDEV_SITE_METHOD = local

KERNEL_RELEASE = $(shell cat $(LINUX_DIR)/kernelrelease 2>/dev/null)

ifeq ($(KERNEL_RELEASE),)
	REAL_KERNEL_VERSION = 6.12.41
else
	REAL_KERNEL_VERSION = $(KERNEL_RELEASE)
endif

$(eval $(generic-package))
$(eval $(kernel-module))

define HELLO_CDEV_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/hello-cdev.ko \
		$(TARGET_DIR)/lib/modules/$(REAL_KERNEL_VERSION)/extra/hello-cdev.ko
endef