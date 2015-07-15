Files in project
-----
rop.h - gadget collection for various ROP versions

LoadCode.S - 1st stage Spider ARM code loader example

rop.S - 2nd stage ARM code loader example

How to build
-----
make loadcode ASFLAGS="-DSPIDER_ROP_LOC -DSPIDER_9" - build Spider 1st stage for version 1.7567 (fw9)

make ASFLAGS="-DARMCODE=arm.bin -DSPIDER_9" - build for spider version 1.7567 (fw9) and include arm.bin as ARM payload
Available option and region support status
-----
ARMCODE=file - include file conent as ARM payload (for rpo.S only)
SPIDER_ROP_LOC - force 1st Spider ROP code location
MSET_4X - use MSET 4 gadgets, working
MSET_4X_DG - use MSET 4 downgraded gadgets, not tested
MSET_6X - use MSET 6 gadgets, not tested
SPIDER_4X - use Spider 4 JP/US/UE gadgets, working
SPIDER_4X_CN - use Spider 4 CN gadgets, not supported
SPIDER_4X_TW - use Spider 4 KR gadgets, not tested
SPIDER_4X_KR - use Spider 4 TW gadgets, not tested
SPIDER_5X - use Spider 5-7.0 JP/US/UE gadgets, not tested
SPIDER_5X_CN - use Spider 5-7.0 CN gadgets, not tested
SPIDER_5X_TW - use Spider 5-7.0 KR gadgets, not tested
SPIDER_5X_KR - use Spider 5-7.0 TW gadgets, not tested
SPIDER_9X - use Spider 7.1-9 JP/US/UE gadgets, not tested
SPIDER_9X_CN - use Spider 7.1-9 CN gadgets, not tested
SPIDER_9X_TW - use Spider 7.1-9 KR gadgets, not tested
SPIDER_9X_KR - use Spider 7.1-9 TW gadgets, not tested


