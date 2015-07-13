	.arm
	.text

#include "rop.h"

#define BUFFER_LOC 0x18410000

	.global	_start
@---------------------------------------------------------------------------------
_start:
	rop_memcpy(BUFFER_LOC, arm_code, arm_code_end-arm_code)
	rop_flush_data_cache(HANDLE_PTR, KPROCESS_HANDLE, BUFFER_LOC, arm_code_end-arm_code)
	rop_gx_command(gxCommand)
	rop_sleep(1000000000)
	rop_jump_arm
gxCommand:
	rop_gx_texture_copy(BUFFER_LOC, CODE_TARGET, arm_code_end-arm_code)
arm_code:
#ifdef ARMCODE
#define S_(x)	#x
#define S(x)	S_(x)
	.incbin S(ARMCODE)
#endif
arm_code_end:
