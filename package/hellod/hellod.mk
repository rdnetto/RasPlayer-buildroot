################################################################################
#
# hellod
#
################################################################################

HELLOD_VERSION = 1.0
HELLOD_SITE = $(call github,rdnetto,HelloD,master)
HELLOD_SOURCE = hellod-master.tar.gz

define HELLOD_BUILD_CMDS
	$(MAKE) DC="$(TARGET_DC)" LD="$(TARGET_LD)" CFLAGS="$(TARGET_CFLAGS)" -C $(@D) all
endef

define HELLOD_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/hellod $(TARGET_DIR)/usr/bin/hellod
endef


$(eval $(generic-package))

