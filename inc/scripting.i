
; Structure of a frame in our display list
	struct frame
crtcoff	DW 0 ; Pointer to table of CRTC offsets for each character line
colors	DW 0 ; Pointer to table of colors (17 colors per line)
length	DB 0 ; Number of VBLs before moving to next frame
	endstruct

