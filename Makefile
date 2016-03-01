ifndef O
O = .
endif

ifeq ($(strip $(DEVKITARM)),)
$(error "Please set DEVKITARM in your environment. export DEVKITARM=<path to>devkitARM")
endif

include $(DEVKITARM)/base_rules

all: $(addprefix $(O)/,index.html compat.html	\
	rop.dat LoadCode.dat LoadCodeMset.dat CreateDir.dat)

%.dat: %.elf
	@$(OBJCOPY) -O binary $^ $@
$(O)/%.elf: %.S
	@$(CC) -c -o $@ $< $(ASFLAGS)

$(O)/bin2utf8:
	@gcc *.c -o $(O)/bin2utf8.exe -std=c99

$(O)/%.utf8: $(O)/%.dat $(O)/bin2utf8
	@$(O)/bin2utf8.exe $< >$@

define makepayload
	@echo "generating $(2) ROP"
	@make -s $(O)/LoadCode.dat ASFLAGS="-D$(2) -DSPIDER_ARM_CODE_OFFSET=$(3) -D$(4)"
	@make -s $(O)/LoadCode.utf8
	@sed -e "/$(1)'/{rLoadCode.utf8" -e "N}" -i $(5)
	@sed "/$(1)'/s/\(.*\)\(\t\{3\}.*:'\)/\2\1/" -i $(5)
	@rm $(O)/LoadCode.dat
	@rm $(O)/LoadCode.utf8
endef

$(O)/index.html: index.html.template $(O)/bin2utf8
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
	
$(O)/compat.html: index.html.template $(O)/bin2utf8
	@cp -f $< $@
	$(call makepayload,17498,SPIDER_4X,0,SPIDER_DG,$@)
	$(call makepayload,17538C45,SPIDER_45_CN,0,SPIDER_DG,$@)
	$(call makepayload,17538C42,SPIDER_42_CN,0,SPIDER_DG,$@)
	$(call makepayload,17538K,SPIDER_4X_KR,0,SPIDER_DG,$@)
	$(call makepayload,17538T,SPIDER_4X_TW,0,SPIDER_DG,$@)

define makebigpayload
	@echo "generating $(2) ROP"
	@./bin2utf8.exe $(1).rop > $(O)/rop.utf8
	@sed -e "/$(1)'/{rrop.utf8" -e "N}" -i $(5)
	@sed "/$(1)'/s/\(.*\)\(\t\{3\}.*:'\)/\2\1/" -i $(5)
	@rm rop.utf8
endef

$(O)/big.html: $(O)/index.html.template $(O)/bin2utf8
	@cp -f $< $@
	$(call makebigpayload,17498,SPIDER_4X,0,NO_SPIDER_DG,$@)
	$(call makebigpayload,17538C45,SPIDER_45_CN,0,NO_SPIDER_DG,$@)
	$(call makebigpayload,17538C42,SPIDER_42_CN,0,NO_SPIDER_DG,$@)
	$(call makebigpayload,17538K,SPIDER_4X_KR,0,NO_SPIDER_DG,$@)
	$(call makebigpayload,17538T,SPIDER_4X_TW,0,NO_SPIDER_DG,$@)
	$(call makebigpayload,17552,SPIDER_5X,0,NO_SPIDER_DG,$@)
	$(call makebigpayload,17552C,SPIDER_5X_CN,0,NO_SPIDER_DG,$@)
	$(call makebigpayload,17552K,SPIDER_5X_KR,0,NO_SPIDER_DG,$@)
	$(call makebigpayload,17552T,SPIDER_5X_TW,0,NO_SPIDER_DG,$@)
	$(call makebigpayload,17567,SPIDER_9X,0,NO_SPIDER_DG,$@)
	$(call makebigpayload,17567C,SPIDER_9X_CN,0,NO_SPIDER_DG,$@)
	$(call makebigpayload,17567K,SPIDER_9X_KR,0,NO_SPIDER_DG,$@)
	$(call makebigpayload,17567T,SPIDER_9X_TW,0,NO_SPIDER_DG,$@)

define makedatpayload
	@echo "generating $(2) ROP"
	@make -s $(O)/DownloadCode.dat ASFLAGS="-D$(2) -DSPIDER_ARM_CODE_OFFSET=$(3) -D$(4)"
	@mv DownloadCode.dat $(1).dat
endef

$(O)/datpayload: $(O)/download.html.template
	$(call makedatpayload,17498,SPIDER_4X,0,NO_SPIDER_DG)
	$(call makedatpayload,17538C45,SPIDER_45_CN,0,NO_SPIDER_DG)
	$(call makedatpayload,17538C42,SPIDER_42_CN,0,NO_SPIDER_DG)
	$(call makedatpayload,17538K,SPIDER_4X_KR,0,NO_SPIDER_DG)
	$(call makedatpayload,17538T,SPIDER_4X_TW,0,NO_SPIDER_DG)
	$(call makedatpayload,17552,SPIDER_5X,0,NO_SPIDER_DG)
	$(call makedatpayload,17552C,SPIDER_5X_CN,0,NO_SPIDER_DG)
	$(call makedatpayload,17552K,SPIDER_5X_KR,0,NO_SPIDER_DG)
	$(call makedatpayload,17552T,SPIDER_5X_TW,0,NO_SPIDER_DG)
	$(call makedatpayload,17567,SPIDER_9X,0,NO_SPIDER_DG)
	$(call makedatpayload,17567C,SPIDER_9X_CN,0,NO_SPIDER_DG)
	$(call makedatpayload,17567K,SPIDER_9X_KR,0,NO_SPIDER_DG)
	$(call makedatpayload,17567T,SPIDER_9X_TW,0,NO_SPIDER_DG)
	@cp -f $< download.html

$(O)/datpayloadcompat: $(O)/download.html.template
	$(call makedatpayload,17498,SPIDER_4X,0,SPIDER_DG)
	$(call makedatpayload,17538C45,SPIDER_45_CN,0,SPIDER_DG)
	$(call makedatpayload,17538C42,SPIDER_42_CN,0,SPIDER_DG)
	$(call makedatpayload,17538K,SPIDER_4X_KR,0,SPIDER_DG)
	$(call makedatpayload,17538T,SPIDER_4X_TW,0,SPIDER_DG)
	@cp -f $< download.html

.PHONY: clean
clean:
	@rm -rf $(addprefix $(O)/,*.elf *.dat *.rop *.exe *.utf8 *.html)
