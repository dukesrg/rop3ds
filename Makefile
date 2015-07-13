CC=arm-none-eabi-gcc
CFLAGS=-fPIE -fno-zero-initialized-in-bss -std=c99 -mcpu=mpcore -fshort-wchar -O2
ASFLAGS=-nostartfiles -nostdlib
LD=arm-none-eabi-gcc
LDFLAGS=-T linker.x -nodefaultlibs -nostdlib -pie
OBJCOPY=arm-none-eabi-objcopy
OBJCOPYFLAGS=
#DATSIZE=0x300
DATSIZE=0

all: LoadCode.dat rop.dat
MSET_4: ASFLAGS+=-DMSET_4
MSET_4_DG: ASFLAGS+=-DMSET_4_DG
MSET_6: ASFLAGS+=-DMSET_6
SPIDER_4: ASFLAGS+=-DSPIDER_4
SPIDER_4_CN: ASFLAGS+=-DSPIDER_4_CN
SPIDER_4_KR: ASFLAGS+=-DSPIDER_4_KR
SPIDER_4_TW: ASFLAGS+=-DSPIDER_4_TW
SPIDER_5: ASFLAGS+=-DSPIDER_5
SPIDER_5_CN: ASFLAGS+=-DSPIDER_5_CN
SPIDER_5_KR: ASFLAGS+=-DSPIDER_5_KR
SPIDER_5_TW: ASFLAGS+=-DSPIDER_5_TW
SPIDER_9: ASFLAGS+=-DSPIDER_9
SPIDER_9_CN: ASFLAGS+=-DSPIDER_9_CN
SPIDER_9_KR: ASFLAGS+=-DSPIDER_9_KR
SPIDER_9_TW: ASFLAGS+=-DSPIDER_9_TW
MSET_4 MSET_4_DG MSET_6 SPIDER_4 SPIDER_4_CN SPIDER_4_KR SPIDER_4_TW SPIDER_5 SPIDER_5_CN SPIDER_5_KR SPIDER_5_TW SPIDER_9 SPIDER_9_CN SPIDER_9_KR SPIDER_9_TW: all
%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

%.ro: %.S
	$(CC) -c -o $@ $< $(ASFLAGS)

%.elf: %.o
	$(LD) -o $@ $^ $(LDFLAGS)

%.bin: %.elf
	$(OBJCOPY) -O binary $^ $@

%.dat: %.ro
	$(OBJCOPY) --pad-to $(DATSIZE) -O binary $^ $@

.PHONY: clean

clean:
	rm -rf *~ *.o *.elf *.bin *.s *.dat
