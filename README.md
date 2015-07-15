Files in project
-----
rop.h - Gadgets for various ROP versions

rop.S - Stage2 ROP loader example

LoadCode.S - LoadCode spider ROP example
How to build
-----
make SPIDER_9 - Build for spider version 1.7567 (fw9)
make ASFLAGS="-DARMCODE=arm.bin -DSPIDER_9" - Build for spider version 1.7567 (fw9) and include arm.bin as ARM payload
