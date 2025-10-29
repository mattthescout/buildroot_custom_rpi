###############################
# Hello World Module Package  #
###############################

HELLO_WORLD_VERSION = 1.0

HELLO_WORLD_SITE = $(BR2_PACKAGE_DIR)/hello-world/src
HELLO_WORLD_SITE_METHOD = local

$(eval $(generic-package))
