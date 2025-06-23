
./Build/exec.elf:     file format elf32-littlearm


Disassembly of section .text:

08000740 <prvHeadInit>:
 8000740:	b084      	sub	sp, #16
 8000742:	f44f 5320 	mov.w	r3, #10240	@ 0x2800
 8000746:	9302      	str	r3, [sp, #8]
 8000748:	4b26      	ldr	r3, [pc, #152]	@ (80007e4 <prvHeadInit+0xa4>)
 800074a:	9303      	str	r3, [sp, #12]
 800074c:	9b03      	ldr	r3, [sp, #12]
 800074e:	f003 0307 	and.w	r3, r3, #7
 8000752:	2b00      	cmp	r3, #0
 8000754:	d00c      	beq.n	8000770 <prvHeadInit+0x30>
 8000756:	9b03      	ldr	r3, [sp, #12]
 8000758:	3307      	adds	r3, #7
 800075a:	9303      	str	r3, [sp, #12]
 800075c:	9b03      	ldr	r3, [sp, #12]
 800075e:	f023 0307 	bic.w	r3, r3, #7
 8000762:	9303      	str	r3, [sp, #12]
 8000764:	9a02      	ldr	r2, [sp, #8]
 8000766:	9b03      	ldr	r3, [sp, #12]
 8000768:	1ad3      	subs	r3, r2, r3
 800076a:	4a1e      	ldr	r2, [pc, #120]	@ (80007e4 <prvHeadInit+0xa4>)
 800076c:	4413      	add	r3, r2
 800076e:	9302      	str	r3, [sp, #8]
 8000770:	9b03      	ldr	r3, [sp, #12]
 8000772:	9301      	str	r3, [sp, #4]
 8000774:	4a1c      	ldr	r2, [pc, #112]	@ (80007e8 <prvHeadInit+0xa8>)
 8000776:	9b01      	ldr	r3, [sp, #4]
 8000778:	6013      	str	r3, [r2, #0]
 800077a:	4b1b      	ldr	r3, [pc, #108]	@ (80007e8 <prvHeadInit+0xa8>)
 800077c:	2200      	movs	r2, #0
 800077e:	605a      	str	r2, [r3, #4]
 8000780:	9b01      	ldr	r3, [sp, #4]
 8000782:	9a02      	ldr	r2, [sp, #8]
 8000784:	4413      	add	r3, r2
 8000786:	9303      	str	r3, [sp, #12]
 8000788:	2208      	movs	r2, #8
 800078a:	9b03      	ldr	r3, [sp, #12]
 800078c:	1a9b      	subs	r3, r3, r2
 800078e:	9303      	str	r3, [sp, #12]
 8000790:	9b03      	ldr	r3, [sp, #12]
 8000792:	f023 0307 	bic.w	r3, r3, #7
 8000796:	9303      	str	r3, [sp, #12]
 8000798:	9b03      	ldr	r3, [sp, #12]
 800079a:	4a14      	ldr	r2, [pc, #80]	@ (80007ec <prvHeadInit+0xac>)
 800079c:	6013      	str	r3, [r2, #0]
 800079e:	4b13      	ldr	r3, [pc, #76]	@ (80007ec <prvHeadInit+0xac>)
 80007a0:	681b      	ldr	r3, [r3, #0]
 80007a2:	2200      	movs	r2, #0
 80007a4:	605a      	str	r2, [r3, #4]
 80007a6:	4b11      	ldr	r3, [pc, #68]	@ (80007ec <prvHeadInit+0xac>)
 80007a8:	681b      	ldr	r3, [r3, #0]
 80007aa:	2200      	movs	r2, #0
 80007ac:	601a      	str	r2, [r3, #0]
 80007ae:	9b01      	ldr	r3, [sp, #4]
 80007b0:	9300      	str	r3, [sp, #0]
 80007b2:	9b00      	ldr	r3, [sp, #0]
 80007b4:	9a03      	ldr	r2, [sp, #12]
 80007b6:	1ad2      	subs	r2, r2, r3
 80007b8:	9b00      	ldr	r3, [sp, #0]
 80007ba:	605a      	str	r2, [r3, #4]
 80007bc:	4b0b      	ldr	r3, [pc, #44]	@ (80007ec <prvHeadInit+0xac>)
 80007be:	681a      	ldr	r2, [r3, #0]
 80007c0:	9b00      	ldr	r3, [sp, #0]
 80007c2:	601a      	str	r2, [r3, #0]
 80007c4:	9b00      	ldr	r3, [sp, #0]
 80007c6:	685b      	ldr	r3, [r3, #4]
 80007c8:	4a09      	ldr	r2, [pc, #36]	@ (80007f0 <prvHeadInit+0xb0>)
 80007ca:	6013      	str	r3, [r2, #0]
 80007cc:	9b00      	ldr	r3, [sp, #0]
 80007ce:	685b      	ldr	r3, [r3, #4]
 80007d0:	4a08      	ldr	r2, [pc, #32]	@ (80007f4 <prvHeadInit+0xb4>)
 80007d2:	6013      	str	r3, [r2, #0]
 80007d4:	4b08      	ldr	r3, [pc, #32]	@ (80007f8 <prvHeadInit+0xb8>)
 80007d6:	f04f 4200 	mov.w	r2, #2147483648	@ 0x80000000
 80007da:	601a      	str	r2, [r3, #0]
 80007dc:	bf00      	nop
 80007de:	b004      	add	sp, #16
 80007e0:	4770      	bx	lr
 80007e2:	bf00      	nop
 80007e4:	20000024 	.word	0x20000024
 80007e8:	2000000c 	.word	0x2000000c
 80007ec:	20000014 	.word	0x20000014
 80007f0:	2000001c 	.word	0x2000001c
 80007f4:	20000018 	.word	0x20000018
 80007f8:	20000020 	.word	0x20000020

080007fc <prvInsertBlockIntoFreeList>:
 80007fc:	b084      	sub	sp, #16
 80007fe:	9001      	str	r0, [sp, #4]
 8000800:	4b26      	ldr	r3, [pc, #152]	@ (800089c <prvInsertBlockIntoFreeList+0xa0>)
 8000802:	9303      	str	r3, [sp, #12]
 8000804:	e002      	b.n	800080c <prvInsertBlockIntoFreeList+0x10>
 8000806:	9b03      	ldr	r3, [sp, #12]
 8000808:	681b      	ldr	r3, [r3, #0]
 800080a:	9303      	str	r3, [sp, #12]
 800080c:	9b03      	ldr	r3, [sp, #12]
 800080e:	681b      	ldr	r3, [r3, #0]
 8000810:	9a01      	ldr	r2, [sp, #4]
 8000812:	429a      	cmp	r2, r3
 8000814:	d8f7      	bhi.n	8000806 <prvInsertBlockIntoFreeList+0xa>
 8000816:	9b03      	ldr	r3, [sp, #12]
 8000818:	9302      	str	r3, [sp, #8]
 800081a:	9b03      	ldr	r3, [sp, #12]
 800081c:	685b      	ldr	r3, [r3, #4]
 800081e:	9a02      	ldr	r2, [sp, #8]
 8000820:	4413      	add	r3, r2
 8000822:	9a01      	ldr	r2, [sp, #4]
 8000824:	429a      	cmp	r2, r3
 8000826:	d108      	bne.n	800083a <prvInsertBlockIntoFreeList+0x3e>
 8000828:	9b03      	ldr	r3, [sp, #12]
 800082a:	685a      	ldr	r2, [r3, #4]
 800082c:	9b01      	ldr	r3, [sp, #4]
 800082e:	685b      	ldr	r3, [r3, #4]
 8000830:	441a      	add	r2, r3
 8000832:	9b03      	ldr	r3, [sp, #12]
 8000834:	605a      	str	r2, [r3, #4]
 8000836:	9b03      	ldr	r3, [sp, #12]
 8000838:	9301      	str	r3, [sp, #4]
 800083a:	9b01      	ldr	r3, [sp, #4]
 800083c:	9302      	str	r3, [sp, #8]
 800083e:	9b01      	ldr	r3, [sp, #4]
 8000840:	685b      	ldr	r3, [r3, #4]
 8000842:	9a02      	ldr	r2, [sp, #8]
 8000844:	441a      	add	r2, r3
 8000846:	9b03      	ldr	r3, [sp, #12]
 8000848:	681b      	ldr	r3, [r3, #0]
 800084a:	429a      	cmp	r2, r3
 800084c:	d118      	bne.n	8000880 <prvInsertBlockIntoFreeList+0x84>
 800084e:	9b03      	ldr	r3, [sp, #12]
 8000850:	681a      	ldr	r2, [r3, #0]
 8000852:	4b13      	ldr	r3, [pc, #76]	@ (80008a0 <prvInsertBlockIntoFreeList+0xa4>)
 8000854:	681b      	ldr	r3, [r3, #0]
 8000856:	429a      	cmp	r2, r3
 8000858:	d00d      	beq.n	8000876 <prvInsertBlockIntoFreeList+0x7a>
 800085a:	9b01      	ldr	r3, [sp, #4]
 800085c:	685a      	ldr	r2, [r3, #4]
 800085e:	9b03      	ldr	r3, [sp, #12]
 8000860:	681b      	ldr	r3, [r3, #0]
 8000862:	685b      	ldr	r3, [r3, #4]
 8000864:	441a      	add	r2, r3
 8000866:	9b01      	ldr	r3, [sp, #4]
 8000868:	605a      	str	r2, [r3, #4]
 800086a:	9b03      	ldr	r3, [sp, #12]
 800086c:	681b      	ldr	r3, [r3, #0]
 800086e:	681a      	ldr	r2, [r3, #0]
 8000870:	9b01      	ldr	r3, [sp, #4]
 8000872:	601a      	str	r2, [r3, #0]
 8000874:	e008      	b.n	8000888 <prvInsertBlockIntoFreeList+0x8c>
 8000876:	4b0a      	ldr	r3, [pc, #40]	@ (80008a0 <prvInsertBlockIntoFreeList+0xa4>)
 8000878:	681a      	ldr	r2, [r3, #0]
 800087a:	9b01      	ldr	r3, [sp, #4]
 800087c:	601a      	str	r2, [r3, #0]
 800087e:	e003      	b.n	8000888 <prvInsertBlockIntoFreeList+0x8c>
 8000880:	9b03      	ldr	r3, [sp, #12]
 8000882:	681a      	ldr	r2, [r3, #0]
 8000884:	9b01      	ldr	r3, [sp, #4]
 8000886:	601a      	str	r2, [r3, #0]
 8000888:	9a03      	ldr	r2, [sp, #12]
 800088a:	9b01      	ldr	r3, [sp, #4]
 800088c:	429a      	cmp	r2, r3
 800088e:	d002      	beq.n	8000896 <prvInsertBlockIntoFreeList+0x9a>
 8000890:	9b03      	ldr	r3, [sp, #12]
 8000892:	9a01      	ldr	r2, [sp, #4]
 8000894:	601a      	str	r2, [r3, #0]
 8000896:	bf00      	nop
 8000898:	b004      	add	sp, #16
 800089a:	4770      	bx	lr
 800089c:	2000000c 	.word	0x2000000c
 80008a0:	20000014 	.word	0x20000014

080008a4 <pvPortMalloc>:
 80008a4:	b500      	push	{lr}
 80008a6:	b087      	sub	sp, #28
 80008a8:	9001      	str	r0, [sp, #4]
 80008aa:	2300      	movs	r3, #0
 80008ac:	9303      	str	r3, [sp, #12]
 80008ae:	f001 fee9 	bl	8002684 <vTaskSuspendAll>
 80008b2:	4b40      	ldr	r3, [pc, #256]	@ (80009b4 <pvPortMalloc+0x110>)
 80008b4:	681b      	ldr	r3, [r3, #0]
 80008b6:	2b00      	cmp	r3, #0
 80008b8:	d101      	bne.n	80008be <pvPortMalloc+0x1a>
 80008ba:	f7ff ff41 	bl	8000740 <prvHeadInit>
 80008be:	4b3e      	ldr	r3, [pc, #248]	@ (80009b8 <pvPortMalloc+0x114>)
 80008c0:	681a      	ldr	r2, [r3, #0]
 80008c2:	9b01      	ldr	r3, [sp, #4]
 80008c4:	4013      	ands	r3, r2
 80008c6:	2b00      	cmp	r3, #0
 80008c8:	d16d      	bne.n	80009a6 <pvPortMalloc+0x102>
 80008ca:	9b01      	ldr	r3, [sp, #4]
 80008cc:	2b00      	cmp	r3, #0
 80008ce:	d00d      	beq.n	80008ec <pvPortMalloc+0x48>
 80008d0:	2208      	movs	r2, #8
 80008d2:	9b01      	ldr	r3, [sp, #4]
 80008d4:	4413      	add	r3, r2
 80008d6:	9301      	str	r3, [sp, #4]
 80008d8:	9b01      	ldr	r3, [sp, #4]
 80008da:	f003 0307 	and.w	r3, r3, #7
 80008de:	2b00      	cmp	r3, #0
 80008e0:	d004      	beq.n	80008ec <pvPortMalloc+0x48>
 80008e2:	9b01      	ldr	r3, [sp, #4]
 80008e4:	f023 0307 	bic.w	r3, r3, #7
 80008e8:	3308      	adds	r3, #8
 80008ea:	9301      	str	r3, [sp, #4]
 80008ec:	9b01      	ldr	r3, [sp, #4]
 80008ee:	2b00      	cmp	r3, #0
 80008f0:	d059      	beq.n	80009a6 <pvPortMalloc+0x102>
 80008f2:	4b32      	ldr	r3, [pc, #200]	@ (80009bc <pvPortMalloc+0x118>)
 80008f4:	681b      	ldr	r3, [r3, #0]
 80008f6:	9a01      	ldr	r2, [sp, #4]
 80008f8:	429a      	cmp	r2, r3
 80008fa:	d854      	bhi.n	80009a6 <pvPortMalloc+0x102>
 80008fc:	4b30      	ldr	r3, [pc, #192]	@ (80009c0 <pvPortMalloc+0x11c>)
 80008fe:	9304      	str	r3, [sp, #16]
 8000900:	9b04      	ldr	r3, [sp, #16]
 8000902:	681b      	ldr	r3, [r3, #0]
 8000904:	9305      	str	r3, [sp, #20]
 8000906:	e004      	b.n	8000912 <pvPortMalloc+0x6e>
 8000908:	9b05      	ldr	r3, [sp, #20]
 800090a:	9304      	str	r3, [sp, #16]
 800090c:	9b05      	ldr	r3, [sp, #20]
 800090e:	681b      	ldr	r3, [r3, #0]
 8000910:	9305      	str	r3, [sp, #20]
 8000912:	9b05      	ldr	r3, [sp, #20]
 8000914:	685b      	ldr	r3, [r3, #4]
 8000916:	9a01      	ldr	r2, [sp, #4]
 8000918:	429a      	cmp	r2, r3
 800091a:	d903      	bls.n	8000924 <pvPortMalloc+0x80>
 800091c:	9b05      	ldr	r3, [sp, #20]
 800091e:	681b      	ldr	r3, [r3, #0]
 8000920:	2b00      	cmp	r3, #0
 8000922:	d1f1      	bne.n	8000908 <pvPortMalloc+0x64>
 8000924:	4b23      	ldr	r3, [pc, #140]	@ (80009b4 <pvPortMalloc+0x110>)
 8000926:	681b      	ldr	r3, [r3, #0]
 8000928:	9a05      	ldr	r2, [sp, #20]
 800092a:	429a      	cmp	r2, r3
 800092c:	d020      	beq.n	8000970 <pvPortMalloc+0xcc>
 800092e:	9b04      	ldr	r3, [sp, #16]
 8000930:	681b      	ldr	r3, [r3, #0]
 8000932:	2208      	movs	r2, #8
 8000934:	4413      	add	r3, r2
 8000936:	9303      	str	r3, [sp, #12]
 8000938:	9b05      	ldr	r3, [sp, #20]
 800093a:	681a      	ldr	r2, [r3, #0]
 800093c:	9b04      	ldr	r3, [sp, #16]
 800093e:	601a      	str	r2, [r3, #0]
 8000940:	9b05      	ldr	r3, [sp, #20]
 8000942:	685a      	ldr	r2, [r3, #4]
 8000944:	9b01      	ldr	r3, [sp, #4]
 8000946:	1ad2      	subs	r2, r2, r3
 8000948:	2308      	movs	r3, #8
 800094a:	005b      	lsls	r3, r3, #1
 800094c:	429a      	cmp	r2, r3
 800094e:	d90f      	bls.n	8000970 <pvPortMalloc+0xcc>
 8000950:	9a05      	ldr	r2, [sp, #20]
 8000952:	9b01      	ldr	r3, [sp, #4]
 8000954:	4413      	add	r3, r2
 8000956:	9302      	str	r3, [sp, #8]
 8000958:	9b05      	ldr	r3, [sp, #20]
 800095a:	685a      	ldr	r2, [r3, #4]
 800095c:	9b01      	ldr	r3, [sp, #4]
 800095e:	1ad2      	subs	r2, r2, r3
 8000960:	9b02      	ldr	r3, [sp, #8]
 8000962:	605a      	str	r2, [r3, #4]
 8000964:	9b05      	ldr	r3, [sp, #20]
 8000966:	9a01      	ldr	r2, [sp, #4]
 8000968:	605a      	str	r2, [r3, #4]
 800096a:	9802      	ldr	r0, [sp, #8]
 800096c:	f7ff ff46 	bl	80007fc <prvInsertBlockIntoFreeList>
 8000970:	4b12      	ldr	r3, [pc, #72]	@ (80009bc <pvPortMalloc+0x118>)
 8000972:	681a      	ldr	r2, [r3, #0]
 8000974:	9b05      	ldr	r3, [sp, #20]
 8000976:	685b      	ldr	r3, [r3, #4]
 8000978:	1ad3      	subs	r3, r2, r3
 800097a:	4a10      	ldr	r2, [pc, #64]	@ (80009bc <pvPortMalloc+0x118>)
 800097c:	6013      	str	r3, [r2, #0]
 800097e:	4b0f      	ldr	r3, [pc, #60]	@ (80009bc <pvPortMalloc+0x118>)
 8000980:	681a      	ldr	r2, [r3, #0]
 8000982:	4b10      	ldr	r3, [pc, #64]	@ (80009c4 <pvPortMalloc+0x120>)
 8000984:	681b      	ldr	r3, [r3, #0]
 8000986:	429a      	cmp	r2, r3
 8000988:	d203      	bcs.n	8000992 <pvPortMalloc+0xee>
 800098a:	4b0e      	ldr	r3, [pc, #56]	@ (80009c4 <pvPortMalloc+0x120>)
 800098c:	681b      	ldr	r3, [r3, #0]
 800098e:	4a0b      	ldr	r2, [pc, #44]	@ (80009bc <pvPortMalloc+0x118>)
 8000990:	6013      	str	r3, [r2, #0]
 8000992:	9b05      	ldr	r3, [sp, #20]
 8000994:	685a      	ldr	r2, [r3, #4]
 8000996:	4b08      	ldr	r3, [pc, #32]	@ (80009b8 <pvPortMalloc+0x114>)
 8000998:	681b      	ldr	r3, [r3, #0]
 800099a:	431a      	orrs	r2, r3
 800099c:	9b05      	ldr	r3, [sp, #20]
 800099e:	605a      	str	r2, [r3, #4]
 80009a0:	9b05      	ldr	r3, [sp, #20]
 80009a2:	2200      	movs	r2, #0
 80009a4:	601a      	str	r2, [r3, #0]
 80009a6:	f001 ff39 	bl	800281c <xTaskResumeAll>
 80009aa:	9b03      	ldr	r3, [sp, #12]
 80009ac:	4618      	mov	r0, r3
 80009ae:	b007      	add	sp, #28
 80009b0:	f85d fb04 	ldr.w	pc, [sp], #4
 80009b4:	20000014 	.word	0x20000014
 80009b8:	20000020 	.word	0x20000020
 80009bc:	20000018 	.word	0x20000018
 80009c0:	2000000c 	.word	0x2000000c
 80009c4:	2000001c 	.word	0x2000001c

080009c8 <vPortFree>:
 80009c8:	b500      	push	{lr}
 80009ca:	b085      	sub	sp, #20
 80009cc:	9001      	str	r0, [sp, #4]
 80009ce:	9b01      	ldr	r3, [sp, #4]
 80009d0:	9303      	str	r3, [sp, #12]
 80009d2:	9b01      	ldr	r3, [sp, #4]
 80009d4:	2b00      	cmp	r3, #0
 80009d6:	d027      	beq.n	8000a28 <vPortFree+0x60>
 80009d8:	2308      	movs	r3, #8
 80009da:	425b      	negs	r3, r3
 80009dc:	9a03      	ldr	r2, [sp, #12]
 80009de:	4413      	add	r3, r2
 80009e0:	9303      	str	r3, [sp, #12]
 80009e2:	9b03      	ldr	r3, [sp, #12]
 80009e4:	9302      	str	r3, [sp, #8]
 80009e6:	9b02      	ldr	r3, [sp, #8]
 80009e8:	685a      	ldr	r2, [r3, #4]
 80009ea:	4b11      	ldr	r3, [pc, #68]	@ (8000a30 <vPortFree+0x68>)
 80009ec:	681b      	ldr	r3, [r3, #0]
 80009ee:	4013      	ands	r3, r2
 80009f0:	2b00      	cmp	r3, #0
 80009f2:	d019      	beq.n	8000a28 <vPortFree+0x60>
 80009f4:	9b02      	ldr	r3, [sp, #8]
 80009f6:	681b      	ldr	r3, [r3, #0]
 80009f8:	2b00      	cmp	r3, #0
 80009fa:	d115      	bne.n	8000a28 <vPortFree+0x60>
 80009fc:	9b02      	ldr	r3, [sp, #8]
 80009fe:	685a      	ldr	r2, [r3, #4]
 8000a00:	4b0b      	ldr	r3, [pc, #44]	@ (8000a30 <vPortFree+0x68>)
 8000a02:	681b      	ldr	r3, [r3, #0]
 8000a04:	43db      	mvns	r3, r3
 8000a06:	401a      	ands	r2, r3
 8000a08:	9b02      	ldr	r3, [sp, #8]
 8000a0a:	605a      	str	r2, [r3, #4]
 8000a0c:	f001 fe3a 	bl	8002684 <vTaskSuspendAll>
 8000a10:	9b02      	ldr	r3, [sp, #8]
 8000a12:	685a      	ldr	r2, [r3, #4]
 8000a14:	4b07      	ldr	r3, [pc, #28]	@ (8000a34 <vPortFree+0x6c>)
 8000a16:	681b      	ldr	r3, [r3, #0]
 8000a18:	4413      	add	r3, r2
 8000a1a:	4a06      	ldr	r2, [pc, #24]	@ (8000a34 <vPortFree+0x6c>)
 8000a1c:	6013      	str	r3, [r2, #0]
 8000a1e:	9802      	ldr	r0, [sp, #8]
 8000a20:	f7ff feec 	bl	80007fc <prvInsertBlockIntoFreeList>
 8000a24:	f001 fefa 	bl	800281c <xTaskResumeAll>
 8000a28:	bf00      	nop
 8000a2a:	b005      	add	sp, #20
 8000a2c:	f85d fb04 	ldr.w	pc, [sp], #4
 8000a30:	20000020 	.word	0x20000020
 8000a34:	20000018 	.word	0x20000018

08000a38 <uxListRemove>:
 8000a38:	b084      	sub	sp, #16
 8000a3a:	9001      	str	r0, [sp, #4]
 8000a3c:	9b01      	ldr	r3, [sp, #4]
 8000a3e:	691b      	ldr	r3, [r3, #16]
 8000a40:	9303      	str	r3, [sp, #12]
 8000a42:	9b01      	ldr	r3, [sp, #4]
 8000a44:	685b      	ldr	r3, [r3, #4]
 8000a46:	9a01      	ldr	r2, [sp, #4]
 8000a48:	6892      	ldr	r2, [r2, #8]
 8000a4a:	609a      	str	r2, [r3, #8]
 8000a4c:	9b01      	ldr	r3, [sp, #4]
 8000a4e:	689b      	ldr	r3, [r3, #8]
 8000a50:	9a01      	ldr	r2, [sp, #4]
 8000a52:	6852      	ldr	r2, [r2, #4]
 8000a54:	605a      	str	r2, [r3, #4]
 8000a56:	9b03      	ldr	r3, [sp, #12]
 8000a58:	685b      	ldr	r3, [r3, #4]
 8000a5a:	9a01      	ldr	r2, [sp, #4]
 8000a5c:	429a      	cmp	r2, r3
 8000a5e:	d103      	bne.n	8000a68 <uxListRemove+0x30>
 8000a60:	9b01      	ldr	r3, [sp, #4]
 8000a62:	689a      	ldr	r2, [r3, #8]
 8000a64:	9b03      	ldr	r3, [sp, #12]
 8000a66:	605a      	str	r2, [r3, #4]
 8000a68:	9b01      	ldr	r3, [sp, #4]
 8000a6a:	2200      	movs	r2, #0
 8000a6c:	611a      	str	r2, [r3, #16]
 8000a6e:	9b03      	ldr	r3, [sp, #12]
 8000a70:	681b      	ldr	r3, [r3, #0]
 8000a72:	1e5a      	subs	r2, r3, #1
 8000a74:	9b03      	ldr	r3, [sp, #12]
 8000a76:	601a      	str	r2, [r3, #0]
 8000a78:	9b03      	ldr	r3, [sp, #12]
 8000a7a:	681b      	ldr	r3, [r3, #0]
 8000a7c:	4618      	mov	r0, r3
 8000a7e:	b004      	add	sp, #16
 8000a80:	4770      	bx	lr

08000a82 <vListInsertEnd>:
 8000a82:	b084      	sub	sp, #16
 8000a84:	9001      	str	r0, [sp, #4]
 8000a86:	9100      	str	r1, [sp, #0]
 8000a88:	9b01      	ldr	r3, [sp, #4]
 8000a8a:	685b      	ldr	r3, [r3, #4]
 8000a8c:	9303      	str	r3, [sp, #12]
 8000a8e:	9b00      	ldr	r3, [sp, #0]
 8000a90:	9a03      	ldr	r2, [sp, #12]
 8000a92:	605a      	str	r2, [r3, #4]
 8000a94:	9b03      	ldr	r3, [sp, #12]
 8000a96:	689a      	ldr	r2, [r3, #8]
 8000a98:	9b00      	ldr	r3, [sp, #0]
 8000a9a:	609a      	str	r2, [r3, #8]
 8000a9c:	9b03      	ldr	r3, [sp, #12]
 8000a9e:	689b      	ldr	r3, [r3, #8]
 8000aa0:	9a00      	ldr	r2, [sp, #0]
 8000aa2:	605a      	str	r2, [r3, #4]
 8000aa4:	9b03      	ldr	r3, [sp, #12]
 8000aa6:	9a00      	ldr	r2, [sp, #0]
 8000aa8:	609a      	str	r2, [r3, #8]
 8000aaa:	9b00      	ldr	r3, [sp, #0]
 8000aac:	9a01      	ldr	r2, [sp, #4]
 8000aae:	611a      	str	r2, [r3, #16]
 8000ab0:	9b01      	ldr	r3, [sp, #4]
 8000ab2:	681b      	ldr	r3, [r3, #0]
 8000ab4:	1c5a      	adds	r2, r3, #1
 8000ab6:	9b01      	ldr	r3, [sp, #4]
 8000ab8:	601a      	str	r2, [r3, #0]
 8000aba:	bf00      	nop
 8000abc:	b004      	add	sp, #16
 8000abe:	4770      	bx	lr

08000ac0 <vListInsert>:
 8000ac0:	b084      	sub	sp, #16
 8000ac2:	9001      	str	r0, [sp, #4]
 8000ac4:	9100      	str	r1, [sp, #0]
 8000ac6:	9b00      	ldr	r3, [sp, #0]
 8000ac8:	681b      	ldr	r3, [r3, #0]
 8000aca:	9302      	str	r3, [sp, #8]
 8000acc:	9b02      	ldr	r3, [sp, #8]
 8000ace:	f1b3 3fff 	cmp.w	r3, #4294967295	@ 0xffffffff
 8000ad2:	d103      	bne.n	8000adc <vListInsert+0x1c>
 8000ad4:	9b01      	ldr	r3, [sp, #4]
 8000ad6:	691b      	ldr	r3, [r3, #16]
 8000ad8:	9303      	str	r3, [sp, #12]
 8000ada:	e00c      	b.n	8000af6 <vListInsert+0x36>
 8000adc:	9b01      	ldr	r3, [sp, #4]
 8000ade:	3308      	adds	r3, #8
 8000ae0:	9303      	str	r3, [sp, #12]
 8000ae2:	e002      	b.n	8000aea <vListInsert+0x2a>
 8000ae4:	9b03      	ldr	r3, [sp, #12]
 8000ae6:	685b      	ldr	r3, [r3, #4]
 8000ae8:	9303      	str	r3, [sp, #12]
 8000aea:	9b03      	ldr	r3, [sp, #12]
 8000aec:	685b      	ldr	r3, [r3, #4]
 8000aee:	681b      	ldr	r3, [r3, #0]
 8000af0:	9a02      	ldr	r2, [sp, #8]
 8000af2:	429a      	cmp	r2, r3
 8000af4:	d2f6      	bcs.n	8000ae4 <vListInsert+0x24>
 8000af6:	9b03      	ldr	r3, [sp, #12]
 8000af8:	685a      	ldr	r2, [r3, #4]
 8000afa:	9b00      	ldr	r3, [sp, #0]
 8000afc:	605a      	str	r2, [r3, #4]
 8000afe:	9b00      	ldr	r3, [sp, #0]
 8000b00:	685b      	ldr	r3, [r3, #4]
 8000b02:	9a00      	ldr	r2, [sp, #0]
 8000b04:	609a      	str	r2, [r3, #8]
 8000b06:	9b00      	ldr	r3, [sp, #0]
 8000b08:	9a03      	ldr	r2, [sp, #12]
 8000b0a:	609a      	str	r2, [r3, #8]
 8000b0c:	9b03      	ldr	r3, [sp, #12]
 8000b0e:	9a00      	ldr	r2, [sp, #0]
 8000b10:	605a      	str	r2, [r3, #4]
 8000b12:	9b00      	ldr	r3, [sp, #0]
 8000b14:	9a01      	ldr	r2, [sp, #4]
 8000b16:	611a      	str	r2, [r3, #16]
 8000b18:	9b01      	ldr	r3, [sp, #4]
 8000b1a:	681b      	ldr	r3, [r3, #0]
 8000b1c:	1c5a      	adds	r2, r3, #1
 8000b1e:	9b01      	ldr	r3, [sp, #4]
 8000b20:	601a      	str	r2, [r3, #0]
 8000b22:	bf00      	nop
 8000b24:	b004      	add	sp, #16
 8000b26:	4770      	bx	lr

08000b28 <vListInitialiseItem>:
 8000b28:	b082      	sub	sp, #8
 8000b2a:	9001      	str	r0, [sp, #4]
 8000b2c:	9b01      	ldr	r3, [sp, #4]
 8000b2e:	2200      	movs	r2, #0
 8000b30:	611a      	str	r2, [r3, #16]
 8000b32:	bf00      	nop
 8000b34:	b002      	add	sp, #8
 8000b36:	4770      	bx	lr

08000b38 <vListInitialise>:
 8000b38:	b082      	sub	sp, #8
 8000b3a:	9001      	str	r0, [sp, #4]
 8000b3c:	9b01      	ldr	r3, [sp, #4]
 8000b3e:	f103 0208 	add.w	r2, r3, #8
 8000b42:	9b01      	ldr	r3, [sp, #4]
 8000b44:	605a      	str	r2, [r3, #4]
 8000b46:	9b01      	ldr	r3, [sp, #4]
 8000b48:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
 8000b4c:	609a      	str	r2, [r3, #8]
 8000b4e:	9b01      	ldr	r3, [sp, #4]
 8000b50:	f103 0208 	add.w	r2, r3, #8
 8000b54:	9b01      	ldr	r3, [sp, #4]
 8000b56:	60da      	str	r2, [r3, #12]
 8000b58:	9b01      	ldr	r3, [sp, #4]
 8000b5a:	f103 0208 	add.w	r2, r3, #8
 8000b5e:	9b01      	ldr	r3, [sp, #4]
 8000b60:	611a      	str	r2, [r3, #16]
 8000b62:	9b01      	ldr	r3, [sp, #4]
 8000b64:	2200      	movs	r2, #0
 8000b66:	601a      	str	r2, [r3, #0]
 8000b68:	bf00      	nop
 8000b6a:	b002      	add	sp, #8
 8000b6c:	4770      	bx	lr
	...

08000b70 <OLED_I2C_Init>:
 8000b70:	b500      	push	{lr}
 8000b72:	b083      	sub	sp, #12
 8000b74:	2101      	movs	r1, #1
 8000b76:	2008      	movs	r0, #8
 8000b78:	f001 f9ec 	bl	8001f54 <RCC_APB2PeriphClockCmd>
 8000b7c:	2314      	movs	r3, #20
 8000b7e:	f88d 3007 	strb.w	r3, [sp, #7]
 8000b82:	2303      	movs	r3, #3
 8000b84:	f88d 3006 	strb.w	r3, [sp, #6]
 8000b88:	f44f 7380 	mov.w	r3, #256	@ 0x100
 8000b8c:	f8ad 3004 	strh.w	r3, [sp, #4]
 8000b90:	ab01      	add	r3, sp, #4
 8000b92:	4619      	mov	r1, r3
 8000b94:	480d      	ldr	r0, [pc, #52]	@ (8000bcc <OLED_I2C_Init+0x5c>)
 8000b96:	f000 fce6 	bl	8001566 <GPIO_Init>
 8000b9a:	f44f 7300 	mov.w	r3, #512	@ 0x200
 8000b9e:	f8ad 3004 	strh.w	r3, [sp, #4]
 8000ba2:	ab01      	add	r3, sp, #4
 8000ba4:	4619      	mov	r1, r3
 8000ba6:	4809      	ldr	r0, [pc, #36]	@ (8000bcc <OLED_I2C_Init+0x5c>)
 8000ba8:	f000 fcdd 	bl	8001566 <GPIO_Init>
 8000bac:	2201      	movs	r2, #1
 8000bae:	f44f 7100 	mov.w	r1, #512	@ 0x200
 8000bb2:	4806      	ldr	r0, [pc, #24]	@ (8000bcc <OLED_I2C_Init+0x5c>)
 8000bb4:	f000 fdfc 	bl	80017b0 <GPIO_WriteBit>
 8000bb8:	2201      	movs	r2, #1
 8000bba:	f44f 7180 	mov.w	r1, #256	@ 0x100
 8000bbe:	4803      	ldr	r0, [pc, #12]	@ (8000bcc <OLED_I2C_Init+0x5c>)
 8000bc0:	f000 fdf6 	bl	80017b0 <GPIO_WriteBit>
 8000bc4:	bf00      	nop
 8000bc6:	b003      	add	sp, #12
 8000bc8:	f85d fb04 	ldr.w	pc, [sp], #4
 8000bcc:	40010c00 	.word	0x40010c00

08000bd0 <OLED_I2C_Start>:
 8000bd0:	b508      	push	{r3, lr}
 8000bd2:	2201      	movs	r2, #1
 8000bd4:	f44f 7180 	mov.w	r1, #256	@ 0x100
 8000bd8:	480b      	ldr	r0, [pc, #44]	@ (8000c08 <OLED_I2C_Start+0x38>)
 8000bda:	f000 fde9 	bl	80017b0 <GPIO_WriteBit>
 8000bde:	2201      	movs	r2, #1
 8000be0:	f44f 7100 	mov.w	r1, #512	@ 0x200
 8000be4:	4808      	ldr	r0, [pc, #32]	@ (8000c08 <OLED_I2C_Start+0x38>)
 8000be6:	f000 fde3 	bl	80017b0 <GPIO_WriteBit>
 8000bea:	2200      	movs	r2, #0
 8000bec:	f44f 7180 	mov.w	r1, #256	@ 0x100
 8000bf0:	4805      	ldr	r0, [pc, #20]	@ (8000c08 <OLED_I2C_Start+0x38>)
 8000bf2:	f000 fddd 	bl	80017b0 <GPIO_WriteBit>
 8000bf6:	2200      	movs	r2, #0
 8000bf8:	f44f 7100 	mov.w	r1, #512	@ 0x200
 8000bfc:	4802      	ldr	r0, [pc, #8]	@ (8000c08 <OLED_I2C_Start+0x38>)
 8000bfe:	f000 fdd7 	bl	80017b0 <GPIO_WriteBit>
 8000c02:	bf00      	nop
 8000c04:	bd08      	pop	{r3, pc}
 8000c06:	bf00      	nop
 8000c08:	40010c00 	.word	0x40010c00

08000c0c <OLED_I2C_Stop>:
 8000c0c:	b508      	push	{r3, lr}
 8000c0e:	2200      	movs	r2, #0
 8000c10:	f44f 7180 	mov.w	r1, #256	@ 0x100
 8000c14:	4808      	ldr	r0, [pc, #32]	@ (8000c38 <OLED_I2C_Stop+0x2c>)
 8000c16:	f000 fdcb 	bl	80017b0 <GPIO_WriteBit>
 8000c1a:	2201      	movs	r2, #1
 8000c1c:	f44f 7100 	mov.w	r1, #512	@ 0x200
 8000c20:	4805      	ldr	r0, [pc, #20]	@ (8000c38 <OLED_I2C_Stop+0x2c>)
 8000c22:	f000 fdc5 	bl	80017b0 <GPIO_WriteBit>
 8000c26:	2201      	movs	r2, #1
 8000c28:	f44f 7180 	mov.w	r1, #256	@ 0x100
 8000c2c:	4802      	ldr	r0, [pc, #8]	@ (8000c38 <OLED_I2C_Stop+0x2c>)
 8000c2e:	f000 fdbf 	bl	80017b0 <GPIO_WriteBit>
 8000c32:	bf00      	nop
 8000c34:	bd08      	pop	{r3, pc}
 8000c36:	bf00      	nop
 8000c38:	40010c00 	.word	0x40010c00

08000c3c <OLED_I2C_SendByte>:
 8000c3c:	b500      	push	{lr}
 8000c3e:	b085      	sub	sp, #20
 8000c40:	4603      	mov	r3, r0
 8000c42:	f88d 3007 	strb.w	r3, [sp, #7]
 8000c46:	2300      	movs	r3, #0
 8000c48:	f88d 300f 	strb.w	r3, [sp, #15]
 8000c4c:	e023      	b.n	8000c96 <OLED_I2C_SendByte+0x5a>
 8000c4e:	f89d 2007 	ldrb.w	r2, [sp, #7]
 8000c52:	f89d 300f 	ldrb.w	r3, [sp, #15]
 8000c56:	2180      	movs	r1, #128	@ 0x80
 8000c58:	fa41 f303 	asr.w	r3, r1, r3
 8000c5c:	4013      	ands	r3, r2
 8000c5e:	2b00      	cmp	r3, #0
 8000c60:	bf14      	ite	ne
 8000c62:	2301      	movne	r3, #1
 8000c64:	2300      	moveq	r3, #0
 8000c66:	b2db      	uxtb	r3, r3
 8000c68:	461a      	mov	r2, r3
 8000c6a:	f44f 7180 	mov.w	r1, #256	@ 0x100
 8000c6e:	4814      	ldr	r0, [pc, #80]	@ (8000cc0 <OLED_I2C_SendByte+0x84>)
 8000c70:	f000 fd9e 	bl	80017b0 <GPIO_WriteBit>
 8000c74:	2201      	movs	r2, #1
 8000c76:	f44f 7100 	mov.w	r1, #512	@ 0x200
 8000c7a:	4811      	ldr	r0, [pc, #68]	@ (8000cc0 <OLED_I2C_SendByte+0x84>)
 8000c7c:	f000 fd98 	bl	80017b0 <GPIO_WriteBit>
 8000c80:	2200      	movs	r2, #0
 8000c82:	f44f 7100 	mov.w	r1, #512	@ 0x200
 8000c86:	480e      	ldr	r0, [pc, #56]	@ (8000cc0 <OLED_I2C_SendByte+0x84>)
 8000c88:	f000 fd92 	bl	80017b0 <GPIO_WriteBit>
 8000c8c:	f89d 300f 	ldrb.w	r3, [sp, #15]
 8000c90:	3301      	adds	r3, #1
 8000c92:	f88d 300f 	strb.w	r3, [sp, #15]
 8000c96:	f89d 300f 	ldrb.w	r3, [sp, #15]
 8000c9a:	2b07      	cmp	r3, #7
 8000c9c:	d9d7      	bls.n	8000c4e <OLED_I2C_SendByte+0x12>
 8000c9e:	2201      	movs	r2, #1
 8000ca0:	f44f 7100 	mov.w	r1, #512	@ 0x200
 8000ca4:	4806      	ldr	r0, [pc, #24]	@ (8000cc0 <OLED_I2C_SendByte+0x84>)
 8000ca6:	f000 fd83 	bl	80017b0 <GPIO_WriteBit>
 8000caa:	2200      	movs	r2, #0
 8000cac:	f44f 7100 	mov.w	r1, #512	@ 0x200
 8000cb0:	4803      	ldr	r0, [pc, #12]	@ (8000cc0 <OLED_I2C_SendByte+0x84>)
 8000cb2:	f000 fd7d 	bl	80017b0 <GPIO_WriteBit>
 8000cb6:	bf00      	nop
 8000cb8:	b005      	add	sp, #20
 8000cba:	f85d fb04 	ldr.w	pc, [sp], #4
 8000cbe:	bf00      	nop
 8000cc0:	40010c00 	.word	0x40010c00

08000cc4 <OLED_WriteCommand>:
 8000cc4:	b500      	push	{lr}
 8000cc6:	b083      	sub	sp, #12
 8000cc8:	4603      	mov	r3, r0
 8000cca:	f88d 3007 	strb.w	r3, [sp, #7]
 8000cce:	f7ff ff7f 	bl	8000bd0 <OLED_I2C_Start>
 8000cd2:	2078      	movs	r0, #120	@ 0x78
 8000cd4:	f7ff ffb2 	bl	8000c3c <OLED_I2C_SendByte>
 8000cd8:	2000      	movs	r0, #0
 8000cda:	f7ff ffaf 	bl	8000c3c <OLED_I2C_SendByte>
 8000cde:	f89d 3007 	ldrb.w	r3, [sp, #7]
 8000ce2:	4618      	mov	r0, r3
 8000ce4:	f7ff ffaa 	bl	8000c3c <OLED_I2C_SendByte>
 8000ce8:	f7ff ff90 	bl	8000c0c <OLED_I2C_Stop>
 8000cec:	bf00      	nop
 8000cee:	b003      	add	sp, #12
 8000cf0:	f85d fb04 	ldr.w	pc, [sp], #4

08000cf4 <OLED_WriteData>:
 8000cf4:	b500      	push	{lr}
 8000cf6:	b083      	sub	sp, #12
 8000cf8:	4603      	mov	r3, r0
 8000cfa:	f88d 3007 	strb.w	r3, [sp, #7]
 8000cfe:	f7ff ff67 	bl	8000bd0 <OLED_I2C_Start>
 8000d02:	2078      	movs	r0, #120	@ 0x78
 8000d04:	f7ff ff9a 	bl	8000c3c <OLED_I2C_SendByte>
 8000d08:	2040      	movs	r0, #64	@ 0x40
 8000d0a:	f7ff ff97 	bl	8000c3c <OLED_I2C_SendByte>
 8000d0e:	f89d 3007 	ldrb.w	r3, [sp, #7]
 8000d12:	4618      	mov	r0, r3
 8000d14:	f7ff ff92 	bl	8000c3c <OLED_I2C_SendByte>
 8000d18:	f7ff ff78 	bl	8000c0c <OLED_I2C_Stop>
 8000d1c:	bf00      	nop
 8000d1e:	b003      	add	sp, #12
 8000d20:	f85d fb04 	ldr.w	pc, [sp], #4

08000d24 <OLED_SetCursor>:
 8000d24:	b500      	push	{lr}
 8000d26:	b083      	sub	sp, #12
 8000d28:	4603      	mov	r3, r0
 8000d2a:	460a      	mov	r2, r1
 8000d2c:	f88d 3007 	strb.w	r3, [sp, #7]
 8000d30:	4613      	mov	r3, r2
 8000d32:	f88d 3006 	strb.w	r3, [sp, #6]
 8000d36:	f89d 3007 	ldrb.w	r3, [sp, #7]
 8000d3a:	f063 034f 	orn	r3, r3, #79	@ 0x4f
 8000d3e:	b2db      	uxtb	r3, r3
 8000d40:	4618      	mov	r0, r3
 8000d42:	f7ff ffbf 	bl	8000cc4 <OLED_WriteCommand>
 8000d46:	f89d 3006 	ldrb.w	r3, [sp, #6]
 8000d4a:	091b      	lsrs	r3, r3, #4
 8000d4c:	b2db      	uxtb	r3, r3
 8000d4e:	f043 0310 	orr.w	r3, r3, #16
 8000d52:	b2db      	uxtb	r3, r3
 8000d54:	4618      	mov	r0, r3
 8000d56:	f7ff ffb5 	bl	8000cc4 <OLED_WriteCommand>
 8000d5a:	f89d 3006 	ldrb.w	r3, [sp, #6]
 8000d5e:	f003 030f 	and.w	r3, r3, #15
 8000d62:	b2db      	uxtb	r3, r3
 8000d64:	4618      	mov	r0, r3
 8000d66:	f7ff ffad 	bl	8000cc4 <OLED_WriteCommand>
 8000d6a:	bf00      	nop
 8000d6c:	b003      	add	sp, #12
 8000d6e:	f85d fb04 	ldr.w	pc, [sp], #4

08000d72 <OLED_Clear>:
 8000d72:	b500      	push	{lr}
 8000d74:	b083      	sub	sp, #12
 8000d76:	2300      	movs	r3, #0
 8000d78:	f88d 3006 	strb.w	r3, [sp, #6]
 8000d7c:	e01a      	b.n	8000db4 <OLED_Clear+0x42>
 8000d7e:	f89d 3006 	ldrb.w	r3, [sp, #6]
 8000d82:	2100      	movs	r1, #0
 8000d84:	4618      	mov	r0, r3
 8000d86:	f7ff ffcd 	bl	8000d24 <OLED_SetCursor>
 8000d8a:	2300      	movs	r3, #0
 8000d8c:	f88d 3007 	strb.w	r3, [sp, #7]
 8000d90:	e007      	b.n	8000da2 <OLED_Clear+0x30>
 8000d92:	2000      	movs	r0, #0
 8000d94:	f7ff ffae 	bl	8000cf4 <OLED_WriteData>
 8000d98:	f89d 3007 	ldrb.w	r3, [sp, #7]
 8000d9c:	3301      	adds	r3, #1
 8000d9e:	f88d 3007 	strb.w	r3, [sp, #7]
 8000da2:	f99d 3007 	ldrsb.w	r3, [sp, #7]
 8000da6:	2b00      	cmp	r3, #0
 8000da8:	daf3      	bge.n	8000d92 <OLED_Clear+0x20>
 8000daa:	f89d 3006 	ldrb.w	r3, [sp, #6]
 8000dae:	3301      	adds	r3, #1
 8000db0:	f88d 3006 	strb.w	r3, [sp, #6]
 8000db4:	f89d 3006 	ldrb.w	r3, [sp, #6]
 8000db8:	2b07      	cmp	r3, #7
 8000dba:	d9e0      	bls.n	8000d7e <OLED_Clear+0xc>
 8000dbc:	bf00      	nop
 8000dbe:	bf00      	nop
 8000dc0:	b003      	add	sp, #12
 8000dc2:	f85d fb04 	ldr.w	pc, [sp], #4

08000dc6 <OLED_ShowChar>:
 8000dc6:	b500      	push	{lr}
 8000dc8:	b085      	sub	sp, #20
 8000dca:	4603      	mov	r3, r0
 8000dcc:	f88d 3007 	strb.w	r3, [sp, #7]
 8000dd0:	460b      	mov	r3, r1
 8000dd2:	f88d 3006 	strb.w	r3, [sp, #6]
 8000dd6:	4613      	mov	r3, r2
 8000dd8:	f88d 3005 	strb.w	r3, [sp, #5]
 8000ddc:	f89d 3007 	ldrb.w	r3, [sp, #7]
 8000de0:	3b01      	subs	r3, #1
 8000de2:	b2db      	uxtb	r3, r3
 8000de4:	005b      	lsls	r3, r3, #1
 8000de6:	b2da      	uxtb	r2, r3
 8000de8:	f89d 3006 	ldrb.w	r3, [sp, #6]
 8000dec:	3b01      	subs	r3, #1
 8000dee:	b2db      	uxtb	r3, r3
 8000df0:	00db      	lsls	r3, r3, #3
 8000df2:	b2db      	uxtb	r3, r3
 8000df4:	4619      	mov	r1, r3
 8000df6:	4610      	mov	r0, r2
 8000df8:	f7ff ff94 	bl	8000d24 <OLED_SetCursor>
 8000dfc:	2300      	movs	r3, #0
 8000dfe:	f88d 300f 	strb.w	r3, [sp, #15]
 8000e02:	e012      	b.n	8000e2a <OLED_ShowChar+0x64>
 8000e04:	f89d 3005 	ldrb.w	r3, [sp, #5]
 8000e08:	f1a3 0220 	sub.w	r2, r3, #32
 8000e0c:	f89d 300f 	ldrb.w	r3, [sp, #15]
 8000e10:	4920      	ldr	r1, [pc, #128]	@ (8000e94 <OLED_ShowChar+0xce>)
 8000e12:	0112      	lsls	r2, r2, #4
 8000e14:	440a      	add	r2, r1
 8000e16:	4413      	add	r3, r2
 8000e18:	781b      	ldrb	r3, [r3, #0]
 8000e1a:	4618      	mov	r0, r3
 8000e1c:	f7ff ff6a 	bl	8000cf4 <OLED_WriteData>
 8000e20:	f89d 300f 	ldrb.w	r3, [sp, #15]
 8000e24:	3301      	adds	r3, #1
 8000e26:	f88d 300f 	strb.w	r3, [sp, #15]
 8000e2a:	f89d 300f 	ldrb.w	r3, [sp, #15]
 8000e2e:	2b07      	cmp	r3, #7
 8000e30:	d9e8      	bls.n	8000e04 <OLED_ShowChar+0x3e>
 8000e32:	f89d 3007 	ldrb.w	r3, [sp, #7]
 8000e36:	005b      	lsls	r3, r3, #1
 8000e38:	b2db      	uxtb	r3, r3
 8000e3a:	3b01      	subs	r3, #1
 8000e3c:	b2da      	uxtb	r2, r3
 8000e3e:	f89d 3006 	ldrb.w	r3, [sp, #6]
 8000e42:	3b01      	subs	r3, #1
 8000e44:	b2db      	uxtb	r3, r3
 8000e46:	00db      	lsls	r3, r3, #3
 8000e48:	b2db      	uxtb	r3, r3
 8000e4a:	4619      	mov	r1, r3
 8000e4c:	4610      	mov	r0, r2
 8000e4e:	f7ff ff69 	bl	8000d24 <OLED_SetCursor>
 8000e52:	2300      	movs	r3, #0
 8000e54:	f88d 300f 	strb.w	r3, [sp, #15]
 8000e58:	e013      	b.n	8000e82 <OLED_ShowChar+0xbc>
 8000e5a:	f89d 3005 	ldrb.w	r3, [sp, #5]
 8000e5e:	f1a3 0220 	sub.w	r2, r3, #32
 8000e62:	f89d 300f 	ldrb.w	r3, [sp, #15]
 8000e66:	3308      	adds	r3, #8
 8000e68:	490a      	ldr	r1, [pc, #40]	@ (8000e94 <OLED_ShowChar+0xce>)
 8000e6a:	0112      	lsls	r2, r2, #4
 8000e6c:	440a      	add	r2, r1
 8000e6e:	4413      	add	r3, r2
 8000e70:	781b      	ldrb	r3, [r3, #0]
 8000e72:	4618      	mov	r0, r3
 8000e74:	f7ff ff3e 	bl	8000cf4 <OLED_WriteData>
 8000e78:	f89d 300f 	ldrb.w	r3, [sp, #15]
 8000e7c:	3301      	adds	r3, #1
 8000e7e:	f88d 300f 	strb.w	r3, [sp, #15]
 8000e82:	f89d 300f 	ldrb.w	r3, [sp, #15]
 8000e86:	2b07      	cmp	r3, #7
 8000e88:	d9e7      	bls.n	8000e5a <OLED_ShowChar+0x94>
 8000e8a:	bf00      	nop
 8000e8c:	bf00      	nop
 8000e8e:	b005      	add	sp, #20
 8000e90:	f85d fb04 	ldr.w	pc, [sp], #4
 8000e94:	0800010c 	.word	0x0800010c

08000e98 <OLED_ShowString>:
 8000e98:	b500      	push	{lr}
 8000e9a:	b085      	sub	sp, #20
 8000e9c:	4603      	mov	r3, r0
 8000e9e:	9200      	str	r2, [sp, #0]
 8000ea0:	f88d 3007 	strb.w	r3, [sp, #7]
 8000ea4:	460b      	mov	r3, r1
 8000ea6:	f88d 3006 	strb.w	r3, [sp, #6]
 8000eaa:	2300      	movs	r3, #0
 8000eac:	f88d 300f 	strb.w	r3, [sp, #15]
 8000eb0:	e014      	b.n	8000edc <OLED_ShowString+0x44>
 8000eb2:	f89d 2006 	ldrb.w	r2, [sp, #6]
 8000eb6:	f89d 300f 	ldrb.w	r3, [sp, #15]
 8000eba:	4413      	add	r3, r2
 8000ebc:	b2d9      	uxtb	r1, r3
 8000ebe:	f89d 300f 	ldrb.w	r3, [sp, #15]
 8000ec2:	9a00      	ldr	r2, [sp, #0]
 8000ec4:	4413      	add	r3, r2
 8000ec6:	781a      	ldrb	r2, [r3, #0]
 8000ec8:	f89d 3007 	ldrb.w	r3, [sp, #7]
 8000ecc:	4618      	mov	r0, r3
 8000ece:	f7ff ff7a 	bl	8000dc6 <OLED_ShowChar>
 8000ed2:	f89d 300f 	ldrb.w	r3, [sp, #15]
 8000ed6:	3301      	adds	r3, #1
 8000ed8:	f88d 300f 	strb.w	r3, [sp, #15]
 8000edc:	f89d 300f 	ldrb.w	r3, [sp, #15]
 8000ee0:	9a00      	ldr	r2, [sp, #0]
 8000ee2:	4413      	add	r3, r2
 8000ee4:	781b      	ldrb	r3, [r3, #0]
 8000ee6:	2b00      	cmp	r3, #0
 8000ee8:	d1e3      	bne.n	8000eb2 <OLED_ShowString+0x1a>
 8000eea:	bf00      	nop
 8000eec:	bf00      	nop
 8000eee:	b005      	add	sp, #20
 8000ef0:	f85d fb04 	ldr.w	pc, [sp], #4

08000ef4 <OLED_Pow>:
 8000ef4:	b084      	sub	sp, #16
 8000ef6:	9001      	str	r0, [sp, #4]
 8000ef8:	9100      	str	r1, [sp, #0]
 8000efa:	2301      	movs	r3, #1
 8000efc:	9303      	str	r3, [sp, #12]
 8000efe:	e004      	b.n	8000f0a <OLED_Pow+0x16>
 8000f00:	9b03      	ldr	r3, [sp, #12]
 8000f02:	9a01      	ldr	r2, [sp, #4]
 8000f04:	fb02 f303 	mul.w	r3, r2, r3
 8000f08:	9303      	str	r3, [sp, #12]
 8000f0a:	9b00      	ldr	r3, [sp, #0]
 8000f0c:	1e5a      	subs	r2, r3, #1
 8000f0e:	9200      	str	r2, [sp, #0]
 8000f10:	2b00      	cmp	r3, #0
 8000f12:	d1f5      	bne.n	8000f00 <OLED_Pow+0xc>
 8000f14:	9b03      	ldr	r3, [sp, #12]
 8000f16:	4618      	mov	r0, r3
 8000f18:	b004      	add	sp, #16
 8000f1a:	4770      	bx	lr

08000f1c <OLED_ShowNum>:
 8000f1c:	b510      	push	{r4, lr}
 8000f1e:	b084      	sub	sp, #16
 8000f20:	9200      	str	r2, [sp, #0]
 8000f22:	461a      	mov	r2, r3
 8000f24:	4603      	mov	r3, r0
 8000f26:	f88d 3007 	strb.w	r3, [sp, #7]
 8000f2a:	460b      	mov	r3, r1
 8000f2c:	f88d 3006 	strb.w	r3, [sp, #6]
 8000f30:	4613      	mov	r3, r2
 8000f32:	f88d 3005 	strb.w	r3, [sp, #5]
 8000f36:	2300      	movs	r3, #0
 8000f38:	f88d 300f 	strb.w	r3, [sp, #15]
 8000f3c:	e02a      	b.n	8000f94 <OLED_ShowNum+0x78>
 8000f3e:	f89d 2006 	ldrb.w	r2, [sp, #6]
 8000f42:	f89d 300f 	ldrb.w	r3, [sp, #15]
 8000f46:	4413      	add	r3, r2
 8000f48:	b2dc      	uxtb	r4, r3
 8000f4a:	f89d 2005 	ldrb.w	r2, [sp, #5]
 8000f4e:	f89d 300f 	ldrb.w	r3, [sp, #15]
 8000f52:	1ad3      	subs	r3, r2, r3
 8000f54:	3b01      	subs	r3, #1
 8000f56:	4619      	mov	r1, r3
 8000f58:	200a      	movs	r0, #10
 8000f5a:	f7ff ffcb 	bl	8000ef4 <OLED_Pow>
 8000f5e:	4602      	mov	r2, r0
 8000f60:	9b00      	ldr	r3, [sp, #0]
 8000f62:	fbb3 f1f2 	udiv	r1, r3, r2
 8000f66:	4b10      	ldr	r3, [pc, #64]	@ (8000fa8 <OLED_ShowNum+0x8c>)
 8000f68:	fba3 2301 	umull	r2, r3, r3, r1
 8000f6c:	08da      	lsrs	r2, r3, #3
 8000f6e:	4613      	mov	r3, r2
 8000f70:	009b      	lsls	r3, r3, #2
 8000f72:	4413      	add	r3, r2
 8000f74:	005b      	lsls	r3, r3, #1
 8000f76:	1aca      	subs	r2, r1, r3
 8000f78:	b2d3      	uxtb	r3, r2
 8000f7a:	3330      	adds	r3, #48	@ 0x30
 8000f7c:	b2da      	uxtb	r2, r3
 8000f7e:	f89d 3007 	ldrb.w	r3, [sp, #7]
 8000f82:	4621      	mov	r1, r4
 8000f84:	4618      	mov	r0, r3
 8000f86:	f7ff ff1e 	bl	8000dc6 <OLED_ShowChar>
 8000f8a:	f89d 300f 	ldrb.w	r3, [sp, #15]
 8000f8e:	3301      	adds	r3, #1
 8000f90:	f88d 300f 	strb.w	r3, [sp, #15]
 8000f94:	f89d 200f 	ldrb.w	r2, [sp, #15]
 8000f98:	f89d 3005 	ldrb.w	r3, [sp, #5]
 8000f9c:	429a      	cmp	r2, r3
 8000f9e:	d3ce      	bcc.n	8000f3e <OLED_ShowNum+0x22>
 8000fa0:	bf00      	nop
 8000fa2:	bf00      	nop
 8000fa4:	b004      	add	sp, #16
 8000fa6:	bd10      	pop	{r4, pc}
 8000fa8:	cccccccd 	.word	0xcccccccd

08000fac <OLED_ShowSignedNum>:
 8000fac:	b510      	push	{r4, lr}
 8000fae:	b084      	sub	sp, #16
 8000fb0:	9200      	str	r2, [sp, #0]
 8000fb2:	461a      	mov	r2, r3
 8000fb4:	4603      	mov	r3, r0
 8000fb6:	f88d 3007 	strb.w	r3, [sp, #7]
 8000fba:	460b      	mov	r3, r1
 8000fbc:	f88d 3006 	strb.w	r3, [sp, #6]
 8000fc0:	4613      	mov	r3, r2
 8000fc2:	f88d 3005 	strb.w	r3, [sp, #5]
 8000fc6:	9b00      	ldr	r3, [sp, #0]
 8000fc8:	2b00      	cmp	r3, #0
 8000fca:	db0a      	blt.n	8000fe2 <OLED_ShowSignedNum+0x36>
 8000fcc:	f89d 1006 	ldrb.w	r1, [sp, #6]
 8000fd0:	f89d 3007 	ldrb.w	r3, [sp, #7]
 8000fd4:	222b      	movs	r2, #43	@ 0x2b
 8000fd6:	4618      	mov	r0, r3
 8000fd8:	f7ff fef5 	bl	8000dc6 <OLED_ShowChar>
 8000fdc:	9b00      	ldr	r3, [sp, #0]
 8000fde:	9302      	str	r3, [sp, #8]
 8000fe0:	e00a      	b.n	8000ff8 <OLED_ShowSignedNum+0x4c>
 8000fe2:	f89d 1006 	ldrb.w	r1, [sp, #6]
 8000fe6:	f89d 3007 	ldrb.w	r3, [sp, #7]
 8000fea:	222d      	movs	r2, #45	@ 0x2d
 8000fec:	4618      	mov	r0, r3
 8000fee:	f7ff feea 	bl	8000dc6 <OLED_ShowChar>
 8000ff2:	9b00      	ldr	r3, [sp, #0]
 8000ff4:	425b      	negs	r3, r3
 8000ff6:	9302      	str	r3, [sp, #8]
 8000ff8:	2300      	movs	r3, #0
 8000ffa:	f88d 300f 	strb.w	r3, [sp, #15]
 8000ffe:	e02c      	b.n	800105a <OLED_ShowSignedNum+0xae>
 8001000:	f89d 2006 	ldrb.w	r2, [sp, #6]
 8001004:	f89d 300f 	ldrb.w	r3, [sp, #15]
 8001008:	4413      	add	r3, r2
 800100a:	b2db      	uxtb	r3, r3
 800100c:	3301      	adds	r3, #1
 800100e:	b2dc      	uxtb	r4, r3
 8001010:	f89d 2005 	ldrb.w	r2, [sp, #5]
 8001014:	f89d 300f 	ldrb.w	r3, [sp, #15]
 8001018:	1ad3      	subs	r3, r2, r3
 800101a:	3b01      	subs	r3, #1
 800101c:	4619      	mov	r1, r3
 800101e:	200a      	movs	r0, #10
 8001020:	f7ff ff68 	bl	8000ef4 <OLED_Pow>
 8001024:	4602      	mov	r2, r0
 8001026:	9b02      	ldr	r3, [sp, #8]
 8001028:	fbb3 f1f2 	udiv	r1, r3, r2
 800102c:	4b10      	ldr	r3, [pc, #64]	@ (8001070 <OLED_ShowSignedNum+0xc4>)
 800102e:	fba3 2301 	umull	r2, r3, r3, r1
 8001032:	08da      	lsrs	r2, r3, #3
 8001034:	4613      	mov	r3, r2
 8001036:	009b      	lsls	r3, r3, #2
 8001038:	4413      	add	r3, r2
 800103a:	005b      	lsls	r3, r3, #1
 800103c:	1aca      	subs	r2, r1, r3
 800103e:	b2d3      	uxtb	r3, r2
 8001040:	3330      	adds	r3, #48	@ 0x30
 8001042:	b2da      	uxtb	r2, r3
 8001044:	f89d 3007 	ldrb.w	r3, [sp, #7]
 8001048:	4621      	mov	r1, r4
 800104a:	4618      	mov	r0, r3
 800104c:	f7ff febb 	bl	8000dc6 <OLED_ShowChar>
 8001050:	f89d 300f 	ldrb.w	r3, [sp, #15]
 8001054:	3301      	adds	r3, #1
 8001056:	f88d 300f 	strb.w	r3, [sp, #15]
 800105a:	f89d 200f 	ldrb.w	r2, [sp, #15]
 800105e:	f89d 3005 	ldrb.w	r3, [sp, #5]
 8001062:	429a      	cmp	r2, r3
 8001064:	d3cc      	bcc.n	8001000 <OLED_ShowSignedNum+0x54>
 8001066:	bf00      	nop
 8001068:	bf00      	nop
 800106a:	b004      	add	sp, #16
 800106c:	bd10      	pop	{r4, pc}
 800106e:	bf00      	nop
 8001070:	cccccccd 	.word	0xcccccccd

08001074 <OLED_ShowHexNum>:
 8001074:	b500      	push	{lr}
 8001076:	b085      	sub	sp, #20
 8001078:	9200      	str	r2, [sp, #0]
 800107a:	461a      	mov	r2, r3
 800107c:	4603      	mov	r3, r0
 800107e:	f88d 3007 	strb.w	r3, [sp, #7]
 8001082:	460b      	mov	r3, r1
 8001084:	f88d 3006 	strb.w	r3, [sp, #6]
 8001088:	4613      	mov	r3, r2
 800108a:	f88d 3005 	strb.w	r3, [sp, #5]
 800108e:	2300      	movs	r3, #0
 8001090:	f88d 300f 	strb.w	r3, [sp, #15]
 8001094:	e03a      	b.n	800110c <OLED_ShowHexNum+0x98>
 8001096:	f89d 2005 	ldrb.w	r2, [sp, #5]
 800109a:	f89d 300f 	ldrb.w	r3, [sp, #15]
 800109e:	1ad3      	subs	r3, r2, r3
 80010a0:	3b01      	subs	r3, #1
 80010a2:	4619      	mov	r1, r3
 80010a4:	2010      	movs	r0, #16
 80010a6:	f7ff ff25 	bl	8000ef4 <OLED_Pow>
 80010aa:	4602      	mov	r2, r0
 80010ac:	9b00      	ldr	r3, [sp, #0]
 80010ae:	fbb3 f3f2 	udiv	r3, r3, r2
 80010b2:	b2db      	uxtb	r3, r3
 80010b4:	f003 030f 	and.w	r3, r3, #15
 80010b8:	f88d 300e 	strb.w	r3, [sp, #14]
 80010bc:	f89d 300e 	ldrb.w	r3, [sp, #14]
 80010c0:	2b09      	cmp	r3, #9
 80010c2:	d80f      	bhi.n	80010e4 <OLED_ShowHexNum+0x70>
 80010c4:	f89d 2006 	ldrb.w	r2, [sp, #6]
 80010c8:	f89d 300f 	ldrb.w	r3, [sp, #15]
 80010cc:	4413      	add	r3, r2
 80010ce:	b2d9      	uxtb	r1, r3
 80010d0:	f89d 300e 	ldrb.w	r3, [sp, #14]
 80010d4:	3330      	adds	r3, #48	@ 0x30
 80010d6:	b2da      	uxtb	r2, r3
 80010d8:	f89d 3007 	ldrb.w	r3, [sp, #7]
 80010dc:	4618      	mov	r0, r3
 80010de:	f7ff fe72 	bl	8000dc6 <OLED_ShowChar>
 80010e2:	e00e      	b.n	8001102 <OLED_ShowHexNum+0x8e>
 80010e4:	f89d 2006 	ldrb.w	r2, [sp, #6]
 80010e8:	f89d 300f 	ldrb.w	r3, [sp, #15]
 80010ec:	4413      	add	r3, r2
 80010ee:	b2d9      	uxtb	r1, r3
 80010f0:	f89d 300e 	ldrb.w	r3, [sp, #14]
 80010f4:	3337      	adds	r3, #55	@ 0x37
 80010f6:	b2da      	uxtb	r2, r3
 80010f8:	f89d 3007 	ldrb.w	r3, [sp, #7]
 80010fc:	4618      	mov	r0, r3
 80010fe:	f7ff fe62 	bl	8000dc6 <OLED_ShowChar>
 8001102:	f89d 300f 	ldrb.w	r3, [sp, #15]
 8001106:	3301      	adds	r3, #1
 8001108:	f88d 300f 	strb.w	r3, [sp, #15]
 800110c:	f89d 200f 	ldrb.w	r2, [sp, #15]
 8001110:	f89d 3005 	ldrb.w	r3, [sp, #5]
 8001114:	429a      	cmp	r2, r3
 8001116:	d3be      	bcc.n	8001096 <OLED_ShowHexNum+0x22>
 8001118:	bf00      	nop
 800111a:	bf00      	nop
 800111c:	b005      	add	sp, #20
 800111e:	f85d fb04 	ldr.w	pc, [sp], #4

08001122 <OLED_ShowBinNum>:
 8001122:	b510      	push	{r4, lr}
 8001124:	b084      	sub	sp, #16
 8001126:	9200      	str	r2, [sp, #0]
 8001128:	461a      	mov	r2, r3
 800112a:	4603      	mov	r3, r0
 800112c:	f88d 3007 	strb.w	r3, [sp, #7]
 8001130:	460b      	mov	r3, r1
 8001132:	f88d 3006 	strb.w	r3, [sp, #6]
 8001136:	4613      	mov	r3, r2
 8001138:	f88d 3005 	strb.w	r3, [sp, #5]
 800113c:	2300      	movs	r3, #0
 800113e:	f88d 300f 	strb.w	r3, [sp, #15]
 8001142:	e024      	b.n	800118e <OLED_ShowBinNum+0x6c>
 8001144:	f89d 2006 	ldrb.w	r2, [sp, #6]
 8001148:	f89d 300f 	ldrb.w	r3, [sp, #15]
 800114c:	4413      	add	r3, r2
 800114e:	b2dc      	uxtb	r4, r3
 8001150:	f89d 2005 	ldrb.w	r2, [sp, #5]
 8001154:	f89d 300f 	ldrb.w	r3, [sp, #15]
 8001158:	1ad3      	subs	r3, r2, r3
 800115a:	3b01      	subs	r3, #1
 800115c:	4619      	mov	r1, r3
 800115e:	2002      	movs	r0, #2
 8001160:	f7ff fec8 	bl	8000ef4 <OLED_Pow>
 8001164:	4602      	mov	r2, r0
 8001166:	9b00      	ldr	r3, [sp, #0]
 8001168:	fbb3 f3f2 	udiv	r3, r3, r2
 800116c:	b2db      	uxtb	r3, r3
 800116e:	f003 0301 	and.w	r3, r3, #1
 8001172:	b2db      	uxtb	r3, r3
 8001174:	3330      	adds	r3, #48	@ 0x30
 8001176:	b2da      	uxtb	r2, r3
 8001178:	f89d 3007 	ldrb.w	r3, [sp, #7]
 800117c:	4621      	mov	r1, r4
 800117e:	4618      	mov	r0, r3
 8001180:	f7ff fe21 	bl	8000dc6 <OLED_ShowChar>
 8001184:	f89d 300f 	ldrb.w	r3, [sp, #15]
 8001188:	3301      	adds	r3, #1
 800118a:	f88d 300f 	strb.w	r3, [sp, #15]
 800118e:	f89d 200f 	ldrb.w	r2, [sp, #15]
 8001192:	f89d 3005 	ldrb.w	r3, [sp, #5]
 8001196:	429a      	cmp	r2, r3
 8001198:	d3d4      	bcc.n	8001144 <OLED_ShowBinNum+0x22>
 800119a:	bf00      	nop
 800119c:	bf00      	nop
 800119e:	b004      	add	sp, #16
 80011a0:	bd10      	pop	{r4, pc}

080011a2 <OLED_Init>:
 80011a2:	b500      	push	{lr}
 80011a4:	b083      	sub	sp, #12
 80011a6:	2300      	movs	r3, #0
 80011a8:	9301      	str	r3, [sp, #4]
 80011aa:	e00c      	b.n	80011c6 <OLED_Init+0x24>
 80011ac:	2300      	movs	r3, #0
 80011ae:	9300      	str	r3, [sp, #0]
 80011b0:	e002      	b.n	80011b8 <OLED_Init+0x16>
 80011b2:	9b00      	ldr	r3, [sp, #0]
 80011b4:	3301      	adds	r3, #1
 80011b6:	9300      	str	r3, [sp, #0]
 80011b8:	9b00      	ldr	r3, [sp, #0]
 80011ba:	f5b3 7f7a 	cmp.w	r3, #1000	@ 0x3e8
 80011be:	d3f8      	bcc.n	80011b2 <OLED_Init+0x10>
 80011c0:	9b01      	ldr	r3, [sp, #4]
 80011c2:	3301      	adds	r3, #1
 80011c4:	9301      	str	r3, [sp, #4]
 80011c6:	9b01      	ldr	r3, [sp, #4]
 80011c8:	f5b3 7f7a 	cmp.w	r3, #1000	@ 0x3e8
 80011cc:	d3ee      	bcc.n	80011ac <OLED_Init+0xa>
 80011ce:	f7ff fccf 	bl	8000b70 <OLED_I2C_Init>
 80011d2:	20ae      	movs	r0, #174	@ 0xae
 80011d4:	f7ff fd76 	bl	8000cc4 <OLED_WriteCommand>
 80011d8:	20d5      	movs	r0, #213	@ 0xd5
 80011da:	f7ff fd73 	bl	8000cc4 <OLED_WriteCommand>
 80011de:	2080      	movs	r0, #128	@ 0x80
 80011e0:	f7ff fd70 	bl	8000cc4 <OLED_WriteCommand>
 80011e4:	20a8      	movs	r0, #168	@ 0xa8
 80011e6:	f7ff fd6d 	bl	8000cc4 <OLED_WriteCommand>
 80011ea:	203f      	movs	r0, #63	@ 0x3f
 80011ec:	f7ff fd6a 	bl	8000cc4 <OLED_WriteCommand>
 80011f0:	20d3      	movs	r0, #211	@ 0xd3
 80011f2:	f7ff fd67 	bl	8000cc4 <OLED_WriteCommand>
 80011f6:	2000      	movs	r0, #0
 80011f8:	f7ff fd64 	bl	8000cc4 <OLED_WriteCommand>
 80011fc:	2040      	movs	r0, #64	@ 0x40
 80011fe:	f7ff fd61 	bl	8000cc4 <OLED_WriteCommand>
 8001202:	20a1      	movs	r0, #161	@ 0xa1
 8001204:	f7ff fd5e 	bl	8000cc4 <OLED_WriteCommand>
 8001208:	20c8      	movs	r0, #200	@ 0xc8
 800120a:	f7ff fd5b 	bl	8000cc4 <OLED_WriteCommand>
 800120e:	20da      	movs	r0, #218	@ 0xda
 8001210:	f7ff fd58 	bl	8000cc4 <OLED_WriteCommand>
 8001214:	2012      	movs	r0, #18
 8001216:	f7ff fd55 	bl	8000cc4 <OLED_WriteCommand>
 800121a:	2081      	movs	r0, #129	@ 0x81
 800121c:	f7ff fd52 	bl	8000cc4 <OLED_WriteCommand>
 8001220:	20cf      	movs	r0, #207	@ 0xcf
 8001222:	f7ff fd4f 	bl	8000cc4 <OLED_WriteCommand>
 8001226:	20d9      	movs	r0, #217	@ 0xd9
 8001228:	f7ff fd4c 	bl	8000cc4 <OLED_WriteCommand>
 800122c:	20f1      	movs	r0, #241	@ 0xf1
 800122e:	f7ff fd49 	bl	8000cc4 <OLED_WriteCommand>
 8001232:	20db      	movs	r0, #219	@ 0xdb
 8001234:	f7ff fd46 	bl	8000cc4 <OLED_WriteCommand>
 8001238:	2030      	movs	r0, #48	@ 0x30
 800123a:	f7ff fd43 	bl	8000cc4 <OLED_WriteCommand>
 800123e:	20a4      	movs	r0, #164	@ 0xa4
 8001240:	f7ff fd40 	bl	8000cc4 <OLED_WriteCommand>
 8001244:	20a6      	movs	r0, #166	@ 0xa6
 8001246:	f7ff fd3d 	bl	8000cc4 <OLED_WriteCommand>
 800124a:	208d      	movs	r0, #141	@ 0x8d
 800124c:	f7ff fd3a 	bl	8000cc4 <OLED_WriteCommand>
 8001250:	2014      	movs	r0, #20
 8001252:	f7ff fd37 	bl	8000cc4 <OLED_WriteCommand>
 8001256:	20af      	movs	r0, #175	@ 0xaf
 8001258:	f7ff fd34 	bl	8000cc4 <OLED_WriteCommand>
 800125c:	f7ff fd89 	bl	8000d72 <OLED_Clear>
 8001260:	bf00      	nop
 8001262:	b003      	add	sp, #12
 8001264:	f85d fb04 	ldr.w	pc, [sp], #4
	...

08001270 <prvTaskExitError>:
 8001270:	b082      	sub	sp, #8
 8001272:	f04f 0310 	mov.w	r3, #16
 8001276:	f383 8811 	msr	BASEPRI, r3
 800127a:	f3bf 8f6f 	isb	sy
 800127e:	f3bf 8f4f 	dsb	sy
 8001282:	9301      	str	r3, [sp, #4]
 8001284:	bf00      	nop
 8001286:	e7fe      	b.n	8001286 <prvTaskExitError+0x16>

08001288 <pxPortInitialiseStack>:
 8001288:	b084      	sub	sp, #16
 800128a:	9003      	str	r0, [sp, #12]
 800128c:	9102      	str	r1, [sp, #8]
 800128e:	9201      	str	r2, [sp, #4]
 8001290:	9b03      	ldr	r3, [sp, #12]
 8001292:	3b04      	subs	r3, #4
 8001294:	9303      	str	r3, [sp, #12]
 8001296:	9b03      	ldr	r3, [sp, #12]
 8001298:	f04f 7280 	mov.w	r2, #16777216	@ 0x1000000
 800129c:	601a      	str	r2, [r3, #0]
 800129e:	9b03      	ldr	r3, [sp, #12]
 80012a0:	3b04      	subs	r3, #4
 80012a2:	9303      	str	r3, [sp, #12]
 80012a4:	9b02      	ldr	r3, [sp, #8]
 80012a6:	f023 0201 	bic.w	r2, r3, #1
 80012aa:	9b03      	ldr	r3, [sp, #12]
 80012ac:	601a      	str	r2, [r3, #0]
 80012ae:	9b03      	ldr	r3, [sp, #12]
 80012b0:	3b04      	subs	r3, #4
 80012b2:	9303      	str	r3, [sp, #12]
 80012b4:	4a07      	ldr	r2, [pc, #28]	@ (80012d4 <pxPortInitialiseStack+0x4c>)
 80012b6:	9b03      	ldr	r3, [sp, #12]
 80012b8:	601a      	str	r2, [r3, #0]
 80012ba:	9b03      	ldr	r3, [sp, #12]
 80012bc:	3b14      	subs	r3, #20
 80012be:	9303      	str	r3, [sp, #12]
 80012c0:	9a01      	ldr	r2, [sp, #4]
 80012c2:	9b03      	ldr	r3, [sp, #12]
 80012c4:	601a      	str	r2, [r3, #0]
 80012c6:	9b03      	ldr	r3, [sp, #12]
 80012c8:	3b20      	subs	r3, #32
 80012ca:	9303      	str	r3, [sp, #12]
 80012cc:	9b03      	ldr	r3, [sp, #12]
 80012ce:	4618      	mov	r0, r3
 80012d0:	b004      	add	sp, #16
 80012d2:	4770      	bx	lr
 80012d4:	08001271 	.word	0x08001271

080012d8 <vPortEnterCritical>:
 80012d8:	b082      	sub	sp, #8
 80012da:	f04f 0310 	mov.w	r3, #16
 80012de:	f383 8811 	msr	BASEPRI, r3
 80012e2:	f3bf 8f6f 	isb	sy
 80012e6:	f3bf 8f4f 	dsb	sy
 80012ea:	9301      	str	r3, [sp, #4]
 80012ec:	bf00      	nop
 80012ee:	4b04      	ldr	r3, [pc, #16]	@ (8001300 <vPortEnterCritical+0x28>)
 80012f0:	681b      	ldr	r3, [r3, #0]
 80012f2:	3301      	adds	r3, #1
 80012f4:	4a02      	ldr	r2, [pc, #8]	@ (8001300 <vPortEnterCritical+0x28>)
 80012f6:	6013      	str	r3, [r2, #0]
 80012f8:	bf00      	nop
 80012fa:	b002      	add	sp, #8
 80012fc:	4770      	bx	lr
 80012fe:	bf00      	nop
 8001300:	20000000 	.word	0x20000000

08001304 <vPortExitCritical>:
 8001304:	b082      	sub	sp, #8
 8001306:	4b09      	ldr	r3, [pc, #36]	@ (800132c <vPortExitCritical+0x28>)
 8001308:	681b      	ldr	r3, [r3, #0]
 800130a:	3b01      	subs	r3, #1
 800130c:	4a07      	ldr	r2, [pc, #28]	@ (800132c <vPortExitCritical+0x28>)
 800130e:	6013      	str	r3, [r2, #0]
 8001310:	4b06      	ldr	r3, [pc, #24]	@ (800132c <vPortExitCritical+0x28>)
 8001312:	681b      	ldr	r3, [r3, #0]
 8001314:	2b00      	cmp	r3, #0
 8001316:	d105      	bne.n	8001324 <vPortExitCritical+0x20>
 8001318:	2300      	movs	r3, #0
 800131a:	9301      	str	r3, [sp, #4]
 800131c:	9b01      	ldr	r3, [sp, #4]
 800131e:	f383 8811 	msr	BASEPRI, r3
 8001322:	bf00      	nop
 8001324:	bf00      	nop
 8001326:	b002      	add	sp, #8
 8001328:	4770      	bx	lr
 800132a:	bf00      	nop
 800132c:	20000000 	.word	0x20000000

08001330 <vPortSetupTimerInterrupt>:
 8001330:	4b03      	ldr	r3, [pc, #12]	@ (8001340 <vPortSetupTimerInterrupt+0x10>)
 8001332:	4a04      	ldr	r2, [pc, #16]	@ (8001344 <vPortSetupTimerInterrupt+0x14>)
 8001334:	601a      	str	r2, [r3, #0]
 8001336:	4b04      	ldr	r3, [pc, #16]	@ (8001348 <vPortSetupTimerInterrupt+0x18>)
 8001338:	2207      	movs	r2, #7
 800133a:	601a      	str	r2, [r3, #0]
 800133c:	bf00      	nop
 800133e:	4770      	bx	lr
 8001340:	e000e014 	.word	0xe000e014
 8001344:	0001193f 	.word	0x0001193f
 8001348:	e000e010 	.word	0xe000e010

0800134c <prvPortStartFirstTask>:
 800134c:	4846      	ldr	r0, [pc, #280]	@ (8001468 <pxCurrentTCBConst2+0x8>)
 800134e:	6800      	ldr	r0, [r0, #0]
 8001350:	6800      	ldr	r0, [r0, #0]
 8001352:	f380 8808 	msr	MSP, r0
 8001356:	b662      	cpsie	i
 8001358:	b661      	cpsie	f
 800135a:	f3bf 8f4f 	dsb	sy
 800135e:	f3bf 8f6f 	isb	sy
 8001362:	df00      	svc	0
 8001364:	bf00      	nop
 8001366:	bf00      	nop
 8001368:	4770      	bx	lr

0800136a <xPortStartScheduler>:
 800136a:	b508      	push	{r3, lr}
 800136c:	4b0b      	ldr	r3, [pc, #44]	@ (800139c <xPortStartScheduler+0x32>)
 800136e:	681b      	ldr	r3, [r3, #0]
 8001370:	4a0a      	ldr	r2, [pc, #40]	@ (800139c <xPortStartScheduler+0x32>)
 8001372:	f443 0370 	orr.w	r3, r3, #15728640	@ 0xf00000
 8001376:	6013      	str	r3, [r2, #0]
 8001378:	4b08      	ldr	r3, [pc, #32]	@ (800139c <xPortStartScheduler+0x32>)
 800137a:	681b      	ldr	r3, [r3, #0]
 800137c:	4a07      	ldr	r2, [pc, #28]	@ (800139c <xPortStartScheduler+0x32>)
 800137e:	f043 4370 	orr.w	r3, r3, #4026531840	@ 0xf0000000
 8001382:	6013      	str	r3, [r2, #0]
 8001384:	f7ff ffd4 	bl	8001330 <vPortSetupTimerInterrupt>
 8001388:	4b05      	ldr	r3, [pc, #20]	@ (80013a0 <xPortStartScheduler+0x36>)
 800138a:	2200      	movs	r2, #0
 800138c:	601a      	str	r2, [r3, #0]
 800138e:	f7ff ffdd 	bl	800134c <prvPortStartFirstTask>
 8001392:	f7ff ff6d 	bl	8001270 <prvTaskExitError>
 8001396:	2300      	movs	r3, #0
 8001398:	4618      	mov	r0, r3
 800139a:	bd08      	pop	{r3, pc}
 800139c:	e000ed20 	.word	0xe000ed20
 80013a0:	20000000 	.word	0x20000000

080013a4 <SysTick_Handler>:
 80013a4:	b500      	push	{lr}
 80013a6:	b083      	sub	sp, #12
 80013a8:	f04f 0310 	mov.w	r3, #16
 80013ac:	f383 8811 	msr	BASEPRI, r3
 80013b0:	f3bf 8f6f 	isb	sy
 80013b4:	f3bf 8f4f 	dsb	sy
 80013b8:	9301      	str	r3, [sp, #4]
 80013ba:	bf00      	nop
 80013bc:	f001 f988 	bl	80026d0 <xTaskIncrementTick>
 80013c0:	4603      	mov	r3, r0
 80013c2:	2b00      	cmp	r3, #0
 80013c4:	d003      	beq.n	80013ce <SysTick_Handler+0x2a>
 80013c6:	4b07      	ldr	r3, [pc, #28]	@ (80013e4 <SysTick_Handler+0x40>)
 80013c8:	f04f 5280 	mov.w	r2, #268435456	@ 0x10000000
 80013cc:	601a      	str	r2, [r3, #0]
 80013ce:	2300      	movs	r3, #0
 80013d0:	9300      	str	r3, [sp, #0]
 80013d2:	9b00      	ldr	r3, [sp, #0]
 80013d4:	f383 8811 	msr	BASEPRI, r3
 80013d8:	bf00      	nop
 80013da:	bf00      	nop
 80013dc:	b003      	add	sp, #12
 80013de:	f85d fb04 	ldr.w	pc, [sp], #4
 80013e2:	bf00      	nop
 80013e4:	e000ed04 	.word	0xe000ed04

080013e8 <PendSV_Handler>:
 80013e8:	f3ef 8009 	mrs	r0, PSP
 80013ec:	f3bf 8f6f 	isb	sy
 80013f0:	4b0f      	ldr	r3, [pc, #60]	@ (8001430 <pxCurrentTCBConst>)
 80013f2:	681a      	ldr	r2, [r3, #0]
 80013f4:	e920 0ff0 	stmdb	r0!, {r4, r5, r6, r7, r8, r9, sl, fp}
 80013f8:	6010      	str	r0, [r2, #0]
 80013fa:	e92d 4008 	stmdb	sp!, {r3, lr}
 80013fe:	f04f 0010 	mov.w	r0, #16
 8001402:	f380 8811 	msr	BASEPRI, r0
 8001406:	f001 fb1b 	bl	8002a40 <vTaskSwitchContext>
 800140a:	f04f 0000 	mov.w	r0, #0
 800140e:	f380 8811 	msr	BASEPRI, r0
 8001412:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001416:	6819      	ldr	r1, [r3, #0]
 8001418:	6808      	ldr	r0, [r1, #0]
 800141a:	e8b0 0ff0 	ldmia.w	r0!, {r4, r5, r6, r7, r8, r9, sl, fp}
 800141e:	f380 8809 	msr	PSP, r0
 8001422:	f3bf 8f6f 	isb	sy
 8001426:	4770      	bx	lr
 8001428:	f3af 8000 	nop.w
 800142c:	f3af 8000 	nop.w

08001430 <pxCurrentTCBConst>:
 8001430:	20002920 	.word	0x20002920
 8001434:	bf00      	nop
 8001436:	4770      	bx	lr

08001438 <SVC_Handler>:
 8001438:	4b09      	ldr	r3, [pc, #36]	@ (8001460 <pxCurrentTCBConst2>)
 800143a:	6819      	ldr	r1, [r3, #0]
 800143c:	6808      	ldr	r0, [r1, #0]
 800143e:	e8b0 0ff0 	ldmia.w	r0!, {r4, r5, r6, r7, r8, r9, sl, fp}
 8001442:	f380 8809 	msr	PSP, r0
 8001446:	f3bf 8f6f 	isb	sy
 800144a:	f04f 0000 	mov.w	r0, #0
 800144e:	f380 8811 	msr	BASEPRI, r0
 8001452:	f04e 0e0d 	orr.w	lr, lr, #13
 8001456:	4770      	bx	lr
 8001458:	f3af 8000 	nop.w
 800145c:	f3af 8000 	nop.w

08001460 <pxCurrentTCBConst2>:
 8001460:	20002920 	.word	0x20002920
 8001464:	bf00      	nop
 8001466:	4770      	bx	lr
 8001468:	e000ed08 	.word	0xe000ed08

0800146c <GPIO_DeInit>:
 800146c:	b500      	push	{lr}
 800146e:	b083      	sub	sp, #12
 8001470:	9001      	str	r0, [sp, #4]
 8001472:	9b01      	ldr	r3, [sp, #4]
 8001474:	4a2f      	ldr	r2, [pc, #188]	@ (8001534 <GPIO_DeInit+0xc8>)
 8001476:	4293      	cmp	r3, r2
 8001478:	d108      	bne.n	800148c <GPIO_DeInit+0x20>
 800147a:	2101      	movs	r1, #1
 800147c:	2004      	movs	r0, #4
 800147e:	f000 fda1 	bl	8001fc4 <RCC_APB2PeriphResetCmd>
 8001482:	2100      	movs	r1, #0
 8001484:	2004      	movs	r0, #4
 8001486:	f000 fd9d 	bl	8001fc4 <RCC_APB2PeriphResetCmd>
 800148a:	e04e      	b.n	800152a <GPIO_DeInit+0xbe>
 800148c:	9b01      	ldr	r3, [sp, #4]
 800148e:	4a2a      	ldr	r2, [pc, #168]	@ (8001538 <GPIO_DeInit+0xcc>)
 8001490:	4293      	cmp	r3, r2
 8001492:	d108      	bne.n	80014a6 <GPIO_DeInit+0x3a>
 8001494:	2101      	movs	r1, #1
 8001496:	2008      	movs	r0, #8
 8001498:	f000 fd94 	bl	8001fc4 <RCC_APB2PeriphResetCmd>
 800149c:	2100      	movs	r1, #0
 800149e:	2008      	movs	r0, #8
 80014a0:	f000 fd90 	bl	8001fc4 <RCC_APB2PeriphResetCmd>
 80014a4:	e041      	b.n	800152a <GPIO_DeInit+0xbe>
 80014a6:	9b01      	ldr	r3, [sp, #4]
 80014a8:	4a24      	ldr	r2, [pc, #144]	@ (800153c <GPIO_DeInit+0xd0>)
 80014aa:	4293      	cmp	r3, r2
 80014ac:	d108      	bne.n	80014c0 <GPIO_DeInit+0x54>
 80014ae:	2101      	movs	r1, #1
 80014b0:	2010      	movs	r0, #16
 80014b2:	f000 fd87 	bl	8001fc4 <RCC_APB2PeriphResetCmd>
 80014b6:	2100      	movs	r1, #0
 80014b8:	2010      	movs	r0, #16
 80014ba:	f000 fd83 	bl	8001fc4 <RCC_APB2PeriphResetCmd>
 80014be:	e034      	b.n	800152a <GPIO_DeInit+0xbe>
 80014c0:	9b01      	ldr	r3, [sp, #4]
 80014c2:	4a1f      	ldr	r2, [pc, #124]	@ (8001540 <GPIO_DeInit+0xd4>)
 80014c4:	4293      	cmp	r3, r2
 80014c6:	d108      	bne.n	80014da <GPIO_DeInit+0x6e>
 80014c8:	2101      	movs	r1, #1
 80014ca:	2020      	movs	r0, #32
 80014cc:	f000 fd7a 	bl	8001fc4 <RCC_APB2PeriphResetCmd>
 80014d0:	2100      	movs	r1, #0
 80014d2:	2020      	movs	r0, #32
 80014d4:	f000 fd76 	bl	8001fc4 <RCC_APB2PeriphResetCmd>
 80014d8:	e027      	b.n	800152a <GPIO_DeInit+0xbe>
 80014da:	9b01      	ldr	r3, [sp, #4]
 80014dc:	4a19      	ldr	r2, [pc, #100]	@ (8001544 <GPIO_DeInit+0xd8>)
 80014de:	4293      	cmp	r3, r2
 80014e0:	d108      	bne.n	80014f4 <GPIO_DeInit+0x88>
 80014e2:	2101      	movs	r1, #1
 80014e4:	2040      	movs	r0, #64	@ 0x40
 80014e6:	f000 fd6d 	bl	8001fc4 <RCC_APB2PeriphResetCmd>
 80014ea:	2100      	movs	r1, #0
 80014ec:	2040      	movs	r0, #64	@ 0x40
 80014ee:	f000 fd69 	bl	8001fc4 <RCC_APB2PeriphResetCmd>
 80014f2:	e01a      	b.n	800152a <GPIO_DeInit+0xbe>
 80014f4:	9b01      	ldr	r3, [sp, #4]
 80014f6:	4a14      	ldr	r2, [pc, #80]	@ (8001548 <GPIO_DeInit+0xdc>)
 80014f8:	4293      	cmp	r3, r2
 80014fa:	d108      	bne.n	800150e <GPIO_DeInit+0xa2>
 80014fc:	2101      	movs	r1, #1
 80014fe:	2080      	movs	r0, #128	@ 0x80
 8001500:	f000 fd60 	bl	8001fc4 <RCC_APB2PeriphResetCmd>
 8001504:	2100      	movs	r1, #0
 8001506:	2080      	movs	r0, #128	@ 0x80
 8001508:	f000 fd5c 	bl	8001fc4 <RCC_APB2PeriphResetCmd>
 800150c:	e00d      	b.n	800152a <GPIO_DeInit+0xbe>
 800150e:	9b01      	ldr	r3, [sp, #4]
 8001510:	4a0e      	ldr	r2, [pc, #56]	@ (800154c <GPIO_DeInit+0xe0>)
 8001512:	4293      	cmp	r3, r2
 8001514:	d109      	bne.n	800152a <GPIO_DeInit+0xbe>
 8001516:	2101      	movs	r1, #1
 8001518:	f44f 7080 	mov.w	r0, #256	@ 0x100
 800151c:	f000 fd52 	bl	8001fc4 <RCC_APB2PeriphResetCmd>
 8001520:	2100      	movs	r1, #0
 8001522:	f44f 7080 	mov.w	r0, #256	@ 0x100
 8001526:	f000 fd4d 	bl	8001fc4 <RCC_APB2PeriphResetCmd>
 800152a:	bf00      	nop
 800152c:	b003      	add	sp, #12
 800152e:	f85d fb04 	ldr.w	pc, [sp], #4
 8001532:	bf00      	nop
 8001534:	40010800 	.word	0x40010800
 8001538:	40010c00 	.word	0x40010c00
 800153c:	40011000 	.word	0x40011000
 8001540:	40011400 	.word	0x40011400
 8001544:	40011800 	.word	0x40011800
 8001548:	40011c00 	.word	0x40011c00
 800154c:	40012000 	.word	0x40012000

08001550 <GPIO_AFIODeInit>:
 8001550:	b508      	push	{r3, lr}
 8001552:	2101      	movs	r1, #1
 8001554:	2001      	movs	r0, #1
 8001556:	f000 fd35 	bl	8001fc4 <RCC_APB2PeriphResetCmd>
 800155a:	2100      	movs	r1, #0
 800155c:	2001      	movs	r0, #1
 800155e:	f000 fd31 	bl	8001fc4 <RCC_APB2PeriphResetCmd>
 8001562:	bf00      	nop
 8001564:	bd08      	pop	{r3, pc}

08001566 <GPIO_Init>:
 8001566:	b088      	sub	sp, #32
 8001568:	9001      	str	r0, [sp, #4]
 800156a:	9100      	str	r1, [sp, #0]
 800156c:	2300      	movs	r3, #0
 800156e:	9307      	str	r3, [sp, #28]
 8001570:	2300      	movs	r3, #0
 8001572:	9304      	str	r3, [sp, #16]
 8001574:	2300      	movs	r3, #0
 8001576:	9306      	str	r3, [sp, #24]
 8001578:	2300      	movs	r3, #0
 800157a:	9303      	str	r3, [sp, #12]
 800157c:	2300      	movs	r3, #0
 800157e:	9305      	str	r3, [sp, #20]
 8001580:	2300      	movs	r3, #0
 8001582:	9302      	str	r3, [sp, #8]
 8001584:	9b00      	ldr	r3, [sp, #0]
 8001586:	78db      	ldrb	r3, [r3, #3]
 8001588:	f003 030f 	and.w	r3, r3, #15
 800158c:	9307      	str	r3, [sp, #28]
 800158e:	9b00      	ldr	r3, [sp, #0]
 8001590:	78db      	ldrb	r3, [r3, #3]
 8001592:	f003 0310 	and.w	r3, r3, #16
 8001596:	2b00      	cmp	r3, #0
 8001598:	d005      	beq.n	80015a6 <GPIO_Init+0x40>
 800159a:	9b00      	ldr	r3, [sp, #0]
 800159c:	789b      	ldrb	r3, [r3, #2]
 800159e:	461a      	mov	r2, r3
 80015a0:	9b07      	ldr	r3, [sp, #28]
 80015a2:	4313      	orrs	r3, r2
 80015a4:	9307      	str	r3, [sp, #28]
 80015a6:	9b00      	ldr	r3, [sp, #0]
 80015a8:	881b      	ldrh	r3, [r3, #0]
 80015aa:	b2db      	uxtb	r3, r3
 80015ac:	2b00      	cmp	r3, #0
 80015ae:	d044      	beq.n	800163a <GPIO_Init+0xd4>
 80015b0:	9b01      	ldr	r3, [sp, #4]
 80015b2:	681b      	ldr	r3, [r3, #0]
 80015b4:	9305      	str	r3, [sp, #20]
 80015b6:	2300      	movs	r3, #0
 80015b8:	9306      	str	r3, [sp, #24]
 80015ba:	e038      	b.n	800162e <GPIO_Init+0xc8>
 80015bc:	2201      	movs	r2, #1
 80015be:	9b06      	ldr	r3, [sp, #24]
 80015c0:	fa02 f303 	lsl.w	r3, r2, r3
 80015c4:	9303      	str	r3, [sp, #12]
 80015c6:	9b00      	ldr	r3, [sp, #0]
 80015c8:	881b      	ldrh	r3, [r3, #0]
 80015ca:	461a      	mov	r2, r3
 80015cc:	9b03      	ldr	r3, [sp, #12]
 80015ce:	4013      	ands	r3, r2
 80015d0:	9304      	str	r3, [sp, #16]
 80015d2:	9a04      	ldr	r2, [sp, #16]
 80015d4:	9b03      	ldr	r3, [sp, #12]
 80015d6:	429a      	cmp	r2, r3
 80015d8:	d126      	bne.n	8001628 <GPIO_Init+0xc2>
 80015da:	9b06      	ldr	r3, [sp, #24]
 80015dc:	009b      	lsls	r3, r3, #2
 80015de:	9303      	str	r3, [sp, #12]
 80015e0:	220f      	movs	r2, #15
 80015e2:	9b03      	ldr	r3, [sp, #12]
 80015e4:	fa02 f303 	lsl.w	r3, r2, r3
 80015e8:	9302      	str	r3, [sp, #8]
 80015ea:	9b02      	ldr	r3, [sp, #8]
 80015ec:	43db      	mvns	r3, r3
 80015ee:	9a05      	ldr	r2, [sp, #20]
 80015f0:	4013      	ands	r3, r2
 80015f2:	9305      	str	r3, [sp, #20]
 80015f4:	9a07      	ldr	r2, [sp, #28]
 80015f6:	9b03      	ldr	r3, [sp, #12]
 80015f8:	fa02 f303 	lsl.w	r3, r2, r3
 80015fc:	9a05      	ldr	r2, [sp, #20]
 80015fe:	4313      	orrs	r3, r2
 8001600:	9305      	str	r3, [sp, #20]
 8001602:	9b00      	ldr	r3, [sp, #0]
 8001604:	78db      	ldrb	r3, [r3, #3]
 8001606:	2b28      	cmp	r3, #40	@ 0x28
 8001608:	d105      	bne.n	8001616 <GPIO_Init+0xb0>
 800160a:	2201      	movs	r2, #1
 800160c:	9b06      	ldr	r3, [sp, #24]
 800160e:	409a      	lsls	r2, r3
 8001610:	9b01      	ldr	r3, [sp, #4]
 8001612:	615a      	str	r2, [r3, #20]
 8001614:	e008      	b.n	8001628 <GPIO_Init+0xc2>
 8001616:	9b00      	ldr	r3, [sp, #0]
 8001618:	78db      	ldrb	r3, [r3, #3]
 800161a:	2b48      	cmp	r3, #72	@ 0x48
 800161c:	d104      	bne.n	8001628 <GPIO_Init+0xc2>
 800161e:	2201      	movs	r2, #1
 8001620:	9b06      	ldr	r3, [sp, #24]
 8001622:	409a      	lsls	r2, r3
 8001624:	9b01      	ldr	r3, [sp, #4]
 8001626:	611a      	str	r2, [r3, #16]
 8001628:	9b06      	ldr	r3, [sp, #24]
 800162a:	3301      	adds	r3, #1
 800162c:	9306      	str	r3, [sp, #24]
 800162e:	9b06      	ldr	r3, [sp, #24]
 8001630:	2b07      	cmp	r3, #7
 8001632:	d9c3      	bls.n	80015bc <GPIO_Init+0x56>
 8001634:	9b01      	ldr	r3, [sp, #4]
 8001636:	9a05      	ldr	r2, [sp, #20]
 8001638:	601a      	str	r2, [r3, #0]
 800163a:	9b00      	ldr	r3, [sp, #0]
 800163c:	881b      	ldrh	r3, [r3, #0]
 800163e:	2bff      	cmp	r3, #255	@ 0xff
 8001640:	d946      	bls.n	80016d0 <GPIO_Init+0x16a>
 8001642:	9b01      	ldr	r3, [sp, #4]
 8001644:	685b      	ldr	r3, [r3, #4]
 8001646:	9305      	str	r3, [sp, #20]
 8001648:	2300      	movs	r3, #0
 800164a:	9306      	str	r3, [sp, #24]
 800164c:	e03a      	b.n	80016c4 <GPIO_Init+0x15e>
 800164e:	9b06      	ldr	r3, [sp, #24]
 8001650:	3308      	adds	r3, #8
 8001652:	2201      	movs	r2, #1
 8001654:	fa02 f303 	lsl.w	r3, r2, r3
 8001658:	9303      	str	r3, [sp, #12]
 800165a:	9b00      	ldr	r3, [sp, #0]
 800165c:	881b      	ldrh	r3, [r3, #0]
 800165e:	461a      	mov	r2, r3
 8001660:	9b03      	ldr	r3, [sp, #12]
 8001662:	4013      	ands	r3, r2
 8001664:	9304      	str	r3, [sp, #16]
 8001666:	9a04      	ldr	r2, [sp, #16]
 8001668:	9b03      	ldr	r3, [sp, #12]
 800166a:	429a      	cmp	r2, r3
 800166c:	d127      	bne.n	80016be <GPIO_Init+0x158>
 800166e:	9b06      	ldr	r3, [sp, #24]
 8001670:	009b      	lsls	r3, r3, #2
 8001672:	9303      	str	r3, [sp, #12]
 8001674:	220f      	movs	r2, #15
 8001676:	9b03      	ldr	r3, [sp, #12]
 8001678:	fa02 f303 	lsl.w	r3, r2, r3
 800167c:	9302      	str	r3, [sp, #8]
 800167e:	9b02      	ldr	r3, [sp, #8]
 8001680:	43db      	mvns	r3, r3
 8001682:	9a05      	ldr	r2, [sp, #20]
 8001684:	4013      	ands	r3, r2
 8001686:	9305      	str	r3, [sp, #20]
 8001688:	9a07      	ldr	r2, [sp, #28]
 800168a:	9b03      	ldr	r3, [sp, #12]
 800168c:	fa02 f303 	lsl.w	r3, r2, r3
 8001690:	9a05      	ldr	r2, [sp, #20]
 8001692:	4313      	orrs	r3, r2
 8001694:	9305      	str	r3, [sp, #20]
 8001696:	9b00      	ldr	r3, [sp, #0]
 8001698:	78db      	ldrb	r3, [r3, #3]
 800169a:	2b28      	cmp	r3, #40	@ 0x28
 800169c:	d105      	bne.n	80016aa <GPIO_Init+0x144>
 800169e:	9b06      	ldr	r3, [sp, #24]
 80016a0:	3308      	adds	r3, #8
 80016a2:	2201      	movs	r2, #1
 80016a4:	409a      	lsls	r2, r3
 80016a6:	9b01      	ldr	r3, [sp, #4]
 80016a8:	615a      	str	r2, [r3, #20]
 80016aa:	9b00      	ldr	r3, [sp, #0]
 80016ac:	78db      	ldrb	r3, [r3, #3]
 80016ae:	2b48      	cmp	r3, #72	@ 0x48
 80016b0:	d105      	bne.n	80016be <GPIO_Init+0x158>
 80016b2:	9b06      	ldr	r3, [sp, #24]
 80016b4:	3308      	adds	r3, #8
 80016b6:	2201      	movs	r2, #1
 80016b8:	409a      	lsls	r2, r3
 80016ba:	9b01      	ldr	r3, [sp, #4]
 80016bc:	611a      	str	r2, [r3, #16]
 80016be:	9b06      	ldr	r3, [sp, #24]
 80016c0:	3301      	adds	r3, #1
 80016c2:	9306      	str	r3, [sp, #24]
 80016c4:	9b06      	ldr	r3, [sp, #24]
 80016c6:	2b07      	cmp	r3, #7
 80016c8:	d9c1      	bls.n	800164e <GPIO_Init+0xe8>
 80016ca:	9b01      	ldr	r3, [sp, #4]
 80016cc:	9a05      	ldr	r2, [sp, #20]
 80016ce:	605a      	str	r2, [r3, #4]
 80016d0:	bf00      	nop
 80016d2:	b008      	add	sp, #32
 80016d4:	4770      	bx	lr

080016d6 <GPIO_StructInit>:
 80016d6:	b082      	sub	sp, #8
 80016d8:	9001      	str	r0, [sp, #4]
 80016da:	9b01      	ldr	r3, [sp, #4]
 80016dc:	f64f 72ff 	movw	r2, #65535	@ 0xffff
 80016e0:	801a      	strh	r2, [r3, #0]
 80016e2:	9b01      	ldr	r3, [sp, #4]
 80016e4:	2202      	movs	r2, #2
 80016e6:	709a      	strb	r2, [r3, #2]
 80016e8:	9b01      	ldr	r3, [sp, #4]
 80016ea:	2204      	movs	r2, #4
 80016ec:	70da      	strb	r2, [r3, #3]
 80016ee:	bf00      	nop
 80016f0:	b002      	add	sp, #8
 80016f2:	4770      	bx	lr

080016f4 <GPIO_ReadInputDataBit>:
 80016f4:	b084      	sub	sp, #16
 80016f6:	9001      	str	r0, [sp, #4]
 80016f8:	460b      	mov	r3, r1
 80016fa:	f8ad 3002 	strh.w	r3, [sp, #2]
 80016fe:	2300      	movs	r3, #0
 8001700:	f88d 300f 	strb.w	r3, [sp, #15]
 8001704:	9b01      	ldr	r3, [sp, #4]
 8001706:	689a      	ldr	r2, [r3, #8]
 8001708:	f8bd 3002 	ldrh.w	r3, [sp, #2]
 800170c:	4013      	ands	r3, r2
 800170e:	2b00      	cmp	r3, #0
 8001710:	d003      	beq.n	800171a <GPIO_ReadInputDataBit+0x26>
 8001712:	2301      	movs	r3, #1
 8001714:	f88d 300f 	strb.w	r3, [sp, #15]
 8001718:	e002      	b.n	8001720 <GPIO_ReadInputDataBit+0x2c>
 800171a:	2300      	movs	r3, #0
 800171c:	f88d 300f 	strb.w	r3, [sp, #15]
 8001720:	f89d 300f 	ldrb.w	r3, [sp, #15]
 8001724:	4618      	mov	r0, r3
 8001726:	b004      	add	sp, #16
 8001728:	4770      	bx	lr

0800172a <GPIO_ReadInputData>:
 800172a:	b082      	sub	sp, #8
 800172c:	9001      	str	r0, [sp, #4]
 800172e:	9b01      	ldr	r3, [sp, #4]
 8001730:	689b      	ldr	r3, [r3, #8]
 8001732:	b29b      	uxth	r3, r3
 8001734:	4618      	mov	r0, r3
 8001736:	b002      	add	sp, #8
 8001738:	4770      	bx	lr

0800173a <GPIO_ReadOutputDataBit>:
 800173a:	b084      	sub	sp, #16
 800173c:	9001      	str	r0, [sp, #4]
 800173e:	460b      	mov	r3, r1
 8001740:	f8ad 3002 	strh.w	r3, [sp, #2]
 8001744:	2300      	movs	r3, #0
 8001746:	f88d 300f 	strb.w	r3, [sp, #15]
 800174a:	9b01      	ldr	r3, [sp, #4]
 800174c:	68da      	ldr	r2, [r3, #12]
 800174e:	f8bd 3002 	ldrh.w	r3, [sp, #2]
 8001752:	4013      	ands	r3, r2
 8001754:	2b00      	cmp	r3, #0
 8001756:	d003      	beq.n	8001760 <GPIO_ReadOutputDataBit+0x26>
 8001758:	2301      	movs	r3, #1
 800175a:	f88d 300f 	strb.w	r3, [sp, #15]
 800175e:	e002      	b.n	8001766 <GPIO_ReadOutputDataBit+0x2c>
 8001760:	2300      	movs	r3, #0
 8001762:	f88d 300f 	strb.w	r3, [sp, #15]
 8001766:	f89d 300f 	ldrb.w	r3, [sp, #15]
 800176a:	4618      	mov	r0, r3
 800176c:	b004      	add	sp, #16
 800176e:	4770      	bx	lr

08001770 <GPIO_ReadOutputData>:
 8001770:	b082      	sub	sp, #8
 8001772:	9001      	str	r0, [sp, #4]
 8001774:	9b01      	ldr	r3, [sp, #4]
 8001776:	68db      	ldr	r3, [r3, #12]
 8001778:	b29b      	uxth	r3, r3
 800177a:	4618      	mov	r0, r3
 800177c:	b002      	add	sp, #8
 800177e:	4770      	bx	lr

08001780 <GPIO_SetBits>:
 8001780:	b082      	sub	sp, #8
 8001782:	9001      	str	r0, [sp, #4]
 8001784:	460b      	mov	r3, r1
 8001786:	f8ad 3002 	strh.w	r3, [sp, #2]
 800178a:	f8bd 2002 	ldrh.w	r2, [sp, #2]
 800178e:	9b01      	ldr	r3, [sp, #4]
 8001790:	611a      	str	r2, [r3, #16]
 8001792:	bf00      	nop
 8001794:	b002      	add	sp, #8
 8001796:	4770      	bx	lr

08001798 <GPIO_ResetBits>:
 8001798:	b082      	sub	sp, #8
 800179a:	9001      	str	r0, [sp, #4]
 800179c:	460b      	mov	r3, r1
 800179e:	f8ad 3002 	strh.w	r3, [sp, #2]
 80017a2:	f8bd 2002 	ldrh.w	r2, [sp, #2]
 80017a6:	9b01      	ldr	r3, [sp, #4]
 80017a8:	615a      	str	r2, [r3, #20]
 80017aa:	bf00      	nop
 80017ac:	b002      	add	sp, #8
 80017ae:	4770      	bx	lr

080017b0 <GPIO_WriteBit>:
 80017b0:	b082      	sub	sp, #8
 80017b2:	9001      	str	r0, [sp, #4]
 80017b4:	460b      	mov	r3, r1
 80017b6:	f8ad 3002 	strh.w	r3, [sp, #2]
 80017ba:	4613      	mov	r3, r2
 80017bc:	f88d 3001 	strb.w	r3, [sp, #1]
 80017c0:	f89d 3001 	ldrb.w	r3, [sp, #1]
 80017c4:	2b00      	cmp	r3, #0
 80017c6:	d004      	beq.n	80017d2 <GPIO_WriteBit+0x22>
 80017c8:	f8bd 2002 	ldrh.w	r2, [sp, #2]
 80017cc:	9b01      	ldr	r3, [sp, #4]
 80017ce:	611a      	str	r2, [r3, #16]
 80017d0:	e003      	b.n	80017da <GPIO_WriteBit+0x2a>
 80017d2:	f8bd 2002 	ldrh.w	r2, [sp, #2]
 80017d6:	9b01      	ldr	r3, [sp, #4]
 80017d8:	615a      	str	r2, [r3, #20]
 80017da:	bf00      	nop
 80017dc:	b002      	add	sp, #8
 80017de:	4770      	bx	lr

080017e0 <GPIO_Write>:
 80017e0:	b082      	sub	sp, #8
 80017e2:	9001      	str	r0, [sp, #4]
 80017e4:	460b      	mov	r3, r1
 80017e6:	f8ad 3002 	strh.w	r3, [sp, #2]
 80017ea:	f8bd 2002 	ldrh.w	r2, [sp, #2]
 80017ee:	9b01      	ldr	r3, [sp, #4]
 80017f0:	60da      	str	r2, [r3, #12]
 80017f2:	bf00      	nop
 80017f4:	b002      	add	sp, #8
 80017f6:	4770      	bx	lr

080017f8 <GPIO_PinLockConfig>:
 80017f8:	b084      	sub	sp, #16
 80017fa:	9001      	str	r0, [sp, #4]
 80017fc:	460b      	mov	r3, r1
 80017fe:	f8ad 3002 	strh.w	r3, [sp, #2]
 8001802:	f44f 3380 	mov.w	r3, #65536	@ 0x10000
 8001806:	9303      	str	r3, [sp, #12]
 8001808:	f8bd 3002 	ldrh.w	r3, [sp, #2]
 800180c:	9a03      	ldr	r2, [sp, #12]
 800180e:	4313      	orrs	r3, r2
 8001810:	9303      	str	r3, [sp, #12]
 8001812:	9b01      	ldr	r3, [sp, #4]
 8001814:	9a03      	ldr	r2, [sp, #12]
 8001816:	619a      	str	r2, [r3, #24]
 8001818:	f8bd 2002 	ldrh.w	r2, [sp, #2]
 800181c:	9b01      	ldr	r3, [sp, #4]
 800181e:	619a      	str	r2, [r3, #24]
 8001820:	9b01      	ldr	r3, [sp, #4]
 8001822:	9a03      	ldr	r2, [sp, #12]
 8001824:	619a      	str	r2, [r3, #24]
 8001826:	9b01      	ldr	r3, [sp, #4]
 8001828:	699b      	ldr	r3, [r3, #24]
 800182a:	9303      	str	r3, [sp, #12]
 800182c:	9b01      	ldr	r3, [sp, #4]
 800182e:	699b      	ldr	r3, [r3, #24]
 8001830:	9303      	str	r3, [sp, #12]
 8001832:	bf00      	nop
 8001834:	b004      	add	sp, #16
 8001836:	4770      	bx	lr

08001838 <GPIO_EventOutputConfig>:
 8001838:	b084      	sub	sp, #16
 800183a:	4603      	mov	r3, r0
 800183c:	460a      	mov	r2, r1
 800183e:	f88d 3007 	strb.w	r3, [sp, #7]
 8001842:	4613      	mov	r3, r2
 8001844:	f88d 3006 	strb.w	r3, [sp, #6]
 8001848:	2300      	movs	r3, #0
 800184a:	9303      	str	r3, [sp, #12]
 800184c:	4b0c      	ldr	r3, [pc, #48]	@ (8001880 <GPIO_EventOutputConfig+0x48>)
 800184e:	681b      	ldr	r3, [r3, #0]
 8001850:	9303      	str	r3, [sp, #12]
 8001852:	9a03      	ldr	r2, [sp, #12]
 8001854:	f64f 7380 	movw	r3, #65408	@ 0xff80
 8001858:	4013      	ands	r3, r2
 800185a:	9303      	str	r3, [sp, #12]
 800185c:	f89d 3007 	ldrb.w	r3, [sp, #7]
 8001860:	011b      	lsls	r3, r3, #4
 8001862:	9a03      	ldr	r2, [sp, #12]
 8001864:	4313      	orrs	r3, r2
 8001866:	9303      	str	r3, [sp, #12]
 8001868:	f89d 3006 	ldrb.w	r3, [sp, #6]
 800186c:	9a03      	ldr	r2, [sp, #12]
 800186e:	4313      	orrs	r3, r2
 8001870:	9303      	str	r3, [sp, #12]
 8001872:	4a03      	ldr	r2, [pc, #12]	@ (8001880 <GPIO_EventOutputConfig+0x48>)
 8001874:	9b03      	ldr	r3, [sp, #12]
 8001876:	6013      	str	r3, [r2, #0]
 8001878:	bf00      	nop
 800187a:	b004      	add	sp, #16
 800187c:	4770      	bx	lr
 800187e:	bf00      	nop
 8001880:	40010000 	.word	0x40010000

08001884 <GPIO_EventOutputCmd>:
 8001884:	b082      	sub	sp, #8
 8001886:	4603      	mov	r3, r0
 8001888:	f88d 3007 	strb.w	r3, [sp, #7]
 800188c:	4a03      	ldr	r2, [pc, #12]	@ (800189c <GPIO_EventOutputCmd+0x18>)
 800188e:	f89d 3007 	ldrb.w	r3, [sp, #7]
 8001892:	6013      	str	r3, [r2, #0]
 8001894:	bf00      	nop
 8001896:	b002      	add	sp, #8
 8001898:	4770      	bx	lr
 800189a:	bf00      	nop
 800189c:	4220001c 	.word	0x4220001c

080018a0 <GPIO_PinRemapConfig>:
 80018a0:	b086      	sub	sp, #24
 80018a2:	9001      	str	r0, [sp, #4]
 80018a4:	460b      	mov	r3, r1
 80018a6:	f88d 3003 	strb.w	r3, [sp, #3]
 80018aa:	2300      	movs	r3, #0
 80018ac:	9304      	str	r3, [sp, #16]
 80018ae:	2300      	movs	r3, #0
 80018b0:	9303      	str	r3, [sp, #12]
 80018b2:	2300      	movs	r3, #0
 80018b4:	9305      	str	r3, [sp, #20]
 80018b6:	2300      	movs	r3, #0
 80018b8:	9302      	str	r3, [sp, #8]
 80018ba:	9b01      	ldr	r3, [sp, #4]
 80018bc:	2b00      	cmp	r3, #0
 80018be:	da03      	bge.n	80018c8 <GPIO_PinRemapConfig+0x28>
 80018c0:	4b2d      	ldr	r3, [pc, #180]	@ (8001978 <GPIO_PinRemapConfig+0xd8>)
 80018c2:	69db      	ldr	r3, [r3, #28]
 80018c4:	9305      	str	r3, [sp, #20]
 80018c6:	e002      	b.n	80018ce <GPIO_PinRemapConfig+0x2e>
 80018c8:	4b2b      	ldr	r3, [pc, #172]	@ (8001978 <GPIO_PinRemapConfig+0xd8>)
 80018ca:	685b      	ldr	r3, [r3, #4]
 80018cc:	9305      	str	r3, [sp, #20]
 80018ce:	9b01      	ldr	r3, [sp, #4]
 80018d0:	0c1b      	lsrs	r3, r3, #16
 80018d2:	f003 030f 	and.w	r3, r3, #15
 80018d6:	9302      	str	r3, [sp, #8]
 80018d8:	9b01      	ldr	r3, [sp, #4]
 80018da:	b29b      	uxth	r3, r3
 80018dc:	9304      	str	r3, [sp, #16]
 80018de:	9b01      	ldr	r3, [sp, #4]
 80018e0:	f403 1340 	and.w	r3, r3, #3145728	@ 0x300000
 80018e4:	f5b3 1f40 	cmp.w	r3, #3145728	@ 0x300000
 80018e8:	d10a      	bne.n	8001900 <GPIO_PinRemapConfig+0x60>
 80018ea:	9b05      	ldr	r3, [sp, #20]
 80018ec:	f023 6370 	bic.w	r3, r3, #251658240	@ 0xf000000
 80018f0:	9305      	str	r3, [sp, #20]
 80018f2:	4b21      	ldr	r3, [pc, #132]	@ (8001978 <GPIO_PinRemapConfig+0xd8>)
 80018f4:	685b      	ldr	r3, [r3, #4]
 80018f6:	4a20      	ldr	r2, [pc, #128]	@ (8001978 <GPIO_PinRemapConfig+0xd8>)
 80018f8:	f023 6370 	bic.w	r3, r3, #251658240	@ 0xf000000
 80018fc:	6053      	str	r3, [r2, #4]
 80018fe:	e021      	b.n	8001944 <GPIO_PinRemapConfig+0xa4>
 8001900:	9b01      	ldr	r3, [sp, #4]
 8001902:	f403 1380 	and.w	r3, r3, #1048576	@ 0x100000
 8001906:	2b00      	cmp	r3, #0
 8001908:	d00e      	beq.n	8001928 <GPIO_PinRemapConfig+0x88>
 800190a:	2203      	movs	r2, #3
 800190c:	9b02      	ldr	r3, [sp, #8]
 800190e:	fa02 f303 	lsl.w	r3, r2, r3
 8001912:	9303      	str	r3, [sp, #12]
 8001914:	9b03      	ldr	r3, [sp, #12]
 8001916:	43db      	mvns	r3, r3
 8001918:	9a05      	ldr	r2, [sp, #20]
 800191a:	4013      	ands	r3, r2
 800191c:	9305      	str	r3, [sp, #20]
 800191e:	9b05      	ldr	r3, [sp, #20]
 8001920:	f043 6370 	orr.w	r3, r3, #251658240	@ 0xf000000
 8001924:	9305      	str	r3, [sp, #20]
 8001926:	e00d      	b.n	8001944 <GPIO_PinRemapConfig+0xa4>
 8001928:	9b01      	ldr	r3, [sp, #4]
 800192a:	0d5b      	lsrs	r3, r3, #21
 800192c:	011b      	lsls	r3, r3, #4
 800192e:	9a04      	ldr	r2, [sp, #16]
 8001930:	fa02 f303 	lsl.w	r3, r2, r3
 8001934:	43db      	mvns	r3, r3
 8001936:	9a05      	ldr	r2, [sp, #20]
 8001938:	4013      	ands	r3, r2
 800193a:	9305      	str	r3, [sp, #20]
 800193c:	9b05      	ldr	r3, [sp, #20]
 800193e:	f043 6370 	orr.w	r3, r3, #251658240	@ 0xf000000
 8001942:	9305      	str	r3, [sp, #20]
 8001944:	f89d 3003 	ldrb.w	r3, [sp, #3]
 8001948:	2b00      	cmp	r3, #0
 800194a:	d008      	beq.n	800195e <GPIO_PinRemapConfig+0xbe>
 800194c:	9b01      	ldr	r3, [sp, #4]
 800194e:	0d5b      	lsrs	r3, r3, #21
 8001950:	011b      	lsls	r3, r3, #4
 8001952:	9a04      	ldr	r2, [sp, #16]
 8001954:	fa02 f303 	lsl.w	r3, r2, r3
 8001958:	9a05      	ldr	r2, [sp, #20]
 800195a:	4313      	orrs	r3, r2
 800195c:	9305      	str	r3, [sp, #20]
 800195e:	9b01      	ldr	r3, [sp, #4]
 8001960:	2b00      	cmp	r3, #0
 8001962:	da03      	bge.n	800196c <GPIO_PinRemapConfig+0xcc>
 8001964:	4a04      	ldr	r2, [pc, #16]	@ (8001978 <GPIO_PinRemapConfig+0xd8>)
 8001966:	9b05      	ldr	r3, [sp, #20]
 8001968:	61d3      	str	r3, [r2, #28]
 800196a:	e002      	b.n	8001972 <GPIO_PinRemapConfig+0xd2>
 800196c:	4a02      	ldr	r2, [pc, #8]	@ (8001978 <GPIO_PinRemapConfig+0xd8>)
 800196e:	9b05      	ldr	r3, [sp, #20]
 8001970:	6053      	str	r3, [r2, #4]
 8001972:	bf00      	nop
 8001974:	b006      	add	sp, #24
 8001976:	4770      	bx	lr
 8001978:	40010000 	.word	0x40010000

0800197c <GPIO_EXTILineConfig>:
 800197c:	b084      	sub	sp, #16
 800197e:	4603      	mov	r3, r0
 8001980:	460a      	mov	r2, r1
 8001982:	f88d 3007 	strb.w	r3, [sp, #7]
 8001986:	4613      	mov	r3, r2
 8001988:	f88d 3006 	strb.w	r3, [sp, #6]
 800198c:	2300      	movs	r3, #0
 800198e:	9303      	str	r3, [sp, #12]
 8001990:	f89d 3006 	ldrb.w	r3, [sp, #6]
 8001994:	f003 0303 	and.w	r3, r3, #3
 8001998:	009b      	lsls	r3, r3, #2
 800199a:	220f      	movs	r2, #15
 800199c:	fa02 f303 	lsl.w	r3, r2, r3
 80019a0:	9303      	str	r3, [sp, #12]
 80019a2:	4a18      	ldr	r2, [pc, #96]	@ (8001a04 <GPIO_EXTILineConfig+0x88>)
 80019a4:	f89d 3006 	ldrb.w	r3, [sp, #6]
 80019a8:	089b      	lsrs	r3, r3, #2
 80019aa:	b2db      	uxtb	r3, r3
 80019ac:	3302      	adds	r3, #2
 80019ae:	f852 2023 	ldr.w	r2, [r2, r3, lsl #2]
 80019b2:	9b03      	ldr	r3, [sp, #12]
 80019b4:	43db      	mvns	r3, r3
 80019b6:	4813      	ldr	r0, [pc, #76]	@ (8001a04 <GPIO_EXTILineConfig+0x88>)
 80019b8:	f89d 1006 	ldrb.w	r1, [sp, #6]
 80019bc:	0889      	lsrs	r1, r1, #2
 80019be:	b2c9      	uxtb	r1, r1
 80019c0:	401a      	ands	r2, r3
 80019c2:	1c8b      	adds	r3, r1, #2
 80019c4:	f840 2023 	str.w	r2, [r0, r3, lsl #2]
 80019c8:	4a0e      	ldr	r2, [pc, #56]	@ (8001a04 <GPIO_EXTILineConfig+0x88>)
 80019ca:	f89d 3006 	ldrb.w	r3, [sp, #6]
 80019ce:	089b      	lsrs	r3, r3, #2
 80019d0:	b2db      	uxtb	r3, r3
 80019d2:	3302      	adds	r3, #2
 80019d4:	f852 2023 	ldr.w	r2, [r2, r3, lsl #2]
 80019d8:	f89d 1007 	ldrb.w	r1, [sp, #7]
 80019dc:	f89d 3006 	ldrb.w	r3, [sp, #6]
 80019e0:	f003 0303 	and.w	r3, r3, #3
 80019e4:	009b      	lsls	r3, r3, #2
 80019e6:	fa01 f303 	lsl.w	r3, r1, r3
 80019ea:	4806      	ldr	r0, [pc, #24]	@ (8001a04 <GPIO_EXTILineConfig+0x88>)
 80019ec:	f89d 1006 	ldrb.w	r1, [sp, #6]
 80019f0:	0889      	lsrs	r1, r1, #2
 80019f2:	b2c9      	uxtb	r1, r1
 80019f4:	431a      	orrs	r2, r3
 80019f6:	1c8b      	adds	r3, r1, #2
 80019f8:	f840 2023 	str.w	r2, [r0, r3, lsl #2]
 80019fc:	bf00      	nop
 80019fe:	b004      	add	sp, #16
 8001a00:	4770      	bx	lr
 8001a02:	bf00      	nop
 8001a04:	40010000 	.word	0x40010000

08001a08 <GPIO_ETH_MediaInterfaceConfig>:
 8001a08:	b082      	sub	sp, #8
 8001a0a:	9001      	str	r0, [sp, #4]
 8001a0c:	4a02      	ldr	r2, [pc, #8]	@ (8001a18 <GPIO_ETH_MediaInterfaceConfig+0x10>)
 8001a0e:	9b01      	ldr	r3, [sp, #4]
 8001a10:	6013      	str	r3, [r2, #0]
 8001a12:	bf00      	nop
 8001a14:	b002      	add	sp, #8
 8001a16:	4770      	bx	lr
 8001a18:	422000dc 	.word	0x422000dc

08001a1c <RCC_DeInit>:
 8001a1c:	4b12      	ldr	r3, [pc, #72]	@ (8001a68 <RCC_DeInit+0x4c>)
 8001a1e:	681b      	ldr	r3, [r3, #0]
 8001a20:	4a11      	ldr	r2, [pc, #68]	@ (8001a68 <RCC_DeInit+0x4c>)
 8001a22:	f043 0301 	orr.w	r3, r3, #1
 8001a26:	6013      	str	r3, [r2, #0]
 8001a28:	4b0f      	ldr	r3, [pc, #60]	@ (8001a68 <RCC_DeInit+0x4c>)
 8001a2a:	685a      	ldr	r2, [r3, #4]
 8001a2c:	490e      	ldr	r1, [pc, #56]	@ (8001a68 <RCC_DeInit+0x4c>)
 8001a2e:	4b0f      	ldr	r3, [pc, #60]	@ (8001a6c <RCC_DeInit+0x50>)
 8001a30:	4013      	ands	r3, r2
 8001a32:	604b      	str	r3, [r1, #4]
 8001a34:	4b0c      	ldr	r3, [pc, #48]	@ (8001a68 <RCC_DeInit+0x4c>)
 8001a36:	681b      	ldr	r3, [r3, #0]
 8001a38:	4a0b      	ldr	r2, [pc, #44]	@ (8001a68 <RCC_DeInit+0x4c>)
 8001a3a:	f023 7384 	bic.w	r3, r3, #17301504	@ 0x1080000
 8001a3e:	f423 3380 	bic.w	r3, r3, #65536	@ 0x10000
 8001a42:	6013      	str	r3, [r2, #0]
 8001a44:	4b08      	ldr	r3, [pc, #32]	@ (8001a68 <RCC_DeInit+0x4c>)
 8001a46:	681b      	ldr	r3, [r3, #0]
 8001a48:	4a07      	ldr	r2, [pc, #28]	@ (8001a68 <RCC_DeInit+0x4c>)
 8001a4a:	f423 2380 	bic.w	r3, r3, #262144	@ 0x40000
 8001a4e:	6013      	str	r3, [r2, #0]
 8001a50:	4b05      	ldr	r3, [pc, #20]	@ (8001a68 <RCC_DeInit+0x4c>)
 8001a52:	685b      	ldr	r3, [r3, #4]
 8001a54:	4a04      	ldr	r2, [pc, #16]	@ (8001a68 <RCC_DeInit+0x4c>)
 8001a56:	f423 03fe 	bic.w	r3, r3, #8323072	@ 0x7f0000
 8001a5a:	6053      	str	r3, [r2, #4]
 8001a5c:	4b02      	ldr	r3, [pc, #8]	@ (8001a68 <RCC_DeInit+0x4c>)
 8001a5e:	f44f 021f 	mov.w	r2, #10420224	@ 0x9f0000
 8001a62:	609a      	str	r2, [r3, #8]
 8001a64:	bf00      	nop
 8001a66:	4770      	bx	lr
 8001a68:	40021000 	.word	0x40021000
 8001a6c:	f8ff0000 	.word	0xf8ff0000

08001a70 <RCC_HSEConfig>:
 8001a70:	b082      	sub	sp, #8
 8001a72:	9001      	str	r0, [sp, #4]
 8001a74:	4b12      	ldr	r3, [pc, #72]	@ (8001ac0 <RCC_HSEConfig+0x50>)
 8001a76:	681b      	ldr	r3, [r3, #0]
 8001a78:	4a11      	ldr	r2, [pc, #68]	@ (8001ac0 <RCC_HSEConfig+0x50>)
 8001a7a:	f423 3380 	bic.w	r3, r3, #65536	@ 0x10000
 8001a7e:	6013      	str	r3, [r2, #0]
 8001a80:	4b0f      	ldr	r3, [pc, #60]	@ (8001ac0 <RCC_HSEConfig+0x50>)
 8001a82:	681b      	ldr	r3, [r3, #0]
 8001a84:	4a0e      	ldr	r2, [pc, #56]	@ (8001ac0 <RCC_HSEConfig+0x50>)
 8001a86:	f423 2380 	bic.w	r3, r3, #262144	@ 0x40000
 8001a8a:	6013      	str	r3, [r2, #0]
 8001a8c:	9b01      	ldr	r3, [sp, #4]
 8001a8e:	f5b3 3f80 	cmp.w	r3, #65536	@ 0x10000
 8001a92:	d004      	beq.n	8001a9e <RCC_HSEConfig+0x2e>
 8001a94:	9b01      	ldr	r3, [sp, #4]
 8001a96:	f5b3 2f80 	cmp.w	r3, #262144	@ 0x40000
 8001a9a:	d007      	beq.n	8001aac <RCC_HSEConfig+0x3c>
 8001a9c:	e00d      	b.n	8001aba <RCC_HSEConfig+0x4a>
 8001a9e:	4b08      	ldr	r3, [pc, #32]	@ (8001ac0 <RCC_HSEConfig+0x50>)
 8001aa0:	681b      	ldr	r3, [r3, #0]
 8001aa2:	4a07      	ldr	r2, [pc, #28]	@ (8001ac0 <RCC_HSEConfig+0x50>)
 8001aa4:	f443 3380 	orr.w	r3, r3, #65536	@ 0x10000
 8001aa8:	6013      	str	r3, [r2, #0]
 8001aaa:	e006      	b.n	8001aba <RCC_HSEConfig+0x4a>
 8001aac:	4b04      	ldr	r3, [pc, #16]	@ (8001ac0 <RCC_HSEConfig+0x50>)
 8001aae:	681b      	ldr	r3, [r3, #0]
 8001ab0:	4a03      	ldr	r2, [pc, #12]	@ (8001ac0 <RCC_HSEConfig+0x50>)
 8001ab2:	f443 23a0 	orr.w	r3, r3, #327680	@ 0x50000
 8001ab6:	6013      	str	r3, [r2, #0]
 8001ab8:	bf00      	nop
 8001aba:	bf00      	nop
 8001abc:	b002      	add	sp, #8
 8001abe:	4770      	bx	lr
 8001ac0:	40021000 	.word	0x40021000

08001ac4 <RCC_WaitForHSEStartUp>:
 8001ac4:	b500      	push	{lr}
 8001ac6:	b083      	sub	sp, #12
 8001ac8:	2300      	movs	r3, #0
 8001aca:	9300      	str	r3, [sp, #0]
 8001acc:	2300      	movs	r3, #0
 8001ace:	f88d 3007 	strb.w	r3, [sp, #7]
 8001ad2:	2300      	movs	r3, #0
 8001ad4:	f88d 3006 	strb.w	r3, [sp, #6]
 8001ad8:	2031      	movs	r0, #49	@ 0x31
 8001ada:	f000 fad5 	bl	8002088 <RCC_GetFlagStatus>
 8001ade:	4603      	mov	r3, r0
 8001ae0:	f88d 3006 	strb.w	r3, [sp, #6]
 8001ae4:	9b00      	ldr	r3, [sp, #0]
 8001ae6:	3301      	adds	r3, #1
 8001ae8:	9300      	str	r3, [sp, #0]
 8001aea:	9b00      	ldr	r3, [sp, #0]
 8001aec:	f5b3 6fa0 	cmp.w	r3, #1280	@ 0x500
 8001af0:	d003      	beq.n	8001afa <RCC_WaitForHSEStartUp+0x36>
 8001af2:	f89d 3006 	ldrb.w	r3, [sp, #6]
 8001af6:	2b00      	cmp	r3, #0
 8001af8:	d0ee      	beq.n	8001ad8 <RCC_WaitForHSEStartUp+0x14>
 8001afa:	2031      	movs	r0, #49	@ 0x31
 8001afc:	f000 fac4 	bl	8002088 <RCC_GetFlagStatus>
 8001b00:	4603      	mov	r3, r0
 8001b02:	2b00      	cmp	r3, #0
 8001b04:	d003      	beq.n	8001b0e <RCC_WaitForHSEStartUp+0x4a>
 8001b06:	2301      	movs	r3, #1
 8001b08:	f88d 3007 	strb.w	r3, [sp, #7]
 8001b0c:	e002      	b.n	8001b14 <RCC_WaitForHSEStartUp+0x50>
 8001b0e:	2300      	movs	r3, #0
 8001b10:	f88d 3007 	strb.w	r3, [sp, #7]
 8001b14:	f89d 3007 	ldrb.w	r3, [sp, #7]
 8001b18:	4618      	mov	r0, r3
 8001b1a:	b003      	add	sp, #12
 8001b1c:	f85d fb04 	ldr.w	pc, [sp], #4

08001b20 <RCC_AdjustHSICalibrationValue>:
 8001b20:	b084      	sub	sp, #16
 8001b22:	4603      	mov	r3, r0
 8001b24:	f88d 3007 	strb.w	r3, [sp, #7]
 8001b28:	2300      	movs	r3, #0
 8001b2a:	9303      	str	r3, [sp, #12]
 8001b2c:	4b09      	ldr	r3, [pc, #36]	@ (8001b54 <RCC_AdjustHSICalibrationValue+0x34>)
 8001b2e:	681b      	ldr	r3, [r3, #0]
 8001b30:	9303      	str	r3, [sp, #12]
 8001b32:	9b03      	ldr	r3, [sp, #12]
 8001b34:	f023 03f8 	bic.w	r3, r3, #248	@ 0xf8
 8001b38:	9303      	str	r3, [sp, #12]
 8001b3a:	f89d 3007 	ldrb.w	r3, [sp, #7]
 8001b3e:	00db      	lsls	r3, r3, #3
 8001b40:	9a03      	ldr	r2, [sp, #12]
 8001b42:	4313      	orrs	r3, r2
 8001b44:	9303      	str	r3, [sp, #12]
 8001b46:	4a03      	ldr	r2, [pc, #12]	@ (8001b54 <RCC_AdjustHSICalibrationValue+0x34>)
 8001b48:	9b03      	ldr	r3, [sp, #12]
 8001b4a:	6013      	str	r3, [r2, #0]
 8001b4c:	bf00      	nop
 8001b4e:	b004      	add	sp, #16
 8001b50:	4770      	bx	lr
 8001b52:	bf00      	nop
 8001b54:	40021000 	.word	0x40021000

08001b58 <RCC_HSICmd>:
 8001b58:	b082      	sub	sp, #8
 8001b5a:	4603      	mov	r3, r0
 8001b5c:	f88d 3007 	strb.w	r3, [sp, #7]
 8001b60:	4a03      	ldr	r2, [pc, #12]	@ (8001b70 <RCC_HSICmd+0x18>)
 8001b62:	f89d 3007 	ldrb.w	r3, [sp, #7]
 8001b66:	6013      	str	r3, [r2, #0]
 8001b68:	bf00      	nop
 8001b6a:	b002      	add	sp, #8
 8001b6c:	4770      	bx	lr
 8001b6e:	bf00      	nop
 8001b70:	42420000 	.word	0x42420000

08001b74 <RCC_PLLConfig>:
 8001b74:	b084      	sub	sp, #16
 8001b76:	9001      	str	r0, [sp, #4]
 8001b78:	9100      	str	r1, [sp, #0]
 8001b7a:	2300      	movs	r3, #0
 8001b7c:	9303      	str	r3, [sp, #12]
 8001b7e:	4b09      	ldr	r3, [pc, #36]	@ (8001ba4 <RCC_PLLConfig+0x30>)
 8001b80:	685b      	ldr	r3, [r3, #4]
 8001b82:	9303      	str	r3, [sp, #12]
 8001b84:	9b03      	ldr	r3, [sp, #12]
 8001b86:	f423 137c 	bic.w	r3, r3, #4128768	@ 0x3f0000
 8001b8a:	9303      	str	r3, [sp, #12]
 8001b8c:	9a01      	ldr	r2, [sp, #4]
 8001b8e:	9b00      	ldr	r3, [sp, #0]
 8001b90:	4313      	orrs	r3, r2
 8001b92:	9a03      	ldr	r2, [sp, #12]
 8001b94:	4313      	orrs	r3, r2
 8001b96:	9303      	str	r3, [sp, #12]
 8001b98:	4a02      	ldr	r2, [pc, #8]	@ (8001ba4 <RCC_PLLConfig+0x30>)
 8001b9a:	9b03      	ldr	r3, [sp, #12]
 8001b9c:	6053      	str	r3, [r2, #4]
 8001b9e:	bf00      	nop
 8001ba0:	b004      	add	sp, #16
 8001ba2:	4770      	bx	lr
 8001ba4:	40021000 	.word	0x40021000

08001ba8 <RCC_PLLCmd>:
 8001ba8:	b082      	sub	sp, #8
 8001baa:	4603      	mov	r3, r0
 8001bac:	f88d 3007 	strb.w	r3, [sp, #7]
 8001bb0:	4a03      	ldr	r2, [pc, #12]	@ (8001bc0 <RCC_PLLCmd+0x18>)
 8001bb2:	f89d 3007 	ldrb.w	r3, [sp, #7]
 8001bb6:	6013      	str	r3, [r2, #0]
 8001bb8:	bf00      	nop
 8001bba:	b002      	add	sp, #8
 8001bbc:	4770      	bx	lr
 8001bbe:	bf00      	nop
 8001bc0:	42420060 	.word	0x42420060

08001bc4 <RCC_SYSCLKConfig>:
 8001bc4:	b084      	sub	sp, #16
 8001bc6:	9001      	str	r0, [sp, #4]
 8001bc8:	2300      	movs	r3, #0
 8001bca:	9303      	str	r3, [sp, #12]
 8001bcc:	4b08      	ldr	r3, [pc, #32]	@ (8001bf0 <RCC_SYSCLKConfig+0x2c>)
 8001bce:	685b      	ldr	r3, [r3, #4]
 8001bd0:	9303      	str	r3, [sp, #12]
 8001bd2:	9b03      	ldr	r3, [sp, #12]
 8001bd4:	f023 0303 	bic.w	r3, r3, #3
 8001bd8:	9303      	str	r3, [sp, #12]
 8001bda:	9a03      	ldr	r2, [sp, #12]
 8001bdc:	9b01      	ldr	r3, [sp, #4]
 8001bde:	4313      	orrs	r3, r2
 8001be0:	9303      	str	r3, [sp, #12]
 8001be2:	4a03      	ldr	r2, [pc, #12]	@ (8001bf0 <RCC_SYSCLKConfig+0x2c>)
 8001be4:	9b03      	ldr	r3, [sp, #12]
 8001be6:	6053      	str	r3, [r2, #4]
 8001be8:	bf00      	nop
 8001bea:	b004      	add	sp, #16
 8001bec:	4770      	bx	lr
 8001bee:	bf00      	nop
 8001bf0:	40021000 	.word	0x40021000

08001bf4 <RCC_GetSYSCLKSource>:
 8001bf4:	4b03      	ldr	r3, [pc, #12]	@ (8001c04 <RCC_GetSYSCLKSource+0x10>)
 8001bf6:	685b      	ldr	r3, [r3, #4]
 8001bf8:	b2db      	uxtb	r3, r3
 8001bfa:	f003 030c 	and.w	r3, r3, #12
 8001bfe:	b2db      	uxtb	r3, r3
 8001c00:	4618      	mov	r0, r3
 8001c02:	4770      	bx	lr
 8001c04:	40021000 	.word	0x40021000

08001c08 <RCC_HCLKConfig>:
 8001c08:	b084      	sub	sp, #16
 8001c0a:	9001      	str	r0, [sp, #4]
 8001c0c:	2300      	movs	r3, #0
 8001c0e:	9303      	str	r3, [sp, #12]
 8001c10:	4b08      	ldr	r3, [pc, #32]	@ (8001c34 <RCC_HCLKConfig+0x2c>)
 8001c12:	685b      	ldr	r3, [r3, #4]
 8001c14:	9303      	str	r3, [sp, #12]
 8001c16:	9b03      	ldr	r3, [sp, #12]
 8001c18:	f023 03f0 	bic.w	r3, r3, #240	@ 0xf0
 8001c1c:	9303      	str	r3, [sp, #12]
 8001c1e:	9a03      	ldr	r2, [sp, #12]
 8001c20:	9b01      	ldr	r3, [sp, #4]
 8001c22:	4313      	orrs	r3, r2
 8001c24:	9303      	str	r3, [sp, #12]
 8001c26:	4a03      	ldr	r2, [pc, #12]	@ (8001c34 <RCC_HCLKConfig+0x2c>)
 8001c28:	9b03      	ldr	r3, [sp, #12]
 8001c2a:	6053      	str	r3, [r2, #4]
 8001c2c:	bf00      	nop
 8001c2e:	b004      	add	sp, #16
 8001c30:	4770      	bx	lr
 8001c32:	bf00      	nop
 8001c34:	40021000 	.word	0x40021000

08001c38 <RCC_PCLK1Config>:
 8001c38:	b084      	sub	sp, #16
 8001c3a:	9001      	str	r0, [sp, #4]
 8001c3c:	2300      	movs	r3, #0
 8001c3e:	9303      	str	r3, [sp, #12]
 8001c40:	4b08      	ldr	r3, [pc, #32]	@ (8001c64 <RCC_PCLK1Config+0x2c>)
 8001c42:	685b      	ldr	r3, [r3, #4]
 8001c44:	9303      	str	r3, [sp, #12]
 8001c46:	9b03      	ldr	r3, [sp, #12]
 8001c48:	f423 63e0 	bic.w	r3, r3, #1792	@ 0x700
 8001c4c:	9303      	str	r3, [sp, #12]
 8001c4e:	9a03      	ldr	r2, [sp, #12]
 8001c50:	9b01      	ldr	r3, [sp, #4]
 8001c52:	4313      	orrs	r3, r2
 8001c54:	9303      	str	r3, [sp, #12]
 8001c56:	4a03      	ldr	r2, [pc, #12]	@ (8001c64 <RCC_PCLK1Config+0x2c>)
 8001c58:	9b03      	ldr	r3, [sp, #12]
 8001c5a:	6053      	str	r3, [r2, #4]
 8001c5c:	bf00      	nop
 8001c5e:	b004      	add	sp, #16
 8001c60:	4770      	bx	lr
 8001c62:	bf00      	nop
 8001c64:	40021000 	.word	0x40021000

08001c68 <RCC_PCLK2Config>:
 8001c68:	b084      	sub	sp, #16
 8001c6a:	9001      	str	r0, [sp, #4]
 8001c6c:	2300      	movs	r3, #0
 8001c6e:	9303      	str	r3, [sp, #12]
 8001c70:	4b08      	ldr	r3, [pc, #32]	@ (8001c94 <RCC_PCLK2Config+0x2c>)
 8001c72:	685b      	ldr	r3, [r3, #4]
 8001c74:	9303      	str	r3, [sp, #12]
 8001c76:	9b03      	ldr	r3, [sp, #12]
 8001c78:	f423 5360 	bic.w	r3, r3, #14336	@ 0x3800
 8001c7c:	9303      	str	r3, [sp, #12]
 8001c7e:	9b01      	ldr	r3, [sp, #4]
 8001c80:	00db      	lsls	r3, r3, #3
 8001c82:	9a03      	ldr	r2, [sp, #12]
 8001c84:	4313      	orrs	r3, r2
 8001c86:	9303      	str	r3, [sp, #12]
 8001c88:	4a02      	ldr	r2, [pc, #8]	@ (8001c94 <RCC_PCLK2Config+0x2c>)
 8001c8a:	9b03      	ldr	r3, [sp, #12]
 8001c8c:	6053      	str	r3, [r2, #4]
 8001c8e:	bf00      	nop
 8001c90:	b004      	add	sp, #16
 8001c92:	4770      	bx	lr
 8001c94:	40021000 	.word	0x40021000

08001c98 <RCC_ITConfig>:
 8001c98:	b082      	sub	sp, #8
 8001c9a:	4603      	mov	r3, r0
 8001c9c:	460a      	mov	r2, r1
 8001c9e:	f88d 3007 	strb.w	r3, [sp, #7]
 8001ca2:	4613      	mov	r3, r2
 8001ca4:	f88d 3006 	strb.w	r3, [sp, #6]
 8001ca8:	f89d 3006 	ldrb.w	r3, [sp, #6]
 8001cac:	2b00      	cmp	r3, #0
 8001cae:	d009      	beq.n	8001cc4 <RCC_ITConfig+0x2c>
 8001cb0:	4b0b      	ldr	r3, [pc, #44]	@ (8001ce0 <RCC_ITConfig+0x48>)
 8001cb2:	781b      	ldrb	r3, [r3, #0]
 8001cb4:	b2da      	uxtb	r2, r3
 8001cb6:	490a      	ldr	r1, [pc, #40]	@ (8001ce0 <RCC_ITConfig+0x48>)
 8001cb8:	f89d 3007 	ldrb.w	r3, [sp, #7]
 8001cbc:	4313      	orrs	r3, r2
 8001cbe:	b2db      	uxtb	r3, r3
 8001cc0:	700b      	strb	r3, [r1, #0]
 8001cc2:	e00a      	b.n	8001cda <RCC_ITConfig+0x42>
 8001cc4:	4b06      	ldr	r3, [pc, #24]	@ (8001ce0 <RCC_ITConfig+0x48>)
 8001cc6:	781b      	ldrb	r3, [r3, #0]
 8001cc8:	b2da      	uxtb	r2, r3
 8001cca:	f89d 3007 	ldrb.w	r3, [sp, #7]
 8001cce:	43db      	mvns	r3, r3
 8001cd0:	b2db      	uxtb	r3, r3
 8001cd2:	4903      	ldr	r1, [pc, #12]	@ (8001ce0 <RCC_ITConfig+0x48>)
 8001cd4:	4013      	ands	r3, r2
 8001cd6:	b2db      	uxtb	r3, r3
 8001cd8:	700b      	strb	r3, [r1, #0]
 8001cda:	bf00      	nop
 8001cdc:	b002      	add	sp, #8
 8001cde:	4770      	bx	lr
 8001ce0:	40021009 	.word	0x40021009

08001ce4 <RCC_USBCLKConfig>:
 8001ce4:	b082      	sub	sp, #8
 8001ce6:	9001      	str	r0, [sp, #4]
 8001ce8:	4a02      	ldr	r2, [pc, #8]	@ (8001cf4 <RCC_USBCLKConfig+0x10>)
 8001cea:	9b01      	ldr	r3, [sp, #4]
 8001cec:	6013      	str	r3, [r2, #0]
 8001cee:	bf00      	nop
 8001cf0:	b002      	add	sp, #8
 8001cf2:	4770      	bx	lr
 8001cf4:	424200d8 	.word	0x424200d8

08001cf8 <RCC_ADCCLKConfig>:
 8001cf8:	b084      	sub	sp, #16
 8001cfa:	9001      	str	r0, [sp, #4]
 8001cfc:	2300      	movs	r3, #0
 8001cfe:	9303      	str	r3, [sp, #12]
 8001d00:	4b08      	ldr	r3, [pc, #32]	@ (8001d24 <RCC_ADCCLKConfig+0x2c>)
 8001d02:	685b      	ldr	r3, [r3, #4]
 8001d04:	9303      	str	r3, [sp, #12]
 8001d06:	9b03      	ldr	r3, [sp, #12]
 8001d08:	f423 4340 	bic.w	r3, r3, #49152	@ 0xc000
 8001d0c:	9303      	str	r3, [sp, #12]
 8001d0e:	9a03      	ldr	r2, [sp, #12]
 8001d10:	9b01      	ldr	r3, [sp, #4]
 8001d12:	4313      	orrs	r3, r2
 8001d14:	9303      	str	r3, [sp, #12]
 8001d16:	4a03      	ldr	r2, [pc, #12]	@ (8001d24 <RCC_ADCCLKConfig+0x2c>)
 8001d18:	9b03      	ldr	r3, [sp, #12]
 8001d1a:	6053      	str	r3, [r2, #4]
 8001d1c:	bf00      	nop
 8001d1e:	b004      	add	sp, #16
 8001d20:	4770      	bx	lr
 8001d22:	bf00      	nop
 8001d24:	40021000 	.word	0x40021000

08001d28 <RCC_LSEConfig>:
 8001d28:	b082      	sub	sp, #8
 8001d2a:	4603      	mov	r3, r0
 8001d2c:	f88d 3007 	strb.w	r3, [sp, #7]
 8001d30:	4b0b      	ldr	r3, [pc, #44]	@ (8001d60 <RCC_LSEConfig+0x38>)
 8001d32:	2200      	movs	r2, #0
 8001d34:	701a      	strb	r2, [r3, #0]
 8001d36:	4b0a      	ldr	r3, [pc, #40]	@ (8001d60 <RCC_LSEConfig+0x38>)
 8001d38:	2200      	movs	r2, #0
 8001d3a:	701a      	strb	r2, [r3, #0]
 8001d3c:	f89d 3007 	ldrb.w	r3, [sp, #7]
 8001d40:	2b01      	cmp	r3, #1
 8001d42:	d002      	beq.n	8001d4a <RCC_LSEConfig+0x22>
 8001d44:	2b04      	cmp	r3, #4
 8001d46:	d004      	beq.n	8001d52 <RCC_LSEConfig+0x2a>
 8001d48:	e007      	b.n	8001d5a <RCC_LSEConfig+0x32>
 8001d4a:	4b05      	ldr	r3, [pc, #20]	@ (8001d60 <RCC_LSEConfig+0x38>)
 8001d4c:	2201      	movs	r2, #1
 8001d4e:	701a      	strb	r2, [r3, #0]
 8001d50:	e003      	b.n	8001d5a <RCC_LSEConfig+0x32>
 8001d52:	4b03      	ldr	r3, [pc, #12]	@ (8001d60 <RCC_LSEConfig+0x38>)
 8001d54:	2205      	movs	r2, #5
 8001d56:	701a      	strb	r2, [r3, #0]
 8001d58:	bf00      	nop
 8001d5a:	bf00      	nop
 8001d5c:	b002      	add	sp, #8
 8001d5e:	4770      	bx	lr
 8001d60:	40021020 	.word	0x40021020

08001d64 <RCC_LSICmd>:
 8001d64:	b082      	sub	sp, #8
 8001d66:	4603      	mov	r3, r0
 8001d68:	f88d 3007 	strb.w	r3, [sp, #7]
 8001d6c:	4a03      	ldr	r2, [pc, #12]	@ (8001d7c <RCC_LSICmd+0x18>)
 8001d6e:	f89d 3007 	ldrb.w	r3, [sp, #7]
 8001d72:	6013      	str	r3, [r2, #0]
 8001d74:	bf00      	nop
 8001d76:	b002      	add	sp, #8
 8001d78:	4770      	bx	lr
 8001d7a:	bf00      	nop
 8001d7c:	42420480 	.word	0x42420480

08001d80 <RCC_RTCCLKConfig>:
 8001d80:	b082      	sub	sp, #8
 8001d82:	9001      	str	r0, [sp, #4]
 8001d84:	4b04      	ldr	r3, [pc, #16]	@ (8001d98 <RCC_RTCCLKConfig+0x18>)
 8001d86:	6a1a      	ldr	r2, [r3, #32]
 8001d88:	4903      	ldr	r1, [pc, #12]	@ (8001d98 <RCC_RTCCLKConfig+0x18>)
 8001d8a:	9b01      	ldr	r3, [sp, #4]
 8001d8c:	4313      	orrs	r3, r2
 8001d8e:	620b      	str	r3, [r1, #32]
 8001d90:	bf00      	nop
 8001d92:	b002      	add	sp, #8
 8001d94:	4770      	bx	lr
 8001d96:	bf00      	nop
 8001d98:	40021000 	.word	0x40021000

08001d9c <RCC_RTCCLKCmd>:
 8001d9c:	b082      	sub	sp, #8
 8001d9e:	4603      	mov	r3, r0
 8001da0:	f88d 3007 	strb.w	r3, [sp, #7]
 8001da4:	4a03      	ldr	r2, [pc, #12]	@ (8001db4 <RCC_RTCCLKCmd+0x18>)
 8001da6:	f89d 3007 	ldrb.w	r3, [sp, #7]
 8001daa:	6013      	str	r3, [r2, #0]
 8001dac:	bf00      	nop
 8001dae:	b002      	add	sp, #8
 8001db0:	4770      	bx	lr
 8001db2:	bf00      	nop
 8001db4:	4242043c 	.word	0x4242043c

08001db8 <RCC_GetClocksFreq>:
 8001db8:	b086      	sub	sp, #24
 8001dba:	9001      	str	r0, [sp, #4]
 8001dbc:	2300      	movs	r3, #0
 8001dbe:	9305      	str	r3, [sp, #20]
 8001dc0:	2300      	movs	r3, #0
 8001dc2:	9304      	str	r3, [sp, #16]
 8001dc4:	2300      	movs	r3, #0
 8001dc6:	9303      	str	r3, [sp, #12]
 8001dc8:	2300      	movs	r3, #0
 8001dca:	9302      	str	r3, [sp, #8]
 8001dcc:	4b4e      	ldr	r3, [pc, #312]	@ (8001f08 <RCC_GetClocksFreq+0x150>)
 8001dce:	685b      	ldr	r3, [r3, #4]
 8001dd0:	f003 030c 	and.w	r3, r3, #12
 8001dd4:	9305      	str	r3, [sp, #20]
 8001dd6:	9b05      	ldr	r3, [sp, #20]
 8001dd8:	2b08      	cmp	r3, #8
 8001dda:	d011      	beq.n	8001e00 <RCC_GetClocksFreq+0x48>
 8001ddc:	9b05      	ldr	r3, [sp, #20]
 8001dde:	2b08      	cmp	r3, #8
 8001de0:	d83a      	bhi.n	8001e58 <RCC_GetClocksFreq+0xa0>
 8001de2:	9b05      	ldr	r3, [sp, #20]
 8001de4:	2b00      	cmp	r3, #0
 8001de6:	d003      	beq.n	8001df0 <RCC_GetClocksFreq+0x38>
 8001de8:	9b05      	ldr	r3, [sp, #20]
 8001dea:	2b04      	cmp	r3, #4
 8001dec:	d004      	beq.n	8001df8 <RCC_GetClocksFreq+0x40>
 8001dee:	e033      	b.n	8001e58 <RCC_GetClocksFreq+0xa0>
 8001df0:	9b01      	ldr	r3, [sp, #4]
 8001df2:	4a46      	ldr	r2, [pc, #280]	@ (8001f0c <RCC_GetClocksFreq+0x154>)
 8001df4:	601a      	str	r2, [r3, #0]
 8001df6:	e033      	b.n	8001e60 <RCC_GetClocksFreq+0xa8>
 8001df8:	9b01      	ldr	r3, [sp, #4]
 8001dfa:	4a44      	ldr	r2, [pc, #272]	@ (8001f0c <RCC_GetClocksFreq+0x154>)
 8001dfc:	601a      	str	r2, [r3, #0]
 8001dfe:	e02f      	b.n	8001e60 <RCC_GetClocksFreq+0xa8>
 8001e00:	4b41      	ldr	r3, [pc, #260]	@ (8001f08 <RCC_GetClocksFreq+0x150>)
 8001e02:	685b      	ldr	r3, [r3, #4]
 8001e04:	f403 1370 	and.w	r3, r3, #3932160	@ 0x3c0000
 8001e08:	9304      	str	r3, [sp, #16]
 8001e0a:	4b3f      	ldr	r3, [pc, #252]	@ (8001f08 <RCC_GetClocksFreq+0x150>)
 8001e0c:	685b      	ldr	r3, [r3, #4]
 8001e0e:	f403 3380 	and.w	r3, r3, #65536	@ 0x10000
 8001e12:	9303      	str	r3, [sp, #12]
 8001e14:	9b04      	ldr	r3, [sp, #16]
 8001e16:	0c9b      	lsrs	r3, r3, #18
 8001e18:	3302      	adds	r3, #2
 8001e1a:	9304      	str	r3, [sp, #16]
 8001e1c:	9b03      	ldr	r3, [sp, #12]
 8001e1e:	2b00      	cmp	r3, #0
 8001e20:	d106      	bne.n	8001e30 <RCC_GetClocksFreq+0x78>
 8001e22:	9b04      	ldr	r3, [sp, #16]
 8001e24:	4a3a      	ldr	r2, [pc, #232]	@ (8001f10 <RCC_GetClocksFreq+0x158>)
 8001e26:	fb03 f202 	mul.w	r2, r3, r2
 8001e2a:	9b01      	ldr	r3, [sp, #4]
 8001e2c:	601a      	str	r2, [r3, #0]
 8001e2e:	e017      	b.n	8001e60 <RCC_GetClocksFreq+0xa8>
 8001e30:	4b35      	ldr	r3, [pc, #212]	@ (8001f08 <RCC_GetClocksFreq+0x150>)
 8001e32:	685b      	ldr	r3, [r3, #4]
 8001e34:	f403 3300 	and.w	r3, r3, #131072	@ 0x20000
 8001e38:	2b00      	cmp	r3, #0
 8001e3a:	d006      	beq.n	8001e4a <RCC_GetClocksFreq+0x92>
 8001e3c:	9b04      	ldr	r3, [sp, #16]
 8001e3e:	4a34      	ldr	r2, [pc, #208]	@ (8001f10 <RCC_GetClocksFreq+0x158>)
 8001e40:	fb03 f202 	mul.w	r2, r3, r2
 8001e44:	9b01      	ldr	r3, [sp, #4]
 8001e46:	601a      	str	r2, [r3, #0]
 8001e48:	e00a      	b.n	8001e60 <RCC_GetClocksFreq+0xa8>
 8001e4a:	9b04      	ldr	r3, [sp, #16]
 8001e4c:	4a2f      	ldr	r2, [pc, #188]	@ (8001f0c <RCC_GetClocksFreq+0x154>)
 8001e4e:	fb03 f202 	mul.w	r2, r3, r2
 8001e52:	9b01      	ldr	r3, [sp, #4]
 8001e54:	601a      	str	r2, [r3, #0]
 8001e56:	e003      	b.n	8001e60 <RCC_GetClocksFreq+0xa8>
 8001e58:	9b01      	ldr	r3, [sp, #4]
 8001e5a:	4a2c      	ldr	r2, [pc, #176]	@ (8001f0c <RCC_GetClocksFreq+0x154>)
 8001e5c:	601a      	str	r2, [r3, #0]
 8001e5e:	bf00      	nop
 8001e60:	4b29      	ldr	r3, [pc, #164]	@ (8001f08 <RCC_GetClocksFreq+0x150>)
 8001e62:	685b      	ldr	r3, [r3, #4]
 8001e64:	f003 03f0 	and.w	r3, r3, #240	@ 0xf0
 8001e68:	9305      	str	r3, [sp, #20]
 8001e6a:	9b05      	ldr	r3, [sp, #20]
 8001e6c:	091b      	lsrs	r3, r3, #4
 8001e6e:	9305      	str	r3, [sp, #20]
 8001e70:	4a28      	ldr	r2, [pc, #160]	@ (8001f14 <RCC_GetClocksFreq+0x15c>)
 8001e72:	9b05      	ldr	r3, [sp, #20]
 8001e74:	4413      	add	r3, r2
 8001e76:	781b      	ldrb	r3, [r3, #0]
 8001e78:	b2db      	uxtb	r3, r3
 8001e7a:	9302      	str	r3, [sp, #8]
 8001e7c:	9b01      	ldr	r3, [sp, #4]
 8001e7e:	681a      	ldr	r2, [r3, #0]
 8001e80:	9b02      	ldr	r3, [sp, #8]
 8001e82:	40da      	lsrs	r2, r3
 8001e84:	9b01      	ldr	r3, [sp, #4]
 8001e86:	605a      	str	r2, [r3, #4]
 8001e88:	4b1f      	ldr	r3, [pc, #124]	@ (8001f08 <RCC_GetClocksFreq+0x150>)
 8001e8a:	685b      	ldr	r3, [r3, #4]
 8001e8c:	f403 63e0 	and.w	r3, r3, #1792	@ 0x700
 8001e90:	9305      	str	r3, [sp, #20]
 8001e92:	9b05      	ldr	r3, [sp, #20]
 8001e94:	0a1b      	lsrs	r3, r3, #8
 8001e96:	9305      	str	r3, [sp, #20]
 8001e98:	4a1e      	ldr	r2, [pc, #120]	@ (8001f14 <RCC_GetClocksFreq+0x15c>)
 8001e9a:	9b05      	ldr	r3, [sp, #20]
 8001e9c:	4413      	add	r3, r2
 8001e9e:	781b      	ldrb	r3, [r3, #0]
 8001ea0:	b2db      	uxtb	r3, r3
 8001ea2:	9302      	str	r3, [sp, #8]
 8001ea4:	9b01      	ldr	r3, [sp, #4]
 8001ea6:	685a      	ldr	r2, [r3, #4]
 8001ea8:	9b02      	ldr	r3, [sp, #8]
 8001eaa:	40da      	lsrs	r2, r3
 8001eac:	9b01      	ldr	r3, [sp, #4]
 8001eae:	609a      	str	r2, [r3, #8]
 8001eb0:	4b15      	ldr	r3, [pc, #84]	@ (8001f08 <RCC_GetClocksFreq+0x150>)
 8001eb2:	685b      	ldr	r3, [r3, #4]
 8001eb4:	f403 5360 	and.w	r3, r3, #14336	@ 0x3800
 8001eb8:	9305      	str	r3, [sp, #20]
 8001eba:	9b05      	ldr	r3, [sp, #20]
 8001ebc:	0adb      	lsrs	r3, r3, #11
 8001ebe:	9305      	str	r3, [sp, #20]
 8001ec0:	4a14      	ldr	r2, [pc, #80]	@ (8001f14 <RCC_GetClocksFreq+0x15c>)
 8001ec2:	9b05      	ldr	r3, [sp, #20]
 8001ec4:	4413      	add	r3, r2
 8001ec6:	781b      	ldrb	r3, [r3, #0]
 8001ec8:	b2db      	uxtb	r3, r3
 8001eca:	9302      	str	r3, [sp, #8]
 8001ecc:	9b01      	ldr	r3, [sp, #4]
 8001ece:	685a      	ldr	r2, [r3, #4]
 8001ed0:	9b02      	ldr	r3, [sp, #8]
 8001ed2:	40da      	lsrs	r2, r3
 8001ed4:	9b01      	ldr	r3, [sp, #4]
 8001ed6:	60da      	str	r2, [r3, #12]
 8001ed8:	4b0b      	ldr	r3, [pc, #44]	@ (8001f08 <RCC_GetClocksFreq+0x150>)
 8001eda:	685b      	ldr	r3, [r3, #4]
 8001edc:	f403 4340 	and.w	r3, r3, #49152	@ 0xc000
 8001ee0:	9305      	str	r3, [sp, #20]
 8001ee2:	9b05      	ldr	r3, [sp, #20]
 8001ee4:	0b9b      	lsrs	r3, r3, #14
 8001ee6:	9305      	str	r3, [sp, #20]
 8001ee8:	4a0b      	ldr	r2, [pc, #44]	@ (8001f18 <RCC_GetClocksFreq+0x160>)
 8001eea:	9b05      	ldr	r3, [sp, #20]
 8001eec:	4413      	add	r3, r2
 8001eee:	781b      	ldrb	r3, [r3, #0]
 8001ef0:	b2db      	uxtb	r3, r3
 8001ef2:	9302      	str	r3, [sp, #8]
 8001ef4:	9b01      	ldr	r3, [sp, #4]
 8001ef6:	68da      	ldr	r2, [r3, #12]
 8001ef8:	9b02      	ldr	r3, [sp, #8]
 8001efa:	fbb2 f2f3 	udiv	r2, r2, r3
 8001efe:	9b01      	ldr	r3, [sp, #4]
 8001f00:	611a      	str	r2, [r3, #16]
 8001f02:	bf00      	nop
 8001f04:	b006      	add	sp, #24
 8001f06:	4770      	bx	lr
 8001f08:	40021000 	.word	0x40021000
 8001f0c:	007a1200 	.word	0x007a1200
 8001f10:	003d0900 	.word	0x003d0900
 8001f14:	080006fc 	.word	0x080006fc
 8001f18:	0800070c 	.word	0x0800070c

08001f1c <RCC_AHBPeriphClockCmd>:
 8001f1c:	b082      	sub	sp, #8
 8001f1e:	9001      	str	r0, [sp, #4]
 8001f20:	460b      	mov	r3, r1
 8001f22:	f88d 3003 	strb.w	r3, [sp, #3]
 8001f26:	f89d 3003 	ldrb.w	r3, [sp, #3]
 8001f2a:	2b00      	cmp	r3, #0
 8001f2c:	d006      	beq.n	8001f3c <RCC_AHBPeriphClockCmd+0x20>
 8001f2e:	4b08      	ldr	r3, [pc, #32]	@ (8001f50 <RCC_AHBPeriphClockCmd+0x34>)
 8001f30:	695a      	ldr	r2, [r3, #20]
 8001f32:	4907      	ldr	r1, [pc, #28]	@ (8001f50 <RCC_AHBPeriphClockCmd+0x34>)
 8001f34:	9b01      	ldr	r3, [sp, #4]
 8001f36:	4313      	orrs	r3, r2
 8001f38:	614b      	str	r3, [r1, #20]
 8001f3a:	e006      	b.n	8001f4a <RCC_AHBPeriphClockCmd+0x2e>
 8001f3c:	4b04      	ldr	r3, [pc, #16]	@ (8001f50 <RCC_AHBPeriphClockCmd+0x34>)
 8001f3e:	695a      	ldr	r2, [r3, #20]
 8001f40:	9b01      	ldr	r3, [sp, #4]
 8001f42:	43db      	mvns	r3, r3
 8001f44:	4902      	ldr	r1, [pc, #8]	@ (8001f50 <RCC_AHBPeriphClockCmd+0x34>)
 8001f46:	4013      	ands	r3, r2
 8001f48:	614b      	str	r3, [r1, #20]
 8001f4a:	bf00      	nop
 8001f4c:	b002      	add	sp, #8
 8001f4e:	4770      	bx	lr
 8001f50:	40021000 	.word	0x40021000

08001f54 <RCC_APB2PeriphClockCmd>:
 8001f54:	b082      	sub	sp, #8
 8001f56:	9001      	str	r0, [sp, #4]
 8001f58:	460b      	mov	r3, r1
 8001f5a:	f88d 3003 	strb.w	r3, [sp, #3]
 8001f5e:	f89d 3003 	ldrb.w	r3, [sp, #3]
 8001f62:	2b00      	cmp	r3, #0
 8001f64:	d006      	beq.n	8001f74 <RCC_APB2PeriphClockCmd+0x20>
 8001f66:	4b08      	ldr	r3, [pc, #32]	@ (8001f88 <RCC_APB2PeriphClockCmd+0x34>)
 8001f68:	699a      	ldr	r2, [r3, #24]
 8001f6a:	4907      	ldr	r1, [pc, #28]	@ (8001f88 <RCC_APB2PeriphClockCmd+0x34>)
 8001f6c:	9b01      	ldr	r3, [sp, #4]
 8001f6e:	4313      	orrs	r3, r2
 8001f70:	618b      	str	r3, [r1, #24]
 8001f72:	e006      	b.n	8001f82 <RCC_APB2PeriphClockCmd+0x2e>
 8001f74:	4b04      	ldr	r3, [pc, #16]	@ (8001f88 <RCC_APB2PeriphClockCmd+0x34>)
 8001f76:	699a      	ldr	r2, [r3, #24]
 8001f78:	9b01      	ldr	r3, [sp, #4]
 8001f7a:	43db      	mvns	r3, r3
 8001f7c:	4902      	ldr	r1, [pc, #8]	@ (8001f88 <RCC_APB2PeriphClockCmd+0x34>)
 8001f7e:	4013      	ands	r3, r2
 8001f80:	618b      	str	r3, [r1, #24]
 8001f82:	bf00      	nop
 8001f84:	b002      	add	sp, #8
 8001f86:	4770      	bx	lr
 8001f88:	40021000 	.word	0x40021000

08001f8c <RCC_APB1PeriphClockCmd>:
 8001f8c:	b082      	sub	sp, #8
 8001f8e:	9001      	str	r0, [sp, #4]
 8001f90:	460b      	mov	r3, r1
 8001f92:	f88d 3003 	strb.w	r3, [sp, #3]
 8001f96:	f89d 3003 	ldrb.w	r3, [sp, #3]
 8001f9a:	2b00      	cmp	r3, #0
 8001f9c:	d006      	beq.n	8001fac <RCC_APB1PeriphClockCmd+0x20>
 8001f9e:	4b08      	ldr	r3, [pc, #32]	@ (8001fc0 <RCC_APB1PeriphClockCmd+0x34>)
 8001fa0:	69da      	ldr	r2, [r3, #28]
 8001fa2:	4907      	ldr	r1, [pc, #28]	@ (8001fc0 <RCC_APB1PeriphClockCmd+0x34>)
 8001fa4:	9b01      	ldr	r3, [sp, #4]
 8001fa6:	4313      	orrs	r3, r2
 8001fa8:	61cb      	str	r3, [r1, #28]
 8001faa:	e006      	b.n	8001fba <RCC_APB1PeriphClockCmd+0x2e>
 8001fac:	4b04      	ldr	r3, [pc, #16]	@ (8001fc0 <RCC_APB1PeriphClockCmd+0x34>)
 8001fae:	69da      	ldr	r2, [r3, #28]
 8001fb0:	9b01      	ldr	r3, [sp, #4]
 8001fb2:	43db      	mvns	r3, r3
 8001fb4:	4902      	ldr	r1, [pc, #8]	@ (8001fc0 <RCC_APB1PeriphClockCmd+0x34>)
 8001fb6:	4013      	ands	r3, r2
 8001fb8:	61cb      	str	r3, [r1, #28]
 8001fba:	bf00      	nop
 8001fbc:	b002      	add	sp, #8
 8001fbe:	4770      	bx	lr
 8001fc0:	40021000 	.word	0x40021000

08001fc4 <RCC_APB2PeriphResetCmd>:
 8001fc4:	b082      	sub	sp, #8
 8001fc6:	9001      	str	r0, [sp, #4]
 8001fc8:	460b      	mov	r3, r1
 8001fca:	f88d 3003 	strb.w	r3, [sp, #3]
 8001fce:	f89d 3003 	ldrb.w	r3, [sp, #3]
 8001fd2:	2b00      	cmp	r3, #0
 8001fd4:	d006      	beq.n	8001fe4 <RCC_APB2PeriphResetCmd+0x20>
 8001fd6:	4b08      	ldr	r3, [pc, #32]	@ (8001ff8 <RCC_APB2PeriphResetCmd+0x34>)
 8001fd8:	68da      	ldr	r2, [r3, #12]
 8001fda:	4907      	ldr	r1, [pc, #28]	@ (8001ff8 <RCC_APB2PeriphResetCmd+0x34>)
 8001fdc:	9b01      	ldr	r3, [sp, #4]
 8001fde:	4313      	orrs	r3, r2
 8001fe0:	60cb      	str	r3, [r1, #12]
 8001fe2:	e006      	b.n	8001ff2 <RCC_APB2PeriphResetCmd+0x2e>
 8001fe4:	4b04      	ldr	r3, [pc, #16]	@ (8001ff8 <RCC_APB2PeriphResetCmd+0x34>)
 8001fe6:	68da      	ldr	r2, [r3, #12]
 8001fe8:	9b01      	ldr	r3, [sp, #4]
 8001fea:	43db      	mvns	r3, r3
 8001fec:	4902      	ldr	r1, [pc, #8]	@ (8001ff8 <RCC_APB2PeriphResetCmd+0x34>)
 8001fee:	4013      	ands	r3, r2
 8001ff0:	60cb      	str	r3, [r1, #12]
 8001ff2:	bf00      	nop
 8001ff4:	b002      	add	sp, #8
 8001ff6:	4770      	bx	lr
 8001ff8:	40021000 	.word	0x40021000

08001ffc <RCC_APB1PeriphResetCmd>:
 8001ffc:	b082      	sub	sp, #8
 8001ffe:	9001      	str	r0, [sp, #4]
 8002000:	460b      	mov	r3, r1
 8002002:	f88d 3003 	strb.w	r3, [sp, #3]
 8002006:	f89d 3003 	ldrb.w	r3, [sp, #3]
 800200a:	2b00      	cmp	r3, #0
 800200c:	d006      	beq.n	800201c <RCC_APB1PeriphResetCmd+0x20>
 800200e:	4b08      	ldr	r3, [pc, #32]	@ (8002030 <RCC_APB1PeriphResetCmd+0x34>)
 8002010:	691a      	ldr	r2, [r3, #16]
 8002012:	4907      	ldr	r1, [pc, #28]	@ (8002030 <RCC_APB1PeriphResetCmd+0x34>)
 8002014:	9b01      	ldr	r3, [sp, #4]
 8002016:	4313      	orrs	r3, r2
 8002018:	610b      	str	r3, [r1, #16]
 800201a:	e006      	b.n	800202a <RCC_APB1PeriphResetCmd+0x2e>
 800201c:	4b04      	ldr	r3, [pc, #16]	@ (8002030 <RCC_APB1PeriphResetCmd+0x34>)
 800201e:	691a      	ldr	r2, [r3, #16]
 8002020:	9b01      	ldr	r3, [sp, #4]
 8002022:	43db      	mvns	r3, r3
 8002024:	4902      	ldr	r1, [pc, #8]	@ (8002030 <RCC_APB1PeriphResetCmd+0x34>)
 8002026:	4013      	ands	r3, r2
 8002028:	610b      	str	r3, [r1, #16]
 800202a:	bf00      	nop
 800202c:	b002      	add	sp, #8
 800202e:	4770      	bx	lr
 8002030:	40021000 	.word	0x40021000

08002034 <RCC_BackupResetCmd>:
 8002034:	b082      	sub	sp, #8
 8002036:	4603      	mov	r3, r0
 8002038:	f88d 3007 	strb.w	r3, [sp, #7]
 800203c:	4a03      	ldr	r2, [pc, #12]	@ (800204c <RCC_BackupResetCmd+0x18>)
 800203e:	f89d 3007 	ldrb.w	r3, [sp, #7]
 8002042:	6013      	str	r3, [r2, #0]
 8002044:	bf00      	nop
 8002046:	b002      	add	sp, #8
 8002048:	4770      	bx	lr
 800204a:	bf00      	nop
 800204c:	42420440 	.word	0x42420440

08002050 <RCC_ClockSecuritySystemCmd>:
 8002050:	b082      	sub	sp, #8
 8002052:	4603      	mov	r3, r0
 8002054:	f88d 3007 	strb.w	r3, [sp, #7]
 8002058:	4a03      	ldr	r2, [pc, #12]	@ (8002068 <RCC_ClockSecuritySystemCmd+0x18>)
 800205a:	f89d 3007 	ldrb.w	r3, [sp, #7]
 800205e:	6013      	str	r3, [r2, #0]
 8002060:	bf00      	nop
 8002062:	b002      	add	sp, #8
 8002064:	4770      	bx	lr
 8002066:	bf00      	nop
 8002068:	4242004c 	.word	0x4242004c

0800206c <RCC_MCOConfig>:
 800206c:	b082      	sub	sp, #8
 800206e:	4603      	mov	r3, r0
 8002070:	f88d 3007 	strb.w	r3, [sp, #7]
 8002074:	4a03      	ldr	r2, [pc, #12]	@ (8002084 <RCC_MCOConfig+0x18>)
 8002076:	f89d 3007 	ldrb.w	r3, [sp, #7]
 800207a:	7013      	strb	r3, [r2, #0]
 800207c:	bf00      	nop
 800207e:	b002      	add	sp, #8
 8002080:	4770      	bx	lr
 8002082:	bf00      	nop
 8002084:	40021007 	.word	0x40021007

08002088 <RCC_GetFlagStatus>:
 8002088:	b086      	sub	sp, #24
 800208a:	4603      	mov	r3, r0
 800208c:	f88d 3007 	strb.w	r3, [sp, #7]
 8002090:	2300      	movs	r3, #0
 8002092:	9303      	str	r3, [sp, #12]
 8002094:	2300      	movs	r3, #0
 8002096:	9305      	str	r3, [sp, #20]
 8002098:	2300      	movs	r3, #0
 800209a:	f88d 3013 	strb.w	r3, [sp, #19]
 800209e:	f89d 3007 	ldrb.w	r3, [sp, #7]
 80020a2:	095b      	lsrs	r3, r3, #5
 80020a4:	b2db      	uxtb	r3, r3
 80020a6:	9303      	str	r3, [sp, #12]
 80020a8:	9b03      	ldr	r3, [sp, #12]
 80020aa:	2b01      	cmp	r3, #1
 80020ac:	d103      	bne.n	80020b6 <RCC_GetFlagStatus+0x2e>
 80020ae:	4b13      	ldr	r3, [pc, #76]	@ (80020fc <RCC_GetFlagStatus+0x74>)
 80020b0:	681b      	ldr	r3, [r3, #0]
 80020b2:	9305      	str	r3, [sp, #20]
 80020b4:	e009      	b.n	80020ca <RCC_GetFlagStatus+0x42>
 80020b6:	9b03      	ldr	r3, [sp, #12]
 80020b8:	2b02      	cmp	r3, #2
 80020ba:	d103      	bne.n	80020c4 <RCC_GetFlagStatus+0x3c>
 80020bc:	4b0f      	ldr	r3, [pc, #60]	@ (80020fc <RCC_GetFlagStatus+0x74>)
 80020be:	6a1b      	ldr	r3, [r3, #32]
 80020c0:	9305      	str	r3, [sp, #20]
 80020c2:	e002      	b.n	80020ca <RCC_GetFlagStatus+0x42>
 80020c4:	4b0d      	ldr	r3, [pc, #52]	@ (80020fc <RCC_GetFlagStatus+0x74>)
 80020c6:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 80020c8:	9305      	str	r3, [sp, #20]
 80020ca:	f89d 3007 	ldrb.w	r3, [sp, #7]
 80020ce:	f003 031f 	and.w	r3, r3, #31
 80020d2:	9303      	str	r3, [sp, #12]
 80020d4:	9a05      	ldr	r2, [sp, #20]
 80020d6:	9b03      	ldr	r3, [sp, #12]
 80020d8:	fa22 f303 	lsr.w	r3, r2, r3
 80020dc:	f003 0301 	and.w	r3, r3, #1
 80020e0:	2b00      	cmp	r3, #0
 80020e2:	d003      	beq.n	80020ec <RCC_GetFlagStatus+0x64>
 80020e4:	2301      	movs	r3, #1
 80020e6:	f88d 3013 	strb.w	r3, [sp, #19]
 80020ea:	e002      	b.n	80020f2 <RCC_GetFlagStatus+0x6a>
 80020ec:	2300      	movs	r3, #0
 80020ee:	f88d 3013 	strb.w	r3, [sp, #19]
 80020f2:	f89d 3013 	ldrb.w	r3, [sp, #19]
 80020f6:	4618      	mov	r0, r3
 80020f8:	b006      	add	sp, #24
 80020fa:	4770      	bx	lr
 80020fc:	40021000 	.word	0x40021000

08002100 <RCC_ClearFlag>:
 8002100:	4b03      	ldr	r3, [pc, #12]	@ (8002110 <RCC_ClearFlag+0x10>)
 8002102:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8002104:	4a02      	ldr	r2, [pc, #8]	@ (8002110 <RCC_ClearFlag+0x10>)
 8002106:	f043 7380 	orr.w	r3, r3, #16777216	@ 0x1000000
 800210a:	6253      	str	r3, [r2, #36]	@ 0x24
 800210c:	bf00      	nop
 800210e:	4770      	bx	lr
 8002110:	40021000 	.word	0x40021000

08002114 <RCC_GetITStatus>:
 8002114:	b084      	sub	sp, #16
 8002116:	4603      	mov	r3, r0
 8002118:	f88d 3007 	strb.w	r3, [sp, #7]
 800211c:	2300      	movs	r3, #0
 800211e:	f88d 300f 	strb.w	r3, [sp, #15]
 8002122:	4b09      	ldr	r3, [pc, #36]	@ (8002148 <RCC_GetITStatus+0x34>)
 8002124:	689a      	ldr	r2, [r3, #8]
 8002126:	f89d 3007 	ldrb.w	r3, [sp, #7]
 800212a:	4013      	ands	r3, r2
 800212c:	2b00      	cmp	r3, #0
 800212e:	d003      	beq.n	8002138 <RCC_GetITStatus+0x24>
 8002130:	2301      	movs	r3, #1
 8002132:	f88d 300f 	strb.w	r3, [sp, #15]
 8002136:	e002      	b.n	800213e <RCC_GetITStatus+0x2a>
 8002138:	2300      	movs	r3, #0
 800213a:	f88d 300f 	strb.w	r3, [sp, #15]
 800213e:	f89d 300f 	ldrb.w	r3, [sp, #15]
 8002142:	4618      	mov	r0, r3
 8002144:	b004      	add	sp, #16
 8002146:	4770      	bx	lr
 8002148:	40021000 	.word	0x40021000

0800214c <RCC_ClearITPendingBit>:
 800214c:	b082      	sub	sp, #8
 800214e:	4603      	mov	r3, r0
 8002150:	f88d 3007 	strb.w	r3, [sp, #7]
 8002154:	4a03      	ldr	r2, [pc, #12]	@ (8002164 <RCC_ClearITPendingBit+0x18>)
 8002156:	f89d 3007 	ldrb.w	r3, [sp, #7]
 800215a:	7013      	strb	r3, [r2, #0]
 800215c:	bf00      	nop
 800215e:	b002      	add	sp, #8
 8002160:	4770      	bx	lr
 8002162:	bf00      	nop
 8002164:	4002100a 	.word	0x4002100a

08002168 <SystemInit>:
 8002168:	b508      	push	{r3, lr}
 800216a:	4b16      	ldr	r3, [pc, #88]	@ (80021c4 <SystemInit+0x5c>)
 800216c:	681b      	ldr	r3, [r3, #0]
 800216e:	4a15      	ldr	r2, [pc, #84]	@ (80021c4 <SystemInit+0x5c>)
 8002170:	f043 0301 	orr.w	r3, r3, #1
 8002174:	6013      	str	r3, [r2, #0]
 8002176:	4b13      	ldr	r3, [pc, #76]	@ (80021c4 <SystemInit+0x5c>)
 8002178:	685a      	ldr	r2, [r3, #4]
 800217a:	4912      	ldr	r1, [pc, #72]	@ (80021c4 <SystemInit+0x5c>)
 800217c:	4b12      	ldr	r3, [pc, #72]	@ (80021c8 <SystemInit+0x60>)
 800217e:	4013      	ands	r3, r2
 8002180:	604b      	str	r3, [r1, #4]
 8002182:	4b10      	ldr	r3, [pc, #64]	@ (80021c4 <SystemInit+0x5c>)
 8002184:	681b      	ldr	r3, [r3, #0]
 8002186:	4a0f      	ldr	r2, [pc, #60]	@ (80021c4 <SystemInit+0x5c>)
 8002188:	f023 7384 	bic.w	r3, r3, #17301504	@ 0x1080000
 800218c:	f423 3380 	bic.w	r3, r3, #65536	@ 0x10000
 8002190:	6013      	str	r3, [r2, #0]
 8002192:	4b0c      	ldr	r3, [pc, #48]	@ (80021c4 <SystemInit+0x5c>)
 8002194:	681b      	ldr	r3, [r3, #0]
 8002196:	4a0b      	ldr	r2, [pc, #44]	@ (80021c4 <SystemInit+0x5c>)
 8002198:	f423 2380 	bic.w	r3, r3, #262144	@ 0x40000
 800219c:	6013      	str	r3, [r2, #0]
 800219e:	4b09      	ldr	r3, [pc, #36]	@ (80021c4 <SystemInit+0x5c>)
 80021a0:	685b      	ldr	r3, [r3, #4]
 80021a2:	4a08      	ldr	r2, [pc, #32]	@ (80021c4 <SystemInit+0x5c>)
 80021a4:	f423 03fe 	bic.w	r3, r3, #8323072	@ 0x7f0000
 80021a8:	6053      	str	r3, [r2, #4]
 80021aa:	4b06      	ldr	r3, [pc, #24]	@ (80021c4 <SystemInit+0x5c>)
 80021ac:	f44f 021f 	mov.w	r2, #10420224	@ 0x9f0000
 80021b0:	609a      	str	r2, [r3, #8]
 80021b2:	f000 f87b 	bl	80022ac <SetSysClock>
 80021b6:	4b05      	ldr	r3, [pc, #20]	@ (80021cc <SystemInit+0x64>)
 80021b8:	f04f 6200 	mov.w	r2, #134217728	@ 0x8000000
 80021bc:	609a      	str	r2, [r3, #8]
 80021be:	bf00      	nop
 80021c0:	bd08      	pop	{r3, pc}
 80021c2:	bf00      	nop
 80021c4:	40021000 	.word	0x40021000
 80021c8:	f8ff0000 	.word	0xf8ff0000
 80021cc:	e000ed00 	.word	0xe000ed00

080021d0 <SystemCoreClockUpdate>:
 80021d0:	b084      	sub	sp, #16
 80021d2:	2300      	movs	r3, #0
 80021d4:	9303      	str	r3, [sp, #12]
 80021d6:	2300      	movs	r3, #0
 80021d8:	9302      	str	r3, [sp, #8]
 80021da:	2300      	movs	r3, #0
 80021dc:	9301      	str	r3, [sp, #4]
 80021de:	4b2e      	ldr	r3, [pc, #184]	@ (8002298 <SystemCoreClockUpdate+0xc8>)
 80021e0:	685b      	ldr	r3, [r3, #4]
 80021e2:	f003 030c 	and.w	r3, r3, #12
 80021e6:	9303      	str	r3, [sp, #12]
 80021e8:	9b03      	ldr	r3, [sp, #12]
 80021ea:	2b08      	cmp	r3, #8
 80021ec:	d011      	beq.n	8002212 <SystemCoreClockUpdate+0x42>
 80021ee:	9b03      	ldr	r3, [sp, #12]
 80021f0:	2b08      	cmp	r3, #8
 80021f2:	d83a      	bhi.n	800226a <SystemCoreClockUpdate+0x9a>
 80021f4:	9b03      	ldr	r3, [sp, #12]
 80021f6:	2b00      	cmp	r3, #0
 80021f8:	d003      	beq.n	8002202 <SystemCoreClockUpdate+0x32>
 80021fa:	9b03      	ldr	r3, [sp, #12]
 80021fc:	2b04      	cmp	r3, #4
 80021fe:	d004      	beq.n	800220a <SystemCoreClockUpdate+0x3a>
 8002200:	e033      	b.n	800226a <SystemCoreClockUpdate+0x9a>
 8002202:	4b26      	ldr	r3, [pc, #152]	@ (800229c <SystemCoreClockUpdate+0xcc>)
 8002204:	4a26      	ldr	r2, [pc, #152]	@ (80022a0 <SystemCoreClockUpdate+0xd0>)
 8002206:	601a      	str	r2, [r3, #0]
 8002208:	e033      	b.n	8002272 <SystemCoreClockUpdate+0xa2>
 800220a:	4b24      	ldr	r3, [pc, #144]	@ (800229c <SystemCoreClockUpdate+0xcc>)
 800220c:	4a24      	ldr	r2, [pc, #144]	@ (80022a0 <SystemCoreClockUpdate+0xd0>)
 800220e:	601a      	str	r2, [r3, #0]
 8002210:	e02f      	b.n	8002272 <SystemCoreClockUpdate+0xa2>
 8002212:	4b21      	ldr	r3, [pc, #132]	@ (8002298 <SystemCoreClockUpdate+0xc8>)
 8002214:	685b      	ldr	r3, [r3, #4]
 8002216:	f403 1370 	and.w	r3, r3, #3932160	@ 0x3c0000
 800221a:	9302      	str	r3, [sp, #8]
 800221c:	4b1e      	ldr	r3, [pc, #120]	@ (8002298 <SystemCoreClockUpdate+0xc8>)
 800221e:	685b      	ldr	r3, [r3, #4]
 8002220:	f403 3380 	and.w	r3, r3, #65536	@ 0x10000
 8002224:	9301      	str	r3, [sp, #4]
 8002226:	9b02      	ldr	r3, [sp, #8]
 8002228:	0c9b      	lsrs	r3, r3, #18
 800222a:	3302      	adds	r3, #2
 800222c:	9302      	str	r3, [sp, #8]
 800222e:	9b01      	ldr	r3, [sp, #4]
 8002230:	2b00      	cmp	r3, #0
 8002232:	d106      	bne.n	8002242 <SystemCoreClockUpdate+0x72>
 8002234:	9b02      	ldr	r3, [sp, #8]
 8002236:	4a1b      	ldr	r2, [pc, #108]	@ (80022a4 <SystemCoreClockUpdate+0xd4>)
 8002238:	fb02 f303 	mul.w	r3, r2, r3
 800223c:	4a17      	ldr	r2, [pc, #92]	@ (800229c <SystemCoreClockUpdate+0xcc>)
 800223e:	6013      	str	r3, [r2, #0]
 8002240:	e017      	b.n	8002272 <SystemCoreClockUpdate+0xa2>
 8002242:	4b15      	ldr	r3, [pc, #84]	@ (8002298 <SystemCoreClockUpdate+0xc8>)
 8002244:	685b      	ldr	r3, [r3, #4]
 8002246:	f403 3300 	and.w	r3, r3, #131072	@ 0x20000
 800224a:	2b00      	cmp	r3, #0
 800224c:	d006      	beq.n	800225c <SystemCoreClockUpdate+0x8c>
 800224e:	9b02      	ldr	r3, [sp, #8]
 8002250:	4a14      	ldr	r2, [pc, #80]	@ (80022a4 <SystemCoreClockUpdate+0xd4>)
 8002252:	fb02 f303 	mul.w	r3, r2, r3
 8002256:	4a11      	ldr	r2, [pc, #68]	@ (800229c <SystemCoreClockUpdate+0xcc>)
 8002258:	6013      	str	r3, [r2, #0]
 800225a:	e00a      	b.n	8002272 <SystemCoreClockUpdate+0xa2>
 800225c:	9b02      	ldr	r3, [sp, #8]
 800225e:	4a10      	ldr	r2, [pc, #64]	@ (80022a0 <SystemCoreClockUpdate+0xd0>)
 8002260:	fb02 f303 	mul.w	r3, r2, r3
 8002264:	4a0d      	ldr	r2, [pc, #52]	@ (800229c <SystemCoreClockUpdate+0xcc>)
 8002266:	6013      	str	r3, [r2, #0]
 8002268:	e003      	b.n	8002272 <SystemCoreClockUpdate+0xa2>
 800226a:	4b0c      	ldr	r3, [pc, #48]	@ (800229c <SystemCoreClockUpdate+0xcc>)
 800226c:	4a0c      	ldr	r2, [pc, #48]	@ (80022a0 <SystemCoreClockUpdate+0xd0>)
 800226e:	601a      	str	r2, [r3, #0]
 8002270:	bf00      	nop
 8002272:	4b09      	ldr	r3, [pc, #36]	@ (8002298 <SystemCoreClockUpdate+0xc8>)
 8002274:	685b      	ldr	r3, [r3, #4]
 8002276:	091b      	lsrs	r3, r3, #4
 8002278:	f003 030f 	and.w	r3, r3, #15
 800227c:	4a0a      	ldr	r2, [pc, #40]	@ (80022a8 <SystemCoreClockUpdate+0xd8>)
 800227e:	5cd3      	ldrb	r3, [r2, r3]
 8002280:	b2db      	uxtb	r3, r3
 8002282:	9303      	str	r3, [sp, #12]
 8002284:	4b05      	ldr	r3, [pc, #20]	@ (800229c <SystemCoreClockUpdate+0xcc>)
 8002286:	681a      	ldr	r2, [r3, #0]
 8002288:	9b03      	ldr	r3, [sp, #12]
 800228a:	fa22 f303 	lsr.w	r3, r2, r3
 800228e:	4a03      	ldr	r2, [pc, #12]	@ (800229c <SystemCoreClockUpdate+0xcc>)
 8002290:	6013      	str	r3, [r2, #0]
 8002292:	bf00      	nop
 8002294:	b004      	add	sp, #16
 8002296:	4770      	bx	lr
 8002298:	40021000 	.word	0x40021000
 800229c:	20000008 	.word	0x20000008
 80022a0:	007a1200 	.word	0x007a1200
 80022a4:	003d0900 	.word	0x003d0900
 80022a8:	08000710 	.word	0x08000710

080022ac <SetSysClock>:
 80022ac:	b508      	push	{r3, lr}
 80022ae:	f000 f802 	bl	80022b6 <SetSysClockTo72>
 80022b2:	bf00      	nop
 80022b4:	bd08      	pop	{r3, pc}

080022b6 <SetSysClockTo72>:
 80022b6:	b082      	sub	sp, #8
 80022b8:	2300      	movs	r3, #0
 80022ba:	9301      	str	r3, [sp, #4]
 80022bc:	2300      	movs	r3, #0
 80022be:	9300      	str	r3, [sp, #0]
 80022c0:	4b38      	ldr	r3, [pc, #224]	@ (80023a4 <SetSysClockTo72+0xee>)
 80022c2:	681b      	ldr	r3, [r3, #0]
 80022c4:	4a37      	ldr	r2, [pc, #220]	@ (80023a4 <SetSysClockTo72+0xee>)
 80022c6:	f443 3380 	orr.w	r3, r3, #65536	@ 0x10000
 80022ca:	6013      	str	r3, [r2, #0]
 80022cc:	4b35      	ldr	r3, [pc, #212]	@ (80023a4 <SetSysClockTo72+0xee>)
 80022ce:	681b      	ldr	r3, [r3, #0]
 80022d0:	f403 3300 	and.w	r3, r3, #131072	@ 0x20000
 80022d4:	9300      	str	r3, [sp, #0]
 80022d6:	9b01      	ldr	r3, [sp, #4]
 80022d8:	3301      	adds	r3, #1
 80022da:	9301      	str	r3, [sp, #4]
 80022dc:	9b00      	ldr	r3, [sp, #0]
 80022de:	2b00      	cmp	r3, #0
 80022e0:	d103      	bne.n	80022ea <SetSysClockTo72+0x34>
 80022e2:	9b01      	ldr	r3, [sp, #4]
 80022e4:	f5b3 6fa0 	cmp.w	r3, #1280	@ 0x500
 80022e8:	d1f0      	bne.n	80022cc <SetSysClockTo72+0x16>
 80022ea:	4b2e      	ldr	r3, [pc, #184]	@ (80023a4 <SetSysClockTo72+0xee>)
 80022ec:	681b      	ldr	r3, [r3, #0]
 80022ee:	f403 3300 	and.w	r3, r3, #131072	@ 0x20000
 80022f2:	2b00      	cmp	r3, #0
 80022f4:	d002      	beq.n	80022fc <SetSysClockTo72+0x46>
 80022f6:	2301      	movs	r3, #1
 80022f8:	9300      	str	r3, [sp, #0]
 80022fa:	e001      	b.n	8002300 <SetSysClockTo72+0x4a>
 80022fc:	2300      	movs	r3, #0
 80022fe:	9300      	str	r3, [sp, #0]
 8002300:	9b00      	ldr	r3, [sp, #0]
 8002302:	2b01      	cmp	r3, #1
 8002304:	d14b      	bne.n	800239e <SetSysClockTo72+0xe8>
 8002306:	4b28      	ldr	r3, [pc, #160]	@ (80023a8 <SetSysClockTo72+0xf2>)
 8002308:	681b      	ldr	r3, [r3, #0]
 800230a:	4a27      	ldr	r2, [pc, #156]	@ (80023a8 <SetSysClockTo72+0xf2>)
 800230c:	f043 0310 	orr.w	r3, r3, #16
 8002310:	6013      	str	r3, [r2, #0]
 8002312:	4b25      	ldr	r3, [pc, #148]	@ (80023a8 <SetSysClockTo72+0xf2>)
 8002314:	681b      	ldr	r3, [r3, #0]
 8002316:	4a24      	ldr	r2, [pc, #144]	@ (80023a8 <SetSysClockTo72+0xf2>)
 8002318:	f023 0303 	bic.w	r3, r3, #3
 800231c:	6013      	str	r3, [r2, #0]
 800231e:	4b22      	ldr	r3, [pc, #136]	@ (80023a8 <SetSysClockTo72+0xf2>)
 8002320:	681b      	ldr	r3, [r3, #0]
 8002322:	4a21      	ldr	r2, [pc, #132]	@ (80023a8 <SetSysClockTo72+0xf2>)
 8002324:	f043 0302 	orr.w	r3, r3, #2
 8002328:	6013      	str	r3, [r2, #0]
 800232a:	4b1e      	ldr	r3, [pc, #120]	@ (80023a4 <SetSysClockTo72+0xee>)
 800232c:	4a1d      	ldr	r2, [pc, #116]	@ (80023a4 <SetSysClockTo72+0xee>)
 800232e:	685b      	ldr	r3, [r3, #4]
 8002330:	6053      	str	r3, [r2, #4]
 8002332:	4b1c      	ldr	r3, [pc, #112]	@ (80023a4 <SetSysClockTo72+0xee>)
 8002334:	4a1b      	ldr	r2, [pc, #108]	@ (80023a4 <SetSysClockTo72+0xee>)
 8002336:	685b      	ldr	r3, [r3, #4]
 8002338:	6053      	str	r3, [r2, #4]
 800233a:	4b1a      	ldr	r3, [pc, #104]	@ (80023a4 <SetSysClockTo72+0xee>)
 800233c:	685b      	ldr	r3, [r3, #4]
 800233e:	4a19      	ldr	r2, [pc, #100]	@ (80023a4 <SetSysClockTo72+0xee>)
 8002340:	f443 6380 	orr.w	r3, r3, #1024	@ 0x400
 8002344:	6053      	str	r3, [r2, #4]
 8002346:	4b17      	ldr	r3, [pc, #92]	@ (80023a4 <SetSysClockTo72+0xee>)
 8002348:	685b      	ldr	r3, [r3, #4]
 800234a:	4a16      	ldr	r2, [pc, #88]	@ (80023a4 <SetSysClockTo72+0xee>)
 800234c:	f423 137c 	bic.w	r3, r3, #4128768	@ 0x3f0000
 8002350:	6053      	str	r3, [r2, #4]
 8002352:	4b14      	ldr	r3, [pc, #80]	@ (80023a4 <SetSysClockTo72+0xee>)
 8002354:	685b      	ldr	r3, [r3, #4]
 8002356:	4a13      	ldr	r2, [pc, #76]	@ (80023a4 <SetSysClockTo72+0xee>)
 8002358:	f443 13e8 	orr.w	r3, r3, #1900544	@ 0x1d0000
 800235c:	6053      	str	r3, [r2, #4]
 800235e:	4b11      	ldr	r3, [pc, #68]	@ (80023a4 <SetSysClockTo72+0xee>)
 8002360:	681b      	ldr	r3, [r3, #0]
 8002362:	4a10      	ldr	r2, [pc, #64]	@ (80023a4 <SetSysClockTo72+0xee>)
 8002364:	f043 7380 	orr.w	r3, r3, #16777216	@ 0x1000000
 8002368:	6013      	str	r3, [r2, #0]
 800236a:	bf00      	nop
 800236c:	4b0d      	ldr	r3, [pc, #52]	@ (80023a4 <SetSysClockTo72+0xee>)
 800236e:	681b      	ldr	r3, [r3, #0]
 8002370:	f003 7300 	and.w	r3, r3, #33554432	@ 0x2000000
 8002374:	2b00      	cmp	r3, #0
 8002376:	d0f9      	beq.n	800236c <SetSysClockTo72+0xb6>
 8002378:	4b0a      	ldr	r3, [pc, #40]	@ (80023a4 <SetSysClockTo72+0xee>)
 800237a:	685b      	ldr	r3, [r3, #4]
 800237c:	4a09      	ldr	r2, [pc, #36]	@ (80023a4 <SetSysClockTo72+0xee>)
 800237e:	f023 0303 	bic.w	r3, r3, #3
 8002382:	6053      	str	r3, [r2, #4]
 8002384:	4b07      	ldr	r3, [pc, #28]	@ (80023a4 <SetSysClockTo72+0xee>)
 8002386:	685b      	ldr	r3, [r3, #4]
 8002388:	4a06      	ldr	r2, [pc, #24]	@ (80023a4 <SetSysClockTo72+0xee>)
 800238a:	f043 0302 	orr.w	r3, r3, #2
 800238e:	6053      	str	r3, [r2, #4]
 8002390:	bf00      	nop
 8002392:	4b04      	ldr	r3, [pc, #16]	@ (80023a4 <SetSysClockTo72+0xee>)
 8002394:	685b      	ldr	r3, [r3, #4]
 8002396:	f003 030c 	and.w	r3, r3, #12
 800239a:	2b08      	cmp	r3, #8
 800239c:	d1f9      	bne.n	8002392 <SetSysClockTo72+0xdc>
 800239e:	bf00      	nop
 80023a0:	b002      	add	sp, #8
 80023a2:	4770      	bx	lr
 80023a4:	40021000 	.word	0x40021000
 80023a8:	40022000 	.word	0x40022000

080023ac <Test1>:
 80023ac:	4b04      	ldr	r3, [pc, #16]	@ (80023c0 <Test1+0x14>)
 80023ae:	f04f 5280 	mov.w	r2, #268435456	@ 0x10000000
 80023b2:	601a      	str	r2, [r3, #0]
 80023b4:	f3bf 8f4f 	dsb	sy
 80023b8:	f3bf 8f6f 	isb	sy
 80023bc:	bf00      	nop
 80023be:	4770      	bx	lr
 80023c0:	e000ed04 	.word	0xe000ed04

080023c4 <prvInitialiseTaskLists>:
 80023c4:	b500      	push	{lr}
 80023c6:	b083      	sub	sp, #12
 80023c8:	2300      	movs	r3, #0
 80023ca:	9301      	str	r3, [sp, #4]
 80023cc:	e00c      	b.n	80023e8 <prvInitialiseTaskLists+0x24>
 80023ce:	9a01      	ldr	r2, [sp, #4]
 80023d0:	4613      	mov	r3, r2
 80023d2:	009b      	lsls	r3, r3, #2
 80023d4:	4413      	add	r3, r2
 80023d6:	009b      	lsls	r3, r3, #2
 80023d8:	4a11      	ldr	r2, [pc, #68]	@ (8002420 <prvInitialiseTaskLists+0x5c>)
 80023da:	4413      	add	r3, r2
 80023dc:	4618      	mov	r0, r3
 80023de:	f7fe fbab 	bl	8000b38 <vListInitialise>
 80023e2:	9b01      	ldr	r3, [sp, #4]
 80023e4:	3301      	adds	r3, #1
 80023e6:	9301      	str	r3, [sp, #4]
 80023e8:	9b01      	ldr	r3, [sp, #4]
 80023ea:	2b04      	cmp	r3, #4
 80023ec:	d9ef      	bls.n	80023ce <prvInitialiseTaskLists+0xa>
 80023ee:	480d      	ldr	r0, [pc, #52]	@ (8002424 <prvInitialiseTaskLists+0x60>)
 80023f0:	f7fe fba2 	bl	8000b38 <vListInitialise>
 80023f4:	480c      	ldr	r0, [pc, #48]	@ (8002428 <prvInitialiseTaskLists+0x64>)
 80023f6:	f7fe fb9f 	bl	8000b38 <vListInitialise>
 80023fa:	480c      	ldr	r0, [pc, #48]	@ (800242c <prvInitialiseTaskLists+0x68>)
 80023fc:	f7fe fb9c 	bl	8000b38 <vListInitialise>
 8002400:	480b      	ldr	r0, [pc, #44]	@ (8002430 <prvInitialiseTaskLists+0x6c>)
 8002402:	f7fe fb99 	bl	8000b38 <vListInitialise>
 8002406:	480b      	ldr	r0, [pc, #44]	@ (8002434 <prvInitialiseTaskLists+0x70>)
 8002408:	f7fe fb96 	bl	8000b38 <vListInitialise>
 800240c:	4b0a      	ldr	r3, [pc, #40]	@ (8002438 <prvInitialiseTaskLists+0x74>)
 800240e:	4a05      	ldr	r2, [pc, #20]	@ (8002424 <prvInitialiseTaskLists+0x60>)
 8002410:	601a      	str	r2, [r3, #0]
 8002412:	4b0a      	ldr	r3, [pc, #40]	@ (800243c <prvInitialiseTaskLists+0x78>)
 8002414:	4a04      	ldr	r2, [pc, #16]	@ (8002428 <prvInitialiseTaskLists+0x64>)
 8002416:	601a      	str	r2, [r3, #0]
 8002418:	bf00      	nop
 800241a:	b003      	add	sp, #12
 800241c:	f85d fb04 	ldr.w	pc, [sp], #4
 8002420:	20002868 	.word	0x20002868
 8002424:	2000282c 	.word	0x2000282c
 8002428:	20002840 	.word	0x20002840
 800242c:	20002854 	.word	0x20002854
 8002430:	200028f8 	.word	0x200028f8
 8002434:	2000290c 	.word	0x2000290c
 8002438:	20002824 	.word	0x20002824
 800243c:	20002828 	.word	0x20002828

08002440 <prvAddNewTaskToReadyList>:
 8002440:	b500      	push	{lr}
 8002442:	b083      	sub	sp, #12
 8002444:	9001      	str	r0, [sp, #4]
 8002446:	f7fe ff47 	bl	80012d8 <vPortEnterCritical>
 800244a:	4b2b      	ldr	r3, [pc, #172]	@ (80024f8 <prvAddNewTaskToReadyList+0xb8>)
 800244c:	681b      	ldr	r3, [r3, #0]
 800244e:	3301      	adds	r3, #1
 8002450:	4a29      	ldr	r2, [pc, #164]	@ (80024f8 <prvAddNewTaskToReadyList+0xb8>)
 8002452:	6013      	str	r3, [r2, #0]
 8002454:	4b29      	ldr	r3, [pc, #164]	@ (80024fc <prvAddNewTaskToReadyList+0xbc>)
 8002456:	681b      	ldr	r3, [r3, #0]
 8002458:	2b00      	cmp	r3, #0
 800245a:	d109      	bne.n	8002470 <prvAddNewTaskToReadyList+0x30>
 800245c:	4a27      	ldr	r2, [pc, #156]	@ (80024fc <prvAddNewTaskToReadyList+0xbc>)
 800245e:	9b01      	ldr	r3, [sp, #4]
 8002460:	6013      	str	r3, [r2, #0]
 8002462:	4b25      	ldr	r3, [pc, #148]	@ (80024f8 <prvAddNewTaskToReadyList+0xb8>)
 8002464:	681b      	ldr	r3, [r3, #0]
 8002466:	2b01      	cmp	r3, #1
 8002468:	d110      	bne.n	800248c <prvAddNewTaskToReadyList+0x4c>
 800246a:	f7ff ffab 	bl	80023c4 <prvInitialiseTaskLists>
 800246e:	e00d      	b.n	800248c <prvAddNewTaskToReadyList+0x4c>
 8002470:	4b23      	ldr	r3, [pc, #140]	@ (8002500 <prvAddNewTaskToReadyList+0xc0>)
 8002472:	681b      	ldr	r3, [r3, #0]
 8002474:	2b00      	cmp	r3, #0
 8002476:	d109      	bne.n	800248c <prvAddNewTaskToReadyList+0x4c>
 8002478:	4b20      	ldr	r3, [pc, #128]	@ (80024fc <prvAddNewTaskToReadyList+0xbc>)
 800247a:	681b      	ldr	r3, [r3, #0]
 800247c:	6ada      	ldr	r2, [r3, #44]	@ 0x2c
 800247e:	9b01      	ldr	r3, [sp, #4]
 8002480:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
 8002482:	429a      	cmp	r2, r3
 8002484:	d802      	bhi.n	800248c <prvAddNewTaskToReadyList+0x4c>
 8002486:	4a1d      	ldr	r2, [pc, #116]	@ (80024fc <prvAddNewTaskToReadyList+0xbc>)
 8002488:	9b01      	ldr	r3, [sp, #4]
 800248a:	6013      	str	r3, [r2, #0]
 800248c:	4b1d      	ldr	r3, [pc, #116]	@ (8002504 <prvAddNewTaskToReadyList+0xc4>)
 800248e:	681b      	ldr	r3, [r3, #0]
 8002490:	3301      	adds	r3, #1
 8002492:	4a1c      	ldr	r2, [pc, #112]	@ (8002504 <prvAddNewTaskToReadyList+0xc4>)
 8002494:	6013      	str	r3, [r2, #0]
 8002496:	9b01      	ldr	r3, [sp, #4]
 8002498:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
 800249a:	2201      	movs	r2, #1
 800249c:	409a      	lsls	r2, r3
 800249e:	4b1a      	ldr	r3, [pc, #104]	@ (8002508 <prvAddNewTaskToReadyList+0xc8>)
 80024a0:	681b      	ldr	r3, [r3, #0]
 80024a2:	4313      	orrs	r3, r2
 80024a4:	4a18      	ldr	r2, [pc, #96]	@ (8002508 <prvAddNewTaskToReadyList+0xc8>)
 80024a6:	6013      	str	r3, [r2, #0]
 80024a8:	9b01      	ldr	r3, [sp, #4]
 80024aa:	6ada      	ldr	r2, [r3, #44]	@ 0x2c
 80024ac:	4613      	mov	r3, r2
 80024ae:	009b      	lsls	r3, r3, #2
 80024b0:	4413      	add	r3, r2
 80024b2:	009b      	lsls	r3, r3, #2
 80024b4:	4a15      	ldr	r2, [pc, #84]	@ (800250c <prvAddNewTaskToReadyList+0xcc>)
 80024b6:	441a      	add	r2, r3
 80024b8:	9b01      	ldr	r3, [sp, #4]
 80024ba:	3304      	adds	r3, #4
 80024bc:	4619      	mov	r1, r3
 80024be:	4610      	mov	r0, r2
 80024c0:	f7fe fadf 	bl	8000a82 <vListInsertEnd>
 80024c4:	f7fe ff1e 	bl	8001304 <vPortExitCritical>
 80024c8:	4b0d      	ldr	r3, [pc, #52]	@ (8002500 <prvAddNewTaskToReadyList+0xc0>)
 80024ca:	681b      	ldr	r3, [r3, #0]
 80024cc:	2b00      	cmp	r3, #0
 80024ce:	d00e      	beq.n	80024ee <prvAddNewTaskToReadyList+0xae>
 80024d0:	4b0a      	ldr	r3, [pc, #40]	@ (80024fc <prvAddNewTaskToReadyList+0xbc>)
 80024d2:	681b      	ldr	r3, [r3, #0]
 80024d4:	6cda      	ldr	r2, [r3, #76]	@ 0x4c
 80024d6:	9b01      	ldr	r3, [sp, #4]
 80024d8:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
 80024da:	429a      	cmp	r2, r3
 80024dc:	d207      	bcs.n	80024ee <prvAddNewTaskToReadyList+0xae>
 80024de:	4b0c      	ldr	r3, [pc, #48]	@ (8002510 <prvAddNewTaskToReadyList+0xd0>)
 80024e0:	f04f 5280 	mov.w	r2, #268435456	@ 0x10000000
 80024e4:	601a      	str	r2, [r3, #0]
 80024e6:	f3bf 8f4f 	dsb	sy
 80024ea:	f3bf 8f6f 	isb	sy
 80024ee:	bf00      	nop
 80024f0:	b003      	add	sp, #12
 80024f2:	f85d fb04 	ldr.w	pc, [sp], #4
 80024f6:	bf00      	nop
 80024f8:	200028d4 	.word	0x200028d4
 80024fc:	20002920 	.word	0x20002920
 8002500:	200028e8 	.word	0x200028e8
 8002504:	200028f0 	.word	0x200028f0
 8002508:	200028cc 	.word	0x200028cc
 800250c:	20002868 	.word	0x20002868
 8002510:	e000ed04 	.word	0xe000ed04

08002514 <prvInitialiseNewTask>:
 8002514:	b500      	push	{lr}
 8002516:	b087      	sub	sp, #28
 8002518:	9003      	str	r0, [sp, #12]
 800251a:	9102      	str	r1, [sp, #8]
 800251c:	9201      	str	r2, [sp, #4]
 800251e:	9300      	str	r3, [sp, #0]
 8002520:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
 8002522:	6b1a      	ldr	r2, [r3, #48]	@ 0x30
 8002524:	9b01      	ldr	r3, [sp, #4]
 8002526:	f103 4380 	add.w	r3, r3, #1073741824	@ 0x40000000
 800252a:	3b01      	subs	r3, #1
 800252c:	009b      	lsls	r3, r3, #2
 800252e:	4413      	add	r3, r2
 8002530:	9304      	str	r3, [sp, #16]
 8002532:	9b04      	ldr	r3, [sp, #16]
 8002534:	f023 0307 	bic.w	r3, r3, #7
 8002538:	9304      	str	r3, [sp, #16]
 800253a:	2300      	movs	r3, #0
 800253c:	9305      	str	r3, [sp, #20]
 800253e:	e012      	b.n	8002566 <prvInitialiseNewTask+0x52>
 8002540:	9a02      	ldr	r2, [sp, #8]
 8002542:	9b05      	ldr	r3, [sp, #20]
 8002544:	4413      	add	r3, r2
 8002546:	7819      	ldrb	r1, [r3, #0]
 8002548:	9a0a      	ldr	r2, [sp, #40]	@ 0x28
 800254a:	9b05      	ldr	r3, [sp, #20]
 800254c:	4413      	add	r3, r2
 800254e:	3334      	adds	r3, #52	@ 0x34
 8002550:	460a      	mov	r2, r1
 8002552:	701a      	strb	r2, [r3, #0]
 8002554:	9a02      	ldr	r2, [sp, #8]
 8002556:	9b05      	ldr	r3, [sp, #20]
 8002558:	4413      	add	r3, r2
 800255a:	781b      	ldrb	r3, [r3, #0]
 800255c:	2b00      	cmp	r3, #0
 800255e:	d006      	beq.n	800256e <prvInitialiseNewTask+0x5a>
 8002560:	9b05      	ldr	r3, [sp, #20]
 8002562:	3301      	adds	r3, #1
 8002564:	9305      	str	r3, [sp, #20]
 8002566:	9b05      	ldr	r3, [sp, #20]
 8002568:	2b0f      	cmp	r3, #15
 800256a:	d9e9      	bls.n	8002540 <prvInitialiseNewTask+0x2c>
 800256c:	e000      	b.n	8002570 <prvInitialiseNewTask+0x5c>
 800256e:	bf00      	nop
 8002570:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
 8002572:	2200      	movs	r2, #0
 8002574:	f883 2043 	strb.w	r2, [r3, #67]	@ 0x43
 8002578:	9b08      	ldr	r3, [sp, #32]
 800257a:	2b04      	cmp	r3, #4
 800257c:	d901      	bls.n	8002582 <prvInitialiseNewTask+0x6e>
 800257e:	2304      	movs	r3, #4
 8002580:	9308      	str	r3, [sp, #32]
 8002582:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
 8002584:	9a08      	ldr	r2, [sp, #32]
 8002586:	62da      	str	r2, [r3, #44]	@ 0x2c
 8002588:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
 800258a:	9a08      	ldr	r2, [sp, #32]
 800258c:	64da      	str	r2, [r3, #76]	@ 0x4c
 800258e:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
 8002590:	2200      	movs	r2, #0
 8002592:	651a      	str	r2, [r3, #80]	@ 0x50
 8002594:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
 8002596:	3304      	adds	r3, #4
 8002598:	4618      	mov	r0, r3
 800259a:	f7fe fac5 	bl	8000b28 <vListInitialiseItem>
 800259e:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
 80025a0:	3318      	adds	r3, #24
 80025a2:	4618      	mov	r0, r3
 80025a4:	f7fe fac0 	bl	8000b28 <vListInitialiseItem>
 80025a8:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
 80025aa:	9a0a      	ldr	r2, [sp, #40]	@ 0x28
 80025ac:	611a      	str	r2, [r3, #16]
 80025ae:	9b08      	ldr	r3, [sp, #32]
 80025b0:	f1c3 0205 	rsb	r2, r3, #5
 80025b4:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
 80025b6:	619a      	str	r2, [r3, #24]
 80025b8:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
 80025ba:	9a0a      	ldr	r2, [sp, #40]	@ 0x28
 80025bc:	625a      	str	r2, [r3, #36]	@ 0x24
 80025be:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
 80025c0:	2200      	movs	r2, #0
 80025c2:	655a      	str	r2, [r3, #84]	@ 0x54
 80025c4:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
 80025c6:	2200      	movs	r2, #0
 80025c8:	f883 2058 	strb.w	r2, [r3, #88]	@ 0x58
 80025cc:	9a00      	ldr	r2, [sp, #0]
 80025ce:	9903      	ldr	r1, [sp, #12]
 80025d0:	9804      	ldr	r0, [sp, #16]
 80025d2:	f7fe fe59 	bl	8001288 <pxPortInitialiseStack>
 80025d6:	4602      	mov	r2, r0
 80025d8:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
 80025da:	601a      	str	r2, [r3, #0]
 80025dc:	9b09      	ldr	r3, [sp, #36]	@ 0x24
 80025de:	2b00      	cmp	r3, #0
 80025e0:	d002      	beq.n	80025e8 <prvInitialiseNewTask+0xd4>
 80025e2:	9b09      	ldr	r3, [sp, #36]	@ 0x24
 80025e4:	9a0a      	ldr	r2, [sp, #40]	@ 0x28
 80025e6:	601a      	str	r2, [r3, #0]
 80025e8:	bf00      	nop
 80025ea:	b007      	add	sp, #28
 80025ec:	f85d fb04 	ldr.w	pc, [sp], #4

080025f0 <xTaskCreate>:
 80025f0:	b500      	push	{lr}
 80025f2:	b08d      	sub	sp, #52	@ 0x34
 80025f4:	9007      	str	r0, [sp, #28]
 80025f6:	9106      	str	r1, [sp, #24]
 80025f8:	9304      	str	r3, [sp, #16]
 80025fa:	4613      	mov	r3, r2
 80025fc:	f8ad 3016 	strh.w	r3, [sp, #22]
 8002600:	2300      	movs	r3, #0
 8002602:	930b      	str	r3, [sp, #44]	@ 0x2c
 8002604:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
 8002608:	930a      	str	r3, [sp, #40]	@ 0x28
 800260a:	2300      	movs	r3, #0
 800260c:	9309      	str	r3, [sp, #36]	@ 0x24
 800260e:	f8bd 3016 	ldrh.w	r3, [sp, #22]
 8002612:	009b      	lsls	r3, r3, #2
 8002614:	4618      	mov	r0, r3
 8002616:	f7fe f945 	bl	80008a4 <pvPortMalloc>
 800261a:	9009      	str	r0, [sp, #36]	@ 0x24
 800261c:	9b09      	ldr	r3, [sp, #36]	@ 0x24
 800261e:	2b00      	cmp	r3, #0
 8002620:	d00e      	beq.n	8002640 <xTaskCreate+0x50>
 8002622:	205c      	movs	r0, #92	@ 0x5c
 8002624:	f7fe f93e 	bl	80008a4 <pvPortMalloc>
 8002628:	900b      	str	r0, [sp, #44]	@ 0x2c
 800262a:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
 800262c:	2b00      	cmp	r3, #0
 800262e:	d003      	beq.n	8002638 <xTaskCreate+0x48>
 8002630:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
 8002632:	9a09      	ldr	r2, [sp, #36]	@ 0x24
 8002634:	631a      	str	r2, [r3, #48]	@ 0x30
 8002636:	e005      	b.n	8002644 <xTaskCreate+0x54>
 8002638:	9809      	ldr	r0, [sp, #36]	@ 0x24
 800263a:	f7fe f9c5 	bl	80009c8 <vPortFree>
 800263e:	e001      	b.n	8002644 <xTaskCreate+0x54>
 8002640:	2300      	movs	r3, #0
 8002642:	930b      	str	r3, [sp, #44]	@ 0x2c
 8002644:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
 8002646:	2b00      	cmp	r3, #0
 8002648:	d014      	beq.n	8002674 <xTaskCreate+0x84>
 800264a:	f8bd 2016 	ldrh.w	r2, [sp, #22]
 800264e:	2300      	movs	r3, #0
 8002650:	9303      	str	r3, [sp, #12]
 8002652:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
 8002654:	9302      	str	r3, [sp, #8]
 8002656:	9b0f      	ldr	r3, [sp, #60]	@ 0x3c
 8002658:	9301      	str	r3, [sp, #4]
 800265a:	9b0e      	ldr	r3, [sp, #56]	@ 0x38
 800265c:	9300      	str	r3, [sp, #0]
 800265e:	9b04      	ldr	r3, [sp, #16]
 8002660:	9906      	ldr	r1, [sp, #24]
 8002662:	9807      	ldr	r0, [sp, #28]
 8002664:	f7ff ff56 	bl	8002514 <prvInitialiseNewTask>
 8002668:	980b      	ldr	r0, [sp, #44]	@ 0x2c
 800266a:	f7ff fee9 	bl	8002440 <prvAddNewTaskToReadyList>
 800266e:	2301      	movs	r3, #1
 8002670:	930a      	str	r3, [sp, #40]	@ 0x28
 8002672:	e002      	b.n	800267a <xTaskCreate+0x8a>
 8002674:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
 8002678:	930a      	str	r3, [sp, #40]	@ 0x28
 800267a:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
 800267c:	4618      	mov	r0, r3
 800267e:	b00d      	add	sp, #52	@ 0x34
 8002680:	f85d fb04 	ldr.w	pc, [sp], #4

08002684 <vTaskSuspendAll>:
 8002684:	4b03      	ldr	r3, [pc, #12]	@ (8002694 <vTaskSuspendAll+0x10>)
 8002686:	681b      	ldr	r3, [r3, #0]
 8002688:	3301      	adds	r3, #1
 800268a:	4a02      	ldr	r2, [pc, #8]	@ (8002694 <vTaskSuspendAll+0x10>)
 800268c:	6013      	str	r3, [r2, #0]
 800268e:	bf00      	nop
 8002690:	4770      	bx	lr
 8002692:	bf00      	nop
 8002694:	200028d0 	.word	0x200028d0

08002698 <prvResetNextTaskUnblockTime>:
 8002698:	b082      	sub	sp, #8
 800269a:	4b0b      	ldr	r3, [pc, #44]	@ (80026c8 <prvResetNextTaskUnblockTime+0x30>)
 800269c:	681b      	ldr	r3, [r3, #0]
 800269e:	681b      	ldr	r3, [r3, #0]
 80026a0:	2b00      	cmp	r3, #0
 80026a2:	d104      	bne.n	80026ae <prvResetNextTaskUnblockTime+0x16>
 80026a4:	4b09      	ldr	r3, [pc, #36]	@ (80026cc <prvResetNextTaskUnblockTime+0x34>)
 80026a6:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
 80026aa:	601a      	str	r2, [r3, #0]
 80026ac:	e008      	b.n	80026c0 <prvResetNextTaskUnblockTime+0x28>
 80026ae:	4b06      	ldr	r3, [pc, #24]	@ (80026c8 <prvResetNextTaskUnblockTime+0x30>)
 80026b0:	681b      	ldr	r3, [r3, #0]
 80026b2:	68db      	ldr	r3, [r3, #12]
 80026b4:	68db      	ldr	r3, [r3, #12]
 80026b6:	9301      	str	r3, [sp, #4]
 80026b8:	9b01      	ldr	r3, [sp, #4]
 80026ba:	685b      	ldr	r3, [r3, #4]
 80026bc:	4a03      	ldr	r2, [pc, #12]	@ (80026cc <prvResetNextTaskUnblockTime+0x34>)
 80026be:	6013      	str	r3, [r2, #0]
 80026c0:	bf00      	nop
 80026c2:	b002      	add	sp, #8
 80026c4:	4770      	bx	lr
 80026c6:	bf00      	nop
 80026c8:	20002824 	.word	0x20002824
 80026cc:	200028dc 	.word	0x200028dc

080026d0 <xTaskIncrementTick>:
 80026d0:	b500      	push	{lr}
 80026d2:	b087      	sub	sp, #28
 80026d4:	2300      	movs	r3, #0
 80026d6:	9305      	str	r3, [sp, #20]
 80026d8:	4b45      	ldr	r3, [pc, #276]	@ (80027f0 <xTaskIncrementTick+0x120>)
 80026da:	681b      	ldr	r3, [r3, #0]
 80026dc:	2b00      	cmp	r3, #0
 80026de:	d177      	bne.n	80027d0 <xTaskIncrementTick+0x100>
 80026e0:	4b44      	ldr	r3, [pc, #272]	@ (80027f4 <xTaskIncrementTick+0x124>)
 80026e2:	681b      	ldr	r3, [r3, #0]
 80026e4:	3301      	adds	r3, #1
 80026e6:	9304      	str	r3, [sp, #16]
 80026e8:	4a42      	ldr	r2, [pc, #264]	@ (80027f4 <xTaskIncrementTick+0x124>)
 80026ea:	9b04      	ldr	r3, [sp, #16]
 80026ec:	6013      	str	r3, [r2, #0]
 80026ee:	9b04      	ldr	r3, [sp, #16]
 80026f0:	2b00      	cmp	r3, #0
 80026f2:	d110      	bne.n	8002716 <xTaskIncrementTick+0x46>
 80026f4:	4b40      	ldr	r3, [pc, #256]	@ (80027f8 <xTaskIncrementTick+0x128>)
 80026f6:	681b      	ldr	r3, [r3, #0]
 80026f8:	9303      	str	r3, [sp, #12]
 80026fa:	4b40      	ldr	r3, [pc, #256]	@ (80027fc <xTaskIncrementTick+0x12c>)
 80026fc:	681b      	ldr	r3, [r3, #0]
 80026fe:	4a3e      	ldr	r2, [pc, #248]	@ (80027f8 <xTaskIncrementTick+0x128>)
 8002700:	6013      	str	r3, [r2, #0]
 8002702:	4a3e      	ldr	r2, [pc, #248]	@ (80027fc <xTaskIncrementTick+0x12c>)
 8002704:	9b03      	ldr	r3, [sp, #12]
 8002706:	6013      	str	r3, [r2, #0]
 8002708:	4b3d      	ldr	r3, [pc, #244]	@ (8002800 <xTaskIncrementTick+0x130>)
 800270a:	681b      	ldr	r3, [r3, #0]
 800270c:	3301      	adds	r3, #1
 800270e:	4a3c      	ldr	r2, [pc, #240]	@ (8002800 <xTaskIncrementTick+0x130>)
 8002710:	6013      	str	r3, [r2, #0]
 8002712:	f7ff ffc1 	bl	8002698 <prvResetNextTaskUnblockTime>
 8002716:	4b3b      	ldr	r3, [pc, #236]	@ (8002804 <xTaskIncrementTick+0x134>)
 8002718:	681b      	ldr	r3, [r3, #0]
 800271a:	9a04      	ldr	r2, [sp, #16]
 800271c:	429a      	cmp	r2, r3
 800271e:	d348      	bcc.n	80027b2 <xTaskIncrementTick+0xe2>
 8002720:	4b35      	ldr	r3, [pc, #212]	@ (80027f8 <xTaskIncrementTick+0x128>)
 8002722:	681b      	ldr	r3, [r3, #0]
 8002724:	681b      	ldr	r3, [r3, #0]
 8002726:	2b00      	cmp	r3, #0
 8002728:	d104      	bne.n	8002734 <xTaskIncrementTick+0x64>
 800272a:	4b36      	ldr	r3, [pc, #216]	@ (8002804 <xTaskIncrementTick+0x134>)
 800272c:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
 8002730:	601a      	str	r2, [r3, #0]
 8002732:	e03e      	b.n	80027b2 <xTaskIncrementTick+0xe2>
 8002734:	4b30      	ldr	r3, [pc, #192]	@ (80027f8 <xTaskIncrementTick+0x128>)
 8002736:	681b      	ldr	r3, [r3, #0]
 8002738:	68db      	ldr	r3, [r3, #12]
 800273a:	68db      	ldr	r3, [r3, #12]
 800273c:	9302      	str	r3, [sp, #8]
 800273e:	9b02      	ldr	r3, [sp, #8]
 8002740:	685b      	ldr	r3, [r3, #4]
 8002742:	9301      	str	r3, [sp, #4]
 8002744:	9a04      	ldr	r2, [sp, #16]
 8002746:	9b01      	ldr	r3, [sp, #4]
 8002748:	429a      	cmp	r2, r3
 800274a:	d203      	bcs.n	8002754 <xTaskIncrementTick+0x84>
 800274c:	4a2d      	ldr	r2, [pc, #180]	@ (8002804 <xTaskIncrementTick+0x134>)
 800274e:	9b01      	ldr	r3, [sp, #4]
 8002750:	6013      	str	r3, [r2, #0]
 8002752:	e02e      	b.n	80027b2 <xTaskIncrementTick+0xe2>
 8002754:	9b02      	ldr	r3, [sp, #8]
 8002756:	3304      	adds	r3, #4
 8002758:	4618      	mov	r0, r3
 800275a:	f7fe f96d 	bl	8000a38 <uxListRemove>
 800275e:	9b02      	ldr	r3, [sp, #8]
 8002760:	6a9b      	ldr	r3, [r3, #40]	@ 0x28
 8002762:	2b00      	cmp	r3, #0
 8002764:	d004      	beq.n	8002770 <xTaskIncrementTick+0xa0>
 8002766:	9b02      	ldr	r3, [sp, #8]
 8002768:	3318      	adds	r3, #24
 800276a:	4618      	mov	r0, r3
 800276c:	f7fe f964 	bl	8000a38 <uxListRemove>
 8002770:	9b02      	ldr	r3, [sp, #8]
 8002772:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
 8002774:	2201      	movs	r2, #1
 8002776:	409a      	lsls	r2, r3
 8002778:	4b23      	ldr	r3, [pc, #140]	@ (8002808 <xTaskIncrementTick+0x138>)
 800277a:	681b      	ldr	r3, [r3, #0]
 800277c:	4313      	orrs	r3, r2
 800277e:	4a22      	ldr	r2, [pc, #136]	@ (8002808 <xTaskIncrementTick+0x138>)
 8002780:	6013      	str	r3, [r2, #0]
 8002782:	9b02      	ldr	r3, [sp, #8]
 8002784:	6ada      	ldr	r2, [r3, #44]	@ 0x2c
 8002786:	4613      	mov	r3, r2
 8002788:	009b      	lsls	r3, r3, #2
 800278a:	4413      	add	r3, r2
 800278c:	009b      	lsls	r3, r3, #2
 800278e:	4a1f      	ldr	r2, [pc, #124]	@ (800280c <xTaskIncrementTick+0x13c>)
 8002790:	441a      	add	r2, r3
 8002792:	9b02      	ldr	r3, [sp, #8]
 8002794:	3304      	adds	r3, #4
 8002796:	4619      	mov	r1, r3
 8002798:	4610      	mov	r0, r2
 800279a:	f7fe f972 	bl	8000a82 <vListInsertEnd>
 800279e:	9b02      	ldr	r3, [sp, #8]
 80027a0:	6ada      	ldr	r2, [r3, #44]	@ 0x2c
 80027a2:	4b1b      	ldr	r3, [pc, #108]	@ (8002810 <xTaskIncrementTick+0x140>)
 80027a4:	681b      	ldr	r3, [r3, #0]
 80027a6:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
 80027a8:	429a      	cmp	r2, r3
 80027aa:	d3b9      	bcc.n	8002720 <xTaskIncrementTick+0x50>
 80027ac:	2301      	movs	r3, #1
 80027ae:	9305      	str	r3, [sp, #20]
 80027b0:	e7b6      	b.n	8002720 <xTaskIncrementTick+0x50>
 80027b2:	4b17      	ldr	r3, [pc, #92]	@ (8002810 <xTaskIncrementTick+0x140>)
 80027b4:	681b      	ldr	r3, [r3, #0]
 80027b6:	6ada      	ldr	r2, [r3, #44]	@ 0x2c
 80027b8:	4914      	ldr	r1, [pc, #80]	@ (800280c <xTaskIncrementTick+0x13c>)
 80027ba:	4613      	mov	r3, r2
 80027bc:	009b      	lsls	r3, r3, #2
 80027be:	4413      	add	r3, r2
 80027c0:	009b      	lsls	r3, r3, #2
 80027c2:	440b      	add	r3, r1
 80027c4:	681b      	ldr	r3, [r3, #0]
 80027c6:	2b01      	cmp	r3, #1
 80027c8:	d907      	bls.n	80027da <xTaskIncrementTick+0x10a>
 80027ca:	2301      	movs	r3, #1
 80027cc:	9305      	str	r3, [sp, #20]
 80027ce:	e004      	b.n	80027da <xTaskIncrementTick+0x10a>
 80027d0:	4b10      	ldr	r3, [pc, #64]	@ (8002814 <xTaskIncrementTick+0x144>)
 80027d2:	681b      	ldr	r3, [r3, #0]
 80027d4:	3301      	adds	r3, #1
 80027d6:	4a0f      	ldr	r2, [pc, #60]	@ (8002814 <xTaskIncrementTick+0x144>)
 80027d8:	6013      	str	r3, [r2, #0]
 80027da:	4b0f      	ldr	r3, [pc, #60]	@ (8002818 <xTaskIncrementTick+0x148>)
 80027dc:	681b      	ldr	r3, [r3, #0]
 80027de:	2b00      	cmp	r3, #0
 80027e0:	d001      	beq.n	80027e6 <xTaskIncrementTick+0x116>
 80027e2:	2301      	movs	r3, #1
 80027e4:	9305      	str	r3, [sp, #20]
 80027e6:	9b05      	ldr	r3, [sp, #20]
 80027e8:	4618      	mov	r0, r3
 80027ea:	b007      	add	sp, #28
 80027ec:	f85d fb04 	ldr.w	pc, [sp], #4
 80027f0:	200028d0 	.word	0x200028d0
 80027f4:	200028e0 	.word	0x200028e0
 80027f8:	20002824 	.word	0x20002824
 80027fc:	20002828 	.word	0x20002828
 8002800:	200028e4 	.word	0x200028e4
 8002804:	200028dc 	.word	0x200028dc
 8002808:	200028cc 	.word	0x200028cc
 800280c:	20002868 	.word	0x20002868
 8002810:	20002920 	.word	0x20002920
 8002814:	200028d8 	.word	0x200028d8
 8002818:	200028ec 	.word	0x200028ec

0800281c <xTaskResumeAll>:
 800281c:	b500      	push	{lr}
 800281e:	b085      	sub	sp, #20
 8002820:	2300      	movs	r3, #0
 8002822:	9303      	str	r3, [sp, #12]
 8002824:	2300      	movs	r3, #0
 8002826:	9302      	str	r3, [sp, #8]
 8002828:	f7fe fd56 	bl	80012d8 <vPortEnterCritical>
 800282c:	4b38      	ldr	r3, [pc, #224]	@ (8002910 <xTaskResumeAll+0xf4>)
 800282e:	681b      	ldr	r3, [r3, #0]
 8002830:	3b01      	subs	r3, #1
 8002832:	4a37      	ldr	r2, [pc, #220]	@ (8002910 <xTaskResumeAll+0xf4>)
 8002834:	6013      	str	r3, [r2, #0]
 8002836:	4b36      	ldr	r3, [pc, #216]	@ (8002910 <xTaskResumeAll+0xf4>)
 8002838:	681b      	ldr	r3, [r3, #0]
 800283a:	2b00      	cmp	r3, #0
 800283c:	d161      	bne.n	8002902 <xTaskResumeAll+0xe6>
 800283e:	4b35      	ldr	r3, [pc, #212]	@ (8002914 <xTaskResumeAll+0xf8>)
 8002840:	681b      	ldr	r3, [r3, #0]
 8002842:	2b00      	cmp	r3, #0
 8002844:	d05d      	beq.n	8002902 <xTaskResumeAll+0xe6>
 8002846:	e02e      	b.n	80028a6 <xTaskResumeAll+0x8a>
 8002848:	4b33      	ldr	r3, [pc, #204]	@ (8002918 <xTaskResumeAll+0xfc>)
 800284a:	68db      	ldr	r3, [r3, #12]
 800284c:	68db      	ldr	r3, [r3, #12]
 800284e:	9303      	str	r3, [sp, #12]
 8002850:	9b03      	ldr	r3, [sp, #12]
 8002852:	3318      	adds	r3, #24
 8002854:	4618      	mov	r0, r3
 8002856:	f7fe f8ef 	bl	8000a38 <uxListRemove>
 800285a:	9b03      	ldr	r3, [sp, #12]
 800285c:	3304      	adds	r3, #4
 800285e:	4618      	mov	r0, r3
 8002860:	f7fe f8ea 	bl	8000a38 <uxListRemove>
 8002864:	9b03      	ldr	r3, [sp, #12]
 8002866:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
 8002868:	2201      	movs	r2, #1
 800286a:	409a      	lsls	r2, r3
 800286c:	4b2b      	ldr	r3, [pc, #172]	@ (800291c <xTaskResumeAll+0x100>)
 800286e:	681b      	ldr	r3, [r3, #0]
 8002870:	4313      	orrs	r3, r2
 8002872:	4a2a      	ldr	r2, [pc, #168]	@ (800291c <xTaskResumeAll+0x100>)
 8002874:	6013      	str	r3, [r2, #0]
 8002876:	9b03      	ldr	r3, [sp, #12]
 8002878:	6ada      	ldr	r2, [r3, #44]	@ 0x2c
 800287a:	4613      	mov	r3, r2
 800287c:	009b      	lsls	r3, r3, #2
 800287e:	4413      	add	r3, r2
 8002880:	009b      	lsls	r3, r3, #2
 8002882:	4a27      	ldr	r2, [pc, #156]	@ (8002920 <xTaskResumeAll+0x104>)
 8002884:	441a      	add	r2, r3
 8002886:	9b03      	ldr	r3, [sp, #12]
 8002888:	3304      	adds	r3, #4
 800288a:	4619      	mov	r1, r3
 800288c:	4610      	mov	r0, r2
 800288e:	f7fe f8f8 	bl	8000a82 <vListInsertEnd>
 8002892:	9b03      	ldr	r3, [sp, #12]
 8002894:	6ada      	ldr	r2, [r3, #44]	@ 0x2c
 8002896:	4b23      	ldr	r3, [pc, #140]	@ (8002924 <xTaskResumeAll+0x108>)
 8002898:	681b      	ldr	r3, [r3, #0]
 800289a:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
 800289c:	429a      	cmp	r2, r3
 800289e:	d302      	bcc.n	80028a6 <xTaskResumeAll+0x8a>
 80028a0:	4b21      	ldr	r3, [pc, #132]	@ (8002928 <xTaskResumeAll+0x10c>)
 80028a2:	2201      	movs	r2, #1
 80028a4:	601a      	str	r2, [r3, #0]
 80028a6:	4b1c      	ldr	r3, [pc, #112]	@ (8002918 <xTaskResumeAll+0xfc>)
 80028a8:	681b      	ldr	r3, [r3, #0]
 80028aa:	2b00      	cmp	r3, #0
 80028ac:	d1cc      	bne.n	8002848 <xTaskResumeAll+0x2c>
 80028ae:	9b03      	ldr	r3, [sp, #12]
 80028b0:	2b00      	cmp	r3, #0
 80028b2:	d001      	beq.n	80028b8 <xTaskResumeAll+0x9c>
 80028b4:	f7ff fef0 	bl	8002698 <prvResetNextTaskUnblockTime>
 80028b8:	4b1c      	ldr	r3, [pc, #112]	@ (800292c <xTaskResumeAll+0x110>)
 80028ba:	681b      	ldr	r3, [r3, #0]
 80028bc:	9301      	str	r3, [sp, #4]
 80028be:	9b01      	ldr	r3, [sp, #4]
 80028c0:	2b00      	cmp	r3, #0
 80028c2:	d010      	beq.n	80028e6 <xTaskResumeAll+0xca>
 80028c4:	f7ff ff04 	bl	80026d0 <xTaskIncrementTick>
 80028c8:	4603      	mov	r3, r0
 80028ca:	2b00      	cmp	r3, #0
 80028cc:	d002      	beq.n	80028d4 <xTaskResumeAll+0xb8>
 80028ce:	4b16      	ldr	r3, [pc, #88]	@ (8002928 <xTaskResumeAll+0x10c>)
 80028d0:	2201      	movs	r2, #1
 80028d2:	601a      	str	r2, [r3, #0]
 80028d4:	9b01      	ldr	r3, [sp, #4]
 80028d6:	3b01      	subs	r3, #1
 80028d8:	9301      	str	r3, [sp, #4]
 80028da:	9b01      	ldr	r3, [sp, #4]
 80028dc:	2b00      	cmp	r3, #0
 80028de:	d1f1      	bne.n	80028c4 <xTaskResumeAll+0xa8>
 80028e0:	4b12      	ldr	r3, [pc, #72]	@ (800292c <xTaskResumeAll+0x110>)
 80028e2:	2200      	movs	r2, #0
 80028e4:	601a      	str	r2, [r3, #0]
 80028e6:	4b10      	ldr	r3, [pc, #64]	@ (8002928 <xTaskResumeAll+0x10c>)
 80028e8:	681b      	ldr	r3, [r3, #0]
 80028ea:	2b00      	cmp	r3, #0
 80028ec:	d009      	beq.n	8002902 <xTaskResumeAll+0xe6>
 80028ee:	2301      	movs	r3, #1
 80028f0:	9302      	str	r3, [sp, #8]
 80028f2:	4b0f      	ldr	r3, [pc, #60]	@ (8002930 <xTaskResumeAll+0x114>)
 80028f4:	f04f 5280 	mov.w	r2, #268435456	@ 0x10000000
 80028f8:	601a      	str	r2, [r3, #0]
 80028fa:	f3bf 8f4f 	dsb	sy
 80028fe:	f3bf 8f6f 	isb	sy
 8002902:	f7fe fcff 	bl	8001304 <vPortExitCritical>
 8002906:	9b02      	ldr	r3, [sp, #8]
 8002908:	4618      	mov	r0, r3
 800290a:	b005      	add	sp, #20
 800290c:	f85d fb04 	ldr.w	pc, [sp], #4
 8002910:	200028d0 	.word	0x200028d0
 8002914:	200028d4 	.word	0x200028d4
 8002918:	20002854 	.word	0x20002854
 800291c:	200028cc 	.word	0x200028cc
 8002920:	20002868 	.word	0x20002868
 8002924:	20002920 	.word	0x20002920
 8002928:	200028ec 	.word	0x200028ec
 800292c:	200028d8 	.word	0x200028d8
 8002930:	e000ed04 	.word	0xe000ed04

08002934 <prvDeleteTCB>:
 8002934:	b500      	push	{lr}
 8002936:	b083      	sub	sp, #12
 8002938:	9001      	str	r0, [sp, #4]
 800293a:	9b01      	ldr	r3, [sp, #4]
 800293c:	6b1b      	ldr	r3, [r3, #48]	@ 0x30
 800293e:	4618      	mov	r0, r3
 8002940:	f7fe f842 	bl	80009c8 <vPortFree>
 8002944:	9801      	ldr	r0, [sp, #4]
 8002946:	f7fe f83f 	bl	80009c8 <vPortFree>
 800294a:	bf00      	nop
 800294c:	b003      	add	sp, #12
 800294e:	f85d fb04 	ldr.w	pc, [sp], #4

08002952 <prvCheckTasksWaitingTermination>:
 8002952:	b500      	push	{lr}
 8002954:	b083      	sub	sp, #12
 8002956:	e028      	b.n	80029aa <prvCheckTasksWaitingTermination+0x58>
 8002958:	f7ff fe94 	bl	8002684 <vTaskSuspendAll>
 800295c:	4b17      	ldr	r3, [pc, #92]	@ (80029bc <prvCheckTasksWaitingTermination+0x6a>)
 800295e:	681b      	ldr	r3, [r3, #0]
 8002960:	2b00      	cmp	r3, #0
 8002962:	bf0c      	ite	eq
 8002964:	2301      	moveq	r3, #1
 8002966:	2300      	movne	r3, #0
 8002968:	b2db      	uxtb	r3, r3
 800296a:	9301      	str	r3, [sp, #4]
 800296c:	f7ff ff56 	bl	800281c <xTaskResumeAll>
 8002970:	9b01      	ldr	r3, [sp, #4]
 8002972:	2b00      	cmp	r3, #0
 8002974:	d119      	bne.n	80029aa <prvCheckTasksWaitingTermination+0x58>
 8002976:	f7fe fcaf 	bl	80012d8 <vPortEnterCritical>
 800297a:	4b10      	ldr	r3, [pc, #64]	@ (80029bc <prvCheckTasksWaitingTermination+0x6a>)
 800297c:	68db      	ldr	r3, [r3, #12]
 800297e:	68db      	ldr	r3, [r3, #12]
 8002980:	9300      	str	r3, [sp, #0]
 8002982:	9b00      	ldr	r3, [sp, #0]
 8002984:	3304      	adds	r3, #4
 8002986:	4618      	mov	r0, r3
 8002988:	f7fe f856 	bl	8000a38 <uxListRemove>
 800298c:	4b0c      	ldr	r3, [pc, #48]	@ (80029c0 <prvCheckTasksWaitingTermination+0x6e>)
 800298e:	681b      	ldr	r3, [r3, #0]
 8002990:	3b01      	subs	r3, #1
 8002992:	4a0b      	ldr	r2, [pc, #44]	@ (80029c0 <prvCheckTasksWaitingTermination+0x6e>)
 8002994:	6013      	str	r3, [r2, #0]
 8002996:	4b0b      	ldr	r3, [pc, #44]	@ (80029c4 <prvCheckTasksWaitingTermination+0x72>)
 8002998:	681b      	ldr	r3, [r3, #0]
 800299a:	3b01      	subs	r3, #1
 800299c:	4a09      	ldr	r2, [pc, #36]	@ (80029c4 <prvCheckTasksWaitingTermination+0x72>)
 800299e:	6013      	str	r3, [r2, #0]
 80029a0:	f7fe fcb0 	bl	8001304 <vPortExitCritical>
 80029a4:	9800      	ldr	r0, [sp, #0]
 80029a6:	f7ff ffc5 	bl	8002934 <prvDeleteTCB>
 80029aa:	4b06      	ldr	r3, [pc, #24]	@ (80029c4 <prvCheckTasksWaitingTermination+0x72>)
 80029ac:	681b      	ldr	r3, [r3, #0]
 80029ae:	2b00      	cmp	r3, #0
 80029b0:	d1d2      	bne.n	8002958 <prvCheckTasksWaitingTermination+0x6>
 80029b2:	bf00      	nop
 80029b4:	bf00      	nop
 80029b6:	b003      	add	sp, #12
 80029b8:	f85d fb04 	ldr.w	pc, [sp], #4
 80029bc:	200028f8 	.word	0x200028f8
 80029c0:	200028d4 	.word	0x200028d4
 80029c4:	200028f4 	.word	0x200028f4

080029c8 <prvIdleTask>:
 80029c8:	b500      	push	{lr}
 80029ca:	b083      	sub	sp, #12
 80029cc:	9001      	str	r0, [sp, #4]
 80029ce:	f7ff ffc0 	bl	8002952 <prvCheckTasksWaitingTermination>
 80029d2:	e7fc      	b.n	80029ce <prvIdleTask+0x6>

080029d4 <vTaskStartScheduler>:
 80029d4:	b500      	push	{lr}
 80029d6:	b085      	sub	sp, #20
 80029d8:	4b13      	ldr	r3, [pc, #76]	@ (8002a28 <vTaskStartScheduler+0x54>)
 80029da:	9301      	str	r3, [sp, #4]
 80029dc:	2300      	movs	r3, #0
 80029de:	9300      	str	r3, [sp, #0]
 80029e0:	2300      	movs	r3, #0
 80029e2:	2280      	movs	r2, #128	@ 0x80
 80029e4:	4911      	ldr	r1, [pc, #68]	@ (8002a2c <vTaskStartScheduler+0x58>)
 80029e6:	4812      	ldr	r0, [pc, #72]	@ (8002a30 <vTaskStartScheduler+0x5c>)
 80029e8:	f7ff fe02 	bl	80025f0 <xTaskCreate>
 80029ec:	9003      	str	r0, [sp, #12]
 80029ee:	9b03      	ldr	r3, [sp, #12]
 80029f0:	2b01      	cmp	r3, #1
 80029f2:	d115      	bne.n	8002a20 <vTaskStartScheduler+0x4c>
 80029f4:	f04f 0310 	mov.w	r3, #16
 80029f8:	f383 8811 	msr	BASEPRI, r3
 80029fc:	f3bf 8f6f 	isb	sy
 8002a00:	f3bf 8f4f 	dsb	sy
 8002a04:	9302      	str	r3, [sp, #8]
 8002a06:	bf00      	nop
 8002a08:	4b0a      	ldr	r3, [pc, #40]	@ (8002a34 <vTaskStartScheduler+0x60>)
 8002a0a:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
 8002a0e:	601a      	str	r2, [r3, #0]
 8002a10:	4b09      	ldr	r3, [pc, #36]	@ (8002a38 <vTaskStartScheduler+0x64>)
 8002a12:	2201      	movs	r2, #1
 8002a14:	601a      	str	r2, [r3, #0]
 8002a16:	4b09      	ldr	r3, [pc, #36]	@ (8002a3c <vTaskStartScheduler+0x68>)
 8002a18:	2200      	movs	r2, #0
 8002a1a:	601a      	str	r2, [r3, #0]
 8002a1c:	f7fe fca5 	bl	800136a <xPortStartScheduler>
 8002a20:	bf00      	nop
 8002a22:	b005      	add	sp, #20
 8002a24:	f85d fb04 	ldr.w	pc, [sp], #4
 8002a28:	20002924 	.word	0x20002924
 8002a2c:	08000720 	.word	0x08000720
 8002a30:	080029c9 	.word	0x080029c9
 8002a34:	200028dc 	.word	0x200028dc
 8002a38:	200028e8 	.word	0x200028e8
 8002a3c:	200028e0 	.word	0x200028e0

08002a40 <vTaskSwitchContext>:
 8002a40:	b084      	sub	sp, #16
 8002a42:	4b1c      	ldr	r3, [pc, #112]	@ (8002ab4 <vTaskSwitchContext+0x74>)
 8002a44:	681b      	ldr	r3, [r3, #0]
 8002a46:	2b00      	cmp	r3, #0
 8002a48:	d003      	beq.n	8002a52 <vTaskSwitchContext+0x12>
 8002a4a:	4b1b      	ldr	r3, [pc, #108]	@ (8002ab8 <vTaskSwitchContext+0x78>)
 8002a4c:	2201      	movs	r2, #1
 8002a4e:	601a      	str	r2, [r3, #0]
 8002a50:	e02c      	b.n	8002aac <vTaskSwitchContext+0x6c>
 8002a52:	4b19      	ldr	r3, [pc, #100]	@ (8002ab8 <vTaskSwitchContext+0x78>)
 8002a54:	2200      	movs	r2, #0
 8002a56:	601a      	str	r2, [r3, #0]
 8002a58:	4b18      	ldr	r3, [pc, #96]	@ (8002abc <vTaskSwitchContext+0x7c>)
 8002a5a:	681b      	ldr	r3, [r3, #0]
 8002a5c:	9301      	str	r3, [sp, #4]
 8002a5e:	9b01      	ldr	r3, [sp, #4]
 8002a60:	fab3 f383 	clz	r3, r3
 8002a64:	f88d 3003 	strb.w	r3, [sp, #3]
 8002a68:	f89d 3003 	ldrb.w	r3, [sp, #3]
 8002a6c:	f1c3 031f 	rsb	r3, r3, #31
 8002a70:	9303      	str	r3, [sp, #12]
 8002a72:	9a03      	ldr	r2, [sp, #12]
 8002a74:	4613      	mov	r3, r2
 8002a76:	009b      	lsls	r3, r3, #2
 8002a78:	4413      	add	r3, r2
 8002a7a:	009b      	lsls	r3, r3, #2
 8002a7c:	4a10      	ldr	r2, [pc, #64]	@ (8002ac0 <vTaskSwitchContext+0x80>)
 8002a7e:	4413      	add	r3, r2
 8002a80:	9302      	str	r3, [sp, #8]
 8002a82:	9b02      	ldr	r3, [sp, #8]
 8002a84:	685b      	ldr	r3, [r3, #4]
 8002a86:	685a      	ldr	r2, [r3, #4]
 8002a88:	9b02      	ldr	r3, [sp, #8]
 8002a8a:	605a      	str	r2, [r3, #4]
 8002a8c:	9b02      	ldr	r3, [sp, #8]
 8002a8e:	685a      	ldr	r2, [r3, #4]
 8002a90:	9b02      	ldr	r3, [sp, #8]
 8002a92:	3308      	adds	r3, #8
 8002a94:	429a      	cmp	r2, r3
 8002a96:	d104      	bne.n	8002aa2 <vTaskSwitchContext+0x62>
 8002a98:	9b02      	ldr	r3, [sp, #8]
 8002a9a:	685b      	ldr	r3, [r3, #4]
 8002a9c:	685a      	ldr	r2, [r3, #4]
 8002a9e:	9b02      	ldr	r3, [sp, #8]
 8002aa0:	605a      	str	r2, [r3, #4]
 8002aa2:	9b02      	ldr	r3, [sp, #8]
 8002aa4:	685b      	ldr	r3, [r3, #4]
 8002aa6:	68db      	ldr	r3, [r3, #12]
 8002aa8:	4a06      	ldr	r2, [pc, #24]	@ (8002ac4 <vTaskSwitchContext+0x84>)
 8002aaa:	6013      	str	r3, [r2, #0]
 8002aac:	bf00      	nop
 8002aae:	b004      	add	sp, #16
 8002ab0:	4770      	bx	lr
 8002ab2:	bf00      	nop
 8002ab4:	200028d0 	.word	0x200028d0
 8002ab8:	200028ec 	.word	0x200028ec
 8002abc:	200028cc 	.word	0x200028cc
 8002ac0:	20002868 	.word	0x20002868
 8002ac4:	20002920 	.word	0x20002920

08002ac8 <vTaskSuspend>:
 8002ac8:	b500      	push	{lr}
 8002aca:	b085      	sub	sp, #20
 8002acc:	9001      	str	r0, [sp, #4]
 8002ace:	f7fe fc03 	bl	80012d8 <vPortEnterCritical>
 8002ad2:	9b01      	ldr	r3, [sp, #4]
 8002ad4:	2b00      	cmp	r3, #0
 8002ad6:	d102      	bne.n	8002ade <vTaskSuspend+0x16>
 8002ad8:	4b2f      	ldr	r3, [pc, #188]	@ (8002b98 <vTaskSuspend+0xd0>)
 8002ada:	681b      	ldr	r3, [r3, #0]
 8002adc:	e000      	b.n	8002ae0 <vTaskSuspend+0x18>
 8002ade:	9b01      	ldr	r3, [sp, #4]
 8002ae0:	9303      	str	r3, [sp, #12]
 8002ae2:	9b03      	ldr	r3, [sp, #12]
 8002ae4:	3304      	adds	r3, #4
 8002ae6:	4618      	mov	r0, r3
 8002ae8:	f7fd ffa6 	bl	8000a38 <uxListRemove>
 8002aec:	4603      	mov	r3, r0
 8002aee:	2b00      	cmp	r3, #0
 8002af0:	d115      	bne.n	8002b1e <vTaskSuspend+0x56>
 8002af2:	9b03      	ldr	r3, [sp, #12]
 8002af4:	6ada      	ldr	r2, [r3, #44]	@ 0x2c
 8002af6:	4929      	ldr	r1, [pc, #164]	@ (8002b9c <vTaskSuspend+0xd4>)
 8002af8:	4613      	mov	r3, r2
 8002afa:	009b      	lsls	r3, r3, #2
 8002afc:	4413      	add	r3, r2
 8002afe:	009b      	lsls	r3, r3, #2
 8002b00:	440b      	add	r3, r1
 8002b02:	681b      	ldr	r3, [r3, #0]
 8002b04:	2b00      	cmp	r3, #0
 8002b06:	d10a      	bne.n	8002b1e <vTaskSuspend+0x56>
 8002b08:	9b03      	ldr	r3, [sp, #12]
 8002b0a:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
 8002b0c:	2201      	movs	r2, #1
 8002b0e:	fa02 f303 	lsl.w	r3, r2, r3
 8002b12:	43da      	mvns	r2, r3
 8002b14:	4b22      	ldr	r3, [pc, #136]	@ (8002ba0 <vTaskSuspend+0xd8>)
 8002b16:	681b      	ldr	r3, [r3, #0]
 8002b18:	4013      	ands	r3, r2
 8002b1a:	4a21      	ldr	r2, [pc, #132]	@ (8002ba0 <vTaskSuspend+0xd8>)
 8002b1c:	6013      	str	r3, [r2, #0]
 8002b1e:	9b03      	ldr	r3, [sp, #12]
 8002b20:	6a9b      	ldr	r3, [r3, #40]	@ 0x28
 8002b22:	2b00      	cmp	r3, #0
 8002b24:	d004      	beq.n	8002b30 <vTaskSuspend+0x68>
 8002b26:	9b03      	ldr	r3, [sp, #12]
 8002b28:	3318      	adds	r3, #24
 8002b2a:	4618      	mov	r0, r3
 8002b2c:	f7fd ff84 	bl	8000a38 <uxListRemove>
 8002b30:	9b03      	ldr	r3, [sp, #12]
 8002b32:	3304      	adds	r3, #4
 8002b34:	4619      	mov	r1, r3
 8002b36:	481b      	ldr	r0, [pc, #108]	@ (8002ba4 <vTaskSuspend+0xdc>)
 8002b38:	f7fd ffa3 	bl	8000a82 <vListInsertEnd>
 8002b3c:	f7fe fbe2 	bl	8001304 <vPortExitCritical>
 8002b40:	4b19      	ldr	r3, [pc, #100]	@ (8002ba8 <vTaskSuspend+0xe0>)
 8002b42:	681b      	ldr	r3, [r3, #0]
 8002b44:	2b00      	cmp	r3, #0
 8002b46:	d005      	beq.n	8002b54 <vTaskSuspend+0x8c>
 8002b48:	f7fe fbc6 	bl	80012d8 <vPortEnterCritical>
 8002b4c:	f7ff fda4 	bl	8002698 <prvResetNextTaskUnblockTime>
 8002b50:	f7fe fbd8 	bl	8001304 <vPortExitCritical>
 8002b54:	4b10      	ldr	r3, [pc, #64]	@ (8002b98 <vTaskSuspend+0xd0>)
 8002b56:	681b      	ldr	r3, [r3, #0]
 8002b58:	9a03      	ldr	r2, [sp, #12]
 8002b5a:	429a      	cmp	r2, r3
 8002b5c:	d118      	bne.n	8002b90 <vTaskSuspend+0xc8>
 8002b5e:	4b12      	ldr	r3, [pc, #72]	@ (8002ba8 <vTaskSuspend+0xe0>)
 8002b60:	681b      	ldr	r3, [r3, #0]
 8002b62:	2b00      	cmp	r3, #0
 8002b64:	d008      	beq.n	8002b78 <vTaskSuspend+0xb0>
 8002b66:	4b11      	ldr	r3, [pc, #68]	@ (8002bac <vTaskSuspend+0xe4>)
 8002b68:	f04f 5280 	mov.w	r2, #268435456	@ 0x10000000
 8002b6c:	601a      	str	r2, [r3, #0]
 8002b6e:	f3bf 8f4f 	dsb	sy
 8002b72:	f3bf 8f6f 	isb	sy
 8002b76:	e00b      	b.n	8002b90 <vTaskSuspend+0xc8>
 8002b78:	4b0a      	ldr	r3, [pc, #40]	@ (8002ba4 <vTaskSuspend+0xdc>)
 8002b7a:	681a      	ldr	r2, [r3, #0]
 8002b7c:	4b0c      	ldr	r3, [pc, #48]	@ (8002bb0 <vTaskSuspend+0xe8>)
 8002b7e:	681b      	ldr	r3, [r3, #0]
 8002b80:	429a      	cmp	r2, r3
 8002b82:	d103      	bne.n	8002b8c <vTaskSuspend+0xc4>
 8002b84:	4b04      	ldr	r3, [pc, #16]	@ (8002b98 <vTaskSuspend+0xd0>)
 8002b86:	2200      	movs	r2, #0
 8002b88:	601a      	str	r2, [r3, #0]
 8002b8a:	e001      	b.n	8002b90 <vTaskSuspend+0xc8>
 8002b8c:	f7ff ff58 	bl	8002a40 <vTaskSwitchContext>
 8002b90:	bf00      	nop
 8002b92:	b005      	add	sp, #20
 8002b94:	f85d fb04 	ldr.w	pc, [sp], #4
 8002b98:	20002920 	.word	0x20002920
 8002b9c:	20002868 	.word	0x20002868
 8002ba0:	200028cc 	.word	0x200028cc
 8002ba4:	2000290c 	.word	0x2000290c
 8002ba8:	200028e8 	.word	0x200028e8
 8002bac:	e000ed04 	.word	0xe000ed04
 8002bb0:	200028d4 	.word	0x200028d4

08002bb4 <vTaskDelete>:
 8002bb4:	b500      	push	{lr}
 8002bb6:	b085      	sub	sp, #20
 8002bb8:	9001      	str	r0, [sp, #4]
 8002bba:	f7fe fb8d 	bl	80012d8 <vPortEnterCritical>
 8002bbe:	9b01      	ldr	r3, [sp, #4]
 8002bc0:	2b00      	cmp	r3, #0
 8002bc2:	d102      	bne.n	8002bca <vTaskDelete+0x16>
 8002bc4:	4b31      	ldr	r3, [pc, #196]	@ (8002c8c <vTaskDelete+0xd8>)
 8002bc6:	681b      	ldr	r3, [r3, #0]
 8002bc8:	e000      	b.n	8002bcc <vTaskDelete+0x18>
 8002bca:	9b01      	ldr	r3, [sp, #4]
 8002bcc:	9303      	str	r3, [sp, #12]
 8002bce:	9b03      	ldr	r3, [sp, #12]
 8002bd0:	3304      	adds	r3, #4
 8002bd2:	4618      	mov	r0, r3
 8002bd4:	f7fd ff30 	bl	8000a38 <uxListRemove>
 8002bd8:	4603      	mov	r3, r0
 8002bda:	2b00      	cmp	r3, #0
 8002bdc:	d115      	bne.n	8002c0a <vTaskDelete+0x56>
 8002bde:	9b03      	ldr	r3, [sp, #12]
 8002be0:	6ada      	ldr	r2, [r3, #44]	@ 0x2c
 8002be2:	492b      	ldr	r1, [pc, #172]	@ (8002c90 <vTaskDelete+0xdc>)
 8002be4:	4613      	mov	r3, r2
 8002be6:	009b      	lsls	r3, r3, #2
 8002be8:	4413      	add	r3, r2
 8002bea:	009b      	lsls	r3, r3, #2
 8002bec:	440b      	add	r3, r1
 8002bee:	681b      	ldr	r3, [r3, #0]
 8002bf0:	2b00      	cmp	r3, #0
 8002bf2:	d10a      	bne.n	8002c0a <vTaskDelete+0x56>
 8002bf4:	9b03      	ldr	r3, [sp, #12]
 8002bf6:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
 8002bf8:	2201      	movs	r2, #1
 8002bfa:	fa02 f303 	lsl.w	r3, r2, r3
 8002bfe:	43da      	mvns	r2, r3
 8002c00:	4b24      	ldr	r3, [pc, #144]	@ (8002c94 <vTaskDelete+0xe0>)
 8002c02:	681b      	ldr	r3, [r3, #0]
 8002c04:	4013      	ands	r3, r2
 8002c06:	4a23      	ldr	r2, [pc, #140]	@ (8002c94 <vTaskDelete+0xe0>)
 8002c08:	6013      	str	r3, [r2, #0]
 8002c0a:	9b03      	ldr	r3, [sp, #12]
 8002c0c:	6a9b      	ldr	r3, [r3, #40]	@ 0x28
 8002c0e:	2b00      	cmp	r3, #0
 8002c10:	d004      	beq.n	8002c1c <vTaskDelete+0x68>
 8002c12:	9b03      	ldr	r3, [sp, #12]
 8002c14:	3318      	adds	r3, #24
 8002c16:	4618      	mov	r0, r3
 8002c18:	f7fd ff0e 	bl	8000a38 <uxListRemove>
 8002c1c:	4b1e      	ldr	r3, [pc, #120]	@ (8002c98 <vTaskDelete+0xe4>)
 8002c1e:	681b      	ldr	r3, [r3, #0]
 8002c20:	3301      	adds	r3, #1
 8002c22:	4a1d      	ldr	r2, [pc, #116]	@ (8002c98 <vTaskDelete+0xe4>)
 8002c24:	6013      	str	r3, [r2, #0]
 8002c26:	4b19      	ldr	r3, [pc, #100]	@ (8002c8c <vTaskDelete+0xd8>)
 8002c28:	681b      	ldr	r3, [r3, #0]
 8002c2a:	9a03      	ldr	r2, [sp, #12]
 8002c2c:	429a      	cmp	r2, r3
 8002c2e:	d10b      	bne.n	8002c48 <vTaskDelete+0x94>
 8002c30:	9b03      	ldr	r3, [sp, #12]
 8002c32:	3304      	adds	r3, #4
 8002c34:	4619      	mov	r1, r3
 8002c36:	4819      	ldr	r0, [pc, #100]	@ (8002c9c <vTaskDelete+0xe8>)
 8002c38:	f7fd ff23 	bl	8000a82 <vListInsertEnd>
 8002c3c:	4b18      	ldr	r3, [pc, #96]	@ (8002ca0 <vTaskDelete+0xec>)
 8002c3e:	681b      	ldr	r3, [r3, #0]
 8002c40:	3301      	adds	r3, #1
 8002c42:	4a17      	ldr	r2, [pc, #92]	@ (8002ca0 <vTaskDelete+0xec>)
 8002c44:	6013      	str	r3, [r2, #0]
 8002c46:	e009      	b.n	8002c5c <vTaskDelete+0xa8>
 8002c48:	4b16      	ldr	r3, [pc, #88]	@ (8002ca4 <vTaskDelete+0xf0>)
 8002c4a:	681b      	ldr	r3, [r3, #0]
 8002c4c:	3b01      	subs	r3, #1
 8002c4e:	4a15      	ldr	r2, [pc, #84]	@ (8002ca4 <vTaskDelete+0xf0>)
 8002c50:	6013      	str	r3, [r2, #0]
 8002c52:	9803      	ldr	r0, [sp, #12]
 8002c54:	f7ff fe6e 	bl	8002934 <prvDeleteTCB>
 8002c58:	f7ff fd1e 	bl	8002698 <prvResetNextTaskUnblockTime>
 8002c5c:	f7fe fb52 	bl	8001304 <vPortExitCritical>
 8002c60:	4b11      	ldr	r3, [pc, #68]	@ (8002ca8 <vTaskDelete+0xf4>)
 8002c62:	681b      	ldr	r3, [r3, #0]
 8002c64:	2b00      	cmp	r3, #0
 8002c66:	d00c      	beq.n	8002c82 <vTaskDelete+0xce>
 8002c68:	4b08      	ldr	r3, [pc, #32]	@ (8002c8c <vTaskDelete+0xd8>)
 8002c6a:	681b      	ldr	r3, [r3, #0]
 8002c6c:	9a03      	ldr	r2, [sp, #12]
 8002c6e:	429a      	cmp	r2, r3
 8002c70:	d107      	bne.n	8002c82 <vTaskDelete+0xce>
 8002c72:	4b0e      	ldr	r3, [pc, #56]	@ (8002cac <vTaskDelete+0xf8>)
 8002c74:	f04f 5280 	mov.w	r2, #268435456	@ 0x10000000
 8002c78:	601a      	str	r2, [r3, #0]
 8002c7a:	f3bf 8f4f 	dsb	sy
 8002c7e:	f3bf 8f6f 	isb	sy
 8002c82:	bf00      	nop
 8002c84:	b005      	add	sp, #20
 8002c86:	f85d fb04 	ldr.w	pc, [sp], #4
 8002c8a:	bf00      	nop
 8002c8c:	20002920 	.word	0x20002920
 8002c90:	20002868 	.word	0x20002868
 8002c94:	200028cc 	.word	0x200028cc
 8002c98:	200028f0 	.word	0x200028f0
 8002c9c:	200028f8 	.word	0x200028f8
 8002ca0:	200028f4 	.word	0x200028f4
 8002ca4:	200028d4 	.word	0x200028d4
 8002ca8:	200028e8 	.word	0x200028e8
 8002cac:	e000ed04 	.word	0xe000ed04

08002cb0 <prvAddCurrentTaskToDelayedList>:
 8002cb0:	b500      	push	{lr}
 8002cb2:	b085      	sub	sp, #20
 8002cb4:	9001      	str	r0, [sp, #4]
 8002cb6:	9100      	str	r1, [sp, #0]
 8002cb8:	4b28      	ldr	r3, [pc, #160]	@ (8002d5c <prvAddCurrentTaskToDelayedList+0xac>)
 8002cba:	681b      	ldr	r3, [r3, #0]
 8002cbc:	9303      	str	r3, [sp, #12]
 8002cbe:	4b28      	ldr	r3, [pc, #160]	@ (8002d60 <prvAddCurrentTaskToDelayedList+0xb0>)
 8002cc0:	681b      	ldr	r3, [r3, #0]
 8002cc2:	3304      	adds	r3, #4
 8002cc4:	4618      	mov	r0, r3
 8002cc6:	f7fd feb7 	bl	8000a38 <uxListRemove>
 8002cca:	4603      	mov	r3, r0
 8002ccc:	2b00      	cmp	r3, #0
 8002cce:	d10b      	bne.n	8002ce8 <prvAddCurrentTaskToDelayedList+0x38>
 8002cd0:	4b23      	ldr	r3, [pc, #140]	@ (8002d60 <prvAddCurrentTaskToDelayedList+0xb0>)
 8002cd2:	681b      	ldr	r3, [r3, #0]
 8002cd4:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
 8002cd6:	2201      	movs	r2, #1
 8002cd8:	fa02 f303 	lsl.w	r3, r2, r3
 8002cdc:	43da      	mvns	r2, r3
 8002cde:	4b21      	ldr	r3, [pc, #132]	@ (8002d64 <prvAddCurrentTaskToDelayedList+0xb4>)
 8002ce0:	681b      	ldr	r3, [r3, #0]
 8002ce2:	4013      	ands	r3, r2
 8002ce4:	4a1f      	ldr	r2, [pc, #124]	@ (8002d64 <prvAddCurrentTaskToDelayedList+0xb4>)
 8002ce6:	6013      	str	r3, [r2, #0]
 8002ce8:	9b01      	ldr	r3, [sp, #4]
 8002cea:	f1b3 3fff 	cmp.w	r3, #4294967295	@ 0xffffffff
 8002cee:	d10a      	bne.n	8002d06 <prvAddCurrentTaskToDelayedList+0x56>
 8002cf0:	9b00      	ldr	r3, [sp, #0]
 8002cf2:	2b00      	cmp	r3, #0
 8002cf4:	d007      	beq.n	8002d06 <prvAddCurrentTaskToDelayedList+0x56>
 8002cf6:	4b1a      	ldr	r3, [pc, #104]	@ (8002d60 <prvAddCurrentTaskToDelayedList+0xb0>)
 8002cf8:	681b      	ldr	r3, [r3, #0]
 8002cfa:	3304      	adds	r3, #4
 8002cfc:	4619      	mov	r1, r3
 8002cfe:	481a      	ldr	r0, [pc, #104]	@ (8002d68 <prvAddCurrentTaskToDelayedList+0xb8>)
 8002d00:	f7fd febf 	bl	8000a82 <vListInsertEnd>
 8002d04:	e026      	b.n	8002d54 <prvAddCurrentTaskToDelayedList+0xa4>
 8002d06:	9a03      	ldr	r2, [sp, #12]
 8002d08:	9b01      	ldr	r3, [sp, #4]
 8002d0a:	4413      	add	r3, r2
 8002d0c:	9302      	str	r3, [sp, #8]
 8002d0e:	4b14      	ldr	r3, [pc, #80]	@ (8002d60 <prvAddCurrentTaskToDelayedList+0xb0>)
 8002d10:	681b      	ldr	r3, [r3, #0]
 8002d12:	9a02      	ldr	r2, [sp, #8]
 8002d14:	605a      	str	r2, [r3, #4]
 8002d16:	9a02      	ldr	r2, [sp, #8]
 8002d18:	9b03      	ldr	r3, [sp, #12]
 8002d1a:	429a      	cmp	r2, r3
 8002d1c:	d209      	bcs.n	8002d32 <prvAddCurrentTaskToDelayedList+0x82>
 8002d1e:	4b13      	ldr	r3, [pc, #76]	@ (8002d6c <prvAddCurrentTaskToDelayedList+0xbc>)
 8002d20:	681a      	ldr	r2, [r3, #0]
 8002d22:	4b0f      	ldr	r3, [pc, #60]	@ (8002d60 <prvAddCurrentTaskToDelayedList+0xb0>)
 8002d24:	681b      	ldr	r3, [r3, #0]
 8002d26:	3304      	adds	r3, #4
 8002d28:	4619      	mov	r1, r3
 8002d2a:	4610      	mov	r0, r2
 8002d2c:	f7fd fec8 	bl	8000ac0 <vListInsert>
 8002d30:	e010      	b.n	8002d54 <prvAddCurrentTaskToDelayedList+0xa4>
 8002d32:	4b0f      	ldr	r3, [pc, #60]	@ (8002d70 <prvAddCurrentTaskToDelayedList+0xc0>)
 8002d34:	681a      	ldr	r2, [r3, #0]
 8002d36:	4b0a      	ldr	r3, [pc, #40]	@ (8002d60 <prvAddCurrentTaskToDelayedList+0xb0>)
 8002d38:	681b      	ldr	r3, [r3, #0]
 8002d3a:	3304      	adds	r3, #4
 8002d3c:	4619      	mov	r1, r3
 8002d3e:	4610      	mov	r0, r2
 8002d40:	f7fd febe 	bl	8000ac0 <vListInsert>
 8002d44:	4b0b      	ldr	r3, [pc, #44]	@ (8002d74 <prvAddCurrentTaskToDelayedList+0xc4>)
 8002d46:	681b      	ldr	r3, [r3, #0]
 8002d48:	9a02      	ldr	r2, [sp, #8]
 8002d4a:	429a      	cmp	r2, r3
 8002d4c:	d202      	bcs.n	8002d54 <prvAddCurrentTaskToDelayedList+0xa4>
 8002d4e:	4a09      	ldr	r2, [pc, #36]	@ (8002d74 <prvAddCurrentTaskToDelayedList+0xc4>)
 8002d50:	9b02      	ldr	r3, [sp, #8]
 8002d52:	6013      	str	r3, [r2, #0]
 8002d54:	bf00      	nop
 8002d56:	b005      	add	sp, #20
 8002d58:	f85d fb04 	ldr.w	pc, [sp], #4
 8002d5c:	200028e0 	.word	0x200028e0
 8002d60:	20002920 	.word	0x20002920
 8002d64:	200028cc 	.word	0x200028cc
 8002d68:	2000290c 	.word	0x2000290c
 8002d6c:	20002828 	.word	0x20002828
 8002d70:	20002824 	.word	0x20002824
 8002d74:	200028dc 	.word	0x200028dc

08002d78 <vTaskDelay>:
 8002d78:	b500      	push	{lr}
 8002d7a:	b085      	sub	sp, #20
 8002d7c:	9001      	str	r0, [sp, #4]
 8002d7e:	2300      	movs	r3, #0
 8002d80:	9303      	str	r3, [sp, #12]
 8002d82:	9b01      	ldr	r3, [sp, #4]
 8002d84:	2b00      	cmp	r3, #0
 8002d86:	d008      	beq.n	8002d9a <vTaskDelay+0x22>
 8002d88:	f7ff fc7c 	bl	8002684 <vTaskSuspendAll>
 8002d8c:	2100      	movs	r1, #0
 8002d8e:	9801      	ldr	r0, [sp, #4]
 8002d90:	f7ff ff8e 	bl	8002cb0 <prvAddCurrentTaskToDelayedList>
 8002d94:	f7ff fd42 	bl	800281c <xTaskResumeAll>
 8002d98:	9003      	str	r0, [sp, #12]
 8002d9a:	9b03      	ldr	r3, [sp, #12]
 8002d9c:	2b00      	cmp	r3, #0
 8002d9e:	d107      	bne.n	8002db0 <vTaskDelay+0x38>
 8002da0:	4b05      	ldr	r3, [pc, #20]	@ (8002db8 <vTaskDelay+0x40>)
 8002da2:	f04f 5280 	mov.w	r2, #268435456	@ 0x10000000
 8002da6:	601a      	str	r2, [r3, #0]
 8002da8:	f3bf 8f4f 	dsb	sy
 8002dac:	f3bf 8f6f 	isb	sy
 8002db0:	bf00      	nop
 8002db2:	b005      	add	sp, #20
 8002db4:	f85d fb04 	ldr.w	pc, [sp], #4
 8002db8:	e000ed04 	.word	0xe000ed04

08002dbc <xTaskGetTickCount>:
 8002dbc:	b082      	sub	sp, #8
 8002dbe:	4b03      	ldr	r3, [pc, #12]	@ (8002dcc <xTaskGetTickCount+0x10>)
 8002dc0:	681b      	ldr	r3, [r3, #0]
 8002dc2:	9301      	str	r3, [sp, #4]
 8002dc4:	9b01      	ldr	r3, [sp, #4]
 8002dc6:	4618      	mov	r0, r3
 8002dc8:	b002      	add	sp, #8
 8002dca:	4770      	bx	lr
 8002dcc:	200028e0 	.word	0x200028e0

08002dd0 <Test>:
 8002dd0:	bf00      	nop
 8002dd2:	4770      	bx	lr

08002dd4 <TestFunc1>:
 8002dd4:	b500      	push	{lr}
 8002dd6:	b085      	sub	sp, #20
 8002dd8:	9001      	str	r0, [sp, #4]
 8002dda:	2300      	movs	r3, #0
 8002ddc:	9303      	str	r3, [sp, #12]
 8002dde:	9b03      	ldr	r3, [sp, #12]
 8002de0:	3301      	adds	r3, #1
 8002de2:	9303      	str	r3, [sp, #12]
 8002de4:	2308      	movs	r3, #8
 8002de6:	9a03      	ldr	r2, [sp, #12]
 8002de8:	2101      	movs	r1, #1
 8002dea:	2001      	movs	r0, #1
 8002dec:	f7fe f896 	bl	8000f1c <OLED_ShowNum>
 8002df0:	203c      	movs	r0, #60	@ 0x3c
 8002df2:	f7ff ffc1 	bl	8002d78 <vTaskDelay>
 8002df6:	e7f2      	b.n	8002dde <TestFunc1+0xa>

08002df8 <TestFunc2>:
 8002df8:	b500      	push	{lr}
 8002dfa:	b085      	sub	sp, #20
 8002dfc:	9001      	str	r0, [sp, #4]
 8002dfe:	2300      	movs	r3, #0
 8002e00:	9303      	str	r3, [sp, #12]
 8002e02:	9b03      	ldr	r3, [sp, #12]
 8002e04:	3301      	adds	r3, #1
 8002e06:	9303      	str	r3, [sp, #12]
 8002e08:	2308      	movs	r3, #8
 8002e0a:	9a03      	ldr	r2, [sp, #12]
 8002e0c:	2101      	movs	r1, #1
 8002e0e:	2004      	movs	r0, #4
 8002e10:	f7fe f930 	bl	8001074 <OLED_ShowHexNum>
 8002e14:	20c8      	movs	r0, #200	@ 0xc8
 8002e16:	f7ff ffaf 	bl	8002d78 <vTaskDelay>
 8002e1a:	e7f2      	b.n	8002e02 <TestFunc2+0xa>

08002e1c <HardFault_Handler>:
 8002e1c:	b508      	push	{r3, lr}
 8002e1e:	4a03      	ldr	r2, [pc, #12]	@ (8002e2c <HardFault_Handler+0x10>)
 8002e20:	2101      	movs	r1, #1
 8002e22:	2003      	movs	r0, #3
 8002e24:	f7fe f838 	bl	8000e98 <OLED_ShowString>
 8002e28:	bf00      	nop
 8002e2a:	bd08      	pop	{r3, pc}
 8002e2c:	08000728 	.word	0x08000728

08002e30 <main>:
 8002e30:	b500      	push	{lr}
 8002e32:	b083      	sub	sp, #12
 8002e34:	f7fe f9b5 	bl	80011a2 <OLED_Init>
 8002e38:	4b0b      	ldr	r3, [pc, #44]	@ (8002e68 <main+0x38>)
 8002e3a:	9301      	str	r3, [sp, #4]
 8002e3c:	2301      	movs	r3, #1
 8002e3e:	9300      	str	r3, [sp, #0]
 8002e40:	2300      	movs	r3, #0
 8002e42:	2280      	movs	r2, #128	@ 0x80
 8002e44:	4909      	ldr	r1, [pc, #36]	@ (8002e6c <main+0x3c>)
 8002e46:	480a      	ldr	r0, [pc, #40]	@ (8002e70 <main+0x40>)
 8002e48:	f7ff fbd2 	bl	80025f0 <xTaskCreate>
 8002e4c:	4b09      	ldr	r3, [pc, #36]	@ (8002e74 <main+0x44>)
 8002e4e:	9301      	str	r3, [sp, #4]
 8002e50:	2302      	movs	r3, #2
 8002e52:	9300      	str	r3, [sp, #0]
 8002e54:	2300      	movs	r3, #0
 8002e56:	2280      	movs	r2, #128	@ 0x80
 8002e58:	4907      	ldr	r1, [pc, #28]	@ (8002e78 <main+0x48>)
 8002e5a:	4808      	ldr	r0, [pc, #32]	@ (8002e7c <main+0x4c>)
 8002e5c:	f7ff fbc8 	bl	80025f0 <xTaskCreate>
 8002e60:	f7ff fdb8 	bl	80029d4 <vTaskStartScheduler>
 8002e64:	e7fe      	b.n	8002e64 <main+0x34>
 8002e66:	bf00      	nop
 8002e68:	20002928 	.word	0x20002928
 8002e6c:	08000730 	.word	0x08000730
 8002e70:	08002dd5 	.word	0x08002dd5
 8002e74:	2000292c 	.word	0x2000292c
 8002e78:	08000738 	.word	0x08000738
 8002e7c:	08002df9 	.word	0x08002df9

Disassembly of section .text.Reset_Handler:

08002e80 <Reset_Handler>:
 8002e80:	2100      	movs	r1, #0
 8002e82:	e003      	b.n	8002e8c <LoopCopyDataInit>

08002e84 <CopyDataInit>:
 8002e84:	4b0a      	ldr	r3, [pc, #40]	@ (8002eb0 <LoopFillZerobss+0x10>)
 8002e86:	585b      	ldr	r3, [r3, r1]
 8002e88:	5043      	str	r3, [r0, r1]
 8002e8a:	3104      	adds	r1, #4

08002e8c <LoopCopyDataInit>:
 8002e8c:	4809      	ldr	r0, [pc, #36]	@ (8002eb4 <LoopFillZerobss+0x14>)
 8002e8e:	4b0a      	ldr	r3, [pc, #40]	@ (8002eb8 <LoopFillZerobss+0x18>)
 8002e90:	1842      	adds	r2, r0, r1
 8002e92:	429a      	cmp	r2, r3
 8002e94:	d3f6      	bcc.n	8002e84 <CopyDataInit>
 8002e96:	4a09      	ldr	r2, [pc, #36]	@ (8002ebc <LoopFillZerobss+0x1c>)
 8002e98:	e002      	b.n	8002ea0 <LoopFillZerobss>

08002e9a <FillZerobss>:
 8002e9a:	2300      	movs	r3, #0
 8002e9c:	f842 3b04 	str.w	r3, [r2], #4

08002ea0 <LoopFillZerobss>:
 8002ea0:	4b07      	ldr	r3, [pc, #28]	@ (8002ec0 <LoopFillZerobss+0x20>)
 8002ea2:	429a      	cmp	r2, r3
 8002ea4:	d3f9      	bcc.n	8002e9a <FillZerobss>
 8002ea6:	f7ff f95f 	bl	8002168 <SystemInit>
 8002eaa:	f7ff ffc1 	bl	8002e30 <main>
 8002eae:	4770      	bx	lr
 8002eb0:	08002ec6 	.word	0x08002ec6
 8002eb4:	20000000 	.word	0x20000000
 8002eb8:	2000000c 	.word	0x2000000c
 8002ebc:	2000000c 	.word	0x2000000c
 8002ec0:	20002934 	.word	0x20002934

Disassembly of section .text.Default_Handler:

08002ec4 <ADC1_2_IRQHandler>:
 8002ec4:	e7fe      	b.n	8002ec4 <ADC1_2_IRQHandler>
