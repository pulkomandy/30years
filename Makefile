NAME=SHR
DEV=1

SCREENMODE=0

$(NAME).sna: $(NAME).bin..text Makefile effect2.exo logos.exo test2.exo SHR.exo
	createSnapshot $@ \
		-l SHR.bin..text -1 \
		-l SHR.exo 0x1C800 \
		-l $(NAME).bin.C5 0x14000 \
		-l $(NAME).bin.C1 0x1C000 \
		-s GA_RAMCFG 0xC1


$(NAME).bin..text:: ArkosPlayer.o colors.o demoscript.o loader.o logo.o music.o routs.o startpart.o twister.o exomizer.o data.o

data.o:: logos.exo test2.exo effect2.exo

SHR.exo: twistq.scr SHR.bin..text Makefile
	cp twistq.scr.noh zero.tmp 
	dd if=SHR.bin..text bs=1 skip=128 count=60 conv=notrunc of=zero.tmp
	exoraw -o $@ zero.tmp
	rm zero.tmp

include build/cpc.mk
