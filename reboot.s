	ORG 0x7c00
	nn
start:
	mov si, reboot_msg
	call puts

wait_input:
	mov ah, 0x10
	int 0x16

	cmp al, ' '
	jne wait_input

	int 0x19

puts:
	mov ah, 0x0e
	mov bx, 0x0000

putc:
	lodsb
	cmp al, 0
	je puts_done
	int 0x10
	jmp putc

puts_done:
	ret

reboot_msg:
	db "Press any key to reboot...", 0x0a, 0x0d, 0

times 510 - ($ - $$) db 0x00
db 0x55, 0xaa
