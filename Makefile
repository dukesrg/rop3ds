ifeq ($(strip $(DEVKITARM)),)
$(error "Please set DEVKITARM in your environment. export DEVKITARM=<path to>devkitARM")
endif

include $(DEVKITARM)/base_rules

versions := mset_4 mset_4_dg mset_6 spider_4 spider_4_cn spider_4_kr spider_4_tw spider_5 spider_5_cn spider_5_kr spider_5_tw spider_9 spider_9_cn spider_9_kr spider_9_tw

mset_4: ASFLAGS+=-DMSET_4
mset_4_dg: ASFLAGS+=-DMSET_4_DG
mset_6: ASFLAGS+=-DMSET_6
spider_4: ASFLAGS+=-DSPIDER_4
spider_4_cn: ASFLAGS+=-DSPIDER_4_CN
spider_4_kr: ASFLAGS+=-DSPIDER_4_KR
spider_4_tw: ASFLAGS+=-DSPIDER_4_TW
spider_5: ASFLAGS+=-DSPIDER_5
spider_5_cn: ASFLAGS+=-DSPIDER_5_CN
spider_5_kr: ASFLAGS+=-DSPIDER_5_KR
spider_5_tw: ASFLAGS+=-DSPIDER_5_TW
spider_9: ASFLAGS+=-DSPIDER_9
spider_9_cn: ASFLAGS+=-DSPIDER_9_CN
spider_9_kr: ASFLAGS+=-DSPIDER_9_KR
spider_9_tw: ASFLAGS+=-DSPIDER_9_TW

all: rop.dat LoadCode.dat 

$(versions): all

%.elf: %.S
	@$(CC) -c -o $@ $< $(ASFLAGS)
%.dat: %.elf
	@$(OBJCOPY) -O binary $^ $@
.PHONY: clean
clean:
	@rm -rf *.elf *.dat
