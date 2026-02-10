	.arch armv8-a
	.file	"decomment.c"
	.text
	.align	2
	.global	handleNormalState
	.type	handleNormalState, %function
handleNormalState:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L2
	mov	w0, 1
	b	.L3
.L2:
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L4
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 4
	b	.L3
.L4:
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L5
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 6
	b	.L3
.L5:
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 0
.L3:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	handleNormalState, .-handleNormalState
	.align	2
	.global	handleSlashState
	.type	handleSlashState, %function
handleSlashState:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L7
	mov	w0, 32
	bl	putchar
	mov	w0, 2
	b	.L8
.L7:
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L9
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 1
	b	.L8
.L9:
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L10
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 4
	b	.L8
.L10:
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L11
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 6
	b	.L8
.L11:
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L12
	mov	w0, 47
	bl	putchar
	mov	w0, 10
	bl	putchar
	mov	w0, 0
	b	.L8
.L12:
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 0
.L8:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1:
	.size	handleSlashState, .-handleSlashState
	.align	2
	.global	handleInCommentState
	.type	handleInCommentState, %function
handleInCommentState:
.LFB2:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L14
	mov	w0, 3
	b	.L15
.L14:
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L16
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 2
	b	.L15
.L16:
	mov	w0, 2
.L15:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2:
	.size	handleInCommentState, .-handleInCommentState
	.align	2
	.global	handleCommentStarState
	.type	handleCommentStarState, %function
handleCommentStarState:
.LFB3:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L18
	mov	w0, 0
	b	.L19
.L18:
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L20
	mov	w0, 3
	b	.L19
.L20:
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L21
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 2
	b	.L19
.L21:
	mov	w0, 2
.L19:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3:
	.size	handleCommentStarState, .-handleCommentStarState
	.align	2
	.global	handleInStringState
	.type	handleInStringState, %function
handleInStringState:
.LFB4:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L23
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 0
	b	.L24
.L23:
	ldr	w0, [sp, 28]
	cmp	w0, 92
	bne	.L25
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 5
	b	.L24
.L25:
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 4
.L24:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4:
	.size	handleInStringState, .-handleInStringState
	.align	2
	.global	handleStringEscState
	.type	handleStringEscState, %function
handleStringEscState:
.LFB5:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 4
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5:
	.size	handleStringEscState, .-handleStringEscState
	.align	2
	.global	handleInCharState
	.type	handleInCharState, %function
handleInCharState:
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L29
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 0
	b	.L30
.L29:
	ldr	w0, [sp, 28]
	cmp	w0, 92
	bne	.L31
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 7
	b	.L30
.L31:
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 6
.L30:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE6:
	.size	handleInCharState, .-handleInCharState
	.align	2
	.global	handleCharEscState
	.type	handleCharEscState, %function
handleCharEscState:
.LFB7:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 6
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE7:
	.size	handleCharEscState, .-handleCharEscState
	.align	2
	.type	isAccepting, %function
isAccepting:
.LFB8:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	w0, [sp, 12]
	ldr	w0, [sp, 12]
	cmp	w0, 2
	beq	.L35
	ldr	w0, [sp, 12]
	cmp	w0, 3
	beq	.L35
	mov	w0, 1
	b	.L37
.L35:
	mov	w0, 0
.L37:
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE8:
	.size	isAccepting, .-isAccepting
	.section	.rodata
	.align	3
.LC0:
	.string	"Error: line %d: unterminated comment\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB9:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	wzr, [sp, 28]
	mov	w0, 1
	str	w0, [sp, 24]
	str	wzr, [sp, 20]
	b	.L39
.L50:
	ldr	w0, [sp, 28]
	cmp	w0, 7
	beq	.L40
	ldr	w0, [sp, 28]
	cmp	w0, 7
	bhi	.L41
	ldr	w0, [sp, 28]
	cmp	w0, 6
	beq	.L42
	ldr	w0, [sp, 28]
	cmp	w0, 6
	bhi	.L41
	ldr	w0, [sp, 28]
	cmp	w0, 5
	beq	.L43
	ldr	w0, [sp, 28]
	cmp	w0, 5
	bhi	.L41
	ldr	w0, [sp, 28]
	cmp	w0, 4
	beq	.L44
	ldr	w0, [sp, 28]
	cmp	w0, 4
	bhi	.L41
	ldr	w0, [sp, 28]
	cmp	w0, 3
	beq	.L45
	ldr	w0, [sp, 28]
	cmp	w0, 3
	bhi	.L41
	ldr	w0, [sp, 28]
	cmp	w0, 2
	beq	.L46
	ldr	w0, [sp, 28]
	cmp	w0, 2
	bhi	.L41
	ldr	w0, [sp, 28]
	cmp	w0, 0
	beq	.L47
	ldr	w0, [sp, 28]
	cmp	w0, 1
	beq	.L48
	b	.L41
.L47:
	ldr	w0, [sp, 16]
	bl	handleNormalState
	str	w0, [sp, 28]
	b	.L41
.L48:
	ldr	w0, [sp, 16]
	cmp	w0, 42
	bne	.L49
	ldr	w0, [sp, 24]
	str	w0, [sp, 20]
.L49:
	ldr	w0, [sp, 16]
	bl	handleSlashState
	str	w0, [sp, 28]
	b	.L41
.L46:
	ldr	w0, [sp, 16]
	bl	handleInCommentState
	str	w0, [sp, 28]
	b	.L41
.L45:
	ldr	w0, [sp, 16]
	bl	handleCommentStarState
	str	w0, [sp, 28]
	b	.L41
.L44:
	ldr	w0, [sp, 16]
	bl	handleInStringState
	str	w0, [sp, 28]
	b	.L41
.L43:
	ldr	w0, [sp, 16]
	bl	handleStringEscState
	str	w0, [sp, 28]
	b	.L41
.L42:
	ldr	w0, [sp, 16]
	bl	handleInCharState
	str	w0, [sp, 28]
	b	.L41
.L40:
	ldr	w0, [sp, 16]
	bl	handleCharEscState
	str	w0, [sp, 28]
	nop
.L41:
	ldr	w0, [sp, 16]
	cmp	w0, 10
	bne	.L39
	ldr	w0, [sp, 24]
	add	w0, w0, 1
	str	w0, [sp, 24]
.L39:
	bl	getchar
	str	w0, [sp, 16]
	ldr	w0, [sp, 16]
	cmn	w0, #1
	bne	.L50
	ldr	w0, [sp, 28]
	cmp	w0, 1
	bne	.L51
	mov	w0, 47
	bl	putchar
.L51:
	ldr	w0, [sp, 28]
	bl	isAccepting
	cmp	w0, 0
	bne	.L52
	adrp	x0, stderr
	add	x0, x0, :lo12:stderr
	ldr	x3, [x0]
	ldr	w2, [sp, 20]
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	mov	x0, x3
	bl	fprintf
	mov	w0, 1
	b	.L53
.L52:
	mov	w0, 0
.L53:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-11)"
	.section	.note.GNU-stack,"",@progbits
