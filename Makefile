.PHONY: all clean uboot-clean uboot-loadconfig uboot-build

CURDIR=$(shell pwd)

CPUS=$$(($(shell cat /sys/devices/system/cpu/present | awk -F- '{ print $$2 }')+1))

UBOOT_DEFCONFIG = caninos_labrador_defconfig

UBOOT_SRC=$(CURDIR)/u-boot
UBOOT_BUILD=$(CURDIR)/build-uboot
UBOOT_DEFCONFIG_FULL=$(UBOOT_SRC)/configs/$(UBOOT_DEFCONFIG)
UBOOT_BUILDCONFIG=$(UBOOT_BUILD)/.config
UBOOT_DTB_IMAGE=u-boot-dtb.img
UBOOT_DTB_IMAGE_FULL=$(UBOOT_BUILD)/$(UBOOT_DTB_IMAGE)

COPYF=\cp -rf 
MKDIR=mkdir -p 
RMDIR=rm -rf
RMF=$(RMDIR)

SCRIPT_DIR=$(CURDIR)/scripts
OUT_DIR=$(CURDIR)/out

CROSS_COMPILE=$(CURDIR)/toolchain/arm-linux-gnueabihf/bin/arm-linux-gnueabihf-
ARCH=arm

export PATH:=$(SCRIPT_DIR):$(PATH)

all: uboot-loadconfig uboot-build

clean: uboot-clean

uboot-loadconfig: uboot-clean $(UBOOT_DEFCONFIG_FULL)
	$(Q)$(MKDIR) $(UBOOT_BUILD)
	$(Q)$(MAKE) -C $(UBOOT_SRC) CROSS_COMPILE=$(CROSS_COMPILE) ARCH=$(ARCH) KBUILD_OUTPUT=$(UBOOT_BUILD) $(UBOOT_DEFCONFIG)

uboot-build: $(UBOOT_BUILDCONFIG)
	$(Q)$(MAKE) -C $(UBOOT_SRC) CROSS_COMPILE=$(CROSS_COMPILE) ARCH=$(ARCH) KBUILD_OUTPUT=$(UBOOT_BUILD) -j$(CPUS) all $(UBOOT_DTB_IMAGE)
	$(Q)$(COPYF) $(UBOOT_DTB_IMAGE_FULL) $(CURDIR)

uboot-clean:
	$(Q)$(RMDIR) $(UBOOT_BUILD)

