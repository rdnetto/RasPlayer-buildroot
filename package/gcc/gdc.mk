################################################################################
#
# GDC
#
################################################################################

#
# Version and Source
#

GCC_MAJOR_VER := $(word 1, $(subst ., ,$(GCC_VERSION)))
GCC_MINOR_VER := $(word 2, $(subst ., ,$(GCC_VERSION)))

GDC_VERSION = gdc-$(GCC_MAJOR_VER).$(GCC_MINOR_VER)
GDC_SITE = $(call github,D-Programming-GDC,GDC,$(GDC_VERSION))
GDC_SOURCE = $(GDC_VERSION).tar.gz

#
# Download GDC - can't use GCC_EXTRA_DOWNLOADS because it assumes the same server
#

NO_DL_GDC = $(wildcard $(DL_DIR)/$(GDC_SOURCE))
ifeq ($(NO_DL_GDC),)
define HOST_GDC_DOWNLOAD_HOOK

	$(call MESSAGE,"Downloading GDC")
	$(call DOWNLOAD,$(GDC_SITE))
	$(EXTRA_ENV) mv \
		$(DL_DIR)/$(GDC_VERSION) \
		$(DL_DIR)/$(GDC_SOURCE)

endef
endif

#
# Extract
#

define HOST_GCC_EXTRACT_GDC

	mkdir $(BUILD_DIR)/$(GDC_VERSION)
	$(call suitable-extractor,$(GDC_SOURCE)) $(DL_DIR)/$(GDC_SOURCE) | \
		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(BUILD_DIR)/$(GDC_VERSION) \
		$(TAR_OPTIONS) -

endef

#
# Apply patches
#

define HOST_GCC_APPLY_GDC_PATCH

	cd $(BUILD_DIR)/$(GDC_VERSION) && ./setup-gcc.sh $(@D)

endef

#
# Attach hooks
#

ifneq ($(BR2_INSTALL_D),)
HOST_GCC_FINAL_EXTRACT_CMDS	       += $(HOST_GCC_EXTRACT_GDC)
HOST_GCC_FINAL_POST_DOWNLOAD_HOOKS += HOST_GDC_DOWNLOAD_HOOK
HOST_GCC_FINAL_POST_PATCH_HOOKS    += HOST_GCC_APPLY_GDC_PATCH
endif

