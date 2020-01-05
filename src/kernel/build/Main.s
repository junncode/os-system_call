	.file	"Main.c"
	.text
.Ltext0:
	.comm	Glob_x,4,4
	.comm	Glob_y,4,4
	.comm	ata0_blk_dev,20,4
	.comm	ata1_blk_dev,20,4
	.local	filesys
	.comm	filesys,44,32
	.comm	inode_tbl,16384,32
	.comm	ata,56,32
	.globl	VERSION
	.section	.rodata
.LC0:
	.string	"0.1.07"
	.data
	.align 4
	.type	VERSION, @object
	.size	VERSION, 4
VERSION:
	.long	.LC0
	.globl	AUTHOR
	.section	.rodata
.LC1:
	.string	"OSLAB"
	.data
	.align 4
	.type	AUTHOR, @object
	.size	AUTHOR, 4
AUTHOR:
	.long	.LC1
	.globl	MODIFIER
	.section	.rodata
.LC2:
	.string	"You"
	.data
	.align 4
	.type	MODIFIER, @object
	.size	MODIFIER, 4
MODIFIER:
	.long	.LC2
	.text
	.globl	ssuos_main
	.type	ssuos_main, @function
ssuos_main:
.LFB3:
	.file 1 "arch/Main.c"
	.loc 1 29 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 1 30 0
	call	main_init
	.loc 1 32 0
	subl	$12, %esp
	pushl	$0
	call	idle
	addl	$16, %esp
	.loc 1 34 0
	nop
	.loc 1 35 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	ssuos_main, .-ssuos_main
	.section	.rodata
.LC3:
	.string	"Memory Detecting\n"
.LC4:
	.string	"%s"
.LC5:
	.string	"-Memory size = %u Kbytes\n"
.LC6:
	.string	"PIT Intialization\n"
.LC7:
	.string	"System call Intialization\n"
.LC8:
	.string	"Interrupt Initialization\n"
.LC9:
	.string	"%sPalloc Initialization\n"
.LC10:
	.string	"Paging Initialization\n"
.LC11:
	.string	"Process Intialization\n"
.LC12:
	.string	"ATA device Intialization\n"
	.align 4
.LC13:
	.string	"========== initialization complete ==========\n\n"
	.text
	.globl	main_init
	.type	main_init, @function
main_init:
.LFB4:
	.loc 1 38 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 1 39 0
	call	intr_disable
	.loc 1 42 0
	call	init_console
	.loc 1 44 0
	call	print_contributors
	.loc 1 46 0
	call	detect_mem
	.loc 1 47 0
	subl	$8, %esp
	pushl	$.LC3
	pushl	$.LC4
	call	printk
	addl	$16, %esp
	.loc 1 48 0
	call	mem_size
	shrl	$10, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC5
	call	printk
	addl	$16, %esp
	.loc 1 50 0
	call	init_pit
	.loc 1 51 0
	subl	$8, %esp
	pushl	$.LC6
	pushl	$.LC4
	call	printk
	addl	$16, %esp
	.loc 1 53 0
	call	init_syscall
	.loc 1 54 0
	subl	$8, %esp
	pushl	$.LC7
	pushl	$.LC4
	call	printk
	addl	$16, %esp
	.loc 1 56 0
	call	init_intr
	.loc 1 57 0
	subl	$8, %esp
	pushl	$.LC8
	pushl	$.LC4
	call	printk
	addl	$16, %esp
	.loc 1 59 0
	call	init_kbd
	.loc 1 61 0
	call	init_palloc
	.loc 1 62 0
	subl	$12, %esp
	pushl	$.LC9
	call	printk
	addl	$16, %esp
	.loc 1 64 0
	call	init_paging
	.loc 1 65 0
	subl	$8, %esp
	pushl	$.LC10
	pushl	$.LC4
	call	printk
	addl	$16, %esp
	.loc 1 67 0
	call	init_proc
	.loc 1 68 0
	subl	$8, %esp
	pushl	$.LC11
	pushl	$.LC4
	call	printk
	addl	$16, %esp
	.loc 1 70 0
	call	intr_enable
	.loc 1 72 0
	call	init_ata
	.loc 1 73 0
	subl	$8, %esp
	pushl	$.LC12
	pushl	$.LC4
	call	printk
	addl	$16, %esp
	.loc 1 75 0
	call	init_filesystem
	.loc 1 77 0
	subl	$12, %esp
	pushl	$.LC13
	call	printk
	addl	$16, %esp
	.loc 1 81 0
	call	refreshScreen
	.loc 1 83 0
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	main_init, .-main_init
	.section	.rodata
.LC14:
	.string	"SSUOS main start!!!!\n"
	.align 4
.LC15:
	.string	"          ______    ______   __    __         ______    ______  \n"
	.align 4
.LC16:
	.string	"         /      \\  /      \\ /  |  /  |       /      \\  /      \\ \n"
	.align 4
.LC17:
	.string	"        /$$$$$$  |/$$$$$$  |$$ |  $$ |      /$$$$$$  |/$$$$$$  |\n"
	.align 4
.LC18:
	.string	"        $$ \\__$$/ $$ \\__$$/ $$ |  $$ |      $$ |  $$ |$$ \\__$$/ \n"
	.align 4
.LC19:
	.string	"        $$      \\ $$      \\ $$ |  $$ |      $$ |  $$ |$$      \\ \n"
	.align 4
.LC20:
	.string	"         $$$$$$  | $$$$$$  |$$ |  $$ |      $$ |  $$ | $$$$$$  |\n"
	.align 4
.LC21:
	.string	"        /  \\__$$ |/  \\__$$ |$$ \\__$$ |      $$ \\__$$ |/  \\__$$ |\n"
	.align 4
.LC22:
	.string	"        $$    $$/ $$    $$/ $$    $$/       $$    $$/ $$    $$/ \n"
	.align 4
.LC23:
	.string	"         $$$$$$/   $$$$$$/   $$$$$$/         $$$$$$/   $$$$$$/  \n"
.LC24:
	.string	"\n"
	.align 4
.LC25:
	.string	"****************Made by OSLAB in SoongSil University*********************\n"
	.align 4
.LC26:
	.string	"contributors : Yunkyu Lee  , Minwoo Jang  , Sanghun Choi , Eunseok Choi\n"
	.align 4
.LC27:
	.string	"               Hyunho Ji   , Giwook Kang  , Kisu Kim     , Seonguk Lee \n"
	.align 4
.LC28:
	.string	"               Gibeom Byeon, Jeonghwan Lee, Kyoungmin Kim, Myungjoon Shon\n"
	.align 4
.LC29:
	.string	"               Hansol Lee  , Jinwoo Lee   , Mhanwoo Heo, Yongmin Kim, Jeongwoo Choi\n"
	.align 4
.LC30:
	.string	"************************  Professor. Jiman Hong  ************************\n"
	.align 4
.LC31:
	.string	"                                                                  \n"
	.text
	.globl	print_contributors
	.type	print_contributors, @function
print_contributors:
.LFB5:
	.loc 1 86 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 1 87 0
	subl	$8, %esp
	pushl	$.LC14
	pushl	$.LC4
	call	printk
	addl	$16, %esp
	.loc 1 88 0
	subl	$12, %esp
	pushl	$.LC15
	call	printk
	addl	$16, %esp
	.loc 1 89 0
	subl	$12, %esp
	pushl	$.LC16
	call	printk
	addl	$16, %esp
	.loc 1 90 0
	subl	$12, %esp
	pushl	$.LC17
	call	printk
	addl	$16, %esp
	.loc 1 91 0
	subl	$12, %esp
	pushl	$.LC18
	call	printk
	addl	$16, %esp
	.loc 1 92 0
	subl	$12, %esp
	pushl	$.LC19
	call	printk
	addl	$16, %esp
	.loc 1 93 0
	subl	$12, %esp
	pushl	$.LC20
	call	printk
	addl	$16, %esp
	.loc 1 94 0
	subl	$12, %esp
	pushl	$.LC21
	call	printk
	addl	$16, %esp
	.loc 1 95 0
	subl	$12, %esp
	pushl	$.LC22
	call	printk
	addl	$16, %esp
	.loc 1 96 0
	subl	$12, %esp
	pushl	$.LC23
	call	printk
	addl	$16, %esp
	.loc 1 97 0
	subl	$12, %esp
	pushl	$.LC24
	call	printk
	addl	$16, %esp
	.loc 1 98 0
	subl	$12, %esp
	pushl	$.LC25
	call	printk
	addl	$16, %esp
	.loc 1 99 0
	subl	$12, %esp
	pushl	$.LC24
	call	printk
	addl	$16, %esp
	.loc 1 100 0
	subl	$12, %esp
	pushl	$.LC26
	call	printk
	addl	$16, %esp
	.loc 1 101 0
	subl	$12, %esp
	pushl	$.LC27
	call	printk
	addl	$16, %esp
	.loc 1 102 0
	subl	$12, %esp
	pushl	$.LC28
	call	printk
	addl	$16, %esp
	.loc 1 103 0
	subl	$12, %esp
	pushl	$.LC29
	call	printk
	addl	$16, %esp
	.loc 1 104 0
	subl	$12, %esp
	pushl	$.LC24
	call	printk
	addl	$16, %esp
	.loc 1 105 0
	subl	$12, %esp
	pushl	$.LC30
	call	printk
	addl	$16, %esp
	.loc 1 106 0
	subl	$12, %esp
	pushl	$.LC31
	call	printk
	addl	$16, %esp
	.loc 1 107 0
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	print_contributors, .-print_contributors
.Letext0:
	.file 2 "./include/type.h"
	.file 3 "./include/device/block.h"
	.file 4 "./include/list.h"
	.file 5 "./include/synch.h"
	.file 6 "./include/filesys/fs.h"
	.file 7 "./include/filesys/inode.h"
	.file 8 "./include/device/ata.h"
	.file 9 "./include/device/console.h"
	.file 10 "./include/syscall.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x4ab
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF78
	.byte	0xc
	.long	.LASF79
	.long	.LASF80
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF1
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x4
	.long	.LASF6
	.byte	0x2
	.byte	0x2d
	.long	0x25
	.uleb128 0x4
	.long	.LASF7
	.byte	0x2
	.byte	0x30
	.long	0x6c
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF8
	.uleb128 0x4
	.long	.LASF9
	.byte	0x2
	.byte	0x33
	.long	0x33
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x4
	.long	.LASF11
	.byte	0x3
	.byte	0x12
	.long	0x73
	.uleb128 0x4
	.long	.LASF12
	.byte	0x3
	.byte	0x15
	.long	0x73
	.uleb128 0x4
	.long	.LASF13
	.byte	0x3
	.byte	0x18
	.long	0x73
	.uleb128 0x4
	.long	.LASF14
	.byte	0x3
	.byte	0x1b
	.long	0x73
	.uleb128 0x6
	.long	.LASF19
	.byte	0x14
	.byte	0x3
	.byte	0x1e
	.long	0xfc
	.uleb128 0x7
	.long	.LASF15
	.byte	0x3
	.byte	0x20
	.long	0xa8
	.byte	0
	.uleb128 0x7
	.long	.LASF16
	.byte	0x3
	.byte	0x21
	.long	0x92
	.byte	0x4
	.uleb128 0x7
	.long	.LASF17
	.byte	0x3
	.byte	0x22
	.long	0x9d
	.byte	0x8
	.uleb128 0x8
	.string	"ops"
	.byte	0x3
	.byte	0x23
	.long	0x121
	.byte	0xc
	.uleb128 0x7
	.long	.LASF18
	.byte	0x3
	.byte	0x24
	.long	0x85
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.long	.LASF20
	.byte	0x8
	.byte	0x3
	.byte	0x2b
	.long	0x121
	.uleb128 0x7
	.long	.LASF21
	.byte	0x3
	.byte	0x2d
	.long	0x141
	.byte	0
	.uleb128 0x7
	.long	.LASF22
	.byte	0x3
	.byte	0x2e
	.long	0x163
	.byte	0x4
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x127
	.uleb128 0xa
	.long	0xfc
	.uleb128 0xb
	.long	0x141
	.uleb128 0xc
	.long	0x85
	.uleb128 0xc
	.long	0x87
	.uleb128 0xc
	.long	0x85
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x12c
	.uleb128 0xb
	.long	0x15c
	.uleb128 0xc
	.long	0x85
	.uleb128 0xc
	.long	0x87
	.uleb128 0xc
	.long	0x15c
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x162
	.uleb128 0xd
	.uleb128 0x9
	.byte	0x4
	.long	0x147
	.uleb128 0x6
	.long	.LASF23
	.byte	0x8
	.byte	0x4
	.byte	0x59
	.long	0x18e
	.uleb128 0x7
	.long	.LASF24
	.byte	0x4
	.byte	0x5b
	.long	0x18e
	.byte	0
	.uleb128 0x7
	.long	.LASF25
	.byte	0x4
	.byte	0x5c
	.long	0x18e
	.byte	0x4
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x169
	.uleb128 0x6
	.long	.LASF26
	.byte	0x10
	.byte	0x4
	.byte	0x60
	.long	0x1b9
	.uleb128 0x7
	.long	.LASF27
	.byte	0x4
	.byte	0x62
	.long	0x169
	.byte	0
	.uleb128 0x7
	.long	.LASF28
	.byte	0x4
	.byte	0x63
	.long	0x169
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.long	.LASF29
	.byte	0x14
	.byte	0x5
	.byte	0x9
	.long	0x1de
	.uleb128 0x7
	.long	.LASF30
	.byte	0x5
	.byte	0xb
	.long	0x33
	.byte	0
	.uleb128 0x7
	.long	.LASF31
	.byte	0x5
	.byte	0xc
	.long	0x194
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.long	.LASF32
	.byte	0x20
	.byte	0x6
	.byte	0x1b
	.long	0x21b
	.uleb128 0x7
	.long	.LASF33
	.byte	0x6
	.byte	0x1c
	.long	0x73
	.byte	0
	.uleb128 0x7
	.long	.LASF34
	.byte	0x6
	.byte	0x1d
	.long	0x73
	.byte	0x4
	.uleb128 0x7
	.long	.LASF35
	.byte	0x6
	.byte	0x1e
	.long	0x21b
	.byte	0x8
	.uleb128 0x7
	.long	.LASF36
	.byte	0x6
	.byte	0x1f
	.long	0x73
	.byte	0x1c
	.byte	0
	.uleb128 0xe
	.long	0x2c
	.long	0x22b
	.uleb128 0xf
	.long	0x22b
	.byte	0x13
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF37
	.uleb128 0x6
	.long	.LASF38
	.byte	0x2c
	.byte	0x6
	.byte	0x23
	.long	0x26f
	.uleb128 0x7
	.long	.LASF39
	.byte	0x6
	.byte	0x24
	.long	0x1de
	.byte	0
	.uleb128 0x7
	.long	.LASF40
	.byte	0x6
	.byte	0x25
	.long	0x26f
	.byte	0x20
	.uleb128 0x7
	.long	.LASF41
	.byte	0x6
	.byte	0x26
	.long	0x27a
	.byte	0x24
	.uleb128 0x7
	.long	.LASF42
	.byte	0x6
	.byte	0x27
	.long	0x27a
	.byte	0x28
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0xb3
	.uleb128 0x10
	.long	.LASF81
	.uleb128 0x9
	.byte	0x4
	.long	0x275
	.uleb128 0x6
	.long	.LASF43
	.byte	0x40
	.byte	0x7
	.byte	0x14
	.long	0x2ed
	.uleb128 0x7
	.long	.LASF44
	.byte	0x7
	.byte	0x16
	.long	0x73
	.byte	0
	.uleb128 0x7
	.long	.LASF45
	.byte	0x7
	.byte	0x17
	.long	0x73
	.byte	0x4
	.uleb128 0x7
	.long	.LASF46
	.byte	0x7
	.byte	0x18
	.long	0x61
	.byte	0x8
	.uleb128 0x7
	.long	.LASF47
	.byte	0x7
	.byte	0x19
	.long	0x61
	.byte	0xa
	.uleb128 0x7
	.long	.LASF48
	.byte	0x7
	.byte	0x1a
	.long	0x73
	.byte	0xc
	.uleb128 0x7
	.long	.LASF49
	.byte	0x7
	.byte	0x1b
	.long	0x2ed
	.byte	0x10
	.uleb128 0x7
	.long	.LASF50
	.byte	0x7
	.byte	0x1c
	.long	0x2fd
	.byte	0x38
	.uleb128 0x7
	.long	.LASF51
	.byte	0x7
	.byte	0x1d
	.long	0x73
	.byte	0x3c
	.byte	0
	.uleb128 0xe
	.long	0x73
	.long	0x2fd
	.uleb128 0xf
	.long	0x22b
	.byte	0x9
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x232
	.uleb128 0x11
	.long	.LASF82
	.byte	0x4
	.long	0x33
	.byte	0xa
	.byte	0x4
	.long	0x350
	.uleb128 0x12
	.long	.LASF52
	.byte	0
	.uleb128 0x12
	.long	.LASF53
	.byte	0x1
	.uleb128 0x12
	.long	.LASF54
	.byte	0x2
	.uleb128 0x12
	.long	.LASF55
	.byte	0x3
	.uleb128 0x12
	.long	.LASF56
	.byte	0x4
	.uleb128 0x12
	.long	.LASF57
	.byte	0x5
	.uleb128 0x12
	.long	.LASF58
	.byte	0x6
	.uleb128 0x12
	.long	.LASF59
	.byte	0x7
	.uleb128 0x12
	.long	.LASF60
	.byte	0x8
	.uleb128 0x12
	.long	.LASF61
	.byte	0x9
	.byte	0
	.uleb128 0x6
	.long	.LASF62
	.byte	0x1c
	.byte	0x8
	.byte	0x39
	.long	0x38d
	.uleb128 0x7
	.long	.LASF15
	.byte	0x8
	.byte	0x3b
	.long	0x56
	.byte	0
	.uleb128 0x7
	.long	.LASF63
	.byte	0x8
	.byte	0x3c
	.long	0x61
	.byte	0x2
	.uleb128 0x8
	.string	"irq"
	.byte	0x8
	.byte	0x3d
	.long	0x56
	.byte	0x4
	.uleb128 0x7
	.long	.LASF64
	.byte	0x8
	.byte	0x3e
	.long	0x1b9
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.long	.LASF65
	.byte	0x38
	.byte	0x8
	.byte	0x41
	.long	0x3a6
	.uleb128 0x7
	.long	.LASF66
	.byte	0x8
	.byte	0x43
	.long	0x3a6
	.byte	0
	.byte	0
	.uleb128 0xe
	.long	0x350
	.long	0x3b6
	.uleb128 0xf
	.long	0x22b
	.byte	0x1
	.byte	0
	.uleb128 0x13
	.long	.LASF67
	.byte	0x1
	.byte	0x1c
	.long	.LFB3
	.long	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x13
	.long	.LASF68
	.byte	0x1
	.byte	0x25
	.long	.LFB4
	.long	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x13
	.long	.LASF69
	.byte	0x1
	.byte	0x55
	.long	.LFB5
	.long	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.long	.LASF83
	.byte	0x6
	.byte	0x36
	.long	0x232
	.uleb128 0x5
	.byte	0x3
	.long	filesys
	.uleb128 0x15
	.long	.LASF70
	.byte	0x9
	.byte	0xc
	.long	0x4f
	.uleb128 0x5
	.byte	0x3
	.long	Glob_x
	.uleb128 0x15
	.long	.LASF71
	.byte	0x9
	.byte	0xd
	.long	0x4f
	.uleb128 0x5
	.byte	0x3
	.long	Glob_y
	.uleb128 0x15
	.long	.LASF72
	.byte	0x8
	.byte	0x47
	.long	0xb3
	.uleb128 0x5
	.byte	0x3
	.long	ata0_blk_dev
	.uleb128 0x15
	.long	.LASF73
	.byte	0x8
	.byte	0x48
	.long	0xb3
	.uleb128 0x5
	.byte	0x3
	.long	ata1_blk_dev
	.uleb128 0xe
	.long	0x280
	.long	0x44e
	.uleb128 0xf
	.long	0x22b
	.byte	0xff
	.byte	0
	.uleb128 0x15
	.long	.LASF74
	.byte	0x7
	.byte	0x2a
	.long	0x43e
	.uleb128 0x5
	.byte	0x3
	.long	inode_tbl
	.uleb128 0x16
	.string	"ata"
	.byte	0x8
	.byte	0x46
	.long	0x38d
	.uleb128 0x5
	.byte	0x3
	.long	ata
	.uleb128 0x15
	.long	.LASF75
	.byte	0x1
	.byte	0x18
	.long	0x481
	.uleb128 0x5
	.byte	0x3
	.long	VERSION
	.uleb128 0x9
	.byte	0x4
	.long	0x487
	.uleb128 0xa
	.long	0x2c
	.uleb128 0x15
	.long	.LASF76
	.byte	0x1
	.byte	0x19
	.long	0x481
	.uleb128 0x5
	.byte	0x3
	.long	AUTHOR
	.uleb128 0x15
	.long	.LASF77
	.byte	0x1
	.byte	0x1a
	.long	0x481
	.uleb128 0x5
	.byte	0x3
	.long	MODIFIER
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.value	0
	.value	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF47:
	.string	"sn_nlink"
.LASF41:
	.string	"fs_blkmap"
.LASF22:
	.string	"write"
.LASF14:
	.string	"blk_dev_t"
.LASF13:
	.string	"blk_size_t"
.LASF76:
	.string	"AUTHOR"
.LASF5:
	.string	"short int"
.LASF65:
	.string	"ata_interface"
.LASF37:
	.string	"sizetype"
.LASF32:
	.string	"ssu_superblock"
.LASF58:
	.string	"SYS_READ"
.LASF61:
	.string	"SYS_NUM"
.LASF83:
	.string	"filesys"
.LASF17:
	.string	"blk_size"
.LASF29:
	.string	"semaphore"
.LASF72:
	.string	"ata0_blk_dev"
.LASF57:
	.string	"SYS_OPEN"
.LASF60:
	.string	"SYS_FCNTL"
.LASF46:
	.string	"sn_type"
.LASF73:
	.string	"ata1_blk_dev"
.LASF30:
	.string	"value"
.LASF27:
	.string	"head"
.LASF51:
	.string	"sn_padding"
.LASF55:
	.string	"SYS_SSUREAD"
.LASF6:
	.string	"uint8_t"
.LASF81:
	.string	"bitmap"
.LASF56:
	.string	"SYS_SHUTDOWN"
.LASF12:
	.string	"blk_cnt_t"
.LASF66:
	.string	"nodes"
.LASF21:
	.string	"read"
.LASF3:
	.string	"long long int"
.LASF50:
	.string	"sn_fs"
.LASF42:
	.string	"fs_inodemap"
.LASF44:
	.string	"sn_ino"
.LASF75:
	.string	"VERSION"
.LASF52:
	.string	"SYS_FORK"
.LASF16:
	.string	"blk_count"
.LASF74:
	.string	"inode_tbl"
.LASF19:
	.string	"blk_dev"
.LASF80:
	.string	"/home/jun16/SSUOS_P3_V2.0/src/kernel"
.LASF28:
	.string	"tail"
.LASF0:
	.string	"unsigned char"
.LASF31:
	.string	"waiters"
.LASF67:
	.string	"ssuos_main"
.LASF35:
	.string	"sb_volname"
.LASF79:
	.string	"arch/Main.c"
.LASF4:
	.string	"signed char"
.LASF11:
	.string	"blk_sec_t"
.LASF10:
	.string	"long long unsigned int"
.LASF9:
	.string	"uint32_t"
.LASF2:
	.string	"unsigned int"
.LASF7:
	.string	"uint16_t"
.LASF23:
	.string	"list_elem"
.LASF59:
	.string	"SYS_WRITE"
.LASF33:
	.string	"sb_magic"
.LASF45:
	.string	"sn_size"
.LASF8:
	.string	"short unsigned int"
.LASF43:
	.string	"inode"
.LASF20:
	.string	"blk_dev_ops"
.LASF1:
	.string	"char"
.LASF15:
	.string	"type"
.LASF26:
	.string	"list"
.LASF49:
	.string	"sn_directblock"
.LASF69:
	.string	"print_contributors"
.LASF48:
	.string	"sn_refcount"
.LASF38:
	.string	"ssu_fs"
.LASF77:
	.string	"MODIFIER"
.LASF36:
	.string	"padding"
.LASF53:
	.string	"SYS_EXIT"
.LASF64:
	.string	"sema"
.LASF54:
	.string	"SYS_WAIT"
.LASF62:
	.string	"ata_device"
.LASF34:
	.string	"sb_nblocks"
.LASF18:
	.string	"device_info"
.LASF40:
	.string	"fs_device"
.LASF68:
	.string	"main_init"
.LASF78:
	.string	"GNU C11 5.4.0 20160609 -m32 -mtune=generic -march=i686 -g -O0 -ffreestanding -fno-stack-protector"
.LASF63:
	.string	"port_addr"
.LASF39:
	.string	"fs_sb"
.LASF24:
	.string	"prev"
.LASF70:
	.string	"Glob_x"
.LASF71:
	.string	"Glob_y"
.LASF82:
	.string	"SYS_LIST"
.LASF25:
	.string	"next"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.11) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
