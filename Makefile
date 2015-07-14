ifeq ($(strip $(DEVKITARM)),)
$(error "Please set DEVKITARM in your environment. export DEVKITARM=<path to>devkitARM")
endif

include $(DEVKITARM)/base_rules

all: rop.dat
loadcode: LoadCode.dat 

%.elf: %.S
	@$(CC) -c -o $@ $< $(ASFLAGS)
%.dat: %.elf
	@$(OBJCOPY) -O binary $^ $@
.PHONY: clean
clean:
	@rm -rf *.elf *.dat
