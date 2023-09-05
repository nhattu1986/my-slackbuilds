VERSION         := 0.08
DKMS_ROOT_PATH  := /usr/src/msi_ec-$(VERSION)
KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD ?= $(shell pwd)

obj-m += msi-ec.o
ccflags-y := -std=gnu11 -Wno-declaration-after-statement


all: modules

older-kernel-patch:
	patch -p1 < older-kernel.patch

modules:
	@$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

clean:
	@$(MAKE) -C $(KERNELDIR) M=$(PWD) clean



