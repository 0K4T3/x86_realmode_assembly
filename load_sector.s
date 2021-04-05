	ORG 0x7c00
	
entry:
	mov si, stage_1_msg
	call puts
	mov ah, 0x02
	mov al, 1
	mov cx, 0x0002
	mov dh, 0x00
	mov dl, 0
	mov bx, 0x7c00 + 512
	int 0x13
	jmp stage_2

stage_1_msg:
	db "Hello from stage 1!", 0x0a, 0x0d, 0
	
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

	times 510 - ($ - $$) db 0x00
	db 0x55, 0xaa

stage_2:
	mov si, stage_2_msg
	call puts

stage_2_msg:
	db "Hello from stage 2!", 0x0a, 0x0d, 0
