SECTIONS {
	.text 0x0000 : {
		/* Central memory holds all data in default section .text. */
		*(.text)
	}

	/* Banks. They are always connected at &4000 (handling other cases is possible,
	 * but not easy). We use page << 16 | address, which still allows symbols
	 * referring to the banks to point to the right place (the extra bits will be
	 * ignored there).
	 */
	C4 0x4000 : { *(C4) }
	ASSERT(. < 0x8000, "Bank C4 overflow" )

	C5 0x4000 : { 
		music.o(C5) /* Music MUST be in 0x4000, it's not relocatable... */
		*(C5) 
	}
	ASSERT(. < 0x8000, "Bank C5 overflow" )

	C6 0x4000 : { *(C6) }
	ASSERT(. < 0x8000, "Bank C6 overflow" )

	/*
	C7 0x4000 : {
		*(C7)
	}
	ASSERT(. < 0x6000, "Bank C7 overflow" )
	*/

	C1 0xC000 : {
		*(C1)
	}
	ASSERT(. < 0xCF00, "Bank C1 overflow" )

}
