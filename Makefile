ifeq ($(strip $(DEVKITARM)),)
$(error "Please set DEVKITARM in your environment. export DEVKITARM=<path to>devkitARM")
endif

include $(DEVKITARM)/base_rules

all: rop.dat LoadCode.dat

%.dat: %.elf
	@$(OBJCOPY) -O binary $^ $@
%.elf: %.S
	@$(CC) -c -o $@ $< $(ASFLAGS)

bin2utf8:
	gcc *.c -o bin2utf8.exe -std=c99

.PHONY: clean
clean:
	@rm -rf *.elf *.dat
