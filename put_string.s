	ORG 0x7C00

entry:
	mov si, str
	jmp puts_start

puts_start:
	mov ah, 0x0E
	mov bx, 0x0000
	
putc:
	lodsb
	cmp al, 0
	je putc_done
	int 0x10
	jmp putc
	
putc_done:
	hlt
	

str:
	db "Hello, World!", 0x0A, 0x0D, 0
	
times 510 - ($ - $$) db 0x00
db 0x55, 0xAA
