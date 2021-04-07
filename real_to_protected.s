	ORG 0x7c00

ALIGN 4, db 0	
GDT:
	dq 0x00_0000_000000_0000
	.cs:	dq 0x00_cf9a_000000_ffff
	.ds:	dq 0x00_cf92_000000_ffff
	.gdt_end:	

GDTR:
	dw GDT.gdt_end - GDT - 1
	dd GDTR

IDTR:
	dw 0
	dd 0

to_protected:	
	cli
	lgdt [GDTR]
	lidt [IDTR]
	mov eax, cr0
	or ax, 1
	mov cr0, eax
	jmp $ + 2

	times 510 - ($ - $$) db 0x00
	db 0x55, 0xaa
