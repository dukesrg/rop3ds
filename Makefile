ifeq ($(strip $(DEVKITARM)),)
$(error "Please set DEVKITARM in your environment. export DEVKITARM=<path to>devkitARM")
endif

include $(DEVKITARM)/base_rules

all: index.html rop.dat LoadCode.dat

%.dat: %.elf
	@$(OBJCOPY) -O binary $^ $@
%.elf: %.S
	@$(CC) -c -o $@ $< $(ASFLAGS)

bin2utf8:
	@gcc *.c -o bin2utf8.exe -std=c99

%.utf8: %.dat bin2utf8
	@bin2utf8.exe $< >$@

%.html: %.html.template bin2utf8
	@cp -f $< $@
	
	@make LoadCode.dat ASFLAGS="-DSPIDER_4X -DSPIDER_ARM_CODE_OFFSET=0x120A0"
	@make LoadCode.utf8
	@sed -e "/17498'/{rLoadCode.utf8" -e "a\n" -e "}" -i $@
	@sed -e "/17498'/{N" -e "s/\n//" -e "s/\(:'\).*\(',\{0,1\}\)\(.*\)/\1\3\2/}" -i $@
	@rm LoadCode.dat
	@rm LoadCode.utf8
	
	@make LoadCode.dat ASFLAGS="-DSPIDER_42_CN -DSPIDER_ARM_CODE_OFFSET=0x1E0A0"
	@make LoadCode.utf8
	@sed -e "/17538C'/{rLoadCode.utf8" -e "a\n" -e "}" -i $@
	@sed -e "/17538C'/{N" -e "s/\n//" -e "s/\(:'\).*\(',\{0,1\}\)\(.*\)/\1\3\2/}" -i $@
	@rm LoadCode.dat
	@rm LoadCode.utf8

#	@make LoadCode.dat ASFLAGS="-DSPIDER_45_CN -DSPIDER_ARM_CODE_OFFSET=0x220A0"
#	@make LoadCode.utf8
#	@sed -e "/17538C'/{rLoadCode.utf8" -e "a\n" -e "}" -i $@
#	@sed -e "/17538C'/{N" -e "s/\n//" -e "s/\(:'\).*\(',\{0,1\}\)\(.*\)/\1\3\2/}" -i $@
#	@rm LoadCode.dat
#	@rm LoadCode.utf8

	@make LoadCode.dat ASFLAGS="-DSPIDER_4X_KR -DSPIDER_ARM_CODE_OFFSET=0x2E0A0"
	@make LoadCode.utf8
	@sed -e "/17538K'/{rLoadCode.utf8" -e "a\n" -e "}" -i $@
	@sed -e "/17538K'/{N" -e "s/\n//" -e "s/\(:'\).*\(',\{0,1\}\)\(.*\)/\1\3\2/}" -i $@
	@rm LoadCode.dat
	@rm LoadCode.utf8

	@make LoadCode.dat ASFLAGS="-DSPIDER_4X_TW -DSPIDER_ARM_CODE_OFFSET=0x3A0A0"
	@make LoadCode.utf8
	@sed -e "/17538T'/{rLoadCode.utf8" -e "a\n" -e "}" -i $@
	@sed -e "/17538T'/{N" -e "s/\n//" -e "s/\(:'\).*\(',\{0,1\}\)\(.*\)/\1\3\2/}" -i $@
	@rm LoadCode.dat
	@rm LoadCode.utf8

	@make LoadCode.dat ASFLAGS="-DSPIDER_5X -DSPIDER_ARM_CODE_OFFSET=0x160A0"
	@make LoadCode.utf8
	@sed -e "/17552'/{rLoadCode.utf8" -e "a\n" -e "}" -i $@
	@sed -e "/17552'/{N" -e "s/\n//" -e "s/\(:'\).*\(',\{0,1\}\)\(.*\)/\1\3\2/}" -i $@
	@rm LoadCode.dat
	@rm LoadCode.utf8

	@make LoadCode.dat ASFLAGS="-DSPIDER_5X_CN -DSPIDER_ARM_CODE_OFFSET=0x260A0"
	@make LoadCode.utf8
	@sed -e "/17552C'/{rLoadCode.utf8" -e "a\n" -e "}" -i $@
	@sed -e "/17552C'/{N" -e "s/\n//" -e "s/\(:'\).*\(',\{0,1\}\)\(.*\)/\1\3\2/}" -i $@
	@rm LoadCode.dat
	@rm LoadCode.utf8

	@make LoadCode.dat ASFLAGS="-DSPIDER_5X_KR -DSPIDER_ARM_CODE_OFFSET=0x320A0"
	@make LoadCode.utf8
	@sed -e "/17552K'/{rLoadCode.utf8" -e "a\n" -e "}" -i $@
	@sed -e "/17552K'/{N" -e "s/\n//" -e "s/\(:'\).*\(',\{0,1\}\)\(.*\)/\1\3\2/}" -i $@
	@rm LoadCode.dat
	@rm LoadCode.utf8

	@make LoadCode.dat ASFLAGS="-DSPIDER_5X_TW -DSPIDER_ARM_CODE_OFFSET=0x3E0A0"
	@make LoadCode.utf8
	@sed -e "/17552T'/{rLoadCode.utf8" -e "a\n" -e "}" -i $@
	@sed -e "/17552T'/{N" -e "s/\n//" -e "s/\(:'\).*\(',\{0,1\}\)\(.*\)/\1\3\2/}" -i $@
	@rm LoadCode.dat
	@rm LoadCode.utf8

	@make LoadCode.dat ASFLAGS="-DSPIDER_9X -DSPIDER_ARM_CODE_OFFSET=0x1A0A0"
	@make LoadCode.utf8
	@sed -e "/17567'/{rLoadCode.utf8" -e "a\n" -e "}" -i $@
	@sed -e "/17567'/{N" -e "s/\n//" -e "s/\(:'\).*\(',\{0,1\}\)\(.*\)/\1\3\2/}" -i $@
	@rm LoadCode.dat
	@rm LoadCode.utf8

	@make LoadCode.dat ASFLAGS="-DSPIDER_9X_CN -DSPIDER_ARM_CODE_OFFSET=0x2A0A0"
	@make LoadCode.utf8
	@sed -e "/17567C'/{rLoadCode.utf8" -e "a\n" -e "}" -i $@
	@sed -e "/17567C'/{N" -e "s/\n//" -e "s/\(:'\).*\(',\{0,1\}\)\(.*\)/\1\3\2/}" -i $@
	@rm LoadCode.dat
	@rm LoadCode.utf8

	@make LoadCode.dat ASFLAGS="-DSPIDER_9X_KR -DSPIDER_ARM_CODE_OFFSET=0x360A0"
	@make LoadCode.utf8
	@sed -e "/17567K'/{rLoadCode.utf8" -e "a\n" -e "}" -i $@
	@sed -e "/17567K'/{N" -e "s/\n//" -e "s/\(:'\).*\(',\{0,1\}\)\(.*\)/\1\3\2/}" -i $@
	@rm LoadCode.dat
	@rm LoadCode.utf8

	@make LoadCode.dat ASFLAGS="-DSPIDER_9X_TW -DSPIDER_ARM_CODE_OFFSET=0x420A0"
	@make LoadCode.utf8
	@sed -e "/17567T'/{rLoadCode.utf8" -e "a\n" -e "}" -i $@
	@sed -e "/17567T'/{N" -e "s/\n//" -e "s/\(:'\).*\(',\{0,1\}\)\(.*\)/\1\3\2/}" -i $@
	@rm LoadCode.dat
	@rm LoadCode.utf8

.PHONY: clean
clean:
	@rm -rf *.elf *.dat *.rop *.exe *.utf8 *.html
