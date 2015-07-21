ifeq ($(strip $(DEVKITARM)),)
$(error "Please set DEVKITARM in your environment. export DEVKITARM=<path to>devkitARM")
endif

include $(DEVKITARM)/base_rules

all: index.html rop.dat LoadCode.dat LoadCodeMset.dat

%.dat: %.elf
	@$(OBJCOPY) -O binary $^ $@
%.elf: %.S
	@$(CC) -c -o $@ $< $(ASFLAGS)

bin2utf8:
	@gcc *.c -o bin2utf8.exe -std=c99

%.utf8: %.dat bin2utf8
	@./bin2utf8.exe $< >$@

define makepayload
	@echo "generating $(2) ROP"
	@make -s LoadCode.dat ASFLAGS="-D$(2) -DSPIDER_ARM_CODE_OFFSET=$(3)"
	@make -s LoadCode.utf8
	@sed -e "/$(4)'/{rLoadCode.utf8" -e "N}" -i $(1)
	@sed "/$(4)'/s/\(.*\)\(\t\{3\}.*:'\)/\2\1/" -i $(1)
	@rm LoadCode.dat
	@rm LoadCode.utf8
endef

%.html: index.html.template bin2utf8
	@cp -f $< $@
	$(call makepayload,$@,SPIDER_4X,0x12000,17498)
	$(call makepayload,$@,SPIDER_45_CN,0x12000,17538C45)
	$(call makepayload,$@,SPIDER_42_CN,0x12000,17538C42)
	$(call makepayload,$@,SPIDER_4X_KR,0x12000,17538K)
	$(call makepayload,$@,SPIDER_4X_TW,0x12000,17538T)
	$(call makepayload,$@,SPIDER_5X,0x12000,17552)
	$(call makepayload,$@,SPIDER_5X_CN,0x12000,17552C)
	$(call makepayload,$@,SPIDER_5X_KR,0x12000,17552K)
	$(call makepayload,$@,SPIDER_5X_TW,0x12000,17552T)
	$(call makepayload,$@,SPIDER_9X,0x12000,17567)
	$(call makepayload,$@,SPIDER_9X_CN,0x12000,17567C)
	$(call makepayload,$@,SPIDER_9X_KR,0x12000,17567K)
	$(call makepayload,$@,SPIDER_9X_TW,0x12000,17567T)

define makedatpayload
	@echo "generating $(1) ROP"
	@make -s LoadCode.dat ASFLAGS="-D$(1) -DSPIDER_ARM_CODE_OFFSET=$(2)"
	@mv LoadCode.dat $(3).dat
endef

datpayload: download.html.template
	$(call makedatpayload,SPIDER_4X,0x120A0,17498)
	$(call makedatpayload,SPIDER_45_CN,0x220A0,17538C45)
	$(call makedatpayload,SPIDER_42_CN,0x1E0A0,17538C42)
	$(call makedatpayload,SPIDER_4X_KR,0x2E0A0,17538K)
	$(call makedatpayload,SPIDER_4X_TW,0x3A0A0,17538T)
	$(call makedatpayload,SPIDER_5X,0x160A0,17552)
	$(call makedatpayload,SPIDER_5X_CN,0x260A0,17552C)
	$(call makedatpayload,SPIDER_5X_KR,0x320A0,17552K)
	$(call makedatpayload,SPIDER_5X_TW,0x3E0A0,17552T)
	$(call makedatpayload,SPIDER_9X,0x1A0A0,17567)
	$(call makedatpayload,SPIDER_9X_CN,0x2A0A0,17567C)
	$(call makedatpayload,SPIDER_9X_KR,0x360A0,17567K)
	$(call makedatpayload,SPIDER_9X_TW,0x420A0,17567T)
	@cp -f $< download.html

.PHONY: clean
clean:
	@rm -rf *.elf *.dat *.rop *.exe *.utf8 *.html
