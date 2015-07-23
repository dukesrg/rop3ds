ifeq ($(strip $(DEVKITARM)),)
$(error "Please set DEVKITARM in your environment. export DEVKITARM=<path to>devkitARM")
endif

include $(DEVKITARM)/base_rules

all: index.html compat.html rop.dat LoadCode.dat LoadCodeMset.dat

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
	@make -s LoadCode.dat ASFLAGS="-D$(2) -DSPIDER_ARM_CODE_OFFSET=$(3) -D$(4)"
	@make -s LoadCode.utf8
	@sed -e "/$(1)'/{rLoadCode.utf8" -e "N}" -i $(5)
	@sed "/$(1)'/s/\(.*\)\(\t\{3\}.*:'\)/\2\1/" -i $(5)
	@rm LoadCode.dat
	@rm LoadCode.utf8
endef

index.html: index.html.template bin2utf8
	@cp -f $< $@
	$(call makepayload,17498,SPIDER_4X,0,NO_SPIDER_DG,$@)
	$(call makepayload,17538C45,SPIDER_45_CN,0,NO_SPIDER_DG,$@)
	$(call makepayload,17538C42,SPIDER_42_CN,0,NO_SPIDER_DG,$@)
	$(call makepayload,17538K,SPIDER_4X_KR,0,NO_SPIDER_DG,$@)
	$(call makepayload,17538T,SPIDER_4X_TW,0,NO_SPIDER_DG,$@)
	$(call makepayload,17552,SPIDER_5X,0,NO_SPIDER_DG,$@)
	$(call makepayload,17552C,SPIDER_5X_CN,0,NO_SPIDER_DG,$@)
	$(call makepayload,17552K,SPIDER_5X_KR,0,NO_SPIDER_DG,$@)
	$(call makepayload,17552T,SPIDER_5X_TW,0,NO_SPIDER_DG,$@)
	$(call makepayload,17567,SPIDER_9X,0,NO_SPIDER_DG,$@)
	$(call makepayload,17567C,SPIDER_9X_CN,0,NO_SPIDER_DG,$@)
	$(call makepayload,17567K,SPIDER_9X_KR,0,NO_SPIDER_DG,$@)
	$(call makepayload,17567T,SPIDER_9X_TW,0,NO_SPIDER_DG,$@)
	
compat.html: index.html.template bin2utf8
	@cp -f $< $@
	$(call makepayload,17498,SPIDER_4X,0,SPIDER_DG,$@)
	$(call makepayload,17538C45,SPIDER_45_CN,0,SPIDER_DG,$@)
	$(call makepayload,17538C42,SPIDER_42_CN,0,SPIDER_DG,$@)
	$(call makepayload,17538K,SPIDER_4X_KR,0,SPIDER_DG,$@)
	$(call makepayload,17538T,SPIDER_4X_TW,0,SPIDER_DG,$@)

define makedatpayload
	@echo "generating $(2) ROP"
	@make -s LoadCode.dat ASFLAGS="-D$(2) -DSPIDER_ARM_CODE_OFFSET=$(3) -D(4)"
	@mv LoadCode.dat $(1).dat
endef

datpayload: download.html.template
	$(call makedatpayload,17498,SPIDER_4X,NO_SPIDER_DG,0)
	$(call makedatpayload,17538C45,SPIDER_45_CN,NO_SPIDER_DG,0)
	$(call makedatpayload,17538C42,SPIDER_42_CN,NO_SPIDER_DG,0)
	$(call makedatpayload,17538K,SPIDER_4X_KR,NO_SPIDER_DG,0)
	$(call makedatpayload,17538T,SPIDER_4X_TW,NO_SPIDER_DG,0)
	$(call makedatpayload,17552,SPIDER_5X,NO_SPIDER_DG,0)
	$(call makedatpayload,17552C,SPIDER_5X_CN,NO_SPIDER_DG,0)
	$(call makedatpayload,17552K,SPIDER_5X_KR,NO_SPIDER_DG,0)
	$(call makedatpayload,17552T,SPIDER_5X_TW,NO_SPIDER_DG,0)
	$(call makedatpayload,17567,SPIDER_9X,NO_SPIDER_DG,0)
	$(call makedatpayload,17567C,SPIDER_9X_CN,NO_SPIDER_DG,0)
	$(call makedatpayload,17567K,SPIDER_9X_KR,NO_SPIDER_DG,0)
	$(call makedatpayload,17567T,SPIDER_9X_TW,NO_SPIDER_DG,0)
	@cp -f $< download.html

datpayloadcompat: download.html.template
	$(call makedatpayload,17498,SPIDER_4X,SPIDER_DG,0)
	$(call makedatpayload,17538C45,SPIDER_45_CN,SPIDER_DG,0)
	$(call makedatpayload,17538C42,SPIDER_42_CN,SPIDER_DG,0)
	$(call makedatpayload,17538K,SPIDER_4X_KR,SPIDER_DG,0)
	$(call makedatpayload,17538T,SPIDER_4X_TW,SPIDER_DG,0)
	@cp -f $< download.html

.PHONY: clean
clean:
	@rm -rf *.elf *.dat *.rop *.exe *.utf8 *.html
