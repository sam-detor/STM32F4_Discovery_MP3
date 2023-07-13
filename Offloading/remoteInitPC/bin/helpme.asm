
InitCode.elf:	file format elf32-littlearm

Disassembly of section .text:

20000910 <offloadedCode>:
20000910: 30 b5        	push	{r4, r5, lr}
20000912: 83 b0        	sub	sp, #12
20000914: 08 20        	movs	r0, #8
20000916: 01 21        	movs	r1, #1
20000918: 00 f0 d4 fa  	bl	0x20000ec4 <RCC_AHB1PeriphClockCmd> @ imm = #1448
2000091c: 4f f4 70 43  	mov.w	r3, #61440
20000920: 00 93        	str	r3, [sp]
20000922: 01 23        	movs	r3, #1
20000924: 8d f8 04 30  	strb.w	r3, [sp, #4]
20000928: 00 24        	movs	r4, #0
2000092a: 8d f8 06 40  	strb.w	r4, [sp, #6]
2000092e: 03 23        	movs	r3, #3
20000930: 8d f8 05 30  	strb.w	r3, [sp, #5]
20000934: 8d f8 07 40  	strb.w	r4, [sp, #7]
20000938: 0b 4d        	ldr	r5, [pc, #44]           @ 0x20000968 <$d>
2000093a: 28 46        	mov	r0, r5
2000093c: 69 46        	mov	r1, sp
2000093e: 00 f0 6f fc  	bl	0x20001220 <GPIO_Init>  @ imm = #2270
20000942: 40 f2 0f 10  	movw	r0, #271
20000946: 02 21        	movs	r1, #2
20000948: 06 22        	movs	r2, #6
2000094a: 23 46        	mov	r3, r4
2000094c: 00 f0 54 f8  	bl	0x200009f8 <InitializeAudio> @ imm = #168
20000950: cf 20        	movs	r0, #207
20000952: 00 f0 45 f8  	bl	0x200009e0 <SetAudioVolume> @ imm = #138
20000956: 28 46        	mov	r0, r5
20000958: 4f f4 00 41  	mov.w	r1, #32768
2000095c: 00 f0 d6 fc  	bl	0x2000130c <GPIO_SetBits> @ imm = #2476
20000960: 20 46        	mov	r0, r4
20000962: 03 b0        	add	sp, #12
20000964: 30 bd        	pop	{r4, r5, pc}
20000966: 00 bf        	nop

20000968 <$d>:
20000968: 00 0c        	lsrs	r0, r0, #16
2000096a: 02 40        	ands	r2, r0

2000096c <WriteRegister>:
2000096c: 1b 4b        	ldr	r3, [pc, #108]          @ 0x200009dc <$d>
2000096e: 1b 8b        	ldrh	r3, [r3, #24]
20000970: 03 f0 02 03  	and	r3, r3, #2
20000974: 9b b2        	uxth	r3, r3
20000976: 00 2b        	cmp	r3, #0
20000978: f8 d1        	bne	0x2000096c <WriteRegister> @ imm = #-16
2000097a: 18 4a        	ldr	r2, [pc, #96]           @ 0x200009dc <$d>
2000097c: 13 88        	ldrh	r3, [r2]
2000097e: 9b b2        	uxth	r3, r3
20000980: 43 f4 80 73  	orr	r3, r3, #256
20000984: 13 80        	strh	r3, [r2]
20000986: 15 4b        	ldr	r3, [pc, #84]           @ 0x200009dc <$d>
20000988: 9b 8a        	ldrh	r3, [r3, #20]
2000098a: 13 f0 01 0f  	tst.w	r3, #1
2000098e: fa d0        	beq	0x20000986 <WriteRegister+0x1a> @ imm = #-12
20000990: 94 22        	movs	r2, #148
20000992: 12 4b        	ldr	r3, [pc, #72]           @ 0x200009dc <$d>
20000994: 1a 82        	strh	r2, [r3, #16]
20000996: 11 4b        	ldr	r3, [pc, #68]           @ 0x200009dc <$d>
20000998: 9b 8a        	ldrh	r3, [r3, #20]
2000099a: 03 f0 02 03  	and	r3, r3, #2
2000099e: 9b b2        	uxth	r3, r3
200009a0: 00 2b        	cmp	r3, #0
200009a2: f8 d0        	beq	0x20000996 <WriteRegister+0x2a> @ imm = #-16
200009a4: 0d 4b        	ldr	r3, [pc, #52]           @ 0x200009dc <$d>
200009a6: 1a 8b        	ldrh	r2, [r3, #24]
200009a8: 80 b2        	uxth	r0, r0
200009aa: 18 82        	strh	r0, [r3, #16]
200009ac: 0b 4b        	ldr	r3, [pc, #44]           @ 0x200009dc <$d>
200009ae: 9b 8a        	ldrh	r3, [r3, #20]
200009b0: 03 f0 80 03  	and	r3, r3, #128
200009b4: 9b b2        	uxth	r3, r3
200009b6: 00 2b        	cmp	r3, #0
200009b8: f8 d0        	beq	0x200009ac <WriteRegister+0x40> @ imm = #-16
200009ba: 89 b2        	uxth	r1, r1
200009bc: 07 4b        	ldr	r3, [pc, #28]           @ 0x200009dc <$d>
200009be: 19 82        	strh	r1, [r3, #16]
200009c0: 06 4b        	ldr	r3, [pc, #24]           @ 0x200009dc <$d>
200009c2: 9b 8a        	ldrh	r3, [r3, #20]
200009c4: 03 f0 04 03  	and	r3, r3, #4
200009c8: 9b b2        	uxth	r3, r3
200009ca: 00 2b        	cmp	r3, #0
200009cc: f8 d0        	beq	0x200009c0 <WriteRegister+0x54> @ imm = #-16
200009ce: 03 4a        	ldr	r2, [pc, #12]           @ 0x200009dc <$d>
200009d0: 13 88        	ldrh	r3, [r2]
200009d2: 9b b2        	uxth	r3, r3
200009d4: 43 f4 00 73  	orr	r3, r3, #512
200009d8: 13 80        	strh	r3, [r2]
200009da: 70 47        	bx	lr

200009dc <$d>:
200009dc: 00 54        	strb	r0, [r0, r0]
200009de: 00 40        	ands	r0, r0

200009e0 <SetAudioVolume>:
200009e0: 10 b5        	push	{r4, lr}
200009e2: 19 30        	adds	r0, #25
200009e4: c4 b2        	uxtb	r4, r0
200009e6: 20 20        	movs	r0, #32
200009e8: 21 46        	mov	r1, r4
200009ea: ff f7 bf ff  	bl	0x2000096c <WriteRegister> @ imm = #-130
200009ee: 21 20        	movs	r0, #33
200009f0: 21 46        	mov	r1, r4
200009f2: ff f7 bb ff  	bl	0x2000096c <WriteRegister> @ imm = #-138
200009f6: 10 bd        	pop	{r4, pc}

200009f8 <InitializeAudio>:
200009f8: 2d e9 f0 4f  	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
200009fc: 87 b0        	sub	sp, #28
200009fe: 07 46        	mov	r7, r0
20000a00: 8b 46        	mov	r11, r1
20000a02: 15 46        	mov	r5, r2
20000a04: 01 93        	str	r3, [sp, #4]
20000a06: 85 4b        	ldr	r3, [pc, #532]          @ 0x20000c1c <$d>
20000a08: 00 24        	movs	r4, #0
20000a0a: 1c 61        	str	r4, [r3, #16]
20000a0c: 5c 61        	str	r4, [r3, #20]
20000a0e: 5c 60        	str	r4, [r3, #4]
20000a10: 1c 60        	str	r4, [r3]
20000a12: 9c 60        	str	r4, [r3, #8]
20000a14: 1c 73        	strb	r4, [r3, #12]
20000a16: 01 20        	movs	r0, #1
20000a18: 01 46        	mov	r1, r0
20000a1a: 00 f0 53 fa  	bl	0x20000ec4 <RCC_AHB1PeriphClockCmd> @ imm = #1190
20000a1e: 02 20        	movs	r0, #2
20000a20: 01 21        	movs	r1, #1
20000a22: 00 f0 4f fa  	bl	0x20000ec4 <RCC_AHB1PeriphClockCmd> @ imm = #1182
20000a26: 04 20        	movs	r0, #4
20000a28: 01 21        	movs	r1, #1
20000a2a: 00 f0 4b fa  	bl	0x20000ec4 <RCC_AHB1PeriphClockCmd> @ imm = #1174
20000a2e: 08 20        	movs	r0, #8
20000a30: 01 21        	movs	r1, #1
20000a32: 00 f0 47 fa  	bl	0x20000ec4 <RCC_AHB1PeriphClockCmd> @ imm = #1166
20000a36: 4f f4 00 10  	mov.w	r0, #2097152
20000a3a: 01 21        	movs	r1, #1
20000a3c: 00 f0 42 fa  	bl	0x20000ec4 <RCC_AHB1PeriphClockCmd> @ imm = #1156
20000a40: 4f f4 00 10  	mov.w	r0, #2097152
20000a44: 01 21        	movs	r1, #1
20000a46: 00 f0 67 fa  	bl	0x20000f18 <RCC_APB1PeriphClockCmd> @ imm = #1230
20000a4a: 4f f4 00 40  	mov.w	r0, #32768
20000a4e: 01 21        	movs	r1, #1
20000a50: 00 f0 62 fa  	bl	0x20000f18 <RCC_APB1PeriphClockCmd> @ imm = #1220
20000a54: 4f f0 10 09  	mov.w	r9, #16
20000a58: cd f8 10 90  	str.w	r9, [sp, #16]
20000a5c: 4f f0 01 08  	mov.w	r8, #1
20000a60: 8d f8 14 80  	strb.w	r8, [sp, #20]
20000a64: 8d f8 16 40  	strb.w	r4, [sp, #22]
20000a68: 02 26        	movs	r6, #2
20000a6a: 8d f8 15 60  	strb.w	r6, [sp, #21]
20000a6e: 8d f8 17 40  	strb.w	r4, [sp, #23]
20000a72: df f8 b0 a1  	ldr.w	r10, [pc, #432]         @ 0x20000c24 <$d+0x8>
20000a76: 50 46        	mov	r0, r10
20000a78: 0d eb 09 01  	add.w	r1, sp, r9
20000a7c: 00 f0 d0 fb  	bl	0x20001220 <GPIO_Init>  @ imm = #1952
20000a80: 4f f4 10 73  	mov.w	r3, #576
20000a84: 04 93        	str	r3, [sp, #16]
20000a86: 8d f8 15 60  	strb.w	r6, [sp, #21]
20000a8a: 8d f8 14 60  	strb.w	r6, [sp, #20]
20000a8e: 8d f8 16 80  	strb.w	r8, [sp, #22]
20000a92: 8d f8 17 40  	strb.w	r4, [sp, #23]
20000a96: df f8 9c 81  	ldr.w	r8, [pc, #412]          @ 0x20000c34 <$d+0x18>
20000a9a: 40 46        	mov	r0, r8
20000a9c: 0d eb 09 01  	add.w	r1, sp, r9
20000aa0: 00 f0 be fb  	bl	0x20001220 <GPIO_Init>  @ imm = #1916
20000aa4: 40 46        	mov	r0, r8
20000aa6: 06 21        	movs	r1, #6
20000aa8: 04 22        	movs	r2, #4
20000aaa: 00 f0 3f fc  	bl	0x2000132c <GPIO_PinAFConfig> @ imm = #2174
20000aae: 40 46        	mov	r0, r8
20000ab0: 09 21        	movs	r1, #9
20000ab2: 04 22        	movs	r2, #4
20000ab4: 00 f0 3a fc  	bl	0x2000132c <GPIO_PinAFConfig> @ imm = #2164
20000ab8: 4f f4 a4 53  	mov.w	r3, #5248
20000abc: 04 93        	str	r3, [sp, #16]
20000abe: 8d f8 15 60  	strb.w	r6, [sp, #21]
20000ac2: 8d f8 14 60  	strb.w	r6, [sp, #20]
20000ac6: 8d f8 16 40  	strb.w	r4, [sp, #22]
20000aca: 8d f8 17 40  	strb.w	r4, [sp, #23]
20000ace: 08 f5 80 68  	add.w	r8, r8, #1024
20000ad2: 40 46        	mov	r0, r8
20000ad4: 0d eb 09 01  	add.w	r1, sp, r9
20000ad8: 00 f0 a2 fb  	bl	0x20001220 <GPIO_Init>  @ imm = #1860
20000adc: 40 46        	mov	r0, r8
20000ade: 07 21        	movs	r1, #7
20000ae0: 06 22        	movs	r2, #6
20000ae2: 00 f0 23 fc  	bl	0x2000132c <GPIO_PinAFConfig> @ imm = #2118
20000ae6: 40 46        	mov	r0, r8
20000ae8: 0a 21        	movs	r1, #10
20000aea: 06 22        	movs	r2, #6
20000aec: 00 f0 1e fc  	bl	0x2000132c <GPIO_PinAFConfig> @ imm = #2108
20000af0: 40 46        	mov	r0, r8
20000af2: 0c 21        	movs	r1, #12
20000af4: 06 22        	movs	r2, #6
20000af6: 00 f0 19 fc  	bl	0x2000132c <GPIO_PinAFConfig> @ imm = #2098
20000afa: cd f8 10 90  	str.w	r9, [sp, #16]
20000afe: 8d f8 15 60  	strb.w	r6, [sp, #21]
20000b02: 8d f8 14 60  	strb.w	r6, [sp, #20]
20000b06: 8d f8 16 40  	strb.w	r4, [sp, #22]
20000b0a: 8d f8 17 40  	strb.w	r4, [sp, #23]
20000b0e: 44 4e        	ldr	r6, [pc, #272]          @ 0x20000c20 <$d+0x4>
20000b10: 30 46        	mov	r0, r6
20000b12: 0d eb 09 01  	add.w	r1, sp, r9
20000b16: 00 f0 83 fb  	bl	0x20001220 <GPIO_Init>  @ imm = #1798
20000b1a: 30 46        	mov	r0, r6
20000b1c: 04 21        	movs	r1, #4
20000b1e: 06 22        	movs	r2, #6
20000b20: 00 f0 04 fc  	bl	0x2000132c <GPIO_PinAFConfig> @ imm = #2056
20000b24: aa f8 1a 90  	strh.w	r9, [r10, #26]
20000b28: 03 94        	str	r4, [sp, #12]
20000b2a: 03 e0        	b	0x20000b34 <InitializeAudio+0x13c> @ imm = #6
20000b2c: 00 bf        	nop
20000b2e: 03 9b        	ldr	r3, [sp, #12]
20000b30: 01 33        	adds	r3, #1
20000b32: 03 93        	str	r3, [sp, #12]
20000b34: 03 9a        	ldr	r2, [sp, #12]
20000b36: 44 f6 fe 73  	movw	r3, #20478
20000b3a: 9a 42        	cmp	r2, r3
20000b3c: f6 dd        	ble	0x20000b2c <InitializeAudio+0x134> @ imm = #-20
20000b3e: 10 22        	movs	r2, #16
20000b40: 38 4b        	ldr	r3, [pc, #224]          @ 0x20000c24 <$d+0x8>
20000b42: 1a 83        	strh	r2, [r3, #24]
20000b44: 4f f4 00 10  	mov.w	r0, #2097152
20000b48: 01 21        	movs	r1, #1
20000b4a: 00 f0 2b fa  	bl	0x20000fa4 <RCC_APB1PeriphResetCmd> @ imm = #1110
20000b4e: 4f f4 00 10  	mov.w	r0, #2097152
20000b52: 00 21        	movs	r1, #0
20000b54: 00 f0 26 fa  	bl	0x20000fa4 <RCC_APB1PeriphResetCmd> @ imm = #1100
20000b58: 33 4b        	ldr	r3, [pc, #204]          @ 0x20000c28 <$d+0xc>
20000b5a: 2a 22        	movs	r2, #42
20000b5c: 9a 80        	strh	r2, [r3, #4]
20000b5e: 48 f2 33 02  	movw	r2, #32819
20000b62: 1a 81        	strh	r2, [r3, #8]
20000b64: d2 22        	movs	r2, #210
20000b66: 9a 83        	strh	r2, [r3, #28]
20000b68: 2b 22        	movs	r2, #43
20000b6a: 1a 84        	strh	r2, [r3, #32]
20000b6c: 40 f2 01 42  	movw	r2, #1025
20000b70: 1a 80        	strh	r2, [r3]
20000b72: 02 20        	movs	r0, #2
20000b74: 01 21        	movs	r1, #1
20000b76: ff f7 f9 fe  	bl	0x2000096c <WriteRegister> @ imm = #-526
20000b7a: 04 20        	movs	r0, #4
20000b7c: af 21        	movs	r1, #175
20000b7e: ff f7 f5 fe  	bl	0x2000096c <WriteRegister> @ imm = #-534
20000b82: 05 20        	movs	r0, #5
20000b84: 81 21        	movs	r1, #129
20000b86: ff f7 f1 fe  	bl	0x2000096c <WriteRegister> @ imm = #-542
20000b8a: 06 20        	movs	r0, #6
20000b8c: 04 21        	movs	r1, #4
20000b8e: ff f7 ed fe  	bl	0x2000096c <WriteRegister> @ imm = #-550
20000b92: ff 20        	movs	r0, #255
20000b94: ff f7 24 ff  	bl	0x200009e0 <SetAudioVolume> @ imm = #-440
20000b98: 02 20        	movs	r0, #2
20000b9a: 9e 21        	movs	r1, #158
20000b9c: ff f7 e6 fe  	bl	0x2000096c <WriteRegister> @ imm = #-564
20000ba0: 0a 20        	movs	r0, #10
20000ba2: 00 21        	movs	r1, #0
20000ba4: ff f7 e2 fe  	bl	0x2000096c <WriteRegister> @ imm = #-572
20000ba8: 0e 20        	movs	r0, #14
20000baa: 04 21        	movs	r1, #4
20000bac: ff f7 de fe  	bl	0x2000096c <WriteRegister> @ imm = #-580
20000bb0: 27 20        	movs	r0, #39
20000bb2: 00 21        	movs	r1, #0
20000bb4: ff f7 da fe  	bl	0x2000096c <WriteRegister> @ imm = #-588
20000bb8: 1f 20        	movs	r0, #31
20000bba: 0f 21        	movs	r1, #15
20000bbc: ff f7 d6 fe  	bl	0x2000096c <WriteRegister> @ imm = #-596
20000bc0: 1a 20        	movs	r0, #26
20000bc2: 0a 21        	movs	r1, #10
20000bc4: ff f7 d2 fe  	bl	0x2000096c <WriteRegister> @ imm = #-604
20000bc8: 1b 20        	movs	r0, #27
20000bca: 0a 21        	movs	r1, #10
20000bcc: ff f7 ce fe  	bl	0x2000096c <WriteRegister> @ imm = #-612
20000bd0: 00 22        	movs	r2, #0
20000bd2: 16 4b        	ldr	r3, [pc, #88]           @ 0x20000c2c <$d+0x10>
20000bd4: 9a 83        	strh	r2, [r3, #28]
20000bd6: 03 f5 fe 33  	add.w	r3, r3, #130048
20000bda: 9a 68        	ldr	r2, [r3, #8]
20000bdc: 22 f4 00 02  	bic	r2, r2, #8388608
20000be0: 9a 60        	str	r2, [r3, #8]
20000be2: bf 01        	lsls	r7, r7, #6
20000be4: 47 ea 0b 77  	orr.w	r7, r7, r11, lsl #28
20000be8: c3 f8 84 70  	str.w	r7, [r3, #132]
20000bec: 1a 68        	ldr	r2, [r3]
20000bee: 42 f0 80 62  	orr	r2, r2, #67108864
20000bf2: 1a 60        	str	r2, [r3]
20000bf4: 0e 4b        	ldr	r3, [pc, #56]           @ 0x20000c30 <$d+0x14>
20000bf6: 1b 68        	ldr	r3, [r3]
20000bf8: 13 f0 00 6f  	tst.w	r3, #134217728
20000bfc: fa d0        	beq	0x20000bf4 <InitializeAudio+0x1fc> @ imm = #-12
20000bfe: 01 9b        	ldr	r3, [sp, #4]
20000c00: 45 ea 03 25  	orr.w	r5, r5, r3, lsl #8
20000c04: 45 f4 00 75  	orr	r5, r5, #512
20000c08: ad b2        	uxth	r5, r5
20000c0a: 08 4b        	ldr	r3, [pc, #32]           @ 0x20000c2c <$d+0x10>
20000c0c: 1d 84        	strh	r5, [r3, #32]
20000c0e: 4f f4 60 62  	mov.w	r2, #3584
20000c12: 9a 83        	strh	r2, [r3, #28]
20000c14: 07 b0        	add	sp, #28
20000c16: bd e8 f0 8f  	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
20000c1a: 00 bf        	nop

20000c1c <$d>:
20000c1c: 6c 13        	asrs	r4, r5, #13
20000c1e: 00 20        	movs	r0, #0
20000c20: 00 00        	movs	r0, r0
20000c22: 02 40        	ands	r2, r0
20000c24: 00 0c        	lsrs	r0, r0, #16
20000c26: 02 40        	ands	r2, r0
20000c28: 00 54        	strb	r0, [r0, r0]
20000c2a: 00 40        	ands	r0, r0
20000c2c: 00 3c        	subs	r4, #0
20000c2e: 00 40        	ands	r0, r0
20000c30: 00 38        	subs	r0, #0
20000c32: 02 40        	ands	r2, r0
20000c34: 00 04        	lsls	r0, r0, #16
20000c36: 02 40        	ands	r2, r0

20000c38 <Reset_Handler>:
20000c38: ff f7 6a fe  	bl	0x20000910 <offloadedCode> @ imm = #-812
20000c3c: 70 47        	bx	lr
20000c3e: 00 00        	movs	r0, r0

20000c40 <RCC_DeInit>:
20000c40: 0a 4b        	ldr	r3, [pc, #40]           @ 0x20000c6c <$d>
20000c42: 1a 68        	ldr	r2, [r3]
20000c44: 42 f0 01 02  	orr	r2, r2, #1
20000c48: 1a 60        	str	r2, [r3]
20000c4a: 00 21        	movs	r1, #0
20000c4c: 99 60        	str	r1, [r3, #8]
20000c4e: 1a 68        	ldr	r2, [r3]
20000c50: 22 f0 84 72  	bic	r2, r2, #17301504
20000c54: 22 f4 80 32  	bic	r2, r2, #65536
20000c58: 1a 60        	str	r2, [r3]
20000c5a: 05 4a        	ldr	r2, [pc, #20]           @ 0x20000c70 <$d+0x4>
20000c5c: 5a 60        	str	r2, [r3, #4]
20000c5e: 1a 68        	ldr	r2, [r3]
20000c60: 22 f4 80 22  	bic	r2, r2, #262144
20000c64: 1a 60        	str	r2, [r3]
20000c66: d9 60        	str	r1, [r3, #12]
20000c68: 70 47        	bx	lr
20000c6a: 00 bf        	nop

20000c6c <$d>:
20000c6c: 00 38        	subs	r0, #0
20000c6e: 02 40        	ands	r2, r0
20000c70: 10 30        	adds	r0, #16
20000c72: 00 24        	movs	r4, #0

20000c74 <RCC_HSEConfig>:
20000c74: 02 4b        	ldr	r3, [pc, #8]            @ 0x20000c80 <$d>
20000c76: 00 22        	movs	r2, #0
20000c78: 1a 70        	strb	r2, [r3]
20000c7a: 18 70        	strb	r0, [r3]
20000c7c: 70 47        	bx	lr
20000c7e: 00 bf        	nop

20000c80 <$d>:
20000c80: 02 38        	subs	r0, #2
20000c82: 02 40        	ands	r2, r0

20000c84 <RCC_AdjustHSICalibrationValue>:
20000c84: 03 4a        	ldr	r2, [pc, #12]           @ 0x20000c94 <$d>
20000c86: 13 68        	ldr	r3, [r2]
20000c88: 23 f0 f8 03  	bic	r3, r3, #248
20000c8c: 43 ea c0 00  	orr.w	r0, r3, r0, lsl #3
20000c90: 10 60        	str	r0, [r2]
20000c92: 70 47        	bx	lr

20000c94 <$d>:
20000c94: 00 38        	subs	r0, #0
20000c96: 02 40        	ands	r2, r0

20000c98 <RCC_HSICmd>:
20000c98: 01 4b        	ldr	r3, [pc, #4]            @ 0x20000ca0 <$d>
20000c9a: 18 60        	str	r0, [r3]
20000c9c: 70 47        	bx	lr
20000c9e: 00 bf        	nop

20000ca0 <$d>:
20000ca0: 00 00        	movs	r0, r0
20000ca2: 47 42        	rsbs	r7, r0, #0

20000ca4 <RCC_LSEConfig>:
20000ca4: 08 4b        	ldr	r3, [pc, #32]           @ 0x20000cc8 <$d>
20000ca6: 00 22        	movs	r2, #0
20000ca8: 1a 70        	strb	r2, [r3]
20000caa: 1a 70        	strb	r2, [r3]
20000cac: 01 28        	cmp	r0, #1
20000cae: 02 d0        	beq	0x20000cb6 <RCC_LSEConfig+0x12> @ imm = #4
20000cb0: 04 28        	cmp	r0, #4
20000cb2: 04 d0        	beq	0x20000cbe <RCC_LSEConfig+0x1a> @ imm = #8
20000cb4: 70 47        	bx	lr
20000cb6: 01 22        	movs	r2, #1
20000cb8: 03 4b        	ldr	r3, [pc, #12]           @ 0x20000cc8 <$d>
20000cba: 1a 70        	strb	r2, [r3]
20000cbc: 70 47        	bx	lr
20000cbe: 05 22        	movs	r2, #5
20000cc0: 01 4b        	ldr	r3, [pc, #4]            @ 0x20000cc8 <$d>
20000cc2: 1a 70        	strb	r2, [r3]
20000cc4: 70 47        	bx	lr
20000cc6: 00 bf        	nop

20000cc8 <$d>:
20000cc8: 70 38        	subs	r0, #112
20000cca: 02 40        	ands	r2, r0

20000ccc <RCC_LSICmd>:
20000ccc: 01 4b        	ldr	r3, [pc, #4]            @ 0x20000cd4 <$d>
20000cce: 18 60        	str	r0, [r3]
20000cd0: 70 47        	bx	lr
20000cd2: 00 bf        	nop

20000cd4 <$d>:
20000cd4: 80 0e        	lsrs	r0, r0, #26
20000cd6: 47 42        	rsbs	r7, r0, #0

20000cd8 <RCC_PLLConfig>:
20000cd8: 41 ea 82 11  	orr.w	r1, r1, r2, lsl #6
20000cdc: 5b 08        	lsrs	r3, r3, #1
20000cde: 01 3b        	subs	r3, #1
20000ce0: 41 ea 03 41  	orr.w	r1, r1, r3, lsl #16
20000ce4: 08 43        	orrs	r0, r1
20000ce6: 00 9b        	ldr	r3, [sp]
20000ce8: 40 ea 03 61  	orr.w	r1, r0, r3, lsl #24
20000cec: 01 4b        	ldr	r3, [pc, #4]            @ 0x20000cf4 <$d>
20000cee: 59 60        	str	r1, [r3, #4]
20000cf0: 70 47        	bx	lr
20000cf2: 00 bf        	nop

20000cf4 <$d>:
20000cf4: 00 38        	subs	r0, #0
20000cf6: 02 40        	ands	r2, r0

20000cf8 <RCC_PLLCmd>:
20000cf8: 01 4b        	ldr	r3, [pc, #4]            @ 0x20000d00 <$d>
20000cfa: 18 60        	str	r0, [r3]
20000cfc: 70 47        	bx	lr
20000cfe: 00 bf        	nop

20000d00 <$d>:
20000d00: 60 00        	lsls	r0, r4, #1
20000d02: 47 42        	rsbs	r7, r0, #0

20000d04 <RCC_PLLI2SConfig>:
20000d04: 09 07        	lsls	r1, r1, #28
20000d06: 41 ea 80 10  	orr.w	r0, r1, r0, lsl #6
20000d0a: 02 4b        	ldr	r3, [pc, #8]            @ 0x20000d14 <$d>
20000d0c: c3 f8 84 00  	str.w	r0, [r3, #132]
20000d10: 70 47        	bx	lr
20000d12: 00 bf        	nop

20000d14 <$d>:
20000d14: 00 38        	subs	r0, #0
20000d16: 02 40        	ands	r2, r0

20000d18 <RCC_PLLI2SCmd>:
20000d18: 01 4b        	ldr	r3, [pc, #4]            @ 0x20000d20 <$d>
20000d1a: 18 60        	str	r0, [r3]
20000d1c: 70 47        	bx	lr
20000d1e: 00 bf        	nop

20000d20 <$d>:
20000d20: 68 00        	lsls	r0, r5, #1
20000d22: 47 42        	rsbs	r7, r0, #0

20000d24 <RCC_ClockSecuritySystemCmd>:
20000d24: 01 4b        	ldr	r3, [pc, #4]            @ 0x20000d2c <$d>
20000d26: 18 60        	str	r0, [r3]
20000d28: 70 47        	bx	lr
20000d2a: 00 bf        	nop

20000d2c <$d>:
20000d2c: 4c 00        	lsls	r4, r1, #1
20000d2e: 47 42        	rsbs	r7, r0, #0

20000d30 <RCC_MCO1Config>:
20000d30: 03 4a        	ldr	r2, [pc, #12]           @ 0x20000d40 <$d>
20000d32: 93 68        	ldr	r3, [r2, #8]
20000d34: 23 f0 ec 63  	bic	r3, r3, #123731968
20000d38: 08 43        	orrs	r0, r1
20000d3a: 03 43        	orrs	r3, r0
20000d3c: 93 60        	str	r3, [r2, #8]
20000d3e: 70 47        	bx	lr

20000d40 <$d>:
20000d40: 00 38        	subs	r0, #0
20000d42: 02 40        	ands	r2, r0

20000d44 <RCC_MCO2Config>:
20000d44: 03 4a        	ldr	r2, [pc, #12]           @ 0x20000d54 <$d>
20000d46: 93 68        	ldr	r3, [r2, #8]
20000d48: 23 f0 78 43  	bic	r3, r3, #4160749568
20000d4c: 08 43        	orrs	r0, r1
20000d4e: 03 43        	orrs	r3, r0
20000d50: 93 60        	str	r3, [r2, #8]
20000d52: 70 47        	bx	lr

20000d54 <$d>:
20000d54: 00 38        	subs	r0, #0
20000d56: 02 40        	ands	r2, r0

20000d58 <RCC_SYSCLKConfig>:
20000d58: 03 4a        	ldr	r2, [pc, #12]           @ 0x20000d68 <$d>
20000d5a: 93 68        	ldr	r3, [r2, #8]
20000d5c: 23 f0 03 03  	bic	r3, r3, #3
20000d60: 18 43        	orrs	r0, r3
20000d62: 90 60        	str	r0, [r2, #8]
20000d64: 70 47        	bx	lr
20000d66: 00 bf        	nop

20000d68 <$d>:
20000d68: 00 38        	subs	r0, #0
20000d6a: 02 40        	ands	r2, r0

20000d6c <RCC_GetSYSCLKSource>:
20000d6c: 02 4b        	ldr	r3, [pc, #8]            @ 0x20000d78 <$d>
20000d6e: 98 68        	ldr	r0, [r3, #8]
20000d70: 00 f0 0c 00  	and	r0, r0, #12
20000d74: 70 47        	bx	lr
20000d76: 00 bf        	nop

20000d78 <$d>:
20000d78: 00 38        	subs	r0, #0
20000d7a: 02 40        	ands	r2, r0

20000d7c <RCC_HCLKConfig>:
20000d7c: 03 4a        	ldr	r2, [pc, #12]           @ 0x20000d8c <$d>
20000d7e: 93 68        	ldr	r3, [r2, #8]
20000d80: 23 f0 f0 03  	bic	r3, r3, #240
20000d84: 18 43        	orrs	r0, r3
20000d86: 90 60        	str	r0, [r2, #8]
20000d88: 70 47        	bx	lr
20000d8a: 00 bf        	nop

20000d8c <$d>:
20000d8c: 00 38        	subs	r0, #0
20000d8e: 02 40        	ands	r2, r0

20000d90 <RCC_PCLK1Config>:
20000d90: 03 4a        	ldr	r2, [pc, #12]           @ 0x20000da0 <$d>
20000d92: 93 68        	ldr	r3, [r2, #8]
20000d94: 23 f4 e0 53  	bic	r3, r3, #7168
20000d98: 18 43        	orrs	r0, r3
20000d9a: 90 60        	str	r0, [r2, #8]
20000d9c: 70 47        	bx	lr
20000d9e: 00 bf        	nop

20000da0 <$d>:
20000da0: 00 38        	subs	r0, #0
20000da2: 02 40        	ands	r2, r0

20000da4 <RCC_PCLK2Config>:
20000da4: 03 4a        	ldr	r2, [pc, #12]           @ 0x20000db4 <$d>
20000da6: 93 68        	ldr	r3, [r2, #8]
20000da8: 23 f4 60 43  	bic	r3, r3, #57344
20000dac: 43 ea c0 00  	orr.w	r0, r3, r0, lsl #3
20000db0: 90 60        	str	r0, [r2, #8]
20000db2: 70 47        	bx	lr

20000db4 <$d>:
20000db4: 00 38        	subs	r0, #0
20000db6: 02 40        	ands	r2, r0

20000db8 <RCC_GetClocksFreq>:
20000db8: 10 b4        	push	{r4}
20000dba: 29 4b        	ldr	r3, [pc, #164]          @ 0x20000e60 <$d>
20000dbc: 9b 68        	ldr	r3, [r3, #8]
20000dbe: 03 f0 0c 03  	and	r3, r3, #12
20000dc2: 04 2b        	cmp	r3, #4
20000dc4: 05 d0        	beq	0x20000dd2 <RCC_GetClocksFreq+0x1a> @ imm = #10
20000dc6: 08 2b        	cmp	r3, #8
20000dc8: 06 d0        	beq	0x20000dd8 <RCC_GetClocksFreq+0x20> @ imm = #12
20000dca: 53 bb        	cbnz	r3, 0x20000e22 <RCC_GetClocksFreq+0x6a> @ imm = #84
20000dcc: 25 4b        	ldr	r3, [pc, #148]          @ 0x20000e64 <$d+0x4>
20000dce: 03 60        	str	r3, [r0]
20000dd0: 29 e0        	b	0x20000e26 <RCC_GetClocksFreq+0x6e> @ imm = #82
20000dd2: 25 4b        	ldr	r3, [pc, #148]          @ 0x20000e68 <$d+0x8>
20000dd4: 03 60        	str	r3, [r0]
20000dd6: 26 e0        	b	0x20000e26 <RCC_GetClocksFreq+0x6e> @ imm = #76
20000dd8: 21 4b        	ldr	r3, [pc, #132]          @ 0x20000e60 <$d>
20000dda: 5a 68        	ldr	r2, [r3, #4]
20000ddc: 5b 68        	ldr	r3, [r3, #4]
20000dde: 03 f0 3f 03  	and	r3, r3, #63
20000de2: 12 f4 80 0f  	tst.w	r2, #4194304
20000de6: 09 d0        	beq	0x20000dfc <RCC_GetClocksFreq+0x44> @ imm = #18
20000de8: 1f 4a        	ldr	r2, [pc, #124]          @ 0x20000e68 <$d+0x8>
20000dea: b2 fb f3 f2  	udiv	r2, r2, r3
20000dee: 1c 4b        	ldr	r3, [pc, #112]          @ 0x20000e60 <$d>
20000df0: 5b 68        	ldr	r3, [r3, #4]
20000df2: c3 f3 88 13  	ubfx	r3, r3, #6, #9
20000df6: 03 fb 02 f2  	mul	r2, r3, r2
20000dfa: 08 e0        	b	0x20000e0e <RCC_GetClocksFreq+0x56> @ imm = #16
20000dfc: 19 4a        	ldr	r2, [pc, #100]          @ 0x20000e64 <$d+0x4>
20000dfe: b2 fb f3 f3  	udiv	r3, r2, r3
20000e02: 17 4a        	ldr	r2, [pc, #92]           @ 0x20000e60 <$d>
20000e04: 51 68        	ldr	r1, [r2, #4]
20000e06: c1 f3 88 11  	ubfx	r1, r1, #6, #9
20000e0a: 01 fb 03 f2  	mul	r2, r1, r3
20000e0e: 14 4b        	ldr	r3, [pc, #80]           @ 0x20000e60 <$d>
20000e10: 5b 68        	ldr	r3, [r3, #4]
20000e12: c3 f3 01 43  	ubfx	r3, r3, #16, #2
20000e16: 01 33        	adds	r3, #1
20000e18: 5b 00        	lsls	r3, r3, #1
20000e1a: b2 fb f3 f3  	udiv	r3, r2, r3
20000e1e: 03 60        	str	r3, [r0]
20000e20: 01 e0        	b	0x20000e26 <RCC_GetClocksFreq+0x6e> @ imm = #2
20000e22: 10 4b        	ldr	r3, [pc, #64]           @ 0x20000e64 <$d+0x4>
20000e24: 03 60        	str	r3, [r0]
20000e26: 0e 4a        	ldr	r2, [pc, #56]           @ 0x20000e60 <$d>
20000e28: 93 68        	ldr	r3, [r2, #8]
20000e2a: c3 f3 03 13  	ubfx	r3, r3, #4, #4
20000e2e: 0f 49        	ldr	r1, [pc, #60]           @ 0x20000e6c <$d+0xc>
20000e30: cc 5c        	ldrb	r4, [r1, r3]
20000e32: e4 b2        	uxtb	r4, r4
20000e34: 03 68        	ldr	r3, [r0]
20000e36: e3 40        	lsrs	r3, r4
20000e38: 43 60        	str	r3, [r0, #4]
20000e3a: 94 68        	ldr	r4, [r2, #8]
20000e3c: c4 f3 82 24  	ubfx	r4, r4, #10, #3
20000e40: 0c 5d        	ldrb	r4, [r1, r4]
20000e42: e4 b2        	uxtb	r4, r4
20000e44: 23 fa 04 f4  	lsr.w	r4, r3, r4
20000e48: 84 60        	str	r4, [r0, #8]
20000e4a: 92 68        	ldr	r2, [r2, #8]
20000e4c: c2 f3 42 32  	ubfx	r2, r2, #13, #3
20000e50: 8a 5c        	ldrb	r2, [r1, r2]
20000e52: d2 b2        	uxtb	r2, r2
20000e54: d3 40        	lsrs	r3, r2
20000e56: c3 60        	str	r3, [r0, #12]
20000e58: 5d f8 04 4b  	ldr	r4, [sp], #4
20000e5c: 70 47        	bx	lr
20000e5e: 00 bf        	nop

20000e60 <$d>:
20000e60: 00 38        	subs	r0, #0
20000e62: 02 40        	ands	r2, r0
20000e64: 00 24        	movs	r4, #0
20000e66: f4 00        	lsls	r4, r6, #3
20000e68: 00 12        	asrs	r0, r0, #8
20000e6a: 7a 00        	lsls	r2, r7, #1
20000e6c: 5c 13        	asrs	r4, r3, #13
20000e6e: 00 20        	movs	r0, #0

20000e70 <RCC_RTCCLKConfig>:
20000e70: 00 f4 40 73  	and	r3, r0, #768
20000e74: b3 f5 40 7f  	cmp.w	r3, #768
20000e78: 09 d1        	bne	0x20000e8e <RCC_RTCCLKConfig+0x1e> @ imm = #18
20000e7a: 08 49        	ldr	r1, [pc, #32]           @ 0x20000e9c <$d>
20000e7c: 8b 68        	ldr	r3, [r1, #8]
20000e7e: 23 f4 f8 13  	bic	r3, r3, #2031616
20000e82: 20 f0 70 42  	bic	r2, r0, #4026531840
20000e86: 22 f4 40 72  	bic	r2, r2, #768
20000e8a: 13 43        	orrs	r3, r2
20000e8c: 8b 60        	str	r3, [r1, #8]
20000e8e: 03 4b        	ldr	r3, [pc, #12]           @ 0x20000e9c <$d>
20000e90: 1a 6f        	ldr	r2, [r3, #112]
20000e92: c0 f3 0b 00  	ubfx	r0, r0, #0, #12
20000e96: 10 43        	orrs	r0, r2
20000e98: 18 67        	str	r0, [r3, #112]
20000e9a: 70 47        	bx	lr

20000e9c <$d>:
20000e9c: 00 38        	subs	r0, #0
20000e9e: 02 40        	ands	r2, r0

20000ea0 <RCC_RTCCLKCmd>:
20000ea0: 01 4b        	ldr	r3, [pc, #4]            @ 0x20000ea8 <$d>
20000ea2: 18 60        	str	r0, [r3]
20000ea4: 70 47        	bx	lr
20000ea6: 00 bf        	nop

20000ea8 <$d>:
20000ea8: 3c 0e        	lsrs	r4, r7, #24
20000eaa: 47 42        	rsbs	r7, r0, #0

20000eac <RCC_BackupResetCmd>:
20000eac: 01 4b        	ldr	r3, [pc, #4]            @ 0x20000eb4 <$d>
20000eae: 18 60        	str	r0, [r3]
20000eb0: 70 47        	bx	lr
20000eb2: 00 bf        	nop

20000eb4 <$d>:
20000eb4: 40 0e        	lsrs	r0, r0, #25
20000eb6: 47 42        	rsbs	r7, r0, #0

20000eb8 <RCC_I2SCLKConfig>:
20000eb8: 01 4b        	ldr	r3, [pc, #4]            @ 0x20000ec0 <$d>
20000eba: 18 60        	str	r0, [r3]
20000ebc: 70 47        	bx	lr
20000ebe: 00 bf        	nop

20000ec0 <$d>:
20000ec0: 5c 01        	lsls	r4, r3, #5
20000ec2: 47 42        	rsbs	r7, r0, #0

20000ec4 <RCC_AHB1PeriphClockCmd>:
20000ec4: 21 b1        	cbz	r1, 0x20000ed0 <RCC_AHB1PeriphClockCmd+0xc> @ imm = #8
20000ec6: 05 4b        	ldr	r3, [pc, #20]           @ 0x20000edc <$d>
20000ec8: 1a 6b        	ldr	r2, [r3, #48]
20000eca: 10 43        	orrs	r0, r2
20000ecc: 18 63        	str	r0, [r3, #48]
20000ece: 70 47        	bx	lr
20000ed0: 02 4a        	ldr	r2, [pc, #8]            @ 0x20000edc <$d>
20000ed2: 13 6b        	ldr	r3, [r2, #48]
20000ed4: 23 ea 00 00  	bic.w	r0, r3, r0
20000ed8: 10 63        	str	r0, [r2, #48]
20000eda: 70 47        	bx	lr

20000edc <$d>:
20000edc: 00 38        	subs	r0, #0
20000ede: 02 40        	ands	r2, r0

20000ee0 <RCC_AHB2PeriphClockCmd>:
20000ee0: 21 b1        	cbz	r1, 0x20000eec <RCC_AHB2PeriphClockCmd+0xc> @ imm = #8
20000ee2: 05 4b        	ldr	r3, [pc, #20]           @ 0x20000ef8 <$d>
20000ee4: 5a 6b        	ldr	r2, [r3, #52]
20000ee6: 10 43        	orrs	r0, r2
20000ee8: 58 63        	str	r0, [r3, #52]
20000eea: 70 47        	bx	lr
20000eec: 02 4a        	ldr	r2, [pc, #8]            @ 0x20000ef8 <$d>
20000eee: 53 6b        	ldr	r3, [r2, #52]
20000ef0: 23 ea 00 00  	bic.w	r0, r3, r0
20000ef4: 50 63        	str	r0, [r2, #52]
20000ef6: 70 47        	bx	lr

20000ef8 <$d>:
20000ef8: 00 38        	subs	r0, #0
20000efa: 02 40        	ands	r2, r0

20000efc <RCC_AHB3PeriphClockCmd>:
20000efc: 21 b1        	cbz	r1, 0x20000f08 <RCC_AHB3PeriphClockCmd+0xc> @ imm = #8
20000efe: 05 4b        	ldr	r3, [pc, #20]           @ 0x20000f14 <$d>
20000f00: 9a 6b        	ldr	r2, [r3, #56]
20000f02: 10 43        	orrs	r0, r2
20000f04: 98 63        	str	r0, [r3, #56]
20000f06: 70 47        	bx	lr
20000f08: 02 4a        	ldr	r2, [pc, #8]            @ 0x20000f14 <$d>
20000f0a: 93 6b        	ldr	r3, [r2, #56]
20000f0c: 23 ea 00 00  	bic.w	r0, r3, r0
20000f10: 90 63        	str	r0, [r2, #56]
20000f12: 70 47        	bx	lr

20000f14 <$d>:
20000f14: 00 38        	subs	r0, #0
20000f16: 02 40        	ands	r2, r0

20000f18 <RCC_APB1PeriphClockCmd>:
20000f18: 21 b1        	cbz	r1, 0x20000f24 <RCC_APB1PeriphClockCmd+0xc> @ imm = #8
20000f1a: 05 4b        	ldr	r3, [pc, #20]           @ 0x20000f30 <$d>
20000f1c: 1a 6c        	ldr	r2, [r3, #64]
20000f1e: 10 43        	orrs	r0, r2
20000f20: 18 64        	str	r0, [r3, #64]
20000f22: 70 47        	bx	lr
20000f24: 02 4a        	ldr	r2, [pc, #8]            @ 0x20000f30 <$d>
20000f26: 13 6c        	ldr	r3, [r2, #64]
20000f28: 23 ea 00 00  	bic.w	r0, r3, r0
20000f2c: 10 64        	str	r0, [r2, #64]
20000f2e: 70 47        	bx	lr

20000f30 <$d>:
20000f30: 00 38        	subs	r0, #0
20000f32: 02 40        	ands	r2, r0

20000f34 <RCC_APB2PeriphClockCmd>:
20000f34: 21 b1        	cbz	r1, 0x20000f40 <RCC_APB2PeriphClockCmd+0xc> @ imm = #8
20000f36: 05 4b        	ldr	r3, [pc, #20]           @ 0x20000f4c <$d>
20000f38: 5a 6c        	ldr	r2, [r3, #68]
20000f3a: 10 43        	orrs	r0, r2
20000f3c: 58 64        	str	r0, [r3, #68]
20000f3e: 70 47        	bx	lr
20000f40: 02 4a        	ldr	r2, [pc, #8]            @ 0x20000f4c <$d>
20000f42: 53 6c        	ldr	r3, [r2, #68]
20000f44: 23 ea 00 00  	bic.w	r0, r3, r0
20000f48: 50 64        	str	r0, [r2, #68]
20000f4a: 70 47        	bx	lr

20000f4c <$d>:
20000f4c: 00 38        	subs	r0, #0
20000f4e: 02 40        	ands	r2, r0

20000f50 <RCC_AHB1PeriphResetCmd>:
20000f50: 21 b1        	cbz	r1, 0x20000f5c <RCC_AHB1PeriphResetCmd+0xc> @ imm = #8
20000f52: 05 4b        	ldr	r3, [pc, #20]           @ 0x20000f68 <$d>
20000f54: 1a 69        	ldr	r2, [r3, #16]
20000f56: 10 43        	orrs	r0, r2
20000f58: 18 61        	str	r0, [r3, #16]
20000f5a: 70 47        	bx	lr
20000f5c: 02 4a        	ldr	r2, [pc, #8]            @ 0x20000f68 <$d>
20000f5e: 13 69        	ldr	r3, [r2, #16]
20000f60: 23 ea 00 00  	bic.w	r0, r3, r0
20000f64: 10 61        	str	r0, [r2, #16]
20000f66: 70 47        	bx	lr

20000f68 <$d>:
20000f68: 00 38        	subs	r0, #0
20000f6a: 02 40        	ands	r2, r0

20000f6c <RCC_AHB2PeriphResetCmd>:
20000f6c: 21 b1        	cbz	r1, 0x20000f78 <RCC_AHB2PeriphResetCmd+0xc> @ imm = #8
20000f6e: 05 4b        	ldr	r3, [pc, #20]           @ 0x20000f84 <$d>
20000f70: 5a 69        	ldr	r2, [r3, #20]
20000f72: 10 43        	orrs	r0, r2
20000f74: 58 61        	str	r0, [r3, #20]
20000f76: 70 47        	bx	lr
20000f78: 02 4a        	ldr	r2, [pc, #8]            @ 0x20000f84 <$d>
20000f7a: 53 69        	ldr	r3, [r2, #20]
20000f7c: 23 ea 00 00  	bic.w	r0, r3, r0
20000f80: 50 61        	str	r0, [r2, #20]
20000f82: 70 47        	bx	lr

20000f84 <$d>:
20000f84: 00 38        	subs	r0, #0
20000f86: 02 40        	ands	r2, r0

20000f88 <RCC_AHB3PeriphResetCmd>:
20000f88: 21 b1        	cbz	r1, 0x20000f94 <RCC_AHB3PeriphResetCmd+0xc> @ imm = #8
20000f8a: 05 4b        	ldr	r3, [pc, #20]           @ 0x20000fa0 <$d>
20000f8c: 9a 69        	ldr	r2, [r3, #24]
20000f8e: 10 43        	orrs	r0, r2
20000f90: 98 61        	str	r0, [r3, #24]
20000f92: 70 47        	bx	lr
20000f94: 02 4a        	ldr	r2, [pc, #8]            @ 0x20000fa0 <$d>
20000f96: 93 69        	ldr	r3, [r2, #24]
20000f98: 23 ea 00 00  	bic.w	r0, r3, r0
20000f9c: 90 61        	str	r0, [r2, #24]
20000f9e: 70 47        	bx	lr

20000fa0 <$d>:
20000fa0: 00 38        	subs	r0, #0
20000fa2: 02 40        	ands	r2, r0

20000fa4 <RCC_APB1PeriphResetCmd>:
20000fa4: 21 b1        	cbz	r1, 0x20000fb0 <RCC_APB1PeriphResetCmd+0xc> @ imm = #8
20000fa6: 05 4b        	ldr	r3, [pc, #20]           @ 0x20000fbc <$d>
20000fa8: 1a 6a        	ldr	r2, [r3, #32]
20000faa: 10 43        	orrs	r0, r2
20000fac: 18 62        	str	r0, [r3, #32]
20000fae: 70 47        	bx	lr
20000fb0: 02 4a        	ldr	r2, [pc, #8]            @ 0x20000fbc <$d>
20000fb2: 13 6a        	ldr	r3, [r2, #32]
20000fb4: 23 ea 00 00  	bic.w	r0, r3, r0
20000fb8: 10 62        	str	r0, [r2, #32]
20000fba: 70 47        	bx	lr

20000fbc <$d>:
20000fbc: 00 38        	subs	r0, #0
20000fbe: 02 40        	ands	r2, r0

20000fc0 <RCC_APB2PeriphResetCmd>:
20000fc0: 21 b1        	cbz	r1, 0x20000fcc <RCC_APB2PeriphResetCmd+0xc> @ imm = #8
20000fc2: 05 4b        	ldr	r3, [pc, #20]           @ 0x20000fd8 <$d>
20000fc4: 5a 6a        	ldr	r2, [r3, #36]
20000fc6: 10 43        	orrs	r0, r2
20000fc8: 58 62        	str	r0, [r3, #36]
20000fca: 70 47        	bx	lr
20000fcc: 02 4a        	ldr	r2, [pc, #8]            @ 0x20000fd8 <$d>
20000fce: 53 6a        	ldr	r3, [r2, #36]
20000fd0: 23 ea 00 00  	bic.w	r0, r3, r0
20000fd4: 50 62        	str	r0, [r2, #36]
20000fd6: 70 47        	bx	lr

20000fd8 <$d>:
20000fd8: 00 38        	subs	r0, #0
20000fda: 02 40        	ands	r2, r0

20000fdc <RCC_AHB1PeriphClockLPModeCmd>:
20000fdc: 21 b1        	cbz	r1, 0x20000fe8 <RCC_AHB1PeriphClockLPModeCmd+0xc> @ imm = #8
20000fde: 05 4b        	ldr	r3, [pc, #20]           @ 0x20000ff4 <$d>
20000fe0: 1a 6d        	ldr	r2, [r3, #80]
20000fe2: 10 43        	orrs	r0, r2
20000fe4: 18 65        	str	r0, [r3, #80]
20000fe6: 70 47        	bx	lr
20000fe8: 02 4a        	ldr	r2, [pc, #8]            @ 0x20000ff4 <$d>
20000fea: 13 6d        	ldr	r3, [r2, #80]
20000fec: 23 ea 00 00  	bic.w	r0, r3, r0
20000ff0: 10 65        	str	r0, [r2, #80]
20000ff2: 70 47        	bx	lr

20000ff4 <$d>:
20000ff4: 00 38        	subs	r0, #0
20000ff6: 02 40        	ands	r2, r0

20000ff8 <RCC_AHB2PeriphClockLPModeCmd>:
20000ff8: 21 b1        	cbz	r1, 0x20001004 <RCC_AHB2PeriphClockLPModeCmd+0xc> @ imm = #8
20000ffa: 05 4b        	ldr	r3, [pc, #20]           @ 0x20001010 <$d>
20000ffc: 5a 6d        	ldr	r2, [r3, #84]
20000ffe: 10 43        	orrs	r0, r2
20001000: 58 65        	str	r0, [r3, #84]
20001002: 70 47        	bx	lr
20001004: 02 4a        	ldr	r2, [pc, #8]            @ 0x20001010 <$d>
20001006: 53 6d        	ldr	r3, [r2, #84]
20001008: 23 ea 00 00  	bic.w	r0, r3, r0
2000100c: 50 65        	str	r0, [r2, #84]
2000100e: 70 47        	bx	lr

20001010 <$d>:
20001010: 00 38        	subs	r0, #0
20001012: 02 40        	ands	r2, r0

20001014 <RCC_AHB3PeriphClockLPModeCmd>:
20001014: 21 b1        	cbz	r1, 0x20001020 <RCC_AHB3PeriphClockLPModeCmd+0xc> @ imm = #8
20001016: 05 4b        	ldr	r3, [pc, #20]           @ 0x2000102c <$d>
20001018: 9a 6d        	ldr	r2, [r3, #88]
2000101a: 10 43        	orrs	r0, r2
2000101c: 98 65        	str	r0, [r3, #88]
2000101e: 70 47        	bx	lr
20001020: 02 4a        	ldr	r2, [pc, #8]            @ 0x2000102c <$d>
20001022: 93 6d        	ldr	r3, [r2, #88]
20001024: 23 ea 00 00  	bic.w	r0, r3, r0
20001028: 90 65        	str	r0, [r2, #88]
2000102a: 70 47        	bx	lr

2000102c <$d>:
2000102c: 00 38        	subs	r0, #0
2000102e: 02 40        	ands	r2, r0

20001030 <RCC_APB1PeriphClockLPModeCmd>:
20001030: 21 b1        	cbz	r1, 0x2000103c <RCC_APB1PeriphClockLPModeCmd+0xc> @ imm = #8
20001032: 05 4b        	ldr	r3, [pc, #20]           @ 0x20001048 <$d>
20001034: 1a 6e        	ldr	r2, [r3, #96]
20001036: 10 43        	orrs	r0, r2
20001038: 18 66        	str	r0, [r3, #96]
2000103a: 70 47        	bx	lr
2000103c: 02 4a        	ldr	r2, [pc, #8]            @ 0x20001048 <$d>
2000103e: 13 6e        	ldr	r3, [r2, #96]
20001040: 23 ea 00 00  	bic.w	r0, r3, r0
20001044: 10 66        	str	r0, [r2, #96]
20001046: 70 47        	bx	lr

20001048 <$d>:
20001048: 00 38        	subs	r0, #0
2000104a: 02 40        	ands	r2, r0

2000104c <RCC_APB2PeriphClockLPModeCmd>:
2000104c: 21 b1        	cbz	r1, 0x20001058 <RCC_APB2PeriphClockLPModeCmd+0xc> @ imm = #8
2000104e: 05 4b        	ldr	r3, [pc, #20]           @ 0x20001064 <$d>
20001050: 5a 6e        	ldr	r2, [r3, #100]
20001052: 10 43        	orrs	r0, r2
20001054: 58 66        	str	r0, [r3, #100]
20001056: 70 47        	bx	lr
20001058: 02 4a        	ldr	r2, [pc, #8]            @ 0x20001064 <$d>
2000105a: 53 6e        	ldr	r3, [r2, #100]
2000105c: 23 ea 00 00  	bic.w	r0, r3, r0
20001060: 50 66        	str	r0, [r2, #100]
20001062: 70 47        	bx	lr

20001064 <$d>:
20001064: 00 38        	subs	r0, #0
20001066: 02 40        	ands	r2, r0

20001068 <RCC_ITConfig>:
20001068: 21 b1        	cbz	r1, 0x20001074 <RCC_ITConfig+0xc> @ imm = #8
2000106a: 05 4b        	ldr	r3, [pc, #20]           @ 0x20001080 <$d>
2000106c: 1a 78        	ldrb	r2, [r3]
2000106e: 10 43        	orrs	r0, r2
20001070: 18 70        	strb	r0, [r3]
20001072: 70 47        	bx	lr
20001074: 02 4a        	ldr	r2, [pc, #8]            @ 0x20001080 <$d>
20001076: 13 78        	ldrb	r3, [r2]
20001078: 23 ea 00 00  	bic.w	r0, r3, r0
2000107c: 10 70        	strb	r0, [r2]
2000107e: 70 47        	bx	lr

20001080 <$d>:
20001080: 0d 38        	subs	r0, #13
20001082: 02 40        	ands	r2, r0

20001084 <RCC_GetFlagStatus>:
20001084: 43 09        	lsrs	r3, r0, #5
20001086: 01 2b        	cmp	r3, #1
20001088: 02 d1        	bne	0x20001090 <RCC_GetFlagStatus+0xc> @ imm = #4
2000108a: 0a 4b        	ldr	r3, [pc, #40]           @ 0x200010b4 <$d>
2000108c: 1b 68        	ldr	r3, [r3]
2000108e: 06 e0        	b	0x2000109e <RCC_GetFlagStatus+0x1a> @ imm = #12
20001090: 02 2b        	cmp	r3, #2
20001092: 02 d1        	bne	0x2000109a <RCC_GetFlagStatus+0x16> @ imm = #4
20001094: 07 4b        	ldr	r3, [pc, #28]           @ 0x200010b4 <$d>
20001096: 1b 6f        	ldr	r3, [r3, #112]
20001098: 01 e0        	b	0x2000109e <RCC_GetFlagStatus+0x1a> @ imm = #2
2000109a: 06 4b        	ldr	r3, [pc, #24]           @ 0x200010b4 <$d>
2000109c: 5b 6f        	ldr	r3, [r3, #116]
2000109e: 00 f0 1f 00  	and	r0, r0, #31
200010a2: c3 40        	lsrs	r3, r0
200010a4: 13 f0 01 0f  	tst.w	r3, #1
200010a8: 01 d0        	beq	0x200010ae <RCC_GetFlagStatus+0x2a> @ imm = #2
200010aa: 01 20        	movs	r0, #1
200010ac: 70 47        	bx	lr
200010ae: 00 20        	movs	r0, #0
200010b0: 70 47        	bx	lr
200010b2: 00 bf        	nop

200010b4 <$d>:
200010b4: 00 38        	subs	r0, #0
200010b6: 02 40        	ands	r2, r0

200010b8 <RCC_WaitForHSEStartUp>:
200010b8: 00 b5        	push	{lr}
200010ba: 83 b0        	sub	sp, #12
200010bc: 00 23        	movs	r3, #0
200010be: 01 93        	str	r3, [sp, #4]
200010c0: 31 20        	movs	r0, #49
200010c2: ff f7 df ff  	bl	0x20001084 <RCC_GetFlagStatus> @ imm = #-66
200010c6: 01 9b        	ldr	r3, [sp, #4]
200010c8: 01 33        	adds	r3, #1
200010ca: 01 93        	str	r3, [sp, #4]
200010cc: 01 9b        	ldr	r3, [sp, #4]
200010ce: b3 f5 a0 6f  	cmp.w	r3, #1280
200010d2: 01 d0        	beq	0x200010d8 <RCC_WaitForHSEStartUp+0x20> @ imm = #2
200010d4: 00 28        	cmp	r0, #0
200010d6: f3 d0        	beq	0x200010c0 <RCC_WaitForHSEStartUp+0x8> @ imm = #-26
200010d8: 31 20        	movs	r0, #49
200010da: ff f7 d3 ff  	bl	0x20001084 <RCC_GetFlagStatus> @ imm = #-90
200010de: 08 b1        	cbz	r0, 0x200010e4 <RCC_WaitForHSEStartUp+0x2c> @ imm = #2
200010e0: 01 20        	movs	r0, #1
200010e2: 00 e0        	b	0x200010e6 <RCC_WaitForHSEStartUp+0x2e> @ imm = #0
200010e4: 00 20        	movs	r0, #0
200010e6: 03 b0        	add	sp, #12
200010e8: 5d f8 04 fb  	ldr	pc, [sp], #4

200010ec <RCC_ClearFlag>:
200010ec: 02 4a        	ldr	r2, [pc, #8]            @ 0x200010f8 <$d>
200010ee: 53 6f        	ldr	r3, [r2, #116]
200010f0: 43 f0 80 73  	orr	r3, r3, #16777216
200010f4: 53 67        	str	r3, [r2, #116]
200010f6: 70 47        	bx	lr

200010f8 <$d>:
200010f8: 00 38        	subs	r0, #0
200010fa: 02 40        	ands	r2, r0

200010fc <RCC_GetITStatus>:
200010fc: 03 4b        	ldr	r3, [pc, #12]           @ 0x2000110c <$d>
200010fe: db 68        	ldr	r3, [r3, #12]
20001100: 03 42        	tst	r3, r0
20001102: 01 d0        	beq	0x20001108 <RCC_GetITStatus+0xc> @ imm = #2
20001104: 01 20        	movs	r0, #1
20001106: 70 47        	bx	lr
20001108: 00 20        	movs	r0, #0
2000110a: 70 47        	bx	lr

2000110c <$d>:
2000110c: 00 38        	subs	r0, #0
2000110e: 02 40        	ands	r2, r0

20001110 <RCC_ClearITPendingBit>:
20001110: 01 4b        	ldr	r3, [pc, #4]            @ 0x20001118 <$d>
20001112: 18 70        	strb	r0, [r3]
20001114: 70 47        	bx	lr
20001116: 00 bf        	nop

20001118 <$d>:
20001118: 0e 38        	subs	r0, #14
2000111a: 02 40        	ands	r2, r0

2000111c <GPIO_DeInit>:
2000111c: 08 b5        	push	{r3, lr}
2000111e: 37 4b        	ldr	r3, [pc, #220]          @ 0x200011fc <$d>
20001120: 98 42        	cmp	r0, r3
20001122: 08 d1        	bne	0x20001136 <GPIO_DeInit+0x1a> @ imm = #16
20001124: 01 20        	movs	r0, #1
20001126: 01 46        	mov	r1, r0
20001128: ff f7 12 ff  	bl	0x20000f50 <RCC_AHB1PeriphResetCmd> @ imm = #-476
2000112c: 01 20        	movs	r0, #1
2000112e: 00 21        	movs	r1, #0
20001130: ff f7 0e ff  	bl	0x20000f50 <RCC_AHB1PeriphResetCmd> @ imm = #-484
20001134: 08 bd        	pop	{r3, pc}
20001136: 32 4b        	ldr	r3, [pc, #200]          @ 0x20001200 <$d+0x4>
20001138: 98 42        	cmp	r0, r3
2000113a: 08 d1        	bne	0x2000114e <GPIO_DeInit+0x32> @ imm = #16
2000113c: 02 20        	movs	r0, #2
2000113e: 01 21        	movs	r1, #1
20001140: ff f7 06 ff  	bl	0x20000f50 <RCC_AHB1PeriphResetCmd> @ imm = #-500
20001144: 02 20        	movs	r0, #2
20001146: 00 21        	movs	r1, #0
20001148: ff f7 02 ff  	bl	0x20000f50 <RCC_AHB1PeriphResetCmd> @ imm = #-508
2000114c: 08 bd        	pop	{r3, pc}
2000114e: 2d 4b        	ldr	r3, [pc, #180]          @ 0x20001204 <$d+0x8>
20001150: 98 42        	cmp	r0, r3
20001152: 08 d1        	bne	0x20001166 <GPIO_DeInit+0x4a> @ imm = #16
20001154: 04 20        	movs	r0, #4
20001156: 01 21        	movs	r1, #1
20001158: ff f7 fa fe  	bl	0x20000f50 <RCC_AHB1PeriphResetCmd> @ imm = #-524
2000115c: 04 20        	movs	r0, #4
2000115e: 00 21        	movs	r1, #0
20001160: ff f7 f6 fe  	bl	0x20000f50 <RCC_AHB1PeriphResetCmd> @ imm = #-532
20001164: 08 bd        	pop	{r3, pc}
20001166: 28 4b        	ldr	r3, [pc, #160]          @ 0x20001208 <$d+0xc>
20001168: 98 42        	cmp	r0, r3
2000116a: 08 d1        	bne	0x2000117e <GPIO_DeInit+0x62> @ imm = #16
2000116c: 08 20        	movs	r0, #8
2000116e: 01 21        	movs	r1, #1
20001170: ff f7 ee fe  	bl	0x20000f50 <RCC_AHB1PeriphResetCmd> @ imm = #-548
20001174: 08 20        	movs	r0, #8
20001176: 00 21        	movs	r1, #0
20001178: ff f7 ea fe  	bl	0x20000f50 <RCC_AHB1PeriphResetCmd> @ imm = #-556
2000117c: 08 bd        	pop	{r3, pc}
2000117e: 23 4b        	ldr	r3, [pc, #140]          @ 0x2000120c <$d+0x10>
20001180: 98 42        	cmp	r0, r3
20001182: 08 d1        	bne	0x20001196 <GPIO_DeInit+0x7a> @ imm = #16
20001184: 10 20        	movs	r0, #16
20001186: 01 21        	movs	r1, #1
20001188: ff f7 e2 fe  	bl	0x20000f50 <RCC_AHB1PeriphResetCmd> @ imm = #-572
2000118c: 10 20        	movs	r0, #16
2000118e: 00 21        	movs	r1, #0
20001190: ff f7 de fe  	bl	0x20000f50 <RCC_AHB1PeriphResetCmd> @ imm = #-580
20001194: 08 bd        	pop	{r3, pc}
20001196: 1e 4b        	ldr	r3, [pc, #120]          @ 0x20001210 <$d+0x14>
20001198: 98 42        	cmp	r0, r3
2000119a: 08 d1        	bne	0x200011ae <GPIO_DeInit+0x92> @ imm = #16
2000119c: 20 20        	movs	r0, #32
2000119e: 01 21        	movs	r1, #1
200011a0: ff f7 d6 fe  	bl	0x20000f50 <RCC_AHB1PeriphResetCmd> @ imm = #-596
200011a4: 20 20        	movs	r0, #32
200011a6: 00 21        	movs	r1, #0
200011a8: ff f7 d2 fe  	bl	0x20000f50 <RCC_AHB1PeriphResetCmd> @ imm = #-604
200011ac: 08 bd        	pop	{r3, pc}
200011ae: 19 4b        	ldr	r3, [pc, #100]          @ 0x20001214 <$d+0x18>
200011b0: 98 42        	cmp	r0, r3
200011b2: 08 d1        	bne	0x200011c6 <GPIO_DeInit+0xaa> @ imm = #16
200011b4: 40 20        	movs	r0, #64
200011b6: 01 21        	movs	r1, #1
200011b8: ff f7 ca fe  	bl	0x20000f50 <RCC_AHB1PeriphResetCmd> @ imm = #-620
200011bc: 40 20        	movs	r0, #64
200011be: 00 21        	movs	r1, #0
200011c0: ff f7 c6 fe  	bl	0x20000f50 <RCC_AHB1PeriphResetCmd> @ imm = #-628
200011c4: 08 bd        	pop	{r3, pc}
200011c6: 14 4b        	ldr	r3, [pc, #80]           @ 0x20001218 <$d+0x1c>
200011c8: 98 42        	cmp	r0, r3
200011ca: 08 d1        	bne	0x200011de <GPIO_DeInit+0xc2> @ imm = #16
200011cc: 80 20        	movs	r0, #128
200011ce: 01 21        	movs	r1, #1
200011d0: ff f7 be fe  	bl	0x20000f50 <RCC_AHB1PeriphResetCmd> @ imm = #-644
200011d4: 80 20        	movs	r0, #128
200011d6: 00 21        	movs	r1, #0
200011d8: ff f7 ba fe  	bl	0x20000f50 <RCC_AHB1PeriphResetCmd> @ imm = #-652
200011dc: 08 bd        	pop	{r3, pc}
200011de: 0f 4b        	ldr	r3, [pc, #60]           @ 0x2000121c <$d+0x20>
200011e0: 98 42        	cmp	r0, r3
200011e2: 09 d1        	bne	0x200011f8 <GPIO_DeInit+0xdc> @ imm = #18
200011e4: 4f f4 80 70  	mov.w	r0, #256
200011e8: 01 21        	movs	r1, #1
200011ea: ff f7 b1 fe  	bl	0x20000f50 <RCC_AHB1PeriphResetCmd> @ imm = #-670
200011ee: 4f f4 80 70  	mov.w	r0, #256
200011f2: 00 21        	movs	r1, #0
200011f4: ff f7 ac fe  	bl	0x20000f50 <RCC_AHB1PeriphResetCmd> @ imm = #-680
200011f8: 08 bd        	pop	{r3, pc}
200011fa: 00 bf        	nop

200011fc <$d>:
200011fc: 00 00        	movs	r0, r0
200011fe: 02 40        	ands	r2, r0
20001200: 00 04        	lsls	r0, r0, #16
20001202: 02 40        	ands	r2, r0
20001204: 00 08        	lsrs	r0, r0, #32
20001206: 02 40        	ands	r2, r0
20001208: 00 0c        	lsrs	r0, r0, #16
2000120a: 02 40        	ands	r2, r0
2000120c: 00 10        	asrs	r0, r0, #32
2000120e: 02 40        	ands	r2, r0
20001210: 00 14        	asrs	r0, r0, #16
20001212: 02 40        	ands	r2, r0
20001214: 00 18        	adds	r0, r0, r0
20001216: 02 40        	ands	r2, r0
20001218: 00 1c        	adds	r0, r0, #0
2000121a: 02 40        	ands	r2, r0
2000121c: 00 20        	movs	r0, #0
2000121e: 02 40        	ands	r2, r0

20001220 <GPIO_Init>:
20001220: 70 b4        	push	{r4, r5, r6}
20001222: 00 22        	movs	r2, #0
20001224: 39 e0        	b	0x2000129a <GPIO_Init+0x7a> @ imm = #114
20001226: 01 23        	movs	r3, #1
20001228: 93 40        	lsls	r3, r2
2000122a: 0c 68        	ldr	r4, [r1]
2000122c: 1c 40        	ands	r4, r3
2000122e: 9c 42        	cmp	r4, r3
20001230: 32 d1        	bne	0x20001298 <GPIO_Init+0x78> @ imm = #100
20001232: 04 68        	ldr	r4, [r0]
20001234: 55 00        	lsls	r5, r2, #1
20001236: 03 23        	movs	r3, #3
20001238: ab 40        	lsls	r3, r5
2000123a: db 43        	mvns	r3, r3
2000123c: 1c 40        	ands	r4, r3
2000123e: 04 60        	str	r4, [r0]
20001240: 06 68        	ldr	r6, [r0]
20001242: 0c 79        	ldrb	r4, [r1, #4]
20001244: ac 40        	lsls	r4, r5
20001246: 34 43        	orrs	r4, r6
20001248: 04 60        	str	r4, [r0]
2000124a: 0c 79        	ldrb	r4, [r1, #4]
2000124c: 01 3c        	subs	r4, #1
2000124e: e4 b2        	uxtb	r4, r4
20001250: 01 2c        	cmp	r4, #1
20001252: 14 d8        	bhi	0x2000127e <GPIO_Init+0x5e> @ imm = #40
20001254: 84 68        	ldr	r4, [r0, #8]
20001256: 23 40        	ands	r3, r4
20001258: 83 60        	str	r3, [r0, #8]
2000125a: 84 68        	ldr	r4, [r0, #8]
2000125c: 4b 79        	ldrb	r3, [r1, #5]
2000125e: ab 40        	lsls	r3, r5
20001260: 23 43        	orrs	r3, r4
20001262: 83 60        	str	r3, [r0, #8]
20001264: 44 68        	ldr	r4, [r0, #4]
20001266: 96 b2        	uxth	r6, r2
20001268: 01 23        	movs	r3, #1
2000126a: b3 40        	lsls	r3, r6
2000126c: 24 ea 03 03  	bic.w	r3, r4, r3
20001270: 43 60        	str	r3, [r0, #4]
20001272: 44 68        	ldr	r4, [r0, #4]
20001274: 8b 79        	ldrb	r3, [r1, #6]
20001276: b3 40        	lsls	r3, r6
20001278: 9b b2        	uxth	r3, r3
2000127a: 23 43        	orrs	r3, r4
2000127c: 43 60        	str	r3, [r0, #4]
2000127e: c4 68        	ldr	r4, [r0, #12]
20001280: 96 b2        	uxth	r6, r2
20001282: 76 00        	lsls	r6, r6, #1
20001284: 03 23        	movs	r3, #3
20001286: b3 40        	lsls	r3, r6
20001288: 24 ea 03 03  	bic.w	r3, r4, r3
2000128c: c3 60        	str	r3, [r0, #12]
2000128e: c4 68        	ldr	r4, [r0, #12]
20001290: cb 79        	ldrb	r3, [r1, #7]
20001292: ab 40        	lsls	r3, r5
20001294: 23 43        	orrs	r3, r4
20001296: c3 60        	str	r3, [r0, #12]
20001298: 01 32        	adds	r2, #1
2000129a: 0f 2a        	cmp	r2, #15
2000129c: c3 d9        	bls	0x20001226 <GPIO_Init+0x6> @ imm = #-122
2000129e: 70 bc        	pop	{r4, r5, r6}
200012a0: 70 47        	bx	lr
200012a2: 00 bf        	nop

200012a4 <GPIO_StructInit>:
200012a4: 4f f6 ff 73  	movw	r3, #65535
200012a8: 03 60        	str	r3, [r0]
200012aa: 00 23        	movs	r3, #0
200012ac: 03 71        	strb	r3, [r0, #4]
200012ae: 43 71        	strb	r3, [r0, #5]
200012b0: 83 71        	strb	r3, [r0, #6]
200012b2: c3 71        	strb	r3, [r0, #7]
200012b4: 70 47        	bx	lr
200012b6: 00 bf        	nop

200012b8 <GPIO_PinLockConfig>:
200012b8: 82 b0        	sub	sp, #8
200012ba: 4f f4 80 33  	mov.w	r3, #65536
200012be: 01 93        	str	r3, [sp, #4]
200012c0: 01 9b        	ldr	r3, [sp, #4]
200012c2: 0b 43        	orrs	r3, r1
200012c4: 01 93        	str	r3, [sp, #4]
200012c6: 01 9b        	ldr	r3, [sp, #4]
200012c8: c3 61        	str	r3, [r0, #28]
200012ca: c1 61        	str	r1, [r0, #28]
200012cc: 01 9b        	ldr	r3, [sp, #4]
200012ce: c3 61        	str	r3, [r0, #28]
200012d0: c3 69        	ldr	r3, [r0, #28]
200012d2: 01 93        	str	r3, [sp, #4]
200012d4: c3 69        	ldr	r3, [r0, #28]
200012d6: 01 93        	str	r3, [sp, #4]
200012d8: 02 b0        	add	sp, #8
200012da: 70 47        	bx	lr

200012dc <GPIO_ReadInputDataBit>:
200012dc: 03 69        	ldr	r3, [r0, #16]
200012de: 0b 42        	tst	r3, r1
200012e0: 01 d0        	beq	0x200012e6 <GPIO_ReadInputDataBit+0xa> @ imm = #2
200012e2: 01 20        	movs	r0, #1
200012e4: 70 47        	bx	lr
200012e6: 00 20        	movs	r0, #0
200012e8: 70 47        	bx	lr
200012ea: 00 bf        	nop

200012ec <GPIO_ReadInputData>:
200012ec: 00 69        	ldr	r0, [r0, #16]
200012ee: 80 b2        	uxth	r0, r0
200012f0: 70 47        	bx	lr
200012f2: 00 bf        	nop

200012f4 <GPIO_ReadOutputDataBit>:
200012f4: 43 69        	ldr	r3, [r0, #20]
200012f6: 0b 42        	tst	r3, r1
200012f8: 01 d0        	beq	0x200012fe <GPIO_ReadOutputDataBit+0xa> @ imm = #2
200012fa: 01 20        	movs	r0, #1
200012fc: 70 47        	bx	lr
200012fe: 00 20        	movs	r0, #0
20001300: 70 47        	bx	lr
20001302: 00 bf        	nop

20001304 <GPIO_ReadOutputData>:
20001304: 40 69        	ldr	r0, [r0, #20]
20001306: 80 b2        	uxth	r0, r0
20001308: 70 47        	bx	lr
2000130a: 00 bf        	nop

2000130c <GPIO_SetBits>:
2000130c: 01 83        	strh	r1, [r0, #24]
2000130e: 70 47        	bx	lr

20001310 <GPIO_ResetBits>:
20001310: 41 83        	strh	r1, [r0, #26]
20001312: 70 47        	bx	lr

20001314 <GPIO_WriteBit>:
20001314: 0a b1        	cbz	r2, 0x2000131a <GPIO_WriteBit+0x6> @ imm = #2
20001316: 01 83        	strh	r1, [r0, #24]
20001318: 70 47        	bx	lr
2000131a: 41 83        	strh	r1, [r0, #26]
2000131c: 70 47        	bx	lr
2000131e: 00 bf        	nop

20001320 <GPIO_Write>:
20001320: 41 61        	str	r1, [r0, #20]
20001322: 70 47        	bx	lr

20001324 <GPIO_ToggleBits>:
20001324: 43 69        	ldr	r3, [r0, #20]
20001326: 59 40        	eors	r1, r3
20001328: 41 61        	str	r1, [r0, #20]
2000132a: 70 47        	bx	lr

2000132c <GPIO_PinAFConfig>:
2000132c: 30 b4        	push	{r4, r5}
2000132e: 01 f0 07 03  	and	r3, r1, #7
20001332: 9b 00        	lsls	r3, r3, #2
20001334: 9a 40        	lsls	r2, r3
20001336: c9 08        	lsrs	r1, r1, #3
20001338: 08 31        	adds	r1, #8
2000133a: 50 f8 21 40  	ldr.w	r4, [r0, r1, lsl #2]
2000133e: 0f 25        	movs	r5, #15
20001340: 05 fa 03 f3  	lsl.w	r3, r5, r3
20001344: 24 ea 03 03  	bic.w	r3, r4, r3
20001348: 40 f8 21 30  	str.w	r3, [r0, r1, lsl #2]
2000134c: 50 f8 21 30  	ldr.w	r3, [r0, r1, lsl #2]
20001350: 1a 43        	orrs	r2, r3
20001352: 40 f8 21 20  	str.w	r2, [r0, r1, lsl #2]
20001356: 30 bc        	pop	{r4, r5}
20001358: 70 47        	bx	lr
2000135a: 00 bf        	nop

Disassembly of section .data:

2000135c <APBAHBPrescTable>:
2000135c: 00 00        	movs	r0, r0
2000135e: 00 00        	movs	r0, r0
20001360: 01 02        	lsls	r1, r0, #8
20001362: 03 04        	lsls	r3, r0, #16
20001364: 01 02        	lsls	r1, r0, #8
20001366: 03 04        	lsls	r3, r0, #16
20001368: 06 07        	lsls	r6, r0, #28
2000136a: 08 09        	lsrs	r0, r1, #4

Disassembly of section .bss:

2000136c <NextBufferLength>:
...

20001370 <NextBufferSamples>:
...

20001374 <BufferNumber>:
...

20001378 <DMARunning>:
...

2000137c <CallbackFunction>:
...

20001380 <CallbackContext>:
...

Disassembly of section .debug_info:

00000000 <.debug_info>:
       0: 28 11        	asrs	r0, r5, #4
       2: 00 00        	movs	r0, r0
       4: 04 00        	movs	r4, r0
       6: 00 00        	movs	r0, r0
       8: 00 00        	movs	r0, r0
       a: 04 01        	lsls	r4, r0, #4
       c: d8 06        	lsls	r0, r3, #27
       e: 00 00        	movs	r0, r0
      10: 01 41        	asrs	r1, r0
      12: 03 00        	movs	r3, r0
      14: 00 68        	ldr	r0, [r0]
      16: 0a 00        	movs	r2, r1
		...
      24: 00 02        	lsls	r0, r0, #8
      26: 01 06        	lsls	r1, r0, #24
      28: 05 03        	lsls	r5, r0, #12
      2a: 00 00        	movs	r0, r0
      2c: 03 89        	ldrh	r3, [r0, #8]
      2e: 01 00        	movs	r1, r0
      30: 00 03        	lsls	r0, r0, #12
      32: 1d 37        	adds	r7, #29
      34: 00 00        	movs	r0, r0
      36: 00 02        	lsls	r0, r0, #8
      38: 01 08        	lsrs	r1, r0, #32
      3a: 03 03        	lsls	r3, r0, #12
      3c: 00 00        	movs	r0, r0
      3e: 03 22        	movs	r2, #3
      40: 0a 00        	movs	r2, r1
      42: 00 03        	lsls	r0, r0, #12
      44: 29 49        	ldr	r1, [pc, #164]          @ 0xec <.debug_info+0xec>
      46: 00 00        	movs	r0, r0
      48: 00 02        	lsls	r0, r0, #8
      4a: 02 05        	lsls	r2, r0, #20
      4c: 4c 0b        	lsrs	r4, r1, #13
      4e: 00 00        	movs	r0, r0
      50: 03 fd 03 00  	stc2	p0, c0, [r3, #-12]
      54: 00 03        	lsls	r0, r0, #12
      56: 2b 5b        	ldrh	r3, [r5, r4]
      58: 00 00        	movs	r0, r0
      5a: 00 02        	lsls	r0, r0, #8
      5c: 02 07        	lsls	r2, r0, #28
      5e: 09 0d        	lsrs	r1, r1, #20
      60: 00 00        	movs	r0, r0
      62: 03 82        	strh	r3, [r0, #16]
      64: 0d 00        	movs	r5, r1
      66: 00 03        	lsls	r0, r0, #12
      68: 3f 6d        	ldr	r7, [r7, #80]
      6a: 00 00        	movs	r0, r0
      6c: 00 02        	lsls	r0, r0, #8
      6e: 04 05        	lsls	r4, r0, #20
      70: cf 06        	lsls	r7, r1, #27
      72: 00 00        	movs	r0, r0
      74: 03 b5        	push	{r0, r1, lr}
      76: 06 00        	movs	r6, r0
      78: 00 03        	lsls	r0, r0, #12
      7a: 41 7f        	ldrb	r1, [r0, #29]
      7c: 00 00        	movs	r0, r0
      7e: 00 02        	lsls	r0, r0, #8
      80: 04 07        	lsls	r4, r0, #28
      82: 8f 09        	lsrs	r7, r1, #6
      84: 00 00        	movs	r0, r0
      86: 02 08        	lsrs	r2, r0, #32
      88: 05 ca        	ldm	r2, {r0, r2}
      8a: 06 00        	movs	r6, r0
      8c: 00 02        	lsls	r0, r0, #8
      8e: 08 07        	lsls	r0, r1, #28
      90: 8a 09        	lsrs	r2, r1, #6
      92: 00 00        	movs	r0, r0
      94: 04 04        	lsls	r4, r0, #16
      96: 05 69        	ldr	r5, [r0, #16]
      98: 6e 74        	strb	r6, [r5, #17]
      9a: 00 02        	lsls	r0, r0, #8
      9c: 04 07        	lsls	r4, r0, #28
      9e: 94 09        	lsrs	r4, r2, #6
      a0: 00 00        	movs	r0, r0
      a2: 05 04        	lsls	r5, r0, #16
      a4: 02 04        	lsls	r2, r0, #16
      a6: 07 47        	bx	r0
      a8: 00 00        	movs	r0, r0
      aa: 00 06        	lsls	r0, r0, #24
      ac: 04 37        	adds	r7, #4
      ae: 00 00        	movs	r0, r0
      b0: 00 02        	lsls	r0, r0, #8
      b2: 01 08        	lsrs	r1, r0, #32
      b4: 0c 03        	lsls	r4, r1, #12
      b6: 00 00        	movs	r0, r0
      b8: 06 04        	lsls	r6, r0, #16
      ba: be 00        	lsls	r6, r7, #2
      bc: 00 00        	movs	r0, r0
      be: 07 b1        	cbz	r7, 0xc2 <.debug_info+0xc2> @ imm = #0
      c0: 00 00        	movs	r0, r0
      c2: 00 03        	lsls	r0, r0, #12
      c4: 8b 01        	lsls	r3, r1, #6
      c6: 00 00        	movs	r0, r0
      c8: 04 14        	asrs	r4, r0, #16
      ca: 2c 00        	movs	r4, r5
      cc: 00 00        	movs	r0, r0
      ce: 03 24        	movs	r4, #3
      d0: 0a 00        	movs	r2, r1
      d2: 00 04        	lsls	r0, r0, #16
      d4: 19 3e        	subs	r6, #25
      d6: 00 00        	movs	r0, r0
      d8: 00 03        	lsls	r0, r0, #12
      da: ff 03        	lsls	r7, r7, #15
      dc: 00 00        	movs	r0, r0
      de: 04 1a        	subs	r4, r0, r0
      e0: 50 00        	lsls	r0, r2, #1
      e2: 00 00        	movs	r0, r0
      e4: 03 84        	strh	r3, [r0, #32]
      e6: 0d 00        	movs	r5, r1
      e8: 00 04        	lsls	r0, r0, #16
      ea: 1f 62        	str	r7, [r3, #32]
      ec: 00 00        	movs	r0, r0
      ee: 00 03        	lsls	r0, r0, #12
      f0: b7 06        	lsls	r7, r6, #26
      f2: 00 00        	movs	r0, r0
      f4: 04 20        	movs	r0, #4
      f6: 74 00        	lsls	r4, r6, #1
      f8: 00 00        	movs	r0, r0
      fa: 02 08        	lsrs	r2, r0, #32
      fc: 04 18        	adds	r4, r0, r0
      fe: 09 00        	movs	r1, r1
     100: 00 02        	lsls	r0, r0, #8
     102: 04 04        	lsls	r4, r0, #16
     104: 53 08        	lsrs	r3, r2, #1
     106: 00 00        	movs	r0, r0
     108: 02 08        	lsrs	r2, r0, #32
     10a: 04 13        	asrs	r4, r0, #12
     10c: 09 00        	movs	r1, r1
     10e: 00 08        	lsrs	r0, r0, #32
     110: f0 0b        	lsrs	r0, r6, #15
     112: 00 00        	movs	r0, r0
     114: 01 05        	lsls	r1, r0, #20
     116: 91 4a        	ldr	r2, [pc, #580]          @ 0x35c <.debug_info+0x35c>
     118: 03 00        	movs	r3, r0
     11a: 00 09        	lsrs	r0, r0, #4
     11c: 8b 05        	lsls	r3, r1, #22
     11e: 00 00        	movs	r0, r0
     120: 72 09        	lsrs	r2, r6, #5
     122: b7 05        	lsls	r7, r6, #22
     124: 00 00        	movs	r0, r0
     126: 74 09        	lsrs	r4, r6, #5
     128: 78 06        	lsls	r0, r7, #25
     12a: 00 00        	movs	r0, r0
     12c: 75 09        	lsrs	r5, r6, #5
     12e: a9 03        	lsls	r1, r5, #14
     130: 00 00        	movs	r0, r0
     132: 76 09        	lsrs	r6, r6, #5
     134: 08 08        	lsrs	r0, r1, #32
     136: 00 00        	movs	r0, r0
     138: 7b 09        	lsrs	r3, r7, #5
     13a: fa 0a        	lsrs	r2, r7, #11
     13c: 00 00        	movs	r0, r0
     13e: 7c 09        	lsrs	r4, r7, #5
     140: 51 0d        	lsrs	r1, r2, #21
     142: 00 00        	movs	r0, r0
     144: 7e 09        	lsrs	r6, r7, #5
     146: 81 02        	lsls	r1, r0, #10
     148: 00 00        	movs	r0, r0
     14a: 7f 09        	lsrs	r7, r7, #5
     14c: 9f 05        	lsls	r7, r3, #22
     14e: 00 00        	movs	r0, r0
     150: 00 09        	lsrs	r0, r0, #4
     152: 4d 0a        	lsrs	r5, r1, #9
     154: 00 00        	movs	r0, r0
     156: 01 09        	lsrs	r1, r0, #4
     158: dd 05        	lsls	r5, r3, #23
     15a: 00 00        	movs	r0, r0
     15c: 02 09        	lsrs	r2, r0, #4
     15e: 09 00        	movs	r1, r1
     160: 00 00        	movs	r0, r0
     162: 03 09        	lsrs	r3, r0, #4
     164: e6 00        	lsls	r6, r4, #3
     166: 00 00        	movs	r0, r0
     168: 04 09        	lsrs	r4, r0, #4
     16a: 63 0b        	lsrs	r3, r4, #13
     16c: 00 00        	movs	r0, r0
     16e: 05 09        	lsrs	r5, r0, #4
     170: 9f 0a        	lsrs	r7, r3, #10
     172: 00 00        	movs	r0, r0
     174: 06 09        	lsrs	r6, r0, #4
     176: 2b 05        	lsls	r3, r5, #20
     178: 00 00        	movs	r0, r0
     17a: 07 09        	lsrs	r7, r0, #4
     17c: 17 00        	movs	r7, r2
     17e: 00 00        	movs	r0, r0
     180: 08 09        	lsrs	r0, r1, #4
     182: 46 0d        	lsrs	r6, r0, #21
     184: 00 00        	movs	r0, r0
     186: 09 09        	lsrs	r1, r1, #4
     188: fe 0c        	lsrs	r6, r7, #19
     18a: 00 00        	movs	r0, r0
     18c: 0a 09        	lsrs	r2, r1, #4
     18e: 1f 09        	lsrs	r7, r3, #4
     190: 00 00        	movs	r0, r0
     192: 0b 09        	lsrs	r3, r1, #4
     194: d5 08        	lsrs	r5, r2, #3
     196: 00 00        	movs	r0, r0
     198: 0c 09        	lsrs	r4, r1, #4
     19a: c6 02        	lsls	r6, r0, #11
     19c: 00 00        	movs	r0, r0
     19e: 0d 09        	lsrs	r5, r1, #4
     1a0: 99 0b        	lsrs	r1, r3, #14
     1a2: 00 00        	movs	r0, r0
     1a4: 0e 09        	lsrs	r6, r1, #4
     1a6: af 0a        	lsrs	r7, r5, #10
     1a8: 00 00        	movs	r0, r0
     1aa: 0f 09        	lsrs	r7, r1, #4
     1ac: 43 05        	lsls	r3, r0, #21
     1ae: 00 00        	movs	r0, r0
     1b0: 10 09        	lsrs	r0, r2, #4
     1b2: 22 00        	movs	r2, r4
     1b4: 00 00        	movs	r0, r0
     1b6: 11 09        	lsrs	r1, r2, #4
     1b8: fb 09        	lsrs	r3, r7, #7
     1ba: 00 00        	movs	r0, r0
     1bc: 12 09        	lsrs	r2, r2, #4
     1be: 36 05        	lsls	r6, r6, #20
     1c0: 00 00        	movs	r0, r0
     1c2: 13 09        	lsrs	r3, r2, #4
     1c4: 08 04        	lsls	r0, r1, #16
     1c6: 00 00        	movs	r0, r0
     1c8: 14 09        	lsrs	r4, r2, #4
     1ca: 8c 0c        	lsrs	r4, r1, #18
     1cc: 00 00        	movs	r0, r0
     1ce: 15 09        	lsrs	r5, r2, #4
     1d0: ed 05        	lsls	r5, r5, #23
     1d2: 00 00        	movs	r0, r0
     1d4: 16 09        	lsrs	r6, r2, #4
     1d6: c1 0c        	lsrs	r1, r0, #19
     1d8: 00 00        	movs	r0, r0
     1da: 17 09        	lsrs	r7, r2, #4
     1dc: 97 06        	lsls	r7, r2, #26
     1de: 00 00        	movs	r0, r0
     1e0: 18 09        	lsrs	r0, r3, #4
     1e2: e2 0b        	lsrs	r2, r4, #15
     1e4: 00 00        	movs	r0, r0
     1e6: 19 09        	lsrs	r1, r3, #4
     1e8: 35 02        	lsls	r5, r6, #8
     1ea: 00 00        	movs	r0, r0
     1ec: 1a 09        	lsrs	r2, r3, #4
     1ee: 10 05        	lsls	r0, r2, #20
     1f0: 00 00        	movs	r0, r0
     1f2: 1b 09        	lsrs	r3, r3, #4
     1f4: 26 01        	lsls	r6, r4, #4
     1f6: 00 00        	movs	r0, r0
     1f8: 1c 09        	lsrs	r4, r3, #4
     1fa: b0 09        	lsrs	r0, r6, #6
     1fc: 00 00        	movs	r0, r0
     1fe: 1d 09        	lsrs	r5, r3, #4
     200: 65 04        	lsls	r5, r4, #17
     202: 00 00        	movs	r0, r0
     204: 1e 09        	lsrs	r6, r3, #4
     206: bb 04        	lsls	r3, r7, #18
     208: 00 00        	movs	r0, r0
     20a: 1f 09        	lsrs	r7, r3, #4
     20c: 70 03        	lsls	r0, r6, #13
     20e: 00 00        	movs	r0, r0
     210: 20 09        	lsrs	r0, r4, #4
     212: a8 08        	lsrs	r0, r5, #2
     214: 00 00        	movs	r0, r0
     216: 21 09        	lsrs	r1, r4, #4
     218: 63 06        	lsls	r3, r4, #25
     21a: 00 00        	movs	r0, r0
     21c: 22 09        	lsrs	r2, r4, #4
     21e: f6 07        	lsls	r6, r6, #31
     220: 00 00        	movs	r0, r0
     222: 23 09        	lsrs	r3, r4, #4
     224: a4 01        	lsls	r4, r4, #6
     226: 00 00        	movs	r0, r0
     228: 24 09        	lsrs	r4, r4, #4
     22a: ba 09        	lsrs	r2, r7, #6
     22c: 00 00        	movs	r0, r0
     22e: 25 09        	lsrs	r5, r4, #4
     230: 6f 04        	lsls	r7, r5, #17
     232: 00 00        	movs	r0, r0
     234: 26 09        	lsrs	r6, r4, #4
     236: 8e 02        	lsls	r6, r1, #10
     238: 00 00        	movs	r0, r0
     23a: 27 09        	lsrs	r7, r4, #4
     23c: 7b 09        	lsrs	r3, r7, #5
     23e: 00 00        	movs	r0, r0
     240: 28 09        	lsrs	r0, r5, #4
     242: 3b 09        	lsrs	r3, r7, #4
     244: 00 00        	movs	r0, r0
     246: 29 09        	lsrs	r1, r5, #4
     248: 59 08        	lsrs	r1, r3, #1
     24a: 00 00        	movs	r0, r0
     24c: 2a 09        	lsrs	r2, r5, #4
     24e: ae 01        	lsls	r6, r5, #6
     250: 00 00        	movs	r0, r0
     252: 2b 09        	lsrs	r3, r5, #4
     254: 34 00        	movs	r4, r6
     256: 00 00        	movs	r0, r0
     258: 2c 09        	lsrs	r4, r5, #4
     25a: 55 05        	lsls	r5, r2, #21
     25c: 00 00        	movs	r0, r0
     25e: 2d 09        	lsrs	r5, r5, #4
     260: 1c 0d        	lsrs	r4, r3, #20
     262: 00 00        	movs	r0, r0
     264: 2e 09        	lsrs	r6, r5, #4
     266: 70 0d        	lsrs	r0, r6, #21
     268: 00 00        	movs	r0, r0
     26a: 2f 09        	lsrs	r7, r5, #4
     26c: 95 0a        	lsrs	r5, r2, #10
     26e: 00 00        	movs	r0, r0
     270: 30 09        	lsrs	r0, r6, #4
     272: 29 0d        	lsrs	r1, r5, #20
     274: 00 00        	movs	r0, r0
     276: 31 09        	lsrs	r1, r6, #4
     278: 9f 03        	lsls	r7, r3, #14
     27a: 00 00        	movs	r0, r0
     27c: 32 09        	lsrs	r2, r6, #4
     27e: d3 00        	lsls	r3, r2, #3
     280: 00 00        	movs	r0, r0
     282: 33 09        	lsrs	r3, r6, #4
     284: 48 08        	lsrs	r0, r1, #1
     286: 00 00        	movs	r0, r0
     288: 34 09        	lsrs	r4, r6, #4
     28a: 8c 06        	lsls	r4, r1, #26
     28c: 00 00        	movs	r0, r0
     28e: 35 09        	lsrs	r5, r6, #4
     290: 6f 08        	lsrs	r7, r5, #1
     292: 00 00        	movs	r0, r0
     294: 36 09        	lsrs	r6, r6, #4
     296: c0 06        	lsls	r0, r0, #27
     298: 00 00        	movs	r0, r0
     29a: 37 09        	lsrs	r7, r6, #4
     29c: 12 06        	lsls	r2, r2, #24
     29e: 00 00        	movs	r0, r0
     2a0: 38 09        	lsrs	r0, r7, #4
     2a2: 97 00        	lsls	r7, r2, #2
     2a4: 00 00        	movs	r0, r0
     2a6: 39 09        	lsrs	r1, r7, #4
     2a8: c0 0d        	lsrs	r0, r0, #23
     2aa: 00 00        	movs	r0, r0
     2ac: 3a 09        	lsrs	r2, r7, #4
     2ae: e7 08        	lsrs	r7, r4, #3
     2b0: 00 00        	movs	r0, r0
     2b2: 3b 09        	lsrs	r3, r7, #4
     2b4: 11 03        	lsls	r1, r2, #12
     2b6: 00 00        	movs	r0, r0
     2b8: 3c 09        	lsrs	r4, r7, #4
     2ba: 2c 0b        	lsrs	r4, r5, #12
     2bc: 00 00        	movs	r0, r0
     2be: 3d 09        	lsrs	r5, r7, #4
     2c0: c0 07        	lsls	r0, r0, #31
     2c2: 00 00        	movs	r0, r0
     2c4: 3e 09        	lsrs	r6, r7, #4
     2c6: f9 08        	lsrs	r1, r7, #3
     2c8: 00 00        	movs	r0, r0
     2ca: 3f 09        	lsrs	r7, r7, #4
     2cc: 6f 01        	lsls	r7, r5, #5
     2ce: 00 00        	movs	r0, r0
     2d0: c0 00        	lsls	r0, r0, #3
     2d2: 09 ed 09 00  	stc	p0, c0, [r9, #-36]
     2d6: 00           	<unknown>
     2d7: c1 00        	lsls	r1, r0, #3
     2d9: 09 7d        	ldrb	r1, [r1, #20]
     2db: 03 00        	movs	r3, r0
     2dd: 00           	<unknown>
     2de: c2 00        	lsls	r2, r0, #3
     2e0: 09 7f        	ldrb	r1, [r1, #28]
     2e2: 05 00        	movs	r5, r0
     2e4: 00           	<unknown>
     2e5: c3 00        	lsls	r3, r0, #3
     2e7: 09 16        	asrs	r1, r1, #24
     2e9: 02 00        	movs	r2, r0
     2eb: 00           	<unknown>
     2ec: c4 00        	lsls	r4, r0, #3
     2ee: 09 c1        	stm	r1!, {r0, r3}
     2f0: 0a 00        	movs	r2, r1
     2f2: 00           	<unknown>
     2f3: c5 00        	lsls	r5, r0, #3
     2f5: 09 6d        	ldr	r1, [r1, #80]
     2f7: 05 00        	movs	r5, r0
     2f9: 00           	<unknown>
     2fa: c6 00        	lsls	r6, r0, #3
     2fc: 09 7d        	ldrb	r1, [r1, #20]
     2fe: 01 00        	movs	r1, r0
     300: 00           	<unknown>
     301: c7 00        	lsls	r7, r0, #3
     303: 09 15        	asrs	r1, r1, #20
     305: 0b 00        	movs	r3, r1
     307: 00           	<unknown>
     308: c8 00        	lsls	r0, r1, #3
     30a: 09 64        	str	r1, [r1, #64]
     30c: 09 00        	movs	r1, r1
     30e: 00           	<unknown>
     30f: c9 00        	lsls	r1, r1, #3
     311: 09 2f        	cmp	r7, #9
     313: 0c 00        	movs	r4, r1
     315: 00           	<unknown>
     316: ca 00        	lsls	r2, r1, #3
     318: 09 5d        	ldrb	r1, [r1, r4]
     31a: 0d 00        	movs	r5, r1
     31c: 00           	<unknown>
     31d: cb 00        	lsls	r3, r1, #3
     31f: 09 93        	str	r3, [sp, #36]
     321: 01 00        	movs	r1, r0
     323: 00           	<unknown>
     324: cc 00        	lsls	r4, r1, #3
     326: 09 ce        	ldm	r6!, {r0, r3}
     328: 07 00        	movs	r7, r0
     32a: 00           	<unknown>
     32b: cd 00        	lsls	r5, r1, #3
     32d: 09 f1 00 00  	add.w	r0, r9, #0
     331: 00           	<unknown>
     332: ce 00        	lsls	r6, r1, #3
     334: 09 71        	strb	r1, [r1, #4]
     336: 09 00        	movs	r1, r1
     338: 00           	<unknown>
     339: cf 00        	lsls	r7, r1, #3
     33b: 09 1d        	adds	r1, r1, #4
     33d: 05 00        	movs	r5, r0
     33f: 00 d0        	beq	0x343 <.debug_info+0x343> @ imm = #0
     341: 00 09        	lsrs	r0, r0, #4
     343: 3f 08        	lsrs	r7, r7, #32
     345: 00 00        	movs	r0, r0
     347: d1 00        	lsls	r1, r2, #3
     349: 00 03        	lsls	r0, r0, #12
     34b: fb 05        	lsls	r3, r7, #23
     34d: 00 00        	movs	r0, r0
     34f: 05           	<unknown>
     350: ef 0f        	lsrs	r7, r5, #31
     352: 01 00        	movs	r1, r0
     354: 00 0a        	lsrs	r0, r0, #8
     356: 04 0e        	lsrs	r4, r0, #24
     358: 02 2f        	cmp	r7, #2
     35a: 01 11        	asrs	r1, r0, #4
     35c: 04 00        	movs	r4, r0
     35e: 00 0b        	lsrs	r0, r0, #12
     360: 8c 0d        	lsrs	r4, r1, #22
     362: 00 00        	movs	r0, r0
     364: 02 31        	adds	r1, #2
     366: 01 21        	movs	r1, #1
     368: 04 00        	movs	r4, r0
     36a: 00 00        	movs	r0, r0
     36c: 0b           	<unknown>
     36d: ef 02        	lsls	r7, r5, #11
     36f: 00 00        	movs	r0, r0
     371: 02 32        	adds	r2, #2
     373: 01 26        	movs	r6, #1
     375: 04 00        	movs	r4, r0
     377: 00 20        	movs	r0, #0
     379: 0b 04        	lsls	r3, r1, #16
     37b: 0a 00        	movs	r2, r1
     37d: 00 02        	lsls	r0, r0, #8
     37f: 33 01        	lsls	r3, r6, #4
     381: 36 04        	lsls	r6, r6, #16
     383: 00 00        	movs	r0, r0
     385: 80 0b        	lsrs	r0, r0, #14
     387: 00 00        	movs	r0, r0
     389: 00 00        	movs	r0, r0
     38b: 02 34        	adds	r4, #2
     38d: 01 26        	movs	r6, #1
     38f: 04 00        	movs	r4, r0
     391: 00 a0        	adr	r0, #0 <.debug_info+0x395>
     393: 0c 41        	asrs	r4, r1
     395: 0d 00        	movs	r5, r1
     397: 00 02        	lsls	r0, r0, #8
     399: 35 01        	lsls	r5, r6, #4
     39b: 3b 04        	lsls	r3, r7, #16
     39d: 00 00        	movs	r0, r0
     39f: 00 01        	lsls	r0, r0, #4
     3a1: 0c 8b        	ldrh	r4, [r1, #24]
     3a3: 03 00        	movs	r3, r0
     3a5: 00 02        	lsls	r0, r0, #8
     3a7: 36 01        	lsls	r6, r6, #4
     3a9: 26 04        	lsls	r6, r4, #16
     3ab: 00 00        	movs	r0, r0
     3ad: 20 01        	lsls	r0, r4, #4
     3af: 0c 42        	tst	r4, r1
     3b1: 01 00        	movs	r1, r0
     3b3: 00 02        	lsls	r0, r0, #8
     3b5: 37 01        	lsls	r7, r6, #4
     3b7: 40 04        	lsls	r0, r0, #17
     3b9: 00 00        	movs	r0, r0
     3bb: 80 01        	lsls	r0, r0, #6
     3bd: 0c 95        	str	r5, [sp, #48]
     3bf: 03 00        	movs	r3, r0
     3c1: 00 02        	lsls	r0, r0, #8
     3c3: 38 01        	lsls	r0, r7, #4
     3c5: 26 04        	lsls	r6, r4, #16
     3c7: 00 00        	movs	r0, r0
     3c9: a0 01        	lsls	r0, r4, #6
     3cb: 0c 4c        	ldr	r4, [pc, #48]           @ 0x3fc <.debug_info+0x3fc>
     3cd: 03 00        	movs	r3, r0
     3cf: 00 02        	lsls	r0, r0, #8
     3d1: 39 01        	lsls	r1, r7, #4
     3d3: 45 04        	lsls	r5, r0, #17
     3d5: 00 00        	movs	r0, r0
     3d7: 00 02        	lsls	r0, r0, #8
     3d9: 0c 23        	movs	r3, #12
     3db: 03 00        	movs	r3, r0
     3dd: 00 02        	lsls	r0, r0, #8
     3df: 3a 01        	lsls	r2, r7, #4
     3e1: 4a 04        	lsls	r2, r1, #17
     3e3: 00 00        	movs	r0, r0
     3e5: 20 02        	lsls	r0, r4, #8
     3e7: 0d 49        	ldr	r1, [pc, #52]           @ 0x41c <.debug_info+0x41c>
     3e9: 50 00        	lsls	r0, r2, #1
     3eb: 02 3b        	subs	r3, #2
     3ed: 01 6a        	ldr	r1, [r0, #32]
     3ef: 04 00        	movs	r4, r0
     3f1: 00 00        	movs	r0, r0
     3f3: 03 0c        	lsrs	r3, r0, #16
     3f5: 2d 03        	lsls	r5, r5, #12
     3f7: 00 00        	movs	r0, r0
     3f9: 02 3c        	subs	r4, #2
     3fb: 01 6f        	ldr	r1, [r0, #112]
     3fd: 04 00        	movs	r4, r0
     3ff: 00 f0 03 0c  	and	r12, r0, #3
     403: b6 04        	lsls	r6, r6, #18
     405: 00 00        	movs	r0, r0
     407: 02 3d        	subs	r5, #2
     409: 01 80        	strh	r1, [r0]
     40b: 04 00        	movs	r4, r0
     40d: 00 00        	movs	r0, r0
     40f: 0e 00        	movs	r6, r1
     411: 0e           	<unknown>
     412: ef 00        	lsls	r7, r5, #3
     414: 00 00        	movs	r0, r0
     416: 21 04        	lsls	r1, r4, #16
     418: 00 00        	movs	r0, r0
     41a: 0f a4        	adr	r4, #60 <.debug_info+0x42d>
     41c: 00 00        	movs	r0, r0
     41e: 00 07        	lsls	r0, r0, #28
     420: 00 10        	asrs	r0, r0, #32
     422: 11 04        	lsls	r1, r2, #16
     424: 00 00        	movs	r0, r0
     426: 0e           	<unknown>
     427: ef 00        	lsls	r7, r5, #3
     429: 00 00        	movs	r0, r0
     42b: 36 04        	lsls	r6, r6, #16
     42d: 00 00        	movs	r0, r0
     42f: 0f a4        	adr	r4, #60 <.debug_info+0x442>
     431: 00 00        	movs	r0, r0
     433: 00 17        	asrs	r0, r0, #28
     435: 00 10        	asrs	r0, r0, #32
     437: 11 04        	lsls	r1, r2, #16
     439: 00 00        	movs	r0, r0
     43b: 10 11        	asrs	r0, r2, #4
     43d: 04 00        	movs	r4, r0
     43f: 00 10        	asrs	r0, r0, #32
     441: 11 04        	lsls	r1, r2, #16
     443: 00 00        	movs	r0, r0
     445: 10 11        	asrs	r0, r2, #4
     447: 04 00        	movs	r4, r0
     449: 00 0e        	lsrs	r0, r0, #24
     44b: ef 00        	lsls	r7, r5, #3
     44d: 00 00        	movs	r0, r0
     44f: 5a 04        	lsls	r2, r3, #17
     451: 00 00        	movs	r0, r0
     453: 0f a4        	adr	r4, #60 <.debug_info+0x466>
     455: 00 00        	movs	r0, r0
     457: 00 37        	adds	r7, #0
     459: 00 0e        	lsrs	r0, r0, #24
     45b: c3 00        	lsls	r3, r0, #3
     45d: 00 00        	movs	r0, r0
     45f: 6a 04        	lsls	r2, r5, #17
     461: 00 00        	movs	r0, r0
     463: 0f a4        	adr	r4, #60 <.debug_info+0x476>
     465: 00 00        	movs	r0, r0
     467: 00           	<unknown>
     468: ef 00        	lsls	r7, r5, #3
     46a: 10 5a        	ldrh	r0, [r2, r0]
     46c: 04 00        	movs	r4, r0
     46e: 00 0e        	lsrs	r0, r0, #24
     470: ef 00        	lsls	r7, r5, #3
     472: 00 00        	movs	r0, r0
     474: 80 04        	lsls	r0, r0, #18
     476: 00 00        	movs	r0, r0
     478: 11 a4        	adr	r4, #68 <.debug_info+0x48d>
     47a: 00 00        	movs	r0, r0
     47c: 00 83        	strh	r0, [r0, #24]
     47e: 02 00        	movs	r2, r0
     480: 10           	<unknown>
     481: ef 00        	lsls	r7, r5, #3
     483: 00 00        	movs	r0, r0
     485: 12 4a        	ldr	r2, [pc, #72]           @ 0x4d0 <.debug_info+0x4d0>
     487: 09 00        	movs	r1, r1
     489: 00 02        	lsls	r0, r0, #8
     48b: 3e 01        	lsls	r6, r7, #4
     48d: 55 03        	lsls	r5, r2, #13
     48f: 00 00        	movs	r0, r0
     491: 13 8c        	ldrh	r3, [r2, #32]
     493: 02 4f        	ldr	r7, [pc, #8]            @ 0x49c <.debug_info+0x49c>
     495: 01 ac        	add	r4, sp, #4
     497: 05 00        	movs	r5, r0
     499: 00 0b        	lsrs	r0, r0, #12
     49b: f6 01        	lsls	r6, r6, #7
     49d: 00 00        	movs	r0, r0
     49f: 02 51        	str	r2, [r0, r4]
     4a1: 01 ac        	add	r4, sp, #4
     4a3: 05 00        	movs	r5, r0
     4a5: 00 00        	movs	r0, r0
     4a7: 0b 9a        	ldr	r2, [sp, #44]
     4a9: 02 00        	movs	r2, r0
     4ab: 00 02        	lsls	r0, r0, #8
     4ad: 52 01        	lsls	r2, r2, #5
     4af: 80 04        	lsls	r0, r0, #18
     4b1: 00 00        	movs	r0, r0
     4b3: 04 0b        	lsrs	r4, r0, #12
     4b5: ce 00        	lsls	r6, r1, #3
     4b7: 00 00        	movs	r0, r0
     4b9: 02 53        	strh	r2, [r0, r4]
     4bb: 01 80        	strh	r1, [r0]
     4bd: 04 00        	movs	r4, r0
     4bf: 00 08        	lsrs	r0, r0, #32
     4c1: 0b d1        	bne	0x4db <.debug_info+0x4db> @ imm = #22
     4c3: 01 00        	movs	r1, r0
     4c5: 00 02        	lsls	r0, r0, #8
     4c7: 54 01        	lsls	r4, r2, #5
     4c9: 80 04        	lsls	r0, r0, #18
     4cb: 00 00        	movs	r0, r0
     4cd: 0c 14        	asrs	r4, r1, #16
     4cf: 53 43        	muls	r3, r2, r3
     4d1: 52 00        	lsls	r2, r2, #1
     4d3: 02 55        	strb	r2, [r0, r4]
     4d5: 01 80        	strh	r1, [r0]
     4d7: 04 00        	movs	r4, r0
     4d9: 00 10        	asrs	r0, r0, #32
     4db: 14 43        	orrs	r4, r2
     4dd: 43 52        	strh	r3, [r0, r1]
     4df: 00 02        	lsls	r0, r0, #8
     4e1: 56 01        	lsls	r6, r2, #5
     4e3: 80 04        	lsls	r0, r0, #18
     4e5: 00 00        	movs	r0, r0
     4e7: 14 14        	asrs	r4, r2, #16
     4e9: 53 48        	ldr	r0, [pc, #332]          @ 0x638 <.debug_info+0x638>
     4eb: 50 00        	lsls	r0, r2, #1
     4ed: 02 57        	ldrsb	r2, [r0, r4]
     4ef: 01 c1        	stm	r1!, {r0}
     4f1: 05 00        	movs	r5, r0
     4f3: 00 18        	adds	r0, r0, r0
     4f5: 0b 9b        	ldr	r3, [sp, #44]
     4f7: 04 00        	movs	r4, r0
     4f9: 00 02        	lsls	r0, r0, #8
     4fb: 58 01        	lsls	r0, r3, #5
     4fd: 80 04        	lsls	r0, r0, #18
     4ff: 00 00        	movs	r0, r0
     501: 24 0b        	lsrs	r4, r4, #12
     503: aa 0a        	lsrs	r2, r5, #10
     505: 00 00        	movs	r0, r0
     507: 02 59        	ldr	r2, [r0, r4]
     509: 01 80        	strh	r1, [r0]
     50b: 04 00        	movs	r4, r0
     50d: 00 28        	cmp	r0, #0
     50f: 0b 27        	movs	r7, #11
     511: 04 00        	movs	r4, r0
     513: 00 02        	lsls	r0, r0, #8
     515: 5a 01        	lsls	r2, r3, #5
     517: 80 04        	lsls	r0, r0, #18
     519: 00 00        	movs	r0, r0
     51b: 2c 0b        	lsrs	r4, r5, #12
     51d: e2 03        	lsls	r2, r4, #15
     51f: 00 00        	movs	r0, r0
     521: 02 5b        	ldrh	r2, [r0, r4]
     523: 01 80        	strh	r1, [r0]
     525: 04 00        	movs	r4, r0
     527: 00 30        	adds	r0, #0
     529: 0b 46        	mov	r3, r1
     52b: 0b 00        	movs	r3, r1
     52d: 00 02        	lsls	r0, r0, #8
     52f: 5c 01        	lsls	r4, r3, #5
     531: 80 04        	lsls	r0, r0, #18
     533: 00 00        	movs	r0, r0
     535: 34 0b        	lsrs	r4, r6, #12
     537: c9 08        	lsrs	r1, r1, #3
     539: 00 00        	movs	r0, r0
     53b: 02 5d        	ldrb	r2, [r0, r4]
     53d: 01 80        	strh	r1, [r0]
     53f: 04 00        	movs	r4, r0
     541: 00 38        	subs	r0, #0
     543: 0b 56        	ldrsb	r3, [r1, r0]
     545: 0a 00        	movs	r2, r1
     547: 00 02        	lsls	r0, r0, #8
     549: 5e 01        	lsls	r6, r3, #5
     54b: 80 04        	lsls	r0, r0, #18
     54d: 00 00        	movs	r0, r0
     54f: 3c 14        	asrs	r4, r7, #16
     551: 50 46        	mov	r0, r10
     553: 52 00        	lsls	r2, r2, #1
     555: 02 5f        	ldrsh	r2, [r0, r4]
     557: 01 d6        	bvs	0x55d <.debug_info+0x55d> @ imm = #2
     559: 05 00        	movs	r5, r0
     55b: 00 40        	ands	r0, r0
     55d: 14 44        	add	r4, r2
     55f: 46 52        	strh	r6, [r0, r1]
     561: 00 02        	lsls	r0, r0, #8
     563: 60 01        	lsls	r0, r4, #5
     565: ac 05        	lsls	r4, r5, #22
     567: 00 00        	movs	r0, r0
     569: 48 14        	asrs	r0, r1, #17
     56b: 41 44        	add	r1, r8
     56d: 52 00        	lsls	r2, r2, #1
     56f: 02 61        	str	r2, [r0, #16]
     571: 01 ac        	add	r4, sp, #4
     573: 05 00        	movs	r5, r0
     575: 00 4c        	ldr	r4, [pc, #0]            @ 0x578 <.debug_info+0x578>
     577: 0b 41        	asrs	r3, r1
     579: 0b 00        	movs	r3, r1
     57b: 00 02        	lsls	r0, r0, #8
     57d: 62 01        	lsls	r2, r4, #5
     57f: f0 05        	lsls	r0, r6, #23
     581: 00 00        	movs	r0, r0
     583: 50 0b        	lsrs	r0, r2, #13
     585: 80 0b        	lsrs	r0, r0, #14
     587: 00 00        	movs	r0, r0
     589: 02 63        	str	r2, [r0, #48]
     58b: 01 0a        	lsrs	r1, r0, #8
     58d: 06 00        	movs	r6, r0
     58f: 00 60        	str	r0, [r0]
     591: 0b           	<unknown>
     592: ef 02        	lsls	r7, r5, #11
     594: 00 00        	movs	r0, r0
     596: 02 64        	str	r2, [r0, #64]
     598: 01           	<unknown>
     599: fa 05        	lsls	r2, r7, #23
     59b: 00 00        	movs	r0, r0
     59d: 74 0b        	lsrs	r4, r6, #13
     59f: 33 0d        	lsrs	r3, r6, #20
     5a1: 00 00        	movs	r0, r0
     5a3: 02 65        	str	r2, [r0, #80]
     5a5: 01 80        	strh	r1, [r0]
     5a7: 04 00        	movs	r4, r0
     5a9: 00 88        	ldrh	r0, [r0]
     5ab: 00 07        	lsls	r0, r0, #28
     5ad: 80 04        	lsls	r0, r0, #18
     5af: 00 00        	movs	r0, r0
     5b1: 0e c3        	stm	r3!, {r1, r2, r3}
     5b3: 00 00        	movs	r0, r0
     5b5: 00           	<unknown>
     5b6: c1 05        	lsls	r1, r0, #23
     5b8: 00 00        	movs	r0, r0
     5ba: 0f a4        	adr	r4, #60 <.debug_info+0x5cd>
     5bc: 00 00        	movs	r0, r0
     5be: 00 0b        	lsrs	r0, r0, #12
     5c0: 00 10        	asrs	r0, r0, #32
     5c2: b1 05        	lsls	r1, r6, #22
     5c4: 00 00        	movs	r0, r0
     5c6: 0e           	<unknown>
     5c7: ef 00        	lsls	r7, r5, #3
     5c9: 00 00        	movs	r0, r0
     5cb: d6 05        	lsls	r6, r2, #23
     5cd: 00 00        	movs	r0, r0
     5cf: 0f a4        	adr	r4, #60 <.debug_info+0x5e2>
     5d1: 00 00        	movs	r0, r0
     5d3: 00 01        	lsls	r0, r0, #4
     5d5: 00 07        	lsls	r0, r0, #28
     5d7: db 05        	lsls	r3, r3, #23
     5d9: 00 00        	movs	r0, r0
     5db: 10 c6        	stm	r6!, {r4}
     5dd: 05 00        	movs	r5, r0
     5df: 00 0e        	lsrs	r0, r0, #24
     5e1: ef 00        	lsls	r7, r5, #3
     5e3: 00 00        	movs	r0, r0
     5e5: f0 05        	lsls	r0, r6, #23
     5e7: 00 00        	movs	r0, r0
     5e9: 0f a4        	adr	r4, #60 <.debug_info+0x5fc>
     5eb: 00 00        	movs	r0, r0
     5ed: 00 03        	lsls	r0, r0, #12
     5ef: 00 07        	lsls	r0, r0, #28
     5f1: f5 05        	lsls	r5, r6, #23
     5f3: 00 00        	movs	r0, r0
     5f5: 10 e0        	b	0x619 <.debug_info+0x619> @ imm = #32
     5f7: 05 00        	movs	r5, r0
     5f9: 00 0e        	lsrs	r0, r0, #24
     5fb: ef 00        	lsls	r7, r5, #3
     5fd: 00 00        	movs	r0, r0
     5ff: 0a 06        	lsls	r2, r1, #24
     601: 00 00        	movs	r0, r0
     603: 0f a4        	adr	r4, #60 <.debug_info+0x616>
     605: 00 00        	movs	r0, r0
     607: 00 04        	lsls	r0, r0, #16
     609: 00 07        	lsls	r0, r0, #28
     60b: 0f 06        	lsls	r7, r1, #24
     60d: 00 00        	movs	r0, r0
     60f: 10           	<unknown>
     610: fa 05        	lsls	r2, r7, #23
     612: 00 00        	movs	r0, r0
     614: 12 c8        	ldm	r0!, {r1, r4}
     616: 03 00        	movs	r3, r0
     618: 00 02        	lsls	r0, r0, #8
     61a: 66 01        	lsls	r6, r4, #5
     61c: 91 04        	lsls	r1, r2, #18
     61e: 00 00        	movs	r0, r0
     620: 13 10        	asrs	r3, r2, #32
     622: 02 4e        	ldr	r6, [pc, #8]            @ 0x62c <.debug_info+0x62c>
     624: 02 5e        	ldrsh	r2, [r0, r0]
     626: 06 00        	movs	r6, r0
     628: 00 0b        	lsrs	r0, r0, #12
     62a: 6a 08        	lsrs	r2, r5, #1
     62c: 00 00        	movs	r0, r0
     62e: 02 50        	str	r2, [r0, r0]
     630: 02 80        	strh	r2, [r0]
     632: 04 00        	movs	r4, r0
     634: 00 00        	movs	r0, r0
     636: 0b d3        	blo	0x650 <.debug_info+0x650> @ imm = #22
     638: 0a 00        	movs	r2, r1
     63a: 00 02        	lsls	r0, r0, #8
     63c: 51 02        	lsls	r1, r2, #9
     63e: 80 04        	lsls	r0, r0, #18
     640: 00 00        	movs	r0, r0
     642: 04 14        	asrs	r4, r0, #16
     644: 56 41        	adcs	r6, r2
     646: 4c 00        	lsls	r4, r1, #1
     648: 02 52        	strh	r2, [r0, r0]
     64a: 02 80        	strh	r2, [r0]
     64c: 04 00        	movs	r4, r0
     64e: 00 08        	lsrs	r0, r0, #32
     650: 0b 62        	str	r3, [r1, #32]
     652: 0a 00        	movs	r2, r1
     654: 00 02        	lsls	r0, r0, #8
     656: 53 02        	lsls	r3, r2, #9
     658: ac 05        	lsls	r4, r5, #22
     65a: 00 00        	movs	r0, r0
     65c: 0c 00        	movs	r4, r1
     65e: 12 06        	lsls	r2, r2, #24
     660: 09 00        	movs	r1, r1
     662: 00 02        	lsls	r0, r0, #8
     664: 54 02        	lsls	r4, r2, #9
     666: 20 06        	lsls	r0, r4, #24
     668: 00 00        	movs	r0, r0
     66a: 10 d9        	bls	0x68e <.debug_info+0x68e> @ imm = #32
     66c: 00 00        	movs	r0, r0
     66e: 00 10        	asrs	r0, r0, #32
     670: e4 00        	lsls	r4, r4, #3
     672: 00 00        	movs	r0, r0
     674: 15 01        	lsls	r5, r2, #4
     676: 05 1f        	subs	r5, r0, #4
     678: 01 8a        	ldrh	r1, [r0, #16]
     67a: 06 00        	movs	r6, r0
     67c: 00 09        	lsrs	r0, r0, #4
     67e: 00 08        	lsrs	r0, r0, #32
     680: 00 00        	movs	r0, r0
     682: 00 09        	lsrs	r0, r0, #4
     684: ab 0b        	lsrs	r3, r5, #14
     686: 00 00        	movs	r0, r0
     688: 01 00        	movs	r1, r0
     68a: 12 54        	strb	r2, [r2, r0]
     68c: 09 00        	movs	r1, r1
     68e: 00 05        	lsls	r0, r0, #20
     690: 1f 01        	lsls	r7, r3, #4
     692: 74 06        	lsls	r4, r6, #25
     694: 00 00        	movs	r0, r0
     696: 13 28        	cmp	r0, #19
     698: 05 8e        	ldrh	r5, [r0, #48]
     69a: 02 22        	movs	r2, #2
     69c: 07 00        	movs	r7, r0
     69e: 00 0b        	lsrs	r0, r0, #12
     6a0: 75 0c        	lsrs	r5, r6, #17
     6a2: 00 00        	movs	r0, r0
     6a4: 05 90        	str	r0, [sp, #20]
     6a6: 02 80        	strh	r2, [r0]
     6a8: 04 00        	movs	r4, r0
     6aa: 00 00        	movs	r0, r0
     6ac: 0b 5b        	ldrh	r3, [r1, r4]
     6ae: 0a 00        	movs	r2, r1
     6b0: 00 05        	lsls	r0, r0, #20
     6b2: 91 02        	lsls	r1, r2, #10
     6b4: 80 04        	lsls	r0, r0, #18
     6b6: 00 00        	movs	r0, r0
     6b8: 04 0b        	lsrs	r4, r0, #12
     6ba: 70 06        	lsls	r0, r6, #25
     6bc: 00 00        	movs	r0, r0
     6be: 05 92        	str	r2, [sp, #20]
     6c0: 02 80        	strh	r2, [r0]
     6c2: 04 00        	movs	r4, r0
     6c4: 00 08        	lsrs	r0, r0, #32
     6c6: 0b da        	bge	0x6e0 <.debug_info+0x6e0> @ imm = #22
     6c8: 07 00        	movs	r7, r0
     6ca: 00 05        	lsls	r0, r0, #20
     6cc: 93 02        	lsls	r3, r2, #10
     6ce: 80 04        	lsls	r0, r0, #18
     6d0: 00 00        	movs	r0, r0
     6d2: 0c 14        	asrs	r4, r1, #16
     6d4: 49 44        	add	r1, r9
     6d6: 52 00        	lsls	r2, r2, #1
     6d8: 05 94        	str	r4, [sp, #20]
     6da: 02 80        	strh	r2, [r0]
     6dc: 04 00        	movs	r4, r0
     6de: 00 10        	asrs	r0, r0, #32
     6e0: 14 4f        	ldr	r7, [pc, #80]           @ 0x734 <.debug_info+0x734>
     6e2: 44 52        	strh	r4, [r0, r1]
     6e4: 00 05        	lsls	r0, r0, #20
     6e6: 95 02        	lsls	r5, r2, #10
     6e8: 80 04        	lsls	r0, r0, #18
     6ea: 00 00        	movs	r0, r0
     6ec: 14 0b        	lsrs	r4, r2, #12
     6ee: 1a 08        	lsrs	r2, r3, #32
     6f0: 00 00        	movs	r0, r0
     6f2: 05 96        	str	r6, [sp, #20]
     6f4: 02 6a        	ldr	r2, [r0, #32]
     6f6: 06 00        	movs	r6, r0
     6f8: 00 18        	adds	r0, r0, r0
     6fa: 0b 14        	asrs	r3, r1, #16
     6fc: 08 00        	movs	r0, r1
     6fe: 00 05        	lsls	r0, r0, #20
     700: 97 02        	lsls	r7, r2, #10
     702: 6a 06        	lsls	r2, r5, #25
     704: 00 00        	movs	r0, r0
     706: 1a 0b        	lsrs	r2, r3, #12
     708: 4e 06        	lsls	r6, r1, #25
     70a: 00 00        	movs	r0, r0
     70c: 05 98        	ldr	r0, [sp, #20]
     70e: 02 80        	strh	r2, [r0]
     710: 04 00        	movs	r4, r0
     712: 00 1c        	adds	r0, r0, #0
     714: 14 41        	asrs	r4, r2
     716: 46 52        	strh	r6, [r0, r1]
     718: 00 05        	lsls	r0, r0, #20
     71a: 99 02        	lsls	r1, r3, #10
     71c: 22 07        	lsls	r2, r4, #28
     71e: 00 00        	movs	r0, r0
     720: 20 00        	movs	r0, r4
     722: 10 c6        	stm	r6!, {r4}
     724: 05 00        	movs	r5, r0
     726: 00 12        	asrs	r0, r0, #8
     728: d5 0b        	lsrs	r5, r2, #15
     72a: 00 00        	movs	r0, r0
     72c: 05 9a        	ldr	r2, [sp, #20]
     72e: 02 96        	str	r6, [sp, #8]
     730: 06 00        	movs	r6, r0
     732: 00 13        	asrs	r0, r0, #12
     734: 1c 05        	lsls	r4, r3, #20
     736: 95 03        	lsls	r5, r2, #14
     738: f1 07        	lsls	r1, r6, #31
     73a: 00 00        	movs	r0, r0
     73c: 14 53        	strh	r4, [r2, r4]
     73e: 52 00        	lsls	r2, r2, #1
     740: 05 97        	str	r7, [sp, #20]
     742: 03 6a        	ldr	r3, [r0, #32]
     744: 06 00        	movs	r6, r0
     746: 00 00        	movs	r0, r0
     748: 0b           	<unknown>
     749: ef 02        	lsls	r7, r5, #11
     74b: 00 00        	movs	r0, r0
     74d: 05 98        	ldr	r0, [sp, #20]
     74f: 03 d9        	bls	0x759 <.debug_info+0x759> @ imm = #6
     751: 00 00        	movs	r0, r0
     753: 00 02        	lsls	r0, r0, #8
     755: 14 44        	add	r4, r2
     757: 52 00        	lsls	r2, r2, #1
     759: 05 99        	ldr	r1, [sp, #20]
     75b: 03 6a        	ldr	r3, [r0, #32]
     75d: 06 00        	movs	r6, r0
     75f: 00 04        	lsls	r0, r0, #16
     761: 0b           	<unknown>
     762: f9 02        	lsls	r1, r7, #11
     764: 00 00        	movs	r0, r0
     766: 05 9a        	ldr	r2, [sp, #20]
     768: 03 d9        	bls	0x772 <.debug_info+0x772> @ imm = #6
     76a: 00 00        	movs	r0, r0
     76c: 00 06        	lsls	r0, r0, #24
     76e: 14 42        	tst	r4, r2
     770: 52 52        	strh	r2, [r2, r1]
     772: 00 05        	lsls	r0, r0, #20
     774: 9b 03        	lsls	r3, r3, #14
     776: 6a 06        	lsls	r2, r5, #25
     778: 00 00        	movs	r0, r0
     77a: 08 0b        	lsrs	r0, r1, #12
     77c: 8b 03        	lsls	r3, r1, #14
     77e: 00 00        	movs	r0, r0
     780: 05 9c        	ldr	r4, [sp, #20]
     782: 03 d9        	bls	0x78c <.debug_info+0x78c> @ imm = #6
     784: 00 00        	movs	r0, r0
     786: 00 0a        	lsrs	r0, r0, #8
     788: 14 43        	orrs	r4, r2
     78a: 52 31        	adds	r1, #82
     78c: 00 05        	lsls	r0, r0, #20
     78e: 9d 03        	lsls	r5, r3, #14
     790: 6a 06        	lsls	r2, r5, #25
     792: 00 00        	movs	r0, r0
     794: 0c 0b        	lsrs	r4, r1, #12
     796: 95 03        	lsls	r5, r2, #14
     798: 00 00        	movs	r0, r0
     79a: 05 9e        	ldr	r6, [sp, #20]
     79c: 03 d9        	bls	0x7a6 <.debug_info+0x7a6> @ imm = #6
     79e: 00 00        	movs	r0, r0
     7a0: 00 0e        	lsrs	r0, r0, #24
     7a2: 14 43        	orrs	r4, r2
     7a4: 52 32        	adds	r2, #82
     7a6: 00 05        	lsls	r0, r0, #20
     7a8: 9f 03        	lsls	r7, r3, #14
     7aa: 6a 06        	lsls	r2, r5, #25
     7ac: 00 00        	movs	r0, r0
     7ae: 10 0b        	lsrs	r0, r2, #12
     7b0: 23 03        	lsls	r3, r4, #12
     7b2: 00 00        	movs	r0, r0
     7b4: 05 a0        	adr	r0, #20 <.debug_info+0x7bd>
     7b6: 03 d9        	bls	0x7c0 <.debug_info+0x7c0> @ imm = #6
     7b8: 00 00        	movs	r0, r0
     7ba: 00 12        	asrs	r0, r0, #8
     7bc: 14 43        	orrs	r4, r2
     7be: 52 33        	adds	r3, #82
     7c0: 00 05        	lsls	r0, r0, #20
     7c2: a1 03        	lsls	r1, r4, #14
     7c4: 6a 06        	lsls	r2, r5, #25
     7c6: 00 00        	movs	r0, r0
     7c8: 14 0b        	lsrs	r4, r2, #12
     7ca: 2d 03        	lsls	r5, r5, #12
     7cc: 00 00        	movs	r0, r0
     7ce: 05 a2        	adr	r2, #20 <.debug_info+0x7d7>
     7d0: 03 d9        	bls	0x7da <.debug_info+0x7da> @ imm = #6
     7d2: 00 00        	movs	r0, r0
     7d4: 00 16        	asrs	r0, r0, #24
     7d6: 0b 50        	str	r3, [r1, r0]
     7d8: 00 00        	movs	r0, r0
     7da: 00 05        	lsls	r0, r0, #20
     7dc: a3 03        	lsls	r3, r4, #14
     7de: 6a 06        	lsls	r2, r5, #25
     7e0: 00 00        	movs	r0, r0
     7e2: 18 0b        	lsrs	r0, r3, #12
     7e4: 37 03        	lsls	r7, r6, #12
     7e6: 00 00        	movs	r0, r0
     7e8: 05 a4        	adr	r4, #20 <.debug_info+0x7f1>
     7ea: 03 d9        	bls	0x7f4 <.debug_info+0x7f4> @ imm = #6
     7ec: 00 00        	movs	r0, r0
     7ee: 00 1a        	subs	r0, r0, r0
     7f0: 00 12        	asrs	r0, r0, #8
     7f2: 3d 04        	lsls	r5, r7, #16
     7f4: 00 00        	movs	r0, r0
     7f6: 05 a5        	adr	r5, #20 <.debug_info+0x7ff>
     7f8: 03 33        	adds	r3, #3
     7fa: 07 00        	movs	r7, r0
     7fc: 00 16        	asrs	r0, r0, #24
     7fe: 01 06        	lsls	r1, r0, #24
     800: 40 1e        	subs	r0, r0, #1
     802: 08 00        	movs	r0, r1
     804: 00 09        	lsrs	r0, r0, #4
     806: 05 06        	lsls	r5, r0, #24
     808: 00 00        	movs	r0, r0
     80a: 00 09        	lsrs	r0, r0, #4
     80c: f7 04        	lsls	r7, r6, #19
     80e: 00 00        	movs	r0, r0
     810: 01 09        	lsrs	r1, r0, #4
     812: 28 02        	lsls	r0, r5, #8
     814: 00 00        	movs	r0, r0
     816: 02 09        	lsrs	r2, r0, #4
     818: 4d 02        	lsls	r5, r1, #9
     81a: 00 00        	movs	r0, r0
     81c: 03 00        	movs	r3, r0
     81e: 03 11        	asrs	r3, r0, #4
     820: 0a 00        	movs	r2, r1
     822: 00 06        	lsls	r0, r0, #24
     824: 45 fd 07 00  	stc2l	p0, c0, [r5, #-28]
     828: 00 16        	asrs	r0, r0, #24
     82a: 01 06        	lsls	r1, r0, #24
     82c: 4d 3e        	subs	r6, #77
     82e: 08 00        	movs	r0, r1
     830: 00 09        	lsrs	r0, r0, #4
     832: 51 03        	lsls	r1, r2, #13
     834: 00 00        	movs	r0, r0
     836: 00 09        	lsrs	r0, r0, #4
     838: 9f 02        	lsls	r7, r3, #10
     83a: 00 00        	movs	r0, r0
     83c: 01 00        	movs	r1, r0
     83e: 03 14        	asrs	r3, r0, #16
     840: 01 00        	movs	r1, r0
     842: 00 06        	lsls	r0, r0, #24
     844: 50 29        	cmp	r1, #80
     846: 08 00        	movs	r0, r1
     848: 00 16        	asrs	r0, r0, #24
     84a: 01 06        	lsls	r1, r0, #24
     84c: 58 6a        	ldr	r0, [r3, #36]
     84e: 08 00        	movs	r0, r1
     850: 00 09        	lsrs	r0, r0, #4
     852: d8 0a        	lsrs	r0, r3, #11
     854: 00 00        	movs	r0, r0
     856: 00 09        	lsrs	r0, r0, #4
     858: 16 04        	lsls	r6, r2, #16
     85a: 00 00        	movs	r0, r0
     85c: 01 09        	lsrs	r1, r0, #4
     85e: 2c 04        	lsls	r4, r5, #16
     860: 00 00        	movs	r0, r0
     862: 02 09        	lsrs	r2, r0, #4
     864: 30 01        	lsls	r0, r6, #4
     866: 00 00        	movs	r0, r0
     868: 03 00        	movs	r3, r0
     86a: 03           	<unknown>
     86b: e8 0a        	lsrs	r0, r5, #11
     86d: 00 00        	movs	r0, r0
     86f: 06 5d        	ldrb	r6, [r0, r4]
     871: 49 08        	lsrs	r1, r1, #1
     873: 00 00        	movs	r0, r0
     875: 16 01        	lsls	r6, r2, #4
     877: 06 65        	str	r6, [r0, #80]
     879: 90 08        	lsrs	r0, r2, #2
     87b: 00 00        	movs	r0, r0
     87d: 09           	<unknown>
     87e: b7 00        	lsls	r7, r6, #2
     880: 00 00        	movs	r0, r0
     882: 00 09        	lsrs	r0, r0, #4
     884: b4 0c        	lsrs	r4, r6, #18
     886: 00 00        	movs	r0, r0
     888: 01 09        	lsrs	r1, r0, #4
     88a: c2 01        	lsls	r2, r0, #7
     88c: 00 00        	movs	r0, r0
     88e: 02 00        	movs	r2, r0
     890: 03 d1        	bne	0x89a <.debug_info+0x89a> @ imm = #6
     892: 03 00        	movs	r3, r0
     894: 00 06        	lsls	r0, r0, #24
     896: 69 75        	strb	r1, [r5, #21]
     898: 08 00        	movs	r0, r1
     89a: 00 17        	asrs	r0, r0, #28
     89c: 08 06        	lsls	r0, r1, #24
     89e: 7b e0        	b	0x998 <.debug_info+0x998> @ imm = #246
     8a0: 08 00        	movs	r0, r1
     8a2: 00 18        	adds	r0, r0, r0
     8a4: 0c 0b        	lsrs	r4, r1, #12
     8a6: 00 00        	movs	r0, r0
     8a8: 06 7d        	ldrb	r6, [r0, #20]
     8aa: ef 00        	lsls	r7, r5, #3
     8ac: 00 00        	movs	r0, r0
     8ae: 00 18        	adds	r0, r0, r0
     8b0: d9 09        	lsrs	r1, r3, #7
     8b2: 00 00        	movs	r0, r0
     8b4: 06 80        	strh	r6, [r0]
     8b6: 1e 08        	lsrs	r6, r3, #32
     8b8: 00 00        	movs	r0, r0
     8ba: 04 18        	adds	r4, r0, r0
     8bc: 94 08        	lsrs	r4, r2, #2
     8be: 00 00        	movs	r0, r0
     8c0: 06 83        	strh	r6, [r0, #24]
     8c2: 6a 08        	lsrs	r2, r5, #1
     8c4: 00 00        	movs	r0, r0
     8c6: 05 18        	adds	r5, r0, r0
     8c8: aa 06        	lsls	r2, r5, #26
     8ca: 00 00        	movs	r0, r0
     8cc: 06 86        	strh	r6, [r0, #48]
     8ce: 3e 08        	lsrs	r6, r7, #32
     8d0: 00 00        	movs	r0, r0
     8d2: 06 18        	adds	r6, r0, r0
     8d4: 22 0b        	lsrs	r2, r4, #12
     8d6: 00 00        	movs	r0, r0
     8d8: 06 89        	ldrh	r6, [r0, #8]
     8da: 90 08        	lsrs	r0, r2, #2
     8dc: 00 00        	movs	r0, r0
     8de: 07 00        	movs	r7, r0
     8e0: 03 ad        	add	r5, sp, #12
     8e2: 02 00        	movs	r2, r0
     8e4: 00 06        	lsls	r0, r0, #24
     8e6: 8b 9b        	ldr	r3, [sp, #556]
     8e8: 08 00        	movs	r0, r1
     8ea: 00 17        	asrs	r0, r0, #28
     8ec: 10 07        	lsls	r0, r2, #28
     8ee: 36 3c        	subs	r4, #54
     8f0: 09 00        	movs	r1, r1
     8f2: 00 18        	adds	r0, r0, r0
     8f4: e8 04        	lsls	r0, r5, #19
     8f6: 00 00        	movs	r0, r0
     8f8: 07 38        	subs	r0, #7
     8fa: ef 00        	lsls	r7, r5, #3
     8fc: 00 00        	movs	r0, r0
     8fe: 00 18        	adds	r0, r0, r0
     900: 5f 03        	lsls	r7, r3, #13
     902: 00 00        	movs	r0, r0
     904: 07 3e        	subs	r6, #7
     906: d9 00        	lsls	r1, r3, #3
     908: 00 00        	movs	r0, r0
     90a: 04 18        	adds	r4, r0, r0
     90c: 3f 06        	lsls	r7, r7, #24
     90e: 00 00        	movs	r0, r0
     910: 07 41        	asrs	r7, r0
     912: d9 00        	lsls	r1, r3, #3
     914: 00 00        	movs	r0, r0
     916: 06 18        	adds	r6, r0, r0
     918: 22 0c        	lsrs	r2, r4, #16
     91a: 00 00        	movs	r0, r0
     91c: 07 44        	add	r7, r0
     91e: d9 00        	lsls	r1, r3, #3
     920: 00 00        	movs	r0, r0
     922: 08 18        	adds	r0, r1, r0
     924: 05 05        	lsls	r5, r0, #20
     926: 00 00        	movs	r0, r0
     928: 07 4b        	ldr	r3, [pc, #28]           @ 0x948 <.debug_info+0x948>
     92a: d9 00        	lsls	r1, r3, #3
     92c: 00 00        	movs	r0, r0
     92e: 0a 18        	adds	r2, r1, r0
     930: 9a 0c        	lsrs	r2, r3, #18
     932: 00 00        	movs	r0, r0
     934: 07 4e        	ldr	r6, [pc, #28]           @ 0x954 <.debug_info+0x954>
     936: d9 00        	lsls	r1, r3, #3
     938: 00 00        	movs	r0, r0
     93a: 0c 00        	movs	r4, r1
     93c: 03 3b        	subs	r3, #3
     93e: 0a 00        	movs	r2, r1
     940: 00 07        	lsls	r0, r0, #28
     942: 51 eb 08 00  	adcs.w	r0, r1, r8
     946: 00 03        	lsls	r0, r0, #12
     948: e0 07        	lsls	r0, r4, #31
     94a: 00 00        	movs	r0, r0
     94c: 08 07        	lsls	r0, r1, #28
     94e: 52 09        	lsrs	r2, r2, #5
     950: 00 00        	movs	r0, r0
     952: 19 62        	str	r1, [r3, #32]
     954: 09 00        	movs	r1, r1
     956: 00 1a        	subs	r0, r0, r0
     958: a2 00        	lsls	r2, r4, #2
     95a: 00 00        	movs	r0, r0
     95c: 1a 94        	str	r4, [sp, #104]
     95e: 00 00        	movs	r0, r0
     960: 00 00        	movs	r0, r0
     962: 03 59        	ldr	r3, [r0, r4]
     964: 04 00        	movs	r4, r0
     966: 00 09        	lsrs	r0, r0, #4
     968: 5f a2        	adr	r2, #380 <.debug_info+0x9cb>
     96a: 00 00        	movs	r0, r0
     96c: 00 16        	asrs	r0, r0, #24
     96e: 02 09        	lsrs	r2, r0, #4
     970: 61 cc        	ldm	r4!, {r0, r5, r6}
     972: 09 00        	movs	r1, r1
     974: 00 09        	lsrs	r0, r0, #4
     976: 56 0b        	lsrs	r6, r2, #13
     978: 00 00        	movs	r0, r0
     97a: 00 09        	lsrs	r0, r0, #4
     97c: 5c 0c        	lsrs	r4, r3, #17
     97e: 00 00        	movs	r0, r0
     980: 7f 09        	lsrs	r7, r7, #5
     982: 02 0c        	lsrs	r2, r0, #16
     984: 00 00        	movs	r0, r0
     986: 7e 09        	lsrs	r6, r7, #5
     988: 55 00        	lsls	r5, r2, #1
     98a: 00 00        	movs	r0, r0
     98c: 7d 09        	lsrs	r5, r7, #5
     98e: 29 08        	lsrs	r1, r5, #32
     990: 00 00        	movs	r0, r0
     992: 7c 09        	lsrs	r4, r7, #5
     994: a1 04        	lsls	r1, r4, #18
     996: 00 00        	movs	r0, r0
     998: 7b 09        	lsrs	r3, r7, #5
     99a: b2 0b        	lsrs	r2, r6, #14
     99c: 00 00        	movs	r0, r0
     99e: 7a 09        	lsrs	r2, r7, #5
     9a0: ce 0c        	lsrs	r6, r1, #19
     9a2: 00 00        	movs	r0, r0
     9a4: 79 09        	lsrs	r1, r7, #5
     9a6: 7d 00        	lsls	r5, r7, #1
     9a8: 00 00        	movs	r0, r0
     9aa: 78 09        	lsrs	r0, r7, #5
     9ac: fc 01        	lsls	r4, r7, #7
     9ae: 00 00        	movs	r0, r0
     9b0: 77 09        	lsrs	r7, r6, #5
     9b2: 24 06        	lsls	r4, r4, #24
     9b4: 00 00        	movs	r0, r0
     9b6: 76 09        	lsrs	r6, r6, #5
     9b8: e7 03        	lsls	r7, r4, #15
     9ba: 00 00        	movs	r0, r0
     9bc: 75 09        	lsrs	r5, r6, #5
     9be: 47 01        	lsls	r7, r0, #5
     9c0: 00 00        	movs	r0, r0
     9c2: 74 09        	lsrs	r4, r6, #5
     9c4: 91 0d        	lsrs	r1, r2, #22
     9c6: 00 00        	movs	r0, r0
     9c8: f1 b1        	cbz	r1, 0xa08 <.debug_info+0xa08> @ imm = #60
     9ca: 7f 00        	lsls	r7, r7, #1
     9cc: 1b a9        	add	r1, sp, #108
     9ce: 00 00        	movs	r0, r0
     9d0: 00 1c        	adds	r0, r0, #0
     9d2: 09 73        	strb	r1, [r1, #12]
     9d4: 2d 0a        	lsrs	r5, r5, #8
     9d6: 00 00        	movs	r0, r0
     9d8: 18 39        	subs	r1, #24
     9da: 0d 00        	movs	r5, r1
     9dc: 00 09        	lsrs	r0, r0, #4
     9de: 74 94        	str	r4, [sp, #464]
     9e0: 00 00        	movs	r0, r0
     9e2: 00 00        	movs	r0, r0
     9e4: 18 8e        	ldrh	r0, [r3, #48]
     9e6: 0a 00        	movs	r2, r1
     9e8: 00 09        	lsrs	r0, r0, #4
     9ea: 75 94        	str	r4, [sp, #468]
     9ec: 00 00        	movs	r0, r0
     9ee: 00 04        	lsls	r0, r0, #16
     9f0: 18 9f        	ldr	r7, [sp, #96]
     9f2: 08 00        	movs	r0, r1
     9f4: 00 09        	lsrs	r0, r0, #4
     9f6: 76 94        	str	r4, [sp, #472]
     9f8: 00 00        	movs	r0, r0
     9fa: 00 08        	lsrs	r0, r0, #32
     9fc: 18 6f        	ldr	r0, [r3, #112]
     9fe: 00 00        	movs	r0, r0
     a00: 00 09        	lsrs	r0, r0, #4
     a02: 77 94        	str	r4, [sp, #476]
     a04: 00 00        	movs	r0, r0
     a06: 00 0c        	lsrs	r0, r0, #16
     a08: 18 35        	adds	r5, #24
     a0a: 0b 00        	movs	r3, r1
     a0c: 00 09        	lsrs	r0, r0, #4
     a0e: 78 94        	str	r4, [sp, #480]
     a10: 00 00        	movs	r0, r0
     a12: 00 10        	asrs	r0, r0, #32
     a14: 18 c3        	stm	r3!, {r3, r4}
     a16: 08 00        	movs	r0, r1
     a18: 00 09        	lsrs	r0, r0, #4
     a1a: 79 94        	str	r4, [sp, #484]
     a1c: 00 00        	movs	r0, r0
     a1e: 00 14        	asrs	r0, r0, #16
     a20: 18 09        	lsrs	r0, r3, #4
     a22: 0a 00        	movs	r2, r1
     a24: 00 09        	lsrs	r0, r0, #4
     a26: 7a 94        	str	r4, [sp, #488]
     a28: 00 00        	movs	r0, r0
     a2a: 00 18        	adds	r0, r0, r0
     a2c: 00 03        	lsls	r0, r0, #12
     a2e: aa 00        	lsls	r2, r5, #2
     a30: 00 00        	movs	r0, r0
     a32: 09 7b        	ldrb	r1, [r1, #12]
     a34: cc 09        	lsrs	r4, r1, #7
     a36: 00 00        	movs	r0, r0
     a38: 1c 7b        	ldrb	r4, [r3, #12]
     a3a: 0c 00        	movs	r4, r1
     a3c: 00 02        	lsls	r0, r0, #8
     a3e: 84 04        	lsls	r4, r0, #18
     a40: 03 5e        	ldrsh	r3, [r0, r0]
     a42: 0a 00        	movs	r2, r1
     a44: 00 1d        	adds	r0, r0, #4
     a46: f0 0b        	lsrs	r0, r6, #15
     a48: 00 00        	movs	r0, r0
     a4a: 02 84        	strh	r2, [r0, #32]
     a4c: 04 4a        	ldr	r2, [pc, #16]           @ 0xa60 <.debug_info+0xa60>
     a4e: 03 00        	movs	r3, r0
     a50: 00 1d        	adds	r0, r0, #4
     a52: 6c 0b        	lsrs	r4, r5, #13
     a54: 00 00        	movs	r0, r0
     a56: 02 84        	strh	r2, [r0, #32]
     a58: 04           	<unknown>
     a59: ef 00        	lsls	r7, r5, #3
     a5b: 00 00        	movs	r0, r0
     a5d: 00 1e        	subs	r0, r0, #0
     a5f: 2c 0a        	lsrs	r4, r5, #8
     a61: 00 00        	movs	r0, r0
     a63: 02 01        	lsls	r2, r0, #4
     a65: 05           	<unknown>
     a66: ef 00        	lsls	r7, r5, #3
     a68: 00 00        	movs	r0, r0
     a6a: 03 7c        	ldrb	r3, [r0, #16]
     a6c: 0a 00        	movs	r2, r1
     a6e: 00 1d        	adds	r0, r0, #4
     a70: 86 06        	lsls	r6, r0, #26
     a72: 00 00        	movs	r0, r0
     a74: 02 01        	lsls	r2, r0, #4
     a76: 05           	<unknown>
     a77: ef 00        	lsls	r7, r5, #3
     a79: 00 00        	movs	r0, r0
     a7b: 00 1f        	subs	r0, r0, #4
     a7d: b5 08        	lsrs	r5, r6, #2
     a7f: 00 00        	movs	r0, r0
     a81: 01 46        	mov	r1, r0
     a83: 00 00        	movs	r0, r0
     a85: 00 00        	movs	r0, r0
     a87: c4 00        	lsls	r4, r0, #3
     a89: 00 00        	movs	r0, r0
     a8b: 01 9c        	ldr	r4, [sp, #4]
     a8d: 09 0c        	lsrs	r1, r1, #16
     a8f: 00 00        	movs	r0, r0
     a91: 20 be        	bkpt	#32
     a93: 02 00        	movs	r2, r0
     a95: 00 01        	lsls	r0, r0, #4
     a97: 46 a2        	adr	r2, #280 <.debug_info+0xae1>
     a99: 00 00        	movs	r0, r0
     a9b: 00 00        	movs	r0, r0
     a9d: 00 00        	movs	r0, r0
     a9f: 00 20        	movs	r0, #0
     aa1: c8 04        	lsls	r0, r1, #19
     aa3: 00 00        	movs	r0, r0
     aa5: 01 46        	mov	r1, r0
     aa7: 94 00        	lsls	r4, r2, #2
     aa9: 00 00        	movs	r0, r0
     aab: 3a 00        	movs	r2, r7
     aad: 00 00        	movs	r0, r0
     aaf: 21 a9        	add	r1, sp, #132
     ab1: 05 00        	movs	r5, r0
     ab3: 00 01        	lsls	r0, r0, #4
     ab5: 47 09        	lsrs	r7, r0, #5
     ab7: 0c 00        	movs	r4, r1
     ab9: 00 05        	lsls	r0, r0, #20
     abb: 03 00        	movs	r3, r0
     abd: 00 00        	movs	r0, r0
     abf: 00 21        	movs	r1, #0
     ac1: 7b 04        	lsls	r3, r7, #17
     ac3: 00 00        	movs	r0, r0
     ac5: 01 48        	ldr	r0, [pc, #4]            @ 0xacc <.debug_info+0xacc>
     ac7: 09 0c        	lsrs	r1, r1, #16
     ac9: 00 00        	movs	r0, r0
     acb: 05 03        	lsls	r5, r0, #12
     acd: 00 00        	movs	r0, r0
     acf: 00 00        	movs	r0, r0
     ad1: 22 ce        	ldm	r6!, {r1, r5}
     ad3: 08 00        	movs	r0, r1
     ad5: 00 01        	lsls	r0, r0, #4
     ad7: 4a 94        	str	r4, [sp, #296]
     ad9: 00 00        	movs	r0, r0
     adb: 00 74        	strb	r0, [r0, #16]
     add: 00 00        	movs	r0, r0
     adf: 00 23        	movs	r3, #0
     ae1: 65 72        	strb	r5, [r4, #9]
     ae3: 72 00        	lsls	r2, r6, #1
     ae5: 01 4a        	ldr	r2, [pc, #4]            @ 0xaec <.debug_info+0xaec>
     ae7: 94 00        	lsls	r4, r2, #2
     ae9: 00 00        	movs	r0, r0
     aeb: 92 00        	lsls	r2, r2, #2
     aed: 00 00        	movs	r0, r0
     aef: 22 31        	adds	r1, #34
     af1: 09 00        	movs	r1, r1
     af3: 00 01        	lsls	r0, r0, #4
     af5: 4b 94        	str	r4, [sp, #300]
     af7: 00 00        	movs	r0, r0
     af9: 00 b0        	add	sp, #0
     afb: 00 00        	movs	r0, r0
     afd: 00 21        	movs	r1, #0
     aff: dd 00        	lsls	r5, r3, #3
     b01: 00 00        	movs	r0, r0
     b03: 01 4c        	ldr	r4, [pc, #4]            @ 0xb08 <.debug_info+0xb08>
     b05: b8 00        	lsls	r0, r7, #2
     b07: 00 00        	movs	r0, r0
     b09: 05 03        	lsls	r5, r0, #12
     b0b: 00 00        	movs	r0, r0
     b0d: 00 00        	movs	r0, r0
     b0f: 21 75        	strb	r1, [r4, #20]
     b11: 0b 00        	movs	r3, r1
     b13: 00 01        	lsls	r0, r0, #4
     b15: 4d 94        	str	r4, [sp, #308]
     b17: 00 00        	movs	r0, r0
     b19: 00 05        	lsls	r0, r0, #20
     b1b: 03 00        	movs	r3, r0
     b1d: 00 00        	movs	r0, r0
     b1f: 00 22        	movs	r2, #0
     b21: 49 10        	asrs	r1, r1, #1
     b23: 00 00        	movs	r0, r0
     b25: 01 4f        	ldr	r7, [pc, #4]            @ 0xb2c <.debug_info+0xb2c>
     b27: 1a 0c        	lsrs	r2, r3, #16
     b29: 00 00        	movs	r0, r0
     b2b: cf 00        	lsls	r7, r1, #3
     b2d: 00 00        	movs	r0, r0
     b2f: 24 00        	movs	r4, r4
     b31: 00 00        	movs	r0, r0
     b33: 00 57        	ldrsb	r0, [r0, r4]
     b35: 0f 00        	movs	r7, r1
     b37: 00 4a        	ldr	r2, [pc, #0]            @ 0xb38 <.debug_info+0xb38>
     b39: 0b 00        	movs	r3, r1
     b3b: 00 25        	movs	r5, #0
     b3d: 01 51        	str	r1, [r0, r4]
     b3f: 03 0a        	lsrs	r3, r0, #8
     b41: 00 20        	movs	r0, #0
     b43: 25 01        	lsls	r5, r4, #4
     b45: 50 02        	lsls	r0, r2, #9
     b47: 74 00        	lsls	r4, r6, #1
     b49: 00 24        	movs	r4, #0
     b4b: 00 00        	movs	r0, r0
     b4d: 00 00        	movs	r0, r0
     b4f: 74 0f        	lsrs	r4, r6, #29
     b51: 00 00        	movs	r0, r0
     b53: 65 0b        	lsrs	r5, r4, #13
     b55: 00 00        	movs	r0, r0
     b57: 25 01        	lsls	r5, r4, #4
     b59: 51 03        	lsls	r1, r2, #13
     b5b: 0a 00        	movs	r2, r1
     b5d: 40 25        	movs	r5, #64
     b5f: 01 50        	str	r1, [r0, r0]
     b61: 02 74        	strb	r2, [r0, #16]
     b63: 00 00        	movs	r0, r0
     b65: 24 00        	movs	r4, r4
     b67: 00 00        	movs	r0, r0
     b69: 00 57        	ldrsb	r0, [r0, r4]
     b6b: 0f 00        	movs	r7, r1
     b6d: 00 80        	strh	r0, [r0]
     b6f: 0b 00        	movs	r3, r1
     b71: 00 25        	movs	r5, #0
     b73: 01 51        	str	r1, [r0, r4]
     b75: 03 0a        	lsrs	r3, r0, #8
     b77: 00 40        	ands	r0, r0
     b79: 25 01        	lsls	r5, r4, #4
     b7b: 50 02        	lsls	r0, r2, #9
     b7d: 74 00        	lsls	r4, r6, #1
     b7f: 00 24        	movs	r4, #0
     b81: 00 00        	movs	r0, r0
     b83: 00 00        	movs	r0, r0
     b85: 74 0f        	lsrs	r4, r6, #29
     b87: 00 00        	movs	r0, r0
     b89: 9b 0b        	lsrs	r3, r3, #14
     b8b: 00 00        	movs	r0, r0
     b8d: 25 01        	lsls	r5, r4, #4
     b8f: 51 03        	lsls	r1, r2, #13
     b91: 0a 00        	movs	r2, r1
     b93: 20 25        	movs	r5, #32
     b95: 01 50        	str	r1, [r0, r0]
     b97: 02 74        	strb	r2, [r0, #16]
     b99: 00 00        	movs	r0, r0
     b9b: 26 00        	movs	r6, r4
     b9d: 00 00        	movs	r0, r0
     b9f: 00 8b        	ldrh	r0, [r0, #24]
     ba1: 0f 00        	movs	r7, r1
     ba3: 00 24        	movs	r4, #0
     ba5: 00 00        	movs	r0, r0
     ba7: 00 00        	movs	r0, r0
     ba9: 8b 0f        	lsrs	r3, r1, #30
     bab: 00 00        	movs	r0, r0
     bad: bb 0b        	lsrs	r3, r7, #14
     baf: 00 00        	movs	r0, r0
     bb1: 25 01        	lsls	r5, r4, #4
     bb3: 51 05        	lsls	r1, r2, #21
     bb5: 0c f4 7c 0a  	and	r10, r12, #16515072
     bb9: 00 00        	movs	r0, r0
     bbb: 24 00        	movs	r4, r4
     bbd: 00 00        	movs	r0, r0
     bbf: 00 a5        	adr	r5, #0 <.debug_info+0xbc3>
     bc1: 0f 00        	movs	r7, r1
     bc3: 00 e1        	b	0xdc7 <.debug_info+0xdc7> @ imm = #512
     bc5: 0b 00        	movs	r3, r1
     bc7: 00 25        	movs	r5, #0
     bc9: 01 53        	strh	r1, [r0, r4]
     bcb: 02 75        	strb	r2, [r0, #20]
     bcd: 00 25        	movs	r5, #0
     bcf: 01 52        	strh	r1, [r0, r0]
     bd1: 02 74        	strb	r2, [r0, #16]
     bd3: 04 25        	movs	r5, #4
     bd5: 01 51        	str	r1, [r0, r4]
     bd7: 02 74        	strb	r2, [r0, #16]
     bd9: 00 25        	movs	r5, #0
     bdb: 02 7d        	ldrb	r2, [r0, #20]
     bdd: 00 01        	lsls	r0, r0, #4
     bdf: 30 00        	movs	r0, r6
     be1: 24 00        	movs	r4, r4
     be3: 00 00        	movs	r0, r0
     be5: 00 e0        	b	0xbe9 <.debug_info+0xbe9> @ imm = #0
     be7: 0f 00        	movs	r7, r1
     be9: 00 f8 0b 00  	strb.w	r0, [r0, r11]
     bed: 00 25        	movs	r5, #0
     bef: 01 51        	str	r1, [r0, r4]
     bf1: 05 03        	lsls	r5, r0, #12
     bf3: 00 00        	movs	r0, r0
     bf5: 00 00        	movs	r0, r0
     bf7: 00 27        	movs	r7, #0
     bf9: 00 00        	movs	r0, r0
     bfb: 00 00        	movs	r0, r0
     bfd: fc 0f        	lsrs	r4, r7, #31
     bff: 00 00        	movs	r0, r0
     c01: 25 01        	lsls	r5, r4, #4
     c03: 50 02        	lsls	r0, r2, #9
     c05: 75 00        	lsls	r5, r6, #1
     c07: 00 00        	movs	r0, r0
     c09: 0e ce        	ldm	r6!, {r1, r2, r3}
     c0b: 00 00        	movs	r0, r0
     c0d: 00 1a        	subs	r0, r0, r0
     c0f: 0c 00        	movs	r4, r1
     c11: 00 11        	asrs	r0, r0, #4
     c13: a4 00        	lsls	r4, r4, #2
     c15: 00 00        	movs	r0, r0
     c17: ff 0f        	lsrs	r7, r7, #31
     c19: 00 06        	lsls	r0, r0, #24
     c1b: 04 ce        	ldm	r6!, {r2}
     c1d: 00 00        	movs	r0, r0
     c1f: 00 28        	cmp	r0, #0
     c21: 7e 08        	lsrs	r6, r7, #1
     c23: 00 00        	movs	r0, r0
     c25: 01 7f        	ldrb	r1, [r0, #28]
     c27: 00 00        	movs	r0, r0
     c29: 00 00        	movs	r0, r0
     c2b: bc 00        	lsls	r4, r7, #2
     c2d: 00 00        	movs	r0, r0
     c2f: 01 9c        	ldr	r4, [sp, #4]
     c31: 44 0d        	lsrs	r4, r0, #21
     c33: 00 00        	movs	r0, r0
     c35: 21 c6        	stm	r6!, {r0, r5}
     c37: 09 00        	movs	r1, r1
     c39: 00 01        	lsls	r0, r0, #4
     c3b: 80 e0        	b	0xd3f <.debug_info+0xd3f> @ imm = #256
     c3d: 08 00        	movs	r0, r1
     c3f: 00 02        	lsls	r0, r0, #8
     c41: 91 68        	ldr	r1, [r2, #8]
     c43: 21 5a        	ldrh	r1, [r4, r0]
     c45: 02 00        	movs	r2, r0
     c47: 00 01        	lsls	r0, r0, #4
     c49: 81 3c        	subs	r4, #129
     c4b: 09 00        	movs	r1, r1
     c4d: 00 02        	lsls	r0, r0, #8
     c4f: 91 58        	ldr	r1, [r2, r2]
     c51: 29 5e        	ldrsh	r1, [r5, r0]
     c53: 0a 00        	movs	r2, r1
     c55: 00 00        	movs	r0, r0
     c57: 00 00        	movs	r0, r0
     c59: 00 18        	adds	r0, r0, r0
     c5b: 00 00        	movs	r0, r0
     c5d: 00 01        	lsls	r0, r0, #4
     c5f: 83 8b        	ldrh	r3, [r0, #28]
     c61: 0c 00        	movs	r4, r1
     c63: 00 2a        	cmp	r2, #0
     c65: 6f 0a        	lsrs	r7, r5, #9
     c67: 00 00        	movs	r0, r0
     c69: 02 01        	lsls	r2, r0, #4
     c6b: 00 00        	movs	r0, r0
     c6d: 2b 38        	subs	r0, #43
     c6f: 0a 00        	movs	r2, r1
     c71: 00 00        	movs	r0, r0
     c73: 00 00        	movs	r0, r0
     c75: 00 08        	lsrs	r0, r0, #32
     c77: 00 00        	movs	r0, r0
     c79: 00 02        	lsls	r0, r0, #8
     c7b: 06 05        	lsls	r6, r0, #20
     c7d: 2c 51        	str	r4, [r5, r4]
     c7f: 0a 00        	movs	r2, r1
     c81: 00 0f        	lsrs	r0, r0, #28
     c83: 2d 45        	cmp	r5, r5
     c85: 0a 00        	movs	r2, r1
     c87: 00 7f        	ldrb	r0, [r0, #28]
     c89: 00 00        	movs	r0, r0
     c8b: 24 00        	movs	r4, r4
     c8d: 00 00        	movs	r0, r0
     c8f: 00 12        	asrs	r0, r0, #8
     c91: 10 00        	movs	r0, r2
     c93: 00 a5        	adr	r5, #0 <.debug_info+0xc97>
     c95: 0c 00        	movs	r4, r1
     c97: 00 25        	movs	r5, #0
     c99: 01 51        	str	r1, [r0, r4]
     c9b: 01 31        	adds	r1, #1
     c9d: 25 01        	lsls	r5, r4, #4
     c9f: 50 03        	lsls	r0, r2, #13
     ca1: 40 3f        	subs	r7, #64
     ca3: 24 00        	movs	r4, r4
     ca5: 24 00        	movs	r4, r4
     ca7: 00 00        	movs	r0, r0
     ca9: 00 29        	cmp	r1, #0
     cab: 10 00        	movs	r0, r2
     cad: 00 bd        	pop	{pc}
     caf: 0c 00        	movs	r4, r1
     cb1: 00 25        	movs	r5, #0
     cb3: 01 51        	str	r1, [r0, r4]
     cb5: 01 31        	adds	r1, #1
     cb7: 25 01        	lsls	r5, r4, #4
     cb9: 50 01        	lsls	r0, r2, #5
     cbb: 34 00        	movs	r4, r6
     cbd: 24 00        	movs	r4, r4
     cbf: 00 00        	movs	r0, r0
     cc1: 00 40        	ands	r0, r0
     cc3: 10 00        	movs	r0, r2
     cc5: 00 d7        	bvc	0xcc9 <.debug_info+0xcc9> @ imm = #0
     cc7: 0c 00        	movs	r4, r1
     cc9: 00 25        	movs	r5, #0
     ccb: 01 51        	str	r1, [r0, r4]
     ccd: 02 91        	str	r1, [sp, #8]
     ccf: 68 25        	movs	r5, #104
     cd1: 01 50        	str	r1, [r0, r0]
     cd3: 02 75        	strb	r2, [r0, #20]
     cd5: 00 00        	movs	r0, r0
     cd7: 24 00        	movs	r4, r4
     cd9: 00 00        	movs	r0, r0
     cdb: 00 5d        	ldrb	r0, [r0, r4]
     cdd: 10 00        	movs	r0, r2
     cdf: 00 f5 0c 00  	add.w	r0, r0, #9175040
     ce3: 00 25        	movs	r5, #0
     ce5: 01 52        	strh	r1, [r0, r0]
     ce7: 01 38        	subs	r0, #1
     ce9: 25 01        	lsls	r5, r4, #4
     ceb: 51 01        	lsls	r1, r2, #5
     ced: 3a 25        	movs	r5, #58
     cef: 01 50        	str	r1, [r0, r0]
     cf1: 02 75        	strb	r2, [r0, #20]
     cf3: 00 00        	movs	r0, r0
     cf5: 24 00        	movs	r4, r4
     cf7: 00 00        	movs	r0, r0
     cf9: 00 5d        	ldrb	r0, [r0, r4]
     cfb: 10 00        	movs	r0, r2
     cfd: 00 13        	asrs	r0, r0, #12
     cff: 0d 00        	movs	r5, r1
     d01: 00 25        	movs	r5, #0
     d03: 01 52        	strh	r1, [r0, r0]
     d05: 01 38        	subs	r0, #1
     d07: 25 01        	lsls	r5, r4, #4
     d09: 51 01        	lsls	r1, r2, #5
     d0b: 3b 25        	movs	r5, #59
     d0d: 01 50        	str	r1, [r0, r0]
     d0f: 02 75        	strb	r2, [r0, #20]
     d11: 00 00        	movs	r0, r0
     d13: 24 00        	movs	r4, r4
     d15: 00 00        	movs	r0, r0
     d17: 00 79        	ldrb	r0, [r0, #4]
     d19: 10 00        	movs	r0, r2
     d1b: 00 2d        	cmp	r5, #0
     d1d: 0d 00        	movs	r5, r1
     d1f: 00 25        	movs	r5, #0
     d21: 01 51        	str	r1, [r0, r4]
     d23: 02 7d        	ldrb	r2, [r0, #20]
     d25: 00 25        	movs	r5, #0
     d27: 01 50        	str	r1, [r0, r0]
     d29: 02 74        	strb	r2, [r0, #16]
     d2b: 00 00        	movs	r0, r0
     d2d: 27 00        	movs	r7, r4
     d2f: 00 00        	movs	r0, r0
     d31: 00 9c        	ldr	r4, [sp]
     d33: 10 00        	movs	r0, r2
     d35: 00 25        	movs	r5, #0
     d37: 01 51        	str	r1, [r0, r4]
     d39: 02 76        	strb	r2, [r0, #24]
     d3b: 00 25        	movs	r5, #0
     d3d: 01 50        	str	r1, [r0, r0]
     d3f: 02 74        	strb	r2, [r0, #16]
     d41: 00 00        	movs	r0, r0
     d43: 00 2e        	cmp	r6, #0
     d45: 4b 04        	lsls	r3, r1, #17
     d47: 00 00        	movs	r0, r0
     d49: 01 b5        	push	{r0, lr}
     d4b: 94 00        	lsls	r4, r2, #2
     d4d: 00 00        	movs	r0, r0
     d4f: 10 09        	lsrs	r0, r2, #4
     d51: 00 20        	movs	r0, #0
     d53: 5c 00        	lsls	r4, r3, #1
     d55: 00 00        	movs	r0, r0
     d57: 01 9c        	ldr	r4, [sp, #4]
     d59: ee 0d        	lsrs	r6, r5, #23
     d5b: 00 00        	movs	r0, r0
     d5d: 21 c6        	stm	r6!, {r0, r5}
     d5f: 09 00        	movs	r1, r1
     d61: 00 01        	lsls	r0, r0, #4
     d63: b6 e0        	b	0xed3 <.debug_info+0xed3> @ imm = #364
     d65: 08 00        	movs	r0, r1
     d67: 00 02        	lsls	r0, r0, #8
     d69: 91 68        	ldr	r1, [r2, #8]
     d6b: 24 1c        	adds	r4, r4, #0
     d6d: 09 00        	movs	r1, r1
     d6f: 20 29        	cmp	r1, #32
     d71: 10 00        	movs	r0, r2
     d73: 00 83        	strh	r0, [r0, #24]
     d75: 0d 00        	movs	r5, r1
     d77: 00 25        	movs	r5, #0
     d79: 01 51        	str	r1, [r0, r4]
     d7b: 01 31        	adds	r1, #1
     d7d: 25 01        	lsls	r5, r4, #4
     d7f: 50 01        	lsls	r0, r2, #5
     d81: 38 00        	movs	r0, r7
     d83: 24 42        	tst	r4, r4
     d85: 09 00        	movs	r1, r1
     d87: 20 40        	ands	r0, r4
     d89: 10 00        	movs	r0, r2
     d8b: 00 9d        	ldr	r5, [sp]
     d8d: 0d 00        	movs	r5, r1
     d8f: 00 25        	movs	r5, #0
     d91: 01 51        	str	r1, [r0, r4]
     d93: 02 7d        	ldrb	r2, [r0, #20]
     d95: 00 25        	movs	r5, #0
     d97: 01 50        	str	r1, [r0, r0]
     d99: 02 75        	strb	r2, [r0, #20]
     d9b: 00 00        	movs	r0, r0
     d9d: 24 50        	str	r4, [r4, r0]
     d9f: 09 00        	movs	r1, r1
     da1: 20 b3        	cbz	r0, 0xded <.debug_info+0xded> @ imm = #72
     da3: 10 00        	movs	r0, r2
     da5: 00           	<unknown>
     da6: c2 0d        	lsrs	r2, r0, #23
     da8: 00 00        	movs	r0, r0
     daa: 25 01        	lsls	r5, r4, #4
     dac: 53 02        	lsls	r3, r2, #9
     dae: 74 00        	lsls	r4, r6, #1
     db0: 25 01        	lsls	r5, r4, #4
     db2: 52 01        	lsls	r2, r2, #5
     db4: 36 25        	movs	r5, #54
     db6: 01 51        	str	r1, [r0, r4]
     db8: 01 32        	adds	r2, #1
     dba: 25 01        	lsls	r5, r4, #4
     dbc: 50 03        	lsls	r0, r2, #13
     dbe: 0a 0f        	lsrs	r2, r1, #28
     dc0: 01 00        	movs	r1, r0
     dc2: 24 56        	ldrsb	r4, [r4, r0]
     dc4: 09 00        	movs	r1, r1
     dc6: 20 d3        	blo	0xe0a <.debug_info+0xe0a> @ imm = #64
     dc8: 10 00        	movs	r0, r2
     dca: 00 d6        	bvs	0xdce <.debug_info+0xdce> @ imm = #0
     dcc: 0d 00        	movs	r5, r1
     dce: 00 25        	movs	r5, #0
     dd0: 01 50        	str	r1, [r0, r0]
     dd2: 02 08        	lsrs	r2, r0, #32
     dd4: cf 00        	lsls	r7, r1, #3
     dd6: 27 60        	str	r7, [r4]
     dd8: 09 00        	movs	r1, r1
     dda: 20 57        	ldrsb	r0, [r4, r4]
     ddc: 0f 00        	movs	r7, r1
     dde: 00 25        	movs	r5, #0
     de0: 01 51        	str	r1, [r0, r4]
     de2: 03 0b        	lsrs	r3, r0, #12
     de4: 00 80        	strh	r0, [r0]
     de6: 25 01        	lsls	r5, r4, #4
     de8: 50 02        	lsls	r0, r2, #9
     dea: 75 00        	lsls	r5, r6, #1
     dec: 00 00        	movs	r0, r0
     dee: 2f b9        	cbnz	r7, 0xdfc <.debug_info+0xdfc> @ imm = #10
     df0: 03 00        	movs	r3, r0
     df2: 00 01        	lsls	r0, r0, #4
     df4: ce 00        	lsls	r6, r1, #3
     df6: 00 00        	movs	r0, r0
     df8: 00 20        	movs	r0, #0
     dfa: 00 00        	movs	r0, r0
     dfc: 00 01        	lsls	r0, r0, #4
     dfe: 9c 30        	adds	r0, #156
     e00: c8 00        	lsls	r0, r1, #3
     e02: 00 00        	movs	r0, r0
     e04: 01 d9        	bls	0xe0a <.debug_info+0xe0a> @ imm = #2
     e06: 00 00        	movs	r0, r0
     e08: 00 00        	movs	r0, r0
     e0a: 1c 00        	movs	r4, r3
     e0c: 00 00        	movs	r0, r0
     e0e: 01 9c        	ldr	r4, [sp, #4]
     e10: 22 0e        	lsrs	r2, r4, #24
     e12: 00 00        	movs	r0, r0
     e14: 31 94        	str	r4, [sp, #196]
     e16: 04 00        	movs	r4, r0
     e18: 00 01        	lsls	r0, r0, #4
     e1a: d9 80        	strh	r1, [r3, #6]
     e1c: 04 00        	movs	r4, r0
     e1e: 00 01        	lsls	r0, r0, #4
     e20: 50 00        	lsls	r0, r2, #1
     e22: 2e 1d        	adds	r6, r5, #4
     e24: 0c 00        	movs	r4, r1
     e26: 00 01        	lsls	r0, r0, #4
     e28: 1d 94        	str	r4, [sp, #116]
     e2a: 00 00        	movs	r0, r0
     e2c: 00 00        	movs	r0, r0
     e2e: 00 00        	movs	r0, r0
     e30: 00 70        	strb	r0, [r0]
     e32: 00 00        	movs	r0, r0
     e34: 00 01        	lsls	r0, r0, #4
     e36: 9c d0        	beq	0xd72 <.debug_info+0xd72> @ imm = #-200
     e38: 0e 00        	movs	r6, r1
     e3a: 00 22        	movs	r2, #0
     e3c: ce 0b        	lsrs	r6, r1, #15
     e3e: 00 00        	movs	r0, r0
     e40: 01 1f        	subs	r1, r0, #4
     e42: 94 00        	lsls	r4, r2, #2
     e44: 00 00        	movs	r0, r0
     e46: 41 01        	lsls	r1, r0, #5
     e48: 00 00        	movs	r0, r0
     e4a: 26 00        	movs	r6, r4
     e4c: 00 00        	movs	r0, r0
     e4e: 00 20        	movs	r0, #0
     e50: 0c 00        	movs	r4, r1
     e52: 00 26        	movs	r6, #0
     e54: 00 00        	movs	r0, r0
     e56: 00 00        	movs	r0, r0
     e58: e4 10        	asrs	r4, r4, #3
     e5a: 00 00        	movs	r0, r0
     e5c: 24 00        	movs	r4, r4
     e5e: 00 00        	movs	r0, r0
     e60: 00           	<unknown>
     e61: ef 10        	asrs	r7, r5, #3
     e63: 00 00        	movs	r0, r0
     e65: 7c 0e        	lsrs	r4, r7, #25
     e67: 00 00        	movs	r0, r0
     e69: 25 01        	lsls	r5, r4, #4
     e6b: 51 05        	lsls	r1, r2, #21
     e6d: 03 00        	movs	r3, r0
     e6f: 00 00        	movs	r0, r0
     e71: 00 25        	movs	r5, #0
     e73: 01 50        	str	r1, [r0, r0]
     e75: 05 0c        	lsrs	r5, r0, #16
     e77: 00 4c        	ldr	r4, [pc, #0]            @ 0xe78 <.debug_info+0xe78>
     e79: 00 40        	ands	r0, r0
     e7b: 00 24        	movs	r4, #0
     e7d: 00 00        	movs	r0, r0
     e7f: 00 00        	movs	r0, r0
     e81: 0f 11        	asrs	r7, r1, #4
     e83: 00 00        	movs	r0, r0
     e85: 98 0e        	lsrs	r0, r3, #26
     e87: 00 00        	movs	r0, r0
     e89: 25 01        	lsls	r5, r4, #4
     e8b: 51 01        	lsls	r1, r2, #5
     e8d: 30 25        	movs	r5, #48
     e8f: 01 50        	str	r1, [r0, r0]
     e91: 05 03        	lsls	r5, r0, #12
     e93: 00 00        	movs	r0, r0
     e95: 00 00        	movs	r0, r0
     e97: 00 24        	movs	r4, #0
     e99: 00 00        	movs	r0, r0
     e9b: 00 00        	movs	r0, r0
     e9d: ff 0d        	lsrs	r7, r7, #23
     e9f: 00 00        	movs	r0, r0
     ea1: ab 0e        	lsrs	r3, r5, #26
     ea3: 00 00        	movs	r0, r0
     ea5: 25 01        	lsls	r5, r4, #4
     ea7: 50 01        	lsls	r0, r2, #5
     ea9: 3a 00        	movs	r2, r7
     eab: 24 00        	movs	r4, r4
     ead: 00 00        	movs	r0, r0
     eaf: 00 d3        	blo	0xeb3 <.debug_info+0xeb3> @ imm = #0
     eb1: 10 00        	movs	r0, r2
     eb3: 00 bf        	nop
     eb5: 0e 00        	movs	r6, r1
     eb7: 00 25        	movs	r5, #0
     eb9: 01 50        	str	r1, [r0, r0]
     ebb: 02 08        	lsrs	r2, r0, #32
     ebd: cf 00        	lsls	r7, r1, #3
     ebf: 27 00        	movs	r7, r4
     ec1: 00 00        	movs	r0, r0
     ec3: 00 d3        	blo	0xec7 <.debug_info+0xec7> @ imm = #0
     ec5: 10 00        	movs	r0, r2
     ec7: 00 25        	movs	r5, #0
     ec9: 01 50        	str	r1, [r0, r0]
     ecb: 02 08        	lsrs	r2, r0, #32
     ecd: af 00        	lsls	r7, r5, #2
     ecf: 00 2f        	cmp	r7, #0
     ed1: 7d 08        	lsrs	r5, r7, #1
     ed3: 00 00        	movs	r0, r0
     ed5: 01 e2        	b	0x12db <.debug_info+0x12db> @ imm = #1026
     ed7: 00 00        	movs	r0, r0
     ed9: 00 00        	movs	r0, r0
     edb: 02 00        	movs	r2, r0
     edd: 00 00        	movs	r0, r0
     edf: 01 9c        	ldr	r4, [sp, #4]
     ee1: 32           	<unknown>
     ee2: f5 0b        	lsrs	r5, r6, #15
     ee4: 00 00        	movs	r0, r0
     ee6: 02 1a        	subs	r2, r0, r0
     ee8: 05 6f        	ldr	r5, [r0, #112]
     eea: 06 00        	movs	r6, r0
     eec: 00 33        	adds	r3, #0
     eee: cd 05        	lsls	r5, r1, #23
     ef0: 00 00        	movs	r0, r0
     ef2: 0a 37        	adds	r7, #10
     ef4: ef 00        	lsls	r7, r5, #3
     ef6: 00 00        	movs	r0, r0
     ef8: 34 d7        	bvc	0xf64 <.debug_info+0xf64> @ imm = #104
     efa: 01 00        	movs	r1, r0
     efc: 00 01        	lsls	r0, r0, #4
     efe: 0c 80        	strh	r4, [r1]
     f00: 04 00        	movs	r4, r0
     f02: 00 05        	lsls	r0, r0, #20
     f04: 03 00        	movs	r3, r0
     f06: 00 00        	movs	r0, r0
     f08: 00 34        	adds	r4, #0
     f0a: e1 01        	lsls	r1, r4, #7
     f0c: 00 00        	movs	r0, r0
     f0e: 01 0c        	lsrs	r1, r0, #16
     f10: 80 04        	lsls	r0, r0, #18
     f12: 00 00        	movs	r0, r0
     f14: 05 03        	lsls	r5, r0, #12
     f16: 00 00        	movs	r0, r0
     f18: 00 00        	movs	r0, r0
     f1a: 34 b3        	cbz	r4, 0xf6a <.debug_info+0xf6a> @ imm = #76
     f1c: 0d 00        	movs	r5, r1
     f1e: 00 01        	lsls	r0, r0, #4
     f20: 0d 2d        	cmp	r5, #13
     f22: 0a 00        	movs	r2, r1
     f24: 00 05        	lsls	r0, r0, #20
     f26: 03 00        	movs	r3, r0
     f28: 00 00        	movs	r0, r0
     f2a: 00 34        	adds	r4, #0
     f2c: 50 0c        	lsrs	r0, r2, #17
     f2e: 00 00        	movs	r0, r0
     f30: 01 0e        	lsrs	r1, r0, #24
     f32: 62 09        	lsrs	r2, r4, #5
     f34: 00 00        	movs	r0, r0
     f36: 05 03        	lsls	r5, r0, #12
     f38: 00 00        	movs	r0, r0
     f3a: 00 00        	movs	r0, r0
     f3c: 0e b1        	cbz	r6, 0xf42 <.debug_info+0xf42> @ imm = #2
     f3e: 00 00        	movs	r0, r0
     f40: 00 47        	bx	r0
     f42: 0f 00        	movs	r7, r1
     f44: 00 35        	adds	r5, #0
     f46: 00 33        	adds	r3, #0
     f48: 20 08        	lsrs	r0, r4, #32
     f4a: 00 00        	movs	r0, r0
     f4c: 01 17        	asrs	r1, r0, #28
     f4e: 52 0f        	lsrs	r2, r2, #29
     f50: 00 00        	movs	r0, r0
     f52: 07 3c        	subs	r4, #7
     f54: 0f 00        	movs	r7, r1
     f56: 00 36        	adds	r6, #0
     f58: 43 0c        	lsrs	r3, r0, #17
     f5a: 00 00        	movs	r0, r0
     f5c: 06 85        	strh	r6, [r0, #40]
     f5e: 01 6e        	ldr	r1, [r0, #96]
     f60: 0f 00        	movs	r7, r1
     f62: 00 1a        	subs	r0, r0, r0
     f64: 6e 0f        	lsrs	r6, r5, #29
     f66: 00 00        	movs	r0, r0
     f68: 1a d9        	bls	0xfa0 <.debug_info+0xfa0> @ imm = #52
     f6a: 00 00        	movs	r0, r0
     f6c: 00 00        	movs	r0, r0
     f6e: 06 04        	lsls	r6, r0, #16
     f70: 27 07        	lsls	r7, r4, #28
     f72: 00 00        	movs	r0, r0
     f74: 36 a1        	adr	r1, #216 <.debug_info+0xfae>
     f76: 09 00        	movs	r1, r1
     f78: 00 06        	lsls	r0, r0, #24
     f7a: 86 01        	lsls	r6, r0, #6
     f7c: 8b 0f        	lsrs	r3, r1, #30
     f7e: 00 00        	movs	r0, r0
     f80: 1a 6e        	ldr	r2, [r3, #96]
     f82: 0f 00        	movs	r7, r1
     f84: 00 1a        	subs	r0, r0, r0
     f86: d9 00        	lsls	r1, r3, #3
     f88: 00 00        	movs	r0, r0
     f8a: 00 37        	adds	r7, #0
     f8c: 5f 01        	lsls	r7, r3, #5
     f8e: 00 00        	movs	r0, r0
     f90: 09 84        	strh	r1, [r1, #32]
     f92: 94 00        	lsls	r4, r2, #2
     f94: 00 00        	movs	r0, r0
     f96: a5 0f        	lsrs	r5, r4, #30
     f98: 00 00        	movs	r0, r0
     f9a: 1a ab        	add	r3, sp, #104
     f9c: 00 00        	movs	r0, r0
     f9e: 00 1a        	subs	r0, r0, r0
     fa0: 94 00        	lsls	r4, r2, #2
     fa2: 00 00        	movs	r0, r0
     fa4: 00 37        	adds	r7, #0
     fa6: fb 00        	lsls	r3, r7, #3
     fa8: 00 00        	movs	r0, r0
     faa: 09 80        	strh	r1, [r1]
     fac: 94 00        	lsls	r4, r2, #2
     fae: 00 00        	movs	r0, r0
     fb0: ce 0f        	lsrs	r6, r1, #31
     fb2: 00 00        	movs	r0, r0
     fb4: 1a 62        	str	r2, [r3, #32]
     fb6: 09 00        	movs	r1, r1
     fb8: 00 1a        	subs	r0, r0, r0
     fba: ce 0f        	lsrs	r6, r1, #31
     fbc: 00 00        	movs	r0, r0
     fbe: 1a d4        	bmi	0xff6 <.debug_info+0xff6> @ imm = #52
     fc0: 0f 00        	movs	r7, r1
     fc2: 00 1a        	subs	r0, r0, r0
     fc4: da 0f        	lsrs	r2, r3, #31
     fc6: 00 00        	movs	r0, r0
     fc8: 1a 94        	str	r4, [sp, #104]
     fca: 00 00        	movs	r0, r0
     fcc: 00 00        	movs	r0, r0
     fce: 06 04        	lsls	r6, r0, #16
     fd0: ab 00        	lsls	r3, r5, #2
     fd2: 00 00        	movs	r0, r0
     fd4: 06 04        	lsls	r6, r0, #16
     fd6: 94 00        	lsls	r4, r2, #2
     fd8: 00 00        	movs	r0, r0
     fda: 06 04        	lsls	r6, r0, #16
     fdc: 49 00        	lsls	r1, r1, #1
     fde: 00 00        	movs	r0, r0
     fe0: 38 85        	strh	r0, [r7, #40]
     fe2: 0b 00        	movs	r3, r1
     fe4: 00 09        	lsrs	r0, r0, #4
     fe6: 82           	<unknown>
     fe7: f6 0f        	lsrs	r6, r6, #31
     fe9: 00 00        	movs	r0, r0
     feb: 1a 62        	str	r2, [r3, #32]
     fed: 09 00        	movs	r1, r1
     fef: 00 1a        	subs	r0, r0, r0
     ff1: f6 0f        	lsrs	r6, r6, #31
     ff3: 00 00        	movs	r0, r0
     ff5: 00 06        	lsls	r0, r0, #24
     ff7: 04 2d        	cmp	r5, #4
     ff9: 0a 00        	movs	r2, r1
     ffb: 00 38        	subs	r0, #0
     ffd: 6e 02        	lsls	r6, r5, #9
     fff: 00 00        	movs	r0, r0
    1001: 08 2c        	cmp	r4, #8
    1003: 12 10        	asrs	r2, r2, #32
    1005: 00 00        	movs	r0, r0
    1007: 1a a2        	adr	r2, #104 <.debug_info+0x1025>
    1009: 00 00        	movs	r0, r0
    100b: 00 1a        	subs	r0, r0, r0
    100d: 94 00        	lsls	r4, r2, #2
    100f: 00 00        	movs	r0, r0
    1011: 00 36        	adds	r6, #0
    1013: d8 02        	lsls	r0, r3, #11
    1015: 00 00        	movs	r0, r0
    1017: 0b e0        	b	0x1031 <.debug_info+0x1031> @ imm = #22
    1019: 01 29        	cmp	r1, #1
    101b: 10 00        	movs	r0, r2
    101d: 00 1a        	subs	r0, r0, r0
    101f: ef 00        	lsls	r7, r5, #3
    1021: 00 00        	movs	r0, r0
    1023: 1a 8a        	ldrh	r2, [r3, #16]
    1025: 06 00        	movs	r6, r0
    1027: 00 00        	movs	r0, r0
    1029: 36 e7        	b	0xe99 <.debug_info+0xe99> @ imm = #-404
    102b: 0c 00        	movs	r4, r1
    102d: 00 0b        	lsrs	r0, r0, #12
    102f: dd 01        	lsls	r5, r3, #7
    1031: 40 10        	asrs	r0, r0, #1
    1033: 00 00        	movs	r0, r0
    1035: 1a           	<unknown>
    1036: ef 00        	lsls	r7, r5, #3
    1038: 00 00        	movs	r0, r0
    103a: 1a 8a        	ldrh	r2, [r3, #16]
    103c: 06 00        	movs	r6, r0
    103e: 00 00        	movs	r0, r0
    1040: 36 cf        	ldm	r7!, {r1, r2, r4, r5}
    1042: 04 00        	movs	r4, r0
    1044: 00 06        	lsls	r0, r0, #24
    1046: 7c 01        	lsls	r4, r7, #5
    1048: 57 10        	asrs	r7, r2, #1
    104a: 00 00        	movs	r0, r0
    104c: 1a 6e        	ldr	r2, [r3, #96]
    104e: 0f 00        	movs	r7, r1
    1050: 00 1a        	subs	r0, r0, r0
    1052: 57 10        	asrs	r7, r2, #1
    1054: 00 00        	movs	r0, r0
    1056: 00 06        	lsls	r0, r0, #24
    1058: 04 e0        	b	0x1064 <.debug_info+0x1064> @ imm = #8
    105a: 08 00        	movs	r0, r1
    105c: 00 36        	adds	r6, #0
    105e: 83 08        	lsrs	r3, r0, #2
    1060: 00 00        	movs	r0, r0
    1062: 06 8c        	ldrh	r6, [r0, #32]
    1064: 01 79        	ldrb	r1, [r0, #4]
    1066: 10 00        	movs	r0, r2
    1068: 00 1a        	subs	r0, r0, r0
    106a: 6e 0f        	lsrs	r6, r5, #29
    106c: 00 00        	movs	r0, r0
    106e: 1a d9        	bls	0x10a6 <.debug_info+0x10a6> @ imm = #52
    1070: 00 00        	movs	r0, r0
    1072: 00 1a        	subs	r0, r0, r0
    1074: c3 00        	lsls	r3, r0, #3
    1076: 00 00        	movs	r0, r0
    1078: 00 36        	adds	r6, #0
    107a: 89 04        	lsls	r1, r1, #18
    107c: 00 00        	movs	r0, r0
    107e: 07 72        	strb	r7, [r0, #8]
    1080: 01 90        	str	r0, [sp, #4]
    1082: 10 00        	movs	r0, r2
    1084: 00 1a        	subs	r0, r0, r0
    1086: 90 10        	asrs	r0, r2, #2
    1088: 00 00        	movs	r0, r0
    108a: 1a 96        	str	r6, [sp, #104]
    108c: 10 00        	movs	r0, r2
    108e: 00 00        	movs	r0, r0
    1090: 06 04        	lsls	r6, r0, #16
    1092: f1 07        	lsls	r1, r6, #31
    1094: 00 00        	movs	r0, r0
    1096: 06 04        	lsls	r6, r0, #16
    1098: 3c 09        	lsrs	r4, r7, #4
    109a: 00 00        	movs	r0, r0
    109c: 36 e3        	b	0x170c <.debug_info+0x170c> @ imm = #1644
    109e: 09 00        	movs	r1, r1
    10a0: 00 07        	lsls	r0, r0, #28
    10a2: 76 01        	lsls	r6, r6, #5
    10a4: b3 10        	asrs	r3, r6, #2
    10a6: 00 00        	movs	r0, r0
    10a8: 1a 90        	str	r0, [sp, #104]
    10aa: 10 00        	movs	r0, r2
    10ac: 00 1a        	subs	r0, r0, r0
    10ae: 8a 06        	lsls	r2, r1, #26
    10b0: 00 00        	movs	r0, r0
    10b2: 00 38        	subs	r0, #0
    10b4: 53 06        	lsls	r3, r2, #25
    10b6: 00 00        	movs	r0, r0
    10b8: 08 14        	asrs	r0, r1, #16
    10ba: d3 10        	asrs	r3, r2, #3
    10bc: 00 00        	movs	r0, r0
    10be: 1a 94        	str	r4, [sp, #104]
    10c0: 00 00        	movs	r0, r0
    10c2: 00 1a        	subs	r0, r0, r0
    10c4: 94 00        	lsls	r4, r2, #2
    10c6: 00 00        	movs	r0, r0
    10c8: 1a 94        	str	r4, [sp, #104]
    10ca: 00 00        	movs	r0, r0
    10cc: 00 1a        	subs	r0, r0, r0
    10ce: 94 00        	lsls	r4, r2, #2
    10d0: 00 00        	movs	r0, r0
    10d2: 00 38        	subs	r0, #0
    10d4: d9 04        	lsls	r1, r3, #19
    10d6: 00 00        	movs	r0, r0
    10d8: 08 1b        	subs	r0, r1, r4
    10da: e4 10        	asrs	r4, r4, #3
    10dc: 00 00        	movs	r0, r0
    10de: 1a 94        	str	r4, [sp, #104]
    10e0: 00 00        	movs	r0, r0
    10e2: 00 00        	movs	r0, r0
    10e4: 39 05        	lsls	r1, r7, #20
    10e6: 01 00        	movs	r1, r0
    10e8: 00 09        	lsrs	r0, r0, #4
    10ea: 7e 62        	str	r6, [r7, #36]
    10ec: 09 00        	movs	r1, r1
    10ee: 00 37        	adds	r7, #0
    10f0: eb 01        	lsls	r3, r5, #7
    10f2: 00 00        	movs	r0, r0
    10f4: 0c 0f        	lsrs	r4, r1, #28
    10f6: 94 00        	lsls	r4, r2, #2
    10f8: 00 00        	movs	r0, r0
    10fa: 09 11        	asrs	r1, r1, #4
    10fc: 00 00        	movs	r0, r0
    10fe: 1a 90        	str	r0, [sp, #104]
    1100: 10 00        	movs	r0, r2
    1102: 00 1a        	subs	r0, r0, r0
    1104: 09 11        	asrs	r1, r1, #4
    1106: 00 00        	movs	r0, r0
    1108: 00 06        	lsls	r0, r0, #24
    110a: 04 80        	strh	r4, [r0]
    110c: 04 00        	movs	r4, r0
    110e: 00 38        	subs	r0, #0
    1110: 9d 0d        	lsrs	r5, r3, #22
    1112: 00 00        	movs	r0, r0
    1114: 08 23        	movs	r3, #8
    1116: 25 11        	asrs	r5, r4, #4
    1118: 00 00        	movs	r0, r0
    111a: 1a 25        	movs	r5, #26
    111c: 11 00        	movs	r1, r2
    111e: 00 1a        	subs	r0, r0, r0
    1120: a2 00        	lsls	r2, r4, #2
    1122: 00 00        	movs	r0, r0
    1124: 00 06        	lsls	r0, r0, #24
    1126: 04 47        	bx	r0
    1128: 09 00        	movs	r1, r1
    112a: 00 00        	movs	r0, r0
    112c: 45 14        	asrs	r5, r0, #17
    112e: 00 00        	movs	r0, r0
    1130: 04 00        	movs	r4, r0
    1132: 28 03        	lsls	r0, r5, #12
    1134: 00 00        	movs	r0, r0
    1136: 04 01        	lsls	r4, r0, #4
    1138: d8 06        	lsls	r0, r3, #27
    113a: 00 00        	movs	r0, r0
    113c: 01 63        	str	r1, [r0, #48]
    113e: 10 00        	movs	r0, r2
    1140: 00 68        	ldr	r0, [r0]
    1142: 0a 00        	movs	r2, r1
    1144: 00 40        	ands	r0, r0
    1146: 00 00        	movs	r0, r0
    1148: 00 00        	movs	r0, r0
    114a: 00 00        	movs	r0, r0
    114c: 00 8e        	ldrh	r0, [r0, #48]
    114e: 02 00        	movs	r2, r0
    1150: 00 02        	lsls	r0, r0, #8
    1152: 01 06        	lsls	r1, r0, #24
    1154: 05 03        	lsls	r5, r0, #12
    1156: 00 00        	movs	r0, r0
    1158: 03 89        	ldrh	r3, [r0, #8]
    115a: 01 00        	movs	r1, r0
    115c: 00 03        	lsls	r0, r0, #12
    115e: 1d 37        	adds	r7, #29
    1160: 00 00        	movs	r0, r0
    1162: 00 02        	lsls	r0, r0, #8
    1164: 01 08        	lsrs	r1, r0, #32
    1166: 03 03        	lsls	r3, r0, #12
    1168: 00 00        	movs	r0, r0
    116a: 03 22        	movs	r2, #3
    116c: 0a 00        	movs	r2, r1
    116e: 00 03        	lsls	r0, r0, #12
    1170: 29 49        	ldr	r1, [pc, #164]          @ 0x1218 <.debug_info+0x1218>
    1172: 00 00        	movs	r0, r0
    1174: 00 02        	lsls	r0, r0, #8
    1176: 02 05        	lsls	r2, r0, #20
    1178: 4c 0b        	lsrs	r4, r1, #13
    117a: 00 00        	movs	r0, r0
    117c: 03 fd 03 00  	stc2	p0, c0, [r3, #-12]
    1180: 00 03        	lsls	r0, r0, #12
    1182: 2b 5b        	ldrh	r3, [r5, r4]
    1184: 00 00        	movs	r0, r0
    1186: 00 02        	lsls	r0, r0, #8
    1188: 02 07        	lsls	r2, r0, #28
    118a: 09 0d        	lsrs	r1, r1, #20
    118c: 00 00        	movs	r0, r0
    118e: 03 82        	strh	r3, [r0, #16]
    1190: 0d 00        	movs	r5, r1
    1192: 00 03        	lsls	r0, r0, #12
    1194: 3f 6d        	ldr	r7, [r7, #80]
    1196: 00 00        	movs	r0, r0
    1198: 00 02        	lsls	r0, r0, #8
    119a: 04 05        	lsls	r4, r0, #20
    119c: cf 06        	lsls	r7, r1, #27
    119e: 00 00        	movs	r0, r0
    11a0: 03 b5        	push	{r0, r1, lr}
    11a2: 06 00        	movs	r6, r0
    11a4: 00 03        	lsls	r0, r0, #12
    11a6: 41 7f        	ldrb	r1, [r0, #29]
    11a8: 00 00        	movs	r0, r0
    11aa: 00 02        	lsls	r0, r0, #8
    11ac: 04 07        	lsls	r4, r0, #28
    11ae: 8f 09        	lsrs	r7, r1, #6
    11b0: 00 00        	movs	r0, r0
    11b2: 02 08        	lsrs	r2, r0, #32
    11b4: 05 ca        	ldm	r2, {r0, r2}
    11b6: 06 00        	movs	r6, r0
    11b8: 00 02        	lsls	r0, r0, #8
    11ba: 08 07        	lsls	r0, r1, #28
    11bc: 8a 09        	lsrs	r2, r1, #6
    11be: 00 00        	movs	r0, r0
    11c0: 04 04        	lsls	r4, r0, #16
    11c2: 05 69        	ldr	r5, [r0, #16]
    11c4: 6e 74        	strb	r6, [r5, #17]
    11c6: 00 02        	lsls	r0, r0, #8
    11c8: 04 07        	lsls	r4, r0, #28
    11ca: 94 09        	lsrs	r4, r2, #6
    11cc: 00 00        	movs	r0, r0
    11ce: 03 8b        	ldrh	r3, [r0, #24]
    11d0: 01 00        	movs	r1, r0
    11d2: 00 04        	lsls	r0, r0, #16
    11d4: 14 2c        	cmp	r4, #20
    11d6: 00 00        	movs	r0, r0
    11d8: 00 03        	lsls	r0, r0, #12
    11da: 24 0a        	lsrs	r4, r4, #8
    11dc: 00 00        	movs	r0, r0
    11de: 04 19        	adds	r4, r0, r4
    11e0: 3e 00        	movs	r6, r7
    11e2: 00 00        	movs	r0, r0
    11e4: 03           	<unknown>
    11e5: ff 03        	lsls	r7, r7, #15
    11e7: 00 00        	movs	r0, r0
    11e9: 04 1a        	subs	r4, r0, r0
    11eb: 50 00        	lsls	r0, r2, #1
    11ed: 00 00        	movs	r0, r0
    11ef: 03 84        	strh	r3, [r0, #32]
    11f1: 0d 00        	movs	r5, r1
    11f3: 00 04        	lsls	r0, r0, #16
    11f5: 1f 62        	str	r7, [r3, #32]
    11f7: 00 00        	movs	r0, r0
    11f9: 00 03        	lsls	r0, r0, #12
    11fb: b7 06        	lsls	r7, r6, #26
    11fd: 00 00        	movs	r0, r0
    11ff: 04 20        	movs	r0, #4
    1201: 74 00        	lsls	r4, r6, #1
    1203: 00 00        	movs	r0, r0
    1205: 03 e0        	b	0x120f <.debug_info+0x120f> @ imm = #6
    1207: 07 00        	movs	r7, r0
    1209: 00 05        	lsls	r0, r0, #20
    120b: 07 e4        	b	0xa1d <.debug_info+0xa1d> @ imm = #-2034
    120d: 00 00        	movs	r0, r0
    120f: 00 05        	lsls	r0, r0, #20
    1211: f4 00        	lsls	r4, r6, #3
    1213: 00 00        	movs	r0, r0
    1215: 06 f4 00 00  	and	r0, r6, #8388608
    1219: 00 06        	lsls	r0, r0, #24
    121b: 94 00        	lsls	r4, r2, #2
    121d: 00 00        	movs	r0, r0
    121f: 00 07        	lsls	r0, r0, #28
    1221: 04 08        	lsrs	r4, r0, #32
    1223: f0 0b        	lsrs	r0, r6, #15
    1225: 00 00        	movs	r0, r0
    1227: 01 06        	lsls	r1, r0, #24
    1229: 91 31        	adds	r1, #145
    122b: 03 00        	movs	r3, r0
    122d: 00 09        	lsrs	r0, r0, #4
    122f: 8b 05        	lsls	r3, r1, #22
    1231: 00 00        	movs	r0, r0
    1233: 72 09        	lsrs	r2, r6, #5
    1235: b7 05        	lsls	r7, r6, #22
    1237: 00 00        	movs	r0, r0
    1239: 74 09        	lsrs	r4, r6, #5
    123b: 78 06        	lsls	r0, r7, #25
    123d: 00 00        	movs	r0, r0
    123f: 75 09        	lsrs	r5, r6, #5
    1241: a9 03        	lsls	r1, r5, #14
    1243: 00 00        	movs	r0, r0
    1245: 76 09        	lsrs	r6, r6, #5
    1247: 08 08        	lsrs	r0, r1, #32
    1249: 00 00        	movs	r0, r0
    124b: 7b 09        	lsrs	r3, r7, #5
    124d: fa 0a        	lsrs	r2, r7, #11
    124f: 00 00        	movs	r0, r0
    1251: 7c 09        	lsrs	r4, r7, #5
    1253: 51 0d        	lsrs	r1, r2, #21
    1255: 00 00        	movs	r0, r0
    1257: 7e 09        	lsrs	r6, r7, #5
    1259: 81 02        	lsls	r1, r0, #10
    125b: 00 00        	movs	r0, r0
    125d: 7f 09        	lsrs	r7, r7, #5
    125f: 9f 05        	lsls	r7, r3, #22
    1261: 00 00        	movs	r0, r0
    1263: 00 09        	lsrs	r0, r0, #4
    1265: 4d 0a        	lsrs	r5, r1, #9
    1267: 00 00        	movs	r0, r0
    1269: 01 09        	lsrs	r1, r0, #4
    126b: dd 05        	lsls	r5, r3, #23
    126d: 00 00        	movs	r0, r0
    126f: 02 09        	lsrs	r2, r0, #4
    1271: 09 00        	movs	r1, r1
    1273: 00 00        	movs	r0, r0
    1275: 03 09        	lsrs	r3, r0, #4
    1277: e6 00        	lsls	r6, r4, #3
    1279: 00 00        	movs	r0, r0
    127b: 04 09        	lsrs	r4, r0, #4
    127d: 63 0b        	lsrs	r3, r4, #13
    127f: 00 00        	movs	r0, r0
    1281: 05 09        	lsrs	r5, r0, #4
    1283: 9f 0a        	lsrs	r7, r3, #10
    1285: 00 00        	movs	r0, r0
    1287: 06 09        	lsrs	r6, r0, #4
    1289: 2b 05        	lsls	r3, r5, #20
    128b: 00 00        	movs	r0, r0
    128d: 07 09        	lsrs	r7, r0, #4
    128f: 17 00        	movs	r7, r2
    1291: 00 00        	movs	r0, r0
    1293: 08 09        	lsrs	r0, r1, #4
    1295: 46 0d        	lsrs	r6, r0, #21
    1297: 00 00        	movs	r0, r0
    1299: 09 09        	lsrs	r1, r1, #4
    129b: fe 0c        	lsrs	r6, r7, #19
    129d: 00 00        	movs	r0, r0
    129f: 0a 09        	lsrs	r2, r1, #4
    12a1: 1f 09        	lsrs	r7, r3, #4
    12a3: 00 00        	movs	r0, r0
    12a5: 0b 09        	lsrs	r3, r1, #4
    12a7: d5 08        	lsrs	r5, r2, #3
    12a9: 00 00        	movs	r0, r0
    12ab: 0c 09        	lsrs	r4, r1, #4
    12ad: c6 02        	lsls	r6, r0, #11
    12af: 00 00        	movs	r0, r0
    12b1: 0d 09        	lsrs	r5, r1, #4
    12b3: 99 0b        	lsrs	r1, r3, #14
    12b5: 00 00        	movs	r0, r0
    12b7: 0e 09        	lsrs	r6, r1, #4
    12b9: af 0a        	lsrs	r7, r5, #10
    12bb: 00 00        	movs	r0, r0
    12bd: 0f 09        	lsrs	r7, r1, #4
    12bf: 43 05        	lsls	r3, r0, #21
    12c1: 00 00        	movs	r0, r0
    12c3: 10 09        	lsrs	r0, r2, #4
    12c5: 22 00        	movs	r2, r4
    12c7: 00 00        	movs	r0, r0
    12c9: 11 09        	lsrs	r1, r2, #4
    12cb: fb 09        	lsrs	r3, r7, #7
    12cd: 00 00        	movs	r0, r0
    12cf: 12 09        	lsrs	r2, r2, #4
    12d1: 36 05        	lsls	r6, r6, #20
    12d3: 00 00        	movs	r0, r0
    12d5: 13 09        	lsrs	r3, r2, #4
    12d7: 08 04        	lsls	r0, r1, #16
    12d9: 00 00        	movs	r0, r0
    12db: 14 09        	lsrs	r4, r2, #4
    12dd: 8c 0c        	lsrs	r4, r1, #18
    12df: 00 00        	movs	r0, r0
    12e1: 15 09        	lsrs	r5, r2, #4
    12e3: ed 05        	lsls	r5, r5, #23
    12e5: 00 00        	movs	r0, r0
    12e7: 16 09        	lsrs	r6, r2, #4
    12e9: c1 0c        	lsrs	r1, r0, #19
    12eb: 00 00        	movs	r0, r0
    12ed: 17 09        	lsrs	r7, r2, #4
    12ef: 97 06        	lsls	r7, r2, #26
    12f1: 00 00        	movs	r0, r0
    12f3: 18 09        	lsrs	r0, r3, #4
    12f5: e2 0b        	lsrs	r2, r4, #15
    12f7: 00 00        	movs	r0, r0
    12f9: 19 09        	lsrs	r1, r3, #4
    12fb: 35 02        	lsls	r5, r6, #8
    12fd: 00 00        	movs	r0, r0
    12ff: 1a 09        	lsrs	r2, r3, #4
    1301: 10 05        	lsls	r0, r2, #20
    1303: 00 00        	movs	r0, r0
    1305: 1b 09        	lsrs	r3, r3, #4
    1307: 26 01        	lsls	r6, r4, #4
    1309: 00 00        	movs	r0, r0
    130b: 1c 09        	lsrs	r4, r3, #4
    130d: b0 09        	lsrs	r0, r6, #6
    130f: 00 00        	movs	r0, r0
    1311: 1d 09        	lsrs	r5, r3, #4
    1313: 65 04        	lsls	r5, r4, #17
    1315: 00 00        	movs	r0, r0
    1317: 1e 09        	lsrs	r6, r3, #4
    1319: bb 04        	lsls	r3, r7, #18
    131b: 00 00        	movs	r0, r0
    131d: 1f 09        	lsrs	r7, r3, #4
    131f: 70 03        	lsls	r0, r6, #13
    1321: 00 00        	movs	r0, r0
    1323: 20 09        	lsrs	r0, r4, #4
    1325: a8 08        	lsrs	r0, r5, #2
    1327: 00 00        	movs	r0, r0
    1329: 21 09        	lsrs	r1, r4, #4
    132b: 63 06        	lsls	r3, r4, #25
    132d: 00 00        	movs	r0, r0
    132f: 22 09        	lsrs	r2, r4, #4
    1331: f6 07        	lsls	r6, r6, #31
    1333: 00 00        	movs	r0, r0
    1335: 23 09        	lsrs	r3, r4, #4
    1337: a4 01        	lsls	r4, r4, #6
    1339: 00 00        	movs	r0, r0
    133b: 24 09        	lsrs	r4, r4, #4
    133d: ba 09        	lsrs	r2, r7, #6
    133f: 00 00        	movs	r0, r0
    1341: 25 09        	lsrs	r5, r4, #4
    1343: 6f 04        	lsls	r7, r5, #17
    1345: 00 00        	movs	r0, r0
    1347: 26 09        	lsrs	r6, r4, #4
    1349: 8e 02        	lsls	r6, r1, #10
    134b: 00 00        	movs	r0, r0
    134d: 27 09        	lsrs	r7, r4, #4
    134f: 7b 09        	lsrs	r3, r7, #5
    1351: 00 00        	movs	r0, r0
    1353: 28 09        	lsrs	r0, r5, #4
    1355: 3b 09        	lsrs	r3, r7, #4
    1357: 00 00        	movs	r0, r0
    1359: 29 09        	lsrs	r1, r5, #4
    135b: 59 08        	lsrs	r1, r3, #1
    135d: 00 00        	movs	r0, r0
    135f: 2a 09        	lsrs	r2, r5, #4
    1361: ae 01        	lsls	r6, r5, #6
    1363: 00 00        	movs	r0, r0
    1365: 2b 09        	lsrs	r3, r5, #4
    1367: 34 00        	movs	r4, r6
    1369: 00 00        	movs	r0, r0
    136b: 2c 09        	lsrs	r4, r5, #4
    136d: 55 05        	lsls	r5, r2, #21
    136f: 00 00        	movs	r0, r0
    1371: 2d 09        	lsrs	r5, r5, #4
    1373: 1c 0d        	lsrs	r4, r3, #20
    1375: 00 00        	movs	r0, r0
    1377: 2e 09        	lsrs	r6, r5, #4
    1379: 70 0d        	lsrs	r0, r6, #21
    137b: 00 00        	movs	r0, r0
    137d: 2f 09        	lsrs	r7, r5, #4
    137f: 95 0a        	lsrs	r5, r2, #10
    1381: 00 00        	movs	r0, r0
    1383: 30 09        	lsrs	r0, r6, #4
    1385: 29 0d        	lsrs	r1, r5, #20
    1387: 00 00        	movs	r0, r0
    1389: 31 09        	lsrs	r1, r6, #4
    138b: 9f 03        	lsls	r7, r3, #14
    138d: 00 00        	movs	r0, r0
    138f: 32 09        	lsrs	r2, r6, #4
    1391: d3 00        	lsls	r3, r2, #3
    1393: 00 00        	movs	r0, r0
    1395: 33 09        	lsrs	r3, r6, #4
    1397: 48 08        	lsrs	r0, r1, #1
    1399: 00 00        	movs	r0, r0
    139b: 34 09        	lsrs	r4, r6, #4
    139d: 8c 06        	lsls	r4, r1, #26
    139f: 00 00        	movs	r0, r0
    13a1: 35 09        	lsrs	r5, r6, #4
    13a3: 6f 08        	lsrs	r7, r5, #1
    13a5: 00 00        	movs	r0, r0
    13a7: 36 09        	lsrs	r6, r6, #4
    13a9: c0 06        	lsls	r0, r0, #27
    13ab: 00 00        	movs	r0, r0
    13ad: 37 09        	lsrs	r7, r6, #4
    13af: 12 06        	lsls	r2, r2, #24
    13b1: 00 00        	movs	r0, r0
    13b3: 38 09        	lsrs	r0, r7, #4
    13b5: 97 00        	lsls	r7, r2, #2
    13b7: 00 00        	movs	r0, r0
    13b9: 39 09        	lsrs	r1, r7, #4
    13bb: c0 0d        	lsrs	r0, r0, #23
    13bd: 00 00        	movs	r0, r0
    13bf: 3a 09        	lsrs	r2, r7, #4
    13c1: e7 08        	lsrs	r7, r4, #3
    13c3: 00 00        	movs	r0, r0
    13c5: 3b 09        	lsrs	r3, r7, #4
    13c7: 11 03        	lsls	r1, r2, #12
    13c9: 00 00        	movs	r0, r0
    13cb: 3c 09        	lsrs	r4, r7, #4
    13cd: 2c 0b        	lsrs	r4, r5, #12
    13cf: 00 00        	movs	r0, r0
    13d1: 3d 09        	lsrs	r5, r7, #4
    13d3: c0 07        	lsls	r0, r0, #31
    13d5: 00 00        	movs	r0, r0
    13d7: 3e 09        	lsrs	r6, r7, #4
    13d9: f9 08        	lsrs	r1, r7, #3
    13db: 00 00        	movs	r0, r0
    13dd: 3f 09        	lsrs	r7, r7, #4
    13df: 6f 01        	lsls	r7, r5, #5
    13e1: 00 00        	movs	r0, r0
    13e3: c0 00        	lsls	r0, r0, #3
    13e5: 09 ed 09 00  	stc	p0, c0, [r9, #-36]
    13e9: 00           	<unknown>
    13ea: c1 00        	lsls	r1, r0, #3
    13ec: 09 7d        	ldrb	r1, [r1, #20]
    13ee: 03 00        	movs	r3, r0
    13f0: 00           	<unknown>
    13f1: c2 00        	lsls	r2, r0, #3
    13f3: 09 7f        	ldrb	r1, [r1, #28]
    13f5: 05 00        	movs	r5, r0
    13f7: 00           	<unknown>
    13f8: c3 00        	lsls	r3, r0, #3
    13fa: 09 16        	asrs	r1, r1, #24
    13fc: 02 00        	movs	r2, r0
    13fe: 00           	<unknown>
    13ff: c4 00        	lsls	r4, r0, #3
    1401: 09 c1        	stm	r1!, {r0, r3}
    1403: 0a 00        	movs	r2, r1
    1405: 00           	<unknown>
    1406: c5 00        	lsls	r5, r0, #3
    1408: 09 6d        	ldr	r1, [r1, #80]
    140a: 05 00        	movs	r5, r0
    140c: 00           	<unknown>
    140d: c6 00        	lsls	r6, r0, #3
    140f: 09 7d        	ldrb	r1, [r1, #20]
    1411: 01 00        	movs	r1, r0
    1413: 00           	<unknown>
    1414: c7 00        	lsls	r7, r0, #3
    1416: 09 15        	asrs	r1, r1, #20
    1418: 0b 00        	movs	r3, r1
    141a: 00           	<unknown>
    141b: c8 00        	lsls	r0, r1, #3
    141d: 09 64        	str	r1, [r1, #64]
    141f: 09 00        	movs	r1, r1
    1421: 00           	<unknown>
    1422: c9 00        	lsls	r1, r1, #3
    1424: 09 2f        	cmp	r7, #9
    1426: 0c 00        	movs	r4, r1
    1428: 00           	<unknown>
    1429: ca 00        	lsls	r2, r1, #3
    142b: 09 5d        	ldrb	r1, [r1, r4]
    142d: 0d 00        	movs	r5, r1
    142f: 00           	<unknown>
    1430: cb 00        	lsls	r3, r1, #3
    1432: 09 93        	str	r3, [sp, #36]
    1434: 01 00        	movs	r1, r0
    1436: 00           	<unknown>
    1437: cc 00        	lsls	r4, r1, #3
    1439: 09 ce        	ldm	r6!, {r0, r3}
    143b: 07 00        	movs	r7, r0
    143d: 00           	<unknown>
    143e: cd 00        	lsls	r5, r1, #3
    1440: 09 f1 00 00  	add.w	r0, r9, #0
    1444: 00           	<unknown>
    1445: ce 00        	lsls	r6, r1, #3
    1447: 09 71        	strb	r1, [r1, #4]
    1449: 09 00        	movs	r1, r1
    144b: 00           	<unknown>
    144c: cf 00        	lsls	r7, r1, #3
    144e: 09 1d        	adds	r1, r1, #4
    1450: 05 00        	movs	r5, r0
    1452: 00 d0        	beq	0x1456 <.debug_info+0x1456> @ imm = #0
    1454: 00 09        	lsrs	r0, r0, #4
    1456: 3f 08        	lsrs	r7, r7, #32
    1458: 00 00        	movs	r0, r0
    145a: d1 00        	lsls	r1, r2, #3
    145c: 00 03        	lsls	r0, r0, #12
    145e: fb 05        	lsls	r3, r7, #23
    1460: 00 00        	movs	r0, r0
    1462: 06           	<unknown>
    1463: ef           	<unknown>
    1464: f6 00        	lsls	r6, r6, #3
    1466: 00 00        	movs	r0, r0
    1468: 0a 04        	lsls	r2, r1, #16
    146a: 0e 02        	lsls	r6, r1, #8
    146c: 2f 01        	lsls	r7, r5, #4
    146e: f8 03        	lsls	r0, r7, #15
    1470: 00 00        	movs	r0, r0
    1472: 0b 8c        	ldrh	r3, [r1, #32]
    1474: 0d 00        	movs	r5, r1
    1476: 00 02        	lsls	r0, r0, #8
    1478: 31 01        	lsls	r1, r6, #4
    147a: 0f 04        	lsls	r7, r1, #16
    147c: 00 00        	movs	r0, r0
    147e: 00 0b        	lsrs	r0, r0, #12
    1480: ef 02        	lsls	r7, r5, #11
    1482: 00 00        	movs	r0, r0
    1484: 02 32        	adds	r2, #2
    1486: 01 14        	asrs	r1, r0, #16
    1488: 04 00        	movs	r4, r0
    148a: 00 20        	movs	r0, #0
    148c: 0b 04        	lsls	r3, r1, #16
    148e: 0a 00        	movs	r2, r1
    1490: 00 02        	lsls	r0, r0, #8
    1492: 33 01        	lsls	r3, r6, #4
    1494: 24 04        	lsls	r4, r4, #16
    1496: 00 00        	movs	r0, r0
    1498: 80 0b        	lsrs	r0, r0, #14
    149a: 00 00        	movs	r0, r0
    149c: 00 00        	movs	r0, r0
    149e: 02 34        	adds	r4, #2
    14a0: 01 14        	asrs	r1, r0, #16
    14a2: 04 00        	movs	r4, r0
    14a4: 00 a0        	adr	r0, #0 <.debug_info+0x14a8>
    14a6: 0c 41        	asrs	r4, r1
    14a8: 0d 00        	movs	r5, r1
    14aa: 00 02        	lsls	r0, r0, #8
    14ac: 35 01        	lsls	r5, r6, #4
    14ae: 29 04        	lsls	r1, r5, #16
    14b0: 00 00        	movs	r0, r0
    14b2: 00 01        	lsls	r0, r0, #4
    14b4: 0c 8b        	ldrh	r4, [r1, #24]
    14b6: 03 00        	movs	r3, r0
    14b8: 00 02        	lsls	r0, r0, #8
    14ba: 36 01        	lsls	r6, r6, #4
    14bc: 14 04        	lsls	r4, r2, #16
    14be: 00 00        	movs	r0, r0
    14c0: 20 01        	lsls	r0, r4, #4
    14c2: 0c 42        	tst	r4, r1
    14c4: 01 00        	movs	r1, r0
    14c6: 00 02        	lsls	r0, r0, #8
    14c8: 37 01        	lsls	r7, r6, #4
    14ca: 2e 04        	lsls	r6, r5, #16
    14cc: 00 00        	movs	r0, r0
    14ce: 80 01        	lsls	r0, r0, #6
    14d0: 0c 95        	str	r5, [sp, #48]
    14d2: 03 00        	movs	r3, r0
    14d4: 00 02        	lsls	r0, r0, #8
    14d6: 38 01        	lsls	r0, r7, #4
    14d8: 14 04        	lsls	r4, r2, #16
    14da: 00 00        	movs	r0, r0
    14dc: a0 01        	lsls	r0, r4, #6
    14de: 0c 4c        	ldr	r4, [pc, #48]           @ 0x1510 <.debug_info+0x1510>
    14e0: 03 00        	movs	r3, r0
    14e2: 00 02        	lsls	r0, r0, #8
    14e4: 39 01        	lsls	r1, r7, #4
    14e6: 33 04        	lsls	r3, r6, #16
    14e8: 00 00        	movs	r0, r0
    14ea: 00 02        	lsls	r0, r0, #8
    14ec: 0c 23        	movs	r3, #12
    14ee: 03 00        	movs	r3, r0
    14f0: 00 02        	lsls	r0, r0, #8
    14f2: 3a 01        	lsls	r2, r7, #4
    14f4: 38 04        	lsls	r0, r7, #16
    14f6: 00 00        	movs	r0, r0
    14f8: 20 02        	lsls	r0, r4, #8
    14fa: 0d 49        	ldr	r1, [pc, #52]           @ 0x1530 <.debug_info+0x1530>
    14fc: 50 00        	lsls	r0, r2, #1
    14fe: 02 3b        	subs	r3, #2
    1500: 01 58        	ldr	r1, [r0, r0]
    1502: 04 00        	movs	r4, r0
    1504: 00 00        	movs	r0, r0
    1506: 03 0c        	lsrs	r3, r0, #16
    1508: 2d 03        	lsls	r5, r5, #12
    150a: 00 00        	movs	r0, r0
    150c: 02 3c        	subs	r4, #2
    150e: 01 5d        	ldrb	r1, [r0, r4]
    1510: 04 00        	movs	r4, r0
    1512: 00 f0 03 0c  	and	r12, r0, #3
    1516: b6 04        	lsls	r6, r6, #18
    1518: 00 00        	movs	r0, r0
    151a: 02 3d        	subs	r5, #2
    151c: 01 6e        	ldr	r1, [r0, #96]
    151e: 04 00        	movs	r4, r0
    1520: 00 00        	movs	r0, r0
    1522: 0e 00        	movs	r6, r1
    1524: 0e ce        	ldm	r6!, {r1, r2, r3}
    1526: 00 00        	movs	r0, r0
    1528: 00 08        	lsrs	r0, r0, #32
    152a: 04 00        	movs	r4, r0
    152c: 00 0f        	lsrs	r0, r0, #28
    152e: 08 04        	lsls	r0, r1, #16
    1530: 00 00        	movs	r0, r0
    1532: 07 00        	movs	r7, r0
    1534: 02 04        	lsls	r2, r0, #16
    1536: 07 47        	bx	r0
    1538: 00 00        	movs	r0, r0
    153a: 00 10        	asrs	r0, r0, #32
    153c: f8 03        	lsls	r0, r7, #15
    153e: 00 00        	movs	r0, r0
    1540: 0e ce        	ldm	r6!, {r1, r2, r3}
    1542: 00 00        	movs	r0, r0
    1544: 00 24        	movs	r4, #0
    1546: 04 00        	movs	r4, r0
    1548: 00 0f        	lsrs	r0, r0, #28
    154a: 08 04        	lsls	r0, r1, #16
    154c: 00 00        	movs	r0, r0
    154e: 17 00        	movs	r7, r2
    1550: 10 f8 03 00  	ldrb.w	r0, [r0, r3]
    1554: 00 10        	asrs	r0, r0, #32
    1556: f8 03        	lsls	r0, r7, #15
    1558: 00 00        	movs	r0, r0
    155a: 10 f8 03 00  	ldrb.w	r0, [r0, r3]
    155e: 00 10        	asrs	r0, r0, #32
    1560: f8 03        	lsls	r0, r7, #15
    1562: 00 00        	movs	r0, r0
    1564: 0e ce        	ldm	r6!, {r1, r2, r3}
    1566: 00 00        	movs	r0, r0
    1568: 00 48        	ldr	r0, [pc, #0]            @ 0x156c <.debug_info+0x156c>
    156a: 04 00        	movs	r4, r0
    156c: 00 0f        	lsrs	r0, r0, #28
    156e: 08 04        	lsls	r0, r1, #16
    1570: 00 00        	movs	r0, r0
    1572: 37 00        	movs	r7, r6
    1574: 0e a2        	adr	r2, #56 <.debug_info+0x1586>
    1576: 00 00        	movs	r0, r0
    1578: 00 58        	ldr	r0, [r0, r0]
    157a: 04 00        	movs	r4, r0
    157c: 00 0f        	lsrs	r0, r0, #28
    157e: 08 04        	lsls	r0, r1, #16
    1580: 00 00        	movs	r0, r0
    1582: ef 00        	lsls	r7, r5, #3
    1584: 10 48        	ldr	r0, [pc, #64]           @ 0x15c8 <.debug_info+0x15c8>
    1586: 04 00        	movs	r4, r0
    1588: 00 0e        	lsrs	r0, r0, #24
    158a: ce 00        	lsls	r6, r1, #3
    158c: 00 00        	movs	r0, r0
    158e: 6e 04        	lsls	r6, r5, #17
    1590: 00 00        	movs	r0, r0
    1592: 11 08        	lsrs	r1, r2, #32
    1594: 04 00        	movs	r4, r0
    1596: 00 83        	strh	r0, [r0, #24]
    1598: 02 00        	movs	r2, r0
    159a: 10 ce        	ldm	r6!, {r4}
    159c: 00 00        	movs	r0, r0
    159e: 00 12        	asrs	r0, r0, #8
    15a0: 4a 09        	lsrs	r2, r1, #5
    15a2: 00 00        	movs	r0, r0
    15a4: 02 3e        	subs	r6, #2
    15a6: 01 3c        	subs	r4, #1
    15a8: 03 00        	movs	r3, r0
    15aa: 00 13        	asrs	r0, r0, #12
    15ac: 8c 02        	lsls	r4, r1, #10
    15ae: 4f 01        	lsls	r7, r1, #5
    15b0: 9a 05        	lsls	r2, r3, #22
    15b2: 00 00        	movs	r0, r0
    15b4: 0b f6 01 00  	addw	r0, r11, #2049
    15b8: 00 02        	lsls	r0, r0, #8
    15ba: 51 01        	lsls	r1, r2, #5
    15bc: 9a 05        	lsls	r2, r3, #22
    15be: 00 00        	movs	r0, r0
    15c0: 00 0b        	lsrs	r0, r0, #12
    15c2: 9a 02        	lsls	r2, r3, #10
    15c4: 00 00        	movs	r0, r0
    15c6: 02 52        	strh	r2, [r0, r0]
    15c8: 01 6e        	ldr	r1, [r0, #96]
    15ca: 04 00        	movs	r4, r0
    15cc: 00 04        	lsls	r0, r0, #16
    15ce: 0b ce        	ldm	r6!, {r0, r1, r3}
    15d0: 00 00        	movs	r0, r0
    15d2: 00 02        	lsls	r0, r0, #8
    15d4: 53 01        	lsls	r3, r2, #5
    15d6: 6e 04        	lsls	r6, r5, #17
    15d8: 00 00        	movs	r0, r0
    15da: 08 0b        	lsrs	r0, r1, #12
    15dc: d1 01        	lsls	r1, r2, #7
    15de: 00 00        	movs	r0, r0
    15e0: 02 54        	strb	r2, [r0, r0]
    15e2: 01 6e        	ldr	r1, [r0, #96]
    15e4: 04 00        	movs	r4, r0
    15e6: 00 0c        	lsrs	r0, r0, #16
    15e8: 14 53        	strh	r4, [r2, r4]
    15ea: 43 52        	strh	r3, [r0, r1]
    15ec: 00 02        	lsls	r0, r0, #8
    15ee: 55 01        	lsls	r5, r2, #5
    15f0: 6e 04        	lsls	r6, r5, #17
    15f2: 00 00        	movs	r0, r0
    15f4: 10 14        	asrs	r0, r2, #16
    15f6: 43 43        	muls	r3, r0, r3
    15f8: 52 00        	lsls	r2, r2, #1
    15fa: 02 56        	ldrsb	r2, [r0, r0]
    15fc: 01 6e        	ldr	r1, [r0, #96]
    15fe: 04 00        	movs	r4, r0
    1600: 00 14        	asrs	r0, r0, #16
    1602: 14 53        	strh	r4, [r2, r4]
    1604: 48 50        	str	r0, [r1, r1]
    1606: 00 02        	lsls	r0, r0, #8
    1608: 57 01        	lsls	r7, r2, #5
    160a: af 05        	lsls	r7, r5, #22
    160c: 00 00        	movs	r0, r0
    160e: 18 0b        	lsrs	r0, r3, #12
    1610: 9b 04        	lsls	r3, r3, #18
    1612: 00 00        	movs	r0, r0
    1614: 02 58        	ldr	r2, [r0, r0]
    1616: 01 6e        	ldr	r1, [r0, #96]
    1618: 04 00        	movs	r4, r0
    161a: 00 24        	movs	r4, #0
    161c: 0b aa        	add	r2, sp, #44
    161e: 0a 00        	movs	r2, r1
    1620: 00 02        	lsls	r0, r0, #8
    1622: 59 01        	lsls	r1, r3, #5
    1624: 6e 04        	lsls	r6, r5, #17
    1626: 00 00        	movs	r0, r0
    1628: 28 0b        	lsrs	r0, r5, #12
    162a: 27 04        	lsls	r7, r4, #16
    162c: 00 00        	movs	r0, r0
    162e: 02 5a        	ldrh	r2, [r0, r0]
    1630: 01 6e        	ldr	r1, [r0, #96]
    1632: 04 00        	movs	r4, r0
    1634: 00 2c        	cmp	r4, #0
    1636: 0b e2        	b	0x1a50 <.debug_info+0x1a50> @ imm = #1046
    1638: 03 00        	movs	r3, r0
    163a: 00 02        	lsls	r0, r0, #8
    163c: 5b 01        	lsls	r3, r3, #5
    163e: 6e 04        	lsls	r6, r5, #17
    1640: 00 00        	movs	r0, r0
    1642: 30 0b        	lsrs	r0, r6, #12
    1644: 46 0b        	lsrs	r6, r0, #13
    1646: 00 00        	movs	r0, r0
    1648: 02 5c        	ldrb	r2, [r0, r0]
    164a: 01 6e        	ldr	r1, [r0, #96]
    164c: 04 00        	movs	r4, r0
    164e: 00 34        	adds	r4, #0
    1650: 0b c9        	ldm	r1, {r0, r1, r3}
    1652: 08 00        	movs	r0, r1
    1654: 00 02        	lsls	r0, r0, #8
    1656: 5d 01        	lsls	r5, r3, #5
    1658: 6e 04        	lsls	r6, r5, #17
    165a: 00 00        	movs	r0, r0
    165c: 38 0b        	lsrs	r0, r7, #12
    165e: 56 0a        	lsrs	r6, r2, #9
    1660: 00 00        	movs	r0, r0
    1662: 02 5e        	ldrsh	r2, [r0, r0]
    1664: 01 6e        	ldr	r1, [r0, #96]
    1666: 04 00        	movs	r4, r0
    1668: 00 3c        	subs	r4, #0
    166a: 14 50        	str	r4, [r2, r0]
    166c: 46 52        	strh	r6, [r0, r1]
    166e: 00 02        	lsls	r0, r0, #8
    1670: 5f 01        	lsls	r7, r3, #5
    1672: c4 05        	lsls	r4, r0, #23
    1674: 00 00        	movs	r0, r0
    1676: 40 14        	asrs	r0, r0, #17
    1678: 44 46        	mov	r4, r8
    167a: 52 00        	lsls	r2, r2, #1
    167c: 02 60        	str	r2, [r0]
    167e: 01 9a        	ldr	r2, [sp, #4]
    1680: 05 00        	movs	r5, r0
    1682: 00 48        	ldr	r0, [pc, #0]            @ 0x1684 <.debug_info+0x1684>
    1684: 14 41        	asrs	r4, r2
    1686: 44 52        	strh	r4, [r0, r1]
    1688: 00 02        	lsls	r0, r0, #8
    168a: 61 01        	lsls	r1, r4, #5
    168c: 9a 05        	lsls	r2, r3, #22
    168e: 00 00        	movs	r0, r0
    1690: 4c 0b        	lsrs	r4, r1, #13
    1692: 41 0b        	lsrs	r1, r0, #13
    1694: 00 00        	movs	r0, r0
    1696: 02 62        	str	r2, [r0, #32]
    1698: 01 de        	udf	#1
    169a: 05 00        	movs	r5, r0
    169c: 00 50        	str	r0, [r0, r0]
    169e: 0b 80        	strh	r3, [r1]
    16a0: 0b 00        	movs	r3, r1
    16a2: 00 02        	lsls	r0, r0, #8
    16a4: 63 01        	lsls	r3, r4, #5
    16a6: f8 05        	lsls	r0, r7, #23
    16a8: 00 00        	movs	r0, r0
    16aa: 60 0b        	lsrs	r0, r4, #13
    16ac: ef 02        	lsls	r7, r5, #11
    16ae: 00 00        	movs	r0, r0
    16b0: 02 64        	str	r2, [r0, #64]
    16b2: 01           	<unknown>
    16b3: e8 05        	lsls	r0, r5, #23
    16b5: 00 00        	movs	r0, r0
    16b7: 74 0b        	lsrs	r4, r6, #13
    16b9: 33 0d        	lsrs	r3, r6, #20
    16bb: 00 00        	movs	r0, r0
    16bd: 02 65        	str	r2, [r0, #80]
    16bf: 01 6e        	ldr	r1, [r0, #96]
    16c1: 04 00        	movs	r4, r0
    16c3: 00 88        	ldrh	r0, [r0]
    16c5: 00 15        	asrs	r0, r0, #20
    16c7: 6e 04        	lsls	r6, r5, #17
    16c9: 00 00        	movs	r0, r0
    16cb: 0e a2        	adr	r2, #56 <.debug_info+0x16dd>
    16cd: 00 00        	movs	r0, r0
    16cf: 00 af        	add	r7, sp, #0
    16d1: 05 00        	movs	r5, r0
    16d3: 00 0f        	lsrs	r0, r0, #28
    16d5: 08 04        	lsls	r0, r1, #16
    16d7: 00 00        	movs	r0, r0
    16d9: 0b 00        	movs	r3, r1
    16db: 10 9f        	ldr	r7, [sp, #64]
    16dd: 05 00        	movs	r5, r0
    16df: 00 0e        	lsrs	r0, r0, #24
    16e1: ce 00        	lsls	r6, r1, #3
    16e3: 00 00        	movs	r0, r0
    16e5: c4 05        	lsls	r4, r0, #23
    16e7: 00 00        	movs	r0, r0
    16e9: 0f 08        	lsrs	r7, r1, #32
    16eb: 04 00        	movs	r4, r0
    16ed: 00 01        	lsls	r0, r0, #4
    16ef: 00 15        	asrs	r0, r0, #20
    16f1: c9 05        	lsls	r1, r1, #23
    16f3: 00 00        	movs	r0, r0
    16f5: 10 b4        	push	{r4}
    16f7: 05 00        	movs	r5, r0
    16f9: 00 0e        	lsrs	r0, r0, #24
    16fb: ce 00        	lsls	r6, r1, #3
    16fd: 00 00        	movs	r0, r0
    16ff: de 05        	lsls	r6, r3, #23
    1701: 00 00        	movs	r0, r0
    1703: 0f 08        	lsrs	r7, r1, #32
    1705: 04 00        	movs	r4, r0
    1707: 00 03        	lsls	r0, r0, #12
    1709: 00 15        	asrs	r0, r0, #20
    170b: e3 05        	lsls	r3, r4, #23
    170d: 00 00        	movs	r0, r0
    170f: 10 ce        	ldm	r6!, {r4}
    1711: 05 00        	movs	r5, r0
    1713: 00 0e        	lsrs	r0, r0, #24
    1715: ce 00        	lsls	r6, r1, #3
    1717: 00 00        	movs	r0, r0
    1719: f8 05        	lsls	r0, r7, #23
    171b: 00 00        	movs	r0, r0
    171d: 0f 08        	lsrs	r7, r1, #32
    171f: 04 00        	movs	r4, r0
    1721: 00 04        	lsls	r0, r0, #16
    1723: 00 15        	asrs	r0, r0, #20
    1725: fd 05        	lsls	r5, r7, #23
    1727: 00 00        	movs	r0, r0
    1729: 10           	<unknown>
    172a: e8 05        	lsls	r0, r5, #23
    172c: 00 00        	movs	r0, r0
    172e: 12 c8        	ldm	r0!, {r1, r4}
    1730: 03 00        	movs	r3, r0
    1732: 00 02        	lsls	r0, r0, #8
    1734: 66 01        	lsls	r6, r4, #5
    1736: 7f 04        	lsls	r7, r7, #17
    1738: 00 00        	movs	r0, r0
    173a: 10           	<unknown>
    173b: b8 00        	lsls	r0, r7, #2
    173d: 00 00        	movs	r0, r0
    173f: 10 c3        	stm	r3!, {r4}
    1741: 00 00        	movs	r0, r0
    1743: 00 15        	asrs	r0, r0, #20
    1745: ce 00        	lsls	r6, r1, #3
    1747: 00 00        	movs	r0, r0
    1749: 16 01        	lsls	r6, r2, #4
    174b: 06 1f        	subs	r6, r0, #4
    174d: 01 33        	adds	r3, #1
    174f: 06 00        	movs	r6, r0
    1751: 00 09        	lsrs	r0, r0, #4
    1753: 00 08        	lsrs	r0, r0, #32
    1755: 00 00        	movs	r0, r0
    1757: 00 09        	lsrs	r0, r0, #4
    1759: ab 0b        	lsrs	r3, r5, #14
    175b: 00 00        	movs	r0, r0
    175d: 01 00        	movs	r1, r0
    175f: 12 54        	strb	r2, [r2, r0]
    1761: 09 00        	movs	r1, r1
    1763: 00 06        	lsls	r0, r0, #24
    1765: 1f 01        	lsls	r7, r3, #4
    1767: 1d 06        	lsls	r5, r3, #24
    1769: 00 00        	movs	r0, r0
    176b: 13 18        	adds	r3, r2, r0
    176d: 06 d7        	bvc	0x177d <.debug_info+0x177d> @ imm = #12
    176f: 01 96        	str	r6, [sp, #4]
    1771: 06 00        	movs	r6, r0
    1773: 00 14        	asrs	r0, r0, #16
    1775: 43 52        	strh	r3, [r0, r1]
    1777: 00 06        	lsls	r0, r0, #24
    1779: d9 01        	lsls	r1, r3, #7
    177b: 6e 04        	lsls	r6, r5, #17
    177d: 00 00        	movs	r0, r0
    177f: 00 0b        	lsrs	r0, r0, #12
    1781: b8 10        	asrs	r0, r7, #2
    1783: 00 00        	movs	r0, r0
    1785: 06 da        	bge	0x1795 <.debug_info+0x1795> @ imm = #12
    1787: 01 6e        	ldr	r1, [r0, #96]
    1789: 04 00        	movs	r4, r0
    178b: 00 04        	lsls	r0, r0, #16
    178d: 14 50        	str	r4, [r2, r0]
    178f: 41 52        	strh	r1, [r0, r1]
    1791: 00 06        	lsls	r0, r0, #24
    1793: db 01        	lsls	r3, r3, #7
    1795: 6e 04        	lsls	r6, r5, #17
    1797: 00 00        	movs	r0, r0
    1799: 08 0b        	lsrs	r0, r1, #12
    179b: 2b 10        	asrs	r3, r5, #32
    179d: 00 00        	movs	r0, r0
    179f: 06 dc        	bgt	0x17af <.debug_info+0x17af> @ imm = #12
    17a1: 01 6e        	ldr	r1, [r0, #96]
    17a3: 04 00        	movs	r4, r0
    17a5: 00 0c        	lsrs	r0, r0, #16
    17a7: 0b d7        	bvc	0x17c1 <.debug_info+0x17c1> @ imm = #22
    17a9: 0d 00        	movs	r5, r1
    17ab: 00 06        	lsls	r0, r0, #24
    17ad: dd 01        	lsls	r5, r3, #7
    17af: 6e 04        	lsls	r6, r5, #17
    17b1: 00 00        	movs	r0, r0
    17b3: 10 14        	asrs	r0, r2, #16
    17b5: 46 43        	muls	r6, r0, r6
    17b7: 52 00        	lsls	r2, r2, #1
    17b9: 06 de        	udf	#6
    17bb: 01 6e        	ldr	r1, [r0, #96]
    17bd: 04 00        	movs	r4, r0
    17bf: 00 14        	asrs	r0, r0, #16
    17c1: 00 12        	asrs	r0, r0, #8
    17c3: 3f 0f        	lsrs	r7, r7, #28
    17c5: 00 00        	movs	r0, r0
    17c7: 06 df        	svc	#6
    17c9: 01 3f        	subs	r7, #1
    17cb: 06 00        	movs	r6, r0
    17cd: 00 13        	asrs	r0, r0, #12
    17cf: 10 06        	lsls	r0, r2, #24
    17d1: e1 01        	lsls	r1, r4, #7
    17d3: e0 06        	lsls	r0, r4, #27
    17d5: 00 00        	movs	r0, r0
    17d7: 0b 92        	str	r2, [sp, #44]
    17d9: 10 00        	movs	r0, r2
    17db: 00 06        	lsls	r0, r0, #24
    17dd: e3 01        	lsls	r3, r4, #7
    17df: 6e 04        	lsls	r6, r5, #17
    17e1: 00 00        	movs	r0, r0
    17e3: 00 0b        	lsrs	r0, r0, #12
    17e5: 87 10        	asrs	r7, r0, #2
    17e7: 00 00        	movs	r0, r0
    17e9: 06 e4        	b	0xff9 <.debug_info+0xff9> @ imm = #-2036
    17eb: 01 6e        	ldr	r1, [r0, #96]
    17ed: 04 00        	movs	r4, r0
    17ef: 00 04        	lsls	r0, r0, #16
    17f1: 0b ac        	add	r4, sp, #44
    17f3: 0e 00        	movs	r6, r1
    17f5: 00 06        	lsls	r0, r0, #24
    17f7: e5 01        	lsls	r5, r4, #7
    17f9: 6e 04        	lsls	r6, r5, #17
    17fb: 00 00        	movs	r0, r0
    17fd: 08 0b        	lsrs	r0, r1, #12
    17ff: 71 0f        	lsrs	r1, r6, #29
    1801: 00 00        	movs	r0, r0
    1803: 06 e6        	b	0x1413 <.debug_info+0x1413> @ imm = #-1012
    1805: 01 6e        	ldr	r1, [r0, #96]
    1807: 04 00        	movs	r4, r0
    1809: 00 0c        	lsrs	r0, r0, #16
    180b: 00 12        	asrs	r0, r0, #8
    180d: 8f 0e        	lsrs	r7, r1, #26
    180f: 00 00        	movs	r0, r0
    1811: 06 e7        	b	0x1621 <.debug_info+0x1621> @ imm = #-500
    1813: 01 a2        	adr	r2, #4 <.debug_info+0x1818>
    1815: 06 00        	movs	r6, r0
    1817: 00 13        	asrs	r0, r0, #12
    1819: 28 06        	lsls	r0, r5, #24
    181b: 8e 02        	lsls	r6, r1, #10
    181d: 78 07        	lsls	r0, r7, #29
    181f: 00 00        	movs	r0, r0
    1821: 0b 75        	strb	r3, [r1, #20]
    1823: 0c 00        	movs	r4, r1
    1825: 00 06        	lsls	r0, r0, #24
    1827: 90 02        	lsls	r0, r2, #10
    1829: 6e 04        	lsls	r6, r5, #17
    182b: 00 00        	movs	r0, r0
    182d: 00 0b        	lsrs	r0, r0, #12
    182f: 5b 0a        	lsrs	r3, r3, #9
    1831: 00 00        	movs	r0, r0
    1833: 06 91        	str	r1, [sp, #24]
    1835: 02 6e        	ldr	r2, [r0, #96]
    1837: 04 00        	movs	r4, r0
    1839: 00 04        	lsls	r0, r0, #16
    183b: 0b 70        	strb	r3, [r1]
    183d: 06 00        	movs	r6, r0
    183f: 00 06        	lsls	r0, r0, #24
    1841: 92 02        	lsls	r2, r2, #10
    1843: 6e 04        	lsls	r6, r5, #17
    1845: 00 00        	movs	r0, r0
    1847: 08 0b        	lsrs	r0, r1, #12
    1849: da 07        	lsls	r2, r3, #31
    184b: 00 00        	movs	r0, r0
    184d: 06 93        	str	r3, [sp, #24]
    184f: 02 6e        	ldr	r2, [r0, #96]
    1851: 04 00        	movs	r4, r0
    1853: 00 0c        	lsrs	r0, r0, #16
    1855: 14 49        	ldr	r1, [pc, #80]           @ 0x18a8 <.debug_info+0x18a8>
    1857: 44 52        	strh	r4, [r0, r1]
    1859: 00 06        	lsls	r0, r0, #24
    185b: 94 02        	lsls	r4, r2, #10
    185d: 6e 04        	lsls	r6, r5, #17
    185f: 00 00        	movs	r0, r0
    1861: 10 14        	asrs	r0, r2, #16
    1863: 4f 44        	add	r7, r9
    1865: 52 00        	lsls	r2, r2, #1
    1867: 06 95        	str	r5, [sp, #24]
    1869: 02 6e        	ldr	r2, [r0, #96]
    186b: 04 00        	movs	r4, r0
    186d: 00 14        	asrs	r0, r0, #16
    186f: 0b 1a        	subs	r3, r1, r0
    1871: 08 00        	movs	r0, r1
    1873: 00 06        	lsls	r0, r0, #24
    1875: 96 02        	lsls	r6, r2, #10
    1877: 0e 06        	lsls	r6, r1, #24
    1879: 00 00        	movs	r0, r0
    187b: 18 0b        	lsrs	r0, r3, #12
    187d: 14 08        	lsrs	r4, r2, #32
    187f: 00 00        	movs	r0, r0
    1881: 06 97        	str	r7, [sp, #24]
    1883: 02 0e        	lsrs	r2, r0, #24
    1885: 06 00        	movs	r6, r0
    1887: 00 1a        	subs	r0, r0, r0
    1889: 0b 4e        	ldr	r6, [pc, #44]           @ 0x18b8 <.debug_info+0x18b8>
    188b: 06 00        	movs	r6, r0
    188d: 00 06        	lsls	r0, r0, #24
    188f: 98 02        	lsls	r0, r3, #10
    1891: 6e 04        	lsls	r6, r5, #17
    1893: 00 00        	movs	r0, r0
    1895: 1c 14        	asrs	r4, r3, #16
    1897: 41 46        	mov	r1, r8
    1899: 52 00        	lsls	r2, r2, #1
    189b: 06 99        	ldr	r1, [sp, #24]
    189d: 02 78        	ldrb	r2, [r0]
    189f: 07 00        	movs	r7, r0
    18a1: 00 20        	movs	r0, #0
    18a3: 00 10        	asrs	r0, r0, #32
    18a5: b4 05        	lsls	r4, r6, #22
    18a7: 00 00        	movs	r0, r0
    18a9: 12 d5        	bpl	0x18d1 <.debug_info+0x18d1> @ imm = #36
    18ab: 0b 00        	movs	r3, r1
    18ad: 00 06        	lsls	r0, r0, #24
    18af: 9a 02        	lsls	r2, r3, #10
    18b1: ec 06        	lsls	r4, r5, #27
    18b3: 00 00        	movs	r0, r0
    18b5: 13 24        	movs	r4, #19
    18b7: 06 ad        	add	r5, sp, #24
    18b9: 02 7c        	ldrb	r2, [r0, #16]
    18bb: 08 00        	movs	r0, r1
    18bd: 00 14        	asrs	r0, r0, #16
    18bf: 43 52        	strh	r3, [r0, r1]
    18c1: 31 00        	movs	r1, r6
    18c3: 06 af        	add	r7, sp, #24
    18c5: 02 0e        	lsrs	r2, r0, #24
    18c7: 06 00        	movs	r6, r0
    18c9: 00 00        	movs	r0, r0
    18cb: 0b           	<unknown>
    18cc: ef 02        	lsls	r7, r5, #11
    18ce: 00 00        	movs	r0, r0
    18d0: 06 b0        	add	sp, #24
    18d2: 02           	<unknown>
    18d3: b8 00        	lsls	r0, r7, #2
    18d5: 00 00        	movs	r0, r0
    18d7: 02 14        	asrs	r2, r0, #16
    18d9: 43 52        	strh	r3, [r0, r1]
    18db: 32 00        	movs	r2, r6
    18dd: 06 b1        	cbz	r6, 0x18e1 <.debug_info+0x18e1> @ imm = #0
    18df: 02 0e        	lsrs	r2, r0, #24
    18e1: 06 00        	movs	r6, r0
    18e3: 00 04        	lsls	r0, r0, #16
    18e5: 0b           	<unknown>
    18e6: f9 02        	lsls	r1, r7, #11
    18e8: 00 00        	movs	r0, r0
    18ea: 06 b2        	sxth	r6, r0
    18ec: 02           	<unknown>
    18ed: b8 00        	lsls	r0, r7, #2
    18ef: 00 00        	movs	r0, r0
    18f1: 06 0b        	lsrs	r6, r0, #12
    18f3: fe 0f        	lsrs	r6, r7, #31
    18f5: 00 00        	movs	r0, r0
    18f7: 06 b3        	cbz	r6, 0x193b <.debug_info+0x193b> @ imm = #64
    18f9: 02 0e        	lsrs	r2, r0, #24
    18fb: 06 00        	movs	r6, r0
    18fd: 00 08        	lsrs	r0, r0, #32
    18ff: 0b 8b        	ldrh	r3, [r1, #24]
    1901: 03 00        	movs	r3, r0
    1903: 00 06        	lsls	r0, r0, #24
    1905: b4 02        	lsls	r4, r6, #10
    1907: b8 00        	lsls	r0, r7, #2
    1909: 00 00        	movs	r0, r0
    190b: 0a 0b        	lsrs	r2, r1, #12
    190d: 03 10        	asrs	r3, r0, #32
    190f: 00 00        	movs	r0, r0
    1911: 06 b5        	push	{r1, r2, lr}
    1913: 02 0e        	lsrs	r2, r0, #24
    1915: 06 00        	movs	r6, r0
    1917: 00 0c        	lsrs	r0, r0, #16
    1919: 0b 95        	str	r5, [sp, #44]
    191b: 03 00        	movs	r3, r0
    191d: 00 06        	lsls	r0, r0, #24
    191f: b6 02        	lsls	r6, r6, #10
    1921: b8 00        	lsls	r0, r7, #2
    1923: 00 00        	movs	r0, r0
    1925: 0e 14        	asrs	r6, r1, #16
    1927: 44 52        	strh	r4, [r0, r1]
    1929: 00 06        	lsls	r0, r0, #24
    192b: b7 02        	lsls	r7, r6, #10
    192d: 0e 06        	lsls	r6, r1, #24
    192f: 00 00        	movs	r0, r0
    1931: 10 0b        	lsrs	r0, r2, #12
    1933: 23 03        	lsls	r3, r4, #12
    1935: 00 00        	movs	r0, r0
    1937: 06           	<unknown>
    1938: b8 02        	lsls	r0, r7, #10
    193a: b8 00        	lsls	r0, r7, #2
    193c: 00 00        	movs	r0, r0
    193e: 12 14        	asrs	r2, r2, #16
    1940: 53 52        	strh	r3, [r2, r1]
    1942: 31 00        	movs	r1, r6
    1944: 06 b9        	cbnz	r6, 0x1948 <.debug_info+0x1948> @ imm = #0
    1946: 02 0e        	lsrs	r2, r0, #24
    1948: 06 00        	movs	r6, r0
    194a: 00 14        	asrs	r0, r0, #16
    194c: 0b 2d        	cmp	r5, #11
    194e: 03 00        	movs	r3, r0
    1950: 00 06        	lsls	r0, r0, #24
    1952: ba 02        	lsls	r2, r7, #10
    1954: b8 00        	lsls	r0, r7, #2
    1956: 00 00        	movs	r0, r0
    1958: 16 14        	asrs	r6, r2, #16
    195a: 53 52        	strh	r3, [r2, r1]
    195c: 32 00        	movs	r2, r6
    195e: 06 bb        	cbnz	r6, 0x19a2 <.debug_info+0x19a2> @ imm = #64
    1960: 02 0e        	lsrs	r2, r0, #24
    1962: 06 00        	movs	r6, r0
    1964: 00 18        	adds	r0, r0, r0
    1966: 0b 37        	adds	r7, #11
    1968: 03 00        	movs	r3, r0
    196a: 00 06        	lsls	r0, r0, #24
    196c: bc 02        	lsls	r4, r7, #10
    196e: b8 00        	lsls	r0, r7, #2
    1970: 00 00        	movs	r0, r0
    1972: 1a 14        	asrs	r2, r3, #16
    1974: 43 43        	muls	r3, r0, r3
    1976: 52 00        	lsls	r2, r2, #1
    1978: 06 bd        	pop	{r1, r2, pc}
    197a: 02 0e        	lsrs	r2, r0, #24
    197c: 06 00        	movs	r6, r0
    197e: 00 1c        	adds	r0, r0, #0
    1980: 0b 7b        	ldrb	r3, [r1, #12]
    1982: 0e 00        	movs	r6, r1
    1984: 00 06        	lsls	r0, r0, #24
    1986: be 02        	lsls	r6, r7, #10
    1988: b8 00        	lsls	r0, r7, #2
    198a: 00 00        	movs	r0, r0
    198c: 1e 0b        	lsrs	r6, r3, #12
    198e: f1 0e        	lsrs	r1, r6, #27
    1990: 00 00        	movs	r0, r0
    1992: 06 bf        	itte	eq
    1994: 02 0e        	lsreq	r2, r0, #24
    1996: 06 00        	movs	r6, r0
    1998: 00 20        	movne	r0, #0
    199a: 0b 85        	strh	r3, [r1, #40]
    199c: 0e 00        	movs	r6, r1
    199e: 00 06        	lsls	r0, r0, #24
    19a0: c0 02        	lsls	r0, r0, #11
    19a2: b8 00        	lsls	r0, r7, #2
    19a4: 00 00        	movs	r0, r0
    19a6: 22 00        	movs	r2, r4
    19a8: 12 c0        	stm	r0!, {r1, r4}
    19aa: 0f 00        	movs	r7, r1
    19ac: 00 06        	lsls	r0, r0, #24
    19ae: c1 02        	lsls	r1, r0, #11
    19b0: 89 07        	lsls	r1, r1, #30
    19b2: 00 00        	movs	r0, r0
    19b4: 13 88        	ldrh	r3, [r2]
    19b6: 06 dd        	ble	0x19c6 <.debug_info+0x19c6> @ imm = #12
    19b8: 02 17        	asrs	r2, r0, #28
    19ba: 0a 00        	movs	r2, r1
    19bc: 00 14        	asrs	r0, r0, #16
    19be: 43 52        	strh	r3, [r0, r1]
    19c0: 00 06        	lsls	r0, r0, #24
    19c2: df 02        	lsls	r7, r3, #11
    19c4: 6e 04        	lsls	r6, r5, #17
    19c6: 00 00        	movs	r0, r0
    19c8: 00 0b        	lsrs	r0, r0, #12
    19ca: 07 0f        	lsrs	r7, r0, #28
    19cc: 00 00        	movs	r0, r0
    19ce: 06 e0        	b	0x19de <.debug_info+0x19de> @ imm = #12
    19d0: 02 6e        	ldr	r2, [r0, #96]
    19d2: 04 00        	movs	r4, r0
    19d4: 00 04        	lsls	r0, r0, #16
    19d6: 0b 0a        	lsrs	r3, r1, #8
    19d8: 0f 00        	movs	r7, r1
    19da: 00 06        	lsls	r0, r0, #24
    19dc: e1 02        	lsls	r1, r4, #11
    19de: 6e 04        	lsls	r6, r5, #17
    19e0: 00 00        	movs	r0, r0
    19e2: 08 14        	asrs	r0, r1, #16
    19e4: 43 49        	ldr	r1, [pc, #268]          @ 0x1af4 <.debug_info+0x1af4>
    19e6: 52 00        	lsls	r2, r2, #1
    19e8: 06 e2        	b	0x1df8 <.debug_info+0x1df8> @ imm = #1036
    19ea: 02 6e        	ldr	r2, [r0, #96]
    19ec: 04 00        	movs	r4, r0
    19ee: 00 0c        	lsrs	r0, r0, #16
    19f0: 0b b2        	sxth	r3, r1
    19f2: 0e 00        	movs	r6, r1
    19f4: 00 06        	lsls	r0, r0, #24
    19f6: e3 02        	lsls	r3, r4, #11
    19f8: 6e 04        	lsls	r6, r5, #17
    19fa: 00 00        	movs	r0, r0
    19fc: 10 0b        	lsrs	r0, r2, #12
    19fe: 22 10        	asrs	r2, r4, #32
    1a00: 00 00        	movs	r0, r0
    1a02: 06 e4        	b	0x1212 <.debug_info+0x1212> @ imm = #-2036
    1a04: 02 6e        	ldr	r2, [r0, #96]
    1a06: 04 00        	movs	r4, r0
    1a08: 00 14        	asrs	r0, r0, #16
    1a0a: 0b 77        	strb	r3, [r1, #28]
    1a0c: 0f 00        	movs	r7, r1
    1a0e: 00 06        	lsls	r0, r0, #24
    1a10: e5 02        	lsls	r5, r4, #11
    1a12: 6e 04        	lsls	r6, r5, #17
    1a14: 00 00        	movs	r0, r0
    1a16: 18 0b        	lsrs	r0, r3, #12
    1a18: ef 02        	lsls	r7, r5, #11
    1a1a: 00 00        	movs	r0, r0
    1a1c: 06 e6        	b	0x162c <.debug_info+0x162c> @ imm = #-1012
    1a1e: 02 ce        	ldm	r6!, {r1}
    1a20: 00 00        	movs	r0, r0
    1a22: 00 1c        	adds	r0, r0, #0
    1a24: 0b 8d        	ldrh	r3, [r1, #40]
    1a26: 0f 00        	movs	r7, r1
    1a28: 00 06        	lsls	r0, r0, #24
    1a2a: e7 02        	lsls	r7, r4, #11
    1a2c: 6e 04        	lsls	r6, r5, #17
    1a2e: 00 00        	movs	r0, r0
    1a30: 20 0b        	lsrs	r0, r4, #12
    1a32: 15 0f        	lsrs	r5, r2, #28
    1a34: 00 00        	movs	r0, r0
    1a36: 06           	<unknown>
    1a37: e8 02        	lsls	r0, r5, #11
    1a39: 6e 04        	lsls	r6, r5, #17
    1a3b: 00 00        	movs	r0, r0
    1a3d: 24 0b        	lsrs	r4, r4, #12
    1a3f: f9 02        	lsls	r1, r7, #11
    1a41: 00 00        	movs	r0, r0
    1a43: 06           	<unknown>
    1a44: e9 02        	lsls	r1, r5, #11
    1a46: b4 05        	lsls	r4, r6, #22
    1a48: 00 00        	movs	r0, r0
    1a4a: 28 0b        	lsrs	r0, r5, #12
    1a4c: 08 10        	asrs	r0, r1, #32
    1a4e: 00 00        	movs	r0, r0
    1a50: 06 ea 02 6e  	and.w	lr, r6, r2, lsl #24
    1a54: 04 00        	movs	r4, r0
    1a56: 00 30        	adds	r0, #0
    1a58: 0b bb        	cbnz	r3, 0x1a9e <.debug_info+0x1a9e> @ imm = #66
    1a5a: 0e 00        	movs	r6, r1
    1a5c: 00 06        	lsls	r0, r0, #24
    1a5e: eb 02        	lsls	r3, r5, #11
    1a60: 6e 04        	lsls	r6, r5, #17
    1a62: 00 00        	movs	r0, r0
    1a64: 34 0b        	lsrs	r4, r6, #12
    1a66: bd 10        	asrs	r5, r7, #2
    1a68: 00 00        	movs	r0, r0
    1a6a: 06           	<unknown>
    1a6b: ec 02        	lsls	r4, r5, #11
    1a6d: 6e 04        	lsls	r6, r5, #17
    1a6f: 00 00        	movs	r0, r0
    1a71: 38 0b        	lsrs	r0, r7, #12
    1a73: 8b 03        	lsls	r3, r1, #14
    1a75: 00 00        	movs	r0, r0
    1a77: 06 ed 02 ce  	stc	p14, c12, [r6, #-8]
    1a7b: 00 00        	movs	r0, r0
    1a7d: 00 3c        	subs	r4, #0
    1a7f: 0b 96        	str	r6, [sp, #44]
    1a81: 0f 00        	movs	r7, r1
    1a83: 00 06        	lsls	r0, r0, #24
    1a85: ee 02        	lsls	r6, r5, #11
    1a87: 6e 04        	lsls	r6, r5, #17
    1a89: 00 00        	movs	r0, r0
    1a8b: 40 0b        	lsrs	r0, r0, #13
    1a8d: 47 0e        	lsrs	r7, r0, #25
    1a8f: 00 00        	movs	r0, r0
    1a91: 06           	<unknown>
    1a92: ef 02        	lsls	r7, r5, #11
    1a94: 6e 04        	lsls	r6, r5, #17
    1a96: 00 00        	movs	r0, r0
    1a98: 44 0b        	lsrs	r4, r0, #13
    1a9a: 95 03        	lsls	r5, r2, #14
    1a9c: 00 00        	movs	r0, r0
    1a9e: 06 f0 02 b4  	b.w	0x4082a6 <.debug_info+0x4082a6> @ imm = #4220932
    1aa2: 05 00        	movs	r5, r0
    1aa4: 00 48        	ldr	r0, [pc, #0]            @ 0x1aa8 <.debug_info+0x1aa8>
    1aa6: 0b 4f        	ldr	r7, [pc, #44]           @ 0x1ad4 <.debug_info+0x1ad4>
    1aa8: 0e 00        	movs	r6, r1
    1aaa: 00 06        	lsls	r0, r0, #24
    1aac: f1 02        	lsls	r1, r6, #11
    1aae: 6e 04        	lsls	r6, r5, #17
    1ab0: 00 00        	movs	r0, r0
    1ab2: 50 0b        	lsrs	r0, r2, #13
    1ab4: 30 0e        	lsrs	r0, r6, #24
    1ab6: 00 00        	movs	r0, r0
    1ab8: 06 f2 02 6e  	addw	lr, r6, #1538
    1abc: 04 00        	movs	r4, r0
    1abe: 00 54        	strb	r0, [r0, r0]
    1ac0: 0b cc        	ldm	r4!, {r0, r1, r3}
    1ac2: 0f 00        	movs	r7, r1
    1ac4: 00 06        	lsls	r0, r0, #24
    1ac6: f3 02        	lsls	r3, r6, #11
    1ac8: 6e 04        	lsls	r6, r5, #17
    1aca: 00 00        	movs	r0, r0
    1acc: 58 0b        	lsrs	r0, r3, #13
    1ace: 23 03        	lsls	r3, r4, #12
    1ad0: 00 00        	movs	r0, r0
    1ad2: 06           	<unknown>
    1ad3: f4 02        	lsls	r4, r6, #11
    1ad5: ce 00        	lsls	r6, r1, #3
    1ad7: 00 00        	movs	r0, r0
    1ad9: 5c 0b        	lsrs	r4, r3, #13
    1adb: 35 0f        	lsrs	r5, r6, #28
    1add: 00 00        	movs	r0, r0
    1adf: 06 f5 02 6e  	add.w	lr, r6, #2080
    1ae3: 04 00        	movs	r4, r0
    1ae5: 00 60        	str	r0, [r0]
    1ae7: 0b 2b        	cmp	r3, #11
    1ae9: 0f 00        	movs	r7, r1
    1aeb: 00 06        	lsls	r0, r0, #24
    1aed: f6 02        	lsls	r6, r6, #11
    1aef: 6e 04        	lsls	r6, r5, #17
    1af1: 00 00        	movs	r0, r0
    1af3: 64 0b        	lsrs	r4, r4, #13
    1af5: 2d 03        	lsls	r5, r5, #12
    1af7: 00 00        	movs	r0, r0
    1af9: 06 f7 02 b4  	b.w	0xffb08301 <CallbackContext+0xffffffffdfb06f81> @ imm = #-5216252
    1afd: 05 00        	movs	r5, r0
    1aff: 00 68        	ldr	r0, [r0]
    1b01: 0b ca        	ldm	r2!, {r0, r1, r3}
    1b03: 0e 00        	movs	r6, r1
    1b05: 00 06        	lsls	r0, r0, #24
    1b07: f8 02        	lsls	r0, r7, #11
    1b09: 6e 04        	lsls	r6, r5, #17
    1b0b: 00 00        	movs	r0, r0
    1b0d: 70 14        	asrs	r0, r6, #17
    1b0f: 43 53        	strh	r3, [r0, r5]
    1b11: 52 00        	lsls	r2, r2, #1
    1b13: 06           	<unknown>
    1b14: f9 02        	lsls	r1, r7, #11
    1b16: 6e 04        	lsls	r6, r5, #17
    1b18: 00 00        	movs	r0, r0
    1b1a: 74 0b        	lsrs	r4, r6, #13
    1b1c: 37 03        	lsls	r7, r6, #12
    1b1e: 00 00        	movs	r0, r0
    1b20: 06           	<unknown>
    1b21: fa 02        	lsls	r2, r7, #11
    1b23: b4 05        	lsls	r4, r6, #22
    1b25: 00 00        	movs	r0, r0
    1b27: 78 0b        	lsrs	r0, r7, #13
    1b29: 0f 0f        	lsrs	r7, r1, #28
    1b2b: 00 00        	movs	r0, r0
    1b2d: 06 fb 02 6e  	mla	lr, r6, r2, r6
    1b31: 04 00        	movs	r4, r0
    1b33: 00 80        	strh	r0, [r0]
    1b35: 0b f0 0d 00  	and	r0, r11, #13
    1b39: 00 06        	lsls	r0, r0, #24
    1b3b: fc 02        	lsls	r4, r7, #11
    1b3d: 6e 04        	lsls	r6, r5, #17
    1b3f: 00 00        	movs	r0, r0
    1b41: 84 00        	lsls	r4, r0, #2
    1b43: 12 30        	adds	r0, #18
    1b45: 10 00        	movs	r0, r2
    1b47: 00 06        	lsls	r0, r0, #24
    1b49: fd 02        	lsls	r5, r7, #11
    1b4b: 88 08        	lsrs	r0, r1, #2
    1b4d: 00 00        	movs	r0, r0
    1b4f: 13 24        	movs	r4, #19
    1b51: 06 4f        	ldr	r7, [pc, #24]           @ 0x1b6c <.debug_info+0x1b6c>
    1b53: 03 15        	asrs	r3, r0, #20
    1b55: 0b 00        	movs	r3, r1
    1b57: 00 14        	asrs	r0, r0, #16
    1b59: 43 52        	strh	r3, [r0, r1]
    1b5b: 31 00        	movs	r1, r6
    1b5d: 06 51        	str	r6, [r0, r4]
    1b5f: 03 0e        	lsrs	r3, r0, #24
    1b61: 06 00        	movs	r6, r0
    1b63: 00 00        	movs	r0, r0
    1b65: 0b           	<unknown>
    1b66: ef 02        	lsls	r7, r5, #11
    1b68: 00 00        	movs	r0, r0
    1b6a: 06 52        	strh	r6, [r0, r0]
    1b6c: 03           	<unknown>
    1b6d: b8 00        	lsls	r0, r7, #2
    1b6f: 00 00        	movs	r0, r0
    1b71: 02 14        	asrs	r2, r0, #16
    1b73: 43 52        	strh	r3, [r0, r1]
    1b75: 32 00        	movs	r2, r6
    1b77: 06 53        	strh	r6, [r0, r4]
    1b79: 03 0e        	lsrs	r3, r0, #24
    1b7b: 06 00        	movs	r6, r0
    1b7d: 00 04        	lsls	r0, r0, #16
    1b7f: 0b           	<unknown>
    1b80: f9 02        	lsls	r1, r7, #11
    1b82: 00 00        	movs	r0, r0
    1b84: 06 54        	strb	r6, [r0, r0]
    1b86: 03           	<unknown>
    1b87: b8 00        	lsls	r0, r7, #2
    1b89: 00 00        	movs	r0, r0
    1b8b: 06 14        	asrs	r6, r0, #16
    1b8d: 53 52        	strh	r3, [r2, r1]
    1b8f: 00 06        	lsls	r0, r0, #24
    1b91: 55 03        	lsls	r5, r2, #13
    1b93: 0e 06        	lsls	r6, r1, #24
    1b95: 00 00        	movs	r0, r0
    1b97: 08 0b        	lsrs	r0, r1, #12
    1b99: 8b 03        	lsls	r3, r1, #14
    1b9b: 00 00        	movs	r0, r0
    1b9d: 06 56        	ldrsb	r6, [r0, r0]
    1b9f: 03           	<unknown>
    1ba0: b8 00        	lsls	r0, r7, #2
    1ba2: 00 00        	movs	r0, r0
    1ba4: 0a 14        	asrs	r2, r1, #16
    1ba6: 44 52        	strh	r4, [r0, r1]
    1ba8: 00 06        	lsls	r0, r0, #24
    1baa: 57 03        	lsls	r7, r2, #13
    1bac: 0e 06        	lsls	r6, r1, #24
    1bae: 00 00        	movs	r0, r0
    1bb0: 0c 0b        	lsrs	r4, r1, #12
    1bb2: 95 03        	lsls	r5, r2, #14
    1bb4: 00 00        	movs	r0, r0
    1bb6: 06 58        	ldr	r6, [r0, r0]
    1bb8: 03           	<unknown>
    1bb9: b8 00        	lsls	r0, r7, #2
    1bbb: 00 00        	movs	r0, r0
    1bbd: 0e 0b        	lsrs	r6, r1, #12
    1bbf: f8 0f        	lsrs	r0, r7, #31
    1bc1: 00 00        	movs	r0, r0
    1bc3: 06 59        	ldr	r6, [r0, r4]
    1bc5: 03 0e        	lsrs	r3, r0, #24
    1bc7: 06 00        	movs	r6, r0
    1bc9: 00 10        	asrs	r0, r0, #32
    1bcb: 0b 23        	movs	r3, #11
    1bcd: 03 00        	movs	r3, r0
    1bcf: 00 06        	lsls	r0, r0, #24
    1bd1: 5a 03        	lsls	r2, r3, #13
    1bd3: b8 00        	lsls	r0, r7, #2
    1bd5: 00 00        	movs	r0, r0
    1bd7: 12 0b        	lsrs	r2, r2, #12
    1bd9: 24 0f        	lsrs	r4, r4, #28
    1bdb: 00 00        	movs	r0, r0
    1bdd: 06 5b        	ldrh	r6, [r0, r4]
    1bdf: 03 0e        	lsrs	r3, r0, #24
    1be1: 06 00        	movs	r6, r0
    1be3: 00 14        	asrs	r0, r0, #16
    1be5: 0b 2d        	cmp	r5, #11
    1be7: 03 00        	movs	r3, r0
    1be9: 00 06        	lsls	r0, r0, #24
    1beb: 5c 03        	lsls	r4, r3, #13
    1bed: b8 00        	lsls	r0, r7, #2
    1bef: 00 00        	movs	r0, r0
    1bf1: 16 0b        	lsrs	r6, r2, #12
    1bf3: 3a 0e        	lsrs	r2, r7, #24
    1bf5: 00 00        	movs	r0, r0
    1bf7: 06 5d        	ldrb	r6, [r0, r4]
    1bf9: 03 0e        	lsrs	r3, r0, #24
    1bfb: 06 00        	movs	r6, r0
    1bfd: 00 18        	adds	r0, r0, r0
    1bff: 0b 37        	adds	r7, #11
    1c01: 03 00        	movs	r3, r0
    1c03: 00 06        	lsls	r0, r0, #24
    1c05: 5e 03        	lsls	r6, r3, #13
    1c07: b8 00        	lsls	r0, r7, #2
    1c09: 00 00        	movs	r0, r0
    1c0b: 1a 0b        	lsrs	r2, r3, #12
    1c0d: f3 0d        	lsrs	r3, r6, #23
    1c0f: 00 00        	movs	r0, r0
    1c11: 06 5f        	ldrsh	r6, [r0, r4]
    1c13: 03 0e        	lsrs	r3, r0, #24
    1c15: 06 00        	movs	r6, r0
    1c17: 00 1c        	adds	r0, r0, #0
    1c19: 0b 7b        	ldrb	r3, [r1, #12]
    1c1b: 0e 00        	movs	r6, r1
    1c1d: 00 06        	lsls	r0, r0, #24
    1c1f: 60 03        	lsls	r0, r4, #13
    1c21: b8 00        	lsls	r0, r7, #2
    1c23: 00 00        	movs	r0, r0
    1c25: 1e 0b        	lsrs	r6, r3, #12
    1c27: 8c 10        	asrs	r4, r1, #2
    1c29: 00 00        	movs	r0, r0
    1c2b: 06 61        	str	r6, [r0, #16]
    1c2d: 03 0e        	lsrs	r3, r0, #24
    1c2f: 06 00        	movs	r6, r0
    1c31: 00 20        	movs	r0, #0
    1c33: 0b 85        	strh	r3, [r1, #40]
    1c35: 0e 00        	movs	r6, r1
    1c37: 00 06        	lsls	r0, r0, #24
    1c39: 62 03        	lsls	r2, r4, #13
    1c3b: b8 00        	lsls	r0, r7, #2
    1c3d: 00 00        	movs	r0, r0
    1c3f: 22 00        	movs	r2, r4
    1c41: 12           	<unknown>
    1c42: ec 0f        	lsrs	r4, r5, #31
    1c44: 00 00        	movs	r0, r0
    1c46: 06 63        	str	r6, [r0, #48]
    1c48: 03 23        	movs	r3, #3
    1c4a: 0a 00        	movs	r2, r1
    1c4c: 00 17        	asrs	r0, r0, #28
    1c4e: 01 07        	lsls	r1, r0, #28
    1c50: 40 42        	rsbs	r0, r0, #0
    1c52: 0b 00        	movs	r3, r1
    1c54: 00 09        	lsrs	r0, r0, #4
    1c56: 05 06        	lsls	r5, r0, #24
    1c58: 00 00        	movs	r0, r0
    1c5a: 00 09        	lsrs	r0, r0, #4
    1c5c: f7 04        	lsls	r7, r6, #19
    1c5e: 00 00        	movs	r0, r0
    1c60: 01 09        	lsrs	r1, r0, #4
    1c62: 28 02        	lsls	r0, r5, #8
    1c64: 00 00        	movs	r0, r0
    1c66: 02 09        	lsrs	r2, r0, #4
    1c68: 4d 02        	lsls	r5, r1, #9
    1c6a: 00 00        	movs	r0, r0
    1c6c: 03 00        	movs	r3, r0
    1c6e: 03 11        	asrs	r3, r0, #4
    1c70: 0a 00        	movs	r2, r1
    1c72: 00 07        	lsls	r0, r0, #28
    1c74: 45 21        	movs	r1, #69
    1c76: 0b 00        	movs	r3, r1
    1c78: 00 17        	asrs	r0, r0, #28
    1c7a: 01 07        	lsls	r1, r0, #28
    1c7c: 4d 62        	str	r5, [r1, #36]
    1c7e: 0b 00        	movs	r3, r1
    1c80: 00 09        	lsrs	r0, r0, #4
    1c82: 51 03        	lsls	r1, r2, #13
    1c84: 00 00        	movs	r0, r0
    1c86: 00 09        	lsrs	r0, r0, #4
    1c88: 9f 02        	lsls	r7, r3, #10
    1c8a: 00 00        	movs	r0, r0
    1c8c: 01 00        	movs	r1, r0
    1c8e: 03 14        	asrs	r3, r0, #16
    1c90: 01 00        	movs	r1, r0
    1c92: 00 07        	lsls	r0, r0, #28
    1c94: 50 4d        	ldr	r5, [pc, #320]          @ 0x1dd8 <.debug_info+0x1dd8>
    1c96: 0b 00        	movs	r3, r1
    1c98: 00 17        	asrs	r0, r0, #28
    1c9a: 01 07        	lsls	r1, r0, #28
    1c9c: 58 8e        	ldrh	r0, [r3, #50]
    1c9e: 0b 00        	movs	r3, r1
    1ca0: 00 09        	lsrs	r0, r0, #4
    1ca2: d8 0a        	lsrs	r0, r3, #11
    1ca4: 00 00        	movs	r0, r0
    1ca6: 00 09        	lsrs	r0, r0, #4
    1ca8: 16 04        	lsls	r6, r2, #16
    1caa: 00 00        	movs	r0, r0
    1cac: 01 09        	lsrs	r1, r0, #4
    1cae: 2c 04        	lsls	r4, r5, #16
    1cb0: 00 00        	movs	r0, r0
    1cb2: 02 09        	lsrs	r2, r0, #4
    1cb4: 30 01        	lsls	r0, r6, #4
    1cb6: 00 00        	movs	r0, r0
    1cb8: 03 00        	movs	r3, r0
    1cba: 03           	<unknown>
    1cbb: e8 0a        	lsrs	r0, r5, #11
    1cbd: 00 00        	movs	r0, r0
    1cbf: 07 5d        	ldrb	r7, [r0, r4]
    1cc1: 6d 0b        	lsrs	r5, r5, #13
    1cc3: 00 00        	movs	r0, r0
    1cc5: 17 01        	lsls	r7, r2, #4
    1cc7: 07 65        	str	r7, [r0, #80]
    1cc9: b4 0b        	lsrs	r4, r6, #14
    1ccb: 00 00        	movs	r0, r0
    1ccd: 09           	<unknown>
    1cce: b7 00        	lsls	r7, r6, #2
    1cd0: 00 00        	movs	r0, r0
    1cd2: 00 09        	lsrs	r0, r0, #4
    1cd4: b4 0c        	lsrs	r4, r6, #18
    1cd6: 00 00        	movs	r0, r0
    1cd8: 01 09        	lsrs	r1, r0, #4
    1cda: c2 01        	lsls	r2, r0, #7
    1cdc: 00 00        	movs	r0, r0
    1cde: 02 00        	movs	r2, r0
    1ce0: 03 d1        	bne	0x1cea <.debug_info+0x1cea> @ imm = #6
    1ce2: 03 00        	movs	r3, r0
    1ce4: 00 07        	lsls	r0, r0, #28
    1ce6: 69 99        	ldr	r1, [sp, #420]
    1ce8: 0b 00        	movs	r3, r1
    1cea: 00 18        	adds	r0, r0, r0
    1cec: 08 07        	lsls	r0, r1, #28
    1cee: 7b 04        	lsls	r3, r7, #17
    1cf0: 0c 00        	movs	r4, r1
    1cf2: 00 19        	adds	r0, r0, r4
    1cf4: 0c 0b        	lsrs	r4, r1, #12
    1cf6: 00 00        	movs	r0, r0
    1cf8: 07 7d        	ldrb	r7, [r0, #20]
    1cfa: ce 00        	lsls	r6, r1, #3
    1cfc: 00 00        	movs	r0, r0
    1cfe: 00 19        	adds	r0, r0, r4
    1d00: d9 09        	lsrs	r1, r3, #7
    1d02: 00 00        	movs	r0, r0
    1d04: 07 80        	strh	r7, [r0]
    1d06: 42 0b        	lsrs	r2, r0, #13
    1d08: 00 00        	movs	r0, r0
    1d0a: 04 19        	adds	r4, r0, r4
    1d0c: 94 08        	lsrs	r4, r2, #2
    1d0e: 00 00        	movs	r0, r0
    1d10: 07 83        	strh	r7, [r0, #24]
    1d12: 8e 0b        	lsrs	r6, r1, #14
    1d14: 00 00        	movs	r0, r0
    1d16: 05 19        	adds	r5, r0, r4
    1d18: aa 06        	lsls	r2, r5, #26
    1d1a: 00 00        	movs	r0, r0
    1d1c: 07 86        	strh	r7, [r0, #48]
    1d1e: 62 0b        	lsrs	r2, r4, #13
    1d20: 00 00        	movs	r0, r0
    1d22: 06 19        	adds	r6, r0, r4
    1d24: 22 0b        	lsrs	r2, r4, #12
    1d26: 00 00        	movs	r0, r0
    1d28: 07 89        	ldrh	r7, [r0, #8]
    1d2a: b4 0b        	lsrs	r4, r6, #14
    1d2c: 00 00        	movs	r0, r0
    1d2e: 07 00        	movs	r7, r0
    1d30: 03 ad        	add	r5, sp, #12
    1d32: 02 00        	movs	r2, r0
    1d34: 00 07        	lsls	r0, r0, #28
    1d36: 8b bf        	itete	hi
    1d38: 0b 00        	movs	r3, r1
    1d3a: 00 02        	lslls	r0, r0, #8
    1d3c: 01 08        	lsrhi	r1, r0, #32
    1d3e: 0c 03        	lslls	r4, r1, #12
    1d40: 00 00        	movs	r0, r0
    1d42: 1a e1        	b	0x1f7a <.debug_info+0x1f7a> @ imm = #564
    1d44: 0d 00        	movs	r5, r1
    1d46: 00 02        	lsls	r0, r0, #8
    1d48: 2f 04        	lsls	r7, r5, #16
    1d4a: 03 30        	adds	r0, #3
    1d4c: 0c 00        	movs	r4, r1
    1d4e: 00 1b        	subs	r0, r0, r4
    1d50: f0 0b        	lsrs	r0, r6, #15
    1d52: 00 00        	movs	r0, r0
    1d54: 02 2f        	cmp	r7, #2
    1d56: 04 31        	adds	r1, #4
    1d58: 03 00        	movs	r3, r0
    1d5a: 00 00        	movs	r0, r0
    1d5c: 1a 7b        	ldrb	r2, [r3, #12]
    1d5e: 0c 00        	movs	r4, r1
    1d60: 00 02        	lsls	r0, r0, #8
    1d62: 84 04        	lsls	r4, r0, #18
    1d64: 03 56        	ldrsb	r3, [r0, r0]
    1d66: 0c 00        	movs	r4, r1
    1d68: 00 1b        	subs	r0, r0, r4
    1d6a: f0 0b        	lsrs	r0, r6, #15
    1d6c: 00 00        	movs	r0, r0
    1d6e: 02 84        	strh	r2, [r0, #32]
    1d70: 04 31        	adds	r1, #4
    1d72: 03 00        	movs	r3, r0
    1d74: 00 1b        	subs	r0, r0, r4
    1d76: 6c 0b        	lsrs	r4, r5, #13
    1d78: 00 00        	movs	r0, r0
    1d7a: 02 84        	strh	r2, [r0, #32]
    1d7c: 04 ce        	ldm	r6!, {r2}
    1d7e: 00 00        	movs	r0, r0
    1d80: 00 00        	movs	r0, r0
    1d82: 1a b0        	add	sp, #104
    1d84: 0f 00        	movs	r7, r1
    1d86: 00 02        	lsls	r0, r0, #8
    1d88: 3d 04        	lsls	r5, r7, #16
    1d8a: 03 70        	strb	r3, [r0]
    1d8c: 0c 00        	movs	r4, r1
    1d8e: 00 1b        	subs	r0, r0, r4
    1d90: f0 0b        	lsrs	r0, r6, #15
    1d92: 00 00        	movs	r0, r0
    1d94: 02 3d        	subs	r5, #2
    1d96: 04 31        	adds	r1, #4
    1d98: 03 00        	movs	r3, r0
    1d9a: 00 00        	movs	r0, r0
    1d9c: 1c fb 0d 00  	smlabb	r0, r12, sp, r0
    1da0: 00 01        	lsls	r0, r0, #4
    1da2: dc 6c        	ldr	r4, [r3, #76]
    1da4: 09 00        	movs	r1, r1
    1da6: 20 74        	strb	r0, [r4, #16]
    1da8: 00 00        	movs	r0, r0
    1daa: 00 01        	lsls	r0, r0, #4
    1dac: 9c a4        	adr	r4, #624 <.debug_info+0x1e4c>
    1dae: 0c 00        	movs	r4, r1
    1db0: 00 1d        	adds	r0, r0, #4
    1db2: e0 0e        	lsrs	r0, r4, #27
    1db4: 00 00        	movs	r0, r0
    1db6: 01 dc        	bgt	0x1dbc <.debug_info+0x1dbc> @ imm = #2
    1db8: a2 00        	lsls	r2, r4, #2
    1dba: 00 00        	movs	r0, r0
    1dbc: 83 01        	lsls	r3, r0, #6
    1dbe: 00 00        	movs	r0, r0
    1dc0: 1d 41        	asrs	r5, r3
    1dc2: 0e 00        	movs	r6, r1
    1dc4: 00 01        	lsls	r0, r0, #4
    1dc6: dc a2        	adr	r2, #880 <.debug_info+0x1ea6>
    1dc8: 00 00        	movs	r0, r0
    1dca: 00 a4        	adr	r4, #0 <.debug_info+0x1dce>
    1dcc: 01 00        	movs	r1, r0
    1dce: 00 00        	movs	r0, r0
    1dd0: 1e 52        	strh	r6, [r3, r0]
    1dd2: 0f 00        	movs	r7, r1
    1dd4: 00 01        	lsls	r0, r0, #4
    1dd6: f4 00        	lsls	r4, r6, #3
    1dd8: 00 00        	movs	r0, r0
    1dda: 00 50        	str	r0, [r0, r0]
    1ddc: 00 00        	movs	r0, r0
    1dde: 00 01        	lsls	r0, r0, #4
    1de0: 9c 1f        	subs	r4, r3, #6
    1de2: d6 0f        	lsrs	r6, r2, #31
    1de4: 00 00        	movs	r0, r0
    1de6: 01 0d        	lsrs	r1, r0, #20
    1de8: 01 00        	movs	r1, r0
    1dea: 00 00        	movs	r0, r0
    1dec: 00 24        	movs	r4, #0
    1dee: 00 00        	movs	r0, r0
    1df0: 00 01        	lsls	r0, r0, #4
    1df2: 9c 20        	movs	r0, #156
    1df4: 51 10        	asrs	r1, r2, #1
    1df6: 00 00        	movs	r0, r0
    1df8: 01 95        	str	r5, [sp, #4]
    1dfa: 00 00        	movs	r0, r0
    1dfc: 00 00        	movs	r0, r0
    1dfe: 18 00        	movs	r0, r3
    1e00: 00 00        	movs	r0, r0
    1e02: 01 9c        	ldr	r4, [sp, #4]
    1e04: f2 0c        	lsrs	r2, r6, #19
    1e06: 00 00        	movs	r0, r0
    1e08: 21 00        	movs	r1, r4
    1e0a: 00 00        	movs	r0, r0
    1e0c: 00 70        	strb	r0, [r0]
    1e0e: 0c 00        	movs	r4, r1
    1e10: 00 22        	movs	r2, #0
    1e12: 01 51        	str	r1, [r0, r4]
    1e14: 02 09        	lsrs	r2, r0, #4
    1e16: 9e 22        	movs	r2, #158
    1e18: 01 50        	str	r1, [r0, r0]
    1e1a: 01 32        	adds	r2, #1
    1e1c: 00 00        	movs	r0, r0
    1e1e: 20           	<unknown>
    1e1f: e8 0e        	lsrs	r0, r5, #27
    1e21: 00 00        	movs	r0, r0
    1e23: 01 9b        	ldr	r3, [sp, #4]
    1e25: 00 00        	movs	r0, r0
    1e27: 00 00        	movs	r0, r0
    1e29: 18 00        	movs	r0, r3
    1e2b: 00 00        	movs	r0, r0
    1e2d: 01 9c        	ldr	r4, [sp, #4]
    1e2f: 1c 0d        	lsrs	r4, r3, #20
    1e31: 00 00        	movs	r0, r0
    1e33: 21 00        	movs	r1, r4
    1e35: 00 00        	movs	r0, r0
    1e37: 00 70        	strb	r0, [r0]
    1e39: 0c 00        	movs	r4, r1
    1e3b: 00 22        	movs	r2, #0
    1e3d: 01 51        	str	r1, [r0, r4]
    1e3f: 01 31        	adds	r1, #1
    1e41: 22 01        	lsls	r2, r4, #4
    1e43: 50 01        	lsls	r0, r2, #5
    1e45: 32 00        	movs	r2, r6
    1e47: 00 23        	movs	r3, #0
    1e49: d9 04        	lsls	r1, r3, #19
    1e4b: 00 00        	movs	r0, r0
    1e4d: 01 a0        	adr	r0, #4 <.debug_info+0x1e52>
    1e4f: e0 09        	lsrs	r0, r4, #7
    1e51: 00 20        	movs	r0, #0
    1e53: 18 00        	movs	r0, r3
    1e55: 00 00        	movs	r0, r0
    1e57: 01 9c        	ldr	r4, [sp, #4]
    1e59: 71 0d        	lsrs	r1, r6, #21
    1e5b: 00 00        	movs	r0, r0
    1e5d: 1d ce        	ldm	r6!, {r0, r2, r3, r4}
    1e5f: 0b 00        	movs	r3, r1
    1e61: 00 01        	lsls	r0, r0, #4
    1e63: a0 94        	str	r4, [sp, #640]
    1e65: 00 00        	movs	r0, r0
    1e67: 00           	<unknown>
    1e68: c5 01        	lsls	r5, r0, #7
    1e6a: 00 00        	movs	r0, r0
    1e6c: 24 ee 09 00  	cdp	p0, #2, c0, c4, c9, #0
    1e70: 20 70        	strb	r0, [r4]
    1e72: 0c 00        	movs	r4, r1
    1e74: 00 5a        	ldrh	r0, [r0, r0]
    1e76: 0d 00        	movs	r5, r1
    1e78: 00 22        	movs	r2, #0
    1e7a: 01 51        	str	r1, [r0, r4]
    1e7c: 02 74        	strb	r2, [r0, #16]
    1e7e: 00 22        	movs	r2, #0
    1e80: 01 50        	str	r1, [r0, r0]
    1e82: 02 08        	lsrs	r2, r0, #32
    1e84: 20 00        	movs	r0, r4
    1e86: 21           	<unknown>
    1e87: f6 09        	lsrs	r6, r6, #7
    1e89: 00 20        	movs	r0, #0
    1e8b: 70 0c        	lsrs	r0, r6, #17
    1e8d: 00 00        	movs	r0, r0
    1e8f: 22 01        	lsls	r2, r4, #4
    1e91: 51 02        	lsls	r1, r2, #9
    1e93: 74 00        	lsls	r4, r6, #1
    1e95: 22 01        	lsls	r2, r4, #4
    1e97: 50 02        	lsls	r0, r2, #9
    1e99: 08 21        	movs	r1, #8
    1e9b: 00 00        	movs	r0, r0
    1e9d: 23 53        	strh	r3, [r4, r4]
    1e9f: 06 00        	movs	r6, r0
    1ea1: 00 01        	lsls	r0, r0, #4
    1ea3: 12 f8 09 00  	ldrb.w	r0, [r2, r9]
    1ea7: 20 40        	ands	r0, r4
    1ea9: 02 00        	movs	r2, r0
    1eab: 00 01        	lsls	r0, r0, #4
    1ead: 9c 4a        	ldr	r2, [pc, #624]          @ 0x2120 <.debug_info+0x2120>
    1eaf: 11 00        	movs	r1, r2
    1eb1: 00 1d        	adds	r0, r0, #4
    1eb3: d2 0d        	lsrs	r2, r2, #23
    1eb5: 00 00        	movs	r0, r0
    1eb7: 01 12        	asrs	r1, r0, #8
    1eb9: 94 00        	lsls	r4, r2, #2
    1ebb: 00 00        	movs	r0, r0
    1ebd: f3 01        	lsls	r3, r6, #7
    1ebf: 00 00        	movs	r0, r0
    1ec1: 1d dc        	bgt	0x1eff <.debug_info+0x1eff> @ imm = #58
    1ec3: 0d 00        	movs	r5, r1
    1ec5: 00 01        	lsls	r0, r0, #4
    1ec7: 12 94        	str	r4, [sp, #72]
    1ec9: 00 00        	movs	r0, r0
    1ecb: 00 1f        	subs	r0, r0, #4
    1ecd: 02 00        	movs	r2, r0
    1ecf: 00 1d        	adds	r0, r0, #4
    1ed1: c5 10        	asrs	r5, r0, #3
    1ed3: 00 00        	movs	r0, r0
    1ed5: 01 12        	asrs	r1, r0, #8
    1ed7: 94 00        	lsls	r4, r2, #2
    1ed9: 00 00        	movs	r0, r0
    1edb: 4b 02        	lsls	r3, r1, #9
    1edd: 00 00        	movs	r0, r0
    1edf: 1d 09        	lsrs	r5, r3, #4
    1ee1: 0e 00        	movs	r6, r1
    1ee3: 00 01        	lsls	r0, r0, #4
    1ee5: 12 94        	str	r4, [sp, #72]
    1ee7: 00 00        	movs	r0, r0
    1ee9: 00 77        	strb	r0, [r0, #28]
    1eeb: 02 00        	movs	r2, r0
    1eed: 00 25        	movs	r5, #0
    1eef: c6 09        	lsrs	r6, r0, #7
    1ef1: 00 00        	movs	r0, r0
    1ef3: 01 13        	asrs	r1, r0, #12
    1ef5: 04 0c        	lsrs	r4, r0, #16
    1ef7: 00 00        	movs	r0, r0
    1ef9: 02 91        	str	r1, [sp, #8]
    1efb: 50 26        	movs	r6, #80
    1efd: 1e 0f        	lsrs	r6, r3, #28
    1eff: 00 00        	movs	r0, r0
    1f01: 01 5c        	ldrb	r1, [r0, r0]
    1f03: ce 00        	lsls	r6, r1, #3
    1f05: 00 00        	movs	r0, r0
    1f07: 80 de        	udf	#128
    1f09: 80 02        	lsls	r0, r0, #10
    1f0b: 26 59        	ldr	r6, [r4, r4]
    1f0d: 10 00        	movs	r0, r2
    1f0f: 00 01        	lsls	r0, r0, #4
    1f11: 62 18        	adds	r2, r4, r1
    1f13: 06 00        	movs	r6, r0
    1f15: 00 a0        	adr	r0, #0 <.debug_info+0x1f19>
    1f17: 86 01        	lsls	r6, r0, #6
    1f19: 00 27        	movs	r7, #0
    1f1b: e3 0f        	lsrs	r3, r4, #31
    1f1d: 00 00        	movs	r0, r0
    1f1f: 01 63        	str	r1, [r0, #48]
    1f21: 94 00        	lsls	r4, r2, #2
    1f23: 00 00        	movs	r0, r0
    1f25: d2 28        	cmp	r0, #210
    1f27: 28 0b        	lsrs	r0, r5, #12
    1f29: 00 20        	movs	r0, #0
    1f2b: 16 00        	movs	r6, r2
    1f2d: 00 00        	movs	r0, r0
    1f2f: 14 0e        	lsrs	r4, r2, #24
    1f31: 00 00        	movs	r0, r0
    1f33: 29 69        	ldr	r1, [r5, #16]
    1f35: 00 01        	lsls	r0, r0, #4
    1f37: 52 4a        	ldr	r2, [pc, #328]          @ 0x2080 <.debug_info+0x2080>
    1f39: 11 00        	movs	r1, r2
    1f3b: 00 02        	lsls	r0, r0, #8
    1f3d: 91 4c        	ldr	r4, [pc, #580]          @ 0x2184 <.debug_info+0x2184>
    1f3f: 00 24        	movs	r4, #0
    1f41: 1e 0a        	lsrs	r6, r3, #8
    1f43: 00 20        	movs	r0, #0
    1f45: c8 13        	asrs	r0, r1, #15
    1f47: 00 00        	movs	r0, r0
    1f49: 2c 0e        	lsrs	r4, r5, #24
    1f4b: 00 00        	movs	r0, r0
    1f4d: 22 01        	lsls	r2, r4, #4
    1f4f: 51 01        	lsls	r1, r2, #5
    1f51: 31 22        	movs	r2, #49
    1f53: 01 50        	str	r1, [r0, r0]
    1f55: 01 31        	adds	r1, #1
    1f57: 00 24        	movs	r4, #0
    1f59: 26 0a        	lsrs	r6, r4, #8
    1f5b: 00 20        	movs	r0, #0
    1f5d: c8 13        	asrs	r0, r1, #15
    1f5f: 00 00        	movs	r0, r0
    1f61: 44 0e        	lsrs	r4, r0, #25
    1f63: 00 00        	movs	r0, r0
    1f65: 22 01        	lsls	r2, r4, #4
    1f67: 51 01        	lsls	r1, r2, #5
    1f69: 31 22        	movs	r2, #49
    1f6b: 01 50        	str	r1, [r0, r0]
    1f6d: 01 32        	adds	r2, #1
    1f6f: 00 24        	movs	r4, #0
    1f71: 2e 0a        	lsrs	r6, r5, #8
    1f73: 00 20        	movs	r0, #0
    1f75: c8 13        	asrs	r0, r1, #15
    1f77: 00 00        	movs	r0, r0
    1f79: 5c 0e        	lsrs	r4, r3, #25
    1f7b: 00 00        	movs	r0, r0
    1f7d: 22 01        	lsls	r2, r4, #4
    1f7f: 51 01        	lsls	r1, r2, #5
    1f81: 31 22        	movs	r2, #49
    1f83: 01 50        	str	r1, [r0, r0]
    1f85: 01 34        	adds	r4, #1
    1f87: 00 24        	movs	r4, #0
    1f89: 36 0a        	lsrs	r6, r6, #8
    1f8b: 00 20        	movs	r0, #0
    1f8d: c8 13        	asrs	r0, r1, #15
    1f8f: 00 00        	movs	r0, r0
    1f91: 74 0e        	lsrs	r4, r6, #25
    1f93: 00 00        	movs	r0, r0
    1f95: 22 01        	lsls	r2, r4, #4
    1f97: 51 01        	lsls	r1, r2, #5
    1f99: 31 22        	movs	r2, #49
    1f9b: 01 50        	str	r1, [r0, r0]
    1f9d: 01 38        	subs	r0, #1
    1f9f: 00 24        	movs	r4, #0
    1fa1: 40 0a        	lsrs	r0, r0, #9
    1fa3: 00 20        	movs	r0, #0
    1fa5: c8 13        	asrs	r0, r1, #15
    1fa7: 00 00        	movs	r0, r0
    1fa9: 8e 0e        	lsrs	r6, r1, #26
    1fab: 00 00        	movs	r0, r0
    1fad: 22 01        	lsls	r2, r4, #4
    1faf: 51 01        	lsls	r1, r2, #5
    1fb1: 31 22        	movs	r2, #49
    1fb3: 01 50        	str	r1, [r0, r0]
    1fb5: 03 40        	ands	r3, r0
    1fb7: 41 24        	movs	r4, #65
    1fb9: 00 24        	movs	r4, #0
    1fbb: 4a 0a        	lsrs	r2, r1, #9
    1fbd: 00 20        	movs	r0, #0
    1fbf: df 13        	asrs	r7, r3, #15
    1fc1: 00 00        	movs	r0, r0
    1fc3: a8 0e        	lsrs	r0, r5, #26
    1fc5: 00 00        	movs	r0, r0
    1fc7: 22 01        	lsls	r2, r4, #4
    1fc9: 51 01        	lsls	r1, r2, #5
    1fcb: 31 22        	movs	r2, #49
    1fcd: 01 50        	str	r1, [r0, r0]
    1fcf: 03 40        	ands	r3, r0
    1fd1: 41 24        	movs	r4, #65
    1fd3: 00 24        	movs	r4, #0
    1fd5: 54 0a        	lsrs	r4, r2, #9
    1fd7: 00 20        	movs	r0, #0
    1fd9: df 13        	asrs	r7, r3, #15
    1fdb: 00 00        	movs	r0, r0
    1fdd: c2 0e        	lsrs	r2, r0, #27
    1fdf: 00 00        	movs	r0, r0
    1fe1: 22 01        	lsls	r2, r4, #4
    1fe3: 51 01        	lsls	r1, r2, #5
    1fe5: 31 22        	movs	r2, #49
    1fe7: 01 50        	str	r1, [r0, r0]
    1fe9: 03 0a        	lsrs	r3, r0, #8
    1feb: 00 80        	strh	r0, [r0]
    1fed: 00 24        	movs	r4, #0
    1fef: 80 0a        	lsrs	r0, r0, #10
    1ff1: 00 20        	movs	r0, #0
    1ff3: f6 13        	asrs	r6, r6, #15
    1ff5: 00 00        	movs	r0, r0
    1ff7: e2 0e        	lsrs	r2, r4, #27
    1ff9: 00 00        	movs	r0, r0
    1ffb: 22 01        	lsls	r2, r4, #4
    1ffd: 51 08        	lsrs	r1, r2, #1
    1fff: 91 00        	lsls	r1, r2, #2
    2001: 79 00        	lsls	r1, r7, #1
    2003: 22 08        	lsrs	r2, r4, #32
    2005: 40 1c        	adds	r0, r0, #1
    2007: 22 01        	lsls	r2, r4, #4
    2009: 50 02        	lsls	r0, r2, #9
    200b: 7a 00        	lsls	r2, r7, #1
    200d: 00 24        	movs	r4, #0
    200f: a4 0a        	lsrs	r4, r4, #10
    2011: 00 20        	movs	r0, #0
    2013: f6 13        	asrs	r6, r6, #15
    2015: 00 00        	movs	r0, r0
    2017: 02 0f        	lsrs	r2, r0, #28
    2019: 00 00        	movs	r0, r0
    201b: 22 01        	lsls	r2, r4, #4
    201d: 51 08        	lsrs	r1, r2, #1
    201f: 91 00        	lsls	r1, r2, #2
    2021: 79 00        	lsls	r1, r7, #1
    2023: 22 08        	lsrs	r2, r4, #32
    2025: 40 1c        	adds	r0, r0, #1
    2027: 22 01        	lsls	r2, r4, #4
    2029: 50 02        	lsls	r0, r2, #9
    202b: 78 00        	lsls	r0, r7, #1
    202d: 00 24        	movs	r4, #0
    202f: ae 0a        	lsrs	r6, r5, #10
    2031: 00 20        	movs	r0, #0
    2033: 19 14        	asrs	r1, r3, #16
    2035: 00 00        	movs	r0, r0
    2037: 20 0f        	lsrs	r0, r4, #28
    2039: 00 00        	movs	r0, r0
    203b: 22 01        	lsls	r2, r4, #4
    203d: 52 01        	lsls	r2, r2, #5
    203f: 34 22        	movs	r2, #52
    2041: 01 51        	str	r1, [r0, r4]
    2043: 01 36        	adds	r6, #1
    2045: 22 01        	lsls	r2, r4, #4
    2047: 50 02        	lsls	r0, r2, #9
    2049: 78 00        	lsls	r0, r7, #1
    204b: 00 24        	movs	r4, #0
    204d: b8 0a        	lsrs	r0, r7, #10
    204f: 00 20        	movs	r0, #0
    2051: 19 14        	asrs	r1, r3, #16
    2053: 00 00        	movs	r0, r0
    2055: 3e 0f        	lsrs	r6, r7, #28
    2057: 00 00        	movs	r0, r0
    2059: 22 01        	lsls	r2, r4, #4
    205b: 52 01        	lsls	r2, r2, #5
    205d: 34 22        	movs	r2, #52
    205f: 01 51        	str	r1, [r0, r4]
    2061: 01 39        	subs	r1, #1
    2063: 22 01        	lsls	r2, r4, #4
    2065: 50 02        	lsls	r0, r2, #9
    2067: 78 00        	lsls	r0, r7, #1
    2069: 00 24        	movs	r4, #0
    206b: dc 0a        	lsrs	r4, r3, #11
    206d: 00 20        	movs	r0, #0
    206f: f6 13        	asrs	r6, r6, #15
    2071: 00 00        	movs	r0, r0
    2073: 5e 0f        	lsrs	r6, r3, #29
    2075: 00 00        	movs	r0, r0
    2077: 22 01        	lsls	r2, r4, #4
    2079: 51 08        	lsrs	r1, r2, #1
    207b: 91 00        	lsls	r1, r2, #2
    207d: 79 00        	lsls	r1, r7, #1
    207f: 22 08        	lsrs	r2, r4, #32
    2081: 40 1c        	adds	r0, r0, #1
    2083: 22 01        	lsls	r2, r4, #4
    2085: 50 02        	lsls	r0, r2, #9
    2087: 78 00        	lsls	r0, r7, #1
    2089: 00 24        	movs	r4, #0
    208b: e6 0a        	lsrs	r6, r4, #11
    208d: 00 20        	movs	r0, #0
    208f: 19 14        	asrs	r1, r3, #16
    2091: 00 00        	movs	r0, r0
    2093: 7c 0f        	lsrs	r4, r7, #29
    2095: 00 00        	movs	r0, r0
    2097: 22 01        	lsls	r2, r4, #4
    2099: 52 01        	lsls	r2, r2, #5
    209b: 36 22        	movs	r2, #54
    209d: 01 51        	str	r1, [r0, r4]
    209f: 01 37        	adds	r7, #1
    20a1: 22 01        	lsls	r2, r4, #4
    20a3: 50 02        	lsls	r0, r2, #9
    20a5: 78 00        	lsls	r0, r7, #1
    20a7: 00 24        	movs	r4, #0
    20a9: f0 0a        	lsrs	r0, r6, #11
    20ab: 00 20        	movs	r0, #0
    20ad: 19 14        	asrs	r1, r3, #16
    20af: 00 00        	movs	r0, r0
    20b1: 9a 0f        	lsrs	r2, r3, #30
    20b3: 00 00        	movs	r0, r0
    20b5: 22 01        	lsls	r2, r4, #4
    20b7: 52 01        	lsls	r2, r2, #5
    20b9: 36 22        	movs	r2, #54
    20bb: 01 51        	str	r1, [r0, r4]
    20bd: 01 3a        	subs	r2, #1
    20bf: 22 01        	lsls	r2, r4, #4
    20c1: 50 02        	lsls	r0, r2, #9
    20c3: 78 00        	lsls	r0, r7, #1
    20c5: 00 24        	movs	r4, #0
    20c7: fa 0a        	lsrs	r2, r7, #11
    20c9: 00 20        	movs	r0, #0
    20cb: 19 14        	asrs	r1, r3, #16
    20cd: 00 00        	movs	r0, r0
    20cf: b8 0f        	lsrs	r0, r7, #30
    20d1: 00 00        	movs	r0, r0
    20d3: 22 01        	lsls	r2, r4, #4
    20d5: 52 01        	lsls	r2, r2, #5
    20d7: 36 22        	movs	r2, #54
    20d9: 01 51        	str	r1, [r0, r4]
    20db: 01 3c        	subs	r4, #1
    20dd: 22 01        	lsls	r2, r4, #4
    20df: 50 02        	lsls	r0, r2, #9
    20e1: 78 00        	lsls	r0, r7, #1
    20e3: 00 24        	movs	r4, #0
    20e5: 1a 0b        	lsrs	r2, r3, #12
    20e7: 00 20        	movs	r0, #0
    20e9: f6 13        	asrs	r6, r6, #15
    20eb: 00 00        	movs	r0, r0
    20ed: d8 0f        	lsrs	r0, r3, #31
    20ef: 00 00        	movs	r0, r0
    20f1: 22 01        	lsls	r2, r4, #4
    20f3: 51 08        	lsrs	r1, r2, #1
    20f5: 91 00        	lsls	r1, r2, #2
    20f7: 79 00        	lsls	r1, r7, #1
    20f9: 22 08        	lsrs	r2, r4, #32
    20fb: 40 1c        	adds	r0, r0, #1
    20fd: 22 01        	lsls	r2, r4, #4
    20ff: 50 02        	lsls	r0, r2, #9
    2101: 76 00        	lsls	r6, r6, #1
    2103: 00 24        	movs	r4, #0
    2105: 24 0b        	lsrs	r4, r4, #12
    2107: 00 20        	movs	r0, #0
    2109: 19 14        	asrs	r1, r3, #16
    210b: 00 00        	movs	r0, r0
    210d: f6 0f        	lsrs	r6, r6, #31
    210f: 00 00        	movs	r0, r0
    2111: 22 01        	lsls	r2, r4, #4
    2113: 52 01        	lsls	r2, r2, #5
    2115: 36 22        	movs	r2, #54
    2117: 01 51        	str	r1, [r0, r4]
    2119: 01 34        	adds	r4, #1
    211b: 22 01        	lsls	r2, r4, #4
    211d: 50 02        	lsls	r0, r2, #9
    211f: 76 00        	lsls	r6, r6, #1
    2121: 00 24        	movs	r4, #0
    2123: 4e 0b        	lsrs	r6, r1, #13
    2125: 00 20        	movs	r0, #0
    2127: 35 14        	asrs	r5, r6, #16
    2129: 00 00        	movs	r0, r0
    212b: 10 10        	asrs	r0, r2, #32
    212d: 00 00        	movs	r0, r0
    212f: 22 01        	lsls	r2, r4, #4
    2131: 51 01        	lsls	r1, r2, #5
    2133: 31 22        	movs	r2, #49
    2135: 01 50        	str	r1, [r0, r0]
    2137: 03 40        	ands	r3, r0
    2139: 41 24        	movs	r4, #65
    213b: 00 24        	movs	r4, #0
    213d: 58 0b        	lsrs	r0, r3, #13
    213f: 00 20        	movs	r0, #0
    2141: 35 14        	asrs	r5, r6, #16
    2143: 00 00        	movs	r0, r0
    2145: 2b 10        	asrs	r3, r5, #32
    2147: 00 00        	movs	r0, r0
    2149: 22 01        	lsls	r2, r4, #4
    214b: 51 02        	lsls	r1, r2, #9
    214d: 74 00        	lsls	r4, r6, #1
    214f: 22 01        	lsls	r2, r4, #4
    2151: 50 03        	lsls	r0, r2, #13
    2153: 40 41        	adcs	r0, r0
    2155: 24 00        	movs	r4, r4
    2157: 24 7a        	ldrb	r4, [r4, #8]
    2159: 0b 00        	movs	r3, r1
    215b: 20 70        	strb	r0, [r4]
    215d: 0c 00        	movs	r4, r1
    215f: 00 43        	orrs	r0, r0
    2161: 10 00        	movs	r0, r2
    2163: 00 22        	movs	r2, #0
    2165: 01 51        	str	r1, [r0, r4]
    2167: 01 31        	adds	r1, #1
    2169: 22 01        	lsls	r2, r4, #4
    216b: 50 01        	lsls	r0, r2, #5
    216d: 32 00        	movs	r2, r6
    216f: 24 82        	strh	r4, [r4, #16]
    2171: 0b 00        	movs	r3, r1
    2173: 20 70        	strb	r0, [r4]
    2175: 0c 00        	movs	r4, r1
    2177: 00 5c        	ldrb	r0, [r0, r0]
    2179: 10 00        	movs	r0, r2
    217b: 00 22        	movs	r2, #0
    217d: 01 51        	str	r1, [r0, r4]
    217f: 02 09        	lsrs	r2, r0, #4
    2181: af 22        	movs	r2, #175
    2183: 01 50        	str	r1, [r0, r0]
    2185: 01 34        	adds	r4, #1
    2187: 00 24        	movs	r4, #0
    2189: 8a 0b        	lsrs	r2, r1, #14
    218b: 00 20        	movs	r0, #0
    218d: 70 0c        	lsrs	r0, r6, #17
    218f: 00 00        	movs	r0, r0
    2191: 75 10        	asrs	r5, r6, #1
    2193: 00 00        	movs	r0, r0
    2195: 22 01        	lsls	r2, r4, #4
    2197: 51 02        	lsls	r1, r2, #9
    2199: 09 81        	strh	r1, [r1, #8]
    219b: 22 01        	lsls	r2, r4, #4
    219d: 50 01        	lsls	r0, r2, #5
    219f: 35 00        	movs	r5, r6
    21a1: 24 92        	str	r2, [sp, #144]
    21a3: 0b 00        	movs	r3, r1
    21a5: 20 70        	strb	r0, [r4]
    21a7: 0c 00        	movs	r4, r1
    21a9: 00 8d        	ldrh	r0, [r0, #40]
    21ab: 10 00        	movs	r0, r2
    21ad: 00 22        	movs	r2, #0
    21af: 01 51        	str	r1, [r0, r4]
    21b1: 01 34        	adds	r4, #1
    21b3: 22 01        	lsls	r2, r4, #4
    21b5: 50 01        	lsls	r0, r2, #5
    21b7: 36 00        	movs	r6, r6
    21b9: 24 98        	ldr	r0, [sp, #144]
    21bb: 0b 00        	movs	r3, r1
    21bd: 20 1c        	adds	r0, r4, #0
    21bf: 0d 00        	movs	r5, r1
    21c1: 00 a1        	adr	r1, #0 <.debug_info+0x21c5>
    21c3: 10 00        	movs	r0, r2
    21c5: 00 22        	movs	r2, #0
    21c7: 01 50        	str	r1, [r0, r0]
    21c9: 02 08        	lsrs	r2, r0, #32
    21cb: ff 00        	lsls	r7, r7, #3
    21cd: 24 a0        	adr	r0, #144 <.debug_info+0x21f5>
    21cf: 0b 00        	movs	r3, r1
    21d1: 20 70        	strb	r0, [r4]
    21d3: 0c 00        	movs	r4, r1
    21d5: 00 ba        	rev	r0, r0
    21d7: 10 00        	movs	r0, r2
    21d9: 00 22        	movs	r2, #0
    21db: 01 51        	str	r1, [r0, r4]
    21dd: 02 09        	lsrs	r2, r0, #4
    21df: 9e 22        	movs	r2, #158
    21e1: 01 50        	str	r1, [r0, r0]
    21e3: 01 32        	adds	r2, #1
    21e5: 00 24        	movs	r4, #0
    21e7: a8 0b        	lsrs	r0, r5, #14
    21e9: 00 20        	movs	r0, #0
    21eb: 70 0c        	lsrs	r0, r6, #17
    21ed: 00 00        	movs	r0, r0
    21ef: d3 10        	asrs	r3, r2, #3
    21f1: 00 00        	movs	r0, r0
    21f3: 22 01        	lsls	r2, r4, #4
    21f5: 51 02        	lsls	r1, r2, #9
    21f7: 74 00        	lsls	r4, r6, #1
    21f9: 22 01        	lsls	r2, r4, #4
    21fb: 50 01        	lsls	r0, r2, #5
    21fd: 3a 00        	movs	r2, r7
    21ff: 24 b0        	add	sp, #144
    2201: 0b 00        	movs	r3, r1
    2203: 20 70        	strb	r0, [r4]
    2205: 0c 00        	movs	r4, r1
    2207: 00 eb 10 00  	add.w	r0, r0, r0, lsr #32
    220b: 00 22        	movs	r2, #0
    220d: 01 51        	str	r1, [r0, r4]
    220f: 01 34        	adds	r4, #1
    2211: 22 01        	lsls	r2, r4, #4
    2213: 50 01        	lsls	r0, r2, #5
    2215: 3e 00        	movs	r6, r7
    2217: 24           	<unknown>
    2218: b8 0b        	lsrs	r0, r7, #14
    221a: 00 20        	movs	r0, #0
    221c: 70 0c        	lsrs	r0, r6, #17
    221e: 00 00        	movs	r0, r0
    2220: 05 11        	asrs	r5, r0, #4
    2222: 00 00        	movs	r0, r0
    2224: 22 01        	lsls	r2, r4, #4
    2226: 51 02        	lsls	r1, r2, #9
    2228: 74 00        	lsls	r4, r6, #1
    222a: 22 01        	lsls	r2, r4, #4
    222c: 50 02        	lsls	r0, r2, #9
    222e: 08 27        	movs	r7, #8
    2230: 00 24        	movs	r4, #0
    2232: c0 0b        	lsrs	r0, r0, #15
    2234: 00 20        	movs	r0, #0
    2236: 70 0c        	lsrs	r0, r6, #17
    2238: 00 00        	movs	r0, r0
    223a: 1d 11        	asrs	r5, r3, #4
    223c: 00 00        	movs	r0, r0
    223e: 22 01        	lsls	r2, r4, #4
    2240: 51 01        	lsls	r1, r2, #5
    2242: 3f 22        	movs	r2, #63
    2244: 01 50        	str	r1, [r0, r0]
    2246: 01 4f        	ldr	r7, [pc, #4]            @ 0x224c <.debug_info+0x224c>
    2248: 00 24        	movs	r4, #0
    224a: c8 0b        	lsrs	r0, r1, #15
    224c: 00 20        	movs	r0, #0
    224e: 70 0c        	lsrs	r0, r6, #17
    2250: 00 00        	movs	r0, r0
    2252: 35 11        	asrs	r5, r6, #4
    2254: 00 00        	movs	r0, r0
    2256: 22 01        	lsls	r2, r4, #4
    2258: 51 01        	lsls	r1, r2, #5
    225a: 3a 22        	movs	r2, #58
    225c: 01 50        	str	r1, [r0, r0]
    225e: 01 4a        	ldr	r2, [pc, #4]            @ 0x2264 <.debug_info+0x2264>
    2260: 00 21        	movs	r1, #0
    2262: d0 0b        	lsrs	r0, r2, #15
    2264: 00 20        	movs	r0, #0
    2266: 70 0c        	lsrs	r0, r6, #17
    2268: 00 00        	movs	r0, r0
    226a: 22 01        	lsls	r2, r4, #4
    226c: 51 01        	lsls	r1, r2, #5
    226e: 3a 22        	movs	r2, #58
    2270: 01 50        	str	r1, [r0, r0]
    2272: 01 4b        	ldr	r3, [pc, #4]            @ 0x2278 <.debug_info+0x2278>
    2274: 00 00        	movs	r0, r0
    2276: 10 94        	str	r4, [sp, #64]
    2278: 00 00        	movs	r0, r0
    227a: 00 23        	movs	r3, #0
    227c: 9e 0f        	lsrs	r6, r3, #30
    227e: 00 00        	movs	r0, r0
    2280: 01 a5        	adr	r5, #4 <.debug_info+0x2285>
    2282: 00 00        	movs	r0, r0
    2284: 00 00        	movs	r0, r0
    2286: 1c 00        	movs	r4, r3
    2288: 00 00        	movs	r0, r0
    228a: 01 9c        	ldr	r4, [sp, #4]
    228c: 72 11        	asrs	r2, r6, #5
    228e: 00 00        	movs	r0, r0
    2290: 2a c3        	stm	r3!, {r1, r3, r5}
    2292: 0e 00        	movs	r6, r1
    2294: 00 01        	lsls	r0, r0, #4
    2296: a5 ad        	add	r5, sp, #660
    2298: 00 00        	movs	r0, r0
    229a: 00 01        	lsls	r0, r0, #4
    229c: 50 00        	lsls	r0, r2, #1
    229e: 23 97        	str	r7, [sp, #140]
    22a0: 10 00        	movs	r0, r2
    22a2: 00 01        	lsls	r0, r0, #4
    22a4: ab 00        	lsls	r3, r5, #2
    22a6: 00 00        	movs	r0, r0
    22a8: 00 0c        	lsrs	r0, r0, #16
    22aa: 00 00        	movs	r0, r0
    22ac: 00 01        	lsls	r0, r0, #4
    22ae: 9c 95        	str	r5, [sp, #624]
    22b0: 11 00        	movs	r1, r2
    22b2: 00 2a        	cmp	r2, #0
    22b4: c3 0e        	lsrs	r3, r0, #27
    22b6: 00 00        	movs	r0, r0
    22b8: 01 ab        	add	r3, sp, #4
    22ba: ad 00        	lsls	r5, r5, #2
    22bc: 00 00        	movs	r0, r0
    22be: 01 50        	str	r1, [r0, r0]
    22c0: 00 23        	movs	r3, #0
    22c2: 9d 0d        	lsrs	r5, r3, #22
    22c4: 00 00        	movs	r0, r0
    22c6: 01 af        	add	r7, sp, #4
    22c8: 00 00        	movs	r0, r0
    22ca: 00 00        	movs	r0, r0
    22cc: 44 00        	lsls	r4, r0, #1
    22ce: 00 00        	movs	r0, r0
    22d0: 01 9c        	ldr	r4, [sp, #4]
    22d2: 1b 12        	asrs	r3, r3, #8
    22d4: 00 00        	movs	r0, r0
    22d6: 1d 27        	movs	r7, #29
    22d8: 0e 00        	movs	r6, r1
    22da: 00 01        	lsls	r0, r0, #4
    22dc: af 1b        	subs	r7, r5, r6
    22de: 12 00        	movs	r2, r2
    22e0: 00 a4        	adr	r4, #0 <.debug_info+0x22e4>
    22e2: 02 00        	movs	r2, r0
    22e4: 00 1d        	adds	r0, r0, #4
    22e6: be 02        	lsls	r6, r7, #10
    22e8: 00 00        	movs	r0, r0
    22ea: 01 af        	add	r7, sp, #4
    22ec: f4 00        	lsls	r4, r6, #3
    22ee: 00 00        	movs	r0, r0
    22f0: d0 02        	lsls	r0, r2, #11
    22f2: 00 00        	movs	r0, r0
    22f4: 2b 16        	asrs	r3, r5, #24
    22f6: 0c 00        	movs	r4, r1
    22f8: 00 00        	movs	r0, r0
    22fa: 00 00        	movs	r0, r0
    22fc: 00 08        	lsrs	r0, r0, #32
    22fe: 00 00        	movs	r0, r0
    2300: 00 01        	lsls	r0, r0, #4
    2302: b2 e2        	b	0x286a <.debug_info+0x286a> @ imm = #1380
    2304: 11 00        	movs	r1, r2
    2306: 00 2c        	cmp	r4, #0
    2308: 23 0c        	lsrs	r3, r4, #16
    230a: 00 00        	movs	r0, r0
    230c: 2f 00        	movs	r7, r5
    230e: 2b 30        	adds	r0, #43
    2310: 0c 00        	movs	r4, r1
    2312: 00 00        	movs	r0, r0
    2314: 00 00        	movs	r0, r0
    2316: 00 06        	lsls	r0, r0, #24
    2318: 00 00        	movs	r0, r0
    231a: 00 01        	lsls	r0, r0, #4
    231c: b3 02        	lsls	r3, r6, #10
    231e: 12 00        	movs	r2, r2
    2320: 00 2c        	cmp	r4, #0
    2322: 49 0c        	lsrs	r1, r1, #17
    2324: 00 00        	movs	r0, r0
    2326: 04 2c        	cmp	r4, #4
    2328: 3d 0c        	lsrs	r5, r7, #16
    232a: 00 00        	movs	r0, r0
    232c: 2f 00        	movs	r7, r5
    232e: 2d 00        	movs	r5, r5
    2330: 00 00        	movs	r0, r0
    2332: 00 b5        	push	{lr}
    2334: 0c 00        	movs	r4, r1
    2336: 00 2e        	cmp	r6, #0
    2338: 00 00        	movs	r0, r0
    233a: 00 00        	movs	r0, r0
    233c: 02 74        	strb	r2, [r0, #16]
    233e: 00 22        	movs	r2, #0
    2340: 01 50        	str	r1, [r0, r0]
    2342: 02 75        	strb	r2, [r0, #20]
    2344: 00 00        	movs	r0, r0
    2346: 00 2f        	cmp	r7, #0
    2348: 04 d9        	bls	0x2354 <.debug_info+0x2354> @ imm = #8
    234a: 00 00        	movs	r0, r0
    234c: 00 20        	movs	r0, #0
    234e: 3c 10        	asrs	r4, r7, #32
    2350: 00 00        	movs	r0, r0
    2352: 01 bf        	itttt	eq
    2354: 00 00        	movs	r0, r0
    2356: 00 00        	movs	r0, r0
    2358: 34 00        	movs	r4, r6
    235a: 00 00        	movs	r0, r0
    235c: 01 9c        	ldr	r4, [sp, #4]
    235e: 5a 12        	asrs	r2, r3, #9
    2360: 00 00        	movs	r0, r0
    2362: 2b 56        	ldrsb	r3, [r5, r0]
    2364: 0c 00        	movs	r4, r1
    2366: 00 00        	movs	r0, r0
    2368: 00 00        	movs	r0, r0
    236a: 00 0a        	lsrs	r0, r0, #8
    236c: 00 00        	movs	r0, r0
    236e: 00 01        	lsls	r0, r0, #4
    2370: c2 50        	str	r2, [r0, r3]
    2372: 12 00        	movs	r2, r2
    2374: 00 2c        	cmp	r4, #0
    2376: 63 0c        	lsrs	r3, r4, #17
    2378: 00 00        	movs	r0, r0
    237a: 2f 00        	movs	r7, r5
    237c: 2d 00        	movs	r5, r5
    237e: 00 00        	movs	r0, r0
    2380: 00 b5        	push	{lr}
    2382: 0c 00        	movs	r4, r1
    2384: 00 00        	movs	r0, r0
    2386: 30 59        	ldr	r0, [r6, r4]
    2388: 0e 00        	movs	r6, r1
    238a: 00 01        	lsls	r0, r0, #4
    238c: cb d5        	bpl	0x2326 <.debug_info+0x2326> @ imm = #-106
    238e: 12 00        	movs	r2, r2
    2390: 00 00        	movs	r0, r0
    2392: 00 00        	movs	r0, r0
    2394: 00 3c        	subs	r4, #0
    2396: 00 00        	movs	r0, r0
    2398: 00 01        	lsls	r0, r0, #4
    239a: 9c d5        	bpl	0x22d6 <.debug_info+0x22d6> @ imm = #-200
    239c: 12 00        	movs	r2, r2
    239e: 00 1d        	adds	r0, r0, #4
    23a0: 49 10        	asrs	r1, r1, #1
    23a2: 00 00        	movs	r0, r0
    23a4: 01 cb        	ldm	r3!, {r0}
    23a6: f4 00        	lsls	r4, r6, #3
    23a8: 00 00        	movs	r0, r0
    23aa: fc 02        	lsls	r4, r7, #11
    23ac: 00 00        	movs	r0, r0
    23ae: 1d 46        	mov	r5, r3
    23b0: 10 00        	movs	r0, r2
    23b2: 00 01        	lsls	r0, r0, #4
    23b4: cb 94        	str	r4, [sp, #812]
    23b6: 00 00        	movs	r0, r0
    23b8: 00 36        	adds	r6, #0
    23ba: 03 00        	movs	r3, r0
    23bc: 00 2b        	cmp	r3, #0
    23be: 56 0c        	lsrs	r6, r2, #17
    23c0: 00 00        	movs	r0, r0
    23c2: 00 00        	movs	r0, r0
    23c4: 00 00        	movs	r0, r0
    23c6: 0a 00        	movs	r2, r1
    23c8: 00 00        	movs	r0, r0
    23ca: 01 cf        	ldm	r7!, {r0}
    23cc: ae 12        	asrs	r6, r5, #10
    23ce: 00 00        	movs	r0, r0
    23d0: 31 63        	str	r1, [r6, #48]
    23d2: 0c 00        	movs	r4, r1
    23d4: 00 62        	str	r0, [r0, #32]
    23d6: 03 00        	movs	r3, r0
    23d8: 00 00        	movs	r0, r0
    23da: 2b 16        	asrs	r3, r5, #24
    23dc: 0c 00        	movs	r4, r1
    23de: 00 00        	movs	r0, r0
    23e0: 00 00        	movs	r0, r0
    23e2: 00 08        	lsrs	r0, r0, #32
    23e4: 00 00        	movs	r0, r0
    23e6: 00 01        	lsls	r0, r0, #4
    23e8: d7 cb        	ldm	r3!, {r0, r1, r2, r4, r6, r7}
    23ea: 12 00        	movs	r2, r2
    23ec: 00 31        	adds	r1, #0
    23ee: 23 0c        	lsrs	r3, r4, #16
    23f0: 00 00        	movs	r0, r0
    23f2: 77 03        	lsls	r7, r6, #13
    23f4: 00 00        	movs	r0, r0
    23f6: 00 2d        	cmp	r5, #0
    23f8: 00 00        	movs	r0, r0
    23fa: 00 00        	movs	r0, r0
    23fc: a4 0c        	lsrs	r4, r4, #18
    23fe: 00 00        	movs	r0, r0
    2400: 00 02        	lsls	r0, r0, #8
    2402: 01 02        	lsls	r1, r0, #8
    2404: a6 0e        	lsrs	r6, r4, #26
    2406: 00 00        	movs	r0, r0
    2408: 23 6e        	ldr	r3, [r4, #96]
    240a: 02 00        	movs	r2, r0
    240c: 00 01        	lsls	r0, r0, #4
    240e: c6 00        	lsls	r6, r0, #3
    2410: 00 00        	movs	r0, r0
    2412: 00 18        	adds	r0, r0, r0
    2414: 00 00        	movs	r0, r0
    2416: 00 01        	lsls	r0, r0, #4
    2418: 9c 26        	movs	r6, #156
    241a: 13 00        	movs	r3, r2
    241c: 00 1d        	adds	r0, r0, #4
    241e: 49 10        	asrs	r1, r1, #1
    2420: 00 00        	movs	r0, r0
    2422: 01 c6        	stm	r6!, {r0}
    2424: f4 00        	lsls	r4, r6, #3
    2426: 00 00        	movs	r0, r0
    2428: 8c 03        	lsls	r4, r1, #14
    242a: 00 00        	movs	r0, r0
    242c: 1d 46        	mov	r5, r3
    242e: 10 00        	movs	r0, r2
    2430: 00 01        	lsls	r0, r0, #4
    2432: c6 94        	str	r4, [sp, #792]
    2434: 00 00        	movs	r0, r0
    2436: 00 aa        	add	r2, sp, #0
    2438: 03 00        	movs	r3, r0
    243a: 00 21        	movs	r1, #0
    243c: 00 00        	movs	r0, r0
    243e: 00 00        	movs	r0, r0
    2440: 5a 12        	asrs	r2, r3, #9
    2442: 00 00        	movs	r0, r0
    2444: 22 01        	lsls	r2, r4, #4
    2446: 51 02        	lsls	r1, r2, #9
    2448: 74 00        	lsls	r4, r6, #1
    244a: 22 01        	lsls	r2, r4, #4
    244c: 50 02        	lsls	r0, r2, #9
    244e: 75 00        	lsls	r5, r6, #1
    2450: 00 00        	movs	r0, r0
    2452: 32 6f        	ldr	r2, [r6, #112]
    2454: 10 00        	movs	r0, r2
    2456: 00 01        	lsls	r0, r0, #4
    2458: 15 01        	lsls	r5, r2, #4
    245a: 00 00        	movs	r0, r0
    245c: 00 00        	movs	r0, r0
    245e: 28 00        	movs	r0, r5
    2460: 00 00        	movs	r0, r0
    2462: 01 9c        	ldr	r4, [sp, #4]
    2464: 46 13        	asrs	r6, r0, #13
    2466: 00 00        	movs	r0, r0
    2468: 2d 00        	movs	r5, r5
    246a: 00 00        	movs	r0, r0
    246c: 00 a4        	adr	r4, #0 <.debug_info+0x2470>
    246e: 0c 00        	movs	r4, r1
    2470: 00 00        	movs	r0, r0
    2472: 25 e5        	b	0x1ec0 <.debug_info+0x1ec0> @ imm = #-1462
    2474: 07 00        	movs	r7, r0
    2476: 00 01        	lsls	r0, r0, #4
    2478: 0b 1b        	subs	r3, r1, r4
    247a: 12 00        	movs	r2, r2
    247c: 00 05        	lsls	r0, r0, #20
    247e: 03 7c        	ldrb	r3, [r0, #16]
    2480: 13 00        	movs	r3, r2
    2482: 20 25        	movs	r5, #32
    2484: f7 0e        	lsrs	r7, r6, #27
    2486: 00 00        	movs	r0, r0
    2488: 01 0c        	lsrs	r1, r0, #16
    248a: f4 00        	lsls	r4, r6, #3
    248c: 00 00        	movs	r0, r0
    248e: 05 03        	lsls	r5, r0, #12
    2490: 80 13        	asrs	r0, r0, #14
    2492: 00 20        	movs	r0, #0
    2494: 25 10        	asrs	r5, r4, #32
    2496: 10 00        	movs	r0, r2
    2498: 00 01        	lsls	r0, r0, #4
    249a: 0d 79        	ldrb	r5, [r1, #4]
    249c: 13 00        	movs	r3, r2
    249e: 00 05        	lsls	r0, r0, #20
    24a0: 03 70        	strb	r3, [r0]
    24a2: 13 00        	movs	r3, r2
    24a4: 20 10        	asrs	r0, r4, #32
    24a6: 7e 13        	asrs	r6, r7, #13
    24a8: 00 00        	movs	r0, r0
    24aa: 2f 04        	lsls	r7, r5, #16
    24ac: ad 00        	lsls	r5, r5, #2
    24ae: 00 00        	movs	r0, r0
    24b0: 25 cf        	ldm	r7!, {r0, r2, r5}
    24b2: 0e 00        	movs	r6, r1
    24b4: 00 01        	lsls	r0, r0, #4
    24b6: 0e 4a        	ldr	r2, [pc, #56]           @ 0x24f0 <.debug_info+0x24f0>
    24b8: 11 00        	movs	r1, r2
    24ba: 00 05        	lsls	r0, r0, #20
    24bc: 03 6c        	ldr	r3, [r0, #64]
    24be: 13 00        	movs	r3, r2
    24c0: 20 25        	movs	r5, #32
    24c2: 80 0f        	lsrs	r0, r0, #30
    24c4: 00 00        	movs	r0, r0
    24c6: 01 0f        	lsrs	r1, r0, #28
    24c8: 4a 11        	asrs	r2, r1, #5
    24ca: 00 00        	movs	r0, r0
    24cc: 05 03        	lsls	r5, r0, #12
    24ce: 74 13        	asrs	r4, r6, #13
    24d0: 00 20        	movs	r0, #0
    24d2: 25 9b        	ldr	r3, [sp, #148]
    24d4: 0e 00        	movs	r6, r1
    24d6: 00 01        	lsls	r0, r0, #4
    24d8: 10           	<unknown>
    24d9: b7 13        	asrs	r7, r6, #14
    24db: 00 00        	movs	r0, r0
    24dd: 05 03        	lsls	r5, r0, #12
    24df: 78 13        	asrs	r0, r7, #13
    24e1: 00 20        	movs	r0, #0
    24e3: 10 d5        	bpl	0x2507 <.debug_info+0x2507> @ imm = #32
    24e5: 12 00        	movs	r2, r2
    24e7: 00 33        	adds	r3, #0
    24e9: f5 0b        	lsrs	r5, r6, #15
    24eb: 00 00        	movs	r0, r0
    24ed: 02 1a        	subs	r2, r0, r0
    24ef: 05 13        	asrs	r5, r0, #12
    24f1: 06 00        	movs	r6, r0
    24f3: 00 34        	adds	r4, #0
    24f5: e7 0c        	lsrs	r7, r4, #19
    24f7: 00 00        	movs	r0, r0
    24f9: 08 dd        	ble	0x250d <.debug_info+0x250d> @ imm = #16
    24fb: 01 df        	svc	#1
    24fd: 13 00        	movs	r3, r2
    24ff: 00 06        	lsls	r0, r0, #24
    2501: ce 00        	lsls	r6, r1, #3
    2503: 00 00        	movs	r0, r0
    2505: 06 33        	adds	r3, #6
    2507: 06 00        	movs	r6, r0
    2509: 00 00        	movs	r0, r0
    250b: 34 d8        	bhi	0x2577 <.debug_info+0x2577> @ imm = #104
    250d: 02 00        	movs	r2, r0
    250f: 00 08        	lsrs	r0, r0, #32
    2511: e0 01        	lsls	r0, r4, #7
    2513: f6 13        	asrs	r6, r6, #15
    2515: 00 00        	movs	r0, r0
    2517: 06 ce        	ldm	r6!, {r1, r2}
    2519: 00 00        	movs	r0, r0
    251b: 00 06        	lsls	r0, r0, #24
    251d: 33 06        	lsls	r3, r6, #24
    251f: 00 00        	movs	r0, r0
    2521: 00 34        	adds	r4, #0
    2523: cf 04        	lsls	r7, r1, #19
    2525: 00 00        	movs	r0, r0
    2527: 07 7c        	ldrb	r7, [r0, #16]
    2529: 01 0d        	lsrs	r1, r0, #20
    252b: 14 00        	movs	r4, r2
    252d: 00 06        	lsls	r0, r0, #24
    252f: 0d 14        	asrs	r5, r1, #16
    2531: 00 00        	movs	r0, r0
    2533: 06 13        	asrs	r6, r0, #12
    2535: 14 00        	movs	r4, r2
    2537: 00 00        	movs	r0, r0
    2539: 2f 04        	lsls	r7, r5, #16
    253b: 7d 07        	lsls	r5, r7, #29
    253d: 00 00        	movs	r0, r0
    253f: 2f 04        	lsls	r7, r5, #16
    2541: 04 0c        	lsrs	r4, r0, #16
    2543: 00 00        	movs	r0, r0
    2545: 34 83        	strh	r4, [r6, #24]
    2547: 08 00        	movs	r0, r1
    2549: 00 07        	lsls	r0, r0, #28
    254b: 8c 01        	lsls	r4, r1, #6
    254d: 35 14        	asrs	r5, r6, #16
    254f: 00 00        	movs	r0, r0
    2551: 06 0d        	lsrs	r6, r0, #20
    2553: 14 00        	movs	r4, r2
    2555: 00 06        	lsls	r0, r0, #24
    2557: b8 00        	lsls	r0, r7, #2
    2559: 00 00        	movs	r0, r0
    255b: 06 a2        	adr	r2, #24 <.debug_info+0x2565>
    255d: 00 00        	movs	r0, r0
    255f: 00 00        	movs	r0, r0
    2561: 35 10        	asrs	r5, r6, #32
    2563: 0e 00        	movs	r6, r1
    2565: 00 08        	lsrs	r0, r0, #32
    2567: e6 01        	lsls	r6, r4, #7
    2569: 06 ce        	ldm	r6!, {r1, r2}
    256b: 00 00        	movs	r0, r0
    256d: 00 06        	lsls	r0, r0, #24
    256f: 33 06        	lsls	r3, r6, #24
    2571: 00 00        	movs	r0, r0
    2573: 00 00        	movs	r0, r0
    2575: 66 00        	lsls	r6, r4, #1
    2577: 00 00        	movs	r0, r0
    2579: 02 00        	movs	r2, r0
    257b: 15 06        	lsls	r5, r2, #24
    257d: 00 00        	movs	r0, r0
    257f: 04 01        	lsls	r4, r0, #4
    2581: b8 05        	lsls	r0, r7, #22
    2583: 00 00        	movs	r0, r0
    2585: 38 0c        	lsrs	r0, r7, #16
    2587: 00 20        	movs	r0, #0
    2589: 3e 0c        	lsrs	r6, r7, #16
    258b: 00 20        	movs	r0, #0
    258d: 4f 66        	str	r7, [r1, #100]
    258f: 66 6c        	ldr	r6, [r4, #68]
    2591: 6f 61        	str	r7, [r5, #20]
    2593: 64 69        	ldr	r4, [r4, #20]
    2595: 6e 67        	str	r6, [r5, #116]
    2597: 2f 69        	ldr	r7, [r5, #16]
    2599: 6e 69        	ldr	r6, [r5, #20]
    259b: 74 42        	rsbs	r4, r6, #0
    259d: 69 6e        	ldr	r1, [r5, #100]
    259f: 53 74        	strb	r3, [r2, #17]
    25a1: 61 72        	strb	r1, [r4, #9]
    25a3: 74 55        	strb	r4, [r6, r5]
    25a5: 70 2e        	cmp	r6, #112
    25a7: 73 00        	lsls	r3, r6, #1
    25a9: 2f 55        	strb	r7, [r5, r4]
    25ab: 73 65        	str	r3, [r6, #84]
    25ad: 72 73        	strb	r2, [r6, #13]
    25af: 2f 73        	strb	r7, [r5, #12]
    25b1: 61 6d        	ldr	r1, [r4, #84]
    25b3: 64 65        	str	r4, [r4, #84]
    25b5: 74 6f        	ldr	r4, [r6, #116]
    25b7: 72 2f        	cmp	r7, #114
    25b9: 53 54        	strb	r3, [r2, r1]
    25bb: 4d 33        	adds	r3, #77
    25bd: 32 46        	mov	r2, r6
    25bf: 34 5f        	ldrsh	r4, [r6, r4]
    25c1: 44 69        	ldr	r4, [r0, #20]
    25c3: 73 63        	str	r3, [r6, #52]
    25c5: 6f 76        	strb	r7, [r5, #25]
    25c7: 65 72        	strb	r5, [r4, #9]
    25c9: 79 5f        	ldrsh	r1, [r7, r5]
    25cb: 4d 50        	str	r5, [r1, r1]
    25cd: 33 00        	movs	r3, r6
    25cf: 47 4e        	ldr	r6, [pc, #284]          @ 0x26ec <.debug_info+0x26ec>
    25d1: 55 20        	movs	r0, #85
    25d3: 41 53        	strh	r1, [r0, r5]
    25d5: 20 32        	adds	r2, #32
    25d7: 2e 32        	adds	r2, #46
    25d9: 34 2e        	cmp	r6, #52
    25db: 30 00        	movs	r0, r6
    25dd: 01 80        	strh	r1, [r0]
    25df: 5a 0c        	lsrs	r2, r3, #17
    25e1: 00 00        	movs	r0, r0
    25e3: 04 00        	movs	r4, r0
    25e5: 29 06        	lsls	r1, r5, #24
    25e7: 00 00        	movs	r0, r0
    25e9: 04 01        	lsls	r4, r0, #4
    25eb: 7d 13        	asrs	r5, r7, #13
    25ed: 00 00        	movs	r0, r0
    25ef: 01 55        	strb	r1, [r0, r4]
    25f1: 14 00        	movs	r4, r2
    25f3: 00           	<unknown>
    25f4: ec 14        	asrs	r4, r5, #19
    25f6: 00 00        	movs	r0, r0
    25f8: 40 0c        	lsrs	r0, r0, #17
    25fa: 00 20        	movs	r0, #0
    25fc: dc 04        	lsls	r4, r3, #19
    25fe: 00 00        	movs	r0, r0
    2600: 04 06        	lsls	r4, r0, #24
    2602: 00 00        	movs	r0, r0
    2604: 02 01        	lsls	r2, r0, #4
    2606: 06 05        	lsls	r6, r0, #20
    2608: 03 00        	movs	r3, r0
    260a: 00 02        	lsls	r0, r0, #8
    260c: 02 05        	lsls	r2, r0, #20
    260e: 4c 0b        	lsrs	r4, r1, #13
    2610: 00 00        	movs	r0, r0
    2612: 03 84        	strh	r3, [r0, #32]
    2614: 0d 00        	movs	r5, r1
    2616: 00 02        	lsls	r0, r0, #8
    2618: 28 3e        	subs	r6, #40
    261a: 00 00        	movs	r0, r0
    261c: 00 02        	lsls	r0, r0, #8
    261e: 04 05        	lsls	r4, r0, #20
    2620: cf 06        	lsls	r7, r1, #27
    2622: 00 00        	movs	r0, r0
    2624: 02 08        	lsrs	r2, r0, #32
    2626: 05 ca        	ldm	r2, {r0, r2}
    2628: 06 00        	movs	r6, r0
    262a: 00 03        	lsls	r0, r0, #12
    262c: 8b 01        	lsls	r3, r1, #6
    262e: 00 00        	movs	r0, r0
    2630: 02 2e        	cmp	r6, #2
    2632: 57 00        	lsls	r7, r2, #1
    2634: 00 00        	movs	r0, r0
    2636: 02 01        	lsls	r2, r0, #4
    2638: 08 03        	lsls	r0, r1, #12
    263a: 03 00        	movs	r3, r0
    263c: 00 03        	lsls	r0, r0, #12
    263e: ff 03        	lsls	r7, r7, #15
    2640: 00 00        	movs	r0, r0
    2642: 02 31        	adds	r1, #2
    2644: 69 00        	lsls	r1, r5, #1
    2646: 00 00        	movs	r0, r0
    2648: 02 02        	lsls	r2, r0, #8
    264a: 07 09        	lsrs	r7, r0, #4
    264c: 0d 00        	movs	r5, r1
    264e: 00 03        	lsls	r0, r0, #12
    2650: b7 06        	lsls	r7, r6, #26
    2652: 00 00        	movs	r0, r0
    2654: 02 34        	adds	r4, #2
    2656: 7b 00        	lsls	r3, r7, #1
    2658: 00 00        	movs	r0, r0
    265a: 02 04        	lsls	r2, r0, #16
    265c: 07 8f        	ldrh	r7, [r0, #56]
    265e: 09 00        	movs	r1, r1
    2660: 00 02        	lsls	r0, r0, #8
    2662: 08 07        	lsls	r0, r1, #28
    2664: 8a 09        	lsrs	r2, r1, #6
    2666: 00 00        	movs	r0, r0
    2668: 04 04        	lsls	r4, r0, #16
    266a: 05 69        	ldr	r5, [r0, #16]
    266c: 6e 74        	strb	r6, [r5, #17]
    266e: 00 02        	lsls	r0, r0, #8
    2670: 04 07        	lsls	r4, r0, #28
    2672: 94 09        	lsrs	r4, r2, #6
    2674: 00 00        	movs	r0, r0
    2676: 02 04        	lsls	r2, r0, #16
    2678: 07 47        	bx	r0
    267a: 00 00        	movs	r0, r0
    267c: 00 05        	lsls	r0, r0, #20
    267e: 70 00        	lsls	r0, r6, #1
    2680: 00 00        	movs	r0, r0
    2682: 06 70        	strb	r6, [r0]
    2684: 00 00        	movs	r0, r0
    2686: 00 b3        	cbz	r0, 0x26ca <.debug_info+0x26ca> @ imm = #64
    2688: 00 00        	movs	r0, r0
    268a: 00 07        	lsls	r0, r0, #28
    268c: 97 00        	lsls	r7, r2, #2
    268e: 00 00        	movs	r0, r0
    2690: 01 00        	movs	r1, r0
    2692: 05 33        	adds	r3, #5
    2694: 00 00        	movs	r0, r0
    2696: 00 08        	lsrs	r0, r0, #32
    2698: 01 03        	lsls	r1, r0, #12
    269a: 1d 01        	lsls	r5, r3, #4
    269c: ce 00        	lsls	r6, r1, #3
    269e: 00 00        	movs	r0, r0
    26a0: 09 41        	asrs	r1, r1
    26a2: 17 00        	movs	r7, r2
    26a4: 00 00        	movs	r0, r0
    26a6: 0a 53        	strh	r2, [r1, r4]
    26a8: 45 54        	strb	r5, [r0, r1]
    26aa: 00 01        	lsls	r0, r0, #4
    26ac: 00 0b        	lsrs	r0, r0, #12
    26ae: e1 14        	asrs	r1, r4, #19
    26b0: 00 00        	movs	r0, r0
    26b2: 03 1d        	adds	r3, r0, #4
    26b4: 01           	<unknown>
    26b5: b8 00        	lsls	r0, r7, #2
    26b7: 00 00        	movs	r0, r0
    26b9: 0b 49        	ldr	r1, [pc, #44]           @ 0x26e8 <.debug_info+0x26e8>
    26bb: 12 00        	movs	r2, r2
    26bd: 00 03        	lsls	r0, r0, #12
    26bf: 1d 01        	lsls	r5, r3, #4
    26c1: b8 00        	lsls	r0, r7, #2
    26c3: 00 00        	movs	r0, r0
    26c5: 08 01        	lsls	r0, r1, #4
    26c7: 03 1f        	subs	r3, r0, #4
    26c9: 01           	<unknown>
    26ca: fc 00        	lsls	r4, r7, #3
    26cc: 00 00        	movs	r0, r0
    26ce: 09 00        	movs	r1, r1
    26d0: 08 00        	movs	r0, r1
    26d2: 00 00        	movs	r0, r0
    26d4: 09 ab        	add	r3, sp, #36
    26d6: 0b 00        	movs	r3, r1
    26d8: 00 01        	lsls	r0, r0, #4
    26da: 00 0b        	lsrs	r0, r0, #12
    26dc: 54 09        	lsrs	r4, r2, #5
    26de: 00 00        	movs	r0, r0
    26e0: 03 1f        	subs	r3, r0, #4
    26e2: 01 e6        	b	0x22e8 <.debug_info+0x22e8> @ imm = #-1022
    26e4: 00 00        	movs	r0, r0
    26e6: 00 08        	lsrs	r0, r0, #32
    26e8: 01 03        	lsls	r1, r0, #12
    26ea: 22 01        	lsls	r2, r4, #4
    26ec: 1e 01        	lsls	r6, r3, #4
    26ee: 00 00        	movs	r0, r0
    26f0: 09 cc        	ldm	r4!, {r0, r3}
    26f2: 10 00        	movs	r0, r2
    26f4: 00 00        	movs	r0, r0
    26f6: 09 13        	asrs	r1, r1, #12
    26f8: 13 00        	movs	r3, r2
    26fa: 00 01        	lsls	r0, r0, #4
    26fc: 00 0b        	lsrs	r0, r0, #12
    26fe: 24 11        	asrs	r4, r4, #4
    2700: 00 00        	movs	r0, r0
    2702: 03 22        	movs	r2, #3
    2704: 01 08        	lsrs	r1, r0, #32
    2706: 01 00        	movs	r1, r0
    2708: 00 0c        	lsrs	r0, r0, #16
    270a: 88 03        	lsls	r0, r1, #14
    270c: dd 02        	lsls	r5, r3, #11
    270e: b9 02        	lsls	r1, r7, #10
    2710: 00 00        	movs	r0, r0
    2712: 0d 43        	orrs	r5, r1
    2714: 52 00        	lsls	r2, r2, #1
    2716: 03 df        	svc	#3
    2718: 02 9e        	ldr	r6, [sp, #8]
    271a: 00 00        	movs	r0, r0
    271c: 00 00        	movs	r0, r0
    271e: 0e 07        	lsls	r6, r1, #28
    2720: 0f 00        	movs	r7, r1
    2722: 00 03        	lsls	r0, r0, #12
    2724: e0 02        	lsls	r0, r4, #11
    2726: 9e 00        	lsls	r6, r3, #2
    2728: 00 00        	movs	r0, r0
    272a: 04 0e        	lsrs	r4, r0, #24
    272c: 0a 0f        	lsrs	r2, r1, #28
    272e: 00 00        	movs	r0, r0
    2730: 03 e1        	b	0x293a <.debug_info+0x293a> @ imm = #518
    2732: 02 9e        	ldr	r6, [sp, #8]
    2734: 00 00        	movs	r0, r0
    2736: 00 08        	lsrs	r0, r0, #32
    2738: 0d 43        	orrs	r5, r1
    273a: 49 52        	strh	r1, [r1, r1]
    273c: 00 03        	lsls	r0, r0, #12
    273e: e2 02        	lsls	r2, r4, #11
    2740: 9e 00        	lsls	r6, r3, #2
    2742: 00 00        	movs	r0, r0
    2744: 0c 0e        	lsrs	r4, r1, #24
    2746: b2 0e        	lsrs	r2, r6, #26
    2748: 00 00        	movs	r0, r0
    274a: 03 e3        	b	0x2d54 <.debug_info+0x2d54> @ imm = #1542
    274c: 02 9e        	ldr	r6, [sp, #8]
    274e: 00 00        	movs	r0, r0
    2750: 00 10        	asrs	r0, r0, #32
    2752: 0e 22        	movs	r2, #14
    2754: 10 00        	movs	r0, r2
    2756: 00 03        	lsls	r0, r0, #12
    2758: e4 02        	lsls	r4, r4, #11
    275a: 9e 00        	lsls	r6, r3, #2
    275c: 00 00        	movs	r0, r0
    275e: 14 0e        	lsrs	r4, r2, #24
    2760: 77 0f        	lsrs	r7, r6, #29
    2762: 00 00        	movs	r0, r0
    2764: 03 e5        	b	0x216e <.debug_info+0x216e> @ imm = #-1530
    2766: 02 9e        	ldr	r6, [sp, #8]
    2768: 00 00        	movs	r0, r0
    276a: 00 18        	adds	r0, r0, r0
    276c: 0e           	<unknown>
    276d: ef 02        	lsls	r7, r5, #11
    276f: 00 00        	movs	r0, r0
    2771: 03 e6        	b	0x237b <.debug_info+0x237b> @ imm = #-1018
    2773: 02 70        	strb	r2, [r0]
    2775: 00 00        	movs	r0, r0
    2777: 00 1c        	adds	r0, r0, #0
    2779: 0e 8d        	ldrh	r6, [r1, #40]
    277b: 0f 00        	movs	r7, r1
    277d: 00 03        	lsls	r0, r0, #12
    277f: e7 02        	lsls	r7, r4, #11
    2781: 9e 00        	lsls	r6, r3, #2
    2783: 00 00        	movs	r0, r0
    2785: 20 0e        	lsrs	r0, r4, #24
    2787: 15 0f        	lsrs	r5, r2, #28
    2789: 00 00        	movs	r0, r0
    278b: 03           	<unknown>
    278c: e8 02        	lsls	r0, r5, #11
    278e: 9e 00        	lsls	r6, r3, #2
    2790: 00 00        	movs	r0, r0
    2792: 24 0e        	lsrs	r4, r4, #24
    2794: f9 02        	lsls	r1, r7, #11
    2796: 00 00        	movs	r0, r0
    2798: 03           	<unknown>
    2799: e9 02        	lsls	r1, r5, #11
    279b: a3 00        	lsls	r3, r4, #2
    279d: 00 00        	movs	r0, r0
    279f: 28 0e        	lsrs	r0, r5, #24
    27a1: 08 10        	asrs	r0, r1, #32
    27a3: 00 00        	movs	r0, r0
    27a5: 03 ea 02 9e  	and.w	lr, r3, r2, lsl #4
    27a9: 00 00        	movs	r0, r0
    27ab: 00 30        	adds	r0, #0
    27ad: 0e bb        	cbnz	r6, 0x27f3 <.debug_info+0x27f3> @ imm = #66
    27af: 0e 00        	movs	r6, r1
    27b1: 00 03        	lsls	r0, r0, #12
    27b3: eb 02        	lsls	r3, r5, #11
    27b5: 9e 00        	lsls	r6, r3, #2
    27b7: 00 00        	movs	r0, r0
    27b9: 34 0e        	lsrs	r4, r6, #24
    27bb: bd 10        	asrs	r5, r7, #2
    27bd: 00 00        	movs	r0, r0
    27bf: 03           	<unknown>
    27c0: ec 02        	lsls	r4, r5, #11
    27c2: 9e 00        	lsls	r6, r3, #2
    27c4: 00 00        	movs	r0, r0
    27c6: 38 0e        	lsrs	r0, r7, #24
    27c8: 8b 03        	lsls	r3, r1, #14
    27ca: 00 00        	movs	r0, r0
    27cc: 03 ed 02 70  	stc	p0, c7, [r3, #-8]
    27d0: 00 00        	movs	r0, r0
    27d2: 00 3c        	subs	r4, #0
    27d4: 0e 96        	str	r6, [sp, #56]
    27d6: 0f 00        	movs	r7, r1
    27d8: 00 03        	lsls	r0, r0, #12
    27da: ee 02        	lsls	r6, r5, #11
    27dc: 9e 00        	lsls	r6, r3, #2
    27de: 00 00        	movs	r0, r0
    27e0: 40 0e        	lsrs	r0, r0, #25
    27e2: 47 0e        	lsrs	r7, r0, #25
    27e4: 00 00        	movs	r0, r0
    27e6: 03           	<unknown>
    27e7: ef 02        	lsls	r7, r5, #11
    27e9: 9e 00        	lsls	r6, r3, #2
    27eb: 00 00        	movs	r0, r0
    27ed: 44 0e        	lsrs	r4, r0, #25
    27ef: 95 03        	lsls	r5, r2, #14
    27f1: 00 00        	movs	r0, r0
    27f3: 03 f0 02 a3  	beq.w	0x45dfb <.debug_info+0x45dfb> @ imm = #275972
    27f7: 00 00        	movs	r0, r0
    27f9: 00 48        	ldr	r0, [pc, #0]            @ 0x27fc <.debug_info+0x27fc>
    27fb: 0e 4f        	ldr	r7, [pc, #56]           @ 0x2834 <.debug_info+0x2834>
    27fd: 0e 00        	movs	r6, r1
    27ff: 00 03        	lsls	r0, r0, #12
    2801: f1 02        	lsls	r1, r6, #11
    2803: 9e 00        	lsls	r6, r3, #2
    2805: 00 00        	movs	r0, r0
    2807: 50 0e        	lsrs	r0, r2, #25
    2809: 30 0e        	lsrs	r0, r6, #24
    280b: 00 00        	movs	r0, r0
    280d: 03 f2 02 9e  	b.w	0xa06415 <.debug_info+0xa06415> @ imm = #10501124
    2811: 00 00        	movs	r0, r0
    2813: 00 54        	strb	r0, [r0, r0]
    2815: 0e cc        	ldm	r4!, {r1, r2, r3}
    2817: 0f 00        	movs	r7, r1
    2819: 00 03        	lsls	r0, r0, #12
    281b: f3 02        	lsls	r3, r6, #11
    281d: 9e 00        	lsls	r6, r3, #2
    281f: 00 00        	movs	r0, r0
    2821: 58 0e        	lsrs	r0, r3, #25
    2823: 23 03        	lsls	r3, r4, #12
    2825: 00 00        	movs	r0, r0
    2827: 03 f4 02 70  	and	r0, r3, #520
    282b: 00 00        	movs	r0, r0
    282d: 00 5c        	ldrb	r0, [r0, r0]
    282f: 0e 35        	adds	r5, #14
    2831: 0f 00        	movs	r7, r1
    2833: 00 03        	lsls	r0, r0, #12
    2835: f5 02        	lsls	r5, r6, #11
    2837: 9e 00        	lsls	r6, r3, #2
    2839: 00 00        	movs	r0, r0
    283b: 60 0e        	lsrs	r0, r4, #25
    283d: 2b 0f        	lsrs	r3, r5, #28
    283f: 00 00        	movs	r0, r0
    2841: 03 f6 02 9e  	b.w	0xff606449 <CallbackContext+0xffffffffdf6050c9> @ imm = #-10470396
    2845: 00 00        	movs	r0, r0
    2847: 00 64        	str	r0, [r0, #64]
    2849: 0e 2d        	cmp	r5, #14
    284b: 03 00        	movs	r3, r0
    284d: 00 03        	lsls	r0, r0, #12
    284f: f7 02        	lsls	r7, r6, #11
    2851: a3 00        	lsls	r3, r4, #2
    2853: 00 00        	movs	r0, r0
    2855: 68 0e        	lsrs	r0, r5, #25
    2857: ca 0e        	lsrs	r2, r1, #27
    2859: 00 00        	movs	r0, r0
    285b: 03 f8 02 9e  	strbt	r9, [r3, #2]
    285f: 00 00        	movs	r0, r0
    2861: 00 70        	strb	r0, [r0]
    2863: 0d 43        	orrs	r5, r1
    2865: 53 52        	strh	r3, [r2, r1]
    2867: 00 03        	lsls	r0, r0, #12
    2869: f9 02        	lsls	r1, r7, #11
    286b: 9e 00        	lsls	r6, r3, #2
    286d: 00 00        	movs	r0, r0
    286f: 74 0e        	lsrs	r4, r6, #25
    2871: 37 03        	lsls	r7, r6, #12
    2873: 00 00        	movs	r0, r0
    2875: 03           	<unknown>
    2876: fa 02        	lsls	r2, r7, #11
    2878: a3 00        	lsls	r3, r4, #2
    287a: 00 00        	movs	r0, r0
    287c: 78 0e        	lsrs	r0, r7, #25
    287e: 0f 0f        	lsrs	r7, r1, #28
    2880: 00 00        	movs	r0, r0
    2882: 03 fb 02 9e  	mla	lr, r3, r2, r9
    2886: 00 00        	movs	r0, r0
    2888: 00 80        	strh	r0, [r0]
    288a: 0e f0 0d 00  	and	r0, lr, #13
    288e: 00 03        	lsls	r0, r0, #12
    2890: fc 02        	lsls	r4, r7, #11
    2892: 9e 00        	lsls	r6, r3, #2
    2894: 00 00        	movs	r0, r0
    2896: 84 00        	lsls	r4, r0, #2
    2898: 0b 30        	adds	r0, #11
    289a: 10 00        	movs	r0, r2
    289c: 00 03        	lsls	r0, r0, #12
    289e: fd 02        	lsls	r5, r7, #11
    28a0: 2a 01        	lsls	r2, r5, #4
    28a2: 00 00        	movs	r0, r0
    28a4: 0f 10        	asrs	r7, r1, #32
    28a6: 04 30        	adds	r0, #4
    28a8: fe 02        	lsls	r6, r7, #11
    28aa: 00 00        	movs	r0, r0
    28ac: 10 31        	adds	r1, #16
    28ae: 12 00        	movs	r2, r2
    28b0: 00 04        	lsls	r0, r0, #16
    28b2: 32 70        	strb	r2, [r6]
    28b4: 00 00        	movs	r0, r0
    28b6: 00 00        	movs	r0, r0
    28b8: 10 a0        	adr	r0, #64 <.debug_info+0x28cc>
    28ba: 12 00        	movs	r2, r2
    28bc: 00 04        	lsls	r0, r0, #16
    28be: 33 70        	strb	r3, [r6]
    28c0: 00 00        	movs	r0, r0
    28c2: 00 04        	lsls	r0, r0, #16
    28c4: 10 22        	movs	r2, #16
    28c6: 16 00        	movs	r6, r2
    28c8: 00 04        	lsls	r0, r0, #16
    28ca: 34 70        	strb	r4, [r6]
    28cc: 00 00        	movs	r0, r0
    28ce: 00 08        	lsrs	r0, r0, #32
    28d0: 10 33        	adds	r3, #16
    28d2: 15 00        	movs	r5, r2
    28d4: 00 04        	lsls	r0, r0, #16
    28d6: 35 70        	strb	r5, [r6]
    28d8: 00 00        	movs	r0, r0
    28da: 00 0c        	lsrs	r0, r0, #16
    28dc: 00 03        	lsls	r0, r0, #12
    28de: 41 11        	asrs	r1, r0, #5
    28e0: 00 00        	movs	r0, r0
    28e2: 04 36        	adds	r6, #4
    28e4: c5 02        	lsls	r5, r0, #11
    28e6: 00 00        	movs	r0, r0
    28e8: 11 19        	adds	r1, r2, r4
    28ea: 11 00        	movs	r1, r2
    28ec: 00 01        	lsls	r0, r0, #4
    28ee: ca 40        	lsrs	r2, r1
    28f0: 0c 00        	movs	r4, r1
    28f2: 20 34        	adds	r4, #32
    28f4: 00 00        	movs	r0, r0
    28f6: 00 01        	lsls	r0, r0, #4
    28f8: 9c 12        	asrs	r4, r3, #10
    28fa: 60 13        	asrs	r0, r4, #13
    28fc: 00 00        	movs	r0, r0
    28fe: 01           	<unknown>
    28ff: f3 74        	strb	r3, [r6, #19]
    2901: 0c 00        	movs	r4, r1
    2903: 20 10        	asrs	r0, r4, #32
    2905: 00 00        	movs	r0, r0
    2907: 00 01        	lsls	r0, r0, #4
    2909: 9c 3d        	subs	r5, #156
    290b: 03 00        	movs	r3, r0
    290d: 00 13        	asrs	r0, r0, #12
    290f: 72 12        	asrs	r2, r6, #9
    2911: 00 00        	movs	r0, r0
    2913: 01 f3 4c 00  	ssat	r0, #13, r1, lsl #1
    2917: 00 00        	movs	r0, r0
    2919: 01 50        	str	r1, [r0, r0]
    291b: 00 14        	asrs	r0, r0, #16
    291d: af 12        	asrs	r7, r5, #10
    291f: 00 00        	movs	r0, r0
    2921: 01 2a        	cmp	r2, #1
    2923: 01 84        	strh	r1, [r0, #32]
    2925: 0c 00        	movs	r4, r1
    2927: 20 14        	asrs	r0, r4, #16
    2929: 00 00        	movs	r0, r0
    292b: 00 01        	lsls	r0, r0, #4
    292d: 9c 74        	strb	r4, [r3, #18]
    292f: 03 00        	movs	r3, r0
    2931: 00 15        	asrs	r0, r0, #20
    2933: b9 12        	asrs	r1, r7, #10
    2935: 00 00        	movs	r0, r0
    2937: 01 2a        	cmp	r2, #1
    2939: 01 4c        	ldr	r4, [pc, #4]            @ 0x2940 <.debug_info+0x2940>
    293b: 00 00        	movs	r0, r0
    293d: 00           	<unknown>
    293e: c8 03        	lsls	r0, r1, #15
    2940: 00 00        	movs	r0, r0
    2942: 16 99        	ldr	r1, [sp, #88]
    2944: 12 00        	movs	r2, r2
    2946: 00 01        	lsls	r0, r0, #4
    2948: 2c 01        	lsls	r4, r5, #4
    294a: 70 00        	lsls	r0, r6, #1
    294c: 00 00        	movs	r0, r0
    294e: e9 03        	lsls	r1, r5, #15
    2950: 00 00        	movs	r0, r0
    2952: 00 14        	asrs	r0, r0, #16
    2954: de 15        	asrs	r6, r3, #23
    2956: 00 00        	movs	r0, r0
    2958: 01 4e        	ldr	r6, [pc, #4]            @ 0x2960 <.debug_info+0x2960>
    295a: 01 98        	ldr	r0, [sp, #4]
    295c: 0c 00        	movs	r4, r1
    295e: 20 0c        	lsrs	r0, r4, #16
    2960: 00 00        	movs	r0, r0
    2962: 00 01        	lsls	r0, r0, #4
    2964: 9c 99        	ldr	r1, [sp, #624]
    2966: 03 00        	movs	r3, r0
    2968: 00 17        	asrs	r0, r0, #28
    296a: ed 12        	asrs	r5, r5, #11
    296c: 00 00        	movs	r0, r0
    296e: 01 4e        	ldr	r6, [pc, #4]            @ 0x2974 <.debug_info+0x2974>
    2970: 01           	<unknown>
    2971: fc 00        	lsls	r4, r7, #3
    2973: 00 00        	movs	r0, r0
    2975: 01 50        	str	r1, [r0, r0]
    2977: 00 14        	asrs	r0, r0, #16
    2979: bd 14        	asrs	r5, r7, #18
    297b: 00 00        	movs	r0, r0
    297d: 01 67        	str	r1, [r0, #112]
    297f: 01 a4        	adr	r4, #4 <.debug_info+0x2984>
    2981: 0c 00        	movs	r4, r1
    2983: 20 28        	cmp	r0, #32
    2985: 00 00        	movs	r0, r0
    2987: 00 01        	lsls	r0, r0, #4
    2989: 9c be        	bkpt	#156
    298b: 03 00        	movs	r3, r0
    298d: 00 17        	asrs	r0, r0, #28
    298f: 71 16        	asrs	r1, r6, #25
    2991: 00 00        	movs	r0, r0
    2993: 01 67        	str	r1, [r0, #112]
    2995: 01 4c        	ldr	r4, [pc, #4]            @ 0x299c <.debug_info+0x299c>
    2997: 00 00        	movs	r0, r0
    2999: 00 01        	lsls	r0, r0, #4
    299b: 50 00        	lsls	r0, r2, #1
    299d: 14 04        	lsls	r4, r2, #16
    299f: 12 00        	movs	r2, r2
    29a1: 00 01        	lsls	r0, r0, #4
    29a3: 8f 01        	lsls	r7, r1, #6
    29a5: cc 0c        	lsrs	r4, r1, #19
    29a7: 00 20        	movs	r0, #0
    29a9: 0c 00        	movs	r4, r1
    29ab: 00 00        	movs	r0, r0
    29ad: 01 9c        	ldr	r4, [sp, #4]
    29af: e3 03        	lsls	r3, r4, #15
    29b1: 00 00        	movs	r0, r0
    29b3: 17 ed 12 00  	ldc	p0, c0, [r7, #-72]
    29b7: 00 01        	lsls	r0, r0, #4
    29b9: 8f 01        	lsls	r7, r1, #6
    29bb: fc 00        	lsls	r4, r7, #3
    29bd: 00 00        	movs	r0, r0
    29bf: 01 50        	str	r1, [r0, r0]
    29c1: 00 14        	asrs	r0, r0, #16
    29c3: 53 11        	asrs	r3, r2, #5
    29c5: 00 00        	movs	r0, r0
    29c7: 01 ba        	rev	r1, r0
    29c9: 01 d8        	bhi	0x29cf <.debug_info+0x29cf> @ imm = #2
    29cb: 0c 00        	movs	r4, r1
    29cd: 20 20        	movs	r0, #32
    29cf: 00 00        	movs	r0, r0
    29d1: 00 01        	lsls	r0, r0, #4
    29d3: 9c 48        	ldr	r0, [pc, #624]          @ 0x2c44 <.debug_info+0x2c44>
    29d5: 04 00        	movs	r4, r0
    29d7: 00 15        	asrs	r0, r0, #20
    29d9: 87 11        	asrs	r7, r0, #6
    29db: 00 00        	movs	r0, r0
    29dd: 01 ba        	rev	r1, r0
    29df: 01 70        	strb	r1, [r0]
    29e1: 00 00        	movs	r0, r0
    29e3: 00 13        	asrs	r0, r0, #12
    29e5: 04 00        	movs	r4, r0
    29e7: 00 15        	asrs	r0, r0, #20
    29e9: 79 16        	asrs	r1, r7, #25
    29eb: 00 00        	movs	r0, r0
    29ed: 01 ba        	rev	r1, r0
    29ef: 01 70        	strb	r1, [r0]
    29f1: 00 00        	movs	r0, r0
    29f3: 00 34        	adds	r4, #0
    29f5: 04 00        	movs	r4, r0
    29f7: 00 17        	asrs	r0, r0, #28
    29f9: 7e 16        	asrs	r6, r7, #25
    29fb: 00 00        	movs	r0, r0
    29fd: 01 ba        	rev	r1, r0
    29ff: 01 70        	strb	r1, [r0]
    2a01: 00 00        	movs	r0, r0
    2a03: 00 01        	lsls	r0, r0, #4
    2a05: 52 15        	asrs	r2, r2, #21
    2a07: 83 16        	asrs	r3, r0, #26
    2a09: 00 00        	movs	r0, r0
    2a0b: 01 ba        	rev	r1, r0
    2a0d: 01 70        	strb	r1, [r0]
    2a0f: 00 00        	movs	r0, r0
    2a11: 00 55        	strb	r0, [r0, r4]
    2a13: 04 00        	movs	r4, r0
    2a15: 00 15        	asrs	r0, r0, #20
    2a17: 88 16        	asrs	r0, r1, #26
    2a19: 00 00        	movs	r0, r0
    2a1b: 01 ba        	rev	r1, r0
    2a1d: 01 70        	strb	r1, [r0]
    2a1f: 00 00        	movs	r0, r0
    2a21: 00 76        	strb	r0, [r0, #24]
    2a23: 04 00        	movs	r4, r0
    2a25: 00 00        	movs	r0, r0
    2a27: 14 49        	ldr	r1, [pc, #80]           @ 0x2a78 <.debug_info+0x2a78>
    2a29: 16 00        	movs	r6, r2
    2a2b: 00 01        	lsls	r0, r0, #4
    2a2d: d1 01        	lsls	r1, r2, #7
    2a2f: f8 0c        	lsrs	r0, r7, #19
    2a31: 00 20        	movs	r0, #0
    2a33: 0c 00        	movs	r4, r1
    2a35: 00 00        	movs	r0, r0
    2a37: 01 9c        	ldr	r4, [sp, #4]
    2a39: 6d 04        	lsls	r5, r5, #17
    2a3b: 00 00        	movs	r0, r0
    2a3d: 17 ed 12 00  	ldc	p0, c0, [r7, #-72]
    2a41: 00 01        	lsls	r0, r0, #4
    2a43: d1 01        	lsls	r1, r2, #7
    2a45: fc 00        	lsls	r4, r7, #3
    2a47: 00 00        	movs	r0, r0
    2a49: 01 50        	str	r1, [r0, r0]
    2a4b: 00 14        	asrs	r0, r0, #16
    2a4d: 0f 12        	asrs	r7, r1, #8
    2a4f: 00 00        	movs	r0, r0
    2a51: 01 eb 01 04  	add.w	r4, r1, r1
    2a55: 0d 00        	movs	r5, r1
    2a57: 20 14        	asrs	r0, r4, #16
    2a59: 00 00        	movs	r0, r0
    2a5b: 00 01        	lsls	r0, r0, #4
    2a5d: 9c a4        	adr	r4, #624 <.debug_info+0x2afd>
    2a5f: 04 00        	movs	r4, r0
    2a61: 00 15        	asrs	r0, r0, #20
    2a63: 09 11        	asrs	r1, r1, #4
    2a65: 00 00        	movs	r0, r0
    2a67: 01 eb 01 70  	add.w	r0, r1, r1, lsl #28
    2a6b: 00 00        	movs	r0, r0
    2a6d: 00 8a        	ldrh	r0, [r0, #16]
    2a6f: 04 00        	movs	r4, r0
    2a71: 00 15        	asrs	r0, r0, #20
    2a73: 11 11        	asrs	r1, r2, #4
    2a75: 00 00        	movs	r0, r0
    2a77: 01 eb 01 70  	add.w	r0, r1, r1, lsl #28
    2a7b: 00 00        	movs	r0, r0
    2a7d: 00 ab        	add	r3, sp, #0
    2a7f: 04 00        	movs	r4, r0
    2a81: 00 00        	movs	r0, r0
    2a83: 14 00        	movs	r4, r2
    2a85: 16 00        	movs	r6, r2
    2a87: 00 01        	lsls	r0, r0, #4
    2a89: fa 01        	lsls	r2, r7, #7
    2a8b: 18 0d        	lsrs	r0, r3, #20
    2a8d: 00 20        	movs	r0, #0
    2a8f: 0c 00        	movs	r4, r1
    2a91: 00 00        	movs	r0, r0
    2a93: 01 9c        	ldr	r4, [sp, #4]
    2a95: c9 04        	lsls	r1, r1, #19
    2a97: 00 00        	movs	r0, r0
    2a99: 17 ed 12 00  	ldc	p0, c0, [r7, #-72]
    2a9d: 00 01        	lsls	r0, r0, #4
    2a9f: fa 01        	lsls	r2, r7, #7
    2aa1: fc 00        	lsls	r4, r7, #3
    2aa3: 00 00        	movs	r0, r0
    2aa5: 01 50        	str	r1, [r0, r0]
    2aa7: 00 14        	asrs	r0, r0, #16
    2aa9: 2a 13        	asrs	r2, r5, #12
    2aab: 00 00        	movs	r0, r0
    2aad: 01 0c        	lsrs	r1, r0, #16
    2aaf: 02 24        	movs	r4, #2
    2ab1: 0d 00        	movs	r5, r1
    2ab3: 20 0c        	lsrs	r0, r4, #16
    2ab5: 00 00        	movs	r0, r0
    2ab7: 00 01        	lsls	r0, r0, #4
    2ab9: 9c ee 04 00  	cdp	p0, #9, c0, c12, c4, #0
    2abd: 00 17        	asrs	r0, r0, #28
    2abf: ed 12        	asrs	r5, r5, #11
    2ac1: 00 00        	movs	r0, r0
    2ac3: 01 0c        	lsrs	r1, r0, #16
    2ac5: 02           	<unknown>
    2ac6: fc 00        	lsls	r4, r7, #3
    2ac8: 00 00        	movs	r0, r0
    2aca: 01 50        	str	r1, [r0, r0]
    2acc: 00 14        	asrs	r0, r0, #16
    2ace: de 12        	asrs	r6, r3, #11
    2ad0: 00 00        	movs	r0, r0
    2ad2: 01 25        	movs	r5, #1
    2ad4: 02 30        	adds	r0, #2
    2ad6: 0d 00        	movs	r5, r1
    2ad8: 20 14        	asrs	r0, r4, #16
    2ada: 00 00        	movs	r0, r0
    2adc: 00 01        	lsls	r0, r0, #4
    2ade: 9c 33        	adds	r3, #156
    2ae0: 05 00        	movs	r5, r0
    2ae2: 00 15        	asrs	r0, r0, #20
    2ae4: 45 13        	asrs	r5, r0, #13
    2ae6: 00 00        	movs	r0, r0
    2ae8: 01 25        	movs	r5, #1
    2aea: 02 70        	strb	r2, [r0]
    2aec: 00 00        	movs	r0, r0
    2aee: 00           	<unknown>
    2aef: cc 04        	lsls	r4, r1, #19
    2af1: 00 00        	movs	r0, r0
    2af3: 17 54        	strb	r7, [r2, r0]
    2af5: 13 00        	movs	r3, r2
    2af7: 00 01        	lsls	r0, r0, #4
    2af9: 25 02        	lsls	r5, r4, #8
    2afb: 70 00        	lsls	r0, r6, #1
    2afd: 00 00        	movs	r0, r0
    2aff: 01 51        	str	r1, [r0, r4]
    2b01: 16 99        	ldr	r1, [sp, #88]
    2b03: 12 00        	movs	r2, r2
    2b05: 00 01        	lsls	r0, r0, #4
    2b07: 27 02        	lsls	r7, r4, #8
    2b09: 70 00        	lsls	r0, r6, #1
    2b0b: 00 00        	movs	r0, r0
    2b0d: ed 04        	lsls	r5, r5, #19
    2b0f: 00 00        	movs	r0, r0
    2b11: 00 14        	asrs	r0, r0, #16
    2b13: 9c 16        	asrs	r4, r3, #26
    2b15: 00 00        	movs	r0, r0
    2b17: 01 4b        	ldr	r3, [pc, #4]            @ 0x2b1c <.debug_info+0x2b1c>
    2b19: 02 44        	add	r2, r0
    2b1b: 0d 00        	movs	r5, r1
    2b1d: 20 14        	asrs	r0, r4, #16
    2b1f: 00 00        	movs	r0, r0
    2b21: 00 01        	lsls	r0, r0, #4
    2b23: 9c 78        	ldrb	r4, [r3, #2]
    2b25: 05 00        	movs	r5, r0
    2b27: 00 15        	asrs	r0, r0, #20
    2b29: ee 10        	asrs	r6, r5, #3
    2b2b: 00 00        	movs	r0, r0
    2b2d: 01 4b        	ldr	r3, [pc, #4]            @ 0x2b34 <.debug_info+0x2b34>
    2b2f: 02 70        	strb	r2, [r0]
    2b31: 00 00        	movs	r0, r0
    2b33: 00 0c        	lsrs	r0, r0, #16
    2b35: 05 00        	movs	r5, r0
    2b37: 00 17        	asrs	r0, r0, #28
    2b39: fd 10        	asrs	r5, r7, #3
    2b3b: 00 00        	movs	r0, r0
    2b3d: 01 4b        	ldr	r3, [pc, #4]            @ 0x2b44 <.debug_info+0x2b44>
    2b3f: 02 70        	strb	r2, [r0]
    2b41: 00 00        	movs	r0, r0
    2b43: 00 01        	lsls	r0, r0, #4
    2b45: 51 16        	asrs	r1, r2, #25
    2b47: 99 12        	asrs	r1, r3, #10
    2b49: 00 00        	movs	r0, r0
    2b4b: 01 4d        	ldr	r5, [pc, #4]            @ 0x2b50 <.debug_info+0x2b50>
    2b4d: 02 70        	strb	r2, [r0]
    2b4f: 00 00        	movs	r0, r0
    2b51: 00 2d        	cmp	r5, #0
    2b53: 05 00        	movs	r5, r0
    2b55: 00 00        	movs	r0, r0
    2b57: 14 d2        	bhs	0x2b83 <.debug_info+0x2b83> @ imm = #40
    2b59: 10 00        	movs	r0, r2
    2b5b: 00 01        	lsls	r0, r0, #4
    2b5d: b5 02        	lsls	r5, r6, #10
    2b5f: 58 0d        	lsrs	r0, r3, #21
    2b61: 00 20        	movs	r0, #0
    2b63: 14 00        	movs	r4, r2
    2b65: 00 00        	movs	r0, r0
    2b67: 01 9c        	ldr	r4, [sp, #4]
    2b69: af 05        	lsls	r7, r5, #22
    2b6b: 00 00        	movs	r0, r0
    2b6d: 15 30        	adds	r0, #21
    2b6f: 11 00        	movs	r1, r2
    2b71: 00 01        	lsls	r0, r0, #4
    2b73: b5 02        	lsls	r5, r6, #10
    2b75: 70 00        	lsls	r0, r6, #1
    2b77: 00 00        	movs	r0, r0
    2b79: 4c 05        	lsls	r4, r1, #21
    2b7b: 00 00        	movs	r0, r0
    2b7d: 16 99        	ldr	r1, [sp, #88]
    2b7f: 12 00        	movs	r2, r2
    2b81: 00 01        	lsls	r0, r0, #4
    2b83: b7 02        	lsls	r7, r6, #10
    2b85: 70 00        	lsls	r0, r6, #1
    2b87: 00 00        	movs	r0, r0
    2b89: 6d 05        	lsls	r5, r5, #21
    2b8b: 00 00        	movs	r0, r0
    2b8d: 00 18        	adds	r0, r0, r0
    2b8f: 72 15        	asrs	r2, r6, #21
    2b91: 00 00        	movs	r0, r0
    2b93: 01 d1        	bne	0x2b99 <.debug_info+0x2b99> @ imm = #2
    2b95: 02 4c        	ldr	r4, [pc, #8]            @ 0x2ba0 <.debug_info+0x2ba0>
    2b97: 00 00        	movs	r0, r0
    2b99: 00 6c        	ldr	r0, [r0, #64]
    2b9b: 0d 00        	movs	r5, r1
    2b9d: 20 10        	asrs	r0, r4, #32
    2b9f: 00 00        	movs	r0, r0
    2ba1: 00 01        	lsls	r0, r0, #4
    2ba3: 9c 14        	asrs	r4, r3, #18
    2ba5: 75 14        	asrs	r5, r6, #17
    2ba7: 00 00        	movs	r0, r0
    2ba9: 01 ea 02 7c  	and.w	r12, r1, r2, lsl #28
    2bad: 0d 00        	movs	r5, r1
    2baf: 20 14        	asrs	r0, r4, #16
    2bb1: 00 00        	movs	r0, r0
    2bb3: 00 01        	lsls	r0, r0, #4
    2bb5: 9c fc 05 00  	ldc2	p0, c0, [r12], {5}
    2bb9: 00 15        	asrs	r0, r0, #20
    2bbb: e3 10        	asrs	r3, r4, #3
    2bbd: 00 00        	movs	r0, r0
    2bbf: 01 ea 02 70  	and.w	r0, r1, r2, lsl #28
    2bc3: 00 00        	movs	r0, r0
    2bc5: 00 97        	str	r7, [sp]
    2bc7: 05 00        	movs	r5, r0
    2bc9: 00 16        	asrs	r0, r0, #24
    2bcb: 99 12        	asrs	r1, r3, #10
    2bcd: 00 00        	movs	r0, r0
    2bcf: 01           	<unknown>
    2bd0: ec 02        	lsls	r4, r5, #11
    2bd2: 70 00        	lsls	r0, r6, #1
    2bd4: 00 00        	movs	r0, r0
    2bd6: b8 05        	lsls	r0, r7, #22
    2bd8: 00 00        	movs	r0, r0
    2bda: 00 14        	asrs	r0, r0, #16
    2bdc: 89 12        	asrs	r1, r1, #10
    2bde: 00 00        	movs	r0, r0
    2be0: 01 0a        	lsrs	r1, r0, #8
    2be2: 03 90        	str	r0, [sp, #12]
    2be4: 0d 00        	movs	r5, r1
    2be6: 20 14        	asrs	r0, r4, #16
    2be8: 00 00        	movs	r0, r0
    2bea: 00 01        	lsls	r0, r0, #4
    2bec: 9c 33        	adds	r3, #156
    2bee: 06 00        	movs	r6, r0
    2bf0: 00 15        	asrs	r0, r0, #20
    2bf2: 52 12        	asrs	r2, r2, #9
    2bf4: 00 00        	movs	r0, r0
    2bf6: 01 0a        	lsrs	r1, r0, #8
    2bf8: 03 70        	strb	r3, [r0]
    2bfa: 00 00        	movs	r0, r0
    2bfc: 00 e2        	b	0x3000 <.debug_info+0x3000> @ imm = #1024
    2bfe: 05 00        	movs	r5, r0
    2c00: 00 16        	asrs	r0, r0, #24
    2c02: 99 12        	asrs	r1, r3, #10
    2c04: 00 00        	movs	r0, r0
    2c06: 01 0c        	lsrs	r1, r0, #16
    2c08: 03 70        	strb	r3, [r0]
    2c0a: 00 00        	movs	r0, r0
    2c0c: 00 03        	lsls	r0, r0, #12
    2c0e: 06 00        	movs	r6, r0
    2c10: 00 00        	movs	r0, r0
    2c12: 14 61        	str	r4, [r2, #16]
    2c14: 11 00        	movs	r1, r2
    2c16: 00 01        	lsls	r0, r0, #4
    2c18: 29 03        	lsls	r1, r5, #12
    2c1a: a4 0d        	lsrs	r4, r4, #22
    2c1c: 00 20        	movs	r0, #0
    2c1e: 14 00        	movs	r4, r2
    2c20: 00 00        	movs	r0, r0
    2c22: 01 9c        	ldr	r4, [sp, #4]
    2c24: 6a 06        	lsls	r2, r5, #25
    2c26: 00 00        	movs	r0, r0
    2c28: 15 52        	strh	r5, [r2, r0]
    2c2a: 12 00        	movs	r2, r2
    2c2c: 00 01        	lsls	r0, r0, #4
    2c2e: 29 03        	lsls	r1, r5, #12
    2c30: 70 00        	lsls	r0, r6, #1
    2c32: 00 00        	movs	r0, r0
    2c34: 2d 06        	lsls	r5, r5, #24
    2c36: 00 00        	movs	r0, r0
    2c38: 16 99        	ldr	r1, [sp, #88]
    2c3a: 12 00        	movs	r2, r2
    2c3c: 00 01        	lsls	r0, r0, #4
    2c3e: 2b 03        	lsls	r3, r5, #12
    2c40: 70 00        	lsls	r0, r6, #1
    2c42: 00 00        	movs	r0, r0
    2c44: 4e 06        	lsls	r6, r1, #25
    2c46: 00 00        	movs	r0, r0
    2c48: 00 14        	asrs	r0, r0, #16
    2c4a: f2 11        	asrs	r2, r6, #7
    2c4c: 00 00        	movs	r0, r0
    2c4e: 01 5d        	ldrb	r1, [r0, r4]
    2c50: 03           	<unknown>
    2c51: b8 0d        	lsrs	r0, r7, #22
    2c53: 00 20        	movs	r0, #0
    2c55: b8 00        	lsls	r0, r7, #2
    2c57: 00 00        	movs	r0, r0
    2c59: 01 9c        	ldr	r4, [sp, #4]
    2c5b: ef 06        	lsls	r7, r5, #27
    2c5d: 00 00        	movs	r0, r0
    2c5f: 17 95        	str	r5, [sp, #92]
    2c61: 14 00        	movs	r4, r2
    2c63: 00 01        	lsls	r0, r0, #4
    2c65: 5d 03        	lsls	r5, r3, #13
    2c67: ef 06        	lsls	r7, r5, #27
    2c69: 00 00        	movs	r0, r0
    2c6b: 01 50        	str	r1, [r0, r0]
    2c6d: 19 74        	strb	r1, [r3, #16]
    2c6f: 6d 70        	strb	r5, [r5, #1]
    2c71: 00 01        	lsls	r0, r0, #4
    2c73: 5f 03        	lsls	r7, r3, #13
    2c75: 70 00        	lsls	r0, r6, #1
    2c77: 00 00        	movs	r0, r0
    2c79: 78 06        	lsls	r0, r7, #25
    2c7b: 00 00        	movs	r0, r0
    2c7d: 16           	<unknown>
    2c7e: f6 12        	asrs	r6, r6, #11
    2c80: 00 00        	movs	r0, r0
    2c82: 01 5f        	ldrsh	r1, [r0, r4]
    2c84: 03 70        	strb	r3, [r0]
    2c86: 00 00        	movs	r0, r0
    2c88: 00 0b        	lsrs	r0, r0, #12
    2c8a: 07 00        	movs	r7, r0
    2c8c: 00 16        	asrs	r0, r0, #24
    2c8e: c4 11        	asrs	r4, r0, #7
    2c90: 00 00        	movs	r0, r0
    2c92: 01 5f        	ldrsh	r1, [r0, r4]
    2c94: 03 70        	strb	r3, [r0]
    2c96: 00 00        	movs	r0, r0
    2c98: 00 4f        	ldr	r7, [pc, #0]            @ 0x2c9c <.debug_info+0x2c9c>
    2c9a: 07 00        	movs	r7, r0
    2c9c: 00 16        	asrs	r0, r0, #24
    2c9e: a9 11        	asrs	r1, r5, #6
    2ca0: 00 00        	movs	r0, r0
    2ca2: 01 5f        	ldrsh	r1, [r0, r4]
    2ca4: 03 70        	strb	r3, [r0]
    2ca6: 00 00        	movs	r0, r0
    2ca8: 00 91        	str	r1, [sp]
    2caa: 07 00        	movs	r7, r0
    2cac: 00 16        	asrs	r0, r0, #24
    2cae: 18 16        	asrs	r0, r3, #24
    2cb0: 00 00        	movs	r0, r0
    2cb2: 01 5f        	ldrsh	r1, [r0, r4]
    2cb4: 03 70        	strb	r3, [r0]
    2cb6: 00 00        	movs	r0, r0
    2cb8: 00           	<unknown>
    2cb9: bc 07        	lsls	r4, r7, #30
    2cbb: 00 00        	movs	r0, r0
    2cbd: 16 a4        	adr	r4, #88 <.debug_info+0x2cd7>
    2cbf: 11 00        	movs	r1, r2
    2cc1: 00 01        	lsls	r0, r0, #4
    2cc3: 5f 03        	lsls	r7, r3, #13
    2cc5: 70 00        	lsls	r0, r6, #1
    2cc7: 00 00        	movs	r0, r0
    2cc9: 00 08        	lsrs	r0, r0, #32
    2ccb: 00 00        	movs	r0, r0
    2ccd: 00 1a        	subs	r0, r0, r0
    2ccf: 04 fe 02 00  	cdp2	p0, #0, c0, c4, c2, #0
    2cd3: 00 14        	asrs	r0, r0, #16
    2cd5: 61 15        	asrs	r1, r4, #21
    2cd7: 00 00        	movs	r0, r0
    2cd9: 01 da        	bge	0x2cdf <.debug_info+0x2cdf> @ imm = #2
    2cdb: 03 70        	strb	r3, [r0]
    2cdd: 0e 00        	movs	r6, r1
    2cdf: 20 30        	adds	r0, #32
    2ce1: 00 00        	movs	r0, r0
    2ce3: 00 01        	lsls	r0, r0, #4
    2ce5: 9c 2c        	cmp	r4, #156
    2ce7: 07 00        	movs	r7, r0
    2ce9: 00 15        	asrs	r0, r0, #20
    2ceb: 43 15        	asrs	r3, r0, #21
    2ced: 00 00        	movs	r0, r0
    2cef: 01 da        	bge	0x2cf5 <.debug_info+0x2cf5> @ imm = #2
    2cf1: 03 70        	strb	r3, [r0]
    2cf3: 00 00        	movs	r0, r0
    2cf5: 00 36        	adds	r6, #0
    2cf7: 08 00        	movs	r0, r1
    2cf9: 00 16        	asrs	r0, r0, #24
    2cfb: 99 12        	asrs	r1, r3, #10
    2cfd: 00 00        	movs	r0, r0
    2cff: 01 dc        	bgt	0x2d05 <.debug_info+0x2d05> @ imm = #2
    2d01: 03 70        	strb	r3, [r0]
    2d03: 00 00        	movs	r0, r0
    2d05: 00 57        	ldrsb	r0, [r0, r4]
    2d07: 08 00        	movs	r0, r1
    2d09: 00 00        	movs	r0, r0
    2d0b: 14 f0 16 00  	ands	r0, r4, #22
    2d0f: 00 01        	lsls	r0, r0, #4
    2d11: fa 03        	lsls	r2, r7, #15
    2d13: a0 0e        	lsrs	r0, r4, #26
    2d15: 00 20        	movs	r0, #0
    2d17: 0c 00        	movs	r4, r1
    2d19: 00 00        	movs	r0, r0
    2d1b: 01 9c        	ldr	r4, [sp, #4]
    2d1d: 51 07        	lsls	r1, r2, #29
    2d1f: 00 00        	movs	r0, r0
    2d21: 17 ed 12 00  	ldc	p0, c0, [r7, #-72]
    2d25: 00 01        	lsls	r0, r0, #4
    2d27: fa 03        	lsls	r2, r7, #15
    2d29: fc 00        	lsls	r4, r7, #3
    2d2b: 00 00        	movs	r0, r0
    2d2d: 01 50        	str	r1, [r0, r0]
    2d2f: 00 14        	asrs	r0, r0, #16
    2d31: 86 15        	asrs	r6, r0, #22
    2d33: 00 00        	movs	r0, r0
    2d35: 01 0b        	lsrs	r1, r0, #12
    2d37: 04 ac        	add	r4, sp, #16
    2d39: 0e 00        	movs	r6, r1
    2d3b: 20 0c        	lsrs	r0, r4, #16
    2d3d: 00 00        	movs	r0, r0
    2d3f: 00 01        	lsls	r0, r0, #4
    2d41: 9c 76        	strb	r4, [r3, #26]
    2d43: 07 00        	movs	r7, r0
    2d45: 00 17        	asrs	r0, r0, #28
    2d47: ed 12        	asrs	r5, r5, #11
    2d49: 00 00        	movs	r0, r0
    2d4b: 01 0b        	lsrs	r1, r0, #12
    2d4d: 04           	<unknown>
    2d4e: fc 00        	lsls	r4, r7, #3
    2d50: 00 00        	movs	r0, r0
    2d52: 01 50        	str	r1, [r0, r0]
    2d54: 00 14        	asrs	r0, r0, #16
    2d56: 20 12        	asrs	r0, r4, #8
    2d58: 00 00        	movs	r0, r0
    2d5a: 01 1c        	adds	r1, r0, #0
    2d5c: 04           	<unknown>
    2d5d: b8 0e        	lsrs	r0, r7, #26
    2d5f: 00 20        	movs	r0, #0
    2d61: 0c 00        	movs	r4, r1
    2d63: 00 00        	movs	r0, r0
    2d65: 01 9c        	ldr	r4, [sp, #4]
    2d67: 9b 07        	lsls	r3, r3, #30
    2d69: 00 00        	movs	r0, r0
    2d6b: 17 cd        	ldm	r5!, {r0, r1, r2, r4}
    2d6d: 12 00        	movs	r2, r2
    2d6f: 00 01        	lsls	r0, r0, #4
    2d71: 1c 04        	lsls	r4, r3, #16
    2d73: 70 00        	lsls	r0, r6, #1
    2d75: 00 00        	movs	r0, r0
    2d77: 01 50        	str	r1, [r0, r0]
    2d79: 00 14        	asrs	r0, r0, #16
    2d7b: e7 0c        	lsrs	r7, r4, #19
    2d7d: 00 00        	movs	r0, r0
    2d7f: 01 43        	orrs	r1, r0
    2d81: 04 c4        	stm	r4!, {r2}
    2d83: 0e 00        	movs	r6, r1
    2d85: 20 1c        	adds	r0, r4, #0
    2d87: 00 00        	movs	r0, r0
    2d89: 00 01        	lsls	r0, r0, #4
    2d8b: 9c d0        	beq	0x2cc7 <.debug_info+0x2cc7> @ imm = #-200
    2d8d: 07 00        	movs	r7, r0
    2d8f: 00 15        	asrs	r0, r0, #20
    2d91: cb 14        	asrs	r3, r1, #19
    2d93: 00 00        	movs	r0, r0
    2d95: 01 43        	orrs	r1, r0
    2d97: 04 70        	strb	r4, [r0]
    2d99: 00 00        	movs	r0, r0
    2d9b: 00 76        	strb	r0, [r0, #24]
    2d9d: 08 00        	movs	r0, r1
    2d9f: 00 17        	asrs	r0, r0, #28
    2da1: ed 12        	asrs	r5, r5, #11
    2da3: 00 00        	movs	r0, r0
    2da5: 01 43        	orrs	r1, r0
    2da7: 04           	<unknown>
    2da8: fc 00        	lsls	r4, r7, #3
    2daa: 00 00        	movs	r0, r0
    2dac: 01 51        	str	r1, [r0, r4]
    2dae: 00 14        	asrs	r0, r0, #16
    2db0: fc 12        	asrs	r4, r7, #11
    2db2: 00 00        	movs	r0, r0
    2db4: 01 63        	str	r1, [r0, #48]
    2db6: 04 e0        	b	0x2dc2 <.debug_info+0x2dc2> @ imm = #8
    2db8: 0e 00        	movs	r6, r1
    2dba: 20 1c        	adds	r0, r4, #0
    2dbc: 00 00        	movs	r0, r0
    2dbe: 00 01        	lsls	r0, r0, #4
    2dc0: 9c 05        	lsls	r4, r3, #22
    2dc2: 08 00        	movs	r0, r1
    2dc4: 00 15        	asrs	r0, r0, #20
    2dc6: 95 11        	asrs	r5, r2, #6
    2dc8: 00 00        	movs	r0, r0
    2dca: 01 63        	str	r1, [r0, #48]
    2dcc: 04 70        	strb	r4, [r0]
    2dce: 00 00        	movs	r0, r0
    2dd0: 00 b0        	add	sp, #0
    2dd2: 08 00        	movs	r0, r1
    2dd4: 00 17        	asrs	r0, r0, #28
    2dd6: ed 12        	asrs	r5, r5, #11
    2dd8: 00 00        	movs	r0, r0
    2dda: 01 63        	str	r1, [r0, #48]
    2ddc: 04           	<unknown>
    2ddd: fc 00        	lsls	r4, r7, #3
    2ddf: 00 00        	movs	r0, r0
    2de1: 01 51        	str	r1, [r0, r4]
    2de3: 00 14        	asrs	r0, r0, #16
    2de5: 5b 12        	asrs	r3, r3, #9
    2de7: 00 00        	movs	r0, r0
    2de9: 01 7e        	ldrb	r1, [r0, #24]
    2deb: 04           	<unknown>
    2dec: fc 0e        	lsrs	r4, r7, #27
    2dee: 00 20        	movs	r0, #0
    2df0: 1c 00        	movs	r4, r3
    2df2: 00 00        	movs	r0, r0
    2df4: 01 9c        	ldr	r4, [sp, #4]
    2df6: 3a 08        	lsrs	r2, r7, #32
    2df8: 00 00        	movs	r0, r0
    2dfa: 15 7a        	ldrb	r5, [r2, #8]
    2dfc: 12 00        	movs	r2, r2
    2dfe: 00 01        	lsls	r0, r0, #4
    2e00: 7e 04        	lsls	r6, r7, #17
    2e02: 70 00        	lsls	r0, r6, #1
    2e04: 00 00        	movs	r0, r0
    2e06: ea 08        	lsrs	r2, r5, #3
    2e08: 00 00        	movs	r0, r0
    2e0a: 17 ed 12 00  	ldc	p0, c0, [r7, #-72]
    2e0e: 00 01        	lsls	r0, r0, #4
    2e10: 7e 04        	lsls	r6, r7, #17
    2e12: fc 00        	lsls	r4, r7, #3
    2e14: 00 00        	movs	r0, r0
    2e16: 01 51        	str	r1, [r0, r4]
    2e18: 00 14        	asrs	r0, r0, #16
    2e1a: d8 02        	lsls	r0, r3, #11
    2e1c: 00 00        	movs	r0, r0
    2e1e: 01 b0        	add	sp, #4
    2e20: 04 18        	adds	r4, r0, r0
    2e22: 0f 00        	movs	r7, r1
    2e24: 20 1c        	adds	r0, r4, #0
    2e26: 00 00        	movs	r0, r0
    2e28: 00 01        	lsls	r0, r0, #4
    2e2a: 9c 6f        	ldr	r4, [r3, #120]
    2e2c: 08 00        	movs	r0, r1
    2e2e: 00 15        	asrs	r0, r0, #20
    2e30: 8d 16        	asrs	r5, r1, #26
    2e32: 00 00        	movs	r0, r0
    2e34: 01 b0        	add	sp, #4
    2e36: 04 70        	strb	r4, [r0]
    2e38: 00 00        	movs	r0, r0
    2e3a: 00 24        	movs	r4, #0
    2e3c: 09 00        	movs	r1, r1
    2e3e: 00 17        	asrs	r0, r0, #28
    2e40: ed 12        	asrs	r5, r5, #11
    2e42: 00 00        	movs	r0, r0
    2e44: 01 b0        	add	sp, #4
    2e46: 04           	<unknown>
    2e47: fc 00        	lsls	r4, r7, #3
    2e49: 00 00        	movs	r0, r0
    2e4b: 01 51        	str	r1, [r0, r4]
    2e4d: 00 14        	asrs	r0, r0, #16
    2e4f: 32 16        	asrs	r2, r6, #24
    2e51: 00 00        	movs	r0, r0
    2e53: 01 d8        	bhi	0x2e59 <.debug_info+0x2e59> @ imm = #2
    2e55: 04 34        	adds	r4, #4
    2e57: 0f 00        	movs	r7, r1
    2e59: 20 1c        	adds	r0, r4, #0
    2e5b: 00 00        	movs	r0, r0
    2e5d: 00 01        	lsls	r0, r0, #4
    2e5f: 9c a4        	adr	r4, #624 <.debug_info+0x2eff>
    2e61: 08 00        	movs	r0, r1
    2e63: 00 15        	asrs	r0, r0, #20
    2e65: 6e 13        	asrs	r6, r5, #13
    2e67: 00 00        	movs	r0, r0
    2e69: 01 d8        	bhi	0x2e6f <.debug_info+0x2e6f> @ imm = #2
    2e6b: 04 70        	strb	r4, [r0]
    2e6d: 00 00        	movs	r0, r0
    2e6f: 00 5e        	ldrsh	r0, [r0, r0]
    2e71: 09 00        	movs	r1, r1
    2e73: 00 17        	asrs	r0, r0, #28
    2e75: ed 12        	asrs	r5, r5, #11
    2e77: 00 00        	movs	r0, r0
    2e79: 01 d8        	bhi	0x2e7f <.debug_info+0x2e7f> @ imm = #2
    2e7b: 04           	<unknown>
    2e7c: fc 00        	lsls	r4, r7, #3
    2e7e: 00 00        	movs	r0, r0
    2e80: 01 51        	str	r1, [r0, r4]
    2e82: 00 14        	asrs	r0, r0, #16
    2e84: e9 15        	asrs	r1, r5, #23
    2e86: 00 00        	movs	r0, r0
    2e88: 01           	<unknown>
    2e89: ff 04        	lsls	r7, r7, #19
    2e8b: 50 0f        	lsrs	r0, r2, #29
    2e8d: 00 20        	movs	r0, #0
    2e8f: 1c 00        	movs	r4, r3
    2e91: 00 00        	movs	r0, r0
    2e93: 01 9c        	ldr	r4, [sp, #4]
    2e95: d9 08        	lsrs	r1, r3, #3
    2e97: 00 00        	movs	r0, r0
    2e99: 15 cb        	ldm	r3!, {r0, r2, r4}
    2e9b: 14 00        	movs	r4, r2
    2e9d: 00 01        	lsls	r0, r0, #4
    2e9f: ff 04        	lsls	r7, r7, #19
    2ea1: 70 00        	lsls	r0, r6, #1
    2ea3: 00 00        	movs	r0, r0
    2ea5: 98 09        	lsrs	r0, r3, #6
    2ea7: 00 00        	movs	r0, r0
    2ea9: 17 ed 12 00  	ldc	p0, c0, [r7, #-72]
    2ead: 00 01        	lsls	r0, r0, #4
    2eaf: ff 04        	lsls	r7, r7, #19
    2eb1: fc 00        	lsls	r4, r7, #3
    2eb3: 00 00        	movs	r0, r0
    2eb5: 01 51        	str	r1, [r0, r4]
    2eb7: 00 14        	asrs	r0, r0, #16
    2eb9: b0 15        	asrs	r0, r6, #22
    2ebb: 00 00        	movs	r0, r0
    2ebd: 01 1c        	adds	r1, r0, #0
    2ebf: 05 6c        	ldr	r5, [r0, #64]
    2ec1: 0f 00        	movs	r7, r1
    2ec3: 20 1c        	adds	r0, r4, #0
    2ec5: 00 00        	movs	r0, r0
    2ec7: 00 01        	lsls	r0, r0, #4
    2ec9: 9c 0e        	lsrs	r4, r3, #26
    2ecb: 09 00        	movs	r1, r1
    2ecd: 00 15        	asrs	r0, r0, #20
    2ecf: 95 11        	asrs	r5, r2, #6
    2ed1: 00 00        	movs	r0, r0
    2ed3: 01 1c        	adds	r1, r0, #0
    2ed5: 05 70        	strb	r5, [r0]
    2ed7: 00 00        	movs	r0, r0
    2ed9: 00 d2        	bhs	0x2edd <.debug_info+0x2edd> @ imm = #0
    2edb: 09 00        	movs	r1, r1
    2edd: 00 17        	asrs	r0, r0, #28
    2edf: ed 12        	asrs	r5, r5, #11
    2ee1: 00 00        	movs	r0, r0
    2ee3: 01 1c        	adds	r1, r0, #0
    2ee5: 05           	<unknown>
    2ee6: fc 00        	lsls	r4, r7, #3
    2ee8: 00 00        	movs	r0, r0
    2eea: 01 51        	str	r1, [r0, r4]
    2eec: 00 14        	asrs	r0, r0, #16
    2eee: 99 15        	asrs	r1, r3, #22
    2ef0: 00 00        	movs	r0, r0
    2ef2: 01 34        	adds	r4, #1
    2ef4: 05 88        	ldrh	r5, [r0]
    2ef6: 0f 00        	movs	r7, r1
    2ef8: 20 1c        	adds	r0, r4, #0
    2efa: 00 00        	movs	r0, r0
    2efc: 00 01        	lsls	r0, r0, #4
    2efe: 9c 43        	bics	r4, r3
    2f00: 09 00        	movs	r1, r1
    2f02: 00 15        	asrs	r0, r0, #20
    2f04: 7a 12        	asrs	r2, r7, #9
    2f06: 00 00        	movs	r0, r0
    2f08: 01 34        	adds	r4, #1
    2f0a: 05 70        	strb	r5, [r0]
    2f0c: 00 00        	movs	r0, r0
    2f0e: 00 0c        	lsrs	r0, r0, #16
    2f10: 0a 00        	movs	r2, r1
    2f12: 00 17        	asrs	r0, r0, #28
    2f14: ed 12        	asrs	r5, r5, #11
    2f16: 00 00        	movs	r0, r0
    2f18: 01 34        	adds	r4, #1
    2f1a: 05           	<unknown>
    2f1b: fc 00        	lsls	r4, r7, #3
    2f1d: 00 00        	movs	r0, r0
    2f1f: 01 51        	str	r1, [r0, r4]
    2f21: 00 14        	asrs	r0, r0, #16
    2f23: 10 0e        	lsrs	r0, r2, #24
    2f25: 00 00        	movs	r0, r0
    2f27: 01 63        	str	r1, [r0, #48]
    2f29: 05 a4        	adr	r4, #20 <.debug_info+0x2f32>
    2f2b: 0f 00        	movs	r7, r1
    2f2d: 20 1c        	adds	r0, r4, #0
    2f2f: 00 00        	movs	r0, r0
    2f31: 00 01        	lsls	r0, r0, #4
    2f33: 9c 78        	ldrb	r4, [r3, #2]
    2f35: 09 00        	movs	r1, r1
    2f37: 00 15        	asrs	r0, r0, #20
    2f39: 8d 16        	asrs	r5, r1, #26
    2f3b: 00 00        	movs	r0, r0
    2f3d: 01 63        	str	r1, [r0, #48]
    2f3f: 05 70        	strb	r5, [r0]
    2f41: 00 00        	movs	r0, r0
    2f43: 00 46        	mov	r0, r0
    2f45: 0a 00        	movs	r2, r1
    2f47: 00 17        	asrs	r0, r0, #28
    2f49: ed 12        	asrs	r5, r5, #11
    2f4b: 00 00        	movs	r0, r0
    2f4d: 01 63        	str	r1, [r0, #48]
    2f4f: 05           	<unknown>
    2f50: fc 00        	lsls	r4, r7, #3
    2f52: 00 00        	movs	r0, r0
    2f54: 01 51        	str	r1, [r0, r4]
    2f56: 00 14        	asrs	r0, r0, #16
    2f58: c7 15        	asrs	r7, r0, #23
    2f5a: 00 00        	movs	r0, r0
    2f5c: 01 87        	strh	r1, [r0, #56]
    2f5e: 05 c0        	stm	r0!, {r0, r2}
    2f60: 0f 00        	movs	r7, r1
    2f62: 20 1c        	adds	r0, r4, #0
    2f64: 00 00        	movs	r0, r0
    2f66: 00 01        	lsls	r0, r0, #4
    2f68: 9c ad        	add	r5, sp, #624
    2f6a: 09 00        	movs	r1, r1
    2f6c: 00 15        	asrs	r0, r0, #20
    2f6e: 6e 13        	asrs	r6, r5, #13
    2f70: 00 00        	movs	r0, r0
    2f72: 01 87        	strh	r1, [r0, #56]
    2f74: 05 70        	strb	r5, [r0]
    2f76: 00 00        	movs	r0, r0
    2f78: 00 80        	strh	r0, [r0]
    2f7a: 0a 00        	movs	r2, r1
    2f7c: 00 17        	asrs	r0, r0, #28
    2f7e: ed 12        	asrs	r5, r5, #11
    2f80: 00 00        	movs	r0, r0
    2f82: 01 87        	strh	r1, [r0, #56]
    2f84: 05           	<unknown>
    2f85: fc 00        	lsls	r4, r7, #3
    2f87: 00 00        	movs	r0, r0
    2f89: 01 51        	str	r1, [r0, r4]
    2f8b: 00 14        	asrs	r0, r0, #16
    2f8d: d3 16        	asrs	r3, r2, #27
    2f8f: 00 00        	movs	r0, r0
    2f91: 01 b5        	push	{r0, lr}
    2f93: 05 dc        	bgt	0x2fa1 <.debug_info+0x2fa1> @ imm = #10
    2f95: 0f 00        	movs	r7, r1
    2f97: 20 1c        	adds	r0, r4, #0
    2f99: 00 00        	movs	r0, r0
    2f9b: 00 01        	lsls	r0, r0, #4
    2f9d: 9c e2        	b	0x34d9 <.debug_info+0x34d9> @ imm = #1336
    2f9f: 09 00        	movs	r1, r1
    2fa1: 00 15        	asrs	r0, r0, #20
    2fa3: cb 14        	asrs	r3, r1, #19
    2fa5: 00 00        	movs	r0, r0
    2fa7: 01 b5        	push	{r0, lr}
    2fa9: 05 70        	strb	r5, [r0]
    2fab: 00 00        	movs	r0, r0
    2fad: 00 ba        	rev	r0, r0
    2faf: 0a 00        	movs	r2, r1
    2fb1: 00 17        	asrs	r0, r0, #28
    2fb3: ed 12        	asrs	r5, r5, #11
    2fb5: 00 00        	movs	r0, r0
    2fb7: 01 b5        	push	{r0, lr}
    2fb9: 05           	<unknown>
    2fba: fc 00        	lsls	r4, r7, #3
    2fbc: 00 00        	movs	r0, r0
    2fbe: 01 51        	str	r1, [r0, r4]
    2fc0: 00 14        	asrs	r0, r0, #16
    2fc2: a0 14        	asrs	r0, r4, #18
    2fc4: 00 00        	movs	r0, r0
    2fc6: 01 d5        	bpl	0x2fcc <.debug_info+0x2fcc> @ imm = #2
    2fc8: 05 f8 0f 00  	strb.w	r0, [r5, pc]
    2fcc: 20 1c        	adds	r0, r4, #0
    2fce: 00 00        	movs	r0, r0
    2fd0: 00 01        	lsls	r0, r0, #4
    2fd2: 9c 17        	asrs	r4, r3, #30
    2fd4: 0a 00        	movs	r2, r1
    2fd6: 00 15        	asrs	r0, r0, #20
    2fd8: 95 11        	asrs	r5, r2, #6
    2fda: 00 00        	movs	r0, r0
    2fdc: 01 d5        	bpl	0x2fe2 <.debug_info+0x2fe2> @ imm = #2
    2fde: 05 70        	strb	r5, [r0]
    2fe0: 00 00        	movs	r0, r0
    2fe2: 00 f4 0a 00  	and	r0, r0, #9043968
    2fe6: 00 17        	asrs	r0, r0, #28
    2fe8: ed 12        	asrs	r5, r5, #11
    2fea: 00 00        	movs	r0, r0
    2fec: 01 d5        	bpl	0x2ff2 <.debug_info+0x2ff2> @ imm = #2
    2fee: 05           	<unknown>
    2fef: fc 00        	lsls	r4, r7, #3
    2ff1: 00 00        	movs	r0, r0
    2ff3: 01 51        	str	r1, [r0, r4]
    2ff5: 00 14        	asrs	r0, r0, #16
    2ff7: d5 11        	asrs	r5, r2, #7
    2ff9: 00 00        	movs	r0, r0
    2ffb: 01 f0 05 14  	and	r4, r1, #327685
    2fff: 10 00        	movs	r0, r2
    3001: 20 1c        	adds	r0, r4, #0
    3003: 00 00        	movs	r0, r0
    3005: 00 01        	lsls	r0, r0, #4
    3007: 9c 4c        	ldr	r4, [pc, #624]          @ 0x3278 <.debug_info+0x3278>
    3009: 0a 00        	movs	r2, r1
    300b: 00 15        	asrs	r0, r0, #20
    300d: 7a 12        	asrs	r2, r7, #9
    300f: 00 00        	movs	r0, r0
    3011: 01 f0 05 70  	and	r0, r1, #34865152
    3015: 00 00        	movs	r0, r0
    3017: 00 2e        	cmp	r6, #0
    3019: 0b 00        	movs	r3, r1
    301b: 00 17        	asrs	r0, r0, #28
    301d: ed 12        	asrs	r5, r5, #11
    301f: 00 00        	movs	r0, r0
    3021: 01 f0 05 fc  	bl	0x482f <.debug_info+0x482f> @ imm = #6154
    3025: 00 00        	movs	r0, r0
    3027: 00 01        	lsls	r0, r0, #4
    3029: 51 00        	lsls	r1, r2, #1
    302b: 14 54        	strb	r4, [r2, r0]
    302d: 16 00        	movs	r6, r2
    302f: 00 01        	lsls	r0, r0, #4
    3031: 22 06        	lsls	r2, r4, #24
    3033: 30 10        	asrs	r0, r6, #32
    3035: 00 20        	movs	r0, #0
    3037: 1c 00        	movs	r4, r3
    3039: 00 00        	movs	r0, r0
    303b: 01 9c        	ldr	r4, [sp, #4]
    303d: 81 0a        	lsrs	r1, r0, #10
    303f: 00 00        	movs	r0, r0
    3041: 15 8d        	ldrh	r5, [r2, #40]
    3043: 16 00        	movs	r6, r2
    3045: 00 01        	lsls	r0, r0, #4
    3047: 22 06        	lsls	r2, r4, #24
    3049: 70 00        	lsls	r0, r6, #1
    304b: 00 00        	movs	r0, r0
    304d: 68 0b        	lsrs	r0, r5, #13
    304f: 00 00        	movs	r0, r0
    3051: 17 ed 12 00  	ldc	p0, c0, [r7, #-72]
    3055: 00 01        	lsls	r0, r0, #4
    3057: 22 06        	lsls	r2, r4, #24
    3059: fc 00        	lsls	r4, r7, #3
    305b: 00 00        	movs	r0, r0
    305d: 01 51        	str	r1, [r0, r4]
    305f: 00 14        	asrs	r0, r0, #16
    3061: 16 15        	asrs	r6, r2, #20
    3063: 00 00        	movs	r0, r0
    3065: 01 4a        	ldr	r2, [pc, #4]            @ 0x306c <.debug_info+0x306c>
    3067: 06 4c        	ldr	r4, [pc, #24]           @ 0x3080 <.debug_info+0x3080>
    3069: 10 00        	movs	r0, r2
    306b: 20 1c        	adds	r0, r4, #0
    306d: 00 00        	movs	r0, r0
    306f: 00 01        	lsls	r0, r0, #4
    3071: 9c           	<unknown>
    3072: b6 0a        	lsrs	r6, r6, #10
    3074: 00 00        	movs	r0, r0
    3076: 15 6e        	ldr	r5, [r2, #96]
    3078: 13 00        	movs	r3, r2
    307a: 00 01        	lsls	r0, r0, #4
    307c: 4a 06        	lsls	r2, r1, #25
    307e: 70 00        	lsls	r0, r6, #1
    3080: 00 00        	movs	r0, r0
    3082: a2 0b        	lsrs	r2, r4, #14
    3084: 00 00        	movs	r0, r0
    3086: 17 ed 12 00  	ldc	p0, c0, [r7, #-72]
    308a: 00 01        	lsls	r0, r0, #4
    308c: 4a 06        	lsls	r2, r1, #25
    308e: fc 00        	lsls	r4, r7, #3
    3090: 00 00        	movs	r0, r0
    3092: 01 51        	str	r1, [r0, r4]
    3094: 00 14        	asrs	r0, r0, #16
    3096: 54 15        	asrs	r4, r2, #21
    3098: 00 00        	movs	r0, r0
    309a: 01 77        	strb	r1, [r0, #28]
    309c: 06 68        	ldr	r6, [r0]
    309e: 10 00        	movs	r0, r2
    30a0: 20 1c        	adds	r0, r4, #0
    30a2: 00 00        	movs	r0, r0
    30a4: 00 01        	lsls	r0, r0, #4
    30a6: 9c           	<unknown>
    30a7: eb 0a        	lsrs	r3, r5, #11
    30a9: 00 00        	movs	r0, r0
    30ab: 15 b5        	push	{r0, r2, r4, lr}
    30ad: 16 00        	movs	r6, r2
    30af: 00 01        	lsls	r0, r0, #4
    30b1: 77 06        	lsls	r7, r6, #25
    30b3: 4c 00        	lsls	r4, r1, #1
    30b5: 00 00        	movs	r0, r0
    30b7: dc 0b        	lsrs	r4, r3, #15
    30b9: 00 00        	movs	r0, r0
    30bb: 17 ed 12 00  	ldc	p0, c0, [r7, #-72]
    30bf: 00 01        	lsls	r0, r0, #4
    30c1: 77 06        	lsls	r7, r6, #25
    30c3: fc 00        	lsls	r4, r7, #3
    30c5: 00 00        	movs	r0, r0
    30c7: 01 51        	str	r1, [r0, r4]
    30c9: 00 1b        	subs	r0, r0, r4
    30cb: da 14        	asrs	r2, r3, #19
    30cd: 00 00        	movs	r0, r0
    30cf: 01 9b        	ldr	r3, [sp, #4]
    30d1: 06 ce        	ldm	r6!, {r1, r2}
    30d3: 00 00        	movs	r0, r0
    30d5: 00 84        	strh	r0, [r0, #32]
    30d7: 10 00        	movs	r0, r2
    30d9: 20 34        	adds	r4, #32
    30db: 00 00        	movs	r0, r0
    30dd: 00 01        	lsls	r0, r0, #4
    30df: 9c 46        	mov	r12, r3
    30e1: 0b 00        	movs	r3, r1
    30e3: 00 15        	asrs	r0, r0, #20
    30e5: bc 16        	asrs	r4, r7, #26
    30e7: 00 00        	movs	r0, r0
    30e9: 01 9b        	ldr	r3, [sp, #4]
    30eb: 06 4c        	ldr	r4, [pc, #24]           @ 0x3104 <.debug_info+0x3104>
    30ed: 00 00        	movs	r0, r0
    30ef: 00 16        	asrs	r0, r0, #24
    30f1: 0c 00        	movs	r4, r1
    30f3: 00 19        	adds	r0, r0, r4
    30f5: 74 6d        	ldr	r4, [r6, #84]
    30f7: 70 00        	lsls	r0, r6, #1
    30f9: 01 9d        	ldr	r5, [sp, #4]
    30fb: 06 70        	strb	r6, [r0]
    30fd: 00 00        	movs	r0, r0
    30ff: 00 37        	adds	r7, #0
    3101: 0c 00        	movs	r4, r1
    3103: 00 16        	asrs	r0, r0, #24
    3105: cb 11        	asrs	r3, r1, #7
    3107: 00 00        	movs	r0, r0
    3109: 01 9e        	ldr	r6, [sp, #4]
    310b: 06 70        	strb	r6, [r0]
    310d: 00 00        	movs	r0, r0
    310f: 00 b9        	cbnz	r0, 0x3113 <.debug_info+0x3113> @ imm = #0
    3111: 0c 00        	movs	r4, r1
    3113: 00 16        	asrs	r0, r0, #24
    3115: ab 16        	asrs	r3, r5, #26
    3117: 00 00        	movs	r0, r0
    3119: 01 9f        	ldr	r7, [sp, #4]
    311b: 06 ce        	ldm	r6!, {r1, r2}
    311d: 00 00        	movs	r0, r0
    311f: 00 06        	lsls	r0, r0, #24
    3121: 0d 00        	movs	r5, r1
    3123: 00 00        	movs	r0, r0
    3125: 1b 71        	strb	r3, [r3, #4]
    3127: 11 00        	movs	r1, r2
    3129: 00 01        	lsls	r0, r0, #4
    312b: 0b 01        	lsls	r3, r1, #4
    312d: 1e 01        	lsls	r6, r3, #4
    312f: 00 00        	movs	r0, r0
    3131: b8 10        	asrs	r0, r7, #2
    3133: 00 20        	movs	r0, #0
    3135: 34 00        	movs	r4, r6
    3137: 00 00        	movs	r0, r0
    3139: 01 9c        	ldr	r4, [sp, #4]
    313b: b4 0b        	lsrs	r4, r6, #14
    313d: 00 00        	movs	r0, r0
    313f: 1c 1b        	subs	r4, r3, r4
    3141: 13 00        	movs	r3, r2
    3143: 00 01        	lsls	r0, r0, #4
    3145: 0d 01        	lsls	r5, r1, #4
    3147: 9e 00        	lsls	r6, r3, #2
    3149: 00 00        	movs	r0, r0
    314b: 02 91        	str	r1, [sp, #8]
    314d: 74 16        	asrs	r4, r6, #25
    314f: 11 16        	asrs	r1, r2, #24
    3151: 00 00        	movs	r0, r0
    3153: 01 0e        	lsrs	r1, r0, #24
    3155: 01 1e        	subs	r1, r0, #0
    3157: 01 00        	movs	r1, r0
    3159: 00 25        	movs	r5, #0
    315b: 0d 00        	movs	r5, r1
    315d: 00 16        	asrs	r0, r0, #24
    315f: 0e 16        	asrs	r6, r1, #24
    3161: 00 00        	movs	r0, r0
    3163: 01 0f        	lsrs	r1, r0, #28
    3165: 01 ce        	ldm	r6!, {r0}
    3167: 00 00        	movs	r0, r0
    3169: 00 44        	add	r0, r0
    316b: 0d 00        	movs	r5, r1
    316d: 00 1d        	adds	r0, r0, #4
    316f: c6 10        	asrs	r6, r0, #3
    3171: 00 20        	movs	r0, #0
    3173: eb 0a        	lsrs	r3, r5, #11
    3175: 00 00        	movs	r0, r0
    3177: a3 0b        	lsrs	r3, r4, #14
    3179: 00 00        	movs	r0, r0
    317b: 1e 01        	lsls	r6, r3, #4
    317d: 50 02        	lsls	r0, r2, #9
    317f: 08 31        	adds	r1, #8
    3181: 00 1f        	subs	r0, r0, #4
    3183: de 10        	asrs	r6, r3, #3
    3185: 00 20        	movs	r0, #0
    3187: eb 0a        	lsrs	r3, r5, #11
    3189: 00 00        	movs	r0, r0
    318b: 1e 01        	lsls	r6, r3, #4
    318d: 50 02        	lsls	r0, r2, #9
    318f: 08 31        	adds	r1, #8
    3191: 00 00        	movs	r0, r0
    3193: 20 c5        	stm	r5!, {r5}
    3195: 16 00        	movs	r6, r2
    3197: 00 01        	lsls	r0, r0, #4
    3199: c8 06        	lsls	r0, r1, #27
    319b: ec 10        	asrs	r4, r5, #3
    319d: 00 20        	movs	r0, #0
    319f: 10 00        	movs	r0, r2
    31a1: 00 00        	movs	r0, r0
    31a3: 01 9c        	ldr	r4, [sp, #4]
    31a5: 1b 42        	tst	r3, r3
    31a7: 12 00        	movs	r2, r2
    31a9: 00 01        	lsls	r0, r0, #4
    31ab: db 06        	lsls	r3, r3, #27
    31ad: da 00        	lsls	r2, r3, #3
    31af: 00 00        	movs	r0, r0
    31b1: fc 10        	asrs	r4, r7, #3
    31b3: 00 20        	movs	r0, #0
    31b5: 14 00        	movs	r4, r2
    31b7: 00 00        	movs	r0, r0
    31b9: 01 9c        	ldr	r4, [sp, #4]
    31bb: 01 0c        	lsrs	r1, r0, #16
    31bd: 00 00        	movs	r0, r0
    31bf: 15 b5        	push	{r0, r2, r4, lr}
    31c1: 16 00        	movs	r6, r2
    31c3: 00 01        	lsls	r0, r0, #4
    31c5: db 06        	lsls	r3, r3, #27
    31c7: 4c 00        	lsls	r4, r1, #1
    31c9: 00 00        	movs	r0, r0
    31cb: 57 0d        	lsrs	r7, r2, #21
    31cd: 00 00        	movs	r0, r0
    31cf: 16 ab        	add	r3, sp, #88
    31d1: 16 00        	movs	r6, r2
    31d3: 00 01        	lsls	r0, r0, #4
    31d5: dd 06        	lsls	r5, r3, #27
    31d7: da 00        	lsls	r2, r3, #3
    31d9: 00 00        	movs	r0, r0
    31db: 91 0d        	lsrs	r1, r2, #22
    31dd: 00 00        	movs	r0, r0
    31df: 00 14        	asrs	r0, r0, #16
    31e1: ae 11        	asrs	r6, r5, #6
    31e3: 00 00        	movs	r0, r0
    31e5: 01           	<unknown>
    31e6: fc 06        	lsls	r4, r7, #27
    31e8: 10 11        	asrs	r0, r2, #4
    31ea: 00 20        	movs	r0, #0
    31ec: 0c 00        	movs	r4, r1
    31ee: 00 00        	movs	r0, r0
    31f0: 01 9c        	ldr	r4, [sp, #4]
    31f2: 26 0c        	lsrs	r6, r4, #16
    31f4: 00 00        	movs	r0, r0
    31f6: 17 b5        	push	{r0, r1, r2, r4, lr}
    31f8: 16 00        	movs	r6, r2
    31fa: 00 01        	lsls	r0, r0, #4
    31fc: fc 06        	lsls	r4, r7, #27
    31fe: 4c 00        	lsls	r4, r1, #1
    3200: 00 00        	movs	r0, r0
    3202: 01 50        	str	r1, [r0, r0]
    3204: 00 06        	lsls	r0, r0, #24
    3206: 4c 00        	lsls	r4, r1, #1
    3208: 00 00        	movs	r0, r0
    320a: 36 0c        	lsrs	r6, r6, #16
    320c: 00 00        	movs	r0, r0
    320e: 07 97        	str	r7, [sp, #28]
    3210: 00 00        	movs	r0, r0
    3212: 00 0f        	lsrs	r0, r0, #28
    3214: 00 21        	movs	r1, #0
    3216: 84 14        	asrs	r4, r0, #18
    3218: 00 00        	movs	r0, r0
    321a: 01 85        	strh	r1, [r0, #40]
    321c: 47 0c        	lsrs	r7, r0, #17
    321e: 00 00        	movs	r0, r0
    3220: 05 03        	lsls	r5, r0, #12
    3222: 5c 13        	asrs	r4, r3, #13
    3224: 00 20        	movs	r0, #0
    3226: 22 4c        	ldr	r4, [pc, #136]          @ 0x32b0 <.debug_info+0x32b0>
    3228: 0c 00        	movs	r4, r1
    322a: 00 05        	lsls	r0, r0, #20
    322c: 26 0c        	lsrs	r6, r4, #16
    322e: 00 00        	movs	r0, r0
    3230: 23           	<unknown>
    3231: f5 0b        	lsrs	r5, r6, #15
    3233: 00 00        	movs	r0, r0
    3235: 05 1a        	subs	r5, r0, r0
    3237: 05 b3        	cbz	r5, 0x327b <.debug_info+0x327b> @ imm = #64
    3239: 00 00        	movs	r0, r0
    323b: 00 00        	movs	r0, r0
    323d: ab 07        	lsls	r3, r5, #30
    323f: 00 00        	movs	r0, r0
    3241: 04 00        	movs	r4, r0
    3243: 34 08        	lsrs	r4, r6, #32
    3245: 00 00        	movs	r0, r0
    3247: 04 01        	lsls	r4, r0, #4
    3249: 7d 13        	asrs	r5, r7, #13
    324b: 00 00        	movs	r0, r0
    324d: 01 d9        	bls	0x3253 <.debug_info+0x3253> @ imm = #2
    324f: 17 00        	movs	r7, r2
    3251: 00           	<unknown>
    3252: ec 14        	asrs	r4, r5, #19
    3254: 00 00        	movs	r0, r0
    3256: 1c 11        	asrs	r4, r3, #4
    3258: 00 20        	movs	r0, #0
    325a: 3e 02        	lsls	r6, r7, #8
    325c: 00 00        	movs	r0, r0
    325e: 3f 08        	lsrs	r7, r7, #32
    3260: 00 00        	movs	r0, r0
    3262: 02 01        	lsls	r2, r0, #4
    3264: 06 05        	lsls	r6, r0, #20
    3266: 03 00        	movs	r3, r0
    3268: 00 02        	lsls	r0, r0, #8
    326a: 02 05        	lsls	r2, r0, #20
    326c: 4c 0b        	lsrs	r4, r1, #13
    326e: 00 00        	movs	r0, r0
    3270: 03 84        	strh	r3, [r0, #32]
    3272: 0d 00        	movs	r5, r1
    3274: 00 02        	lsls	r0, r0, #8
    3276: 28 3e        	subs	r6, #40
    3278: 00 00        	movs	r0, r0
    327a: 00 02        	lsls	r0, r0, #8
    327c: 04 05        	lsls	r4, r0, #20
    327e: cf 06        	lsls	r7, r1, #27
    3280: 00 00        	movs	r0, r0
    3282: 02 08        	lsrs	r2, r0, #32
    3284: 05 ca        	ldm	r2, {r0, r2}
    3286: 06 00        	movs	r6, r0
    3288: 00 03        	lsls	r0, r0, #12
    328a: 8b 01        	lsls	r3, r1, #6
    328c: 00 00        	movs	r0, r0
    328e: 02 2e        	cmp	r6, #2
    3290: 57 00        	lsls	r7, r2, #1
    3292: 00 00        	movs	r0, r0
    3294: 02 01        	lsls	r2, r0, #4
    3296: 08 03        	lsls	r0, r1, #12
    3298: 03 00        	movs	r3, r0
    329a: 00 03        	lsls	r0, r0, #12
    329c: ff 03        	lsls	r7, r7, #15
    329e: 00 00        	movs	r0, r0
    32a0: 02 31        	adds	r1, #2
    32a2: 69 00        	lsls	r1, r5, #1
    32a4: 00 00        	movs	r0, r0
    32a6: 02 02        	lsls	r2, r0, #8
    32a8: 07 09        	lsrs	r7, r0, #4
    32aa: 0d 00        	movs	r5, r1
    32ac: 00 03        	lsls	r0, r0, #12
    32ae: b7 06        	lsls	r7, r6, #26
    32b0: 00 00        	movs	r0, r0
    32b2: 02 34        	adds	r4, #2
    32b4: 7b 00        	lsls	r3, r7, #1
    32b6: 00 00        	movs	r0, r0
    32b8: 02 04        	lsls	r2, r0, #16
    32ba: 07 8f        	ldrh	r7, [r0, #56]
    32bc: 09 00        	movs	r1, r1
    32be: 00 02        	lsls	r0, r0, #8
    32c0: 08 07        	lsls	r0, r1, #28
    32c2: 8a 09        	lsrs	r2, r1, #6
    32c4: 00 00        	movs	r0, r0
    32c6: 04 04        	lsls	r4, r0, #16
    32c8: 05 69        	ldr	r5, [r0, #16]
    32ca: 6e 74        	strb	r6, [r5, #17]
    32cc: 00 02        	lsls	r0, r0, #8
    32ce: 04 07        	lsls	r4, r0, #28
    32d0: 94 09        	lsrs	r4, r2, #6
    32d2: 00 00        	movs	r0, r0
    32d4: 02 04        	lsls	r2, r0, #16
    32d6: 07 47        	bx	r0
    32d8: 00 00        	movs	r0, r0
    32da: 00 05        	lsls	r0, r0, #20
    32dc: 70 00        	lsls	r0, r6, #1
    32de: 00 00        	movs	r0, r0
    32e0: 06 70        	strb	r6, [r0]
    32e2: 00 00        	movs	r0, r0
    32e4: 00 b3        	cbz	r0, 0x3328 <.debug_info+0x3328> @ imm = #64
    32e6: 00 00        	movs	r0, r0
    32e8: 00 07        	lsls	r0, r0, #28
    32ea: 97 00        	lsls	r7, r2, #2
    32ec: 00 00        	movs	r0, r0
    32ee: 01 00        	movs	r1, r0
    32f0: 05 5e        	ldrsh	r5, [r0, r0]
    32f2: 00 00        	movs	r0, r0
    32f4: 00 05        	lsls	r0, r0, #20
    32f6: 33 00        	movs	r3, r6
    32f8: 00 00        	movs	r0, r0
    32fa: 08 01        	lsls	r0, r1, #4
    32fc: 03 1f        	subs	r3, r0, #4
    32fe: 01 d3        	blo	0x3304 <.debug_info+0x3304> @ imm = #2
    3300: 00 00        	movs	r0, r0
    3302: 00 09        	lsrs	r0, r0, #4
    3304: 00 08        	lsrs	r0, r0, #32
    3306: 00 00        	movs	r0, r0
    3308: 00 09        	lsrs	r0, r0, #4
    330a: ab 0b        	lsrs	r3, r5, #14
    330c: 00 00        	movs	r0, r0
    330e: 01 00        	movs	r1, r0
    3310: 0a 54        	strb	r2, [r1, r0]
    3312: 09 00        	movs	r1, r1
    3314: 00 03        	lsls	r0, r0, #12
    3316: 1f 01        	lsls	r7, r3, #4
    3318: bd 00        	lsls	r5, r7, #2
    331a: 00 00        	movs	r0, r0
    331c: 0b 28        	cmp	r0, #11
    331e: 03 8e        	ldrh	r3, [r0, #48]
    3320: 02 6b        	ldr	r2, [r0, #48]
    3322: 01 00        	movs	r1, r0
    3324: 00 0c        	lsrs	r0, r0, #16
    3326: 75 0c        	lsrs	r5, r6, #17
    3328: 00 00        	movs	r0, r0
    332a: 03 90        	str	r0, [sp, #12]
    332c: 02 9e        	ldr	r6, [sp, #8]
    332e: 00 00        	movs	r0, r0
    3330: 00 00        	movs	r0, r0
    3332: 0c 5b        	ldrh	r4, [r1, r4]
    3334: 0a 00        	movs	r2, r1
    3336: 00 03        	lsls	r0, r0, #12
    3338: 91 02        	lsls	r1, r2, #10
    333a: 9e 00        	lsls	r6, r3, #2
    333c: 00 00        	movs	r0, r0
    333e: 04 0c        	lsrs	r4, r0, #16
    3340: 70 06        	lsls	r0, r6, #25
    3342: 00 00        	movs	r0, r0
    3344: 03 92        	str	r2, [sp, #12]
    3346: 02 9e        	ldr	r6, [sp, #8]
    3348: 00 00        	movs	r0, r0
    334a: 00 08        	lsrs	r0, r0, #32
    334c: 0c da        	bge	0x3368 <.debug_info+0x3368> @ imm = #24
    334e: 07 00        	movs	r7, r0
    3350: 00 03        	lsls	r0, r0, #12
    3352: 93 02        	lsls	r3, r2, #10
    3354: 9e 00        	lsls	r6, r3, #2
    3356: 00 00        	movs	r0, r0
    3358: 0c 0d        	lsrs	r4, r1, #20
    335a: 49 44        	add	r1, r9
    335c: 52 00        	lsls	r2, r2, #1
    335e: 03 94        	str	r4, [sp, #12]
    3360: 02 9e        	ldr	r6, [sp, #8]
    3362: 00 00        	movs	r0, r0
    3364: 00 10        	asrs	r0, r0, #32
    3366: 0d 4f        	ldr	r7, [pc, #52]           @ 0x339c <.debug_info+0x339c>
    3368: 44 52        	strh	r4, [r0, r1]
    336a: 00 03        	lsls	r0, r0, #12
    336c: 95 02        	lsls	r5, r2, #10
    336e: 9e 00        	lsls	r6, r3, #2
    3370: 00 00        	movs	r0, r0
    3372: 14 0c        	lsrs	r4, r2, #16
    3374: 1a 08        	lsrs	r2, r3, #32
    3376: 00 00        	movs	r0, r0
    3378: 03 96        	str	r6, [sp, #12]
    337a: 02 b3        	cbz	r2, 0x33be <.debug_info+0x33be> @ imm = #64
    337c: 00 00        	movs	r0, r0
    337e: 00 18        	adds	r0, r0, r0
    3380: 0c 14        	asrs	r4, r1, #16
    3382: 08 00        	movs	r0, r1
    3384: 00 03        	lsls	r0, r0, #12
    3386: 97 02        	lsls	r7, r2, #10
    3388: b3 00        	lsls	r3, r6, #2
    338a: 00 00        	movs	r0, r0
    338c: 1a 0c        	lsrs	r2, r3, #16
    338e: 4e 06        	lsls	r6, r1, #25
    3390: 00 00        	movs	r0, r0
    3392: 03 98        	ldr	r0, [sp, #12]
    3394: 02 9e        	ldr	r6, [sp, #8]
    3396: 00 00        	movs	r0, r0
    3398: 00 1c        	adds	r0, r0, #0
    339a: 0d 41        	asrs	r5, r1
    339c: 46 52        	strh	r6, [r0, r1]
    339e: 00 03        	lsls	r0, r0, #12
    33a0: 99 02        	lsls	r1, r3, #10
    33a2: 6b 01        	lsls	r3, r5, #5
    33a4: 00 00        	movs	r0, r0
    33a6: 20 00        	movs	r0, r4
    33a8: 05 a3        	adr	r3, #20 <.debug_info+0x33b1>
    33aa: 00 00        	movs	r0, r0
    33ac: 00 0a        	lsrs	r0, r0, #8
    33ae: d5 0b        	lsrs	r5, r2, #15
    33b0: 00 00        	movs	r0, r0
    33b2: 03 9a        	ldr	r2, [sp, #12]
    33b4: 02 df        	svc	#2
    33b6: 00 00        	movs	r0, r0
    33b8: 00 0e        	lsrs	r0, r0, #24
    33ba: 01 04        	lsls	r1, r0, #16
    33bc: 40 9d        	ldr	r5, [sp, #256]
    33be: 01 00        	movs	r1, r0
    33c0: 00 09        	lsrs	r0, r0, #4
    33c2: 05 06        	lsls	r5, r0, #24
    33c4: 00 00        	movs	r0, r0
    33c6: 00 09        	lsrs	r0, r0, #4
    33c8: f7 04        	lsls	r7, r6, #19
    33ca: 00 00        	movs	r0, r0
    33cc: 01 09        	lsrs	r1, r0, #4
    33ce: 28 02        	lsls	r0, r5, #8
    33d0: 00 00        	movs	r0, r0
    33d2: 02 09        	lsrs	r2, r0, #4
    33d4: 4d 02        	lsls	r5, r1, #9
    33d6: 00 00        	movs	r0, r0
    33d8: 03 00        	movs	r3, r0
    33da: 03 11        	asrs	r3, r0, #4
    33dc: 0a 00        	movs	r2, r1
    33de: 00 04        	lsls	r0, r0, #16
    33e0: 45 7c        	ldrb	r5, [r0, #17]
    33e2: 01 00        	movs	r1, r0
    33e4: 00 0e        	lsrs	r0, r0, #24
    33e6: 01 04        	lsls	r1, r0, #16
    33e8: 4d bd        	pop	{r0, r2, r3, r6, pc}
    33ea: 01 00        	movs	r1, r0
    33ec: 00 09        	lsrs	r0, r0, #4
    33ee: 51 03        	lsls	r1, r2, #13
    33f0: 00 00        	movs	r0, r0
    33f2: 00 09        	lsrs	r0, r0, #4
    33f4: 9f 02        	lsls	r7, r3, #10
    33f6: 00 00        	movs	r0, r0
    33f8: 01 00        	movs	r1, r0
    33fa: 03 14        	asrs	r3, r0, #16
    33fc: 01 00        	movs	r1, r0
    33fe: 00 04        	lsls	r0, r0, #16
    3400: 50 a8        	add	r0, sp, #320
    3402: 01 00        	movs	r1, r0
    3404: 00 0e        	lsrs	r0, r0, #24
    3406: 01 04        	lsls	r1, r0, #16
    3408: 58 e9 01 00  	ldrd	r0, r0, [r8, #-4]
    340c: 00 09        	lsrs	r0, r0, #4
    340e: d8 0a        	lsrs	r0, r3, #11
    3410: 00 00        	movs	r0, r0
    3412: 00 09        	lsrs	r0, r0, #4
    3414: 16 04        	lsls	r6, r2, #16
    3416: 00 00        	movs	r0, r0
    3418: 01 09        	lsrs	r1, r0, #4
    341a: 2c 04        	lsls	r4, r5, #16
    341c: 00 00        	movs	r0, r0
    341e: 02 09        	lsrs	r2, r0, #4
    3420: 30 01        	lsls	r0, r6, #4
    3422: 00 00        	movs	r0, r0
    3424: 03 00        	movs	r3, r0
    3426: 03           	<unknown>
    3427: e8 0a        	lsrs	r0, r5, #11
    3429: 00 00        	movs	r0, r0
    342b: 04 5d        	ldrb	r4, [r0, r4]
    342d: c8 01        	lsls	r0, r1, #7
    342f: 00 00        	movs	r0, r0
    3431: 0e 01        	lsls	r6, r1, #4
    3433: 04 65        	str	r4, [r0, #80]
    3435: 0f 02        	lsls	r7, r1, #8
    3437: 00 00        	movs	r0, r0
    3439: 09           	<unknown>
    343a: b7 00        	lsls	r7, r6, #2
    343c: 00 00        	movs	r0, r0
    343e: 00 09        	lsrs	r0, r0, #4
    3440: b4 0c        	lsrs	r4, r6, #18
    3442: 00 00        	movs	r0, r0
    3444: 01 09        	lsrs	r1, r0, #4
    3446: c2 01        	lsls	r2, r0, #7
    3448: 00 00        	movs	r0, r0
    344a: 02 00        	movs	r2, r0
    344c: 03 d1        	bne	0x3456 <.debug_info+0x3456> @ imm = #6
    344e: 03 00        	movs	r3, r0
    3450: 00 04        	lsls	r0, r0, #16
    3452: 69 f4 01 00  	orn	r0, r9, #8454144
    3456: 00 0e        	lsrs	r0, r0, #24
    3458: 01 04        	lsls	r1, r0, #16
    345a: 71 2f        	cmp	r7, #113
    345c: 02 00        	movs	r2, r0
    345e: 00 09        	lsrs	r0, r0, #4
    3460: 3d 17        	asrs	r5, r7, #28
    3462: 00 00        	movs	r0, r0
    3464: 00 09        	lsrs	r0, r0, #4
    3466: 05 17        	asrs	r5, r0, #28
    3468: 00 00        	movs	r0, r0
    346a: 01 00        	movs	r1, r0
    346c: 03           	<unknown>
    346d: fa 17        	asrs	r2, r7, #31
    346f: 00 00        	movs	r0, r0
    3471: 04 74        	strb	r4, [r0, #16]
    3473: 1a 02        	lsls	r2, r3, #8
    3475: 00 00        	movs	r0, r0
    3477: 0f 08        	lsrs	r7, r1, #32
    3479: 04 7b        	ldrb	r4, [r0, #12]
    347b: 7f 02        	lsls	r7, r7, #9
    347d: 00 00        	movs	r0, r0
    347f: 10 0c        	lsrs	r0, r2, #16
    3481: 0b 00        	movs	r3, r1
    3483: 00 04        	lsls	r0, r0, #16
    3485: 7d 70        	strb	r5, [r7, #1]
    3487: 00 00        	movs	r0, r0
    3489: 00 00        	movs	r0, r0
    348b: 10 d9        	bls	0x34af <.debug_info+0x34af> @ imm = #32
    348d: 09 00        	movs	r1, r1
    348f: 00 04        	lsls	r0, r0, #16
    3491: 80 9d        	ldr	r5, [sp, #512]
    3493: 01 00        	movs	r1, r0
    3495: 00 04        	lsls	r0, r0, #16
    3497: 10 94        	str	r4, [sp, #64]
    3499: 08 00        	movs	r0, r1
    349b: 00 04        	lsls	r0, r0, #16
    349d: 83           	<unknown>
    349e: e9 01        	lsls	r1, r5, #7
    34a0: 00 00        	movs	r0, r0
    34a2: 05 10        	asrs	r5, r0, #32
    34a4: aa 06        	lsls	r2, r5, #26
    34a6: 00 00        	movs	r0, r0
    34a8: 04 86        	strh	r4, [r0, #48]
    34aa: bd 01        	lsls	r5, r7, #6
    34ac: 00 00        	movs	r0, r0
    34ae: 06 10        	asrs	r6, r0, #32
    34b0: 22 0b        	lsrs	r2, r4, #12
    34b2: 00 00        	movs	r0, r0
    34b4: 04 89        	ldrh	r4, [r0, #8]
    34b6: 0f 02        	lsls	r7, r1, #8
    34b8: 00 00        	movs	r0, r0
    34ba: 07 00        	movs	r7, r0
    34bc: 03 ad        	add	r5, sp, #12
    34be: 02 00        	movs	r2, r0
    34c0: 00 04        	lsls	r0, r0, #16
    34c2: 8b 3a        	subs	r2, #139
    34c4: 02 00        	movs	r2, r0
    34c6: 00 11        	asrs	r0, r0, #4
    34c8: 5c 17        	asrs	r4, r3, #29
    34ca: 00 00        	movs	r0, r0
    34cc: 01 7e        	ldrb	r1, [r0, #24]
    34ce: 1c 11        	asrs	r4, r3, #4
    34d0: 00 20        	movs	r0, #0
    34d2: 04 01        	lsls	r4, r0, #4
    34d4: 00 00        	movs	r0, r0
    34d6: 01 9c        	ldr	r4, [sp, #4]
    34d8: 65 04        	lsls	r5, r4, #17
    34da: 00 00        	movs	r0, r0
    34dc: 12 04        	lsls	r2, r2, #16
    34de: 18 00        	movs	r0, r3
    34e0: 00 01        	lsls	r0, r0, #4
    34e2: 7e 65        	str	r6, [r7, #84]
    34e4: 04 00        	movs	r4, r0
    34e6: 00 b0        	add	sp, #0
    34e8: 0d 00        	movs	r5, r1
    34ea: 00 13        	asrs	r0, r0, #12
    34ec: 2c 11        	asrs	r4, r5, #4
    34ee: 00 20        	movs	r0, #0
    34f0: 9b 07        	lsls	r3, r3, #30
    34f2: 00 00        	movs	r0, r0
    34f4: c6 02        	lsls	r6, r0, #11
    34f6: 00 00        	movs	r0, r0
    34f8: 14 01        	lsls	r4, r2, #4
    34fa: 51 01        	lsls	r1, r2, #5
    34fc: 31 14        	asrs	r1, r6, #16
    34fe: 01 50        	str	r1, [r0, r0]
    3500: 01 31        	adds	r1, #1
    3502: 00 13        	asrs	r0, r0, #12
    3504: 34 11        	asrs	r4, r6, #4
    3506: 00 20        	movs	r0, #0
    3508: 9b 07        	lsls	r3, r3, #30
    350a: 00 00        	movs	r0, r0
    350c: de 02        	lsls	r6, r3, #11
    350e: 00 00        	movs	r0, r0
    3510: 14 01        	lsls	r4, r2, #4
    3512: 51 01        	lsls	r1, r2, #5
    3514: 30 14        	asrs	r0, r6, #16
    3516: 01 50        	str	r1, [r0, r0]
    3518: 01 31        	adds	r1, #1
    351a: 00 13        	asrs	r0, r0, #12
    351c: 44 11        	asrs	r4, r0, #5
    351e: 00 20        	movs	r0, #0
    3520: 9b 07        	lsls	r3, r3, #30
    3522: 00 00        	movs	r0, r0
    3524: f6 02        	lsls	r6, r6, #11
    3526: 00 00        	movs	r0, r0
    3528: 14 01        	lsls	r4, r2, #4
    352a: 51 01        	lsls	r1, r2, #5
    352c: 31 14        	asrs	r1, r6, #16
    352e: 01 50        	str	r1, [r0, r0]
    3530: 01 32        	adds	r2, #1
    3532: 00 13        	asrs	r0, r0, #12
    3534: 4c 11        	asrs	r4, r1, #5
    3536: 00 20        	movs	r0, #0
    3538: 9b 07        	lsls	r3, r3, #30
    353a: 00 00        	movs	r0, r0
    353c: 0e 03        	lsls	r6, r1, #12
    353e: 00 00        	movs	r0, r0
    3540: 14 01        	lsls	r4, r2, #4
    3542: 51 01        	lsls	r1, r2, #5
    3544: 30 14        	asrs	r0, r6, #16
    3546: 01 50        	str	r1, [r0, r0]
    3548: 01 32        	adds	r2, #1
    354a: 00 13        	asrs	r0, r0, #12
    354c: 5c 11        	asrs	r4, r3, #5
    354e: 00 20        	movs	r0, #0
    3550: 9b 07        	lsls	r3, r3, #30
    3552: 00 00        	movs	r0, r0
    3554: 26 03        	lsls	r6, r4, #12
    3556: 00 00        	movs	r0, r0
    3558: 14 01        	lsls	r4, r2, #4
    355a: 51 01        	lsls	r1, r2, #5
    355c: 31 14        	asrs	r1, r6, #16
    355e: 01 50        	str	r1, [r0, r0]
    3560: 01 34        	adds	r4, #1
    3562: 00 13        	asrs	r0, r0, #12
    3564: 64 11        	asrs	r4, r4, #5
    3566: 00 20        	movs	r0, #0
    3568: 9b 07        	lsls	r3, r3, #30
    356a: 00 00        	movs	r0, r0
    356c: 3e 03        	lsls	r6, r7, #12
    356e: 00 00        	movs	r0, r0
    3570: 14 01        	lsls	r4, r2, #4
    3572: 51 01        	lsls	r1, r2, #5
    3574: 30 14        	asrs	r0, r6, #16
    3576: 01 50        	str	r1, [r0, r0]
    3578: 01 34        	adds	r4, #1
    357a: 00 13        	asrs	r0, r0, #12
    357c: 74 11        	asrs	r4, r6, #5
    357e: 00 20        	movs	r0, #0
    3580: 9b 07        	lsls	r3, r3, #30
    3582: 00 00        	movs	r0, r0
    3584: 56 03        	lsls	r6, r2, #13
    3586: 00 00        	movs	r0, r0
    3588: 14 01        	lsls	r4, r2, #4
    358a: 51 01        	lsls	r1, r2, #5
    358c: 31 14        	asrs	r1, r6, #16
    358e: 01 50        	str	r1, [r0, r0]
    3590: 01 38        	subs	r0, #1
    3592: 00 13        	asrs	r0, r0, #12
    3594: 7c 11        	asrs	r4, r7, #5
    3596: 00 20        	movs	r0, #0
    3598: 9b 07        	lsls	r3, r3, #30
    359a: 00 00        	movs	r0, r0
    359c: 6e 03        	lsls	r6, r5, #13
    359e: 00 00        	movs	r0, r0
    35a0: 14 01        	lsls	r4, r2, #4
    35a2: 51 01        	lsls	r1, r2, #5
    35a4: 30 14        	asrs	r0, r6, #16
    35a6: 01 50        	str	r1, [r0, r0]
    35a8: 01 38        	subs	r0, #1
    35aa: 00 13        	asrs	r0, r0, #12
    35ac: 8c 11        	asrs	r4, r1, #6
    35ae: 00 20        	movs	r0, #0
    35b0: 9b 07        	lsls	r3, r3, #30
    35b2: 00 00        	movs	r0, r0
    35b4: 86 03        	lsls	r6, r0, #14
    35b6: 00 00        	movs	r0, r0
    35b8: 14 01        	lsls	r4, r2, #4
    35ba: 51 01        	lsls	r1, r2, #5
    35bc: 31 14        	asrs	r1, r6, #16
    35be: 01 50        	str	r1, [r0, r0]
    35c0: 01 40        	ands	r1, r0
    35c2: 00 13        	asrs	r0, r0, #12
    35c4: 94 11        	asrs	r4, r2, #6
    35c6: 00 20        	movs	r0, #0
    35c8: 9b 07        	lsls	r3, r3, #30
    35ca: 00 00        	movs	r0, r0
    35cc: 9e 03        	lsls	r6, r3, #14
    35ce: 00 00        	movs	r0, r0
    35d0: 14 01        	lsls	r4, r2, #4
    35d2: 51 01        	lsls	r1, r2, #5
    35d4: 30 14        	asrs	r0, r6, #16
    35d6: 01 50        	str	r1, [r0, r0]
    35d8: 01 40        	ands	r1, r0
    35da: 00 13        	asrs	r0, r0, #12
    35dc: a4 11        	asrs	r4, r4, #6
    35de: 00 20        	movs	r0, #0
    35e0: 9b 07        	lsls	r3, r3, #30
    35e2: 00 00        	movs	r0, r0
    35e4: b7 03        	lsls	r7, r6, #14
    35e6: 00 00        	movs	r0, r0
    35e8: 14 01        	lsls	r4, r2, #4
    35ea: 51 01        	lsls	r1, r2, #5
    35ec: 31 14        	asrs	r1, r6, #16
    35ee: 01 50        	str	r1, [r0, r0]
    35f0: 02 08        	lsrs	r2, r0, #32
    35f2: 20 00        	movs	r0, r4
    35f4: 13 ac        	add	r4, sp, #76
    35f6: 11 00        	movs	r1, r2
    35f8: 20 9b        	ldr	r3, [sp, #128]
    35fa: 07 00        	movs	r7, r0
    35fc: 00 d0        	beq	0x3600 <.debug_info+0x3600> @ imm = #0
    35fe: 03 00        	movs	r3, r0
    3600: 00 14        	asrs	r0, r0, #16
    3602: 01 51        	str	r1, [r0, r4]
    3604: 01 30        	adds	r0, #1
    3606: 14 01        	lsls	r4, r2, #4
    3608: 50 02        	lsls	r0, r2, #9
    360a: 08 20        	movs	r0, #8
    360c: 00 13        	asrs	r0, r0, #12
    360e: bc 11        	asrs	r4, r7, #6
    3610: 00 20        	movs	r0, #0
    3612: 9b 07        	lsls	r3, r3, #30
    3614: 00 00        	movs	r0, r0
    3616: e9 03        	lsls	r1, r5, #15
    3618: 00 00        	movs	r0, r0
    361a: 14 01        	lsls	r4, r2, #4
    361c: 51 01        	lsls	r1, r2, #5
    361e: 31 14        	asrs	r1, r6, #16
    3620: 01 50        	str	r1, [r0, r0]
    3622: 02 08        	lsrs	r2, r0, #32
    3624: 40 00        	lsls	r0, r0, #1
    3626: 13 c4        	stm	r4!, {r0, r1, r4}
    3628: 11 00        	movs	r1, r2
    362a: 20 9b        	ldr	r3, [sp, #128]
    362c: 07 00        	movs	r7, r0
    362e: 00 02        	lsls	r0, r0, #8
    3630: 04 00        	movs	r4, r0
    3632: 00 14        	asrs	r0, r0, #16
    3634: 01 51        	str	r1, [r0, r4]
    3636: 01 30        	adds	r0, #1
    3638: 14 01        	lsls	r4, r2, #4
    363a: 50 02        	lsls	r0, r2, #9
    363c: 08 40        	ands	r0, r1
    363e: 00 13        	asrs	r0, r0, #12
    3640: d4 11        	asrs	r4, r2, #7
    3642: 00 20        	movs	r0, #0
    3644: 9b 07        	lsls	r3, r3, #30
    3646: 00 00        	movs	r0, r0
    3648: 1b 04        	lsls	r3, r3, #16
    364a: 00 00        	movs	r0, r0
    364c: 14 01        	lsls	r4, r2, #4
    364e: 51 01        	lsls	r1, r2, #5
    3650: 31 14        	asrs	r1, r6, #16
    3652: 01 50        	str	r1, [r0, r0]
    3654: 02 08        	lsrs	r2, r0, #32
    3656: 80 00        	lsls	r0, r0, #2
    3658: 13 dc        	bgt	0x3682 <.debug_info+0x3682> @ imm = #38
    365a: 11 00        	movs	r1, r2
    365c: 20 9b        	ldr	r3, [sp, #128]
    365e: 07 00        	movs	r7, r0
    3660: 00 34        	adds	r4, #0
    3662: 04 00        	movs	r4, r0
    3664: 00 14        	asrs	r0, r0, #16
    3666: 01 51        	str	r1, [r0, r4]
    3668: 01 30        	adds	r0, #1
    366a: 14 01        	lsls	r4, r2, #4
    366c: 50 02        	lsls	r0, r2, #9
    366e: 08 80        	strh	r0, [r1]
    3670: 00 13        	asrs	r0, r0, #12
    3672: ee 11        	asrs	r6, r5, #7
    3674: 00 20        	movs	r0, #0
    3676: 9b 07        	lsls	r3, r3, #30
    3678: 00 00        	movs	r0, r0
    367a: 4e 04        	lsls	r6, r1, #17
    367c: 00 00        	movs	r0, r0
    367e: 14 01        	lsls	r4, r2, #4
    3680: 51 01        	lsls	r1, r2, #5
    3682: 31 14        	asrs	r1, r6, #16
    3684: 01 50        	str	r1, [r0, r0]
    3686: 03 0a        	lsrs	r3, r0, #8
    3688: 00 01        	lsls	r0, r0, #4
    368a: 00 15        	asrs	r0, r0, #20
    368c: f8 11        	asrs	r0, r7, #7
    368e: 00 20        	movs	r0, #0
    3690: 9b 07        	lsls	r3, r3, #30
    3692: 00 00        	movs	r0, r0
    3694: 14 01        	lsls	r4, r2, #4
    3696: 51 01        	lsls	r1, r2, #5
    3698: 30 14        	asrs	r0, r6, #16
    369a: 01 50        	str	r1, [r0, r0]
    369c: 03 0a        	lsrs	r3, r0, #8
    369e: 00 01        	lsls	r0, r0, #4
    36a0: 00 00        	movs	r0, r0
    36a2: 16 04        	lsls	r6, r2, #16
    36a4: 70 01        	lsls	r0, r6, #5
    36a6: 00 00        	movs	r0, r0
    36a8: 11 cf        	ldm	r7!, {r0, r4}
    36aa: 04 00        	movs	r4, r0
    36ac: 00 01        	lsls	r0, r0, #4
    36ae: bc 20        	movs	r0, #188
    36b0: 12 00        	movs	r2, r2
    36b2: 20 82        	strh	r0, [r4, #16]
    36b4: 00 00        	movs	r0, r0
    36b6: 00 01        	lsls	r0, r0, #4
    36b8: 9c c8        	ldm	r0!, {r2, r3, r4, r7}
    36ba: 04 00        	movs	r4, r0
    36bc: 00 17        	asrs	r0, r0, #28
    36be: 04 18        	adds	r4, r0, r0
    36c0: 00 00        	movs	r0, r0
    36c2: 01 bc        	pop	{r0}
    36c4: 65 04        	lsls	r5, r4, #17
    36c6: 00 00        	movs	r0, r0
    36c8: 01 50        	str	r1, [r0, r0]
    36ca: 17 31        	adds	r1, #23
    36cc: 18 00        	movs	r0, r3
    36ce: 00 01        	lsls	r0, r0, #4
    36d0: bc c8        	ldm	r0!, {r2, r3, r4, r5, r7}
    36d2: 04 00        	movs	r4, r0
    36d4: 00 01        	lsls	r0, r0, #4
    36d6: 51 18        	adds	r1, r2, r1
    36d8: fe 16        	asrs	r6, r7, #27
    36da: 00 00        	movs	r0, r0
    36dc: 01 be        	bkpt	#1
    36de: 70 00        	lsls	r0, r6, #1
    36e0: 00 00        	movs	r0, r0
    36e2: 99 0e        	lsrs	r1, r3, #26
    36e4: 00 00        	movs	r0, r0
    36e6: 19 70        	strb	r1, [r3]
    36e8: 6f 73        	strb	r7, [r5, #13]
    36ea: 00 01        	lsls	r0, r0, #4
    36ec: be 70        	strb	r6, [r7, #2]
    36ee: 00 00        	movs	r0, r0
    36f0: 00           	<unknown>
    36f1: b8 0e        	lsrs	r0, r7, #26
    36f3: 00 00        	movs	r0, r0
    36f5: 18 c3        	stm	r3!, {r3, r4}
    36f7: 17 00        	movs	r7, r2
    36f9: 00 01        	lsls	r0, r0, #4
    36fb: be 70        	strb	r6, [r7, #2]
    36fd: 00 00        	movs	r0, r0
    36ff: 00 05        	lsls	r0, r0, #20
    3701: 0f 00        	movs	r7, r1
    3703: 00 00        	movs	r0, r0
    3705: 16 04        	lsls	r6, r2, #16
    3707: 7f 02        	lsls	r7, r7, #9
    3709: 00 00        	movs	r0, r0
    370b: 11 26        	movs	r6, #17
    370d: 17 00        	movs	r7, r2
    370f: 00 01        	lsls	r0, r0, #4
    3711: f0 a4        	adr	r4, #960 <.debug_info+0x3805>
    3713: 12 00        	movs	r2, r2
    3715: 20 12        	asrs	r0, r4, #8
    3717: 00 00        	movs	r0, r0
    3719: 00 01        	lsls	r0, r0, #4
    371b: 9c           	<unknown>
    371c: f1 04        	lsls	r1, r6, #19
    371e: 00 00        	movs	r0, r0
    3720: 17 31        	adds	r1, #23
    3722: 18 00        	movs	r0, r3
    3724: 00 01        	lsls	r0, r0, #4
    3726: f0 c8        	ldm	r0!, {r4, r5, r6, r7}
    3728: 04 00        	movs	r4, r0
    372a: 00 01        	lsls	r0, r0, #4
    372c: 50 00        	lsls	r0, r2, #1
    372e: 1a b0        	add	sp, #104
    3730: 17 00        	movs	r7, r2
    3732: 00 01        	lsls	r0, r0, #4
    3734: 05 01        	lsls	r5, r0, #4
    3736: b8 12        	asrs	r0, r7, #10
    3738: 00 20        	movs	r0, #0
    373a: 24 00        	movs	r4, r4
    373c: 00 00        	movs	r0, r0
    373e: 01 9c        	ldr	r4, [sp, #4]
    3740: 33 05        	lsls	r3, r6, #20
    3742: 00 00        	movs	r0, r0
    3744: 1b 04        	lsls	r3, r3, #16
    3746: 18 00        	movs	r0, r3
    3748: 00 01        	lsls	r0, r0, #4
    374a: 05 01        	lsls	r5, r0, #4
    374c: 65 04        	lsls	r5, r4, #17
    374e: 00 00        	movs	r0, r0
    3750: 01 50        	str	r1, [r0, r0]
    3752: 1b 0c        	lsrs	r3, r3, #16
    3754: 0b 00        	movs	r3, r1
    3756: 00 01        	lsls	r0, r0, #4
    3758: 05 01        	lsls	r5, r0, #4
    375a: 5e 00        	lsls	r6, r3, #1
    375c: 00 00        	movs	r0, r0
    375e: 01 51        	str	r1, [r0, r4]
    3760: 1c 74        	strb	r4, [r3, #16]
    3762: 6d 70        	strb	r5, [r5, #1]
    3764: 00 01        	lsls	r0, r0, #4
    3766: 07 01        	lsls	r7, r0, #4
    3768: 9e 00        	lsls	r6, r3, #2
    376a: 00 00        	movs	r0, r0
    376c: 02 91        	str	r1, [sp, #8]
    376e: 7c 00        	lsls	r4, r7, #1
    3770: 1d 68        	ldr	r5, [r3]
    3772: 17 00        	movs	r7, r2
    3774: 00 01        	lsls	r0, r0, #4
    3776: 31 01        	lsls	r1, r6, #4
    3778: 4c 00        	lsls	r4, r1, #1
    377a: 00 00        	movs	r0, r0
    377c: dc 12        	asrs	r4, r3, #11
    377e: 00 20        	movs	r0, #0
    3780: 0e 00        	movs	r6, r1
    3782: 00 00        	movs	r0, r0
    3784: 01 9c        	ldr	r4, [sp, #4]
    3786: 7c 05        	lsls	r4, r7, #21
    3788: 00 00        	movs	r0, r0
    378a: 1e 04        	lsls	r6, r3, #16
    378c: 18 00        	movs	r0, r3
    378e: 00 01        	lsls	r0, r0, #4
    3790: 31 01        	lsls	r1, r6, #4
    3792: 65 04        	lsls	r5, r4, #17
    3794: 00 00        	movs	r0, r0
    3796: 48 0f        	lsrs	r0, r1, #29
    3798: 00 00        	movs	r0, r0
    379a: 1b 0c        	lsrs	r3, r3, #16
    379c: 0b 00        	movs	r3, r1
    379e: 00 01        	lsls	r0, r0, #4
    37a0: 31 01        	lsls	r1, r6, #4
    37a2: 5e 00        	lsls	r6, r3, #1
    37a4: 00 00        	movs	r0, r0
    37a6: 01 51        	str	r1, [r0, r4]
    37a8: 1f ab        	add	r3, sp, #124
    37aa: 16 00        	movs	r6, r2
    37ac: 00 01        	lsls	r0, r0, #4
    37ae: 33 01        	lsls	r3, r6, #4
    37b0: 4c 00        	lsls	r4, r1, #1
    37b2: 00 00        	movs	r0, r0
    37b4: 82 0f        	lsrs	r2, r0, #30
    37b6: 00 00        	movs	r0, r0
    37b8: 00 1d        	adds	r0, r0, #4
    37ba: 9d 17        	asrs	r5, r3, #30
    37bc: 00 00        	movs	r0, r0
    37be: 01 49        	ldr	r1, [pc, #4]            @ 0x37c4 <.debug_info+0x37c4>
    37c0: 01 5e        	ldrsh	r1, [r0, r0]
    37c2: 00 00        	movs	r0, r0
    37c4: 00           	<unknown>
    37c5: ec 12        	asrs	r4, r5, #11
    37c7: 00 20        	movs	r0, #0
    37c9: 06 00        	movs	r6, r0
    37cb: 00 00        	movs	r0, r0
    37cd: 01 9c        	ldr	r4, [sp, #4]
    37cf: a7 05        	lsls	r7, r4, #22
    37d1: 00 00        	movs	r0, r0
    37d3: 1e 04        	lsls	r6, r3, #16
    37d5: 18 00        	movs	r0, r3
    37d7: 00 01        	lsls	r0, r0, #4
    37d9: 49 01        	lsls	r1, r1, #5
    37db: 65 04        	lsls	r5, r4, #17
    37dd: 00 00        	movs	r0, r0
    37df: a1 0f        	lsrs	r1, r4, #30
    37e1: 00 00        	movs	r0, r0
    37e3: 00 1d        	adds	r0, r0, #4
    37e5: 1a 18        	adds	r2, r3, r0
    37e7: 00 00        	movs	r0, r0
    37e9: 01 58        	ldr	r1, [r0, r0]
    37eb: 01 4c        	ldr	r4, [pc, #4]            @ 0x37f0 <.debug_info+0x37f0>
    37ed: 00 00        	movs	r0, r0
    37ef: 00 f4 12 00  	and	r0, r0, #9568256
    37f3: 20 0e        	lsrs	r0, r4, #24
    37f5: 00 00        	movs	r0, r0
    37f7: 00 01        	lsls	r0, r0, #4
    37f9: 9c f0 05 00  	eors	r0, r12, #5
    37fd: 00 1e        	subs	r0, r0, #0
    37ff: 04 18        	adds	r4, r0, r0
    3801: 00 00        	movs	r0, r0
    3803: 01 58        	ldr	r1, [r0, r0]
    3805: 01 65        	str	r1, [r0, #80]
    3807: 04 00        	movs	r4, r0
    3809: 00           	<unknown>
    380a: c2 0f        	lsrs	r2, r0, #31
    380c: 00 00        	movs	r0, r0
    380e: 1b 0c        	lsrs	r3, r3, #16
    3810: 0b 00        	movs	r3, r1
    3812: 00 01        	lsls	r0, r0, #4
    3814: 58 01        	lsls	r0, r3, #5
    3816: 5e 00        	lsls	r6, r3, #1
    3818: 00 00        	movs	r0, r0
    381a: 01 51        	str	r1, [r0, r4]
    381c: 1f ab        	add	r3, sp, #124
    381e: 16 00        	movs	r6, r2
    3820: 00 01        	lsls	r0, r0, #4
    3822: 5a 01        	lsls	r2, r3, #5
    3824: 4c 00        	lsls	r4, r1, #1
    3826: 00 00        	movs	r0, r0
    3828: fc 0f        	lsrs	r4, r7, #31
    382a: 00 00        	movs	r0, r0
    382c: 00 1d        	adds	r0, r0, #4
    382e: 0d 17        	asrs	r5, r1, #28
    3830: 00 00        	movs	r0, r0
    3832: 01 70        	strb	r1, [r0]
    3834: 01 5e        	ldrsh	r1, [r0, r0]
    3836: 00 00        	movs	r0, r0
    3838: 00 04        	lsls	r0, r0, #16
    383a: 13 00        	movs	r3, r2
    383c: 20 06        	lsls	r0, r4, #24
    383e: 00 00        	movs	r0, r0
    3840: 00 01        	lsls	r0, r0, #4
    3842: 9c 1b        	subs	r4, r3, r6
    3844: 06 00        	movs	r6, r0
    3846: 00 1e        	subs	r0, r0, #0
    3848: 04 18        	adds	r4, r0, r0
    384a: 00 00        	movs	r0, r0
    384c: 01 70        	strb	r1, [r0]
    384e: 01 65        	str	r1, [r0, #80]
    3850: 04 00        	movs	r4, r0
    3852: 00 1b        	subs	r0, r0, r4
    3854: 10 00        	movs	r0, r2
    3856: 00 00        	movs	r0, r0
    3858: 1a 43        	orrs	r2, r3
    385a: 0c 00        	movs	r4, r1
    385c: 00 01        	lsls	r0, r0, #4
    385e: 82 01        	lsls	r2, r0, #6
    3860: 0c 13        	asrs	r4, r1, #12
    3862: 00 20        	movs	r0, #0
    3864: 04 00        	movs	r4, r0
    3866: 00 00        	movs	r0, r0
    3868: 01 9c        	ldr	r4, [sp, #4]
    386a: 4e 06        	lsls	r6, r1, #25
    386c: 00 00        	movs	r0, r0
    386e: 1b 04        	lsls	r3, r3, #16
    3870: 18 00        	movs	r0, r3
    3872: 00 01        	lsls	r0, r0, #4
    3874: 82 01        	lsls	r2, r0, #6
    3876: 65 04        	lsls	r5, r4, #17
    3878: 00 00        	movs	r0, r0
    387a: 01 50        	str	r1, [r0, r0]
    387c: 1b 0c        	lsrs	r3, r3, #16
    387e: 0b 00        	movs	r3, r1
    3880: 00 01        	lsls	r0, r0, #4
    3882: 82 01        	lsls	r2, r0, #6
    3884: 5e 00        	lsls	r6, r3, #1
    3886: 00 00        	movs	r0, r0
    3888: 01 51        	str	r1, [r0, r4]
    388a: 00 1a        	subs	r0, r0, r0
    388c: a1 09        	lsrs	r1, r4, #6
    388e: 00 00        	movs	r0, r0
    3890: 01 95        	str	r5, [sp, #4]
    3892: 01 10        	asrs	r1, r0, #32
    3894: 13 00        	movs	r3, r2
    3896: 20 04        	lsls	r0, r4, #16
    3898: 00 00        	movs	r0, r0
    389a: 00 01        	lsls	r0, r0, #4
    389c: 9c 81        	strh	r4, [r3, #12]
    389e: 06 00        	movs	r6, r0
    38a0: 00 1b        	subs	r0, r0, r4
    38a2: 04 18        	adds	r4, r0, r0
    38a4: 00 00        	movs	r0, r0
    38a6: 01 95        	str	r5, [sp, #4]
    38a8: 01 65        	str	r1, [r0, #80]
    38aa: 04 00        	movs	r4, r0
    38ac: 00 01        	lsls	r0, r0, #4
    38ae: 50 1b        	subs	r0, r2, r5
    38b0: 0c 0b        	lsrs	r4, r1, #12
    38b2: 00 00        	movs	r0, r0
    38b4: 01 95        	str	r5, [sp, #4]
    38b6: 01 5e        	ldrsh	r1, [r0, r0]
    38b8: 00 00        	movs	r0, r0
    38ba: 00 01        	lsls	r0, r0, #4
    38bc: 51 00        	lsls	r1, r2, #1
    38be: 1a 47        	bx	r3
    38c0: 17 00        	movs	r7, r2
    38c2: 00 01        	lsls	r0, r0, #4
    38c4: a9 01        	lsls	r1, r5, #6
    38c6: 14 13        	asrs	r4, r2, #12
    38c8: 00 20        	movs	r0, #0
    38ca: 0a 00        	movs	r2, r1
    38cc: 00 00        	movs	r0, r0
    38ce: 01 9c        	ldr	r4, [sp, #4]
    38d0: c2 06        	lsls	r2, r0, #27
    38d2: 00 00        	movs	r0, r0
    38d4: 1b 04        	lsls	r3, r3, #16
    38d6: 18 00        	movs	r0, r3
    38d8: 00 01        	lsls	r0, r0, #4
    38da: a9 01        	lsls	r1, r5, #6
    38dc: 65 04        	lsls	r5, r4, #17
    38de: 00 00        	movs	r0, r0
    38e0: 01 50        	str	r1, [r0, r0]
    38e2: 1b 0c        	lsrs	r3, r3, #16
    38e4: 0b 00        	movs	r3, r1
    38e6: 00 01        	lsls	r0, r0, #4
    38e8: a9 01        	lsls	r1, r5, #6
    38ea: 5e 00        	lsls	r6, r3, #1
    38ec: 00 00        	movs	r0, r0
    38ee: 01 51        	str	r1, [r0, r4]
    38f0: 1b 36        	adds	r6, #27
    38f2: 17 00        	movs	r7, r2
    38f4: 00 01        	lsls	r0, r0, #4
    38f6: a9 01        	lsls	r1, r5, #6
    38f8: 2f 02        	lsls	r7, r5, #8
    38fa: 00 00        	movs	r0, r0
    38fc: 01 52        	strh	r1, [r0, r0]
    38fe: 00 1a        	subs	r0, r0, r0
    3900: ce 17        	asrs	r6, r1, #31
    3902: 00 00        	movs	r0, r0
    3904: 01 c0        	stm	r0!, {r0}
    3906: 01 20        	movs	r0, #1
    3908: 13 00        	movs	r3, r2
    390a: 20 04        	lsls	r0, r4, #16
    390c: 00 00        	movs	r0, r0
    390e: 00 01        	lsls	r0, r0, #4
    3910: 9c           	<unknown>
    3911: f5 06        	lsls	r5, r6, #27
    3913: 00 00        	movs	r0, r0
    3915: 1b 04        	lsls	r3, r3, #16
    3917: 18 00        	movs	r0, r3
    3919: 00 01        	lsls	r0, r0, #4
    391b: c0 01        	lsls	r0, r0, #7
    391d: 65 04        	lsls	r5, r4, #17
    391f: 00 00        	movs	r0, r0
    3921: 01 50        	str	r1, [r0, r0]
    3923: 1b 86        	strh	r3, [r3, #48]
    3925: 17 00        	movs	r7, r2
    3927: 00 01        	lsls	r0, r0, #4
    3929: c0 01        	lsls	r0, r0, #7
    392b: 5e 00        	lsls	r6, r3, #1
    392d: 00 00        	movs	r0, r0
    392f: 01 51        	str	r1, [r0, r4]
    3931: 00 1a        	subs	r0, r0, r0
    3933: 0a 18        	adds	r2, r1, r0
    3935: 00 00        	movs	r0, r0
    3937: 01 ce        	ldm	r6!, {r0}
    3939: 01 24        	movs	r4, #1
    393b: 13 00        	movs	r3, r2
    393d: 20 08        	lsrs	r0, r4, #32
    393f: 00 00        	movs	r0, r0
    3941: 00 01        	lsls	r0, r0, #4
    3943: 9c 2a        	cmp	r2, #156
    3945: 07 00        	movs	r7, r0
    3947: 00 1b        	subs	r0, r0, r4
    3949: 04 18        	adds	r4, r0, r0
    394b: 00 00        	movs	r0, r0
    394d: 01 ce        	ldm	r6!, {r0}
    394f: 01 65        	str	r1, [r0, #80]
    3951: 04 00        	movs	r4, r0
    3953: 00 01        	lsls	r0, r0, #4
    3955: 50 1e        	subs	r0, r2, #1
    3957: 0c 0b        	lsrs	r4, r1, #12
    3959: 00 00        	movs	r0, r0
    395b: 01 ce        	ldm	r6!, {r0}
    395d: 01 5e        	ldrsh	r1, [r0, r0]
    395f: 00 00        	movs	r0, r0
    3961: 00 3c        	subs	r4, #0
    3963: 10 00        	movs	r0, r2
    3965: 00 00        	movs	r0, r0
    3967: 1a 83        	strh	r2, [r3, #24]
    3969: 08 00        	movs	r0, r1
    396b: 00 01        	lsls	r0, r0, #4
    396d: 17 02        	lsls	r7, r2, #8
    396f: 2c 13        	asrs	r4, r5, #12
    3971: 00 20        	movs	r0, #0
    3973: 2e 00        	movs	r6, r5
    3975: 00 00        	movs	r0, r0
    3977: 01 9c        	ldr	r4, [sp, #4]
    3979: 8f 07        	lsls	r7, r1, #30
    397b: 00 00        	movs	r0, r0
    397d: 1b 04        	lsls	r3, r3, #16
    397f: 18 00        	movs	r0, r3
    3981: 00 01        	lsls	r0, r0, #4
    3983: 17 02        	lsls	r7, r2, #8
    3985: 65 04        	lsls	r5, r4, #17
    3987: 00 00        	movs	r0, r0
    3989: 01 50        	str	r1, [r0, r0]
    398b: 1e 8e        	ldrh	r6, [r3, #48]
    398d: 17 00        	movs	r7, r2
    398f: 00 01        	lsls	r0, r0, #4
    3991: 17 02        	lsls	r7, r2, #8
    3993: 5e 00        	lsls	r6, r3, #1
    3995: 00 00        	movs	r0, r0
    3997: 5d 10        	asrs	r5, r3, #1
    3999: 00 00        	movs	r0, r0
    399b: 1e 7e        	ldrb	r6, [r3, #24]
    399d: 17 00        	movs	r7, r2
    399f: 00 01        	lsls	r0, r0, #4
    39a1: 17 02        	lsls	r7, r2, #8
    39a3: 4c 00        	lsls	r4, r1, #1
    39a5: 00 00        	movs	r0, r0
    39a7: 7e 10        	asrs	r6, r7, #1
    39a9: 00 00        	movs	r0, r0
    39ab: 1f 21        	movs	r1, #31
    39ad: 17 00        	movs	r7, r2
    39af: 00 01        	lsls	r0, r0, #4
    39b1: 19 02        	lsls	r1, r3, #8
    39b3: 70 00        	lsls	r0, r6, #1
    39b5: 00 00        	movs	r0, r0
    39b7: 9f 10        	asrs	r7, r3, #2
    39b9: 00 00        	movs	r0, r0
    39bb: 1f 55        	strb	r7, [r3, r4]
    39bd: 17 00        	movs	r7, r2
    39bf: 00 01        	lsls	r0, r0, #4
    39c1: 1a 02        	lsls	r2, r3, #8
    39c3: 70 00        	lsls	r0, r6, #1
    39c5: 00 00        	movs	r0, r0
    39c7: be 10        	asrs	r6, r7, #2
    39c9: 00 00        	movs	r0, r0
    39cb: 00 20        	movs	r0, #0
    39cd: f5 0b        	lsrs	r5, r6, #15
    39cf: 00 00        	movs	r0, r0
    39d1: 05 1a        	subs	r5, r0, r0
    39d3: 05           	<unknown>
    39d4: b8 00        	lsls	r0, r7, #2
    39d6: 00 00        	movs	r0, r0
    39d8: 21 e9 15 00  	stmdb	r1!, {r0, r2, r4}
    39dc: 00 06        	lsls	r0, r0, #24
    39de: e3 01        	lsls	r3, r4, #7
    39e0: 22 70        	strb	r2, [r4]
    39e2: 00 00        	movs	r0, r0
    39e4: 00 22        	movs	r2, #0
    39e6: d3 00        	lsls	r3, r2, #3
    39e8: 00 00        	movs	r0, r0
    39ea: 00 00        	movs	r0, r0

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
       0: 01 11        	asrs	r1, r0, #4
       2: 01 25        	movs	r5, #1
       4: 0e 13        	asrs	r6, r1, #12
       6: 0b 03        	lsls	r3, r1, #12
       8: 0e 1b        	subs	r6, r1, r4
       a: 0e 55        	strb	r6, [r1, r4]
       c: 17 11        	asrs	r7, r2, #4
       e: 01 10        	asrs	r1, r0, #32
      10: 17 00        	movs	r7, r2
      12: 00 02        	lsls	r0, r0, #8
      14: 24 00        	movs	r4, r4
      16: 0b 0b        	lsrs	r3, r1, #12
      18: 3e 0b        	lsrs	r6, r7, #12
      1a: 03 0e        	lsrs	r3, r0, #24
      1c: 00 00        	movs	r0, r0
      1e: 03 16        	asrs	r3, r0, #24
      20: 00 03        	lsls	r0, r0, #12
      22: 0e 3a        	subs	r2, #14
      24: 0b 3b        	subs	r3, #11
      26: 0b 49        	ldr	r1, [pc, #44]           @ 0x54 <.debug_info+0x54>
      28: 13 00        	movs	r3, r2
      2a: 00 04        	lsls	r0, r0, #16
      2c: 24 00        	movs	r4, r4
      2e: 0b 0b        	lsrs	r3, r1, #12
      30: 3e 0b        	lsrs	r6, r7, #12
      32: 03 08        	lsrs	r3, r0, #32
      34: 00 00        	movs	r0, r0
      36: 05 0f        	lsrs	r5, r0, #28
      38: 00 0b        	lsrs	r0, r0, #12
      3a: 0b 00        	movs	r3, r1
      3c: 00 06        	lsls	r0, r0, #24
      3e: 0f 00        	movs	r7, r1
      40: 0b 0b        	lsrs	r3, r1, #12
      42: 49 13        	asrs	r1, r1, #13
      44: 00 00        	movs	r0, r0
      46: 07 26        	movs	r6, #7
      48: 00 49        	ldr	r1, [pc, #0]            @ 0x4c <.debug_info+0x4c>
      4a: 13 00        	movs	r3, r2
      4c: 00 08        	lsrs	r0, r0, #32
      4e: 04 01        	lsls	r4, r0, #4
      50: 03 0e        	lsrs	r3, r0, #24
      52: 0b 0b        	lsrs	r3, r1, #12
      54: 3a 0b        	lsrs	r2, r7, #12
      56: 3b 0b        	lsrs	r3, r7, #12
      58: 01 13        	asrs	r1, r0, #12
      5a: 00 00        	movs	r0, r0
      5c: 09 28        	cmp	r0, #9
      5e: 00 03        	lsls	r0, r0, #12
      60: 0e 1c        	adds	r6, r1, #0
      62: 0d 00        	movs	r5, r1
      64: 00 0a        	lsrs	r0, r0, #8
      66: 13 01        	lsls	r3, r2, #4
      68: 0b 05        	lsls	r3, r1, #20
      6a: 3a 0b        	lsrs	r2, r7, #12
      6c: 3b 05        	lsls	r3, r7, #20
      6e: 01 13        	asrs	r1, r0, #12
      70: 00 00        	movs	r0, r0
      72: 0b 0d        	lsrs	r3, r1, #20
      74: 00 03        	lsls	r0, r0, #12
      76: 0e 3a        	subs	r2, #14
      78: 0b 3b        	subs	r3, #11
      7a: 05 49        	ldr	r1, [pc, #20]           @ 0x90 <.debug_info+0x90>
      7c: 13 38        	subs	r0, #19
      7e: 0b 00        	movs	r3, r1
      80: 00 0c        	lsrs	r0, r0, #16
      82: 0d 00        	movs	r5, r1
      84: 03 0e        	lsrs	r3, r0, #24
      86: 3a 0b        	lsrs	r2, r7, #12
      88: 3b 05        	lsls	r3, r7, #20
      8a: 49 13        	asrs	r1, r1, #13
      8c: 38 05        	lsls	r0, r7, #20
      8e: 00 00        	movs	r0, r0
      90: 0d 0d        	lsrs	r5, r1, #20
      92: 00 03        	lsls	r0, r0, #12
      94: 08 3a        	subs	r2, #8
      96: 0b 3b        	subs	r3, #11
      98: 05 49        	ldr	r1, [pc, #20]           @ 0xb0 <.debug_info+0xb0>
      9a: 13 38        	subs	r0, #19
      9c: 05 00        	movs	r5, r0
      9e: 00 0e        	lsrs	r0, r0, #24
      a0: 01 01        	lsls	r1, r0, #4
      a2: 49 13        	asrs	r1, r1, #13
      a4: 01 13        	asrs	r1, r0, #12
      a6: 00 00        	movs	r0, r0
      a8: 0f 21        	movs	r1, #15
      aa: 00 49        	ldr	r1, [pc, #0]            @ 0xac <.debug_info+0xac>
      ac: 13 2f        	cmp	r7, #19
      ae: 0b 00        	movs	r3, r1
      b0: 00 10        	asrs	r0, r0, #32
      b2: 35 00        	movs	r5, r6
      b4: 49 13        	asrs	r1, r1, #13
      b6: 00 00        	movs	r0, r0
      b8: 11 21        	movs	r1, #17
      ba: 00 49        	ldr	r1, [pc, #0]            @ 0xbc <.debug_info+0xbc>
      bc: 13 2f        	cmp	r7, #19
      be: 05 00        	movs	r5, r0
      c0: 00 12        	asrs	r0, r0, #8
      c2: 16 00        	movs	r6, r2
      c4: 03 0e        	lsrs	r3, r0, #24
      c6: 3a 0b        	lsrs	r2, r7, #12
      c8: 3b 05        	lsls	r3, r7, #20
      ca: 49 13        	asrs	r1, r1, #13
      cc: 00 00        	movs	r0, r0
      ce: 13 13        	asrs	r3, r2, #12
      d0: 01 0b        	lsrs	r1, r0, #12
      d2: 0b 3a        	subs	r2, #11
      d4: 0b 3b        	subs	r3, #11
      d6: 05 01        	lsls	r5, r0, #4
      d8: 13 00        	movs	r3, r2
      da: 00 14        	asrs	r0, r0, #16
      dc: 0d 00        	movs	r5, r1
      de: 03 08        	lsrs	r3, r0, #32
      e0: 3a 0b        	lsrs	r2, r7, #12
      e2: 3b 05        	lsls	r3, r7, #20
      e4: 49 13        	asrs	r1, r1, #13
      e6: 38 0b        	lsrs	r0, r7, #12
      e8: 00 00        	movs	r0, r0
      ea: 15 04        	lsls	r5, r2, #16
      ec: 01 0b        	lsrs	r1, r0, #12
      ee: 0b 3a        	subs	r2, #11
      f0: 0b 3b        	subs	r3, #11
      f2: 05 01        	lsls	r5, r0, #4
      f4: 13 00        	movs	r3, r2
      f6: 00 16        	asrs	r0, r0, #24
      f8: 04 01        	lsls	r4, r0, #4
      fa: 0b 0b        	lsrs	r3, r1, #12
      fc: 3a 0b        	lsrs	r2, r7, #12
      fe: 3b 0b        	lsrs	r3, r7, #12
     100: 01 13        	asrs	r1, r0, #12
     102: 00 00        	movs	r0, r0
     104: 17 13        	asrs	r7, r2, #12
     106: 01 0b        	lsrs	r1, r0, #12
     108: 0b 3a        	subs	r2, #11
     10a: 0b 3b        	subs	r3, #11
     10c: 0b 01        	lsls	r3, r1, #4
     10e: 13 00        	movs	r3, r2
     110: 00 18        	adds	r0, r0, r0
     112: 0d 00        	movs	r5, r1
     114: 03 0e        	lsrs	r3, r0, #24
     116: 3a 0b        	lsrs	r2, r7, #12
     118: 3b 0b        	lsrs	r3, r7, #12
     11a: 49 13        	asrs	r1, r1, #13
     11c: 38 0b        	lsrs	r0, r7, #12
     11e: 00 00        	movs	r0, r0
     120: 19 15        	asrs	r1, r3, #20
     122: 01 27        	movs	r7, #1
     124: 19 01        	lsls	r1, r3, #4
     126: 13 00        	movs	r3, r2
     128: 00 1a        	subs	r0, r0, r0
     12a: 05 00        	movs	r5, r0
     12c: 49 13        	asrs	r1, r1, #13
     12e: 00 00        	movs	r0, r0
     130: 1b 13        	asrs	r3, r3, #12
     132: 01 03        	lsls	r1, r0, #12
     134: 0e 0b        	lsrs	r6, r1, #12
     136: 0b 3a        	subs	r2, #11
     138: 0b 3b        	subs	r3, #11
     13a: 0b 01        	lsls	r3, r1, #4
     13c: 13 00        	movs	r3, r2
     13e: 00 1c        	adds	r0, r0, #0
     140: 2e 01        	lsls	r6, r5, #4
     142: 03 0e        	lsrs	r3, r0, #24
     144: 3a 0b        	lsrs	r2, r7, #12
     146: 3b 05        	lsls	r3, r7, #20
     148: 27 19        	adds	r7, r4, r4
     14a: 20 0b        	lsrs	r0, r4, #12
     14c: 01 13        	asrs	r1, r0, #12
     14e: 00 00        	movs	r0, r0
     150: 1d 05        	lsls	r5, r3, #20
     152: 00 03        	lsls	r0, r0, #12
     154: 0e 3a        	subs	r2, #14
     156: 0b 3b        	subs	r3, #11
     158: 05 49        	ldr	r1, [pc, #20]           @ 0x170 <.debug_info+0x170>
     15a: 13 00        	movs	r3, r2
     15c: 00 1e        	subs	r0, r0, #0
     15e: 2e 01        	lsls	r6, r5, #4
     160: 03 0e        	lsrs	r3, r0, #24
     162: 3a 0b        	lsrs	r2, r7, #12
     164: 3b 05        	lsls	r3, r7, #20
     166: 27 19        	adds	r7, r4, r4
     168: 49 13        	asrs	r1, r1, #13
     16a: 20 0b        	lsrs	r0, r4, #12
     16c: 01 13        	asrs	r1, r0, #12
     16e: 00 00        	movs	r0, r0
     170: 1f 2e        	cmp	r6, #31
     172: 01 03        	lsls	r1, r0, #12
     174: 0e 3a        	subs	r2, #14
     176: 0b 3b        	subs	r3, #11
     178: 0b 27        	movs	r7, #11
     17a: 19 11        	asrs	r1, r3, #4
     17c: 01 12        	asrs	r1, r0, #8
     17e: 06 40        	ands	r6, r0
     180: 18 97        	str	r7, [sp, #96]
     182: 42 19        	adds	r2, r0, r5
     184: 01 13        	asrs	r1, r0, #12
     186: 00 00        	movs	r0, r0
     188: 20 05        	lsls	r0, r4, #20
     18a: 00 03        	lsls	r0, r0, #12
     18c: 0e 3a        	subs	r2, #14
     18e: 0b 3b        	subs	r3, #11
     190: 0b 49        	ldr	r1, [pc, #44]           @ 0x1c0 <.debug_info+0x1c0>
     192: 13 02        	lsls	r3, r2, #8
     194: 17 00        	movs	r7, r2
     196: 00 21        	movs	r1, #0
     198: 34 00        	movs	r4, r6
     19a: 03 0e        	lsrs	r3, r0, #24
     19c: 3a 0b        	lsrs	r2, r7, #12
     19e: 3b 0b        	lsrs	r3, r7, #12
     1a0: 49 13        	asrs	r1, r1, #13
     1a2: 02 18        	adds	r2, r0, r0
     1a4: 00 00        	movs	r0, r0
     1a6: 22 34        	adds	r4, #34
     1a8: 00 03        	lsls	r0, r0, #12
     1aa: 0e 3a        	subs	r2, #14
     1ac: 0b 3b        	subs	r3, #11
     1ae: 0b 49        	ldr	r1, [pc, #44]           @ 0x1dc <.debug_info+0x1dc>
     1b0: 13 02        	lsls	r3, r2, #8
     1b2: 17 00        	movs	r7, r2
     1b4: 00 23        	movs	r3, #0
     1b6: 34 00        	movs	r4, r6
     1b8: 03 08        	lsrs	r3, r0, #32
     1ba: 3a 0b        	lsrs	r2, r7, #12
     1bc: 3b 0b        	lsrs	r3, r7, #12
     1be: 49 13        	asrs	r1, r1, #13
     1c0: 02 17        	asrs	r2, r0, #28
     1c2: 00 00        	movs	r0, r0
     1c4: 24 89        	ldrh	r4, [r4, #8]
     1c6: 82 01        	lsls	r2, r0, #6
     1c8: 01 11        	asrs	r1, r0, #4
     1ca: 01 31        	adds	r1, #1
     1cc: 13 01        	lsls	r3, r2, #4
     1ce: 13 00        	movs	r3, r2
     1d0: 00 25        	movs	r5, #0
     1d2: 8a 82        	strh	r2, [r1, #20]
     1d4: 01 00        	movs	r1, r0
     1d6: 02 18        	adds	r2, r0, r0
     1d8: 91 42        	cmp	r1, r2
     1da: 18 00        	movs	r0, r3
     1dc: 00 26        	movs	r6, #0
     1de: 89 82        	strh	r1, [r1, #20]
     1e0: 01 00        	movs	r1, r0
     1e2: 11 01        	lsls	r1, r2, #4
     1e4: 31 13        	asrs	r1, r6, #12
     1e6: 00 00        	movs	r0, r0
     1e8: 27 89        	ldrh	r7, [r4, #8]
     1ea: 82 01        	lsls	r2, r0, #6
     1ec: 01 11        	asrs	r1, r0, #4
     1ee: 01 31        	adds	r1, #1
     1f0: 13 00        	movs	r3, r2
     1f2: 00 28        	cmp	r0, #0
     1f4: 2e 01        	lsls	r6, r5, #4
     1f6: 3f 19        	adds	r7, r7, r4
     1f8: 03 0e        	lsrs	r3, r0, #24
     1fa: 3a 0b        	lsrs	r2, r7, #12
     1fc: 3b 0b        	lsrs	r3, r7, #12
     1fe: 11 01        	lsls	r1, r2, #4
     200: 12 06        	lsls	r2, r2, #24
     202: 40 18        	adds	r0, r0, r1
     204: 97 42        	cmp	r7, r2
     206: 19 01        	lsls	r1, r3, #4
     208: 13 00        	movs	r3, r2
     20a: 00 29        	cmp	r1, #0
     20c: 1d 01        	lsls	r5, r3, #4
     20e: 31 13        	asrs	r1, r6, #12
     210: 11 01        	lsls	r1, r2, #4
     212: 12 06        	lsls	r2, r2, #24
     214: 58 0b        	lsrs	r0, r3, #13
     216: 59 0b        	lsrs	r1, r3, #13
     218: 01 13        	asrs	r1, r0, #12
     21a: 00 00        	movs	r0, r0
     21c: 2a 05        	lsls	r2, r5, #20
     21e: 00 31        	adds	r1, #0
     220: 13 02        	lsls	r3, r2, #8
     222: 17 00        	movs	r7, r2
     224: 00 2b        	cmp	r3, #0
     226: 1d 01        	lsls	r5, r3, #4
     228: 31 13        	asrs	r1, r6, #12
     22a: 11 01        	lsls	r1, r2, #4
     22c: 12 06        	lsls	r2, r2, #24
     22e: 58 0b        	lsrs	r0, r3, #13
     230: 59 05        	lsls	r1, r3, #21
     232: 00 00        	movs	r0, r0
     234: 2c 05        	lsls	r4, r5, #20
     236: 00 31        	adds	r1, #0
     238: 13 1c        	adds	r3, r2, #0
     23a: 0b 00        	movs	r3, r1
     23c: 00 2d        	cmp	r5, #0
     23e: 05 00        	movs	r5, r0
     240: 31 13        	asrs	r1, r6, #12
     242: 1c 0d        	lsrs	r4, r3, #20
     244: 00 00        	movs	r0, r0
     246: 2e 2e        	cmp	r6, #46
     248: 01 3f        	subs	r7, #1
     24a: 19 03        	lsls	r1, r3, #12
     24c: 0e 3a        	subs	r2, #14
     24e: 0b 3b        	subs	r3, #11
     250: 0b 27        	movs	r7, #11
     252: 19 49        	ldr	r1, [pc, #100]          @ 0x2b8 <.debug_info+0x2b8>
     254: 13 11        	asrs	r3, r2, #4
     256: 01 12        	asrs	r1, r0, #8
     258: 06 40        	ands	r6, r0
     25a: 18 97        	str	r7, [sp, #96]
     25c: 42 19        	adds	r2, r0, r5
     25e: 01 13        	asrs	r1, r0, #12
     260: 00 00        	movs	r0, r0
     262: 2f 2e        	cmp	r6, #47
     264: 00 3f        	subs	r7, #0
     266: 19 03        	lsls	r1, r3, #12
     268: 0e 3a        	subs	r2, #14
     26a: 0b 3b        	subs	r3, #11
     26c: 0b 11        	asrs	r3, r1, #4
     26e: 01 12        	asrs	r1, r0, #8
     270: 06 40        	ands	r6, r0
     272: 18 97        	str	r7, [sp, #96]
     274: 42 19        	adds	r2, r0, r5
     276: 00 00        	movs	r0, r0
     278: 30 2e        	cmp	r6, #48
     27a: 01 3f        	subs	r7, #1
     27c: 19 03        	lsls	r1, r3, #12
     27e: 0e 3a        	subs	r2, #14
     280: 0b 3b        	subs	r3, #11
     282: 0b 27        	movs	r7, #11
     284: 19 11        	asrs	r1, r3, #4
     286: 01 12        	asrs	r1, r0, #8
     288: 06 40        	ands	r6, r0
     28a: 18 97        	str	r7, [sp, #96]
     28c: 42 19        	adds	r2, r0, r5
     28e: 01 13        	asrs	r1, r0, #12
     290: 00 00        	movs	r0, r0
     292: 31 05        	lsls	r1, r6, #20
     294: 00 03        	lsls	r0, r0, #12
     296: 0e 3a        	subs	r2, #14
     298: 0b 3b        	subs	r3, #11
     29a: 0b 49        	ldr	r1, [pc, #44]           @ 0x2c8 <.debug_info+0x2c8>
     29c: 13 02        	lsls	r3, r2, #8
     29e: 18 00        	movs	r0, r3
     2a0: 00 32        	adds	r2, #0
     2a2: 34 00        	movs	r4, r6
     2a4: 03 0e        	lsrs	r3, r0, #24
     2a6: 3a 0b        	lsrs	r2, r7, #12
     2a8: 3b 05        	lsls	r3, r7, #20
     2aa: 49 13        	asrs	r1, r1, #13
     2ac: 3f 19        	adds	r7, r7, r4
     2ae: 3c 19        	adds	r4, r7, r4
     2b0: 00 00        	movs	r0, r0
     2b2: 33 34        	adds	r4, #51
     2b4: 00 03        	lsls	r0, r0, #12
     2b6: 0e 3a        	subs	r2, #14
     2b8: 0b 3b        	subs	r3, #11
     2ba: 0b 49        	ldr	r1, [pc, #44]           @ 0x2e8 <.debug_info+0x2e8>
     2bc: 13 3f        	subs	r7, #19
     2be: 19 3c        	subs	r4, #25
     2c0: 19 00        	movs	r1, r3
     2c2: 00 34        	adds	r4, #0
     2c4: 34 00        	movs	r4, r6
     2c6: 03 0e        	lsrs	r3, r0, #24
     2c8: 3a 0b        	lsrs	r2, r7, #12
     2ca: 3b 0b        	lsrs	r3, r7, #12
     2cc: 49 13        	asrs	r1, r1, #13
     2ce: 3f 19        	adds	r7, r7, r4
     2d0: 02 18        	adds	r2, r0, r0
     2d2: 00 00        	movs	r0, r0
     2d4: 35 21        	movs	r1, #53
     2d6: 00 00        	movs	r0, r0
     2d8: 00 36        	adds	r6, #0
     2da: 2e 01        	lsls	r6, r5, #4
     2dc: 3f 19        	adds	r7, r7, r4
     2de: 03 0e        	lsrs	r3, r0, #24
     2e0: 3a 0b        	lsrs	r2, r7, #12
     2e2: 3b 05        	lsls	r3, r7, #20
     2e4: 27 19        	adds	r7, r4, r4
     2e6: 3c 19        	adds	r4, r7, r4
     2e8: 01 13        	asrs	r1, r0, #12
     2ea: 00 00        	movs	r0, r0
     2ec: 37 2e        	cmp	r6, #55
     2ee: 01 3f        	subs	r7, #1
     2f0: 19 03        	lsls	r1, r3, #12
     2f2: 0e 3a        	subs	r2, #14
     2f4: 0b 3b        	subs	r3, #11
     2f6: 0b 27        	movs	r7, #11
     2f8: 19 49        	ldr	r1, [pc, #100]          @ 0x360 <.debug_info+0x360>
     2fa: 13 3c        	subs	r4, #19
     2fc: 19 01        	lsls	r1, r3, #4
     2fe: 13 00        	movs	r3, r2
     300: 00 38        	subs	r0, #0
     302: 2e 01        	lsls	r6, r5, #4
     304: 3f 19        	adds	r7, r7, r4
     306: 03 0e        	lsrs	r3, r0, #24
     308: 3a 0b        	lsrs	r2, r7, #12
     30a: 3b 0b        	lsrs	r3, r7, #12
     30c: 27 19        	adds	r7, r4, r4
     30e: 3c 19        	adds	r4, r7, r4
     310: 01 13        	asrs	r1, r0, #12
     312: 00 00        	movs	r0, r0
     314: 39 2e        	cmp	r6, #57
     316: 00 3f        	subs	r7, #0
     318: 19 03        	lsls	r1, r3, #12
     31a: 0e 3a        	subs	r2, #14
     31c: 0b 3b        	subs	r3, #11
     31e: 0b 27        	movs	r7, #11
     320: 19 49        	ldr	r1, [pc, #100]          @ 0x388 <.debug_info+0x388>
     322: 13 3c        	subs	r4, #19
     324: 19 00        	movs	r1, r3
     326: 00 00        	movs	r0, r0
     328: 01 11        	asrs	r1, r0, #4
     32a: 01 25        	movs	r5, #1
     32c: 0e 13        	asrs	r6, r1, #12
     32e: 0b 03        	lsls	r3, r1, #12
     330: 0e 1b        	subs	r6, r1, r4
     332: 0e 55        	strb	r6, [r1, r4]
     334: 17 11        	asrs	r7, r2, #4
     336: 01 10        	asrs	r1, r0, #32
     338: 17 00        	movs	r7, r2
     33a: 00 02        	lsls	r0, r0, #8
     33c: 24 00        	movs	r4, r4
     33e: 0b 0b        	lsrs	r3, r1, #12
     340: 3e 0b        	lsrs	r6, r7, #12
     342: 03 0e        	lsrs	r3, r0, #24
     344: 00 00        	movs	r0, r0
     346: 03 16        	asrs	r3, r0, #24
     348: 00 03        	lsls	r0, r0, #12
     34a: 0e 3a        	subs	r2, #14
     34c: 0b 3b        	subs	r3, #11
     34e: 0b 49        	ldr	r1, [pc, #44]           @ 0x37c <.debug_info+0x37c>
     350: 13 00        	movs	r3, r2
     352: 00 04        	lsls	r0, r0, #16
     354: 24 00        	movs	r4, r4
     356: 0b 0b        	lsrs	r3, r1, #12
     358: 3e 0b        	lsrs	r6, r7, #12
     35a: 03 08        	lsrs	r3, r0, #32
     35c: 00 00        	movs	r0, r0
     35e: 05 15        	asrs	r5, r0, #20
     360: 01 27        	movs	r7, #1
     362: 19 01        	lsls	r1, r3, #4
     364: 13 00        	movs	r3, r2
     366: 00 06        	lsls	r0, r0, #24
     368: 05 00        	movs	r5, r0
     36a: 49 13        	asrs	r1, r1, #13
     36c: 00 00        	movs	r0, r0
     36e: 07 0f        	lsrs	r7, r0, #28
     370: 00 0b        	lsrs	r0, r0, #12
     372: 0b 00        	movs	r3, r1
     374: 00 08        	lsrs	r0, r0, #32
     376: 04 01        	lsls	r4, r0, #4
     378: 03 0e        	lsrs	r3, r0, #24
     37a: 0b 0b        	lsrs	r3, r1, #12
     37c: 3a 0b        	lsrs	r2, r7, #12
     37e: 3b 0b        	lsrs	r3, r7, #12
     380: 01 13        	asrs	r1, r0, #12
     382: 00 00        	movs	r0, r0
     384: 09 28        	cmp	r0, #9
     386: 00 03        	lsls	r0, r0, #12
     388: 0e 1c        	adds	r6, r1, #0
     38a: 0d 00        	movs	r5, r1
     38c: 00 0a        	lsrs	r0, r0, #8
     38e: 13 01        	lsls	r3, r2, #4
     390: 0b 05        	lsls	r3, r1, #20
     392: 3a 0b        	lsrs	r2, r7, #12
     394: 3b 05        	lsls	r3, r7, #20
     396: 01 13        	asrs	r1, r0, #12
     398: 00 00        	movs	r0, r0
     39a: 0b 0d        	lsrs	r3, r1, #20
     39c: 00 03        	lsls	r0, r0, #12
     39e: 0e 3a        	subs	r2, #14
     3a0: 0b 3b        	subs	r3, #11
     3a2: 05 49        	ldr	r1, [pc, #20]           @ 0x3b8 <.debug_info+0x3b8>
     3a4: 13 38        	subs	r0, #19
     3a6: 0b 00        	movs	r3, r1
     3a8: 00 0c        	lsrs	r0, r0, #16
     3aa: 0d 00        	movs	r5, r1
     3ac: 03 0e        	lsrs	r3, r0, #24
     3ae: 3a 0b        	lsrs	r2, r7, #12
     3b0: 3b 05        	lsls	r3, r7, #20
     3b2: 49 13        	asrs	r1, r1, #13
     3b4: 38 05        	lsls	r0, r7, #20
     3b6: 00 00        	movs	r0, r0
     3b8: 0d 0d        	lsrs	r5, r1, #20
     3ba: 00 03        	lsls	r0, r0, #12
     3bc: 08 3a        	subs	r2, #8
     3be: 0b 3b        	subs	r3, #11
     3c0: 05 49        	ldr	r1, [pc, #20]           @ 0x3d8 <.debug_info+0x3d8>
     3c2: 13 38        	subs	r0, #19
     3c4: 05 00        	movs	r5, r0
     3c6: 00 0e        	lsrs	r0, r0, #24
     3c8: 01 01        	lsls	r1, r0, #4
     3ca: 49 13        	asrs	r1, r1, #13
     3cc: 01 13        	asrs	r1, r0, #12
     3ce: 00 00        	movs	r0, r0
     3d0: 0f 21        	movs	r1, #15
     3d2: 00 49        	ldr	r1, [pc, #0]            @ 0x3d4 <.debug_info+0x3d4>
     3d4: 13 2f        	cmp	r7, #19
     3d6: 0b 00        	movs	r3, r1
     3d8: 00 10        	asrs	r0, r0, #32
     3da: 35 00        	movs	r5, r6
     3dc: 49 13        	asrs	r1, r1, #13
     3de: 00 00        	movs	r0, r0
     3e0: 11 21        	movs	r1, #17
     3e2: 00 49        	ldr	r1, [pc, #0]            @ 0x3e4 <.debug_info+0x3e4>
     3e4: 13 2f        	cmp	r7, #19
     3e6: 05 00        	movs	r5, r0
     3e8: 00 12        	asrs	r0, r0, #8
     3ea: 16 00        	movs	r6, r2
     3ec: 03 0e        	lsrs	r3, r0, #24
     3ee: 3a 0b        	lsrs	r2, r7, #12
     3f0: 3b 05        	lsls	r3, r7, #20
     3f2: 49 13        	asrs	r1, r1, #13
     3f4: 00 00        	movs	r0, r0
     3f6: 13 13        	asrs	r3, r2, #12
     3f8: 01 0b        	lsrs	r1, r0, #12
     3fa: 0b 3a        	subs	r2, #11
     3fc: 0b 3b        	subs	r3, #11
     3fe: 05 01        	lsls	r5, r0, #4
     400: 13 00        	movs	r3, r2
     402: 00 14        	asrs	r0, r0, #16
     404: 0d 00        	movs	r5, r1
     406: 03 08        	lsrs	r3, r0, #32
     408: 3a 0b        	lsrs	r2, r7, #12
     40a: 3b 05        	lsls	r3, r7, #20
     40c: 49 13        	asrs	r1, r1, #13
     40e: 38 0b        	lsrs	r0, r7, #12
     410: 00 00        	movs	r0, r0
     412: 15 26        	movs	r6, #21
     414: 00 49        	ldr	r1, [pc, #0]            @ 0x418 <.debug_info+0x418>
     416: 13 00        	movs	r3, r2
     418: 00 16        	asrs	r0, r0, #24
     41a: 04 01        	lsls	r4, r0, #4
     41c: 0b 0b        	lsrs	r3, r1, #12
     41e: 3a 0b        	lsrs	r2, r7, #12
     420: 3b 05        	lsls	r3, r7, #20
     422: 01 13        	asrs	r1, r0, #12
     424: 00 00        	movs	r0, r0
     426: 17 04        	lsls	r7, r2, #16
     428: 01 0b        	lsrs	r1, r0, #12
     42a: 0b 3a        	subs	r2, #11
     42c: 0b 3b        	subs	r3, #11
     42e: 0b 01        	lsls	r3, r1, #4
     430: 13 00        	movs	r3, r2
     432: 00 18        	adds	r0, r0, r0
     434: 13 01        	lsls	r3, r2, #4
     436: 0b 0b        	lsrs	r3, r1, #12
     438: 3a 0b        	lsrs	r2, r7, #12
     43a: 3b 0b        	lsrs	r3, r7, #12
     43c: 01 13        	asrs	r1, r0, #12
     43e: 00 00        	movs	r0, r0
     440: 19 0d        	lsrs	r1, r3, #20
     442: 00 03        	lsls	r0, r0, #12
     444: 0e 3a        	subs	r2, #14
     446: 0b 3b        	subs	r3, #11
     448: 0b 49        	ldr	r1, [pc, #44]           @ 0x478 <.debug_info+0x478>
     44a: 13 38        	subs	r0, #19
     44c: 0b 00        	movs	r3, r1
     44e: 00 1a        	subs	r0, r0, r0
     450: 2e 01        	lsls	r6, r5, #4
     452: 03 0e        	lsrs	r3, r0, #24
     454: 3a 0b        	lsrs	r2, r7, #12
     456: 3b 05        	lsls	r3, r7, #20
     458: 27 19        	adds	r7, r4, r4
     45a: 20 0b        	lsrs	r0, r4, #12
     45c: 01 13        	asrs	r1, r0, #12
     45e: 00 00        	movs	r0, r0
     460: 1b 05        	lsls	r3, r3, #20
     462: 00 03        	lsls	r0, r0, #12
     464: 0e 3a        	subs	r2, #14
     466: 0b 3b        	subs	r3, #11
     468: 05 49        	ldr	r1, [pc, #20]           @ 0x480 <.debug_info+0x480>
     46a: 13 00        	movs	r3, r2
     46c: 00 1c        	adds	r0, r0, #0
     46e: 2e 01        	lsls	r6, r5, #4
     470: 03 0e        	lsrs	r3, r0, #24
     472: 3a 0b        	lsrs	r2, r7, #12
     474: 3b 0b        	lsrs	r3, r7, #12
     476: 27 19        	adds	r7, r4, r4
     478: 11 01        	lsls	r1, r2, #4
     47a: 12 06        	lsls	r2, r2, #24
     47c: 40 18        	adds	r0, r0, r1
     47e: 97 42        	cmp	r7, r2
     480: 19 01        	lsls	r1, r3, #4
     482: 13 00        	movs	r3, r2
     484: 00 1d        	adds	r0, r0, #4
     486: 05 00        	movs	r5, r0
     488: 03 0e        	lsrs	r3, r0, #24
     48a: 3a 0b        	lsrs	r2, r7, #12
     48c: 3b 0b        	lsrs	r3, r7, #12
     48e: 49 13        	asrs	r1, r1, #13
     490: 02 17        	asrs	r2, r0, #28
     492: 00 00        	movs	r0, r0
     494: 1e 2e        	cmp	r6, #30
     496: 00 03        	lsls	r0, r0, #12
     498: 0e 3a        	subs	r2, #14
     49a: 0b 3b        	subs	r3, #11
     49c: 0b 11        	asrs	r3, r1, #4
     49e: 01 12        	asrs	r1, r0, #8
     4a0: 06 40        	ands	r6, r0
     4a2: 18 96        	str	r6, [sp, #96]
     4a4: 42 19        	adds	r2, r0, r5
     4a6: 00 00        	movs	r0, r0
     4a8: 1f 2e        	cmp	r6, #31
     4aa: 00 03        	lsls	r0, r0, #12
     4ac: 0e 3a        	subs	r2, #14
     4ae: 0b 3b        	subs	r3, #11
     4b0: 05 11        	asrs	r5, r0, #4
     4b2: 01 12        	asrs	r1, r0, #8
     4b4: 06 40        	ands	r6, r0
     4b6: 18 97        	str	r7, [sp, #96]
     4b8: 42 19        	adds	r2, r0, r5
     4ba: 00 00        	movs	r0, r0
     4bc: 20 2e        	cmp	r6, #32
     4be: 01 3f        	subs	r7, #1
     4c0: 19 03        	lsls	r1, r3, #12
     4c2: 0e 3a        	subs	r2, #14
     4c4: 0b 3b        	subs	r3, #11
     4c6: 0b 11        	asrs	r3, r1, #4
     4c8: 01 12        	asrs	r1, r0, #8
     4ca: 06 40        	ands	r6, r0
     4cc: 18 97        	str	r7, [sp, #96]
     4ce: 42 19        	adds	r2, r0, r5
     4d0: 01 13        	asrs	r1, r0, #12
     4d2: 00 00        	movs	r0, r0
     4d4: 21 89        	ldrh	r1, [r4, #8]
     4d6: 82 01        	lsls	r2, r0, #6
     4d8: 01 11        	asrs	r1, r0, #4
     4da: 01 31        	adds	r1, #1
     4dc: 13 00        	movs	r3, r2
     4de: 00 22        	movs	r2, #0
     4e0: 8a 82        	strh	r2, [r1, #20]
     4e2: 01 00        	movs	r1, r0
     4e4: 02 18        	adds	r2, r0, r0
     4e6: 91 42        	cmp	r1, r2
     4e8: 18 00        	movs	r0, r3
     4ea: 00 23        	movs	r3, #0
     4ec: 2e 01        	lsls	r6, r5, #4
     4ee: 3f 19        	adds	r7, r7, r4
     4f0: 03 0e        	lsrs	r3, r0, #24
     4f2: 3a 0b        	lsrs	r2, r7, #12
     4f4: 3b 0b        	lsrs	r3, r7, #12
     4f6: 27 19        	adds	r7, r4, r4
     4f8: 11 01        	lsls	r1, r2, #4
     4fa: 12 06        	lsls	r2, r2, #24
     4fc: 40 18        	adds	r0, r0, r1
     4fe: 97 42        	cmp	r7, r2
     500: 19 01        	lsls	r1, r3, #4
     502: 13 00        	movs	r3, r2
     504: 00 24        	movs	r4, #0
     506: 89 82        	strh	r1, [r1, #20]
     508: 01 01        	lsls	r1, r0, #4
     50a: 11 01        	lsls	r1, r2, #4
     50c: 31 13        	asrs	r1, r6, #12
     50e: 01 13        	asrs	r1, r0, #12
     510: 00 00        	movs	r0, r0
     512: 25 34        	adds	r4, #37
     514: 00 03        	lsls	r0, r0, #12
     516: 0e 3a        	subs	r2, #14
     518: 0b 3b        	subs	r3, #11
     51a: 0b 49        	ldr	r1, [pc, #44]           @ 0x548 <.debug_info+0x548>
     51c: 13 02        	lsls	r3, r2, #8
     51e: 18 00        	movs	r0, r3
     520: 00 26        	movs	r6, #0
     522: 34 00        	movs	r4, r6
     524: 03 0e        	lsrs	r3, r0, #24
     526: 3a 0b        	lsrs	r2, r7, #12
     528: 3b 0b        	lsrs	r3, r7, #12
     52a: 49 13        	asrs	r1, r1, #13
     52c: 1c 06        	lsls	r4, r3, #24
     52e: 00 00        	movs	r0, r0
     530: 27 34        	adds	r4, #39
     532: 00 03        	lsls	r0, r0, #12
     534: 0e 3a        	subs	r2, #14
     536: 0b 3b        	subs	r3, #11
     538: 0b 49        	ldr	r1, [pc, #44]           @ 0x568 <.debug_info+0x568>
     53a: 13 1c        	adds	r3, r2, #0
     53c: 0b 00        	movs	r3, r1
     53e: 00 28        	cmp	r0, #0
     540: 0b 01        	lsls	r3, r1, #4
     542: 11 01        	lsls	r1, r2, #4
     544: 12 06        	lsls	r2, r2, #24
     546: 01 13        	asrs	r1, r0, #12
     548: 00 00        	movs	r0, r0
     54a: 29 34        	adds	r4, #41
     54c: 00 03        	lsls	r0, r0, #12
     54e: 08 3a        	subs	r2, #8
     550: 0b 3b        	subs	r3, #11
     552: 0b 49        	ldr	r1, [pc, #44]           @ 0x580 <.debug_info+0x580>
     554: 13 02        	lsls	r3, r2, #8
     556: 18 00        	movs	r0, r3
     558: 00 2a        	cmp	r2, #0
     55a: 05 00        	movs	r5, r0
     55c: 03 0e        	lsrs	r3, r0, #24
     55e: 3a 0b        	lsrs	r2, r7, #12
     560: 3b 0b        	lsrs	r3, r7, #12
     562: 49 13        	asrs	r1, r1, #13
     564: 02 18        	adds	r2, r0, r0
     566: 00 00        	movs	r0, r0
     568: 2b 1d        	adds	r3, r5, #4
     56a: 01 31        	adds	r1, #1
     56c: 13 11        	asrs	r3, r2, #4
     56e: 01 12        	asrs	r1, r0, #8
     570: 06 58        	ldr	r6, [r0, r0]
     572: 0b 59        	ldr	r3, [r1, r4]
     574: 0b 01        	lsls	r3, r1, #4
     576: 13 00        	movs	r3, r2
     578: 00 2c        	cmp	r4, #0
     57a: 05 00        	movs	r5, r0
     57c: 31 13        	asrs	r1, r6, #12
     57e: 1c 0b        	lsrs	r4, r3, #12
     580: 00 00        	movs	r0, r0
     582: 2d 89        	ldrh	r5, [r5, #8]
     584: 82 01        	lsls	r2, r0, #6
     586: 00 11        	asrs	r0, r0, #4
     588: 01 31        	adds	r1, #1
     58a: 13 00        	movs	r3, r2
     58c: 00 2e        	cmp	r6, #0
     58e: 89 82        	strh	r1, [r1, #20]
     590: 01 01        	lsls	r1, r0, #4
     592: 11 01        	lsls	r1, r2, #4
     594: 93 42        	cmp	r3, r2
     596: 18 00        	movs	r0, r3
     598: 00 2f        	cmp	r7, #0
     59a: 0f 00        	movs	r7, r1
     59c: 0b 0b        	lsrs	r3, r1, #12
     59e: 49 13        	asrs	r1, r1, #13
     5a0: 00 00        	movs	r0, r0
     5a2: 30 2e        	cmp	r6, #48
     5a4: 01 3f        	subs	r7, #1
     5a6: 19 03        	lsls	r1, r3, #12
     5a8: 0e 3a        	subs	r2, #14
     5aa: 0b 3b        	subs	r3, #11
     5ac: 0b 27        	movs	r7, #11
     5ae: 19 49        	ldr	r1, [pc, #100]          @ 0x614 <.debug_info+0x614>
     5b0: 13 11        	asrs	r3, r2, #4
     5b2: 01 12        	asrs	r1, r0, #8
     5b4: 06 40        	ands	r6, r0
     5b6: 18 97        	str	r7, [sp, #96]
     5b8: 42 19        	adds	r2, r0, r5
     5ba: 01 13        	asrs	r1, r0, #12
     5bc: 00 00        	movs	r0, r0
     5be: 31 05        	lsls	r1, r6, #20
     5c0: 00 31        	adds	r1, #0
     5c2: 13 02        	lsls	r3, r2, #8
     5c4: 17 00        	movs	r7, r2
     5c6: 00 32        	adds	r2, #0
     5c8: 2e 01        	lsls	r6, r5, #4
     5ca: 3f 19        	adds	r7, r7, r4
     5cc: 03 0e        	lsrs	r3, r0, #24
     5ce: 3a 0b        	lsrs	r2, r7, #12
     5d0: 3b 05        	lsls	r3, r7, #20
     5d2: 11 01        	lsls	r1, r2, #4
     5d4: 12 06        	lsls	r2, r2, #24
     5d6: 40 18        	adds	r0, r0, r1
     5d8: 97 42        	cmp	r7, r2
     5da: 19 01        	lsls	r1, r3, #4
     5dc: 13 00        	movs	r3, r2
     5de: 00 33        	adds	r3, #0
     5e0: 34 00        	movs	r4, r6
     5e2: 03 0e        	lsrs	r3, r0, #24
     5e4: 3a 0b        	lsrs	r2, r7, #12
     5e6: 3b 05        	lsls	r3, r7, #20
     5e8: 49 13        	asrs	r1, r1, #13
     5ea: 3f 19        	adds	r7, r7, r4
     5ec: 3c 19        	adds	r4, r7, r4
     5ee: 00 00        	movs	r0, r0
     5f0: 34 2e        	cmp	r6, #52
     5f2: 01 3f        	subs	r7, #1
     5f4: 19 03        	lsls	r1, r3, #12
     5f6: 0e 3a        	subs	r2, #14
     5f8: 0b 3b        	subs	r3, #11
     5fa: 05 27        	movs	r7, #5
     5fc: 19 3c        	subs	r4, #25
     5fe: 19 01        	lsls	r1, r3, #4
     600: 13 00        	movs	r3, r2
     602: 00 35        	adds	r5, #0
     604: 2e 01        	lsls	r6, r5, #4
     606: 3f 19        	adds	r7, r7, r4
     608: 03 0e        	lsrs	r3, r0, #24
     60a: 3a 0b        	lsrs	r2, r7, #12
     60c: 3b 05        	lsls	r3, r7, #20
     60e: 27 19        	adds	r7, r4, r4
     610: 3c 19        	adds	r4, r7, r4
     612: 00 00        	movs	r0, r0
     614: 00 01        	lsls	r0, r0, #4
     616: 11 00        	movs	r1, r2
     618: 10 06        	lsls	r0, r2, #24
     61a: 11 01        	lsls	r1, r2, #4
     61c: 12 01        	lsls	r2, r2, #4
     61e: 03 08        	lsrs	r3, r0, #32
     620: 1b 08        	lsrs	r3, r3, #32
     622: 25 08        	lsrs	r5, r4, #32
     624: 13 05        	lsls	r3, r2, #20
     626: 00 00        	movs	r0, r0
     628: 00 01        	lsls	r0, r0, #4
     62a: 11 01        	lsls	r1, r2, #4
     62c: 25 0e        	lsrs	r5, r4, #24
     62e: 13 0b        	lsrs	r3, r2, #12
     630: 03 0e        	lsrs	r3, r0, #24
     632: 1b 0e        	lsrs	r3, r3, #24
     634: 11 01        	lsls	r1, r2, #4
     636: 12 06        	lsls	r2, r2, #24
     638: 10 17        	asrs	r0, r2, #28
     63a: 00 00        	movs	r0, r0
     63c: 02 24        	movs	r4, #2
     63e: 00 0b        	lsrs	r0, r0, #12
     640: 0b 3e        	subs	r6, #11
     642: 0b 03        	lsls	r3, r1, #12
     644: 0e 00        	movs	r6, r1
     646: 00 03        	lsls	r0, r0, #12
     648: 16 00        	movs	r6, r2
     64a: 03 0e        	lsrs	r3, r0, #24
     64c: 3a 0b        	lsrs	r2, r7, #12
     64e: 3b 0b        	lsrs	r3, r7, #12
     650: 49 13        	asrs	r1, r1, #13
     652: 00 00        	movs	r0, r0
     654: 04 24        	movs	r4, #4
     656: 00 0b        	lsrs	r0, r0, #12
     658: 0b 3e        	subs	r6, #11
     65a: 0b 03        	lsls	r3, r1, #12
     65c: 08 00        	movs	r0, r1
     65e: 00 05        	lsls	r0, r0, #20
     660: 35 00        	movs	r5, r6
     662: 49 13        	asrs	r1, r1, #13
     664: 00 00        	movs	r0, r0
     666: 06 01        	lsls	r6, r0, #4
     668: 01 49        	ldr	r1, [pc, #4]            @ 0x670 <.debug_info+0x670>
     66a: 13 01        	lsls	r3, r2, #4
     66c: 13 00        	movs	r3, r2
     66e: 00 07        	lsls	r0, r0, #28
     670: 21 00        	movs	r1, r4
     672: 49 13        	asrs	r1, r1, #13
     674: 2f 0b        	lsrs	r7, r5, #12
     676: 00 00        	movs	r0, r0
     678: 08 04        	lsls	r0, r1, #16
     67a: 01 0b        	lsrs	r1, r0, #12
     67c: 0b 3a        	subs	r2, #11
     67e: 0b 3b        	subs	r3, #11
     680: 05 01        	lsls	r5, r0, #4
     682: 13 00        	movs	r3, r2
     684: 00 09        	lsrs	r0, r0, #4
     686: 28 00        	movs	r0, r5
     688: 03 0e        	lsrs	r3, r0, #24
     68a: 1c 0d        	lsrs	r4, r3, #20
     68c: 00 00        	movs	r0, r0
     68e: 0a 28        	cmp	r0, #10
     690: 00 03        	lsls	r0, r0, #12
     692: 08 1c        	adds	r0, r1, #0
     694: 0d 00        	movs	r5, r1
     696: 00 0b        	lsrs	r0, r0, #12
     698: 16 00        	movs	r6, r2
     69a: 03 0e        	lsrs	r3, r0, #24
     69c: 3a 0b        	lsrs	r2, r7, #12
     69e: 3b 05        	lsls	r3, r7, #20
     6a0: 49 13        	asrs	r1, r1, #13
     6a2: 00 00        	movs	r0, r0
     6a4: 0c 13        	asrs	r4, r1, #12
     6a6: 01 0b        	lsrs	r1, r0, #12
     6a8: 0b 3a        	subs	r2, #11
     6aa: 0b 3b        	subs	r3, #11
     6ac: 05 01        	lsls	r5, r0, #4
     6ae: 13 00        	movs	r3, r2
     6b0: 00 0d        	lsrs	r0, r0, #20
     6b2: 0d 00        	movs	r5, r1
     6b4: 03 08        	lsrs	r3, r0, #32
     6b6: 3a 0b        	lsrs	r2, r7, #12
     6b8: 3b 05        	lsls	r3, r7, #20
     6ba: 49 13        	asrs	r1, r1, #13
     6bc: 38 0b        	lsrs	r0, r7, #12
     6be: 00 00        	movs	r0, r0
     6c0: 0e 0d        	lsrs	r6, r1, #20
     6c2: 00 03        	lsls	r0, r0, #12
     6c4: 0e 3a        	subs	r2, #14
     6c6: 0b 3b        	subs	r3, #11
     6c8: 05 49        	ldr	r1, [pc, #20]           @ 0x6e0 <.debug_info+0x6e0>
     6ca: 13 38        	subs	r0, #19
     6cc: 0b 00        	movs	r3, r1
     6ce: 00 0f        	lsrs	r0, r0, #28
     6d0: 13 01        	lsls	r3, r2, #4
     6d2: 0b 0b        	lsrs	r3, r1, #12
     6d4: 3a 0b        	lsrs	r2, r7, #12
     6d6: 3b 0b        	lsrs	r3, r7, #12
     6d8: 01 13        	asrs	r1, r0, #12
     6da: 00 00        	movs	r0, r0
     6dc: 10 0d        	lsrs	r0, r2, #20
     6de: 00 03        	lsls	r0, r0, #12
     6e0: 0e 3a        	subs	r2, #14
     6e2: 0b 3b        	subs	r3, #11
     6e4: 0b 49        	ldr	r1, [pc, #44]           @ 0x714 <.debug_info+0x714>
     6e6: 13 38        	subs	r0, #19
     6e8: 0b 00        	movs	r3, r1
     6ea: 00 11        	asrs	r0, r0, #4
     6ec: 2e 00        	movs	r6, r5
     6ee: 3f 19        	adds	r7, r7, r4
     6f0: 03 0e        	lsrs	r3, r0, #24
     6f2: 3a 0b        	lsrs	r2, r7, #12
     6f4: 3b 0b        	lsrs	r3, r7, #12
     6f6: 27 19        	adds	r7, r4, r4
     6f8: 11 01        	lsls	r1, r2, #4
     6fa: 12 06        	lsls	r2, r2, #24
     6fc: 40 18        	adds	r0, r0, r1
     6fe: 97 42        	cmp	r7, r2
     700: 19 00        	movs	r1, r3
     702: 00 12        	asrs	r0, r0, #8
     704: 2e 01        	lsls	r6, r5, #4
     706: 3f 19        	adds	r7, r7, r4
     708: 03 0e        	lsrs	r3, r0, #24
     70a: 3a 0b        	lsrs	r2, r7, #12
     70c: 3b 0b        	lsrs	r3, r7, #12
     70e: 27 19        	adds	r7, r4, r4
     710: 11 01        	lsls	r1, r2, #4
     712: 12 06        	lsls	r2, r2, #24
     714: 40 18        	adds	r0, r0, r1
     716: 97 42        	cmp	r7, r2
     718: 19 01        	lsls	r1, r3, #4
     71a: 13 00        	movs	r3, r2
     71c: 00 13        	asrs	r0, r0, #12
     71e: 05 00        	movs	r5, r0
     720: 03 0e        	lsrs	r3, r0, #24
     722: 3a 0b        	lsrs	r2, r7, #12
     724: 3b 0b        	lsrs	r3, r7, #12
     726: 49 13        	asrs	r1, r1, #13
     728: 02 18        	adds	r2, r0, r0
     72a: 00 00        	movs	r0, r0
     72c: 14 2e        	cmp	r6, #20
     72e: 01 3f        	subs	r7, #1
     730: 19 03        	lsls	r1, r3, #12
     732: 0e 3a        	subs	r2, #14
     734: 0b 3b        	subs	r3, #11
     736: 05 27        	movs	r7, #5
     738: 19 11        	asrs	r1, r3, #4
     73a: 01 12        	asrs	r1, r0, #8
     73c: 06 40        	ands	r6, r0
     73e: 18 97        	str	r7, [sp, #96]
     740: 42 19        	adds	r2, r0, r5
     742: 01 13        	asrs	r1, r0, #12
     744: 00 00        	movs	r0, r0
     746: 15 05        	lsls	r5, r2, #20
     748: 00 03        	lsls	r0, r0, #12
     74a: 0e 3a        	subs	r2, #14
     74c: 0b 3b        	subs	r3, #11
     74e: 05 49        	ldr	r1, [pc, #20]           @ 0x764 <.debug_info+0x764>
     750: 13 02        	lsls	r3, r2, #8
     752: 17 00        	movs	r7, r2
     754: 00 16        	asrs	r0, r0, #24
     756: 34 00        	movs	r4, r6
     758: 03 0e        	lsrs	r3, r0, #24
     75a: 3a 0b        	lsrs	r2, r7, #12
     75c: 3b 05        	lsls	r3, r7, #20
     75e: 49 13        	asrs	r1, r1, #13
     760: 02 17        	asrs	r2, r0, #28
     762: 00 00        	movs	r0, r0
     764: 17 05        	lsls	r7, r2, #20
     766: 00 03        	lsls	r0, r0, #12
     768: 0e 3a        	subs	r2, #14
     76a: 0b 3b        	subs	r3, #11
     76c: 05 49        	ldr	r1, [pc, #20]           @ 0x784 <.debug_info+0x784>
     76e: 13 02        	lsls	r3, r2, #8
     770: 18 00        	movs	r0, r3
     772: 00 18        	adds	r0, r0, r0
     774: 2e 00        	movs	r6, r5
     776: 3f 19        	adds	r7, r7, r4
     778: 03 0e        	lsrs	r3, r0, #24
     77a: 3a 0b        	lsrs	r2, r7, #12
     77c: 3b 05        	lsls	r3, r7, #20
     77e: 27 19        	adds	r7, r4, r4
     780: 49 13        	asrs	r1, r1, #13
     782: 11 01        	lsls	r1, r2, #4
     784: 12 06        	lsls	r2, r2, #24
     786: 40 18        	adds	r0, r0, r1
     788: 97 42        	cmp	r7, r2
     78a: 19 00        	movs	r1, r3
     78c: 00 19        	adds	r0, r0, r4
     78e: 34 00        	movs	r4, r6
     790: 03 08        	lsrs	r3, r0, #32
     792: 3a 0b        	lsrs	r2, r7, #12
     794: 3b 05        	lsls	r3, r7, #20
     796: 49 13        	asrs	r1, r1, #13
     798: 02 17        	asrs	r2, r0, #28
     79a: 00 00        	movs	r0, r0
     79c: 1a 0f        	lsrs	r2, r3, #28
     79e: 00 0b        	lsrs	r0, r0, #12
     7a0: 0b 49        	ldr	r1, [pc, #44]           @ 0x7d0 <.debug_info+0x7d0>
     7a2: 13 00        	movs	r3, r2
     7a4: 00 1b        	subs	r0, r0, r4
     7a6: 2e 01        	lsls	r6, r5, #4
     7a8: 3f 19        	adds	r7, r7, r4
     7aa: 03 0e        	lsrs	r3, r0, #24
     7ac: 3a 0b        	lsrs	r2, r7, #12
     7ae: 3b 05        	lsls	r3, r7, #20
     7b0: 27 19        	adds	r7, r4, r4
     7b2: 49 13        	asrs	r1, r1, #13
     7b4: 11 01        	lsls	r1, r2, #4
     7b6: 12 06        	lsls	r2, r2, #24
     7b8: 40 18        	adds	r0, r0, r1
     7ba: 97 42        	cmp	r7, r2
     7bc: 19 01        	lsls	r1, r3, #4
     7be: 13 00        	movs	r3, r2
     7c0: 00 1c        	adds	r0, r0, #0
     7c2: 34 00        	movs	r4, r6
     7c4: 03 0e        	lsrs	r3, r0, #24
     7c6: 3a 0b        	lsrs	r2, r7, #12
     7c8: 3b 05        	lsls	r3, r7, #20
     7ca: 49 13        	asrs	r1, r1, #13
     7cc: 02 18        	adds	r2, r0, r0
     7ce: 00 00        	movs	r0, r0
     7d0: 1d 89        	ldrh	r5, [r3, #8]
     7d2: 82 01        	lsls	r2, r0, #6
     7d4: 01 11        	asrs	r1, r0, #4
     7d6: 01 31        	adds	r1, #1
     7d8: 13 01        	lsls	r3, r2, #4
     7da: 13 00        	movs	r3, r2
     7dc: 00 1e        	subs	r0, r0, #0
     7de: 8a 82        	strh	r2, [r1, #20]
     7e0: 01 00        	movs	r1, r0
     7e2: 02 18        	adds	r2, r0, r0
     7e4: 91 42        	cmp	r1, r2
     7e6: 18 00        	movs	r0, r3
     7e8: 00 1f        	subs	r0, r0, #4
     7ea: 89 82        	strh	r1, [r1, #20]
     7ec: 01 01        	lsls	r1, r0, #4
     7ee: 11 01        	lsls	r1, r2, #4
     7f0: 31 13        	asrs	r1, r6, #12
     7f2: 00 00        	movs	r0, r0
     7f4: 20 2e        	cmp	r6, #32
     7f6: 00 3f        	subs	r7, #0
     7f8: 19 03        	lsls	r1, r3, #12
     7fa: 0e 3a        	subs	r2, #14
     7fc: 0b 3b        	subs	r3, #11
     7fe: 05 27        	movs	r7, #5
     800: 19 11        	asrs	r1, r3, #4
     802: 01 12        	asrs	r1, r0, #8
     804: 06 40        	ands	r6, r0
     806: 18 97        	str	r7, [sp, #96]
     808: 42 19        	adds	r2, r0, r5
     80a: 00 00        	movs	r0, r0
     80c: 21 34        	adds	r4, #33
     80e: 00 03        	lsls	r0, r0, #12
     810: 0e 3a        	subs	r2, #14
     812: 0b 3b        	subs	r3, #11
     814: 0b 49        	ldr	r1, [pc, #44]           @ 0x844 <.debug_info+0x844>
     816: 13 02        	lsls	r3, r2, #8
     818: 18 00        	movs	r0, r3
     81a: 00 22        	movs	r2, #0
     81c: 26 00        	movs	r6, r4
     81e: 49 13        	asrs	r1, r1, #13
     820: 00 00        	movs	r0, r0
     822: 23 34        	adds	r4, #35
     824: 00 03        	lsls	r0, r0, #12
     826: 0e 3a        	subs	r2, #14
     828: 0b 3b        	subs	r3, #11
     82a: 05 49        	ldr	r1, [pc, #20]           @ 0x840 <.debug_info+0x840>
     82c: 13 3f        	subs	r7, #19
     82e: 19 3c        	subs	r4, #25
     830: 19 00        	movs	r1, r3
     832: 00 00        	movs	r0, r0
     834: 01 11        	asrs	r1, r0, #4
     836: 01 25        	movs	r5, #1
     838: 0e 13        	asrs	r6, r1, #12
     83a: 0b 03        	lsls	r3, r1, #12
     83c: 0e 1b        	subs	r6, r1, r4
     83e: 0e 11        	asrs	r6, r1, #4
     840: 01 12        	asrs	r1, r0, #8
     842: 06 10        	asrs	r6, r0, #32
     844: 17 00        	movs	r7, r2
     846: 00 02        	lsls	r0, r0, #8
     848: 24 00        	movs	r4, r4
     84a: 0b 0b        	lsrs	r3, r1, #12
     84c: 3e 0b        	lsrs	r6, r7, #12
     84e: 03 0e        	lsrs	r3, r0, #24
     850: 00 00        	movs	r0, r0
     852: 03 16        	asrs	r3, r0, #24
     854: 00 03        	lsls	r0, r0, #12
     856: 0e 3a        	subs	r2, #14
     858: 0b 3b        	subs	r3, #11
     85a: 0b 49        	ldr	r1, [pc, #44]           @ 0x888 <.debug_info+0x888>
     85c: 13 00        	movs	r3, r2
     85e: 00 04        	lsls	r0, r0, #16
     860: 24 00        	movs	r4, r4
     862: 0b 0b        	lsrs	r3, r1, #12
     864: 3e 0b        	lsrs	r6, r7, #12
     866: 03 08        	lsrs	r3, r0, #32
     868: 00 00        	movs	r0, r0
     86a: 05 35        	adds	r5, #5
     86c: 00 49        	ldr	r1, [pc, #0]            @ 0x870 <.debug_info+0x870>
     86e: 13 00        	movs	r3, r2
     870: 00 06        	lsls	r0, r0, #24
     872: 01 01        	lsls	r1, r0, #4
     874: 49 13        	asrs	r1, r1, #13
     876: 01 13        	asrs	r1, r0, #12
     878: 00 00        	movs	r0, r0
     87a: 07 21        	movs	r1, #7
     87c: 00 49        	ldr	r1, [pc, #0]            @ 0x880 <.debug_info+0x880>
     87e: 13 2f        	cmp	r7, #19
     880: 0b 00        	movs	r3, r1
     882: 00 08        	lsrs	r0, r0, #32
     884: 04 01        	lsls	r4, r0, #4
     886: 0b 0b        	lsrs	r3, r1, #12
     888: 3a 0b        	lsrs	r2, r7, #12
     88a: 3b 05        	lsls	r3, r7, #20
     88c: 01 13        	asrs	r1, r0, #12
     88e: 00 00        	movs	r0, r0
     890: 09 28        	cmp	r0, #9
     892: 00 03        	lsls	r0, r0, #12
     894: 0e 1c        	adds	r6, r1, #0
     896: 0d 00        	movs	r5, r1
     898: 00 0a        	lsrs	r0, r0, #8
     89a: 16 00        	movs	r6, r2
     89c: 03 0e        	lsrs	r3, r0, #24
     89e: 3a 0b        	lsrs	r2, r7, #12
     8a0: 3b 05        	lsls	r3, r7, #20
     8a2: 49 13        	asrs	r1, r1, #13
     8a4: 00 00        	movs	r0, r0
     8a6: 0b 13        	asrs	r3, r1, #12
     8a8: 01 0b        	lsrs	r1, r0, #12
     8aa: 0b 3a        	subs	r2, #11
     8ac: 0b 3b        	subs	r3, #11
     8ae: 05 01        	lsls	r5, r0, #4
     8b0: 13 00        	movs	r3, r2
     8b2: 00 0c        	lsrs	r0, r0, #16
     8b4: 0d 00        	movs	r5, r1
     8b6: 03 0e        	lsrs	r3, r0, #24
     8b8: 3a 0b        	lsrs	r2, r7, #12
     8ba: 3b 05        	lsls	r3, r7, #20
     8bc: 49 13        	asrs	r1, r1, #13
     8be: 38 0b        	lsrs	r0, r7, #12
     8c0: 00 00        	movs	r0, r0
     8c2: 0d 0d        	lsrs	r5, r1, #20
     8c4: 00 03        	lsls	r0, r0, #12
     8c6: 08 3a        	subs	r2, #8
     8c8: 0b 3b        	subs	r3, #11
     8ca: 05 49        	ldr	r1, [pc, #20]           @ 0x8e0 <.debug_info+0x8e0>
     8cc: 13 38        	subs	r0, #19
     8ce: 0b 00        	movs	r3, r1
     8d0: 00 0e        	lsrs	r0, r0, #24
     8d2: 04 01        	lsls	r4, r0, #4
     8d4: 0b 0b        	lsrs	r3, r1, #12
     8d6: 3a 0b        	lsrs	r2, r7, #12
     8d8: 3b 0b        	lsrs	r3, r7, #12
     8da: 01 13        	asrs	r1, r0, #12
     8dc: 00 00        	movs	r0, r0
     8de: 0f 13        	asrs	r7, r1, #12
     8e0: 01 0b        	lsrs	r1, r0, #12
     8e2: 0b 3a        	subs	r2, #11
     8e4: 0b 3b        	subs	r3, #11
     8e6: 0b 01        	lsls	r3, r1, #4
     8e8: 13 00        	movs	r3, r2
     8ea: 00 10        	asrs	r0, r0, #32
     8ec: 0d 00        	movs	r5, r1
     8ee: 03 0e        	lsrs	r3, r0, #24
     8f0: 3a 0b        	lsrs	r2, r7, #12
     8f2: 3b 0b        	lsrs	r3, r7, #12
     8f4: 49 13        	asrs	r1, r1, #13
     8f6: 38 0b        	lsrs	r0, r7, #12
     8f8: 00 00        	movs	r0, r0
     8fa: 11 2e        	cmp	r6, #17
     8fc: 01 3f        	subs	r7, #1
     8fe: 19 03        	lsls	r1, r3, #12
     900: 0e 3a        	subs	r2, #14
     902: 0b 3b        	subs	r3, #11
     904: 0b 27        	movs	r7, #11
     906: 19 11        	asrs	r1, r3, #4
     908: 01 12        	asrs	r1, r0, #8
     90a: 06 40        	ands	r6, r0
     90c: 18 97        	str	r7, [sp, #96]
     90e: 42 19        	adds	r2, r0, r5
     910: 01 13        	asrs	r1, r0, #12
     912: 00 00        	movs	r0, r0
     914: 12 05        	lsls	r2, r2, #20
     916: 00 03        	lsls	r0, r0, #12
     918: 0e 3a        	subs	r2, #14
     91a: 0b 3b        	subs	r3, #11
     91c: 0b 49        	ldr	r1, [pc, #44]           @ 0x94c <.debug_info+0x94c>
     91e: 13 02        	lsls	r3, r2, #8
     920: 17 00        	movs	r7, r2
     922: 00 13        	asrs	r0, r0, #12
     924: 89 82        	strh	r1, [r1, #20]
     926: 01 01        	lsls	r1, r0, #4
     928: 11 01        	lsls	r1, r2, #4
     92a: 31 13        	asrs	r1, r6, #12
     92c: 01 13        	asrs	r1, r0, #12
     92e: 00 00        	movs	r0, r0
     930: 14 8a        	ldrh	r4, [r2, #16]
     932: 82 01        	lsls	r2, r0, #6
     934: 00 02        	lsls	r0, r0, #8
     936: 18 91        	str	r1, [sp, #96]
     938: 42 18        	adds	r2, r0, r1
     93a: 00 00        	movs	r0, r0
     93c: 15 89        	ldrh	r5, [r2, #8]
     93e: 82 01        	lsls	r2, r0, #6
     940: 01 11        	asrs	r1, r0, #4
     942: 01 31        	adds	r1, #1
     944: 13 00        	movs	r3, r2
     946: 00 16        	asrs	r0, r0, #24
     948: 0f 00        	movs	r7, r1
     94a: 0b 0b        	lsrs	r3, r1, #12
     94c: 49 13        	asrs	r1, r1, #13
     94e: 00 00        	movs	r0, r0
     950: 17 05        	lsls	r7, r2, #20
     952: 00 03        	lsls	r0, r0, #12
     954: 0e 3a        	subs	r2, #14
     956: 0b 3b        	subs	r3, #11
     958: 0b 49        	ldr	r1, [pc, #44]           @ 0x988 <.debug_info+0x988>
     95a: 13 02        	lsls	r3, r2, #8
     95c: 18 00        	movs	r0, r3
     95e: 00 18        	adds	r0, r0, r0
     960: 34 00        	movs	r4, r6
     962: 03 0e        	lsrs	r3, r0, #24
     964: 3a 0b        	lsrs	r2, r7, #12
     966: 3b 0b        	lsrs	r3, r7, #12
     968: 49 13        	asrs	r1, r1, #13
     96a: 02 17        	asrs	r2, r0, #28
     96c: 00 00        	movs	r0, r0
     96e: 19 34        	adds	r4, #25
     970: 00 03        	lsls	r0, r0, #12
     972: 08 3a        	subs	r2, #8
     974: 0b 3b        	subs	r3, #11
     976: 0b 49        	ldr	r1, [pc, #44]           @ 0x9a4 <.debug_info+0x9a4>
     978: 13 02        	lsls	r3, r2, #8
     97a: 17 00        	movs	r7, r2
     97c: 00 1a        	subs	r0, r0, r0
     97e: 2e 01        	lsls	r6, r5, #4
     980: 3f 19        	adds	r7, r7, r4
     982: 03 0e        	lsrs	r3, r0, #24
     984: 3a 0b        	lsrs	r2, r7, #12
     986: 3b 05        	lsls	r3, r7, #20
     988: 27 19        	adds	r7, r4, r4
     98a: 11 01        	lsls	r1, r2, #4
     98c: 12 06        	lsls	r2, r2, #24
     98e: 40 18        	adds	r0, r0, r1
     990: 97 42        	cmp	r7, r2
     992: 19 01        	lsls	r1, r3, #4
     994: 13 00        	movs	r3, r2
     996: 00 1b        	subs	r0, r0, r4
     998: 05 00        	movs	r5, r0
     99a: 03 0e        	lsrs	r3, r0, #24
     99c: 3a 0b        	lsrs	r2, r7, #12
     99e: 3b 05        	lsls	r3, r7, #20
     9a0: 49 13        	asrs	r1, r1, #13
     9a2: 02 18        	adds	r2, r0, r0
     9a4: 00 00        	movs	r0, r0
     9a6: 1c 34        	adds	r4, #28
     9a8: 00 03        	lsls	r0, r0, #12
     9aa: 08 3a        	subs	r2, #8
     9ac: 0b 3b        	subs	r3, #11
     9ae: 05 49        	ldr	r1, [pc, #20]           @ 0x9c4 <.debug_info+0x9c4>
     9b0: 13 02        	lsls	r3, r2, #8
     9b2: 18 00        	movs	r0, r3
     9b4: 00 1d        	adds	r0, r0, #4
     9b6: 2e 01        	lsls	r6, r5, #4
     9b8: 3f 19        	adds	r7, r7, r4
     9ba: 03 0e        	lsrs	r3, r0, #24
     9bc: 3a 0b        	lsrs	r2, r7, #12
     9be: 3b 05        	lsls	r3, r7, #20
     9c0: 27 19        	adds	r7, r4, r4
     9c2: 49 13        	asrs	r1, r1, #13
     9c4: 11 01        	lsls	r1, r2, #4
     9c6: 12 06        	lsls	r2, r2, #24
     9c8: 40 18        	adds	r0, r0, r1
     9ca: 97 42        	cmp	r7, r2
     9cc: 19 01        	lsls	r1, r3, #4
     9ce: 13 00        	movs	r3, r2
     9d0: 00 1e        	subs	r0, r0, #0
     9d2: 05 00        	movs	r5, r0
     9d4: 03 0e        	lsrs	r3, r0, #24
     9d6: 3a 0b        	lsrs	r2, r7, #12
     9d8: 3b 05        	lsls	r3, r7, #20
     9da: 49 13        	asrs	r1, r1, #13
     9dc: 02 17        	asrs	r2, r0, #28
     9de: 00 00        	movs	r0, r0
     9e0: 1f 34        	adds	r4, #31
     9e2: 00 03        	lsls	r0, r0, #12
     9e4: 0e 3a        	subs	r2, #14
     9e6: 0b 3b        	subs	r3, #11
     9e8: 05 49        	ldr	r1, [pc, #20]           @ 0xa00 <.debug_info+0xa00>
     9ea: 13 02        	lsls	r3, r2, #8
     9ec: 17 00        	movs	r7, r2
     9ee: 00 20        	movs	r0, #0
     9f0: 34 00        	movs	r4, r6
     9f2: 03 0e        	lsrs	r3, r0, #24
     9f4: 3a 0b        	lsrs	r2, r7, #12
     9f6: 3b 05        	lsls	r3, r7, #20
     9f8: 49 13        	asrs	r1, r1, #13
     9fa: 3f 19        	adds	r7, r7, r4
     9fc: 3c 19        	adds	r4, r7, r4
     9fe: 00 00        	movs	r0, r0
     a00: 21 2e        	cmp	r6, #33
     a02: 01 3f        	subs	r7, #1
     a04: 19 03        	lsls	r1, r3, #12
     a06: 0e 3a        	subs	r2, #14
     a08: 0b 3b        	subs	r3, #11
     a0a: 05 27        	movs	r7, #5
     a0c: 19 3c        	subs	r4, #25
     a0e: 19 00        	movs	r1, r3
     a10: 00 22        	movs	r2, #0
     a12: 05 00        	movs	r5, r0
     a14: 49 13        	asrs	r1, r1, #13
     a16: 00 00        	movs	r0, r0
     a18: 00           	<unknown>

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
		...
       8: 01 00        	movs	r1, r0
       a: 50 00        	lsls	r0, r2, #1
       c: 00 00        	movs	r0, r0
       e: 00 00        	movs	r0, r0
      10: 00 00        	movs	r0, r0
      12: 00 04        	lsls	r0, r0, #16
      14: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
      18: 9f 00        	lsls	r7, r3, #2
      1a: 00 00        	movs	r0, r0
      1c: 00 00        	movs	r0, r0
      1e: 00 00        	movs	r0, r0
      20: 00 01        	lsls	r0, r0, #4
      22: 00 50        	str	r0, [r0, r0]
		...
      2c: 04 00        	movs	r4, r0
      2e: f3 01        	lsls	r3, r6, #7
      30: 50 9f        	ldr	r7, [sp, #320]
		...
      42: 01 00        	movs	r1, r0
      44: 51 00        	lsls	r1, r2, #1
      46: 00 00        	movs	r0, r0
      48: 00 00        	movs	r0, r0
      4a: 00 00        	movs	r0, r0
      4c: 00 04        	lsls	r0, r0, #16
      4e: 00 f3 01 51  	ssat	r1, #2, r0, lsl #20
      52: 9f 00        	lsls	r7, r3, #2
      54: 00 00        	movs	r0, r0
      56: 00 00        	movs	r0, r0
      58: 00 00        	movs	r0, r0
      5a: 00 01        	lsls	r0, r0, #4
      5c: 00 51        	str	r0, [r0, r4]
		...
      66: 04 00        	movs	r4, r0
      68: f3 01        	lsls	r3, r6, #7
      6a: 51 9f        	ldr	r7, [sp, #324]
		...
      7c: 01 00        	movs	r1, r0
      7e: 50 00        	lsls	r0, r2, #1
      80: 00 00        	movs	r0, r0
      82: 00 00        	movs	r0, r0
      84: 00 00        	movs	r0, r0
      86: 00 01        	lsls	r0, r0, #4
      88: 00 50        	str	r0, [r0, r0]
		...
      9a: 01 00        	movs	r1, r0
      9c: 50 00        	lsls	r0, r2, #1
      9e: 00 00        	movs	r0, r0
      a0: 00 00        	movs	r0, r0
      a2: 00 00        	movs	r0, r0
      a4: 00 01        	lsls	r0, r0, #4
      a6: 00 50        	str	r0, [r0, r0]
		...
      b8: 02 00        	movs	r2, r0
      ba: 30 9f        	ldr	r7, [sp, #192]
		...
      c4: 01 00        	movs	r1, r0
      c6: 53 00        	lsls	r3, r2, #1
		...
      d4: 00 00        	movs	r0, r0
      d6: 00 06        	lsls	r0, r0, #24
      d8: 00 03        	lsls	r0, r0, #12
      da: 00 00        	movs	r0, r0
      dc: 00 00        	movs	r0, r0
      de: 9f 00        	lsls	r7, r3, #2
      e0: 00 00        	movs	r0, r0
      e2: 00 00        	movs	r0, r0
      e4: 00 00        	movs	r0, r0
      e6: 00 06        	lsls	r0, r0, #24
      e8: 00 03        	lsls	r0, r0, #12
      ea: 00 00        	movs	r0, r0
      ec: 00 00        	movs	r0, r0
      ee: 9f 00        	lsls	r7, r3, #2
      f0: 00 00        	movs	r0, r0
      f2: 00 00        	movs	r0, r0
      f4: 00 00        	movs	r0, r0
      f6: 00 01        	lsls	r0, r0, #4
      f8: 00 55        	strb	r0, [r0, r4]
		...
     10a: 05 00        	movs	r5, r0
     10c: 73 00        	lsls	r3, r6, #1
     10e: 36 25        	movs	r5, #54
     110: 9f 00        	lsls	r7, r3, #2
     112: 00 00        	movs	r0, r0
     114: 00 00        	movs	r0, r0
     116: 00 00        	movs	r0, r0
     118: 00 01        	lsls	r0, r0, #4
     11a: 00 53        	strh	r0, [r0, r4]
		...
     124: 03 00        	movs	r3, r0
     126: 73 01        	lsls	r3, r6, #5
     128: 9f 00        	lsls	r7, r3, #2
     12a: 00 00        	movs	r0, r0
     12c: 00 00        	movs	r0, r0
     12e: 00 00        	movs	r0, r0
     130: 00 06        	lsls	r0, r0, #24
     132: 00 72        	strb	r0, [r0, #8]
     134: 04 06        	lsls	r4, r0, #24
     136: 23 01        	lsls	r3, r4, #4
     138: 9f 00        	lsls	r7, r3, #2
		...
     146: 00 00        	movs	r0, r0
     148: 00 02        	lsls	r0, r0, #8
     14a: 00 30        	adds	r0, #0
     14c: 9f 00        	lsls	r7, r3, #2
     14e: 00 00        	movs	r0, r0
     150: 00 00        	movs	r0, r0
     152: 00 00        	movs	r0, r0
     154: 00 01        	lsls	r0, r0, #4
     156: 00 54        	strb	r0, [r0, r0]
		...
     160: 02 00        	movs	r2, r0
     162: 30 9f        	ldr	r7, [sp, #192]
		...
     16c: 02 00        	movs	r2, r0
     16e: 31 9f        	ldr	r7, [sp, #196]
		...
     178: 01 00        	movs	r1, r0
     17a: 54 00        	lsls	r4, r2, #1
     17c: 00 00        	movs	r0, r0
     17e: 00 00        	movs	r0, r0
     180: 00 00        	movs	r0, r0
     182: 00 6c        	ldr	r0, [r0, #64]
     184: 09 00        	movs	r1, r1
     186: 20 aa        	add	r2, sp, #128
     188: 09 00        	movs	r1, r1
     18a: 20 01        	lsls	r0, r4, #4
     18c: 00 50        	str	r0, [r0, r0]
     18e: aa 09        	lsrs	r2, r5, #6
     190: 00 20        	movs	r0, #0
     192: e0 09        	lsrs	r0, r4, #7
     194: 00 20        	movs	r0, #0
     196: 04 00        	movs	r4, r0
     198: f3 01        	lsls	r3, r6, #7
     19a: 50 9f        	ldr	r7, [sp, #320]
		...
     1a4: 6c 09        	lsrs	r4, r5, #5
     1a6: 00 20        	movs	r0, #0
     1a8: bc 09        	lsrs	r4, r7, #6
     1aa: 00 20        	movs	r0, #0
     1ac: 01 00        	movs	r1, r0
     1ae: 51 bc        	pop	{r0, r4, r6}
     1b0: 09 00        	movs	r1, r1
     1b2: 20 e0        	b	0x1f6 <.debug_info+0x1f6> @ imm = #64
     1b4: 09 00        	movs	r1, r1
     1b6: 20 04        	lsls	r0, r4, #16
     1b8: 00 f3 01 51  	ssat	r1, #2, r0, lsl #20
     1bc: 9f 00        	lsls	r7, r3, #2
     1be: 00 00        	movs	r0, r0
     1c0: 00 00        	movs	r0, r0
     1c2: 00 00        	movs	r0, r0
     1c4: 00 e0        	b	0x1c8 <.debug_info+0x1c8> @ imm = #0
     1c6: 09 00        	movs	r1, r1
     1c8: 20 e4        	b	0xfffffa0c <CallbackContext+0xffffffffdfffe68c> @ imm = #-1984
     1ca: 09 00        	movs	r1, r1
     1cc: 20 01        	lsls	r0, r4, #4
     1ce: 00 50        	str	r0, [r0, r0]
     1d0: e4 09        	lsrs	r4, r4, #7
     1d2: 00 20        	movs	r0, #0
     1d4: e8 09        	lsrs	r0, r5, #7
     1d6: 00 20        	movs	r0, #0
     1d8: 03 00        	movs	r3, r0
     1da: 70 67        	str	r0, [r6, #116]
     1dc: 9f e8 09 00  	ldm.w	pc, {r0, r3}
     1e0: 20 f8 09 00  	strh.w	r0, [r0, r9]
     1e4: 20 04        	lsls	r0, r4, #16
     1e6: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     1ea: 9f 00        	lsls	r7, r3, #2
     1ec: 00 00        	movs	r0, r0
     1ee: 00 00        	movs	r0, r0
     1f0: 00 00        	movs	r0, r0
     1f2: 00 f8 09 00  	strb.w	r0, [r0, r9]
     1f6: 20 18        	adds	r0, r4, r0
     1f8: 0a 00        	movs	r2, r1
     1fa: 20 01        	lsls	r0, r4, #4
     1fc: 00 50        	str	r0, [r0, r0]
     1fe: 18 0a        	lsrs	r0, r3, #8
     200: 00 20        	movs	r0, #0
     202: e4 0b        	lsrs	r4, r4, #15
     204: 00 20        	movs	r0, #0
     206: 01 00        	movs	r1, r0
     208: 57 e4        	b	0xfffffaba <CallbackContext+0xffffffffdfffe73a> @ imm = #-1874
     20a: 0b 00        	movs	r3, r1
     20c: 20 38        	subs	r0, #32
     20e: 0c 00        	movs	r4, r1
     210: 20 04        	lsls	r0, r4, #16
     212: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     216: 9f 00        	lsls	r7, r3, #2
     218: 00 00        	movs	r0, r0
     21a: 00 00        	movs	r0, r0
     21c: 00 00        	movs	r0, r0
     21e: 00 f8 09 00  	strb.w	r0, [r0, r9]
     222: 20 1a        	subs	r0, r4, r0
     224: 0a 00        	movs	r2, r1
     226: 20 01        	lsls	r0, r4, #4
     228: 00 51        	str	r0, [r0, r4]
     22a: 1a 0a        	lsrs	r2, r3, #8
     22c: 00 20        	movs	r0, #0
     22e: 1a 0c        	lsrs	r2, r3, #16
     230: 00 20        	movs	r0, #0
     232: 01 00        	movs	r1, r0
     234: 5b 1a        	subs	r3, r3, r1
     236: 0c 00        	movs	r4, r1
     238: 20 38        	subs	r0, #32
     23a: 0c 00        	movs	r4, r1
     23c: 20 04        	lsls	r0, r4, #16
     23e: 00 f3 01 51  	ssat	r1, #2, r0, lsl #20
     242: 9f 00        	lsls	r7, r3, #2
     244: 00 00        	movs	r0, r0
     246: 00 00        	movs	r0, r0
     248: 00 00        	movs	r0, r0
     24a: 00 f8 09 00  	strb.w	r0, [r0, r9]
     24e: 20 1d        	adds	r0, r4, #4
     250: 0a 00        	movs	r2, r1
     252: 20 01        	lsls	r0, r4, #4
     254: 00 52        	strh	r0, [r0, r0]
     256: 1d 0a        	lsrs	r5, r3, #8
     258: 00 20        	movs	r0, #0
     25a: 04 0c        	lsrs	r4, r0, #16
     25c: 00 20        	movs	r0, #0
     25e: 01 00        	movs	r1, r0
     260: 55 04        	lsls	r5, r2, #17
     262: 0c 00        	movs	r4, r1
     264: 20 38        	subs	r0, #32
     266: 0c 00        	movs	r4, r1
     268: 20 04        	lsls	r0, r4, #16
     26a: 00 f3 01 52  	ssat	r2, #2, r0, lsl #20
     26e: 9f 00        	lsls	r7, r3, #2
     270: 00 00        	movs	r0, r0
     272: 00 00        	movs	r0, r0
     274: 00 00        	movs	r0, r0
     276: 00 f8 09 00  	strb.w	r0, [r0, r9]
     27a: 20 08        	lsrs	r0, r4, #32
     27c: 0a 00        	movs	r2, r1
     27e: 20 01        	lsls	r0, r4, #4
     280: 00 53        	strh	r0, [r0, r4]
     282: 08 0a        	lsrs	r0, r1, #8
     284: 00 20        	movs	r0, #0
     286: 28 0b        	lsrs	r0, r5, #12
     288: 00 20        	movs	r0, #0
     28a: 02 00        	movs	r2, r0
     28c: 91 44        	add	r9, r2
     28e: 28 0b        	lsrs	r0, r5, #12
     290: 00 20        	movs	r0, #0
     292: 38 0c        	lsrs	r0, r7, #16
     294: 00 20        	movs	r0, #0
     296: 04 00        	movs	r4, r0
     298: f3 01        	lsls	r3, r6, #7
     29a: 53 9f        	ldr	r7, [sp, #332]
		...
     2ac: 01 00        	movs	r1, r0
     2ae: 50 00        	lsls	r0, r2, #1
     2b0: 00 00        	movs	r0, r0
     2b2: 00 00        	movs	r0, r0
     2b4: 00 00        	movs	r0, r0
     2b6: 00 01        	lsls	r0, r0, #4
     2b8: 00 54        	strb	r0, [r0, r0]
		...
     2c2: 04 00        	movs	r4, r0
     2c4: f3 01        	lsls	r3, r6, #7
     2c6: 50 9f        	ldr	r7, [sp, #320]
		...
     2d8: 01 00        	movs	r1, r0
     2da: 51 00        	lsls	r1, r2, #1
     2dc: 00 00        	movs	r0, r0
     2de: 00 00        	movs	r0, r0
     2e0: 00 00        	movs	r0, r0
     2e2: 00 01        	lsls	r0, r0, #4
     2e4: 00 55        	strb	r0, [r0, r4]
		...
     2ee: 04 00        	movs	r4, r0
     2f0: f3 01        	lsls	r3, r6, #7
     2f2: 51 9f        	ldr	r7, [sp, #324]
		...
     304: 01 00        	movs	r1, r0
     306: 50 00        	lsls	r0, r2, #1
     308: 00 00        	movs	r0, r0
     30a: 00 00        	movs	r0, r0
     30c: 00 00        	movs	r0, r0
     30e: 00 04        	lsls	r0, r0, #16
     310: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     314: 9f 00        	lsls	r7, r3, #2
     316: 00 00        	movs	r0, r0
     318: 00 00        	movs	r0, r0
     31a: 00 00        	movs	r0, r0
     31c: 00 01        	lsls	r0, r0, #4
     31e: 00 50        	str	r0, [r0, r0]
		...
     328: 04 00        	movs	r4, r0
     32a: f3 01        	lsls	r3, r6, #7
     32c: 50 9f        	ldr	r7, [sp, #320]
		...
     33e: 01 00        	movs	r1, r0
     340: 51 00        	lsls	r1, r2, #1
     342: 00 00        	movs	r0, r0
     344: 00 00        	movs	r0, r0
     346: 00 00        	movs	r0, r0
     348: 00 04        	lsls	r0, r0, #16
     34a: 00 f3 01 51  	ssat	r1, #2, r0, lsl #20
     34e: 9f 00        	lsls	r7, r3, #2
     350: 00 00        	movs	r0, r0
     352: 00 00        	movs	r0, r0
     354: 00 00        	movs	r0, r0
     356: 00 01        	lsls	r0, r0, #4
     358: 00 51        	str	r0, [r0, r4]
		...
     36a: 03 00        	movs	r3, r0
     36c: 08 2f        	cmp	r7, #8
     36e: 9f 00        	lsls	r7, r3, #2
		...
     37c: 00 00        	movs	r0, r0
     37e: 00 03        	lsls	r0, r0, #12
     380: 00 08        	lsrs	r0, r0, #32
     382: 2f 9f        	ldr	r7, [sp, #188]
		...
     394: 01 00        	movs	r1, r0
     396: 50 00        	lsls	r0, r2, #1
     398: 00 00        	movs	r0, r0
     39a: 00 00        	movs	r0, r0
     39c: 00 00        	movs	r0, r0
     39e: 00 01        	lsls	r0, r0, #4
     3a0: 00 55        	strb	r0, [r0, r4]
		...
     3b2: 01 00        	movs	r1, r0
     3b4: 51 00        	lsls	r1, r2, #1
     3b6: 00 00        	movs	r0, r0
     3b8: 00 00        	movs	r0, r0
     3ba: 00 00        	movs	r0, r0
     3bc: 00 01        	lsls	r0, r0, #4
     3be: 00 54        	strb	r0, [r0, r0]
		...
     3c8: 44 00        	lsls	r4, r0, #1
     3ca: 00 00        	movs	r0, r0
     3cc: 50 00        	lsls	r0, r2, #1
     3ce: 00 00        	movs	r0, r0
     3d0: 01 00        	movs	r1, r0
     3d2: 50 50        	str	r0, [r2, r1]
     3d4: 00 00        	movs	r0, r0
     3d6: 00 58        	ldr	r0, [r0, r0]
     3d8: 00 00        	movs	r0, r0
     3da: 00 04        	lsls	r0, r0, #16
     3dc: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     3e0: 9f 00        	lsls	r7, r3, #2
     3e2: 00 00        	movs	r0, r0
     3e4: 00 00        	movs	r0, r0
     3e6: 00 00        	movs	r0, r0
     3e8: 00 44        	add	r0, r0
     3ea: 00 00        	movs	r0, r0
     3ec: 00 48        	ldr	r0, [pc, #0]            @ 0x3f0 <.debug_info+0x3f0>
     3ee: 00 00        	movs	r0, r0
     3f0: 00 02        	lsls	r0, r0, #8
     3f2: 00 30        	adds	r0, #0
     3f4: 9f 48        	ldr	r0, [pc, #636]          @ 0x674 <.debug_info+0x674>
     3f6: 00 00        	movs	r0, r0
     3f8: 00 50        	str	r0, [r0, r0]
     3fa: 00 00        	movs	r0, r0
     3fc: 00 01        	lsls	r0, r0, #4
     3fe: 00 53        	strh	r0, [r0, r4]
     400: 50 00        	lsls	r0, r2, #1
     402: 00 00        	movs	r0, r0
     404: 58 00        	lsls	r0, r3, #1
     406: 00 00        	movs	r0, r0
     408: 01 00        	movs	r1, r0
     40a: 50 00        	lsls	r0, r2, #1
     40c: 00 00        	movs	r0, r0
     40e: 00 00        	movs	r0, r0
     410: 00 00        	movs	r0, r0
     412: 00 98        	ldr	r0, [sp]
     414: 00 00        	movs	r0, r0
     416: 00 a6        	adr	r6, #0 <.debug_info+0x41a>
     418: 00 00        	movs	r0, r0
     41a: 00 01        	lsls	r0, r0, #4
     41c: 00 50        	str	r0, [r0, r0]
     41e: a6 00        	lsls	r6, r4, #2
     420: 00 00        	movs	r0, r0
     422: b8 00        	lsls	r0, r7, #2
     424: 00 00        	movs	r0, r0
     426: 04 00        	movs	r4, r0
     428: f3 01        	lsls	r3, r6, #7
     42a: 50 9f        	ldr	r7, [sp, #320]
		...
     434: 98 00        	lsls	r0, r3, #2
     436: 00 00        	movs	r0, r0
     438: 9c 00        	lsls	r4, r3, #2
     43a: 00 00        	movs	r0, r0
     43c: 01 00        	movs	r1, r0
     43e: 51 9c        	ldr	r4, [sp, #324]
     440: 00 00        	movs	r0, r0
     442: 00           	<unknown>
     443: b8 00        	lsls	r0, r7, #2
     445: 00 00        	movs	r0, r0
     447: 04 00        	movs	r4, r0
     449: f3 01        	lsls	r3, r6, #7
     44b: 51 9f        	ldr	r7, [sp, #324]
		...
     455: 98 00        	lsls	r0, r3, #2
     457: 00 00        	movs	r0, r0
     459: 9e 00        	lsls	r6, r3, #2
     45b: 00 00        	movs	r0, r0
     45d: 01 00        	movs	r1, r0
     45f: 53 9e        	ldr	r6, [sp, #332]
     461: 00 00        	movs	r0, r0
     463: 00           	<unknown>
     464: b8 00        	lsls	r0, r7, #2
     466: 00 00        	movs	r0, r0
     468: 04 00        	movs	r4, r0
     46a: f3 01        	lsls	r3, r6, #7
     46c: 53 9f        	ldr	r7, [sp, #332]
		...
     476: 98 00        	lsls	r0, r3, #2
     478: 00 00        	movs	r0, r0
     47a: b0 00        	lsls	r0, r6, #2
     47c: 00 00        	movs	r0, r0
     47e: 02 00        	movs	r2, r0
     480: 91 00        	lsls	r1, r2, #2
		...
     48a: c4 00        	lsls	r4, r0, #3
     48c: 00 00        	movs	r0, r0
     48e: ca 00        	lsls	r2, r1, #3
     490: 00 00        	movs	r0, r0
     492: 01 00        	movs	r1, r0
     494: 50 ca        	ldm	r2!, {r4, r6}
     496: 00 00        	movs	r0, r0
     498: 00 d8        	bhi	0x49c <.debug_info+0x49c> @ imm = #0
     49a: 00 00        	movs	r0, r0
     49c: 00 04        	lsls	r0, r0, #16
     49e: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     4a2: 9f 00        	lsls	r7, r3, #2
     4a4: 00 00        	movs	r0, r0
     4a6: 00 00        	movs	r0, r0
     4a8: 00 00        	movs	r0, r0
     4aa: 00           	<unknown>
     4ab: c4 00        	lsls	r4, r0, #3
     4ad: 00 00        	movs	r0, r0
     4af: c6 00        	lsls	r6, r0, #3
     4b1: 00 00        	movs	r0, r0
     4b3: 01 00        	movs	r1, r0
     4b5: 51 c6        	stm	r6!, {r0, r4, r6}
     4b7: 00 00        	movs	r0, r0
     4b9: 00 d8        	bhi	0x4bd <.debug_info+0x4bd> @ imm = #0
     4bb: 00 00        	movs	r0, r0
     4bd: 00 04        	lsls	r0, r0, #16
     4bf: 00 f3 01 51  	ssat	r1, #2, r0, lsl #20
     4c3: 9f 00        	lsls	r7, r3, #2
     4c5: 00 00        	movs	r0, r0
     4c7: 00 00        	movs	r0, r0
     4c9: 00 00        	movs	r0, r0
     4cb: 00 f0 00 00  	and	r0, r0, #0
     4cf: 00           	<unknown>
     4d0: fa 00        	lsls	r2, r7, #3
     4d2: 00 00        	movs	r0, r0
     4d4: 01 00        	movs	r1, r0
     4d6: 50           	<unknown>
     4d7: fa 00        	lsls	r2, r7, #3
     4d9: 00 00        	movs	r0, r0
     4db: 04 01        	lsls	r4, r0, #4
     4dd: 00 00        	movs	r0, r0
     4df: 04 00        	movs	r4, r0
     4e1: f3 01        	lsls	r3, r6, #7
     4e3: 50 9f        	ldr	r7, [sp, #320]
		...
     4ed: f0 00        	lsls	r0, r6, #3
     4ef: 00 00        	movs	r0, r0
     4f1: f4 00        	lsls	r4, r6, #3
     4f3: 00 00        	movs	r0, r0
     4f5: 02 00        	movs	r2, r0
     4f7: 30 9f        	ldr	r7, [sp, #192]
     4f9: f4 00        	lsls	r4, r6, #3
     4fb: 00 00        	movs	r0, r0
     4fd: 04 01        	lsls	r4, r0, #4
     4ff: 00 00        	movs	r0, r0
     501: 01 00        	movs	r1, r0
     503: 53 00        	lsls	r3, r2, #1
     505: 00 00        	movs	r0, r0
     507: 00 00        	movs	r0, r0
     509: 00 00        	movs	r0, r0
     50b: 00 04        	lsls	r0, r0, #16
     50d: 01 00        	movs	r1, r0
     50f: 00 0e        	lsrs	r0, r0, #24
     511: 01 00        	movs	r1, r0
     513: 00 01        	lsls	r0, r0, #4
     515: 00 50        	str	r0, [r0, r0]
     517: 0e 01        	lsls	r6, r1, #4
     519: 00 00        	movs	r0, r0
     51b: 18 01        	lsls	r0, r3, #4
     51d: 00 00        	movs	r0, r0
     51f: 04 00        	movs	r4, r0
     521: f3 01        	lsls	r3, r6, #7
     523: 50 9f        	ldr	r7, [sp, #320]
		...
     52d: 04 01        	lsls	r4, r0, #4
     52f: 00 00        	movs	r0, r0
     531: 08 01        	lsls	r0, r1, #4
     533: 00 00        	movs	r0, r0
     535: 02 00        	movs	r2, r0
     537: 30 9f        	ldr	r7, [sp, #192]
     539: 08 01        	lsls	r0, r1, #4
     53b: 00 00        	movs	r0, r0
     53d: 18 01        	lsls	r0, r3, #4
     53f: 00 00        	movs	r0, r0
     541: 01 00        	movs	r1, r0
     543: 53 00        	lsls	r3, r2, #1
     545: 00 00        	movs	r0, r0
     547: 00 00        	movs	r0, r0
     549: 00 00        	movs	r0, r0
     54b: 00 18        	adds	r0, r0, r0
     54d: 01 00        	movs	r1, r0
     54f: 00 22        	movs	r2, #0
     551: 01 00        	movs	r1, r0
     553: 00 01        	lsls	r0, r0, #4
     555: 00 50        	str	r0, [r0, r0]
     557: 22 01        	lsls	r2, r4, #4
     559: 00 00        	movs	r0, r0
     55b: 2c 01        	lsls	r4, r5, #4
     55d: 00 00        	movs	r0, r0
     55f: 04 00        	movs	r4, r0
     561: f3 01        	lsls	r3, r6, #7
     563: 50 9f        	ldr	r7, [sp, #320]
		...
     56d: 18 01        	lsls	r0, r3, #4
     56f: 00 00        	movs	r0, r0
     571: 1c 01        	lsls	r4, r3, #4
     573: 00 00        	movs	r0, r0
     575: 02 00        	movs	r2, r0
     577: 30 9f        	ldr	r7, [sp, #192]
     579: 1c 01        	lsls	r4, r3, #4
     57b: 00 00        	movs	r0, r0
     57d: 22 01        	lsls	r2, r4, #4
     57f: 00 00        	movs	r0, r0
     581: 01 00        	movs	r1, r0
     583: 53 22        	movs	r2, #83
     585: 01 00        	movs	r1, r0
     587: 00 2c        	cmp	r4, #0
     589: 01 00        	movs	r1, r0
     58b: 00 01        	lsls	r0, r0, #4
     58d: 00 50        	str	r0, [r0, r0]
		...
     597: 3c 01        	lsls	r4, r7, #4
     599: 00 00        	movs	r0, r0
     59b: 46 01        	lsls	r6, r0, #5
     59d: 00 00        	movs	r0, r0
     59f: 01 00        	movs	r1, r0
     5a1: 50 46        	mov	r0, r10
     5a3: 01 00        	movs	r1, r0
     5a5: 00 50        	str	r0, [r0, r0]
     5a7: 01 00        	movs	r1, r0
     5a9: 00 04        	lsls	r0, r0, #16
     5ab: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     5af: 9f 00        	lsls	r7, r3, #2
     5b1: 00 00        	movs	r0, r0
     5b3: 00 00        	movs	r0, r0
     5b5: 00 00        	movs	r0, r0
     5b7: 00 3c        	subs	r4, #0
     5b9: 01 00        	movs	r1, r0
     5bb: 00 40        	ands	r0, r0
     5bd: 01 00        	movs	r1, r0
     5bf: 00 02        	lsls	r0, r0, #8
     5c1: 00 30        	adds	r0, #0
     5c3: 9f 40        	lsls	r7, r3
     5c5: 01 00        	movs	r1, r0
     5c7: 00 46        	mov	r0, r0
     5c9: 01 00        	movs	r1, r0
     5cb: 00 01        	lsls	r0, r0, #4
     5cd: 00 53        	strh	r0, [r0, r4]
     5cf: 46 01        	lsls	r6, r0, #5
     5d1: 00 00        	movs	r0, r0
     5d3: 50 01        	lsls	r0, r2, #5
     5d5: 00 00        	movs	r0, r0
     5d7: 01 00        	movs	r1, r0
     5d9: 50 00        	lsls	r0, r2, #1
     5db: 00 00        	movs	r0, r0
     5dd: 00 00        	movs	r0, r0
     5df: 00 00        	movs	r0, r0
     5e1: 00 50        	str	r0, [r0, r0]
     5e3: 01 00        	movs	r1, r0
     5e5: 00 5a        	ldrh	r0, [r0, r0]
     5e7: 01 00        	movs	r1, r0
     5e9: 00 01        	lsls	r0, r0, #4
     5eb: 00 50        	str	r0, [r0, r0]
     5ed: 5a 01        	lsls	r2, r3, #5
     5ef: 00 00        	movs	r0, r0
     5f1: 64 01        	lsls	r4, r4, #5
     5f3: 00 00        	movs	r0, r0
     5f5: 04 00        	movs	r4, r0
     5f7: f3 01        	lsls	r3, r6, #7
     5f9: 50 9f        	ldr	r7, [sp, #320]
		...
     603: 50 01        	lsls	r0, r2, #5
     605: 00 00        	movs	r0, r0
     607: 54 01        	lsls	r4, r2, #5
     609: 00 00        	movs	r0, r0
     60b: 02 00        	movs	r2, r0
     60d: 30 9f        	ldr	r7, [sp, #192]
     60f: 54 01        	lsls	r4, r2, #5
     611: 00 00        	movs	r0, r0
     613: 5a 01        	lsls	r2, r3, #5
     615: 00 00        	movs	r0, r0
     617: 01 00        	movs	r1, r0
     619: 53 5a        	ldrh	r3, [r2, r1]
     61b: 01 00        	movs	r1, r0
     61d: 00 64        	str	r0, [r0, #64]
     61f: 01 00        	movs	r1, r0
     621: 00 01        	lsls	r0, r0, #4
     623: 00 50        	str	r0, [r0, r0]
		...
     62d: 64 01        	lsls	r4, r4, #5
     62f: 00 00        	movs	r0, r0
     631: 70 01        	lsls	r0, r6, #5
     633: 00 00        	movs	r0, r0
     635: 01 00        	movs	r1, r0
     637: 50 70        	strb	r0, [r2, #1]
     639: 01 00        	movs	r1, r0
     63b: 00 78        	ldrb	r0, [r0]
     63d: 01 00        	movs	r1, r0
     63f: 00 04        	lsls	r0, r0, #16
     641: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     645: 9f 00        	lsls	r7, r3, #2
     647: 00 00        	movs	r0, r0
     649: 00 00        	movs	r0, r0
     64b: 00 00        	movs	r0, r0
     64d: 00 64        	str	r0, [r0, #64]
     64f: 01 00        	movs	r1, r0
     651: 00 68        	ldr	r0, [r0]
     653: 01 00        	movs	r1, r0
     655: 00 02        	lsls	r0, r0, #8
     657: 00 30        	adds	r0, #0
     659: 9f 68        	ldr	r7, [r3, #8]
     65b: 01 00        	movs	r1, r0
     65d: 00 70        	strb	r0, [r0]
     65f: 01 00        	movs	r1, r0
     661: 00 01        	lsls	r0, r0, #4
     663: 00 53        	strh	r0, [r0, r4]
     665: 70 01        	lsls	r0, r6, #5
     667: 00 00        	movs	r0, r0
     669: 78 01        	lsls	r0, r7, #5
     66b: 00 00        	movs	r0, r0
     66d: 01 00        	movs	r1, r0
     66f: 50 00        	lsls	r0, r2, #1
     671: 00 00        	movs	r0, r0
     673: 00 00        	movs	r0, r0
     675: 00 00        	movs	r0, r0
     677: 00 7a        	ldrb	r0, [r0, #8]
     679: 01 00        	movs	r1, r0
     67b: 00 82        	strh	r0, [r0, #16]
     67d: 01 00        	movs	r1, r0
     67f: 00 02        	lsls	r0, r0, #8
     681: 00 30        	adds	r0, #0
     683: 9f 82        	strh	r7, [r3, #20]
     685: 01 00        	movs	r1, r0
     687: 00 8e        	ldrh	r0, [r0, #48]
     689: 01 00        	movs	r1, r0
     68b: 00 01        	lsls	r0, r0, #4
     68d: 00 53        	strh	r0, [r0, r4]
     68f: 92 01        	lsls	r2, r2, #6
     691: 00 00        	movs	r0, r0
     693: 94 01        	lsls	r4, r2, #6
     695: 00 00        	movs	r0, r0
     697: 01 00        	movs	r1, r0
     699: 53 98        	ldr	r0, [sp, #332]
     69b: 01 00        	movs	r1, r0
     69d: 00 9a        	ldr	r2, [sp]
     69f: 01 00        	movs	r1, r0
     6a1: 00 01        	lsls	r0, r0, #4
     6a3: 00 53        	strh	r0, [r0, r4]
     6a5: e2 01        	lsls	r2, r4, #7
     6a7: 00 00        	movs	r0, r0
     6a9: e4 01        	lsls	r4, r4, #7
     6ab: 00 00        	movs	r0, r0
     6ad: 01 00        	movs	r1, r0
     6af: 53 ea 01 00  	orrs.w	r0, r3, r1
     6b3: 00 ee 01 00  	cdp	p0, #0, c0, c0, c1, #0
     6b7: 00 06        	lsls	r0, r0, #24
     6b9: 00 73        	strb	r0, [r0, #12]
     6bb: 00 08        	lsrs	r0, r0, #32
     6bd: f0 1a        	subs	r0, r6, r3
     6bf: 9f ee 01 00  	cdp	p0, #9, c0, c15, c1, #0
     6c3: 00 f6 01 00  	addw	r0, r0, #2049
     6c7: 00 01        	lsls	r0, r0, #4
     6c9: 00 53        	strh	r0, [r0, r4]
     6cb: fc 01        	lsls	r4, r7, #7
     6cd: 00 00        	movs	r0, r0
     6cf: 00 02        	lsls	r0, r0, #8
     6d1: 00 00        	movs	r0, r0
     6d3: 07 00        	movs	r7, r0
     6d5: 74 00        	lsls	r4, r6, #1
     6d7: 0a 00        	movs	r2, r1
     6d9: 1c 1a        	subs	r4, r3, r0
     6db: 9f 00        	lsls	r7, r3, #2
     6dd: 02 00        	movs	r2, r0
     6df: 00 02        	lsls	r0, r0, #8
     6e1: 02 00        	movs	r2, r0
     6e3: 00 01        	lsls	r0, r0, #4
     6e5: 00 54        	strb	r0, [r0, r0]
     6e7: 0c 02        	lsls	r4, r1, #8
     6e9: 00 00        	movs	r0, r0
     6eb: 10 02        	lsls	r0, r2, #8
     6ed: 00 00        	movs	r0, r0
     6ef: 07 00        	movs	r7, r0
     6f1: 72 00        	lsls	r2, r6, #1
     6f3: 0a 00        	movs	r2, r1
     6f5: e0 1a        	subs	r0, r4, r3
     6f7: 9f 10        	asrs	r7, r3, #2
     6f9: 02 00        	movs	r2, r0
     6fb: 00 12        	asrs	r0, r0, #8
     6fd: 02 00        	movs	r2, r0
     6ff: 00 01        	lsls	r0, r0, #4
     701: 00 52        	strh	r0, [r0, r0]
		...
     70b: 7a 01        	lsls	r2, r7, #5
     70d: 00 00        	movs	r0, r0
     70f: f4 01        	lsls	r4, r6, #7
     711: 00 00        	movs	r0, r0
     713: 02 00        	movs	r2, r0
     715: 30 9f        	ldr	r7, [sp, #192]
     717: f4 01        	lsls	r4, r6, #7
     719: 00 00        	movs	r0, r0
     71b: fc 01        	lsls	r4, r7, #7
     71d: 00 00        	movs	r0, r0
     71f: 06 00        	movs	r6, r0
     721: 74 00        	lsls	r4, r6, #1
     723: 08           	<unknown>
     724: ff 1a        	subs	r7, r7, r3
     726: 9f 04        	lsls	r7, r3, #18
     728: 02 00        	movs	r2, r0
     72a: 00 08        	lsrs	r0, r0, #32
     72c: 02 00        	movs	r2, r0
     72e: 00 06        	lsls	r0, r0, #24
     730: 00 74        	strb	r0, [r0, #16]
     732: 00 08        	lsrs	r0, r0, #32
     734: ff 1a        	subs	r7, r7, r3
     736: 9f 14        	asrs	r7, r3, #18
     738: 02 00        	movs	r2, r0
     73a: 00 30        	adds	r0, #0
     73c: 02 00        	movs	r2, r0
     73e: 00 06        	lsls	r0, r0, #24
     740: 00 72        	strb	r0, [r0, #8]
     742: 00 08        	lsrs	r0, r0, #32
     744: ff 1a        	subs	r7, r7, r3
     746: 9f 00        	lsls	r7, r3, #2
     748: 00 00        	movs	r0, r0
     74a: 00 00        	movs	r0, r0
     74c: 00 00        	movs	r0, r0
     74e: 00 7a        	ldrb	r0, [r0, #8]
     750: 01 00        	movs	r1, r0
     752: 00 ba        	rev	r0, r0
     754: 01 00        	movs	r1, r0
     756: 00 02        	lsls	r0, r0, #8
     758: 00 30        	adds	r0, #0
     75a: 9f           	<unknown>
     75b: ba 01        	lsls	r2, r7, #6
     75d: 00 00        	movs	r0, r0
     75f: bc 01        	lsls	r4, r7, #6
     761: 00 00        	movs	r0, r0
     763: 01 00        	movs	r1, r0
     765: 52 bc        	pop	{r1, r4, r6}
     767: 01 00        	movs	r1, r0
     769: 00           	<unknown>
     76a: ce 01        	lsls	r6, r1, #7
     76c: 00 00        	movs	r0, r0
     76e: 02 00        	movs	r2, r0
     770: 30 9f        	ldr	r7, [sp, #192]
     772: ce 01        	lsls	r6, r1, #7
     774: 00 00        	movs	r0, r0
     776: e2 01        	lsls	r2, r4, #7
     778: 00 00        	movs	r0, r0
     77a: 01 00        	movs	r1, r0
     77c: 52 e2        	b	0xc24 <.debug_info+0xc24> @ imm = #1188
     77e: 01 00        	movs	r1, r0
     780: 00 e6        	b	0x384 <.debug_info+0x384> @ imm = #-1024
     782: 01 00        	movs	r1, r0
     784: 00 02        	lsls	r0, r0, #8
     786: 00 30        	adds	r0, #0
     788: 9f 00        	lsls	r7, r3, #2
     78a: 00 00        	movs	r0, r0
     78c: 00 00        	movs	r0, r0
     78e: 00 00        	movs	r0, r0
     790: 00 7a        	ldrb	r0, [r0, #8]
     792: 01 00        	movs	r1, r0
     794: 00 da        	bge	0x798 <.debug_info+0x798> @ imm = #0
     796: 01 00        	movs	r1, r0
     798: 00 02        	lsls	r0, r0, #8
     79a: 00 32        	adds	r2, #0
     79c: 9f da        	bge	0x6de <.debug_info+0x6de> @ imm = #-194
     79e: 01 00        	movs	r1, r0
     7a0: 00 de        	udf	#0
     7a2: 01 00        	movs	r1, r0
     7a4: 00 01        	lsls	r0, r0, #4
     7a6: 00 53        	strh	r0, [r0, r4]
     7a8: e2 01        	lsls	r2, r4, #7
     7aa: 00 00        	movs	r0, r0
     7ac: e6 01        	lsls	r6, r4, #7
     7ae: 00 00        	movs	r0, r0
     7b0: 02 00        	movs	r2, r0
     7b2: 32 9f        	ldr	r7, [sp, #200]
		...
     7bc: 7a 01        	lsls	r2, r7, #5
     7be: 00 00        	movs	r0, r0
     7c0: 9c 01        	lsls	r4, r3, #6
     7c2: 00 00        	movs	r0, r0
     7c4: 02 00        	movs	r2, r0
     7c6: 30 9f        	ldr	r7, [sp, #192]
     7c8: 9c 01        	lsls	r4, r3, #6
     7ca: 00 00        	movs	r0, r0
     7cc: aa 01        	lsls	r2, r5, #6
     7ce: 00 00        	movs	r0, r0
     7d0: 08 00        	movs	r0, r1
     7d2: 72 00        	lsls	r2, r6, #1
     7d4: 09 ed 24 33  	stc	p3, c3, [r9, #-144]
     7d8: 25 9f        	ldr	r7, [sp, #148]
     7da: bc 01        	lsls	r4, r7, #6
     7dc: 00 00        	movs	r0, r0
     7de: be 01        	lsls	r6, r7, #6
     7e0: 00 00        	movs	r0, r0
     7e2: 08 00        	movs	r0, r1
     7e4: 72 00        	lsls	r2, r6, #1
     7e6: 09 ed 24 33  	stc	p3, c3, [r9, #-144]
     7ea: 25 9f        	ldr	r7, [sp, #148]
     7ec: e2 01        	lsls	r2, r4, #7
     7ee: 00 00        	movs	r0, r0
     7f0: e6 01        	lsls	r6, r4, #7
     7f2: 00 00        	movs	r0, r0
     7f4: 02 00        	movs	r2, r0
     7f6: 30 9f        	ldr	r7, [sp, #192]
		...
     800: 7a 01        	lsls	r2, r7, #5
     802: 00 00        	movs	r0, r0
     804: a2 01        	lsls	r2, r4, #6
     806: 00 00        	movs	r0, r0
     808: 02 00        	movs	r2, r0
     80a: 32 9f        	ldr	r7, [sp, #200]
     80c: a2 01        	lsls	r2, r4, #6
     80e: 00 00        	movs	r0, r0
     810: b0 01        	lsls	r0, r6, #6
     812: 00 00        	movs	r0, r0
     814: 01 00        	movs	r1, r0
     816: 53 bc        	pop	{r0, r1, r4, r6}
     818: 01 00        	movs	r1, r0
     81a: 00           	<unknown>
     81b: c2 01        	lsls	r2, r0, #7
     81d: 00 00        	movs	r0, r0
     81f: 01 00        	movs	r1, r0
     821: 53 e2        	b	0xccb <.debug_info+0xccb> @ imm = #1190
     823: 01 00        	movs	r1, r0
     825: 00 e6        	b	0x429 <.debug_info+0x429> @ imm = #-1024
     827: 01 00        	movs	r1, r0
     829: 00 02        	lsls	r0, r0, #8
     82b: 00 32        	adds	r2, #0
     82d: 9f 00        	lsls	r7, r3, #2
     82f: 00 00        	movs	r0, r0
     831: 00 00        	movs	r0, r0
     833: 00 00        	movs	r0, r0
     835: 00 30        	adds	r0, #0
     837: 02 00        	movs	r2, r0
     839: 00 56        	ldrsb	r0, [r0, r0]
     83b: 02 00        	movs	r2, r0
     83d: 00 01        	lsls	r0, r0, #4
     83f: 00 50        	str	r0, [r0, r0]
     841: 56 02        	lsls	r6, r2, #9
     843: 00 00        	movs	r0, r0
     845: 60 02        	lsls	r0, r4, #9
     847: 00 00        	movs	r0, r0
     849: 04 00        	movs	r4, r0
     84b: f3 01        	lsls	r3, r6, #7
     84d: 50 9f        	ldr	r7, [sp, #320]
		...
     857: 30 02        	lsls	r0, r6, #8
     859: 00 00        	movs	r0, r0
     85b: 3e 02        	lsls	r6, r7, #8
     85d: 00 00        	movs	r0, r0
     85f: 02 00        	movs	r2, r0
     861: 30 9f        	ldr	r7, [sp, #192]
     863: 3e 02        	lsls	r6, r7, #8
     865: 00 00        	movs	r0, r0
     867: 4e 02        	lsls	r6, r1, #9
     869: 00 00        	movs	r0, r0
     86b: 01 00        	movs	r1, r0
     86d: 53 00        	lsls	r3, r2, #1
     86f: 00 00        	movs	r0, r0
     871: 00 00        	movs	r0, r0
     873: 00 00        	movs	r0, r0
     875: 00 84        	strh	r0, [r0, #32]
     877: 02 00        	movs	r2, r0
     879: 00 8c        	ldrh	r0, [r0, #32]
     87b: 02 00        	movs	r2, r0
     87d: 00 01        	lsls	r0, r0, #4
     87f: 00 50        	str	r0, [r0, r0]
     881: 8c 02        	lsls	r4, r1, #10
     883: 00 00        	movs	r0, r0
     885: 90 02        	lsls	r0, r2, #10
     887: 00 00        	movs	r0, r0
     889: 04 00        	movs	r4, r0
     88b: f3 01        	lsls	r3, r6, #7
     88d: 50 9f        	ldr	r7, [sp, #320]
     88f: 90 02        	lsls	r0, r2, #10
     891: 00 00        	movs	r0, r0
     893: 98 02        	lsls	r0, r3, #10
     895: 00 00        	movs	r0, r0
     897: 01 00        	movs	r1, r0
     899: 50 98        	ldr	r0, [sp, #320]
     89b: 02 00        	movs	r2, r0
     89d: 00 a0        	adr	r0, #0 <.debug_info+0x8a1>
     89f: 02 00        	movs	r2, r0
     8a1: 00 04        	lsls	r0, r0, #16
     8a3: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     8a7: 9f 00        	lsls	r7, r3, #2
     8a9: 00 00        	movs	r0, r0
     8ab: 00 00        	movs	r0, r0
     8ad: 00 00        	movs	r0, r0
     8af: 00 a0        	adr	r0, #0 <.debug_info+0x8b3>
     8b1: 02 00        	movs	r2, r0
     8b3: 00 a8        	add	r0, sp, #0
     8b5: 02 00        	movs	r2, r0
     8b7: 00 01        	lsls	r0, r0, #4
     8b9: 00 50        	str	r0, [r0, r0]
     8bb: a8 02        	lsls	r0, r5, #10
     8bd: 00 00        	movs	r0, r0
     8bf: ac 02        	lsls	r4, r5, #10
     8c1: 00 00        	movs	r0, r0
     8c3: 04 00        	movs	r4, r0
     8c5: f3 01        	lsls	r3, r6, #7
     8c7: 50 9f        	ldr	r7, [sp, #320]
     8c9: ac 02        	lsls	r4, r5, #10
     8cb: 00 00        	movs	r0, r0
     8cd: b4 02        	lsls	r4, r6, #10
     8cf: 00 00        	movs	r0, r0
     8d1: 01 00        	movs	r1, r0
     8d3: 50 b4        	push	{r4, r6}
     8d5: 02 00        	movs	r2, r0
     8d7: 00           	<unknown>
     8d8: bc 02        	lsls	r4, r7, #10
     8da: 00 00        	movs	r0, r0
     8dc: 04 00        	movs	r4, r0
     8de: f3 01        	lsls	r3, r6, #7
     8e0: 50 9f        	ldr	r7, [sp, #320]
		...
     8ea: bc 02        	lsls	r4, r7, #10
     8ec: 00 00        	movs	r0, r0
     8ee: c4 02        	lsls	r4, r0, #11
     8f0: 00 00        	movs	r0, r0
     8f2: 01 00        	movs	r1, r0
     8f4: 50 c4        	stm	r4!, {r4, r6}
     8f6: 02 00        	movs	r2, r0
     8f8: 00           	<unknown>
     8f9: c8 02        	lsls	r0, r1, #11
     8fb: 00 00        	movs	r0, r0
     8fd: 04 00        	movs	r4, r0
     8ff: f3 01        	lsls	r3, r6, #7
     901: 50 9f        	ldr	r7, [sp, #320]
     903: c8 02        	lsls	r0, r1, #11
     905: 00 00        	movs	r0, r0
     907: d0 02        	lsls	r0, r2, #11
     909: 00 00        	movs	r0, r0
     90b: 01 00        	movs	r1, r0
     90d: 50 d0        	beq	0x9b1 <.debug_info+0x9b1> @ imm = #160
     90f: 02 00        	movs	r2, r0
     911: 00 d8        	bhi	0x915 <.debug_info+0x915> @ imm = #0
     913: 02 00        	movs	r2, r0
     915: 00 04        	lsls	r0, r0, #16
     917: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     91b: 9f 00        	lsls	r7, r3, #2
     91d: 00 00        	movs	r0, r0
     91f: 00 00        	movs	r0, r0
     921: 00 00        	movs	r0, r0
     923: 00 d8        	bhi	0x927 <.debug_info+0x927> @ imm = #0
     925: 02 00        	movs	r2, r0
     927: 00 e0        	b	0x92b <.debug_info+0x92b> @ imm = #0
     929: 02 00        	movs	r2, r0
     92b: 00 01        	lsls	r0, r0, #4
     92d: 00 50        	str	r0, [r0, r0]
     92f: e0 02        	lsls	r0, r4, #11
     931: 00 00        	movs	r0, r0
     933: e4 02        	lsls	r4, r4, #11
     935: 00 00        	movs	r0, r0
     937: 04 00        	movs	r4, r0
     939: f3 01        	lsls	r3, r6, #7
     93b: 50 9f        	ldr	r7, [sp, #320]
     93d: e4 02        	lsls	r4, r4, #11
     93f: 00 00        	movs	r0, r0
     941: ec 02        	lsls	r4, r5, #11
     943: 00 00        	movs	r0, r0
     945: 01 00        	movs	r1, r0
     947: 50 ec 02 00  	mrrc	p0, #0, r0, r0, c2
     94b: 00 f4 02 00  	and	r0, r0, #8519680
     94f: 00 04        	lsls	r0, r0, #16
     951: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     955: 9f 00        	lsls	r7, r3, #2
     957: 00 00        	movs	r0, r0
     959: 00 00        	movs	r0, r0
     95b: 00 00        	movs	r0, r0
     95d: 00 f4 02 00  	and	r0, r0, #8519680
     961: 00           	<unknown>
     962: fc 02        	lsls	r4, r7, #11
     964: 00 00        	movs	r0, r0
     966: 01 00        	movs	r1, r0
     968: 50 fc 02 00  	mrrc2	p0, #0, r0, r0, c2
     96c: 00 00        	movs	r0, r0
     96e: 03 00        	movs	r3, r0
     970: 00 04        	lsls	r0, r0, #16
     972: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     976: 9f 00        	lsls	r7, r3, #2
     978: 03 00        	movs	r3, r0
     97a: 00 08        	lsrs	r0, r0, #32
     97c: 03 00        	movs	r3, r0
     97e: 00 01        	lsls	r0, r0, #4
     980: 00 50        	str	r0, [r0, r0]
     982: 08 03        	lsls	r0, r1, #12
     984: 00 00        	movs	r0, r0
     986: 10 03        	lsls	r0, r2, #12
     988: 00 00        	movs	r0, r0
     98a: 04 00        	movs	r4, r0
     98c: f3 01        	lsls	r3, r6, #7
     98e: 50 9f        	ldr	r7, [sp, #320]
		...
     998: 10 03        	lsls	r0, r2, #12
     99a: 00 00        	movs	r0, r0
     99c: 18 03        	lsls	r0, r3, #12
     99e: 00 00        	movs	r0, r0
     9a0: 01 00        	movs	r1, r0
     9a2: 50 18        	adds	r0, r2, r1
     9a4: 03 00        	movs	r3, r0
     9a6: 00 1c        	adds	r0, r0, #0
     9a8: 03 00        	movs	r3, r0
     9aa: 00 04        	lsls	r0, r0, #16
     9ac: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     9b0: 9f 1c        	adds	r7, r3, #2
     9b2: 03 00        	movs	r3, r0
     9b4: 00 24        	movs	r4, #0
     9b6: 03 00        	movs	r3, r0
     9b8: 00 01        	lsls	r0, r0, #4
     9ba: 00 50        	str	r0, [r0, r0]
     9bc: 24 03        	lsls	r4, r4, #12
     9be: 00 00        	movs	r0, r0
     9c0: 2c 03        	lsls	r4, r5, #12
     9c2: 00 00        	movs	r0, r0
     9c4: 04 00        	movs	r4, r0
     9c6: f3 01        	lsls	r3, r6, #7
     9c8: 50 9f        	ldr	r7, [sp, #320]
		...
     9d2: 2c 03        	lsls	r4, r5, #12
     9d4: 00 00        	movs	r0, r0
     9d6: 34 03        	lsls	r4, r6, #12
     9d8: 00 00        	movs	r0, r0
     9da: 01 00        	movs	r1, r0
     9dc: 50 34        	adds	r4, #80
     9de: 03 00        	movs	r3, r0
     9e0: 00 38        	subs	r0, #0
     9e2: 03 00        	movs	r3, r0
     9e4: 00 04        	lsls	r0, r0, #16
     9e6: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     9ea: 9f 38        	subs	r0, #159
     9ec: 03 00        	movs	r3, r0
     9ee: 00 40        	ands	r0, r0
     9f0: 03 00        	movs	r3, r0
     9f2: 00 01        	lsls	r0, r0, #4
     9f4: 00 50        	str	r0, [r0, r0]
     9f6: 40 03        	lsls	r0, r0, #13
     9f8: 00 00        	movs	r0, r0
     9fa: 48 03        	lsls	r0, r1, #13
     9fc: 00 00        	movs	r0, r0
     9fe: 04 00        	movs	r4, r0
     a00: f3 01        	lsls	r3, r6, #7
     a02: 50 9f        	ldr	r7, [sp, #320]
		...
     a0c: 48 03        	lsls	r0, r1, #13
     a0e: 00 00        	movs	r0, r0
     a10: 50 03        	lsls	r0, r2, #13
     a12: 00 00        	movs	r0, r0
     a14: 01 00        	movs	r1, r0
     a16: 50 50        	str	r0, [r2, r1]
     a18: 03 00        	movs	r3, r0
     a1a: 00 54        	strb	r0, [r0, r0]
     a1c: 03 00        	movs	r3, r0
     a1e: 00 04        	lsls	r0, r0, #16
     a20: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     a24: 9f 54        	strb	r7, [r3, r2]
     a26: 03 00        	movs	r3, r0
     a28: 00 5c        	ldrb	r0, [r0, r0]
     a2a: 03 00        	movs	r3, r0
     a2c: 00 01        	lsls	r0, r0, #4
     a2e: 00 50        	str	r0, [r0, r0]
     a30: 5c 03        	lsls	r4, r3, #13
     a32: 00 00        	movs	r0, r0
     a34: 64 03        	lsls	r4, r4, #13
     a36: 00 00        	movs	r0, r0
     a38: 04 00        	movs	r4, r0
     a3a: f3 01        	lsls	r3, r6, #7
     a3c: 50 9f        	ldr	r7, [sp, #320]
		...
     a46: 64 03        	lsls	r4, r4, #13
     a48: 00 00        	movs	r0, r0
     a4a: 6c 03        	lsls	r4, r5, #13
     a4c: 00 00        	movs	r0, r0
     a4e: 01 00        	movs	r1, r0
     a50: 50 6c        	ldr	r0, [r2, #68]
     a52: 03 00        	movs	r3, r0
     a54: 00 70        	strb	r0, [r0]
     a56: 03 00        	movs	r3, r0
     a58: 00 04        	lsls	r0, r0, #16
     a5a: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     a5e: 9f 70        	strb	r7, [r3, #2]
     a60: 03 00        	movs	r3, r0
     a62: 00 78        	ldrb	r0, [r0]
     a64: 03 00        	movs	r3, r0
     a66: 00 01        	lsls	r0, r0, #4
     a68: 00 50        	str	r0, [r0, r0]
     a6a: 78 03        	lsls	r0, r7, #13
     a6c: 00 00        	movs	r0, r0
     a6e: 80 03        	lsls	r0, r0, #14
     a70: 00 00        	movs	r0, r0
     a72: 04 00        	movs	r4, r0
     a74: f3 01        	lsls	r3, r6, #7
     a76: 50 9f        	ldr	r7, [sp, #320]
		...
     a80: 80 03        	lsls	r0, r0, #14
     a82: 00 00        	movs	r0, r0
     a84: 88 03        	lsls	r0, r1, #14
     a86: 00 00        	movs	r0, r0
     a88: 01 00        	movs	r1, r0
     a8a: 50 88        	ldrh	r0, [r2, #2]
     a8c: 03 00        	movs	r3, r0
     a8e: 00 8c        	ldrh	r0, [r0, #32]
     a90: 03 00        	movs	r3, r0
     a92: 00 04        	lsls	r0, r0, #16
     a94: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     a98: 9f 8c        	ldrh	r7, [r3, #36]
     a9a: 03 00        	movs	r3, r0
     a9c: 00 94        	str	r4, [sp]
     a9e: 03 00        	movs	r3, r0
     aa0: 00 01        	lsls	r0, r0, #4
     aa2: 00 50        	str	r0, [r0, r0]
     aa4: 94 03        	lsls	r4, r2, #14
     aa6: 00 00        	movs	r0, r0
     aa8: 9c 03        	lsls	r4, r3, #14
     aaa: 00 00        	movs	r0, r0
     aac: 04 00        	movs	r4, r0
     aae: f3 01        	lsls	r3, r6, #7
     ab0: 50 9f        	ldr	r7, [sp, #320]
		...
     aba: 9c 03        	lsls	r4, r3, #14
     abc: 00 00        	movs	r0, r0
     abe: a4 03        	lsls	r4, r4, #14
     ac0: 00 00        	movs	r0, r0
     ac2: 01 00        	movs	r1, r0
     ac4: 50 a4        	adr	r4, #320 <.debug_info+0xb18>
     ac6: 03 00        	movs	r3, r0
     ac8: 00 a8        	add	r0, sp, #0
     aca: 03 00        	movs	r3, r0
     acc: 00 04        	lsls	r0, r0, #16
     ace: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     ad2: 9f a8        	add	r0, sp, #636
     ad4: 03 00        	movs	r3, r0
     ad6: 00 b0        	add	sp, #0
     ad8: 03 00        	movs	r3, r0
     ada: 00 01        	lsls	r0, r0, #4
     adc: 00 50        	str	r0, [r0, r0]
     ade: b0 03        	lsls	r0, r6, #14
     ae0: 00 00        	movs	r0, r0
     ae2: b8 03        	lsls	r0, r7, #14
     ae4: 00 00        	movs	r0, r0
     ae6: 04 00        	movs	r4, r0
     ae8: f3 01        	lsls	r3, r6, #7
     aea: 50 9f        	ldr	r7, [sp, #320]
		...
     af4: b8 03        	lsls	r0, r7, #14
     af6: 00 00        	movs	r0, r0
     af8: c0 03        	lsls	r0, r0, #15
     afa: 00 00        	movs	r0, r0
     afc: 01 00        	movs	r1, r0
     afe: 50 c0        	stm	r0!, {r4, r6}
     b00: 03 00        	movs	r3, r0
     b02: 00           	<unknown>
     b03: c4 03        	lsls	r4, r0, #15
     b05: 00 00        	movs	r0, r0
     b07: 04 00        	movs	r4, r0
     b09: f3 01        	lsls	r3, r6, #7
     b0b: 50 9f        	ldr	r7, [sp, #320]
     b0d: c4 03        	lsls	r4, r0, #15
     b0f: 00 00        	movs	r0, r0
     b11: cc 03        	lsls	r4, r1, #15
     b13: 00 00        	movs	r0, r0
     b15: 01 00        	movs	r1, r0
     b17: 50 cc        	ldm	r4, {r4, r6}
     b19: 03 00        	movs	r3, r0
     b1b: 00 d4        	bmi	0xb1f <.debug_info+0xb1f> @ imm = #0
     b1d: 03 00        	movs	r3, r0
     b1f: 00 04        	lsls	r0, r0, #16
     b21: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     b25: 9f 00        	lsls	r7, r3, #2
     b27: 00 00        	movs	r0, r0
     b29: 00 00        	movs	r0, r0
     b2b: 00 00        	movs	r0, r0
     b2d: 00 d4        	bmi	0xb31 <.debug_info+0xb31> @ imm = #0
     b2f: 03 00        	movs	r3, r0
     b31: 00 dc        	bgt	0xb35 <.debug_info+0xb35> @ imm = #0
     b33: 03 00        	movs	r3, r0
     b35: 00 01        	lsls	r0, r0, #4
     b37: 00 50        	str	r0, [r0, r0]
     b39: dc 03        	lsls	r4, r3, #15
     b3b: 00 00        	movs	r0, r0
     b3d: e0 03        	lsls	r0, r4, #15
     b3f: 00 00        	movs	r0, r0
     b41: 04 00        	movs	r4, r0
     b43: f3 01        	lsls	r3, r6, #7
     b45: 50 9f        	ldr	r7, [sp, #320]
     b47: e0 03        	lsls	r0, r4, #15
     b49: 00 00        	movs	r0, r0
     b4b: e8 03        	lsls	r0, r5, #15
     b4d: 00 00        	movs	r0, r0
     b4f: 01 00        	movs	r1, r0
     b51: 50           	<unknown>
     b52: e8 03        	lsls	r0, r5, #15
     b54: 00 00        	movs	r0, r0
     b56: f0 03        	lsls	r0, r6, #15
     b58: 00 00        	movs	r0, r0
     b5a: 04 00        	movs	r4, r0
     b5c: f3 01        	lsls	r3, r6, #7
     b5e: 50 9f        	ldr	r7, [sp, #320]
		...
     b68: f0 03        	lsls	r0, r6, #15
     b6a: 00 00        	movs	r0, r0
     b6c: f8 03        	lsls	r0, r7, #15
     b6e: 00 00        	movs	r0, r0
     b70: 01 00        	movs	r1, r0
     b72: 50 f8 03 00  	ldr.w	r0, [r0, r3]
     b76: 00           	<unknown>
     b77: fc 03        	lsls	r4, r7, #15
     b79: 00 00        	movs	r0, r0
     b7b: 04 00        	movs	r4, r0
     b7d: f3 01        	lsls	r3, r6, #7
     b7f: 50 9f        	ldr	r7, [sp, #320]
     b81: fc 03        	lsls	r4, r7, #15
     b83: 00 00        	movs	r0, r0
     b85: 04 04        	lsls	r4, r0, #16
     b87: 00 00        	movs	r0, r0
     b89: 01 00        	movs	r1, r0
     b8b: 50 04        	lsls	r0, r2, #17
     b8d: 04 00        	movs	r4, r0
     b8f: 00 0c        	lsrs	r0, r0, #16
     b91: 04 00        	movs	r4, r0
     b93: 00 04        	lsls	r0, r0, #16
     b95: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     b99: 9f 00        	lsls	r7, r3, #2
     b9b: 00 00        	movs	r0, r0
     b9d: 00 00        	movs	r0, r0
     b9f: 00 00        	movs	r0, r0
     ba1: 00 0c        	lsrs	r0, r0, #16
     ba3: 04 00        	movs	r4, r0
     ba5: 00 14        	asrs	r0, r0, #16
     ba7: 04 00        	movs	r4, r0
     ba9: 00 01        	lsls	r0, r0, #4
     bab: 00 50        	str	r0, [r0, r0]
     bad: 14 04        	lsls	r4, r2, #16
     baf: 00 00        	movs	r0, r0
     bb1: 18 04        	lsls	r0, r3, #16
     bb3: 00 00        	movs	r0, r0
     bb5: 04 00        	movs	r4, r0
     bb7: f3 01        	lsls	r3, r6, #7
     bb9: 50 9f        	ldr	r7, [sp, #320]
     bbb: 18 04        	lsls	r0, r3, #16
     bbd: 00 00        	movs	r0, r0
     bbf: 20 04        	lsls	r0, r4, #16
     bc1: 00 00        	movs	r0, r0
     bc3: 01 00        	movs	r1, r0
     bc5: 50 20        	movs	r0, #80
     bc7: 04 00        	movs	r4, r0
     bc9: 00 28        	cmp	r0, #0
     bcb: 04 00        	movs	r4, r0
     bcd: 00 04        	lsls	r0, r0, #16
     bcf: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     bd3: 9f 00        	lsls	r7, r3, #2
     bd5: 00 00        	movs	r0, r0
     bd7: 00 00        	movs	r0, r0
     bd9: 00 00        	movs	r0, r0
     bdb: 00 28        	cmp	r0, #0
     bdd: 04 00        	movs	r4, r0
     bdf: 00 30        	adds	r0, #0
     be1: 04 00        	movs	r4, r0
     be3: 00 01        	lsls	r0, r0, #4
     be5: 00 50        	str	r0, [r0, r0]
     be7: 30 04        	lsls	r0, r6, #16
     be9: 00 00        	movs	r0, r0
     beb: 34 04        	lsls	r4, r6, #16
     bed: 00 00        	movs	r0, r0
     bef: 04 00        	movs	r4, r0
     bf1: f3 01        	lsls	r3, r6, #7
     bf3: 50 9f        	ldr	r7, [sp, #320]
     bf5: 34 04        	lsls	r4, r6, #16
     bf7: 00 00        	movs	r0, r0
     bf9: 3c 04        	lsls	r4, r7, #16
     bfb: 00 00        	movs	r0, r0
     bfd: 01 00        	movs	r1, r0
     bff: 50 3c        	subs	r4, #80
     c01: 04 00        	movs	r4, r0
     c03: 00 44        	add	r0, r0
     c05: 04 00        	movs	r4, r0
     c07: 00 04        	lsls	r0, r0, #16
     c09: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     c0d: 9f 00        	lsls	r7, r3, #2
     c0f: 00 00        	movs	r0, r0
     c11: 00 00        	movs	r0, r0
     c13: 00 00        	movs	r0, r0
     c15: 00 44        	add	r0, r0
     c17: 04 00        	movs	r4, r0
     c19: 00 62        	str	r0, [r0, #32]
     c1b: 04 00        	movs	r4, r0
     c1d: 00 01        	lsls	r0, r0, #4
     c1f: 00 50        	str	r0, [r0, r0]
     c21: 62 04        	lsls	r2, r4, #17
     c23: 00 00        	movs	r0, r0
     c25: 78 04        	lsls	r0, r7, #17
     c27: 00 00        	movs	r0, r0
     c29: 04 00        	movs	r4, r0
     c2b: f3 01        	lsls	r3, r6, #7
     c2d: 50 9f        	ldr	r7, [sp, #320]
		...
     c37: 44 04        	lsls	r4, r0, #17
     c39: 00 00        	movs	r0, r0
     c3b: 46 04        	lsls	r6, r0, #17
     c3d: 00 00        	movs	r0, r0
     c3f: 02 00        	movs	r2, r0
     c41: 30 9f        	ldr	r7, [sp, #192]
     c43: 46 04        	lsls	r6, r0, #17
     c45: 00 00        	movs	r0, r0
     c47: 4c 04        	lsls	r4, r1, #17
     c49: 00 00        	movs	r0, r0
     c4b: 01 00        	movs	r1, r0
     c4d: 53 4c        	ldr	r4, [pc, #332]          @ 0xd9c <.debug_info+0xd9c>
     c4f: 04 00        	movs	r4, r0
     c51: 00 50        	str	r0, [r0, r0]
     c53: 04 00        	movs	r4, r0
     c55: 00 05        	lsls	r0, r0, #20
     c57: 00 70        	strb	r0, [r0]
     c59: 00 35        	adds	r5, #0
     c5b: 25 9f        	ldr	r7, [sp, #148]
     c5d: 50 04        	lsls	r0, r2, #17
     c5f: 00 00        	movs	r0, r0
     c61: 56 04        	lsls	r6, r2, #17
     c63: 00 00        	movs	r0, r0
     c65: 01 00        	movs	r1, r0
     c67: 53 56        	ldrsb	r3, [r2, r1]
     c69: 04 00        	movs	r4, r0
     c6b: 00 5a        	ldrh	r0, [r0, r0]
     c6d: 04 00        	movs	r4, r0
     c6f: 00 05        	lsls	r0, r0, #20
     c71: 00 70        	strb	r0, [r0]
     c73: 00 35        	adds	r5, #0
     c75: 25 9f        	ldr	r7, [sp, #148]
     c77: 5a 04        	lsls	r2, r3, #17
     c79: 00 00        	movs	r0, r0
     c7b: 5c 04        	lsls	r4, r3, #17
     c7d: 00 00        	movs	r0, r0
     c7f: 01 00        	movs	r1, r0
     c81: 53 5c        	ldrb	r3, [r2, r1]
     c83: 04 00        	movs	r4, r0
     c85: 00 62        	str	r0, [r0, #32]
     c87: 04 00        	movs	r4, r0
     c89: 00 05        	lsls	r0, r0, #20
     c8b: 00 70        	strb	r0, [r0]
     c8d: 00 35        	adds	r5, #0
     c8f: 25 9f        	ldr	r7, [sp, #148]
     c91: 62 04        	lsls	r2, r4, #17
     c93: 00 00        	movs	r0, r0
     c95: 6c 04        	lsls	r4, r5, #17
     c97: 00 00        	movs	r0, r0
     c99: 06 00        	movs	r6, r0
     c9b: 70 00        	lsls	r0, r6, #1
     c9d: 08           	<unknown>
     c9e: ff 1a        	subs	r7, r7, r3
     ca0: 9f 6e        	ldr	r7, [r3, #104]
     ca2: 04 00        	movs	r4, r0
     ca4: 00 70        	strb	r0, [r0]
     ca6: 04 00        	movs	r4, r0
     ca8: 00 06        	lsls	r0, r0, #24
     caa: 00 70        	strb	r0, [r0]
     cac: 00 08        	lsrs	r0, r0, #32
     cae: ff 1a        	subs	r7, r7, r3
     cb0: 9f 00        	lsls	r7, r3, #2
     cb2: 00 00        	movs	r0, r0
     cb4: 00 00        	movs	r0, r0
     cb6: 00 00        	movs	r0, r0
     cb8: 00 44        	add	r0, r0
     cba: 04 00        	movs	r4, r0
     cbc: 00 4e        	ldr	r6, [pc, #0]            @ 0xcc0 <.debug_info+0xcc0>
     cbe: 04 00        	movs	r4, r0
     cc0: 00 02        	lsls	r0, r0, #8
     cc2: 00 30        	adds	r0, #0
     cc4: 9f 4e        	ldr	r6, [pc, #636]          @ 0xf44 <.debug_info+0xf44>
     cc6: 04 00        	movs	r4, r0
     cc8: 00 50        	str	r0, [r0, r0]
     cca: 04 00        	movs	r4, r0
     ccc: 00 01        	lsls	r0, r0, #4
     cce: 00 53        	strh	r0, [r0, r4]
     cd0: 50 04        	lsls	r0, r2, #17
     cd2: 00 00        	movs	r0, r0
     cd4: 58 04        	lsls	r0, r3, #17
     cd6: 00 00        	movs	r0, r0
     cd8: 02 00        	movs	r2, r0
     cda: 30 9f        	ldr	r7, [sp, #192]
     cdc: 58 04        	lsls	r0, r3, #17
     cde: 00 00        	movs	r0, r0
     ce0: 5a 04        	lsls	r2, r3, #17
     ce2: 00 00        	movs	r0, r0
     ce4: 01 00        	movs	r1, r0
     ce6: 53 5a        	ldrh	r3, [r2, r1]
     ce8: 04 00        	movs	r4, r0
     cea: 00 5e        	ldrsh	r0, [r0, r0]
     cec: 04 00        	movs	r4, r0
     cee: 00 02        	lsls	r0, r0, #8
     cf0: 00 30        	adds	r0, #0
     cf2: 9f 5e        	ldrsh	r7, [r3, r2]
     cf4: 04 00        	movs	r4, r0
     cf6: 00 64        	str	r0, [r0, #64]
     cf8: 04 00        	movs	r4, r0
     cfa: 00 01        	lsls	r0, r0, #4
     cfc: 00 53        	strh	r0, [r0, r4]
		...
     d06: 44 04        	lsls	r4, r0, #17
     d08: 00 00        	movs	r0, r0
     d0a: 70 04        	lsls	r0, r6, #17
     d0c: 00 00        	movs	r0, r0
     d0e: 02 00        	movs	r2, r0
     d10: 30 9f        	ldr	r7, [sp, #192]
     d12: 70 04        	lsls	r0, r6, #17
     d14: 00 00        	movs	r0, r0
     d16: 78 04        	lsls	r0, r7, #17
     d18: 00 00        	movs	r0, r0
     d1a: 01 00        	movs	r1, r0
     d1c: 50 00        	lsls	r0, r2, #1
     d1e: 00 00        	movs	r0, r0
     d20: 00 00        	movs	r0, r0
     d22: 00 00        	movs	r0, r0
     d24: 00 80        	strh	r0, [r0]
     d26: 04 00        	movs	r4, r0
     d28: 00 a6        	adr	r6, #0 <.debug_info+0xd2c>
     d2a: 04 00        	movs	r4, r0
     d2c: 00 02        	lsls	r0, r0, #8
     d2e: 00 30        	adds	r0, #0
     d30: 9f a6        	adr	r6, #636 <.debug_info+0xdd3>
     d32: 04 00        	movs	r4, r0
     d34: 00 ac        	add	r4, sp, #0
     d36: 04 00        	movs	r4, r0
     d38: 00 01        	lsls	r0, r0, #4
     d3a: 00 50        	str	r0, [r0, r0]
		...
     d44: 86 04        	lsls	r6, r0, #18
     d46: 00 00        	movs	r0, r0
     d48: 9a 04        	lsls	r2, r3, #18
     d4a: 00 00        	movs	r0, r0
     d4c: 01 00        	movs	r1, r0
     d4e: 50 00        	lsls	r0, r2, #1
     d50: 00 00        	movs	r0, r0
     d52: 00 00        	movs	r0, r0
     d54: 00 00        	movs	r0, r0
     d56: 00           	<unknown>
     d57: bc 04        	lsls	r4, r7, #18
     d59: 00 00        	movs	r0, r0
     d5b: c6 04        	lsls	r6, r0, #19
     d5d: 00 00        	movs	r0, r0
     d5f: 01 00        	movs	r1, r0
     d61: 50 c6        	stm	r6!, {r4, r6}
     d63: 04 00        	movs	r4, r0
     d65: 00           	<unknown>
     d66: c8 04        	lsls	r0, r1, #19
     d68: 00 00        	movs	r0, r0
     d6a: 04 00        	movs	r4, r0
     d6c: f3 01        	lsls	r3, r6, #7
     d6e: 50 9f        	ldr	r7, [sp, #320]
     d70: c8 04        	lsls	r0, r1, #19
     d72: 00 00        	movs	r0, r0
     d74: ca 04        	lsls	r2, r1, #19
     d76: 00 00        	movs	r0, r0
     d78: 01 00        	movs	r1, r0
     d7a: 50 ca        	ldm	r2!, {r4, r6}
     d7c: 04 00        	movs	r4, r0
     d7e: 00 d0        	beq	0xd82 <.debug_info+0xd82> @ imm = #0
     d80: 04 00        	movs	r4, r0
     d82: 00 04        	lsls	r0, r0, #16
     d84: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     d88: 9f 00        	lsls	r7, r3, #2
     d8a: 00 00        	movs	r0, r0
     d8c: 00 00        	movs	r0, r0
     d8e: 00 00        	movs	r0, r0
     d90: 00           	<unknown>
     d91: bc 04        	lsls	r4, r7, #18
     d93: 00 00        	movs	r0, r0
     d95: ca 04        	lsls	r2, r1, #19
     d97: 00 00        	movs	r0, r0
     d99: 02 00        	movs	r2, r0
     d9b: 30 9f        	ldr	r7, [sp, #192]
     d9d: ca 04        	lsls	r2, r1, #19
     d9f: 00 00        	movs	r0, r0
     da1: d0 04        	lsls	r0, r2, #19
     da3: 00 00        	movs	r0, r0
     da5: 01 00        	movs	r1, r0
     da7: 50 00        	lsls	r0, r2, #1
		...
     db1: 00 00        	movs	r0, r0
     db3: 00 0a        	lsrs	r0, r0, #8
     db5: 00 00        	movs	r0, r0
     db7: 00 01        	lsls	r0, r0, #4
     db9: 00 50        	str	r0, [r0, r0]
     dbb: 0a 00        	movs	r2, r1
     dbd: 00 00        	movs	r0, r0
     dbf: 1a 00        	movs	r2, r3
     dc1: 00 00        	movs	r0, r0
     dc3: 04 00        	movs	r4, r0
     dc5: f3 01        	lsls	r3, r6, #7
     dc7: 50 9f        	ldr	r7, [sp, #320]
     dc9: 1a 00        	movs	r2, r3
     dcb: 00 00        	movs	r0, r0
     dcd: 22 00        	movs	r2, r4
     dcf: 00 00        	movs	r0, r0
     dd1: 01 00        	movs	r1, r0
     dd3: 50 22        	movs	r2, #80
     dd5: 00 00        	movs	r0, r0
     dd7: 00 32        	adds	r2, #0
     dd9: 00 00        	movs	r0, r0
     ddb: 00 04        	lsls	r0, r0, #16
     ddd: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     de1: 9f 32        	adds	r2, #159
     de3: 00 00        	movs	r0, r0
     de5: 00 3a        	subs	r2, #0
     de7: 00 00        	movs	r0, r0
     de9: 00 01        	lsls	r0, r0, #4
     deb: 00 50        	str	r0, [r0, r0]
     ded: 3a 00        	movs	r2, r7
     def: 00 00        	movs	r0, r0
     df1: 4a 00        	lsls	r2, r1, #1
     df3: 00 00        	movs	r0, r0
     df5: 04 00        	movs	r4, r0
     df7: f3 01        	lsls	r3, r6, #7
     df9: 50 9f        	ldr	r7, [sp, #320]
     dfb: 4a 00        	lsls	r2, r1, #1
     dfd: 00 00        	movs	r0, r0
     dff: 52 00        	lsls	r2, r2, #1
     e01: 00 00        	movs	r0, r0
     e03: 01 00        	movs	r1, r0
     e05: 50 52        	strh	r0, [r2, r1]
     e07: 00 00        	movs	r0, r0
     e09: 00 62        	str	r0, [r0, #32]
     e0b: 00 00        	movs	r0, r0
     e0d: 00 04        	lsls	r0, r0, #16
     e0f: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     e13: 9f 62        	str	r7, [r3, #40]
     e15: 00 00        	movs	r0, r0
     e17: 00 6a        	ldr	r0, [r0, #32]
     e19: 00 00        	movs	r0, r0
     e1b: 00 01        	lsls	r0, r0, #4
     e1d: 00 50        	str	r0, [r0, r0]
     e1f: 6a 00        	lsls	r2, r5, #1
     e21: 00 00        	movs	r0, r0
     e23: 7a 00        	lsls	r2, r7, #1
     e25: 00 00        	movs	r0, r0
     e27: 04 00        	movs	r4, r0
     e29: f3 01        	lsls	r3, r6, #7
     e2b: 50 9f        	ldr	r7, [sp, #320]
     e2d: 7a 00        	lsls	r2, r7, #1
     e2f: 00 00        	movs	r0, r0
     e31: 82 00        	lsls	r2, r0, #2
     e33: 00 00        	movs	r0, r0
     e35: 01 00        	movs	r1, r0
     e37: 50 82        	strh	r0, [r2, #18]
     e39: 00 00        	movs	r0, r0
     e3b: 00 92        	str	r2, [sp]
     e3d: 00 00        	movs	r0, r0
     e3f: 00 04        	lsls	r0, r0, #16
     e41: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     e45: 9f 92        	str	r2, [sp, #636]
     e47: 00 00        	movs	r0, r0
     e49: 00 9a        	ldr	r2, [sp]
     e4b: 00 00        	movs	r0, r0
     e4d: 00 01        	lsls	r0, r0, #4
     e4f: 00 50        	str	r0, [r0, r0]
     e51: 9a 00        	lsls	r2, r3, #2
     e53: 00 00        	movs	r0, r0
     e55: aa 00        	lsls	r2, r5, #2
     e57: 00 00        	movs	r0, r0
     e59: 04 00        	movs	r4, r0
     e5b: f3 01        	lsls	r3, r6, #7
     e5d: 50 9f        	ldr	r7, [sp, #320]
     e5f: aa 00        	lsls	r2, r5, #2
     e61: 00 00        	movs	r0, r0
     e63: b2 00        	lsls	r2, r6, #2
     e65: 00 00        	movs	r0, r0
     e67: 01 00        	movs	r1, r0
     e69: 50 b2        	sxtb	r0, r2
     e6b: 00 00        	movs	r0, r0
     e6d: 00           	<unknown>
     e6e: c2 00        	lsls	r2, r0, #3
     e70: 00 00        	movs	r0, r0
     e72: 04 00        	movs	r4, r0
     e74: f3 01        	lsls	r3, r6, #7
     e76: 50 9f        	ldr	r7, [sp, #320]
     e78: c2 00        	lsls	r2, r0, #3
     e7a: 00 00        	movs	r0, r0
     e7c: cc 00        	lsls	r4, r1, #3
     e7e: 00 00        	movs	r0, r0
     e80: 01 00        	movs	r1, r0
     e82: 50 cc        	ldm	r4, {r4, r6}
     e84: 00 00        	movs	r0, r0
     e86: 00 04        	lsls	r0, r0, #16
     e88: 01 00        	movs	r1, r0
     e8a: 00 04        	lsls	r0, r0, #16
     e8c: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     e90: 9f 00        	lsls	r7, r3, #2
     e92: 00 00        	movs	r0, r0
     e94: 00 00        	movs	r0, r0
     e96: 00 00        	movs	r0, r0
     e98: 00 06        	lsls	r0, r0, #24
     e9a: 01 00        	movs	r1, r0
     e9c: 00 0a        	lsrs	r0, r0, #8
     e9e: 01 00        	movs	r1, r0
     ea0: 00 02        	lsls	r0, r0, #8
     ea2: 00 30        	adds	r0, #0
     ea4: 9f 0a        	lsrs	r7, r3, #10
     ea6: 01 00        	movs	r1, r0
     ea8: 00 86        	strh	r0, [r0, #48]
     eaa: 01 00        	movs	r1, r0
     eac: 00 01        	lsls	r0, r0, #4
     eae: 00 52        	strh	r0, [r0, r0]
		...
     eb8: 06 01        	lsls	r6, r0, #4
     eba: 00 00        	movs	r0, r0
     ebc: 0a 01        	lsls	r2, r1, #4
     ebe: 00 00        	movs	r0, r0
     ec0: 02 00        	movs	r2, r0
     ec2: 30 9f        	ldr	r7, [sp, #192]
     ec4: 0e 01        	lsls	r6, r1, #4
     ec6: 00 00        	movs	r0, r0
     ec8: 1c 01        	lsls	r4, r3, #4
     eca: 00 00        	movs	r0, r0
     ecc: 01 00        	movs	r1, r0
     ece: 53 1c        	adds	r3, r2, #1
     ed0: 01 00        	movs	r1, r0
     ed2: 00 4e        	ldr	r6, [pc, #0]            @ 0xed4 <.debug_info+0xed4>
     ed4: 01 00        	movs	r1, r0
     ed6: 00 05        	lsls	r0, r0, #20
     ed8: 00 31        	adds	r1, #0
     eda: 72 00        	lsls	r2, r6, #1
     edc: 24 9f        	ldr	r7, [sp, #144]
     ede: 4e 01        	lsls	r6, r1, #5
     ee0: 00 00        	movs	r0, r0
     ee2: 50 01        	lsls	r0, r2, #5
     ee4: 00 00        	movs	r0, r0
     ee6: 06 00        	movs	r6, r0
     ee8: 73 00        	lsls	r3, r6, #1
     eea: 72 00        	lsls	r2, r6, #1
     eec: 24 9f        	ldr	r7, [sp, #144]
     eee: 50 01        	lsls	r0, r2, #5
     ef0: 00 00        	movs	r0, r0
     ef2: 7e 01        	lsls	r6, r7, #5
     ef4: 00 00        	movs	r0, r0
     ef6: 05 00        	movs	r5, r0
     ef8: 31 72        	strb	r1, [r6, #8]
     efa: 00 24        	movs	r4, #0
     efc: 9f 00        	lsls	r7, r3, #2
     efe: 00 00        	movs	r0, r0
     f00: 00 00        	movs	r0, r0
     f02: 00 00        	movs	r0, r0
     f04: 00 06        	lsls	r0, r0, #24
     f06: 01 00        	movs	r1, r0
     f08: 00 0a        	lsrs	r0, r0, #8
     f0a: 01 00        	movs	r1, r0
     f0c: 00 02        	lsls	r0, r0, #8
     f0e: 00 30        	adds	r0, #0
     f10: 9f 12        	asrs	r7, r3, #10
     f12: 01 00        	movs	r1, r0
     f14: 00 18        	adds	r0, r0, r0
     f16: 01 00        	movs	r1, r0
     f18: 00 01        	lsls	r0, r0, #4
     f1a: 00 54        	strb	r0, [r0, r0]
     f1c: 18 01        	lsls	r0, r3, #4
     f1e: 00 00        	movs	r0, r0
     f20: 1c 01        	lsls	r4, r3, #4
     f22: 00 00        	movs	r0, r0
     f24: 07 00        	movs	r7, r0
     f26: 71 00        	lsls	r1, r6, #1
     f28: 06 73        	strb	r6, [r0, #12]
     f2a: 00 1a        	subs	r0, r0, r0
     f2c: 9f 1c        	adds	r7, r3, #2
     f2e: 01 00        	movs	r1, r0
     f30: 00 24        	movs	r4, #0
     f32: 01 00        	movs	r1, r0
     f34: 00 09        	lsrs	r0, r0, #4
     f36: 00 31        	adds	r1, #0
     f38: 72 00        	lsls	r2, r6, #1
     f3a: 24 71        	strb	r4, [r4, #4]
     f3c: 00 06        	lsls	r0, r0, #24
     f3e: 1a 9f        	ldr	r7, [sp, #104]
		...
     f48: c0 01        	lsls	r0, r0, #7
     f4a: 00 00        	movs	r0, r0
     f4c: c8 01        	lsls	r0, r1, #7
     f4e: 00 00        	movs	r0, r0
     f50: 01 00        	movs	r1, r0
     f52: 50 c8        	ldm	r0!, {r4, r6}
     f54: 01 00        	movs	r1, r0
     f56: 00           	<unknown>
     f57: ca 01        	lsls	r2, r1, #7
     f59: 00 00        	movs	r0, r0
     f5b: 04 00        	movs	r4, r0
     f5d: f3 01        	lsls	r3, r6, #7
     f5f: 50 9f        	ldr	r7, [sp, #320]
     f61: ca 01        	lsls	r2, r1, #7
     f63: 00 00        	movs	r0, r0
     f65: cc 01        	lsls	r4, r1, #7
     f67: 00 00        	movs	r0, r0
     f69: 01 00        	movs	r1, r0
     f6b: 50 cc        	ldm	r4, {r4, r6}
     f6d: 01 00        	movs	r1, r0
     f6f: 00           	<unknown>
     f70: ce 01        	lsls	r6, r1, #7
     f72: 00 00        	movs	r0, r0
     f74: 04 00        	movs	r4, r0
     f76: f3 01        	lsls	r3, r6, #7
     f78: 50 9f        	ldr	r7, [sp, #320]
		...
     f82: c0 01        	lsls	r0, r0, #7
     f84: 00 00        	movs	r0, r0
     f86: cc 01        	lsls	r4, r1, #7
     f88: 00 00        	movs	r0, r0
     f8a: 02 00        	movs	r2, r0
     f8c: 30 9f        	ldr	r7, [sp, #192]
     f8e: cc 01        	lsls	r4, r1, #7
     f90: 00 00        	movs	r0, r0
     f92: ce 01        	lsls	r6, r1, #7
     f94: 00 00        	movs	r0, r0
     f96: 01 00        	movs	r1, r0
     f98: 50 00        	lsls	r0, r2, #1
     f9a: 00 00        	movs	r0, r0
     f9c: 00 00        	movs	r0, r0
     f9e: 00 00        	movs	r0, r0
     fa0: 00 d0        	beq	0xfa4 <.debug_info+0xfa4> @ imm = #0
     fa2: 01 00        	movs	r1, r0
     fa4: 00 d2        	bhs	0xfa8 <.debug_info+0xfa8> @ imm = #0
     fa6: 01 00        	movs	r1, r0
     fa8: 00 01        	lsls	r0, r0, #4
     faa: 00 50        	str	r0, [r0, r0]
     fac: d2 01        	lsls	r2, r2, #7
     fae: 00 00        	movs	r0, r0
     fb0: d6 01        	lsls	r6, r2, #7
     fb2: 00 00        	movs	r0, r0
     fb4: 04 00        	movs	r4, r0
     fb6: f3 01        	lsls	r3, r6, #7
     fb8: 50 9f        	ldr	r7, [sp, #320]
		...
     fc2: d8 01        	lsls	r0, r3, #7
     fc4: 00 00        	movs	r0, r0
     fc6: e0 01        	lsls	r0, r4, #7
     fc8: 00 00        	movs	r0, r0
     fca: 01 00        	movs	r1, r0
     fcc: 50 e0        	b	0x1070 <.debug_info+0x1070> @ imm = #160
     fce: 01 00        	movs	r1, r0
     fd0: 00 e2        	b	0x13d4 <.debug_info+0x13d4> @ imm = #1024
     fd2: 01 00        	movs	r1, r0
     fd4: 00 04        	lsls	r0, r0, #16
     fd6: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
     fda: 9f e2        	b	0x151c <.debug_info+0x151c> @ imm = #1342
     fdc: 01 00        	movs	r1, r0
     fde: 00 e4        	b	0x7e2 <.debug_info+0x7e2> @ imm = #-2048
     fe0: 01 00        	movs	r1, r0
     fe2: 00 01        	lsls	r0, r0, #4
     fe4: 00 50        	str	r0, [r0, r0]
     fe6: e4 01        	lsls	r4, r4, #7
     fe8: 00 00        	movs	r0, r0
     fea: e6 01        	lsls	r6, r4, #7
     fec: 00 00        	movs	r0, r0
     fee: 04 00        	movs	r4, r0
     ff0: f3 01        	lsls	r3, r6, #7
     ff2: 50 9f        	ldr	r7, [sp, #320]
		...
     ffc: d8 01        	lsls	r0, r3, #7
     ffe: 00 00        	movs	r0, r0
    1000: e4 01        	lsls	r4, r4, #7
    1002: 00 00        	movs	r0, r0
    1004: 02 00        	movs	r2, r0
    1006: 30 9f        	ldr	r7, [sp, #192]
    1008: e4 01        	lsls	r4, r4, #7
    100a: 00 00        	movs	r0, r0
    100c: e6 01        	lsls	r6, r4, #7
    100e: 00 00        	movs	r0, r0
    1010: 01 00        	movs	r1, r0
    1012: 50 00        	lsls	r0, r2, #1
    1014: 00 00        	movs	r0, r0
    1016: 00 00        	movs	r0, r0
    1018: 00 00        	movs	r0, r0
    101a: 00           	<unknown>
    101b: e8 01        	lsls	r0, r5, #7
    101d: 00 00        	movs	r0, r0
    101f: ea 01        	lsls	r2, r5, #7
    1021: 00 00        	movs	r0, r0
    1023: 01 00        	movs	r1, r0
    1025: 50 ea 01 00  	orrs.w	r0, r0, r1
    1029: 00 ee 01 00  	cdp	p0, #0, c0, c0, c1, #0
    102d: 00 04        	lsls	r0, r0, #16
    102f: 00 f3 01 50  	ssat	r0, #2, r0, lsl #20
    1033: 9f 00        	lsls	r7, r3, #2
    1035: 00 00        	movs	r0, r0
    1037: 00 00        	movs	r0, r0
    1039: 00 00        	movs	r0, r0
    103b: 00 08        	lsrs	r0, r0, #32
    103d: 02 00        	movs	r2, r0
    103f: 00 0c        	lsrs	r0, r0, #16
    1041: 02 00        	movs	r2, r0
    1043: 00 01        	lsls	r0, r0, #4
    1045: 00 51        	str	r0, [r0, r4]
    1047: 0c 02        	lsls	r4, r1, #8
    1049: 00 00        	movs	r0, r0
    104b: 10 02        	lsls	r0, r2, #8
    104d: 00 00        	movs	r0, r0
    104f: 04 00        	movs	r4, r0
    1051: f3 01        	lsls	r3, r6, #7
    1053: 51 9f        	ldr	r7, [sp, #324]
		...
    105d: 10 02        	lsls	r0, r2, #8
    105f: 00 00        	movs	r0, r0
    1061: 1c 02        	lsls	r4, r3, #8
    1063: 00 00        	movs	r0, r0
    1065: 01 00        	movs	r1, r0
    1067: 51 1c        	adds	r1, r2, #1
    1069: 02 00        	movs	r2, r0
    106b: 00 3e        	subs	r6, #0
    106d: 02 00        	movs	r2, r0
    106f: 00 04        	lsls	r0, r0, #16
    1071: 00 f3 01 51  	ssat	r1, #2, r0, lsl #20
    1075: 9f 00        	lsls	r7, r3, #2
    1077: 00 00        	movs	r0, r0
    1079: 00 00        	movs	r0, r0
    107b: 00 00        	movs	r0, r0
    107d: 00 10        	asrs	r0, r0, #32
    107f: 02 00        	movs	r2, r0
    1081: 00 1a        	subs	r0, r0, r0
    1083: 02 00        	movs	r2, r0
    1085: 00 01        	lsls	r0, r0, #4
    1087: 00 52        	strh	r0, [r0, r0]
    1089: 1a 02        	lsls	r2, r3, #8
    108b: 00 00        	movs	r0, r0
    108d: 3e 02        	lsls	r6, r7, #8
    108f: 00 00        	movs	r0, r0
    1091: 04 00        	movs	r4, r0
    1093: f3 01        	lsls	r3, r6, #7
    1095: 52 9f        	ldr	r7, [sp, #328]
		...
    109f: 12 02        	lsls	r2, r2, #8
    10a1: 00 00        	movs	r0, r0
    10a3: 1a 02        	lsls	r2, r3, #8
    10a5: 00 00        	movs	r0, r0
    10a7: 02 00        	movs	r2, r0
    10a9: 30 9f        	ldr	r7, [sp, #192]
    10ab: 1a 02        	lsls	r2, r3, #8
    10ad: 00 00        	movs	r0, r0
    10af: 36 02        	lsls	r6, r6, #8
    10b1: 00 00        	movs	r0, r0
    10b3: 01 00        	movs	r1, r0
    10b5: 52 00        	lsls	r2, r2, #1
    10b7: 00 00        	movs	r0, r0
    10b9: 00 00        	movs	r0, r0
    10bb: 00 00        	movs	r0, r0
    10bd: 00 12        	asrs	r0, r0, #8
    10bf: 02 00        	movs	r2, r0
    10c1: 00 36        	adds	r6, #0
    10c3: 02 00        	movs	r2, r0
    10c5: 00 02        	lsls	r0, r0, #8
    10c7: 00 30        	adds	r0, #0
    10c9: 9f 36        	adds	r6, #159
    10cb: 02 00        	movs	r2, r0
    10cd: 00 3e        	subs	r6, #0
    10cf: 02 00        	movs	r2, r0
    10d1: 00 01        	lsls	r0, r0, #4
    10d3: 00 52        	strh	r0, [r0, r0]
		...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
       0: 4c 00        	lsls	r4, r1, #1
       2: 00 00        	movs	r0, r0
       4: 02 00        	movs	r2, r0
       6: 00 00        	movs	r0, r0
       8: 00 00        	movs	r0, r0
       a: 04 00        	movs	r4, r0
		...
      14: c4 00        	lsls	r4, r0, #3
      16: 00 00        	movs	r0, r0
      18: 00 00        	movs	r0, r0
      1a: 00 00        	movs	r0, r0
      1c: bc 00        	lsls	r4, r7, #2
      1e: 00 00        	movs	r0, r0
      20: 10 09        	lsrs	r0, r2, #4
      22: 00 20        	movs	r0, #0
      24: 5c 00        	lsls	r4, r3, #1
      26: 00 00        	movs	r0, r0
      28: 00 00        	movs	r0, r0
      2a: 00 00        	movs	r0, r0
      2c: 20 00        	movs	r0, r4
      2e: 00 00        	movs	r0, r0
      30: 00 00        	movs	r0, r0
      32: 00 00        	movs	r0, r0
      34: 1c 00        	movs	r4, r3
      36: 00 00        	movs	r0, r0
      38: 00 00        	movs	r0, r0
      3a: 00 00        	movs	r0, r0
      3c: 70 00        	lsls	r0, r6, #1
      3e: 00 00        	movs	r0, r0
      40: 00 00        	movs	r0, r0
      42: 00 00        	movs	r0, r0
      44: 02 00        	movs	r2, r0
		...
      4e: 00 00        	movs	r0, r0
      50: 84 00        	lsls	r4, r0, #2
      52: 00 00        	movs	r0, r0
      54: 02 00        	movs	r2, r0
      56: 2c 11        	asrs	r4, r5, #4
      58: 00 00        	movs	r0, r0
      5a: 04 00        	movs	r4, r0
      5c: 00 00        	movs	r0, r0
      5e: 00 00        	movs	r0, r0
      60: 6c 09        	lsrs	r4, r5, #5
      62: 00 20        	movs	r0, #0
      64: 74 00        	lsls	r4, r6, #1
      66: 00 00        	movs	r0, r0
      68: 00 00        	movs	r0, r0
      6a: 00 00        	movs	r0, r0
      6c: 50 00        	lsls	r0, r2, #1
      6e: 00 00        	movs	r0, r0
      70: 00 00        	movs	r0, r0
      72: 00 00        	movs	r0, r0
      74: 24 00        	movs	r4, r4
      76: 00 00        	movs	r0, r0
      78: 00 00        	movs	r0, r0
      7a: 00 00        	movs	r0, r0
      7c: 18 00        	movs	r0, r3
      7e: 00 00        	movs	r0, r0
      80: 00 00        	movs	r0, r0
      82: 00 00        	movs	r0, r0
      84: 18 00        	movs	r0, r3
      86: 00 00        	movs	r0, r0
      88: e0 09        	lsrs	r0, r4, #7
      8a: 00 20        	movs	r0, #0
      8c: 18 00        	movs	r0, r3
      8e: 00 00        	movs	r0, r0
      90: f8 09        	lsrs	r0, r7, #7
      92: 00 20        	movs	r0, #0
      94: 40 02        	lsls	r0, r0, #9
      96: 00 00        	movs	r0, r0
      98: 00 00        	movs	r0, r0
      9a: 00 00        	movs	r0, r0
      9c: 1c 00        	movs	r4, r3
      9e: 00 00        	movs	r0, r0
      a0: 00 00        	movs	r0, r0
      a2: 00 00        	movs	r0, r0
      a4: 0c 00        	movs	r4, r1
      a6: 00 00        	movs	r0, r0
      a8: 00 00        	movs	r0, r0
      aa: 00 00        	movs	r0, r0
      ac: 44 00        	lsls	r4, r0, #1
      ae: 00 00        	movs	r0, r0
      b0: 00 00        	movs	r0, r0
      b2: 00 00        	movs	r0, r0
      b4: 34 00        	movs	r4, r6
      b6: 00 00        	movs	r0, r0
      b8: 00 00        	movs	r0, r0
      ba: 00 00        	movs	r0, r0
      bc: 3c 00        	movs	r4, r7
      be: 00 00        	movs	r0, r0
      c0: 00 00        	movs	r0, r0
      c2: 00 00        	movs	r0, r0
      c4: 18 00        	movs	r0, r3
      c6: 00 00        	movs	r0, r0
      c8: 00 00        	movs	r0, r0
      ca: 00 00        	movs	r0, r0
      cc: 28 00        	movs	r0, r5
		...
      d6: 00 00        	movs	r0, r0
      d8: 1c 00        	movs	r4, r3
      da: 00 00        	movs	r0, r0
      dc: 02 00        	movs	r2, r0
      de: 75 25        	movs	r5, #117
      e0: 00 00        	movs	r0, r0
      e2: 04 00        	movs	r4, r0

000000e4 <$d>:
      e4: 00 00        	movs	r0, r0
      e6: 00 00        	movs	r0, r0
      e8: 38 0c        	lsrs	r0, r7, #16
      ea: 00 20        	movs	r0, #0
      ec: 06 00        	movs	r6, r0
		...
      f6: 00 00        	movs	r0, r0
      f8: 1c 00        	movs	r4, r3
      fa: 00 00        	movs	r0, r0
      fc: 02 00        	movs	r2, r0
      fe: df 25        	movs	r5, #223
     100: 00 00        	movs	r0, r0
     102: 04 00        	movs	r4, r0
     104: 00 00        	movs	r0, r0
     106: 00 00        	movs	r0, r0
     108: 40 0c        	lsrs	r0, r0, #17
     10a: 00 20        	movs	r0, #0
     10c: dc 04        	lsls	r4, r3, #19
		...
     116: 00 00        	movs	r0, r0
     118: 1c 00        	movs	r4, r3
     11a: 00 00        	movs	r0, r0
     11c: 02 00        	movs	r2, r0
     11e: 3d 32        	adds	r2, #61
     120: 00 00        	movs	r0, r0
     122: 04 00        	movs	r4, r0
     124: 00 00        	movs	r0, r0
     126: 00 00        	movs	r0, r0
     128: 1c 11        	asrs	r4, r3, #4
     12a: 00 20        	movs	r0, #0
     12c: 3e 02        	lsls	r6, r7, #8
		...
     136: 00 00        	movs	r0, r0

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
       0: 01 00        	movs	r1, r0
       2: 00 00        	movs	r0, r0
       4: 01 00        	movs	r1, r0
       6: 00 00        	movs	r0, r0
       8: 01 00        	movs	r1, r0
       a: 00 00        	movs	r0, r0
       c: 01 00        	movs	r1, r0
       e: 00 00        	movs	r0, r0
      10: 10 09        	lsrs	r0, r2, #4
      12: 00 20        	movs	r0, #0
      14: 6c 09        	lsrs	r4, r5, #5
      16: 00 20        	movs	r0, #0
      18: 01 00        	movs	r1, r0
      1a: 00 00        	movs	r0, r0
      1c: 01 00        	movs	r1, r0
      1e: 00 00        	movs	r0, r0
      20: 01 00        	movs	r1, r0
      22: 00 00        	movs	r0, r0
      24: 01 00        	movs	r1, r0
      26: 00 00        	movs	r0, r0
      28: 01 00        	movs	r1, r0
      2a: 00 00        	movs	r0, r0
      2c: 01 00        	movs	r1, r0
      2e: 00 00        	movs	r0, r0
      30: 01 00        	movs	r1, r0
      32: 00 00        	movs	r0, r0
      34: 01 00        	movs	r1, r0
		...
      3e: 00 00        	movs	r0, r0
      40: 6c 09        	lsrs	r4, r5, #5
      42: 00 20        	movs	r0, #0
      44: e0 09        	lsrs	r0, r4, #7
      46: 00 20        	movs	r0, #0
      48: 01 00        	movs	r1, r0
      4a: 00 00        	movs	r0, r0
      4c: 01 00        	movs	r1, r0
      4e: 00 00        	movs	r0, r0
      50: 01 00        	movs	r1, r0
      52: 00 00        	movs	r0, r0
      54: 01 00        	movs	r1, r0
      56: 00 00        	movs	r0, r0
      58: 01 00        	movs	r1, r0
      5a: 00 00        	movs	r0, r0
      5c: 01 00        	movs	r1, r0
      5e: 00 00        	movs	r0, r0
      60: 01 00        	movs	r1, r0
      62: 00 00        	movs	r0, r0
      64: 01 00        	movs	r1, r0
      66: 00 00        	movs	r0, r0
      68: e0 09        	lsrs	r0, r4, #7
      6a: 00 20        	movs	r0, #0
      6c: f8 09        	lsrs	r0, r7, #7
      6e: 00 20        	movs	r0, #0
      70: f8 09        	lsrs	r0, r7, #7
      72: 00 20        	movs	r0, #0
      74: 38 0c        	lsrs	r0, r7, #16
      76: 00 20        	movs	r0, #0
      78: 01 00        	movs	r1, r0
      7a: 00 00        	movs	r0, r0
      7c: 01 00        	movs	r1, r0
      7e: 00 00        	movs	r0, r0
      80: 01 00        	movs	r1, r0
      82: 00 00        	movs	r0, r0
      84: 01 00        	movs	r1, r0
      86: 00 00        	movs	r0, r0
      88: 01 00        	movs	r1, r0
      8a: 00 00        	movs	r0, r0
      8c: 01 00        	movs	r1, r0
      8e: 00 00        	movs	r0, r0
      90: 01 00        	movs	r1, r0
      92: 00 00        	movs	r0, r0
      94: 01 00        	movs	r1, r0
      96: 00 00        	movs	r0, r0
      98: 01 00        	movs	r1, r0
      9a: 00 00        	movs	r0, r0
      9c: 01 00        	movs	r1, r0
      9e: 00 00        	movs	r0, r0
      a0: 01 00        	movs	r1, r0
      a2: 00 00        	movs	r0, r0
      a4: 01 00        	movs	r1, r0
      a6: 00 00        	movs	r0, r0
      a8: 01 00        	movs	r1, r0
      aa: 00 00        	movs	r0, r0
      ac: 01 00        	movs	r1, r0
		...
      b6: 00 00        	movs	r0, r0

Disassembly of section .debug_line:

00000000 <.debug_line>:
       0: 8a 02        	lsls	r2, r1, #10
       2: 00 00        	movs	r0, r0
       4: 02 00        	movs	r2, r0
       6: a1 01        	lsls	r1, r4, #6
       8: 00 00        	movs	r0, r0
       a: 02 01        	lsls	r2, r0, #4
       c: fb 0e        	lsrs	r3, r7, #27
       e: 0d 00        	movs	r5, r1
      10: 01 01        	lsls	r1, r0, #4
      12: 01 01        	lsls	r1, r0, #4
      14: 00 00        	movs	r0, r0
      16: 00 01        	lsls	r0, r0, #4
      18: 00 00        	movs	r0, r0
      1a: 01 73        	strb	r1, [r0, #12]
      1c: 72 63        	str	r2, [r6, #52]
      1e: 00 6c        	ldr	r0, [r0, #64]
      20: 69 62        	str	r1, [r5, #36]
      22: 2f 69        	ldr	r7, [r5, #16]
      24: 6e 63        	str	r6, [r5, #52]
      26: 2f 63        	str	r7, [r5, #48]
      28: 6f 72        	strb	r7, [r5, #9]
      2a: 65 00        	lsls	r5, r4, #1
      2c: 2f 75        	strb	r7, [r5, #20]
      2e: 73 72        	strb	r3, [r6, #9]
      30: 2f 6c        	ldr	r7, [r5, #64]
      32: 6f 63        	str	r7, [r5, #52]
      34: 61 6c        	ldr	r1, [r4, #68]
      36: 2f 43        	orrs	r7, r5
      38: 65 6c        	ldr	r5, [r4, #68]
      3a: 6c 61        	str	r4, [r5, #20]
      3c: 72 2f        	cmp	r7, #114
      3e: 67 63        	str	r7, [r4, #52]
      40: 63 2d        	cmp	r5, #99
      42: 61 72        	strb	r1, [r4, #9]
      44: 6d 2d        	cmp	r5, #109
      46: 6e 6f        	ldr	r6, [r5, #116]
      48: 6e 65        	str	r6, [r5, #84]
      4a: 2d 65        	str	r5, [r5, #80]
      4c: 61 62        	str	r1, [r4, #36]
      4e: 69 2d        	cmp	r5, #105
      50: 34 39        	subs	r1, #52
      52: 2f 32        	adds	r2, #47
      54: 30 31        	adds	r1, #48
      56: 35 30        	adds	r0, #53
      58: 39 32        	adds	r2, #57
      5a: 35 2f        	cmp	r7, #53
      5c: 61 72        	strb	r1, [r4, #9]
      5e: 6d 2d        	cmp	r5, #109
      60: 6e 6f        	ldr	r6, [r5, #116]
      62: 6e 65        	str	r6, [r5, #84]
      64: 2d 65        	str	r5, [r5, #80]
      66: 61 62        	str	r1, [r4, #36]
      68: 69 2f        	cmp	r7, #105
      6a: 69 6e        	ldr	r1, [r5, #100]
      6c: 63 6c        	ldr	r3, [r4, #68]
      6e: 75 64        	str	r5, [r6, #68]
      70: 65 2f        	cmp	r7, #101
      72: 6d 61        	str	r5, [r5, #20]
      74: 63 68        	ldr	r3, [r4, #4]
      76: 69 6e        	ldr	r1, [r5, #100]
      78: 65 00        	lsls	r5, r4, #1
      7a: 2f 75        	strb	r7, [r5, #20]
      7c: 73 72        	strb	r3, [r6, #9]
      7e: 2f 6c        	ldr	r7, [r5, #64]
      80: 6f 63        	str	r7, [r5, #52]
      82: 61 6c        	ldr	r1, [r4, #68]
      84: 2f 43        	orrs	r7, r5
      86: 65 6c        	ldr	r5, [r4, #68]
      88: 6c 61        	str	r4, [r5, #20]
      8a: 72 2f        	cmp	r7, #114
      8c: 67 63        	str	r7, [r4, #52]
      8e: 63 2d        	cmp	r5, #99
      90: 61 72        	strb	r1, [r4, #9]
      92: 6d 2d        	cmp	r5, #109
      94: 6e 6f        	ldr	r6, [r5, #116]
      96: 6e 65        	str	r6, [r5, #84]
      98: 2d 65        	str	r5, [r5, #80]
      9a: 61 62        	str	r1, [r4, #36]
      9c: 69 2d        	cmp	r5, #105
      9e: 34 39        	subs	r1, #52
      a0: 2f 32        	adds	r2, #47
      a2: 30 31        	adds	r1, #48
      a4: 35 30        	adds	r0, #53
      a6: 39 32        	adds	r2, #57
      a8: 35 2f        	cmp	r7, #53
      aa: 61 72        	strb	r1, [r4, #9]
      ac: 6d 2d        	cmp	r5, #109
      ae: 6e 6f        	ldr	r6, [r5, #116]
      b0: 6e 65        	str	r6, [r5, #84]
      b2: 2d 65        	str	r5, [r5, #80]
      b4: 61 62        	str	r1, [r4, #36]
      b6: 69 2f        	cmp	r7, #105
      b8: 69 6e        	ldr	r1, [r5, #100]
      ba: 63 6c        	ldr	r3, [r4, #68]
      bc: 75 64        	str	r5, [r6, #68]
      be: 65 2f        	cmp	r7, #101
      c0: 73 79        	ldrb	r3, [r6, #5]
      c2: 73 00        	lsls	r3, r6, #1
      c4: 6c 69        	ldr	r4, [r5, #20]
      c6: 62 2f        	cmp	r7, #98
      c8: 69 6e        	ldr	r1, [r5, #100]
      ca: 63 00        	lsls	r3, r4, #1
      cc: 6c 69        	ldr	r4, [r5, #20]
      ce: 62 2f        	cmp	r7, #98
      d0: 69 6e        	ldr	r1, [r5, #100]
      d2: 63 2f        	cmp	r7, #99
      d4: 70 65        	str	r0, [r6, #84]
      d6: 72 69        	ldr	r2, [r6, #20]
      d8: 70 68        	ldr	r0, [r6, #4]
      da: 65 72        	strb	r5, [r4, #9]
      dc: 61 6c        	ldr	r1, [r4, #68]
      de: 73 00        	lsls	r3, r6, #1
      e0: 69 6e        	ldr	r1, [r5, #100]
      e2: 63 00        	lsls	r3, r4, #1
      e4: 68 65        	str	r0, [r5, #84]
      e6: 6c 69        	ldr	r4, [r5, #20]
      e8: 78 2f        	cmp	r7, #120
      ea: 70 75        	strb	r0, [r6, #21]
      ec: 62 00        	lsls	r2, r4, #1
      ee: 00 6d        	ldr	r0, [r0, #80]
      f0: 61 69        	ldr	r1, [r4, #20]
      f2: 6e 2e        	cmp	r6, #110
      f4: 63 00        	lsls	r3, r4, #1
      f6: 01 00        	movs	r1, r0
      f8: 00 63        	str	r0, [r0, #48]
      fa: 6f 72        	strb	r7, [r5, #9]
      fc: 65 5f        	ldrsh	r5, [r4, r5]
      fe: 63 6d        	ldr	r3, [r4, #84]
     100: 34 2e        	cmp	r6, #52
     102: 68 00        	lsls	r0, r5, #1
     104: 02 00        	movs	r2, r0
     106: 00 5f        	ldrsh	r0, [r0, r4]
     108: 64 65        	str	r4, [r4, #84]
     10a: 66 61        	str	r6, [r4, #20]
     10c: 75 6c        	ldr	r5, [r6, #68]
     10e: 74 5f        	ldrsh	r4, [r6, r5]
     110: 74 79        	ldrb	r4, [r6, #5]
     112: 70 65        	str	r0, [r6, #84]
     114: 73 2e        	cmp	r6, #115
     116: 68 00        	lsls	r0, r5, #1
     118: 03 00        	movs	r3, r0
     11a: 00 5f        	ldrsh	r0, [r0, r4]
     11c: 73 74        	strb	r3, [r6, #17]
     11e: 64 69        	ldr	r4, [r4, #20]
     120: 6e 74        	strb	r6, [r5, #17]
     122: 2e 68        	ldr	r6, [r5]
     124: 00 04        	lsls	r0, r0, #16
     126: 00 00        	movs	r0, r0
     128: 73 74        	strb	r3, [r6, #17]
     12a: 6d 33        	adds	r3, #109
     12c: 32 66        	str	r2, [r6, #96]
     12e: 34 78        	ldrb	r4, [r6]
     130: 78 2e        	cmp	r6, #120
     132: 68 00        	lsls	r0, r5, #1
     134: 05 00        	movs	r5, r0
     136: 00 73        	strb	r0, [r0, #12]
     138: 74 6d        	ldr	r4, [r6, #84]
     13a: 33 32        	adds	r2, #51
     13c: 66 34        	adds	r4, #102
     13e: 78 78        	ldrb	r0, [r7, #1]
     140: 5f 67        	str	r7, [r3, #116]
     142: 70 69        	ldr	r0, [r6, #20]
     144: 6f 2e        	cmp	r6, #111
     146: 68 00        	lsls	r0, r5, #1
     148: 06 00        	movs	r6, r0
     14a: 00 73        	strb	r0, [r0, #12]
     14c: 74 6d        	ldr	r4, [r6, #84]
     14e: 33 32        	adds	r2, #51
     150: 66 34        	adds	r4, #102
     152: 78 78        	ldrb	r0, [r7, #1]
     154: 5f 75        	strb	r7, [r3, #21]
     156: 73 61        	str	r3, [r6, #20]
     158: 72 74        	strb	r2, [r6, #17]
     15a: 2e 68        	ldr	r6, [r5]
     15c: 00 06        	lsls	r0, r0, #24
     15e: 00 00        	movs	r0, r0
     160: 41 75        	strb	r1, [r0, #21]
     162: 64 69        	ldr	r4, [r4, #20]
     164: 6f 2e        	cmp	r6, #111
     166: 68 00        	lsls	r0, r5, #1
     168: 07 00        	movs	r7, r0
     16a: 00 6d        	ldr	r0, [r0, #80]
     16c: 70 33        	adds	r3, #112
     16e: 64 65        	str	r4, [r4, #84]
     170: 63 2e        	cmp	r6, #99
     172: 68 00        	lsls	r0, r5, #1
     174: 08 00        	movs	r0, r1
     176: 00 73        	strb	r0, [r0, #12]
     178: 79 73        	strb	r1, [r7, #13]
     17a: 74 65        	str	r4, [r6, #84]
     17c: 6d 5f        	ldrsh	r5, [r5, r5]
     17e: 73 74        	strb	r3, [r6, #17]
     180: 6d 33        	adds	r3, #109
     182: 32 66        	str	r2, [r6, #96]
     184: 34 78        	ldrb	r4, [r6]
     186: 78 2e        	cmp	r6, #120
     188: 68 00        	lsls	r0, r5, #1
     18a: 05 00        	movs	r5, r0
     18c: 00 73        	strb	r0, [r0, #12]
     18e: 74 6d        	ldr	r4, [r6, #84]
     190: 33 32        	adds	r2, #51
     192: 66 34        	adds	r4, #102
     194: 78 78        	ldrb	r0, [r7, #1]
     196: 5f 72        	strb	r7, [r3, #9]
     198: 63 63        	str	r3, [r4, #52]
     19a: 2e 68        	ldr	r6, [r5]
     19c: 00 06        	lsls	r0, r0, #24
     19e: 00 00        	movs	r0, r0
     1a0: 6d 61        	str	r5, [r5, #20]
     1a2: 69 6e        	ldr	r1, [r5, #100]
     1a4: 2e 68        	ldr	r6, [r5]
     1a6: 00 07        	lsls	r0, r0, #28
     1a8: 00 00        	movs	r0, r0
     1aa: 00 00        	movs	r0, r0
     1ac: 05 02        	lsls	r5, r0, #8
     1ae: 00 00        	movs	r0, r0
     1b0: 00 00        	movs	r0, r0
     1b2: 03 c5        	stm	r5!, {r0, r1}
     1b4: 00 01        	lsls	r0, r0, #4
     1b6: 03 0b        	lsrs	r3, r0, #12
     1b8: 2e 22        	movs	r2, #46
     1ba: 67 56        	ldrsb	r7, [r4, r1]
     1bc: 33 67        	str	r3, [r6, #112]
     1be: 56 25        	movs	r5, #86
     1c0: 59 3e        	subs	r6, #89
     1c2: 4b 2f        	cmp	r7, #75
     1c4: 2f 31        	adds	r1, #47
     1c6: 67 76        	strb	r7, [r4, #25]
     1c8: 22 03        	lsls	r2, r4, #12
     1ca: 62 3c        	subs	r4, #98
     1cc: 03 2c        	cmp	r4, #3
     1ce: 2e 03        	lsls	r6, r5, #12
     1d0: 54 58        	ldr	r4, [r2, r1]
     1d2: 03 20        	movs	r0, #3
     1d4: 2e 03        	lsls	r6, r5, #12
     1d6: 0f 20        	movs	r0, #15
     1d8: 21 5a        	ldrh	r1, [r4, r0]
     1da: 02 13        	asrs	r2, r0, #12
     1dc: 00 01        	lsls	r0, r0, #4
     1de: 01 00        	movs	r1, r0
     1e0: 05 02        	lsls	r5, r0, #8
     1e2: 00 00        	movs	r0, r0
     1e4: 00 00        	movs	r0, r0
     1e6: 03 fe 00 01  	cdp2	p1, #0, c0, c3, c0, #0
     1ea: 32 04        	lsls	r2, r6, #16
     1ec: 02 03        	lsls	r2, r0, #12
     1ee: 82 09        	lsrs	r2, r0, #6
     1f0: 58 03        	lsls	r0, r3, #13
     1f2: 82 7f        	ldrb	r2, [r0, #30]
     1f4: 4a 03        	lsls	r2, r1, #13
     1f6: 80 01        	lsls	r0, r0, #6
     1f8: 4a 2f        	cmp	r7, #74
     1fa: 04 01        	lsls	r4, r0, #4
     1fc: 03 92        	str	r2, [sp, #12]
     1fe: 77 2e        	cmp	r6, #119
     200: 59 4d        	ldr	r5, [pc, #356]          @ 0x368 <.debug_info+0x368>
     202: 3d 3d        	subs	r5, #61
     204: 3d 2f        	cmp	r7, #61
     206: 3d 5a        	ldrh	r5, [r7, r0]
     208: 59 5b        	ldrh	r1, [r3, r5]
     20a: 3d 2f        	cmp	r7, #61
     20c: 2f 2f        	cmp	r7, #47
     20e: 2f 3d        	subs	r5, #47
     210: 5b 4b        	ldr	r3, [pc, #364]          @ 0x380 <.debug_info+0x380>
     212: 02 0e        	lsrs	r2, r0, #24
     214: 00 01        	lsls	r0, r0, #4
     216: 01 00        	movs	r1, r0
     218: 05 02        	lsls	r5, r0, #8
     21a: 10 09        	lsrs	r0, r2, #4
     21c: 00 20        	movs	r0, #0
     21e: 03 b4        	push	{r0, r1}
     220: 01 01        	lsls	r1, r0, #4
     222: 32 4d        	ldr	r5, [pc, #200]          @ 0x2ec <.debug_info+0x2ec>
     224: 3d 3d        	subs	r5, #61
     226: 3d 3d        	subs	r5, #61
     228: 2f 5a        	ldrh	r7, [r5, r0]
     22a: 75 3e        	subs	r6, #117
     22c: 5b 02        	lsls	r3, r3, #9
     22e: 06 00        	movs	r6, r0
     230: 01 01        	lsls	r1, r0, #4
     232: 00 05        	lsls	r0, r0, #20
     234: 02 00        	movs	r2, r0
     236: 00 00        	movs	r0, r0
     238: 00 03        	lsls	r0, r0, #12
     23a: cd 01        	lsls	r5, r1, #7
     23c: 01 13        	asrs	r1, r0, #12
     23e: 3d 4d        	ldr	r5, [pc, #244]          @ 0x334 <.debug_info+0x334>
     240: 02 09        	lsrs	r2, r0, #4
     242: 00 01        	lsls	r0, r0, #4
     244: 01 00        	movs	r1, r0
     246: 05 02        	lsls	r5, r0, #8
     248: 00 00        	movs	r0, r0
     24a: 00 00        	movs	r0, r0
     24c: 03 d8        	bhi	0x256 <.debug_info+0x256> @ imm = #6
     24e: 01 01        	lsls	r1, r0, #4
     250: 2f 00        	movs	r7, r5
     252: 02 04        	lsls	r2, r0, #16
     254: 01 3e        	subs	r6, #1
     256: 4b 02        	lsls	r3, r1, #9
     258: 05 00        	movs	r5, r0
     25a: 01 01        	lsls	r1, r0, #4
     25c: 00 05        	lsls	r0, r0, #20
     25e: 02 00        	movs	r2, r0
     260: 00 00        	movs	r0, r0
     262: 00 03        	lsls	r0, r0, #12
     264: 1c 01        	lsls	r4, r3, #4
     266: 21 32        	adds	r2, #33
     268: 4b 4b        	ldr	r3, [pc, #300]          @ 0x398 <.debug_info+0x398>
     26a: 45 03        	lsls	r5, r0, #13
     26c: 0b 20        	movs	r0, #11
     26e: 5a 3d        	subs	r5, #90
     270: 5b 22        	movs	r2, #91
     272: 3b 32        	adds	r2, #59
     274: 3b 00        	movs	r3, r7
     276: 02 04        	lsls	r2, r0, #16
     278: 01 25        	movs	r5, #1
     27a: 08 00        	movs	r0, r1
     27c: 01 01        	lsls	r1, r0, #4
     27e: 00 05        	lsls	r0, r0, #20
     280: 02 00        	movs	r2, r0
     282: 00 00        	movs	r0, r0
     284: 00 03        	lsls	r0, r0, #12
     286: e1 01        	lsls	r1, r4, #7
     288: 01 02        	lsls	r1, r0, #8
     28a: 01 00        	movs	r1, r0
     28c: 01 01        	lsls	r1, r0, #4
     28e: 26 03        	lsls	r6, r4, #12
     290: 00 00        	movs	r0, r0
     292: 02 00        	movs	r2, r0
     294: 57 01        	lsls	r7, r2, #5
     296: 00 00        	movs	r0, r0
     298: 02 01        	lsls	r2, r0, #4
     29a: fb 0e        	lsrs	r3, r7, #27
     29c: 0d 00        	movs	r5, r1
     29e: 01 01        	lsls	r1, r0, #4
     2a0: 01 01        	lsls	r1, r0, #4
     2a2: 00 00        	movs	r0, r0
     2a4: 00 01        	lsls	r0, r0, #4
     2a6: 00 00        	movs	r0, r0
     2a8: 01 73        	strb	r1, [r0, #12]
     2aa: 72 63        	str	r2, [r6, #52]
     2ac: 00 6c        	ldr	r0, [r0, #64]
     2ae: 69 62        	str	r1, [r5, #36]
     2b0: 2f 69        	ldr	r7, [r5, #16]
     2b2: 6e 63        	str	r6, [r5, #52]
     2b4: 2f 63        	str	r7, [r5, #48]
     2b6: 6f 72        	strb	r7, [r5, #9]
     2b8: 65 00        	lsls	r5, r4, #1
     2ba: 2f 75        	strb	r7, [r5, #20]
     2bc: 73 72        	strb	r3, [r6, #9]
     2be: 2f 6c        	ldr	r7, [r5, #64]
     2c0: 6f 63        	str	r7, [r5, #52]
     2c2: 61 6c        	ldr	r1, [r4, #68]
     2c4: 2f 43        	orrs	r7, r5
     2c6: 65 6c        	ldr	r5, [r4, #68]
     2c8: 6c 61        	str	r4, [r5, #20]
     2ca: 72 2f        	cmp	r7, #114
     2cc: 67 63        	str	r7, [r4, #52]
     2ce: 63 2d        	cmp	r5, #99
     2d0: 61 72        	strb	r1, [r4, #9]
     2d2: 6d 2d        	cmp	r5, #109
     2d4: 6e 6f        	ldr	r6, [r5, #116]
     2d6: 6e 65        	str	r6, [r5, #84]
     2d8: 2d 65        	str	r5, [r5, #80]
     2da: 61 62        	str	r1, [r4, #36]
     2dc: 69 2d        	cmp	r5, #105
     2de: 34 39        	subs	r1, #52
     2e0: 2f 32        	adds	r2, #47
     2e2: 30 31        	adds	r1, #48
     2e4: 35 30        	adds	r0, #53
     2e6: 39 32        	adds	r2, #57
     2e8: 35 2f        	cmp	r7, #53
     2ea: 61 72        	strb	r1, [r4, #9]
     2ec: 6d 2d        	cmp	r5, #109
     2ee: 6e 6f        	ldr	r6, [r5, #116]
     2f0: 6e 65        	str	r6, [r5, #84]
     2f2: 2d 65        	str	r5, [r5, #80]
     2f4: 61 62        	str	r1, [r4, #36]
     2f6: 69 2f        	cmp	r7, #105
     2f8: 69 6e        	ldr	r1, [r5, #100]
     2fa: 63 6c        	ldr	r3, [r4, #68]
     2fc: 75 64        	str	r5, [r6, #68]
     2fe: 65 2f        	cmp	r7, #101
     300: 6d 61        	str	r5, [r5, #20]
     302: 63 68        	ldr	r3, [r4, #4]
     304: 69 6e        	ldr	r1, [r5, #100]
     306: 65 00        	lsls	r5, r4, #1
     308: 2f 75        	strb	r7, [r5, #20]
     30a: 73 72        	strb	r3, [r6, #9]
     30c: 2f 6c        	ldr	r7, [r5, #64]
     30e: 6f 63        	str	r7, [r5, #52]
     310: 61 6c        	ldr	r1, [r4, #68]
     312: 2f 43        	orrs	r7, r5
     314: 65 6c        	ldr	r5, [r4, #68]
     316: 6c 61        	str	r4, [r5, #20]
     318: 72 2f        	cmp	r7, #114
     31a: 67 63        	str	r7, [r4, #52]
     31c: 63 2d        	cmp	r5, #99
     31e: 61 72        	strb	r1, [r4, #9]
     320: 6d 2d        	cmp	r5, #109
     322: 6e 6f        	ldr	r6, [r5, #116]
     324: 6e 65        	str	r6, [r5, #84]
     326: 2d 65        	str	r5, [r5, #80]
     328: 61 62        	str	r1, [r4, #36]
     32a: 69 2d        	cmp	r5, #105
     32c: 34 39        	subs	r1, #52
     32e: 2f 32        	adds	r2, #47
     330: 30 31        	adds	r1, #48
     332: 35 30        	adds	r0, #53
     334: 39 32        	adds	r2, #57
     336: 35 2f        	cmp	r7, #53
     338: 61 72        	strb	r1, [r4, #9]
     33a: 6d 2d        	cmp	r5, #109
     33c: 6e 6f        	ldr	r6, [r5, #116]
     33e: 6e 65        	str	r6, [r5, #84]
     340: 2d 65        	str	r5, [r5, #80]
     342: 61 62        	str	r1, [r4, #36]
     344: 69 2f        	cmp	r7, #105
     346: 69 6e        	ldr	r1, [r5, #100]
     348: 63 6c        	ldr	r3, [r4, #68]
     34a: 75 64        	str	r5, [r6, #68]
     34c: 65 2f        	cmp	r7, #101
     34e: 73 79        	ldrb	r3, [r6, #5]
     350: 73 00        	lsls	r3, r6, #1
     352: 69 6e        	ldr	r1, [r5, #100]
     354: 63 00        	lsls	r3, r4, #1
     356: 6c 69        	ldr	r4, [r5, #20]
     358: 62 2f        	cmp	r7, #98
     35a: 69 6e        	ldr	r1, [r5, #100]
     35c: 63 00        	lsls	r3, r4, #1
     35e: 6c 69        	ldr	r4, [r5, #20]
     360: 62 2f        	cmp	r7, #98
     362: 69 6e        	ldr	r1, [r5, #100]
     364: 63 2f        	cmp	r7, #99
     366: 70 65        	str	r0, [r6, #84]
     368: 72 69        	ldr	r2, [r6, #20]
     36a: 70 68        	ldr	r0, [r6, #4]
     36c: 65 72        	strb	r5, [r4, #9]
     36e: 61 6c        	ldr	r1, [r4, #68]
     370: 73 00        	lsls	r3, r6, #1
     372: 00 41        	asrs	r0, r0
     374: 75 64        	str	r5, [r6, #68]
     376: 69 6f        	ldr	r1, [r5, #116]
     378: 2e 63        	str	r6, [r5, #48]
     37a: 00 01        	lsls	r0, r0, #4
     37c: 00 00        	movs	r0, r0
     37e: 63 6f        	ldr	r3, [r4, #116]
     380: 72 65        	str	r2, [r6, #84]
     382: 5f 63        	str	r7, [r3, #52]
     384: 6d 34        	adds	r4, #109
     386: 2e 68        	ldr	r6, [r5]
     388: 00 02        	lsls	r0, r0, #8
     38a: 00 00        	movs	r0, r0
     38c: 5f 64        	str	r7, [r3, #68]
     38e: 65 66        	str	r5, [r4, #100]
     390: 61 75        	strb	r1, [r4, #21]
     392: 6c 74        	strb	r4, [r5, #17]
     394: 5f 74        	strb	r7, [r3, #17]
     396: 79 70        	strb	r1, [r7, #1]
     398: 65 73        	strb	r5, [r4, #13]
     39a: 2e 68        	ldr	r6, [r5]
     39c: 00 03        	lsls	r0, r0, #12
     39e: 00 00        	movs	r0, r0
     3a0: 5f 73        	strb	r7, [r3, #13]
     3a2: 74 64        	str	r4, [r6, #68]
     3a4: 69 6e        	ldr	r1, [r5, #100]
     3a6: 74 2e        	cmp	r6, #116
     3a8: 68 00        	lsls	r0, r5, #1
     3aa: 04 00        	movs	r4, r0
     3ac: 00 41        	asrs	r0, r0
     3ae: 75 64        	str	r5, [r6, #68]
     3b0: 69 6f        	ldr	r1, [r5, #116]
     3b2: 2e 68        	ldr	r6, [r5]
     3b4: 00 05        	lsls	r0, r0, #20
     3b6: 00 00        	movs	r0, r0
     3b8: 73 74        	strb	r3, [r6, #17]
     3ba: 6d 33        	adds	r3, #109
     3bc: 32 66        	str	r2, [r6, #96]
     3be: 34 78        	ldrb	r4, [r6]
     3c0: 78 2e        	cmp	r6, #120
     3c2: 68 00        	lsls	r0, r5, #1
     3c4: 06 00        	movs	r6, r0
     3c6: 00 73        	strb	r0, [r0, #12]
     3c8: 74 6d        	ldr	r4, [r6, #84]
     3ca: 33 32        	adds	r2, #51
     3cc: 66 34        	adds	r4, #102
     3ce: 78 78        	ldrb	r0, [r7, #1]
     3d0: 5f 67        	str	r7, [r3, #116]
     3d2: 70 69        	ldr	r0, [r6, #20]
     3d4: 6f 2e        	cmp	r6, #111
     3d6: 68 00        	lsls	r0, r5, #1
     3d8: 07 00        	movs	r7, r0
     3da: 00 73        	strb	r0, [r0, #12]
     3dc: 74 6d        	ldr	r4, [r6, #84]
     3de: 33 32        	adds	r2, #51
     3e0: 66 34        	adds	r4, #102
     3e2: 78 78        	ldrb	r0, [r7, #1]
     3e4: 5f 72        	strb	r7, [r3, #9]
     3e6: 63 63        	str	r3, [r4, #52]
     3e8: 2e 68        	ldr	r6, [r5]
     3ea: 00 07        	lsls	r0, r0, #28
     3ec: 00 00        	movs	r0, r0
     3ee: 00 00        	movs	r0, r0
     3f0: 05 02        	lsls	r5, r0, #8
     3f2: 6c 09        	lsrs	r4, r5, #5
     3f4: 00 20        	movs	r0, #0
     3f6: 03 db        	blt	0x400 <.debug_info+0x400> @ imm = #6
     3f8: 01 01        	lsls	r1, r0, #4
     3fa: 00 02        	lsls	r0, r0, #8
     3fc: 04 01        	lsls	r4, r0, #4
     3fe: 13 77        	strb	r3, [r2, #28]
     400: 00 02        	lsls	r0, r0, #8
     402: 04 01        	lsls	r4, r0, #4
     404: 67 5b        	ldrh	r7, [r4, r5]
     406: 00 02        	lsls	r0, r0, #8
     408: 04 01        	lsls	r4, r0, #4
     40a: 3d 76        	strb	r5, [r7, #24]
     40c: 30 00        	movs	r0, r6
     40e: 02 04        	lsls	r2, r0, #16
     410: 01 2f        	cmp	r7, #1
     412: 77 00        	lsls	r7, r6, #1
     414: 02 04        	lsls	r2, r0, #16
     416: 01 3e        	subs	r6, #1
     418: 76 02        	lsls	r6, r6, #9
     41a: 09 00        	movs	r1, r1
     41c: 01 01        	lsls	r1, r0, #4
     41e: 00 05        	lsls	r0, r0, #20
     420: 02 00        	movs	r2, r0
     422: 00 00        	movs	r0, r0
     424: 00 03        	lsls	r0, r0, #12
     426: f3 01        	lsls	r3, r6, #7
     428: 01 22        	movs	r2, #1
     42a: 43 3d        	subs	r5, #67
     42c: 2f 2f        	cmp	r7, #47
     42e: 2f 4d        	ldr	r5, [pc, #188]          @ 0x4ec <.debug_info+0x4ec>
     430: 2f 4b        	ldr	r3, [pc, #188]          @ 0x4f0 <.debug_info+0x4f0>
     432: 31 2f        	cmp	r7, #49
     434: 02 0d        	lsrs	r2, r0, #20
     436: 00 01        	lsls	r0, r0, #4
     438: 01 00        	movs	r1, r0
     43a: 05 02        	lsls	r5, r0, #8
     43c: 00 00        	movs	r0, r0
     43e: 00 00        	movs	r0, r0
     440: 03 8c        	ldrh	r3, [r0, #32]
     442: 02 01        	lsls	r2, r0, #4
     444: 13 00        	movs	r3, r2
     446: 02 04        	lsls	r2, r0, #16
     448: 01 59        	ldr	r1, [r0, r4]
     44a: 5b 02        	lsls	r3, r3, #9
     44c: 08 00        	movs	r0, r1
     44e: 01 01        	lsls	r1, r0, #4
     450: 00 05        	lsls	r0, r0, #20
     452: 02 00        	movs	r2, r0
     454: 00 00        	movs	r0, r0
     456: 00 03        	lsls	r0, r0, #12
     458: 94 01        	lsls	r4, r2, #6
     45a: 01 21        	movs	r1, #1
     45c: 4b 02        	lsls	r3, r1, #9
     45e: 07 00        	movs	r7, r0
     460: 01 01        	lsls	r1, r0, #4
     462: 00 05        	lsls	r0, r0, #20
     464: 02 00        	movs	r2, r0
     466: 00 00        	movs	r0, r0
     468: 00 03        	lsls	r0, r0, #12
     46a: 9a 01        	lsls	r2, r3, #6
     46c: 01 21        	movs	r1, #1
     46e: 4b 02        	lsls	r3, r1, #9
     470: 07 00        	movs	r7, r0
     472: 01 01        	lsls	r1, r0, #4
     474: 00 05        	lsls	r0, r0, #20
     476: 02 e0        	b	0x47e <.debug_info+0x47e> @ imm = #4
     478: 09 00        	movs	r1, r1
     47a: 20 03        	lsls	r0, r4, #12
     47c: 9f 01        	lsls	r7, r3, #6
     47e: 01 21        	movs	r1, #1
     480: 67 02        	lsls	r7, r4, #9
     482: 05 00        	movs	r5, r0
     484: 01 01        	lsls	r1, r0, #4
     486: 00 05        	lsls	r0, r0, #20
     488: 02 f8 09 00  	strb.w	r0, [r2, r9]
     48c: 20 03        	lsls	r0, r4, #12
     48e: 11 01        	lsls	r1, r2, #4
     490: 78 3d        	subs	r5, #120
     492: 21 21        	movs	r1, #33
     494: 21 21        	movs	r1, #33
     496: 23 4b        	ldr	r3, [pc, #140]          @ 0x524 <.debug_info+0x524>
     498: 4b 4b        	ldr	r3, [pc, #300]          @ 0x5c8 <.debug_info+0x5c8>
     49a: 4b 5a        	ldrh	r3, [r1, r1]
     49c: 59 5b        	ldrh	r1, [r3, r5]
     49e: 4b 4b        	ldr	r3, [pc, #300]          @ 0x5cc <.debug_info+0x5cc>
     4a0: 2f 3d        	subs	r5, #47
     4a2: 2f 77        	strb	r7, [r5, #28]
     4a4: 3d 2f        	cmp	r7, #61
     4a6: 2f 2f        	cmp	r7, #47
     4a8: 2f 76        	strb	r7, [r5, #24]
     4aa: 59 5b        	ldrh	r1, [r3, r5]
     4ac: 3d 2f        	cmp	r7, #61
     4ae: 2f 2f        	cmp	r7, #47
     4b0: 2f 76        	strb	r7, [r5, #24]
     4b2: 59 59        	ldr	r1, [r3, r5]
     4b4: 5b 2f        	cmp	r7, #91
     4b6: 2f 2f        	cmp	r7, #47
     4b8: 2f 2f        	cmp	r7, #47
     4ba: 68 5b        	ldrh	r0, [r5, r5]
     4bc: 2f 00        	movs	r7, r5
     4be: 02 04        	lsls	r2, r0, #16
     4c0: 03 2f        	cmp	r7, #3
     4c2: 00 02        	lsls	r0, r0, #8
     4c4: 04 03        	lsls	r4, r0, #12
     4c6: 1f 00        	movs	r7, r3
     4c8: 02 04        	lsls	r2, r0, #16
     4ca: 01 06        	lsls	r1, r0, #24
     4cc: 3c 06        	lsls	r4, r7, #24
     4ce: 5b 3f        	subs	r7, #91
     4d0: 59 5d        	ldrb	r1, [r3, r5]
     4d2: 3d 44        	add	r5, r7
     4d4: 2f 30        	adds	r0, #47
     4d6: 3f 4b        	ldr	r3, [pc, #252]          @ 0x5d4 <.debug_info+0x5d4>
     4d8: 4c 4b        	ldr	r3, [pc, #304]          @ 0x60c <.debug_info+0x60c>
     4da: 4c 3f        	subs	r7, #76
     4dc: 4d 4b        	ldr	r3, [pc, #308]          @ 0x614 <.debug_info+0x614>
     4de: 4c 4b        	ldr	r3, [pc, #304]          @ 0x610 <.debug_info+0x610>
     4e0: 4c 4b        	ldr	r3, [pc, #304]          @ 0x614 <.debug_info+0x614>
     4e2: 4d 3f        	subs	r7, #77
     4e4: 67 5b        	ldrh	r7, [r4, r5]
     4e6: 00 02        	lsls	r0, r0, #8
     4e8: 04 01        	lsls	r4, r0, #4
     4ea: 4b 5c        	ldrb	r3, [r1, r1]
     4ec: 83 3f        	subs	r7, #131
     4ee: 02 12        	asrs	r2, r0, #8
     4f0: 00 01        	lsls	r0, r0, #4
     4f2: 01 00        	movs	r1, r0
     4f4: 05 02        	lsls	r5, r0, #8
     4f6: 00 00        	movs	r0, r0
     4f8: 00 00        	movs	r0, r0
     4fa: 03 a4        	adr	r4, #12 <.debug_info+0x501>
     4fc: 01 01        	lsls	r1, r0, #4
     4fe: 00 02        	lsls	r0, r0, #8
     500: 04 01        	lsls	r4, r0, #4
     502: 13 76        	strb	r3, [r2, #24]
     504: 02 07        	lsls	r2, r0, #28
     506: 00 01        	lsls	r0, r0, #4
     508: 01 00        	movs	r1, r0
     50a: 05 02        	lsls	r5, r0, #8
     50c: 00 00        	movs	r0, r0
     50e: 00 00        	movs	r0, r0
     510: 03 aa        	add	r2, sp, #12
     512: 01 01        	lsls	r1, r0, #4
     514: 13 02        	lsls	r3, r2, #8
     516: 06 00        	movs	r6, r0
     518: 01 01        	lsls	r1, r0, #4
     51a: 00 05        	lsls	r0, r0, #20
     51c: 02 00        	movs	r2, r0
     51e: 00 00        	movs	r0, r0
     520: 00 03        	lsls	r0, r0, #12
     522: ae 01        	lsls	r6, r5, #6
     524: 01 3d        	subs	r5, #1
     526: 04 02        	lsls	r4, r0, #8
     528: 03 82        	strh	r3, [r0, #16]
     52a: 07 2e        	cmp	r6, #7
     52c: 03 d7        	bvc	0x536 <.debug_info+0x536> @ imm = #6
     52e: 00 4a        	ldr	r2, [pc, #0]            @ 0x530 <.debug_info+0x530>
     530: 04 01        	lsls	r4, r0, #4
     532: 03 ac        	add	r4, sp, #12
     534: 78 3c        	subs	r4, #120
     536: 68 2f        	cmp	r7, #104
     538: 21 30        	adds	r0, #33
     53a: 21 02        	lsls	r1, r4, #8
     53c: 0a 00        	movs	r2, r1
     53e: 01 01        	lsls	r1, r0, #4
     540: 00 05        	lsls	r0, r0, #20
     542: 02 00        	movs	r2, r0
     544: 00 00        	movs	r0, r0
     546: 00 03        	lsls	r0, r0, #12
     548: be 01        	lsls	r6, r7, #6
     54a: 01 21        	movs	r1, #1
     54c: 2f 04        	lsls	r7, r5, #16
     54e: 02 03        	lsls	r2, r0, #12
     550: fe 06        	lsls	r6, r7, #27
     552: 74 04        	lsls	r4, r6, #17
     554: 01 03        	lsls	r1, r0, #12
     556: 84 79        	ldrb	r4, [r0, #6]
     558: 58 02        	lsls	r0, r3, #9
     55a: 0b 00        	movs	r3, r1
     55c: 01 01        	lsls	r1, r0, #4
     55e: 00 05        	lsls	r0, r0, #20
     560: 02 00        	movs	r2, r0
     562: 00 00        	movs	r0, r0
     564: 00 03        	lsls	r0, r0, #12
     566: ca 01        	lsls	r2, r1, #7
     568: 01 21        	movs	r1, #1
     56a: 04 02        	lsls	r4, r0, #8
     56c: 03 f3 06 3c  	ssat	r12, #7, r3, lsl #12
     570: 04 01        	lsls	r4, r0, #4
     572: 03 92        	str	r2, [sp, #12]
     574: 79 58        	ldr	r1, [r7, r1]
     576: 2f 22        	movs	r2, #47
     578: 4b 04        	lsls	r3, r1, #17
     57a: 02 03        	lsls	r2, r0, #12
     57c: dd 06        	lsls	r5, r3, #27
     57e: 2e 04        	lsls	r6, r5, #16
     580: 01 03        	lsls	r1, r0, #12
     582: a7 79        	ldrb	r7, [r4, #6]
     584: 4a 03        	lsls	r2, r1, #13
     586: 74 2e        	cmp	r6, #116
     588: 03 0d        	lsrs	r3, r0, #20
     58a: 20 02        	lsls	r0, r4, #8
     58c: 05 00        	movs	r5, r0
     58e: 01 01        	lsls	r1, r0, #4
     590: 00 05        	lsls	r0, r0, #20
     592: 02 00        	movs	r2, r0
     594: 00 00        	movs	r0, r0
     596: 00 03        	lsls	r0, r0, #12
     598: c5 01        	lsls	r5, r0, #7
     59a: 01 3d        	subs	r5, #1
     59c: 21 1f        	subs	r1, r4, #4
     59e: 68 02        	lsls	r0, r5, #9
     5a0: 01 00        	movs	r1, r0
     5a2: 01 01        	lsls	r1, r0, #4
     5a4: 00 05        	lsls	r0, r0, #20
     5a6: 02 00        	movs	r2, r0
     5a8: 00 00        	movs	r0, r0
     5aa: 00 03        	lsls	r0, r0, #12
     5ac: 94 02        	lsls	r4, r2, #10
     5ae: 01 21        	movs	r1, #1
     5b0: 5a 3d        	subs	r5, #90
     5b2: 3e 02        	lsls	r6, r7, #8
     5b4: 08 00        	movs	r0, r1
     5b6: 01 01        	lsls	r1, r0, #4
     5b8: 48 00        	lsls	r0, r1, #1
     5ba: 00 00        	movs	r0, r0
     5bc: 02 00        	movs	r2, r0
     5be: 32 00        	movs	r2, r6
     5c0: 00 00        	movs	r0, r0
     5c2: 02 01        	lsls	r2, r0, #4
     5c4: fb 0e        	lsrs	r3, r7, #27
     5c6: 0d 00        	movs	r5, r1
     5c8: 01 01        	lsls	r1, r0, #4
     5ca: 01 01        	lsls	r1, r0, #4
     5cc: 00 00        	movs	r0, r0
     5ce: 00 01        	lsls	r0, r0, #4
     5d0: 00 00        	movs	r0, r0
     5d2: 01 4f        	ldr	r7, [pc, #4]            @ 0x5d8 <.debug_info+0x5d8>
     5d4: 66 66        	str	r6, [r4, #100]
     5d6: 6c 6f        	ldr	r4, [r5, #116]
     5d8: 61 64        	str	r1, [r4, #68]
     5da: 69 6e        	ldr	r1, [r5, #100]
     5dc: 67 00        	lsls	r7, r4, #1
     5de: 00 69        	ldr	r0, [r0, #16]
     5e0: 6e 69        	ldr	r6, [r5, #20]
     5e2: 74 42        	rsbs	r4, r6, #0
     5e4: 69 6e        	ldr	r1, [r5, #100]
     5e6: 53 74        	strb	r3, [r2, #17]
     5e8: 61 72        	strb	r1, [r4, #9]
     5ea: 74 55        	strb	r4, [r6, r5]
     5ec: 70 2e        	cmp	r6, #112
     5ee: 73 00        	lsls	r3, r6, #1
     5f0: 01 00        	movs	r1, r0
     5f2: 00 00        	movs	r0, r0
     5f4: 00 05        	lsls	r0, r0, #20
     5f6: 02 38        	subs	r0, #2
     5f8: 0c 00        	movs	r4, r1
     5fa: 20 03        	lsls	r0, r4, #12
     5fc: 13 01        	lsls	r3, r2, #4
     5fe: 2f 02        	lsls	r7, r5, #8
     600: 01 00        	movs	r1, r0
     602: 01 01        	lsls	r1, r0, #4
     604: 37 02        	lsls	r7, r6, #8
     606: 00 00        	movs	r0, r0
     608: 02 00        	movs	r2, r0
     60a: e7 00        	lsls	r7, r4, #3
     60c: 00 00        	movs	r0, r0
     60e: 02 01        	lsls	r2, r0, #4
     610: fb 0e        	lsrs	r3, r7, #27
     612: 0d 00        	movs	r5, r1
     614: 01 01        	lsls	r1, r0, #4
     616: 01 01        	lsls	r1, r0, #4
     618: 00 00        	movs	r0, r0
     61a: 00 01        	lsls	r0, r0, #4
     61c: 00 00        	movs	r0, r0
     61e: 01 73        	strb	r1, [r0, #12]
     620: 72 63        	str	r2, [r6, #52]
     622: 2f 70        	strb	r7, [r5]
     624: 65 72        	strb	r5, [r4, #9]
     626: 69 70        	strb	r1, [r5, #1]
     628: 68 65        	str	r0, [r5, #84]
     62a: 72 61        	str	r2, [r6, #20]
     62c: 6c 73        	strb	r4, [r5, #13]
     62e: 00 2f        	cmp	r7, #0
     630: 75 73        	strb	r5, [r6, #13]
     632: 72 2f        	cmp	r7, #114
     634: 6c 6f        	ldr	r4, [r5, #116]
     636: 63 61        	str	r3, [r4, #20]
     638: 6c 2f        	cmp	r7, #108
     63a: 43 65        	str	r3, [r0, #84]
     63c: 6c 6c        	ldr	r4, [r5, #68]
     63e: 61 72        	strb	r1, [r4, #9]
     640: 2f 67        	str	r7, [r5, #112]
     642: 63 63        	str	r3, [r4, #52]
     644: 2d 61        	str	r5, [r5, #16]
     646: 72 6d        	ldr	r2, [r6, #84]
     648: 2d 6e        	ldr	r5, [r5, #96]
     64a: 6f 6e        	ldr	r7, [r5, #100]
     64c: 65 2d        	cmp	r5, #101
     64e: 65 61        	str	r5, [r4, #20]
     650: 62 69        	ldr	r2, [r4, #20]
     652: 2d 34        	adds	r4, #45
     654: 39 2f        	cmp	r7, #57
     656: 32 30        	adds	r0, #50
     658: 31 35        	adds	r5, #49
     65a: 30 39        	subs	r1, #48
     65c: 32 35        	adds	r5, #50
     65e: 2f 6c        	ldr	r7, [r5, #64]
     660: 69 62        	str	r1, [r5, #36]
     662: 2f 67        	str	r7, [r5, #112]
     664: 63 63        	str	r3, [r4, #52]
     666: 2f 61        	str	r7, [r5, #16]
     668: 72 6d        	ldr	r2, [r6, #84]
     66a: 2d 6e        	ldr	r5, [r5, #96]
     66c: 6f 6e        	ldr	r7, [r5, #100]
     66e: 65 2d        	cmp	r5, #101
     670: 65 61        	str	r5, [r4, #20]
     672: 62 69        	ldr	r2, [r4, #20]
     674: 2f 34        	adds	r4, #47
     676: 2e 39        	subs	r1, #46
     678: 2e 33        	adds	r3, #46
     67a: 2f 69        	ldr	r7, [r5, #16]
     67c: 6e 63        	str	r6, [r5, #52]
     67e: 6c 75        	strb	r4, [r5, #21]
     680: 64 65        	str	r4, [r4, #84]
     682: 00 69        	ldr	r0, [r0, #16]
     684: 6e 63        	str	r6, [r5, #52]
     686: 00 69        	ldr	r0, [r0, #16]
     688: 6e 63        	str	r6, [r5, #52]
     68a: 2f 70        	strb	r7, [r5]
     68c: 65 72        	strb	r5, [r4, #9]
     68e: 69 70        	strb	r1, [r5, #1]
     690: 68 65        	str	r0, [r5, #84]
     692: 72 61        	str	r2, [r6, #20]
     694: 6c 73        	strb	r4, [r5, #13]
     696: 00 69        	ldr	r0, [r0, #16]
     698: 6e 63        	str	r6, [r5, #52]
     69a: 2f 63        	str	r7, [r5, #48]
     69c: 6f 72        	strb	r7, [r5, #9]
     69e: 65 00        	lsls	r5, r4, #1
     6a0: 00 73        	strb	r0, [r0, #12]
     6a2: 74 6d        	ldr	r4, [r6, #84]
     6a4: 33 32        	adds	r2, #51
     6a6: 66 34        	adds	r4, #102
     6a8: 78 78        	ldrb	r0, [r7, #1]
     6aa: 5f 72        	strb	r7, [r3, #9]
     6ac: 63 63        	str	r3, [r4, #52]
     6ae: 2e 63        	str	r6, [r5, #48]
     6b0: 00 01        	lsls	r0, r0, #4
     6b2: 00 00        	movs	r0, r0
     6b4: 73 74        	strb	r3, [r6, #17]
     6b6: 64 69        	ldr	r4, [r4, #20]
     6b8: 6e 74        	strb	r6, [r5, #17]
     6ba: 2d 67        	str	r5, [r5, #112]
     6bc: 63 63        	str	r3, [r4, #52]
     6be: 2e 68        	ldr	r6, [r5]
     6c0: 00 02        	lsls	r0, r0, #8
     6c2: 00 00        	movs	r0, r0
     6c4: 73 74        	strb	r3, [r6, #17]
     6c6: 6d 33        	adds	r3, #109
     6c8: 32 66        	str	r2, [r6, #96]
     6ca: 34 78        	ldrb	r4, [r6]
     6cc: 78 2e        	cmp	r6, #120
     6ce: 68 00        	lsls	r0, r5, #1
     6d0: 03 00        	movs	r3, r0
     6d2: 00 73        	strb	r0, [r0, #12]
     6d4: 74 6d        	ldr	r4, [r6, #84]
     6d6: 33 32        	adds	r2, #51
     6d8: 66 34        	adds	r4, #102
     6da: 78 78        	ldrb	r0, [r7, #1]
     6dc: 5f 72        	strb	r7, [r3, #9]
     6de: 63 63        	str	r3, [r4, #52]
     6e0: 2e 68        	ldr	r6, [r5]
     6e2: 00 04        	lsls	r0, r0, #16
     6e4: 00 00        	movs	r0, r0
     6e6: 63 6f        	ldr	r3, [r4, #116]
     6e8: 72 65        	str	r2, [r6, #84]
     6ea: 5f 63        	str	r7, [r3, #52]
     6ec: 6d 34        	adds	r4, #109
     6ee: 2e 68        	ldr	r6, [r5]
     6f0: 00 05        	lsls	r0, r0, #20
     6f2: 00 00        	movs	r0, r0
     6f4: 00 00        	movs	r0, r0
     6f6: 05 02        	lsls	r5, r0, #8
     6f8: 40 0c        	lsrs	r0, r0, #17
     6fa: 00 20        	movs	r0, #0
     6fc: 03 ca        	ldm	r2!, {r0, r1}
     6fe: 01 01        	lsls	r1, r0, #4
     700: 14 5b        	ldrh	r4, [r2, r4]
     702: 31 69        	ldr	r1, [r6, #16]
     704: 31 4d        	ldr	r5, [pc, #196]          @ 0x7cc <.debug_info+0x7cc>
     706: 03 18        	adds	r3, r0, r0
     708: 74 17        	asrs	r4, r6, #29
     70a: 3f 03        	lsls	r7, r7, #12
     70c: 2f 58        	ldr	r7, [r5, r0]
     70e: 17 31        	adds	r1, #23
     710: 31 31        	adds	r1, #49
     712: 03 16        	asrs	r3, r0, #24
     714: 4a 16        	asrs	r2, r1, #25
     716: 03 15        	asrs	r3, r0, #20
     718: 66 18        	adds	r6, r4, r1
     71a: 3f 23        	movs	r3, #63
     71c: 5c 3d        	subs	r5, #92
     71e: 23 03        	lsls	r3, r4, #12
     720: 14 74        	strb	r4, [r2, #16]
     722: 16 03        	lsls	r6, r2, #12
     724: 27 66        	str	r7, [r4, #96]
     726: 1a 03        	lsls	r2, r3, #12
     728: 0f f2 15 03  	adr.w	r3, #21
     72c: 17 66        	str	r7, [r2, #96]
     72e: 17 03        	lsls	r7, r2, #12
     730: 0a 9e        	ldr	r6, [sp, #40]
     732: 15 03        	lsls	r5, r2, #12
     734: 0f 66        	str	r7, [r1, #96]
     736: 15 03        	lsls	r5, r2, #12
     738: 16 66        	str	r6, [r2, #96]
     73a: 19 31        	adds	r1, #25
     73c: 31 31        	adds	r1, #49
     73e: 03 16        	asrs	r3, r0, #24
     740: 4a 19        	adds	r2, r1, r5
     742: 31 31        	adds	r1, #49
     744: 31 03        	lsls	r1, r6, #12
     746: da 00        	lsls	r2, r3, #3
     748: 4a 18        	adds	r2, r1, r1
     74a: 31 31        	adds	r1, #49
     74c: 23 03        	lsls	r3, r4, #12
     74e: 0d 58        	ldr	r5, [r1, r0]
     750: 13 2f        	cmp	r7, #19
     752: 03 17        	asrs	r3, r0, #28
     754: 66 18        	adds	r6, r4, r1
     756: 31 31        	adds	r1, #49
     758: 23 03        	lsls	r3, r4, #12
     75a: 11 58        	ldr	r1, [r2, r0]
     75c: 18 31        	adds	r1, #24
     75e: 31 23        	movs	r3, #49
     760: 03 10        	asrs	r3, r0, #32
     762: 58 18        	adds	r0, r3, r1
     764: 31 31        	adds	r1, #49
     766: 31 03        	lsls	r1, r6, #12
     768: 25 4a        	ldr	r2, [pc, #148]          @ 0x800 <.debug_info+0x800>
     76a: 24 4c        	ldr	r4, [pc, #144]          @ 0x7fc <.debug_info+0x7fc>
     76c: 5b 2f        	cmp	r7, #91
     76e: 22 2f        	cmp	r7, #34
     770: 26 2f        	cmp	r7, #38
     772: 3e 3f        	subs	r7, #62
     774: a3 93        	str	r3, [sp, #652]
     776: 67 3d        	subs	r5, #103
     778: 22 34        	adds	r4, #34
     77a: 2f 2f        	cmp	r7, #47
     77c: 3e 3f        	subs	r7, #62
     77e: 21 2f        	cmp	r7, #33
     780: 30 3f        	subs	r7, #48
     782: 21 2f        	cmp	r7, #33
     784: 30 2f        	cmp	r7, #48
     786: 03 3f        	subs	r7, #3
     788: ba 18        	adds	r2, r7, r2
     78a: 5a 31        	adds	r1, #90
     78c: 31 5b        	ldrh	r1, [r6, r4]
     78e: 24 03        	lsls	r4, r4, #12
     790: 0b 90        	str	r0, [sp, #44]
     792: 16 03        	lsls	r6, r2, #12
     794: 0d 66        	str	r5, [r1, #96]
     796: 15 03        	lsls	r5, r2, #12
     798: 0e 66        	str	r6, [r1, #96]
     79a: 16 03        	lsls	r6, r2, #12
     79c: 23 66        	str	r3, [r4, #96]
     79e: 17 22        	movs	r2, #23
     7a0: 5c 03        	lsls	r4, r3, #13
     7a2: 15 82        	strh	r5, [r2, #16]
     7a4: 17 22        	movs	r2, #23
     7a6: 5c 03        	lsls	r4, r3, #13
     7a8: 10 82        	strh	r0, [r2, #16]
     7aa: 17 22        	movs	r2, #23
     7ac: 5c 03        	lsls	r4, r3, #13
     7ae: 27 82        	strh	r7, [r4, #16]
     7b0: 17 22        	movs	r2, #23
     7b2: 5c 03        	lsls	r4, r3, #13
     7b4: 1d 82        	strh	r5, [r3, #16]
     7b6: 17 22        	movs	r2, #23
     7b8: 5c 03        	lsls	r4, r3, #13
     7ba: 1c 82        	strh	r4, [r3, #16]
     7bc: 17 22        	movs	r2, #23
     7be: 5c 03        	lsls	r4, r3, #13
     7c0: 12 82        	strh	r2, [r2, #16]
     7c2: 17 22        	movs	r2, #23
     7c4: 5c 03        	lsls	r4, r3, #13
     7c6: 0d 82        	strh	r5, [r1, #16]
     7c8: 17 22        	movs	r2, #23
     7ca: 5c 03        	lsls	r4, r3, #13
     7cc: 24 82        	strh	r4, [r4, #16]
     7ce: 16 22        	movs	r2, #22
     7d0: 5c 03        	lsls	r4, r3, #13
     7d2: 1a 82        	strh	r2, [r3, #16]
     7d4: 16 22        	movs	r2, #22
     7d6: 5c 03        	lsls	r4, r3, #13
     7d8: 24 82        	strh	r4, [r4, #16]
     7da: 16 22        	movs	r2, #22
     7dc: 5c 03        	lsls	r4, r3, #13
     7de: 16 82        	strh	r6, [r2, #16]
     7e0: 16 22        	movs	r2, #22
     7e2: 5c 03        	lsls	r4, r3, #13
     7e4: 11 82        	strh	r1, [r2, #16]
     7e6: 16 22        	movs	r2, #22
     7e8: 5c 03        	lsls	r4, r3, #13
     7ea: 28 82        	strh	r0, [r5, #16]
     7ec: 16 22        	movs	r2, #22
     7ee: 5c 03        	lsls	r4, r3, #13
     7f0: 1e 82        	strh	r6, [r3, #16]
     7f2: 16 22        	movs	r2, #22
     7f4: 5c 03        	lsls	r4, r3, #13
     7f6: 23 82        	strh	r3, [r4, #16]
     7f8: 16 23        	movs	r3, #22
     7fa: 5d 03        	lsls	r5, r3, #13
     7fc: 18 82        	strh	r0, [r3, #16]
     7fe: 03 09        	lsrs	r3, r0, #4
     800: 01 21        	movs	r1, #1
     802: 30 3e        	subs	r6, #48
     804: 30 40        	ands	r0, r6
     806: 32 2f        	cmp	r7, #50
     808: 4c 32        	adds	r2, #76
     80a: 24 03        	lsls	r4, r4, #12
     80c: cd 74        	strb	r5, [r1, #19]
     80e: 4a 2f        	cmp	r7, #74
     810: 00 02        	lsls	r0, r0, #8
     812: 04 02        	lsls	r4, r0, #8
     814: 34 00        	movs	r4, r6
     816: 02 04        	lsls	r2, r0, #16
     818: 02 3d        	subs	r5, #2
     81a: 00 02        	lsls	r0, r0, #8
     81c: 04 02        	lsls	r4, r0, #8
     81e: 3d 00        	movs	r5, r7
     820: 02 04        	lsls	r2, r0, #16
     822: 01 06        	lsls	r1, r0, #24
     824: 4a 06        	lsls	r2, r1, #25
     826: 30 4c        	ldr	r4, [pc, #192]          @ 0x8e8 <.debug_info+0x8e8>
     828: 32 23        	movs	r3, #50
     82a: 03 a9        	add	r1, sp, #12
     82c: 0b 3c        	subs	r4, #11
     82e: 14 03        	lsls	r4, r2, #12
     830: 11 82        	strh	r1, [r2, #16]
     832: 19 4c        	ldr	r4, [pc, #100]          @ 0x898 <.debug_info+0x898>
     834: 32 24        	movs	r4, #50
     836: 03 10        	asrs	r3, r0, #32
     838: 3c 18        	adds	r4, r7, r0
     83a: 02 06        	lsls	r2, r0, #24
     83c: 00 01        	lsls	r0, r0, #4
     83e: 01 97        	str	r7, [sp, #4]
     840: 01 00        	movs	r1, r0
     842: 00 02        	lsls	r0, r0, #8
     844: 00           	<unknown>
     845: fc 00        	lsls	r4, r7, #3
     847: 00 00        	movs	r0, r0
     849: 02 01        	lsls	r2, r0, #4
     84b: fb 0e        	lsrs	r3, r7, #27
     84d: 0d 00        	movs	r5, r1
     84f: 01 01        	lsls	r1, r0, #4
     851: 01 01        	lsls	r1, r0, #4
     853: 00 00        	movs	r0, r0
     855: 00 01        	lsls	r0, r0, #4
     857: 00 00        	movs	r0, r0
     859: 01 73        	strb	r1, [r0, #12]
     85b: 72 63        	str	r2, [r6, #52]
     85d: 2f 70        	strb	r7, [r5]
     85f: 65 72        	strb	r5, [r4, #9]
     861: 69 70        	strb	r1, [r5, #1]
     863: 68 65        	str	r0, [r5, #84]
     865: 72 61        	str	r2, [r6, #20]
     867: 6c 73        	strb	r4, [r5, #13]
     869: 00 2f        	cmp	r7, #0
     86b: 75 73        	strb	r5, [r6, #13]
     86d: 72 2f        	cmp	r7, #114
     86f: 6c 6f        	ldr	r4, [r5, #116]
     871: 63 61        	str	r3, [r4, #20]
     873: 6c 2f        	cmp	r7, #108
     875: 43 65        	str	r3, [r0, #84]
     877: 6c 6c        	ldr	r4, [r5, #68]
     879: 61 72        	strb	r1, [r4, #9]
     87b: 2f 67        	str	r7, [r5, #112]
     87d: 63 63        	str	r3, [r4, #52]
     87f: 2d 61        	str	r5, [r5, #16]
     881: 72 6d        	ldr	r2, [r6, #84]
     883: 2d 6e        	ldr	r5, [r5, #96]
     885: 6f 6e        	ldr	r7, [r5, #100]
     887: 65 2d        	cmp	r5, #101
     889: 65 61        	str	r5, [r4, #20]
     88b: 62 69        	ldr	r2, [r4, #20]
     88d: 2d 34        	adds	r4, #45
     88f: 39 2f        	cmp	r7, #57
     891: 32 30        	adds	r0, #50
     893: 31 35        	adds	r5, #49
     895: 30 39        	subs	r1, #48
     897: 32 35        	adds	r5, #50
     899: 2f 6c        	ldr	r7, [r5, #64]
     89b: 69 62        	str	r1, [r5, #36]
     89d: 2f 67        	str	r7, [r5, #112]
     89f: 63 63        	str	r3, [r4, #52]
     8a1: 2f 61        	str	r7, [r5, #16]
     8a3: 72 6d        	ldr	r2, [r6, #84]
     8a5: 2d 6e        	ldr	r5, [r5, #96]
     8a7: 6f 6e        	ldr	r7, [r5, #100]
     8a9: 65 2d        	cmp	r5, #101
     8ab: 65 61        	str	r5, [r4, #20]
     8ad: 62 69        	ldr	r2, [r4, #20]
     8af: 2f 34        	adds	r4, #47
     8b1: 2e 39        	subs	r1, #46
     8b3: 2e 33        	adds	r3, #46
     8b5: 2f 69        	ldr	r7, [r5, #16]
     8b7: 6e 63        	str	r6, [r5, #52]
     8b9: 6c 75        	strb	r4, [r5, #21]
     8bb: 64 65        	str	r4, [r4, #84]
     8bd: 00 69        	ldr	r0, [r0, #16]
     8bf: 6e 63        	str	r6, [r5, #52]
     8c1: 00 69        	ldr	r0, [r0, #16]
     8c3: 6e 63        	str	r6, [r5, #52]
     8c5: 2f 70        	strb	r7, [r5]
     8c7: 65 72        	strb	r5, [r4, #9]
     8c9: 69 70        	strb	r1, [r5, #1]
     8cb: 68 65        	str	r0, [r5, #84]
     8cd: 72 61        	str	r2, [r6, #20]
     8cf: 6c 73        	strb	r4, [r5, #13]
     8d1: 00 69        	ldr	r0, [r0, #16]
     8d3: 6e 63        	str	r6, [r5, #52]
     8d5: 2f 63        	str	r7, [r5, #48]
     8d7: 6f 72        	strb	r7, [r5, #9]
     8d9: 65 00        	lsls	r5, r4, #1
     8db: 00 73        	strb	r0, [r0, #12]
     8dd: 74 6d        	ldr	r4, [r6, #84]
     8df: 33 32        	adds	r2, #51
     8e1: 66 34        	adds	r4, #102
     8e3: 78 78        	ldrb	r0, [r7, #1]
     8e5: 5f 67        	str	r7, [r3, #116]
     8e7: 70 69        	ldr	r0, [r6, #20]
     8e9: 6f 2e        	cmp	r6, #111
     8eb: 63 00        	lsls	r3, r4, #1
     8ed: 01 00        	movs	r1, r0
     8ef: 00 73        	strb	r0, [r0, #12]
     8f1: 74 64        	str	r4, [r6, #68]
     8f3: 69 6e        	ldr	r1, [r5, #100]
     8f5: 74 2d        	cmp	r5, #116
     8f7: 67 63        	str	r7, [r4, #52]
     8f9: 63 2e        	cmp	r6, #99
     8fb: 68 00        	lsls	r0, r5, #1
     8fd: 02 00        	movs	r2, r0
     8ff: 00 73        	strb	r0, [r0, #12]
     901: 74 6d        	ldr	r4, [r6, #84]
     903: 33 32        	adds	r2, #51
     905: 66 34        	adds	r4, #102
     907: 78 78        	ldrb	r0, [r7, #1]
     909: 2e 68        	ldr	r6, [r5]
     90b: 00 03        	lsls	r0, r0, #12
     90d: 00 00        	movs	r0, r0
     90f: 73 74        	strb	r3, [r6, #17]
     911: 6d 33        	adds	r3, #109
     913: 32 66        	str	r2, [r6, #96]
     915: 34 78        	ldrb	r4, [r6]
     917: 78 5f        	ldrsh	r0, [r7, r5]
     919: 67 70        	strb	r7, [r4, #1]
     91b: 69 6f        	ldr	r1, [r5, #116]
     91d: 2e 68        	ldr	r6, [r5]
     91f: 00 04        	lsls	r0, r0, #16
     921: 00 00        	movs	r0, r0
     923: 63 6f        	ldr	r3, [r4, #116]
     925: 72 65        	str	r2, [r6, #84]
     927: 5f 63        	str	r7, [r3, #52]
     929: 6d 34        	adds	r4, #109
     92b: 2e 68        	ldr	r6, [r5]
     92d: 00 05        	lsls	r0, r0, #20
     92f: 00 00        	movs	r0, r0
     931: 73 74        	strb	r3, [r6, #17]
     933: 6d 33        	adds	r3, #109
     935: 32 66        	str	r2, [r6, #96]
     937: 34 78        	ldrb	r4, [r6]
     939: 78 5f        	ldrsh	r0, [r7, r5]
     93b: 72 63        	str	r2, [r6, #52]
     93d: 63 2e        	cmp	r6, #99
     93f: 68 00        	lsls	r0, r5, #1
     941: 04 00        	movs	r4, r0
     943: 00 00        	movs	r0, r0
     945: 00 05        	lsls	r0, r0, #20
     947: 02 1c        	adds	r2, r0, #0
     949: 11 00        	movs	r1, r2
     94b: 20 03        	lsls	r0, r4, #12
     94d: fe 00        	lsls	r6, r7, #3
     94f: 01 24        	movs	r4, #1
     951: 3e 4b        	ldr	r3, [pc, #248]          @ 0xa4c <.debug_info+0xa4c>
     953: 5a 3e        	subs	r6, #90
     955: 4b 5a        	ldrh	r3, [r1, r1]
     957: 3e 4b        	ldr	r3, [pc, #248]          @ 0xa50 <.debug_info+0xa50>
     959: 5a 3e        	subs	r6, #90
     95b: 4b 5a        	ldrh	r3, [r1, r1]
     95d: 3e 4b        	ldr	r3, [pc, #248]          @ 0xa58 <.debug_info+0xa58>
     95f: 5a 3e        	subs	r6, #90
     961: 4b 5a        	ldrh	r3, [r1, r1]
     963: 3e 4b        	ldr	r3, [pc, #248]          @ 0xa5c <.debug_info+0xa5c>
     965: 5a 3e        	subs	r6, #90
     967: 4b 5c        	ldrb	r3, [r1, r1]
     969: 3e 59        	ldr	r6, [r7, r4]
     96b: 03 0d        	lsrs	r3, r0, #20
     96d: 08 82        	strh	r0, [r1, #16]
     96f: 03 0b        	lsrs	r3, r0, #12
     971: 20 30        	adds	r0, #32
     973: 30 30        	adds	r0, #48
     975: 30 75        	strb	r0, [r6, #20]
     977: 5a 5e        	ldrsh	r2, [r3, r1]
     979: 3d 5e        	ldrsh	r5, [r7, r0]
     97b: 75 6a        	ldr	r5, [r6, #36]
     97d: 83 00        	lsls	r3, r0, #2
     97f: 02 04        	lsls	r2, r0, #16
     981: 02 03        	lsls	r2, r0, #12
     983: 62 58        	ldr	r2, [r4, r1]
     985: 00 02        	lsls	r0, r0, #8
     987: 04 01        	lsls	r4, r0, #4
     989: 06 20        	movs	r0, #6
     98b: 06 03        	lsls	r6, r0, #12
     98d: 21 2e        	cmp	r6, #33
     98f: 44 14        	asrs	r4, r0, #17
     991: 3d 2f        	cmp	r7, #61
     993: 21 21        	movs	r1, #33
     995: 03 0f        	lsrs	r3, r0, #28
     997: 3c 21        	movs	r1, #60
     999: 42 3e        	subs	r6, #66
     99b: 30 22        	movs	r2, #48
     99d: 30 30        	adds	r0, #48
     99f: 2f 03        	lsls	r7, r5, #12
     9a1: 1a 2e        	cmp	r6, #26
     9a3: 19 3e        	subs	r6, #25
     9a5: 32 23        	movs	r3, #50
     9a7: 36 16        	asrs	r6, r6, #24
     9a9: 21 03        	lsls	r1, r4, #12
     9ab: 0a 3c        	subs	r4, #10
     9ad: 19 3e        	subs	r6, #25
     9af: 32 23        	movs	r3, #50
     9b1: 36 16        	asrs	r6, r6, #24
     9b3: 21 03        	lsls	r1, r4, #12
     9b5: 0d 3c        	subs	r4, #13
     9b7: 17 03        	lsls	r7, r2, #12
     9b9: 0e 2e        	cmp	r6, #14
     9bb: 17 03        	lsls	r7, r2, #12
     9bd: 0f 2e        	cmp	r6, #15
     9bf: 18 22        	movs	r2, #24
     9c1: 32 03        	lsls	r2, r6, #12
     9c3: 0b 3c        	subs	r4, #11
     9c5: 16 03        	lsls	r6, r2, #12
     9c7: 0a 2e        	cmp	r6, #10
     9c9: 16 03        	lsls	r6, r2, #12
     9cb: c5 00        	lsls	r5, r0, #3
     9cd: 4a 03        	lsls	r2, r1, #13
     9cf: 09 20        	movs	r0, #9
     9d1: 4b ad        	add	r5, sp, #300
     9d3: 3d 2f        	cmp	r7, #61
     9d5: 02 02        	lsls	r2, r0, #8
     9d7: 00 01        	lsls	r0, r0, #4
     9d9: 01           	<unknown>

Disassembly of section .debug_str:

00000000 <.debug_str>:
       0: 52 53        	strh	r2, [r2, r5]
       2: 45 52        	strh	r5, [r0, r1]
       4: 56 45        	cmp	r6, r10
       6: 44 31        	adds	r1, #68
       8: 00 52        	strh	r0, [r0, r0]
       a: 54 43        	muls	r4, r2, r4
       c: 5f 57        	ldrsb	r7, [r3, r5]
       e: 4b 55        	strb	r3, [r1, r5]
      10: 50 5f        	ldrsh	r0, [r2, r5]
      12: 49 52        	strh	r1, [r1, r1]
      14: 51 6e        	ldr	r1, [r2, #100]
      16: 00 45        	cmp	r0, r0
      18: 58 54        	strb	r0, [r3, r1]
      1a: 49 32        	adds	r2, #73
      1c: 5f 49        	ldr	r1, [pc, #380]          @ 0x19c <.debug_info+0x19c>
      1e: 52 51        	str	r2, [r2, r5]
      20: 6e 00        	lsls	r6, r5, #1
      22: 44 4d        	ldr	r5, [pc, #272]          @ 0x134 <.debug_info+0x134>
      24: 41 31        	adds	r1, #65
      26: 5f 53        	strh	r7, [r3, r5]
      28: 74 72        	strb	r4, [r6, #9]
      2a: 65 61        	str	r5, [r4, #20]
      2c: 6d 36        	adds	r6, #109
      2e: 5f 49        	ldr	r1, [pc, #380]          @ 0x1ac <.debug_info+0x1ac>
      30: 52 51        	str	r2, [r2, r5]
      32: 6e 00        	lsls	r6, r5, #1
      34: 54 49        	ldr	r1, [pc, #336]          @ 0x188 <.debug_info+0x188>
      36: 4d 38        	subs	r0, #77
      38: 5f 55        	strb	r7, [r3, r5]
      3a: 50 5f        	ldrsh	r0, [r2, r5]
      3c: 54 49        	ldr	r1, [pc, #336]          @ 0x190 <.debug_info+0x190>
      3e: 4d 31        	adds	r1, #77
      40: 33 5f        	ldrsh	r3, [r6, r4]
      42: 49 52        	strh	r1, [r1, r1]
      44: 51 6e        	ldr	r1, [r2, #100]
      46: 00 73        	strb	r0, [r0, #12]
      48: 69 7a        	ldrb	r1, [r5, #9]
      4a: 65 74        	strb	r5, [r4, #17]
      4c: 79 70        	strb	r1, [r7, #1]
      4e: 65 00        	lsls	r5, r4, #1
      50: 47 54        	strb	r7, [r0, r1]
      52: 50 52        	strh	r0, [r2, r1]
      54: 00 45        	cmp	r0, r0
      56: 52 52        	strh	r2, [r2, r1]
      58: 5f 4d        	ldr	r5, [pc, #380]          @ 0x1d8 <.debug_info+0x1d8>
      5a: 50 33        	adds	r3, #80
      5c: 5f 46        	mov	r7, r11
      5e: 52 45        	cmp	r2, r10
      60: 45 5f        	ldrsh	r5, [r0, r5]
      62: 42 49        	ldr	r1, [pc, #264]          @ 0x16c <.debug_info+0x16c>
      64: 54 52        	strh	r4, [r2, r1]
      66: 41 54        	strb	r1, [r0, r1]
      68: 45 5f        	ldrsh	r5, [r0, r5]
      6a: 53 59        	ldr	r3, [r2, r5]
      6c: 4e 43        	muls	r6, r1, r6
      6e: 00 62        	str	r0, [r0, #32]
      70: 69 74        	strb	r1, [r5, #17]
      72: 73 50        	str	r3, [r6, r1]
      74: 65 72        	strb	r5, [r4, #9]
      76: 53 61        	str	r3, [r2, #20]
      78: 6d 70        	strb	r5, [r5, #1]
      7a: 6c 65        	str	r4, [r5, #84]
      7c: 00 45        	cmp	r0, r0
      7e: 52 52        	strh	r2, [r2, r1]
      80: 5f 4d        	ldr	r5, [pc, #380]          @ 0x200 <.debug_info+0x200>
      82: 50 33        	adds	r3, #80
      84: 5f 49        	ldr	r1, [pc, #380]          @ 0x204 <.debug_info+0x204>
      86: 4e 56        	ldrsb	r6, [r1, r1]
      88: 41 4c        	ldr	r4, [pc, #260]          @ 0x190 <.debug_info+0x190>
      8a: 49 44        	add	r1, r9
      8c: 5f 53        	strh	r7, [r3, r5]
      8e: 43 41        	adcs	r3, r0
      90: 4c 45        	cmp	r4, r9
      92: 46 41        	adcs	r6, r0
      94: 43 54        	strb	r3, [r0, r1]
      96: 00 44        	add	r0, r0
      98: 4d 41        	adcs	r5, r1
      9a: 32 5f        	ldrsh	r2, [r6, r4]
      9c: 53 74        	strb	r3, [r2, #17]
      9e: 72 65        	str	r2, [r6, #84]
      a0: 61 6d        	ldr	r1, [r4, #84]
      a2: 31 5f        	ldrsh	r1, [r6, r4]
      a4: 49 52        	strh	r1, [r1, r1]
      a6: 51 6e        	ldr	r1, [r2, #100]
      a8: 00 5f        	ldrsh	r0, [r0, r4]
      aa: 4d 50        	str	r5, [r1, r1]
      ac: 33 46        	mov	r3, r6
      ae: 72 61        	str	r2, [r6, #20]
      b0: 6d 65        	str	r5, [r5, #84]
      b2: 49 6e        	ldr	r1, [r1, #100]
      b4: 66 6f        	ldr	r6, [r4, #116]
      b6: 00 47        	bx	r0
      b8: 50 49        	ldr	r1, [pc, #320]          @ 0x1fc <.debug_info+0x1fc>
      ba: 4f 5f        	ldrsh	r7, [r1, r5]
      bc: 50 75        	strb	r0, [r2, #21]
      be: 50 64        	str	r0, [r2, #68]
      c0: 5f 4e        	ldr	r6, [pc, #380]          @ 0x240 <.debug_info+0x240>
      c2: 4f 50        	str	r7, [r1, r1]
      c4: 55 4c        	ldr	r4, [pc, #340]          @ 0x21c <.debug_info+0x21c>
      c6: 4c 00        	lsls	r4, r1, #1
      c8: 44 65        	str	r4, [r0, #84]
      ca: 6c 61        	str	r4, [r5, #20]
      cc: 79 00        	lsls	r1, r7, #1
      ce: 56 54        	strb	r6, [r2, r1]
      d0: 4f 52        	strh	r7, [r1, r1]
      d2: 00 53        	strh	r0, [r0, r4]
      d4: 50 49        	ldr	r1, [pc, #320]          @ 0x218 <.debug_info+0x218>
      d6: 33 5f        	ldrsh	r3, [r6, r4]
      d8: 49 52        	strh	r1, [r1, r1]
      da: 51 6e        	ldr	r1, [r2, #100]
      dc: 00 72        	strb	r0, [r0, #8]
      de: 65 61        	str	r5, [r4, #20]
      e0: 64 5f        	ldrsh	r4, [r4, r5]
      e2: 70 74        	strb	r0, [r6, #17]
      e4: 72 00        	lsls	r2, r6, #1
      e6: 46 4c        	ldr	r4, [pc, #280]          @ 0x200 <.debug_info+0x200>
      e8: 41 53        	strh	r1, [r0, r5]
      ea: 48 5f        	ldrsh	r0, [r1, r5]
      ec: 49 52        	strh	r1, [r1, r1]
      ee: 51 6e        	ldr	r1, [r2, #100]
      f0: 00 44        	add	r0, r0
      f2: 43 4d        	ldr	r5, [pc, #268]          @ 0x200 <.debug_info+0x200>
      f4: 49 5f        	ldrsh	r1, [r1, r5]
      f6: 49 52        	strh	r1, [r1, r1]
      f8: 51 6e        	ldr	r1, [r2, #100]
      fa: 00 4d        	ldr	r5, [pc, #0]            @ 0xfc <.debug_info+0xfc>
      fc: 50 33        	adds	r3, #80
      fe: 44 65        	str	r4, [r0, #84]
     100: 63 6f        	ldr	r3, [r4, #116]
     102: 64 65        	str	r4, [r4, #84]
     104: 00 4d        	ldr	r5, [pc, #0]            @ 0x108 <.debug_info+0x108>
     106: 50 33        	adds	r3, #80
     108: 49 6e        	ldr	r1, [r1, #100]
     10a: 69 74        	strb	r1, [r5, #17]
     10c: 44 65        	str	r4, [r0, #84]
     10e: 63 6f        	ldr	r3, [r4, #116]
     110: 64 65        	str	r4, [r4, #84]
     112: 72 00        	lsls	r2, r6, #1
     114: 47 50        	str	r7, [r0, r1]
     116: 49 4f        	ldr	r7, [pc, #292]          @ 0x23c <.debug_info+0x23c>
     118: 4f 54        	strb	r7, [r1, r1]
     11a: 79 70        	strb	r1, [r7, #1]
     11c: 65 5f        	ldrsh	r5, [r4, r5]
     11e: 54 79        	ldrb	r4, [r2, #5]
     120: 70 65        	str	r0, [r6, #84]
     122: 44 65        	str	r4, [r0, #84]
     124: 66 00        	lsls	r6, r4, #1
     126: 54 49        	ldr	r1, [pc, #336]          @ 0x278 <.debug_info+0x278>
     128: 4d 32        	adds	r2, #77
     12a: 5f 49        	ldr	r1, [pc, #380]          @ 0x2a8 <.debug_info+0x2a8>
     12c: 52 51        	str	r2, [r2, r5]
     12e: 6e 00        	lsls	r6, r5, #1
     130: 47 50        	str	r7, [r0, r1]
     132: 49 4f        	ldr	r7, [pc, #292]          @ 0x258 <.debug_info+0x258>
     134: 5f 53        	strh	r7, [r3, r5]
     136: 70 65        	str	r0, [r6, #84]
     138: 65 64        	str	r5, [r4, #68]
     13a: 5f 31        	adds	r1, #95
     13c: 30 30        	adds	r0, #48
     13e: 4d 48        	ldr	r0, [pc, #308]          @ 0x274 <.debug_info+0x274>
     140: 7a 00        	lsls	r2, r7, #1
     142: 49 43        	muls	r1, r1, r1
     144: 50 52        	strh	r0, [r2, r1]
     146: 00 45        	cmp	r0, r0
     148: 52 52        	strh	r2, [r2, r1]
     14a: 5f 4d        	ldr	r5, [pc, #380]          @ 0x2c8 <.debug_info+0x2c8>
     14c: 50 33        	adds	r3, #80
     14e: 5f 49        	ldr	r1, [pc, #380]          @ 0x2cc <.debug_info+0x2cc>
     150: 4e 56        	ldrsb	r6, [r1, r1]
     152: 41 4c        	ldr	r4, [pc, #260]          @ 0x258 <.debug_info+0x258>
     154: 49 44        	add	r1, r9
     156: 5f 53        	strh	r7, [r3, r5]
     158: 55 42        	rsbs	r5, r2, #0
     15a: 42 41        	adcs	r2, r0
     15c: 4e 44        	add	r6, r9
     15e: 00 4d        	ldr	r5, [pc, #0]            @ 0x160 <.debug_info+0x160>
     160: 50 33        	adds	r3, #80
     162: 46 69        	ldr	r6, [r0, #20]
     164: 6e 64        	str	r6, [r5, #68]
     166: 53 79        	ldrb	r3, [r2, #5]
     168: 6e 63        	str	r6, [r5, #52]
     16a: 57 6f        	ldr	r7, [r2, #116]
     16c: 72 64        	str	r2, [r6, #68]
     16e: 00 43        	orrs	r0, r0
     170: 41 4e        	ldr	r6, [pc, #260]          @ 0x278 <.debug_info+0x278>
     172: 32 5f        	ldrsh	r2, [r6, r4]
     174: 52 58        	ldr	r2, [r2, r1]
     176: 30 5f        	ldrsh	r0, [r6, r4]
     178: 49 52        	strh	r1, [r1, r1]
     17a: 51 6e        	ldr	r1, [r2, #100]
     17c: 00 55        	strb	r0, [r0, r4]
     17e: 53 41        	adcs	r3, r2
     180: 52 54        	strb	r2, [r2, r1]
     182: 36 5f        	ldrsh	r6, [r6, r4]
     184: 49 52        	strh	r1, [r1, r1]
     186: 51 6e        	ldr	r1, [r2, #100]
     188: 00 5f        	ldrsh	r0, [r0, r4]
     18a: 5f 75        	strb	r7, [r3, #21]
     18c: 69 6e        	ldr	r1, [r5, #100]
     18e: 74 38        	subs	r0, #116
     190: 5f 74        	strb	r7, [r3, #17]
     192: 00 4f        	ldr	r7, [pc, #0]            @ 0x194 <.debug_info+0x194>
     194: 54 47        	bx	r10
     196: 5f 48        	ldr	r0, [pc, #380]          @ 0x314 <.debug_info+0x314>
     198: 53 5f        	ldrsh	r3, [r2, r5]
     19a: 57 4b        	ldr	r3, [pc, #348]          @ 0x2f8 <.debug_info+0x2f8>
     19c: 55 50        	str	r5, [r2, r1]
     19e: 5f 49        	ldr	r1, [pc, #380]          @ 0x31c <.debug_info+0x31c>
     1a0: 52 51        	str	r2, [r2, r5]
     1a2: 6e 00        	lsls	r6, r5, #1
     1a4: 53 50        	str	r3, [r2, r1]
     1a6: 49 32        	adds	r2, #73
     1a8: 5f 49        	ldr	r1, [pc, #380]          @ 0x328 <.debug_info+0x328>
     1aa: 52 51        	str	r2, [r2, r5]
     1ac: 6e 00        	lsls	r6, r5, #1
     1ae: 54 49        	ldr	r1, [pc, #336]          @ 0x300 <.debug_info+0x300>
     1b0: 4d 38        	subs	r0, #77
     1b2: 5f 42        	rsbs	r7, r3, #0
     1b4: 52 4b        	ldr	r3, [pc, #328]          @ 0x300 <.debug_info+0x300>
     1b6: 5f 54        	strb	r7, [r3, r1]
     1b8: 49 4d        	ldr	r5, [pc, #292]          @ 0x2e0 <.debug_info+0x2e0>
     1ba: 31 32        	adds	r2, #49
     1bc: 5f 49        	ldr	r1, [pc, #380]          @ 0x33c <.debug_info+0x33c>
     1be: 52 51        	str	r2, [r2, r5]
     1c0: 6e 00        	lsls	r6, r5, #1
     1c2: 47 50        	str	r7, [r0, r1]
     1c4: 49 4f        	ldr	r7, [pc, #292]          @ 0x2ec <.debug_info+0x2ec>
     1c6: 5f 50        	str	r7, [r3, r1]
     1c8: 75 50        	str	r5, [r6, r1]
     1ca: 64 5f        	ldrsh	r4, [r4, r5]
     1cc: 44 4f        	ldr	r7, [pc, #272]          @ 0x2e0 <.debug_info+0x2e0>
     1ce: 57 4e        	ldr	r6, [pc, #348]          @ 0x32c <.debug_info+0x32c>
     1d0: 00 41        	asrs	r0, r0
     1d2: 49 52        	strh	r1, [r1, r1]
     1d4: 43 52        	strh	r3, [r0, r1]
     1d6: 00 74        	strb	r0, [r0, #16]
     1d8: 69 6d        	ldr	r1, [r5, #84]
     1da: 65 5f        	ldrsh	r5, [r4, r5]
     1dc: 76 61        	str	r6, [r6, #20]
     1de: 72 31        	adds	r1, #114
     1e0: 00 74        	strb	r0, [r0, #16]
     1e2: 69 6d        	ldr	r1, [r5, #84]
     1e4: 65 5f        	ldrsh	r5, [r4, r5]
     1e6: 76 61        	str	r6, [r6, #20]
     1e8: 72 32        	adds	r2, #114
     1ea: 00 72        	strb	r0, [r0, #8]
     1ec: 65 6d        	ldr	r5, [r4, #84]
     1ee: 6f 74        	strb	r7, [r5, #17]
     1f0: 65 49        	ldr	r1, [pc, #404]          @ 0x388 <.debug_info+0x388>
     1f2: 6e 69        	ldr	r6, [r5, #20]
     1f4: 74 00        	lsls	r4, r6, #1
     1f6: 43 50        	str	r3, [r0, r1]
     1f8: 55 49        	ldr	r1, [pc, #340]          @ 0x350 <.debug_info+0x350>
     1fa: 44 00        	lsls	r4, r0, #1
     1fc: 45 52        	strh	r5, [r0, r1]
     1fe: 52 5f        	ldrsh	r2, [r2, r5]
     200: 4d 50        	str	r5, [r1, r1]
     202: 33 5f        	ldrsh	r3, [r6, r4]
     204: 49 4e        	ldr	r6, [pc, #292]          @ 0x32c <.debug_info+0x32c>
     206: 56 41        	adcs	r6, r2
     208: 4c 49        	ldr	r1, [pc, #304]          @ 0x33c <.debug_info+0x33c>
     20a: 44 5f        	ldrsh	r4, [r0, r5]
     20c: 48 55        	strb	r0, [r1, r5]
     20e: 46 46        	mov	r6, r8
     210: 43 4f        	ldr	r7, [pc, #268]          @ 0x320 <.debug_info+0x320>
     212: 44 45        	cmp	r4, r8
     214: 53 00        	lsls	r3, r2, #1
     216: 44 4d        	ldr	r5, [pc, #272]          @ 0x328 <.debug_info+0x328>
     218: 41 32        	adds	r2, #65
     21a: 5f 53        	strh	r7, [r3, r5]
     21c: 74 72        	strb	r4, [r6, #9]
     21e: 65 61        	str	r5, [r4, #20]
     220: 6d 35        	adds	r5, #109
     222: 5f 49        	ldr	r1, [pc, #380]          @ 0x3a0 <.debug_info+0x3a0>
     224: 52 51        	str	r2, [r2, r5]
     226: 6e 00        	lsls	r6, r5, #1
     228: 47 50        	str	r7, [r0, r1]
     22a: 49 4f        	ldr	r7, [pc, #292]          @ 0x350 <.debug_info+0x350>
     22c: 5f 4d        	ldr	r5, [pc, #380]          @ 0x3ac <.debug_info+0x3ac>
     22e: 6f 64        	str	r7, [r5, #68]
     230: 65 5f        	ldrsh	r5, [r4, r5]
     232: 41 46        	mov	r1, r8
     234: 00 54        	strb	r0, [r0, r0]
     236: 49 4d        	ldr	r5, [pc, #292]          @ 0x35c <.debug_info+0x35c>
     238: 31 5f        	ldrsh	r1, [r6, r4]
     23a: 54 52        	strh	r4, [r2, r1]
     23c: 47 5f        	ldrsh	r7, [r0, r5]
     23e: 43 4f        	ldr	r7, [pc, #268]          @ 0x34c <.debug_info+0x34c>
     240: 4d 5f        	ldrsh	r5, [r1, r5]
     242: 54 49        	ldr	r1, [pc, #336]          @ 0x394 <.debug_info+0x394>
     244: 4d 31        	adds	r1, #77
     246: 31 5f        	ldrsh	r1, [r6, r4]
     248: 49 52        	strh	r1, [r1, r1]
     24a: 51 6e        	ldr	r1, [r2, #100]
     24c: 00 47        	bx	r0
     24e: 50 49        	ldr	r1, [pc, #320]          @ 0x390 <.debug_info+0x390>
     250: 4f 5f        	ldrsh	r7, [r1, r5]
     252: 4d 6f        	ldr	r5, [r1, #116]
     254: 64 65        	str	r4, [r4, #84]
     256: 5f 41        	adcs	r7, r3
     258: 4e 00        	lsls	r6, r1, #1
     25a: 55 53        	strh	r5, [r2, r5]
     25c: 41 52        	strh	r1, [r0, r1]
     25e: 54 5f        	ldrsh	r4, [r2, r5]
     260: 49 6e        	ldr	r1, [r1, #100]
     262: 69 74        	strb	r1, [r5, #17]
     264: 53 74        	strb	r3, [r2, #17]
     266: 72 75        	strb	r2, [r6, #21]
     268: 63 74        	strb	r3, [r4, #17]
     26a: 75 72        	strb	r5, [r6, #9]
     26c: 65 00        	lsls	r5, r4, #1
     26e: 50 72        	strb	r0, [r2, #9]
     270: 6f 76        	strb	r7, [r5, #25]
     272: 69 64        	str	r1, [r5, #68]
     274: 65 41        	adcs	r5, r4
     276: 75 64        	str	r5, [r6, #68]
     278: 69 6f        	ldr	r1, [r5, #116]
     27a: 42 75        	strb	r2, [r0, #21]
     27c: 66 66        	str	r6, [r4, #100]
     27e: 65 72        	strb	r5, [r4, #9]
     280: 00 53        	strh	r0, [r0, r4]
     282: 79 73        	strb	r1, [r7, #13]
     284: 54 69        	ldr	r4, [r2, #20]
     286: 63 6b        	ldr	r3, [r4, #52]
     288: 5f 49        	ldr	r1, [pc, #380]          @ 0x408 <.debug_info+0x408>
     28a: 52 51        	str	r2, [r2, r5]
     28c: 6e 00        	lsls	r6, r5, #1
     28e: 55 53        	strh	r5, [r2, r5]
     290: 41 52        	strh	r1, [r0, r1]
     292: 54 33        	adds	r3, #84
     294: 5f 49        	ldr	r1, [pc, #380]          @ 0x414 <.debug_info+0x414>
     296: 52 51        	str	r2, [r2, r5]
     298: 6e 00        	lsls	r6, r5, #1
     29a: 49 43        	muls	r1, r1, r1
     29c: 53 52        	strh	r3, [r2, r1]
     29e: 00 47        	bx	r0
     2a0: 50 49        	ldr	r1, [pc, #320]          @ 0x3e4 <.debug_info+0x3e4>
     2a2: 4f 5f        	ldrsh	r7, [r1, r5]
     2a4: 4f 54        	strb	r7, [r1, r1]
     2a6: 79 70        	strb	r1, [r7, #1]
     2a8: 65 5f        	ldrsh	r5, [r4, r5]
     2aa: 4f 44        	add	r7, r9
     2ac: 00 47        	bx	r0
     2ae: 50 49        	ldr	r1, [pc, #320]          @ 0x3f0 <.debug_info+0x3f0>
     2b0: 4f 5f        	ldrsh	r7, [r1, r5]
     2b2: 49 6e        	ldr	r1, [r1, #100]
     2b4: 69 74        	strb	r1, [r5, #17]
     2b6: 54 79        	ldrb	r4, [r2, #5]
     2b8: 70 65        	str	r0, [r6, #84]
     2ba: 44 65        	str	r4, [r0, #84]
     2bc: 66 00        	lsls	r6, r4, #1
     2be: 63 6f        	ldr	r3, [r4, #116]
     2c0: 6e 74        	strb	r6, [r5, #17]
     2c2: 65 78        	ldrb	r5, [r4, #1]
     2c4: 74 00        	lsls	r4, r6, #1
     2c6: 44 4d        	ldr	r5, [pc, #272]          @ 0x3d8 <.debug_info+0x3d8>
     2c8: 41 31        	adds	r1, #65
     2ca: 5f 53        	strh	r7, [r3, r5]
     2cc: 74 72        	strb	r4, [r6, #9]
     2ce: 65 61        	str	r5, [r4, #20]
     2d0: 6d 32        	adds	r2, #109
     2d2: 5f 49        	ldr	r1, [pc, #380]          @ 0x450 <.debug_info+0x450>
     2d4: 52 51        	str	r2, [r2, r5]
     2d6: 6e 00        	lsls	r6, r5, #1
     2d8: 52 43        	muls	r2, r2, r2
     2da: 43 5f        	ldrsh	r3, [r0, r5]
     2dc: 41 50        	str	r1, [r0, r1]
     2de: 42 31        	adds	r1, #66
     2e0: 50 65        	str	r0, [r2, #84]
     2e2: 72 69        	ldr	r2, [r6, #20]
     2e4: 70 68        	ldr	r0, [r6, #4]
     2e6: 43 6c        	ldr	r3, [r0, #68]
     2e8: 6f 63        	str	r7, [r5, #52]
     2ea: 6b 43        	muls	r3, r5, r3
     2ec: 6d 64        	str	r5, [r5, #68]
     2ee: 00 52        	strh	r0, [r0, r0]
     2f0: 45 53        	strh	r5, [r0, r5]
     2f2: 45 52        	strh	r5, [r0, r1]
     2f4: 56 45        	cmp	r6, r10
     2f6: 44 30        	adds	r0, #68
     2f8: 00 52        	strh	r0, [r0, r0]
     2fa: 45 53        	strh	r5, [r0, r5]
     2fc: 45 52        	strh	r5, [r0, r1]
     2fe: 56 45        	cmp	r6, r10
     300: 44 31        	adds	r1, #68
     302: 00 75        	strb	r0, [r0, #20]
     304: 6e 73        	strb	r6, [r5, #13]
     306: 69 67        	str	r1, [r5, #116]
     308: 6e 65        	str	r6, [r5, #84]
     30a: 64 20        	movs	r0, #100
     30c: 63 68        	ldr	r3, [r4, #4]
     30e: 61 72        	strb	r1, [r4, #9]
     310: 00 44        	add	r0, r0
     312: 4d 41        	adcs	r5, r1
     314: 32 5f        	ldrsh	r2, [r6, r4]
     316: 53 74        	strb	r3, [r2, #17]
     318: 72 65        	str	r2, [r6, #84]
     31a: 61 6d        	ldr	r1, [r4, #84]
     31c: 34 5f        	ldrsh	r4, [r6, r4]
     31e: 49 52        	strh	r1, [r1, r1]
     320: 51 6e        	ldr	r1, [r2, #100]
     322: 00 52        	strh	r0, [r0, r0]
     324: 45 53        	strh	r5, [r0, r5]
     326: 45 52        	strh	r5, [r0, r1]
     328: 56 45        	cmp	r6, r10
     32a: 44 34        	adds	r4, #68
     32c: 00 52        	strh	r0, [r0, r0]
     32e: 45 53        	strh	r5, [r0, r5]
     330: 45 52        	strh	r5, [r0, r1]
     332: 56 45        	cmp	r6, r10
     334: 44 35        	adds	r5, #68
     336: 00 52        	strh	r0, [r0, r0]
     338: 45 53        	strh	r5, [r0, r5]
     33a: 45 52        	strh	r5, [r0, r1]
     33c: 56 45        	cmp	r6, r10
     33e: 44 36        	adds	r6, #68
     340: 00 73        	strb	r0, [r0, #12]
     342: 72 63        	str	r2, [r6, #52]
     344: 2f 6d        	ldr	r7, [r5, #80]
     346: 61 69        	ldr	r1, [r4, #20]
     348: 6e 2e        	cmp	r6, #110
     34a: 63 00        	lsls	r3, r4, #1
     34c: 49 41        	adcs	r1, r1
     34e: 42 52        	strh	r2, [r0, r1]
     350: 00 47        	bx	r0
     352: 50 49        	ldr	r1, [pc, #320]          @ 0x494 <.debug_info+0x494>
     354: 4f 5f        	ldrsh	r7, [r1, r5]
     356: 4f 54        	strb	r7, [r1, r1]
     358: 79 70        	strb	r1, [r7, #1]
     35a: 65 5f        	ldrsh	r5, [r4, r5]
     35c: 50 50        	str	r0, [r2, r1]
     35e: 00 55        	strb	r0, [r0, r4]
     360: 53 41        	adcs	r3, r2
     362: 52 54        	strb	r2, [r2, r1]
     364: 5f 57        	ldrsb	r7, [r3, r5]
     366: 6f 72        	strb	r7, [r5, #9]
     368: 64 4c        	ldr	r4, [pc, #400]          @ 0x4fc <.debug_info+0x4fc>
     36a: 65 6e        	ldr	r5, [r4, #100]
     36c: 67 74        	strb	r7, [r4, #17]
     36e: 68 00        	lsls	r0, r5, #1
     370: 49 32        	adds	r2, #73
     372: 43 31        	adds	r1, #67
     374: 5f 45        	cmp	r7, r11
     376: 52 5f        	ldrsh	r2, [r2, r5]
     378: 49 52        	strh	r1, [r1, r1]
     37a: 51 6e        	ldr	r1, [r2, #100]
     37c: 00 43        	orrs	r0, r0
     37e: 41 4e        	ldr	r6, [pc, #260]          @ 0x484 <.debug_info+0x484>
     380: 32 5f        	ldrsh	r2, [r6, r4]
     382: 53 43        	muls	r3, r2, r3
     384: 45 5f        	ldrsh	r5, [r0, r5]
     386: 49 52        	strh	r1, [r1, r1]
     388: 51 6e        	ldr	r1, [r2, #100]
     38a: 00 52        	strh	r0, [r0, r0]
     38c: 45 53        	strh	r5, [r0, r5]
     38e: 45 52        	strh	r5, [r0, r1]
     390: 56 45        	cmp	r6, r10
     392: 44 32        	adds	r2, #68
     394: 00 52        	strh	r0, [r0, r0]
     396: 45 53        	strh	r5, [r0, r5]
     398: 45 52        	strh	r5, [r0, r1]
     39a: 56 45        	cmp	r6, r10
     39c: 44 33        	adds	r3, #68
     39e: 00 54        	strb	r0, [r0, r0]
     3a0: 49 4d        	ldr	r5, [pc, #292]          @ 0x4c8 <.debug_info+0x4c8>
     3a2: 35 5f        	ldrsh	r5, [r6, r4]
     3a4: 49 52        	strh	r1, [r1, r1]
     3a6: 51 6e        	ldr	r1, [r2, #100]
     3a8: 00 55        	strb	r0, [r0, r4]
     3aa: 73 61        	str	r3, [r6, #20]
     3ac: 67 65        	str	r7, [r4, #84]
     3ae: 46 61        	str	r6, [r0, #20]
     3b0: 75 6c        	ldr	r5, [r6, #68]
     3b2: 74 5f        	ldrsh	r4, [r6, r5]
     3b4: 49 52        	strh	r1, [r1, r1]
     3b6: 51 6e        	ldr	r1, [r2, #100]
     3b8: 00 74        	strb	r0, [r0, #16]
     3ba: 69 6d        	ldr	r1, [r5, #84]
     3bc: 69 6e        	ldr	r1, [r5, #100]
     3be: 67 5f        	ldrsh	r7, [r4, r5]
     3c0: 68 61        	str	r0, [r5, #20]
     3c2: 6e 64        	str	r6, [r5, #68]
     3c4: 6c 65        	str	r4, [r5, #84]
     3c6: 72 00        	lsls	r2, r6, #1
     3c8: 53 43        	muls	r3, r2, r3
     3ca: 42 5f        	ldrsh	r2, [r0, r5]
     3cc: 54 79        	ldrb	r4, [r2, #5]
     3ce: 70 65        	str	r0, [r6, #84]
     3d0: 00 47        	bx	r0
     3d2: 50 49        	ldr	r1, [pc, #320]          @ 0x514 <.debug_info+0x514>
     3d4: 4f 50        	str	r7, [r1, r1]
     3d6: 75 50        	str	r5, [r6, r1]
     3d8: 64 5f        	ldrsh	r4, [r4, r5]
     3da: 54 79        	ldrb	r4, [r2, #5]
     3dc: 70 65        	str	r0, [r6, #84]
     3de: 44 65        	str	r4, [r0, #84]
     3e0: 66 00        	lsls	r6, r4, #1
     3e2: 44 46        	mov	r4, r8
     3e4: 53 52        	strh	r3, [r2, r1]
     3e6: 00 45        	cmp	r0, r0
     3e8: 52 52        	strh	r2, [r2, r1]
     3ea: 5f 4d        	ldr	r5, [pc, #380]          @ 0x568 <.debug_info+0x568>
     3ec: 50 33        	adds	r3, #80
     3ee: 5f 49        	ldr	r1, [pc, #380]          @ 0x56c <.debug_info+0x56c>
     3f0: 4e 56        	ldrsb	r6, [r1, r1]
     3f2: 41 4c        	ldr	r4, [pc, #260]          @ 0x4f8 <.debug_info+0x4f8>
     3f4: 49 44        	add	r1, r9
     3f6: 5f 49        	ldr	r1, [pc, #380]          @ 0x574 <.debug_info+0x574>
     3f8: 4d 44        	add	r5, r9
     3fa: 43 54        	strb	r3, [r0, r1]
     3fc: 00 5f        	ldrsh	r0, [r0, r4]
     3fe: 5f 75        	strb	r7, [r3, #21]
     400: 69 6e        	ldr	r1, [r5, #100]
     402: 74 31        	adds	r1, #116
     404: 36 5f        	ldrsh	r6, [r6, r4]
     406: 74 00        	lsls	r4, r6, #1
     408: 43 41        	adcs	r3, r0
     40a: 4e 31        	adds	r1, #78
     40c: 5f 52        	strh	r7, [r3, r1]
     40e: 58 30        	adds	r0, #88
     410: 5f 49        	ldr	r1, [pc, #380]          @ 0x590 <.debug_info+0x590>
     412: 52 51        	str	r2, [r2, r5]
     414: 6e 00        	lsls	r6, r5, #1
     416: 47 50        	str	r7, [r0, r1]
     418: 49 4f        	ldr	r7, [pc, #292]          @ 0x540 <.debug_info+0x540>
     41a: 5f 53        	strh	r7, [r3, r5]
     41c: 70 65        	str	r0, [r6, #84]
     41e: 65 64        	str	r5, [r4, #68]
     420: 5f 32        	adds	r2, #95
     422: 35 4d        	ldr	r5, [pc, #212]          @ 0x4f8 <.debug_info+0x4f8>
     424: 48 7a        	ldrb	r0, [r1, #9]
     426: 00 48        	ldr	r0, [pc, #0]            @ 0x428 <.debug_info+0x428>
     428: 46 53        	strh	r6, [r0, r5]
     42a: 52 00        	lsls	r2, r2, #1
     42c: 47 50        	str	r7, [r0, r1]
     42e: 49 4f        	ldr	r7, [pc, #292]          @ 0x554 <.debug_info+0x554>
     430: 5f 53        	strh	r7, [r3, r5]
     432: 70 65        	str	r0, [r6, #84]
     434: 65 64        	str	r5, [r4, #68]
     436: 5f 35        	adds	r5, #95
     438: 30 4d        	ldr	r5, [pc, #192]          @ 0x4fc <.debug_info+0x4fc>
     43a: 48 7a        	ldrb	r0, [r1, #9]
     43c: 00 55        	strb	r0, [r0, r4]
     43e: 53 41        	adcs	r3, r2
     440: 52 54        	strb	r2, [r2, r1]
     442: 5f 54        	strb	r7, [r3, r1]
     444: 79 70        	strb	r1, [r7, #1]
     446: 65 44        	add	r5, r12
     448: 65 66        	str	r5, [r4, #100]
     44a: 00 6f        	ldr	r0, [r0, #112]
     44c: 66 66        	str	r6, [r4, #100]
     44e: 6c 6f        	ldr	r4, [r5, #116]
     450: 61 64        	str	r1, [r4, #68]
     452: 65 64        	str	r5, [r4, #68]
     454: 43 6f        	ldr	r3, [r0, #116]
     456: 64 65        	str	r4, [r4, #84]
     458: 00 48        	ldr	r0, [pc, #0]            @ 0x45c <.debug_info+0x45c>
     45a: 4d 50        	str	r5, [r1, r1]
     45c: 33 44        	add	r3, r6
     45e: 65 63        	str	r5, [r4, #52]
     460: 6f 64        	str	r7, [r5, #68]
     462: 65 72        	strb	r5, [r4, #9]
     464: 00 54        	strb	r0, [r0, r0]
     466: 49 4d        	ldr	r5, [pc, #292]          @ 0x58c <.debug_info+0x58c>
     468: 34 5f        	ldrsh	r4, [r6, r4]
     46a: 49 52        	strh	r1, [r1, r1]
     46c: 51 6e        	ldr	r1, [r2, #100]
     46e: 00 55        	strb	r0, [r0, r4]
     470: 53 41        	adcs	r3, r2
     472: 52 54        	strb	r2, [r2, r1]
     474: 32 5f        	ldrsh	r2, [r6, r4]
     476: 49 52        	strh	r1, [r1, r1]
     478: 51 6e        	ldr	r1, [r2, #100]
     47a: 00 61        	str	r0, [r0, #16]
     47c: 75 64        	str	r5, [r6, #68]
     47e: 69 6f        	ldr	r1, [r5, #116]
     480: 5f 62        	str	r7, [r3, #36]
     482: 75 66        	str	r5, [r6, #100]
     484: 66 65        	str	r6, [r4, #84]
     486: 72 31        	adds	r1, #114
     488: 00 55        	strb	r0, [r0, r4]
     48a: 53 41        	adcs	r3, r2
     48c: 52 54        	strb	r2, [r2, r1]
     48e: 5f 49        	ldr	r1, [pc, #380]          @ 0x60c <.debug_info+0x60c>
     490: 6e 69        	ldr	r6, [r5, #20]
     492: 74 00        	lsls	r4, r6, #1
     494: 6e 43        	muls	r6, r5, r6
     496: 6f 75        	strb	r7, [r5, #21]
     498: 6e 74        	strb	r6, [r5, #17]
     49a: 00 53        	strh	r0, [r0, r4]
     49c: 48 43        	muls	r0, r1, r0
     49e: 53 52        	strh	r3, [r2, r1]
     4a0: 00 45        	cmp	r0, r0
     4a2: 52 52        	strh	r2, [r2, r1]
     4a4: 5f 4d        	ldr	r5, [pc, #380]          @ 0x624 <.debug_info+0x624>
     4a6: 50 33        	adds	r3, #80
     4a8: 5f 4e        	ldr	r6, [pc, #380]          @ 0x628 <.debug_info+0x628>
     4aa: 55 4c        	ldr	r4, [pc, #340]          @ 0x600 <.debug_info+0x600>
     4ac: 4c 5f        	ldrsh	r4, [r1, r5]
     4ae: 50 4f        	ldr	r7, [pc, #320]          @ 0x5f0 <.debug_info+0x5f0>
     4b0: 49 4e        	ldr	r6, [pc, #292]          @ 0x5d8 <.debug_info+0x5d8>
     4b2: 54 45        	cmp	r4, r10
     4b4: 52 00        	lsls	r2, r2, #1
     4b6: 53 54        	strb	r3, [r2, r1]
     4b8: 49 52        	strh	r1, [r1, r1]
     4ba: 00 49        	ldr	r1, [pc, #0]            @ 0x4bc <.debug_info+0x4bc>
     4bc: 32 43        	orrs	r2, r6
     4be: 31 5f        	ldrsh	r1, [r6, r4]
     4c0: 45 56        	ldrsb	r5, [r0, r1]
     4c2: 5f 49        	ldr	r1, [pc, #380]          @ 0x640 <.debug_info+0x640>
     4c4: 52 51        	str	r2, [r2, r5]
     4c6: 6e 00        	lsls	r6, r5, #1
     4c8: 62 75        	strb	r2, [r4, #21]
     4ca: 66 66        	str	r6, [r4, #100]
     4cc: 65 72        	strb	r5, [r4, #9]
     4ce: 00 47        	bx	r0
     4d0: 50 49        	ldr	r1, [pc, #320]          @ 0x614 <.debug_info+0x614>
     4d2: 4f 5f        	ldrsh	r7, [r1, r5]
     4d4: 49 6e        	ldr	r1, [r1, #100]
     4d6: 69 74        	strb	r1, [r5, #17]
     4d8: 00 53        	strh	r0, [r0, r4]
     4da: 65 74        	strb	r5, [r4, #17]
     4dc: 41 75        	strb	r1, [r0, #21]
     4de: 64 69        	ldr	r4, [r4, #20]
     4e0: 6f 56        	ldrsb	r7, [r5, r1]
     4e2: 6f 6c        	ldr	r7, [r5, #68]
     4e4: 75 6d        	ldr	r5, [r6, #84]
     4e6: 65 00        	lsls	r5, r4, #1
     4e8: 55 53        	strh	r5, [r2, r5]
     4ea: 41 52        	strh	r1, [r0, r1]
     4ec: 54 5f        	ldrsh	r4, [r2, r5]
     4ee: 42 61        	str	r2, [r0, #20]
     4f0: 75 64        	str	r5, [r6, #68]
     4f2: 52 61        	str	r2, [r2, #20]
     4f4: 74 65        	str	r4, [r6, #84]
     4f6: 00 47        	bx	r0
     4f8: 50 49        	ldr	r1, [pc, #320]          @ 0x63c <.debug_info+0x63c>
     4fa: 4f 5f        	ldrsh	r7, [r1, r5]
     4fc: 4d 6f        	ldr	r5, [r1, #116]
     4fe: 64 65        	str	r4, [r4, #84]
     500: 5f 4f        	ldr	r7, [pc, #380]          @ 0x680 <.debug_info+0x680>
     502: 55 54        	strb	r5, [r2, r1]
     504: 00 55        	strb	r0, [r0, r4]
     506: 53 41        	adcs	r3, r2
     508: 52 54        	strb	r2, [r2, r1]
     50a: 5f 4d        	ldr	r5, [pc, #380]          @ 0x688 <.debug_info+0x688>
     50c: 6f 64        	str	r7, [r5, #68]
     50e: 65 00        	lsls	r5, r4, #1
     510: 54 49        	ldr	r1, [pc, #336]          @ 0x664 <.debug_info+0x664>
     512: 4d 31        	adds	r1, #77
     514: 5f 43        	muls	r7, r3, r7
     516: 43 5f        	ldrsh	r3, [r0, r5]
     518: 49 52        	strh	r1, [r1, r1]
     51a: 51 6e        	ldr	r1, [r2, #100]
     51c: 00 48        	ldr	r0, [pc, #0]            @ 0x520 <.debug_info+0x520>
     51e: 41 53        	strh	r1, [r0, r5]
     520: 48 5f        	ldrsh	r0, [r1, r5]
     522: 52 4e        	ldr	r6, [pc, #328]          @ 0x66c <.debug_info+0x66c>
     524: 47 5f        	ldrsh	r7, [r0, r5]
     526: 49 52        	strh	r1, [r1, r1]
     528: 51 6e        	ldr	r1, [r2, #100]
     52a: 00 45        	cmp	r0, r0
     52c: 58 54        	strb	r0, [r3, r1]
     52e: 49 31        	adds	r1, #73
     530: 5f 49        	ldr	r1, [pc, #380]          @ 0x6b0 <.debug_info+0x6b0>
     532: 52 51        	str	r2, [r2, r5]
     534: 6e 00        	lsls	r6, r5, #1
     536: 43 41        	adcs	r3, r0
     538: 4e 31        	adds	r1, #78
     53a: 5f 54        	strb	r7, [r3, r1]
     53c: 58 5f        	ldrsh	r0, [r3, r5]
     53e: 49 52        	strh	r1, [r1, r1]
     540: 51 6e        	ldr	r1, [r2, #100]
     542: 00 44        	add	r0, r0
     544: 4d 41        	adcs	r5, r1
     546: 31 5f        	ldrsh	r1, [r6, r4]
     548: 53 74        	strb	r3, [r2, #17]
     54a: 72 65        	str	r2, [r6, #84]
     54c: 61 6d        	ldr	r1, [r4, #84]
     54e: 35 5f        	ldrsh	r5, [r6, r4]
     550: 49 52        	strh	r1, [r1, r1]
     552: 51 6e        	ldr	r1, [r2, #100]
     554: 00 54        	strb	r0, [r0, r0]
     556: 49 4d        	ldr	r5, [pc, #292]          @ 0x67c <.debug_info+0x67c>
     558: 38 5f        	ldrsh	r0, [r7, r4]
     55a: 54 52        	strh	r4, [r2, r1]
     55c: 47 5f        	ldrsh	r7, [r0, r5]
     55e: 43 4f        	ldr	r7, [pc, #268]          @ 0x66c <.debug_info+0x66c>
     560: 4d 5f        	ldrsh	r5, [r1, r5]
     562: 54 49        	ldr	r1, [pc, #336]          @ 0x6b4 <.debug_info+0x6b4>
     564: 4d 31        	adds	r1, #77
     566: 34 5f        	ldrsh	r4, [r6, r4]
     568: 49 52        	strh	r1, [r1, r1]
     56a: 51 6e        	ldr	r1, [r2, #100]
     56c: 00 44        	add	r0, r0
     56e: 4d 41        	adcs	r5, r1
     570: 32 5f        	ldrsh	r2, [r6, r4]
     572: 53 74        	strb	r3, [r2, #17]
     574: 72 65        	str	r2, [r6, #84]
     576: 61 6d        	ldr	r1, [r4, #84]
     578: 37 5f        	ldrsh	r7, [r6, r4]
     57a: 49 52        	strh	r1, [r1, r1]
     57c: 51 6e        	ldr	r1, [r2, #100]
     57e: 00 4f        	ldr	r7, [pc, #0]            @ 0x580 <.debug_info+0x580>
     580: 54 47        	bx	r10
     582: 5f 46        	mov	r7, r11
     584: 53 5f        	ldrsh	r3, [r2, r5]
     586: 49 52        	strh	r1, [r1, r1]
     588: 51 6e        	ldr	r1, [r2, #100]
     58a: 00 4e        	ldr	r6, [pc, #0]            @ 0x58c <.debug_info+0x58c>
     58c: 6f 6e        	ldr	r7, [r5, #100]
     58e: 4d 61        	str	r5, [r1, #20]
     590: 73 6b        	ldr	r3, [r6, #52]
     592: 61 62        	str	r1, [r4, #36]
     594: 6c 65        	str	r4, [r5, #84]
     596: 49 6e        	ldr	r1, [r1, #100]
     598: 74 5f        	ldrsh	r4, [r6, r5]
     59a: 49 52        	strh	r1, [r1, r1]
     59c: 51 6e        	ldr	r1, [r2, #100]
     59e: 00 57        	ldrsb	r0, [r0, r4]
     5a0: 57 44        	add	r7, r10
     5a2: 47 5f        	ldrsh	r7, [r0, r5]
     5a4: 49 52        	strh	r1, [r1, r1]
     5a6: 51 6e        	ldr	r1, [r2, #100]
     5a8: 00 61        	str	r0, [r0, #16]
     5aa: 75 64        	str	r5, [r6, #68]
     5ac: 69 6f        	ldr	r1, [r5, #116]
     5ae: 5f 62        	str	r7, [r3, #36]
     5b0: 75 66        	str	r5, [r6, #100]
     5b2: 66 65        	str	r6, [r4, #84]
     5b4: 72 30        	adds	r0, #114
     5b6: 00 4d        	ldr	r5, [pc, #0]            @ 0x5b8 <.debug_info+0x5b8>
     5b8: 65 6d        	ldr	r5, [r4, #84]
     5ba: 6f 72        	strb	r7, [r5, #9]
     5bc: 79 4d        	ldr	r5, [pc, #484]          @ 0x7a4 <.debug_info+0x7a4>
     5be: 61 6e        	ldr	r1, [r4, #100]
     5c0: 61 67        	str	r1, [r4, #116]
     5c2: 65 6d        	ldr	r5, [r4, #84]
     5c4: 65 6e        	ldr	r5, [r4, #100]
     5c6: 74 5f        	ldrsh	r4, [r6, r5]
     5c8: 49 52        	strh	r1, [r1, r1]
     5ca: 51 6e        	ldr	r1, [r2, #100]
     5cc: 00 53        	strh	r0, [r0, r4]
     5ce: 79 73        	strb	r1, [r7, #13]
     5d0: 74 65        	str	r4, [r6, #84]
     5d2: 6d 43        	muls	r5, r5, r5
     5d4: 6f 72        	strb	r7, [r5, #9]
     5d6: 65 43        	muls	r5, r4, r5
     5d8: 6c 6f        	ldr	r4, [r5, #116]
     5da: 63 6b        	ldr	r3, [r4, #52]
     5dc: 00 54        	strb	r0, [r0, r0]
     5de: 41 4d        	ldr	r5, [pc, #260]          @ 0x6e4 <.debug_info+0x6e4>
     5e0: 50 5f        	ldrsh	r0, [r2, r5]
     5e2: 53 54        	strb	r3, [r2, r1]
     5e4: 41 4d        	ldr	r5, [pc, #260]          @ 0x6ec <.debug_info+0x6ec>
     5e6: 50 5f        	ldrsh	r0, [r2, r5]
     5e8: 49 52        	strh	r1, [r1, r1]
     5ea: 51 6e        	ldr	r1, [r2, #100]
     5ec: 00 43        	orrs	r0, r0
     5ee: 41 4e        	ldr	r6, [pc, #260]          @ 0x6f4 <.debug_info+0x6f4>
     5f0: 31 5f        	ldrsh	r1, [r6, r4]
     5f2: 53 43        	muls	r3, r2, r3
     5f4: 45 5f        	ldrsh	r5, [r0, r5]
     5f6: 49 52        	strh	r1, [r1, r1]
     5f8: 51 6e        	ldr	r1, [r2, #100]
     5fa: 00 49        	ldr	r1, [pc, #0]            @ 0x5fc <.debug_info+0x5fc>
     5fc: 52 51        	str	r2, [r2, r5]
     5fe: 6e 5f        	ldrsh	r6, [r5, r5]
     600: 54 79        	ldrb	r4, [r2, #5]
     602: 70 65        	str	r0, [r6, #84]
     604: 00 47        	bx	r0
     606: 50 49        	ldr	r1, [pc, #320]          @ 0x748 <.debug_info+0x748>
     608: 4f 5f        	ldrsh	r7, [r1, r5]
     60a: 4d 6f        	ldr	r5, [r1, #116]
     60c: 64 65        	str	r4, [r4, #84]
     60e: 5f 49        	ldr	r1, [pc, #380]          @ 0x78c <.debug_info+0x78c>
     610: 4e 00        	lsls	r6, r1, #1
     612: 44 4d        	ldr	r5, [pc, #272]          @ 0x724 <.debug_info+0x724>
     614: 41 32        	adds	r2, #65
     616: 5f 53        	strh	r7, [r3, r5]
     618: 74 72        	strb	r4, [r6, #9]
     61a: 65 61        	str	r5, [r4, #20]
     61c: 6d 30        	adds	r0, #109
     61e: 5f 49        	ldr	r1, [pc, #380]          @ 0x79c <.debug_info+0x79c>
     620: 52 51        	str	r2, [r2, r5]
     622: 6e 00        	lsls	r6, r5, #1
     624: 45 52        	strh	r5, [r0, r1]
     626: 52 5f        	ldrsh	r2, [r2, r5]
     628: 4d 50        	str	r5, [r1, r1]
     62a: 33 5f        	ldrsh	r3, [r6, r4]
     62c: 49 4e        	ldr	r6, [pc, #292]          @ 0x754 <.debug_info+0x754>
     62e: 56 41        	adcs	r6, r2
     630: 4c 49        	ldr	r1, [pc, #304]          @ 0x764 <.debug_info+0x764>
     632: 44 5f        	ldrsh	r4, [r0, r5]
     634: 44 45        	cmp	r4, r8
     636: 51 55        	strb	r1, [r2, r5]
     638: 41 4e        	ldr	r6, [pc, #260]          @ 0x740 <.debug_info+0x740>
     63a: 54 49        	ldr	r1, [pc, #336]          @ 0x78c <.debug_info+0x78c>
     63c: 5a 45        	cmp	r2, r11
     63e: 00 55        	strb	r0, [r0, r4]
     640: 53 41        	adcs	r3, r2
     642: 52 54        	strb	r2, [r2, r1]
     644: 5f 53        	strh	r7, [r3, r5]
     646: 74 6f        	ldr	r4, [r6, #116]
     648: 70 42        	rsbs	r0, r6, #0
     64a: 69 74        	strb	r1, [r5, #17]
     64c: 73 00        	lsls	r3, r6, #1
     64e: 4c 43        	muls	r4, r1, r4
     650: 4b 52        	strh	r3, [r1, r1]
     652: 00 49        	ldr	r1, [pc, #0]            @ 0x654 <.debug_info+0x654>
     654: 6e 69        	ldr	r6, [r5, #20]
     656: 74 69        	ldr	r4, [r6, #20]
     658: 61 6c        	ldr	r1, [r4, #68]
     65a: 69 7a        	ldrb	r1, [r5, #9]
     65c: 65 41        	adcs	r5, r4
     65e: 75 64        	str	r5, [r6, #68]
     660: 69 6f        	ldr	r1, [r5, #116]
     662: 00 49        	ldr	r1, [pc, #0]            @ 0x664 <.debug_info+0x664>
     664: 32 43        	orrs	r2, r6
     666: 32 5f        	ldrsh	r2, [r6, r4]
     668: 45 52        	strh	r5, [r0, r1]
     66a: 5f 49        	ldr	r1, [pc, #380]          @ 0x7e8 <.debug_info+0x7e8>
     66c: 52 51        	str	r2, [r2, r5]
     66e: 6e 00        	lsls	r6, r5, #1
     670: 4f 53        	strh	r7, [r1, r5]
     672: 50 45        	cmp	r0, r10
     674: 45 44        	add	r5, r8
     676: 52 00        	lsls	r2, r2, #1
     678: 42 75        	strb	r2, [r0, #21]
     67a: 73 46        	mov	r3, lr
     67c: 61 75        	strb	r1, [r4, #21]
     67e: 6c 74        	strb	r4, [r5, #17]
     680: 5f 49        	ldr	r1, [pc, #380]          @ 0x800 <.debug_info+0x800>
     682: 52 51        	str	r2, [r2, r5]
     684: 6e 00        	lsls	r6, r5, #1
     686: 74 69        	ldr	r4, [r6, #20]
     688: 63 6b        	ldr	r3, [r4, #52]
     68a: 73 00        	lsls	r3, r6, #1
     68c: 55 41        	adcs	r5, r2
     68e: 52 54        	strb	r2, [r2, r1]
     690: 35 5f        	ldrsh	r5, [r6, r4]
     692: 49 52        	strh	r1, [r1, r1]
     694: 51 6e        	ldr	r1, [r2, #100]
     696: 00 54        	strb	r0, [r0, r0]
     698: 49 4d        	ldr	r5, [pc, #292]          @ 0x7c0 <.debug_info+0x7c0>
     69a: 31 5f        	ldrsh	r1, [r6, r4]
     69c: 42 52        	strh	r2, [r0, r1]
     69e: 4b 5f        	ldrsh	r3, [r1, r5]
     6a0: 54 49        	ldr	r1, [pc, #336]          @ 0x7f4 <.debug_info+0x7f4>
     6a2: 4d 39        	subs	r1, #77
     6a4: 5f 49        	ldr	r1, [pc, #380]          @ 0x824 <.debug_info+0x824>
     6a6: 52 51        	str	r2, [r2, r5]
     6a8: 6e 00        	lsls	r6, r5, #1
     6aa: 47 50        	str	r7, [r0, r1]
     6ac: 49 4f        	ldr	r7, [pc, #292]          @ 0x7d4 <.debug_info+0x7d4>
     6ae: 5f 4f        	ldr	r7, [pc, #380]          @ 0x82c <.debug_info+0x82c>
     6b0: 54 79        	ldrb	r4, [r2, #5]
     6b2: 70 65        	str	r0, [r6, #84]
     6b4: 00 5f        	ldrsh	r0, [r0, r4]
     6b6: 5f 75        	strb	r7, [r3, #21]
     6b8: 69 6e        	ldr	r1, [r5, #100]
     6ba: 74 33        	adds	r3, #116
     6bc: 32 5f        	ldrsh	r2, [r6, r4]
     6be: 74 00        	lsls	r4, r6, #1
     6c0: 54 49        	ldr	r1, [pc, #336]          @ 0x814 <.debug_info+0x814>
     6c2: 4d 37        	adds	r7, #77
     6c4: 5f 49        	ldr	r1, [pc, #380]          @ 0x844 <.debug_info+0x844>
     6c6: 52 51        	str	r2, [r2, r5]
     6c8: 6e 00        	lsls	r6, r5, #1
     6ca: 6c 6f        	ldr	r4, [r5, #116]
     6cc: 6e 67        	str	r6, [r5, #116]
     6ce: 20 6c        	ldr	r0, [r4, #64]
     6d0: 6f 6e        	ldr	r7, [r5, #100]
     6d2: 67 20        	movs	r0, #103
     6d4: 69 6e        	ldr	r1, [r5, #100]
     6d6: 74 00        	lsls	r4, r6, #1
     6d8: 47 4e        	ldr	r6, [pc, #284]          @ 0x7f8 <.debug_info+0x7f8>
     6da: 55 20        	movs	r0, #85
     6dc: 43 20        	movs	r0, #67
     6de: 34 2e        	cmp	r6, #52
     6e0: 39 2e        	cmp	r6, #57
     6e2: 33 20        	movs	r0, #51
     6e4: 32 30        	adds	r0, #50
     6e6: 31 35        	adds	r5, #49
     6e8: 30 35        	adds	r5, #48
     6ea: 32 39        	subs	r1, #50
     6ec: 20 28        	cmp	r0, #32
     6ee: 72 65        	str	r2, [r6, #84]
     6f0: 6c 65        	str	r4, [r5, #84]
     6f2: 61 73        	strb	r1, [r4, #13]
     6f4: 65 29        	cmp	r1, #101
     6f6: 20 5b        	ldrh	r0, [r4, r4]
     6f8: 41 52        	strh	r1, [r0, r1]
     6fa: 4d 2f        	cmp	r7, #77
     6fc: 65 6d        	ldr	r5, [r4, #84]
     6fe: 62 65        	str	r2, [r4, #84]
     700: 64 64        	str	r4, [r4, #68]
     702: 65 64        	str	r5, [r4, #68]
     704: 2d 34        	adds	r4, #45
     706: 5f 39        	subs	r1, #95
     708: 2d 62        	str	r5, [r5, #32]
     70a: 72 61        	str	r2, [r6, #20]
     70c: 6e 63        	str	r6, [r5, #52]
     70e: 68 20        	movs	r0, #104
     710: 72 65        	str	r2, [r6, #84]
     712: 76 69        	ldr	r6, [r6, #20]
     714: 73 69        	ldr	r3, [r6, #20]
     716: 6f 6e        	ldr	r7, [r5, #100]
     718: 20 32        	adds	r2, #32
     71a: 32 37        	adds	r7, #50
     71c: 39 37        	adds	r7, #57
     71e: 37 5d        	ldrb	r7, [r6, r4]
     720: 20 2d        	cmp	r5, #32
     722: 6d 6c        	ldr	r5, [r5, #68]
     724: 69 74        	strb	r1, [r5, #17]
     726: 74 6c        	ldr	r4, [r6, #68]
     728: 65 2d        	cmp	r5, #101
     72a: 65 6e        	ldr	r5, [r4, #100]
     72c: 64 69        	ldr	r4, [r4, #20]
     72e: 61 6e        	ldr	r1, [r4, #100]
     730: 20 2d        	cmp	r5, #32
     732: 6d 74        	strb	r5, [r5, #17]
     734: 68 75        	strb	r0, [r5, #21]
     736: 6d 62        	str	r5, [r5, #36]
     738: 20 2d        	cmp	r5, #32
     73a: 6d 74        	strb	r5, [r5, #17]
     73c: 68 75        	strb	r0, [r5, #21]
     73e: 6d 62        	str	r5, [r5, #36]
     740: 2d 69        	ldr	r5, [r5, #16]
     742: 6e 74        	strb	r6, [r5, #17]
     744: 65 72        	strb	r5, [r4, #9]
     746: 77 6f        	ldr	r7, [r6, #116]
     748: 72 6b        	ldr	r2, [r6, #52]
     74a: 20 2d        	cmp	r5, #32
     74c: 6d 63        	str	r5, [r5, #52]
     74e: 70 75        	strb	r0, [r6, #21]
     750: 3d 63        	str	r5, [r7, #48]
     752: 6f 72        	strb	r7, [r5, #9]
     754: 74 65        	str	r4, [r6, #84]
     756: 78 2d        	cmp	r5, #120
     758: 6d 34        	adds	r4, #109
     75a: 20 2d        	cmp	r5, #32
     75c: 6d 66        	str	r5, [r5, #100]
     75e: 70 75        	strb	r0, [r6, #21]
     760: 3d 66        	str	r5, [r7, #96]
     762: 70 76        	strb	r0, [r6, #25]
     764: 34 2d        	cmp	r5, #52
     766: 73 70        	strb	r3, [r6, #1]
     768: 2d 64        	str	r5, [r5, #64]
     76a: 31 36        	adds	r6, #49
     76c: 20 2d        	cmp	r5, #32
     76e: 6d 66        	str	r5, [r5, #100]
     770: 6c 6f        	ldr	r4, [r5, #116]
     772: 61 74        	strb	r1, [r4, #17]
     774: 2d 61        	str	r5, [r5, #16]
     776: 62 69        	ldr	r2, [r4, #20]
     778: 3d 68        	ldr	r5, [r7]
     77a: 61 72        	strb	r1, [r4, #9]
     77c: 64 20        	movs	r0, #100
     77e: 2d 67        	str	r5, [r5, #112]
     780: 20 2d        	cmp	r5, #32
     782: 4f 67        	str	r7, [r1, #116]
     784: 20 2d        	cmp	r5, #32
     786: 73 74        	strb	r3, [r6, #17]
     788: 64 3d        	subs	r5, #100
     78a: 67 6e        	ldr	r7, [r4, #100]
     78c: 75 39        	subs	r1, #117
     78e: 39 20        	movs	r0, #57
     790: 2d 66        	str	r5, [r5, #96]
     792: 73 69        	ldr	r3, [r6, #20]
     794: 6e 67        	str	r6, [r5, #116]
     796: 6c 65        	str	r4, [r5, #84]
     798: 2d 70        	strb	r5, [r5]
     79a: 72 65        	str	r2, [r6, #84]
     79c: 63 69        	ldr	r3, [r4, #20]
     79e: 73 69        	ldr	r3, [r6, #20]
     7a0: 6f 6e        	ldr	r7, [r5, #100]
     7a2: 2d 63        	str	r5, [r5, #48]
     7a4: 6f 6e        	ldr	r7, [r5, #100]
     7a6: 73 74        	strb	r3, [r6, #17]
     7a8: 61 6e        	ldr	r1, [r4, #100]
     7aa: 74 20        	movs	r0, #116
     7ac: 2d 66        	str	r5, [r5, #96]
     7ae: 66 75        	strb	r6, [r4, #21]
     7b0: 6e 63        	str	r6, [r5, #52]
     7b2: 74 69        	ldr	r4, [r6, #20]
     7b4: 6f 6e        	ldr	r7, [r5, #100]
     7b6: 2d 73        	strb	r5, [r5, #12]
     7b8: 65 63        	str	r5, [r4, #52]
     7ba: 74 69        	ldr	r4, [r6, #20]
     7bc: 6f 6e        	ldr	r7, [r5, #100]
     7be: 73 00        	lsls	r3, r6, #1
     7c0: 45 54        	strb	r5, [r0, r1]
     7c2: 48 5f        	ldrsh	r0, [r1, r5]
     7c4: 57 4b        	ldr	r3, [pc, #348]          @ 0x924 <.debug_info+0x924>
     7c6: 55 50        	str	r5, [r2, r1]
     7c8: 5f 49        	ldr	r1, [pc, #380]          @ 0x948 <.debug_info+0x948>
     7ca: 52 51        	str	r2, [r2, r5]
     7cc: 6e 00        	lsls	r6, r5, #1
     7ce: 4f 54        	strb	r7, [r1, r1]
     7d0: 47 5f        	ldrsh	r7, [r0, r5]
     7d2: 48 53        	strh	r0, [r1, r5]
     7d4: 5f 49        	ldr	r1, [pc, #380]          @ 0x954 <.debug_info+0x954>
     7d6: 52 51        	str	r2, [r2, r5]
     7d8: 6e 00        	lsls	r6, r5, #1
     7da: 50 55        	strb	r0, [r2, r5]
     7dc: 50 44        	add	r0, r10
     7de: 52 00        	lsls	r2, r2, #1
     7e0: 41 75        	strb	r1, [r0, #21]
     7e2: 64 69        	ldr	r4, [r4, #20]
     7e4: 6f 43        	muls	r7, r5, r7
     7e6: 61 6c        	ldr	r1, [r4, #68]
     7e8: 6c 62        	str	r4, [r5, #36]
     7ea: 61 63        	str	r1, [r4, #52]
     7ec: 6b 46        	mov	r3, sp
     7ee: 75 6e        	ldr	r5, [r6, #100]
     7f0: 63 74        	strb	r3, [r4, #17]
     7f2: 69 6f        	ldr	r1, [r5, #116]
     7f4: 6e 00        	lsls	r6, r5, #1
     7f6: 53 50        	str	r3, [r2, r1]
     7f8: 49 31        	adds	r1, #73
     7fa: 5f 49        	ldr	r1, [pc, #380]          @ 0x978 <.debug_info+0x978>
     7fc: 52 51        	str	r2, [r2, r5]
     7fe: 6e 00        	lsls	r6, r5, #1
     800: 44 49        	ldr	r1, [pc, #272]          @ 0x914 <.debug_info+0x914>
     802: 53 41        	adcs	r3, r2
     804: 42 4c        	ldr	r4, [pc, #264]          @ 0x910 <.debug_info+0x910>
     806: 45 00        	lsls	r5, r0, #1
     808: 53 56        	ldrsb	r3, [r2, r1]
     80a: 43 61        	str	r3, [r0, #20]
     80c: 6c 6c        	ldr	r4, [r5, #68]
     80e: 5f 49        	ldr	r1, [pc, #380]          @ 0x98c <.debug_info+0x98c>
     810: 52 51        	str	r2, [r2, r5]
     812: 6e 00        	lsls	r6, r5, #1
     814: 42 53        	strh	r2, [r0, r5]
     816: 52 52        	strh	r2, [r2, r1]
     818: 48 00        	lsls	r0, r1, #1
     81a: 42 53        	strh	r2, [r0, r5]
     81c: 52 52        	strh	r2, [r2, r1]
     81e: 4c 00        	lsls	r4, r1, #1
     820: 6d 70        	strb	r5, [r5, #1]
     822: 33 5f        	ldrsh	r3, [r6, r4]
     824: 64 61        	str	r4, [r4, #20]
     826: 74 61        	str	r4, [r6, #20]
     828: 00 45        	cmp	r0, r0
     82a: 52 52        	strh	r2, [r2, r1]
     82c: 5f 4d        	ldr	r5, [pc, #380]          @ 0x9ac <.debug_info+0x9ac>
     82e: 50 33        	adds	r3, #80
     830: 5f 4f        	ldr	r7, [pc, #380]          @ 0x9b0 <.debug_info+0x9b0>
     832: 55 54        	strb	r5, [r2, r1]
     834: 5f 4f        	ldr	r7, [pc, #380]          @ 0x9b4 <.debug_info+0x9b4>
     836: 46 5f        	ldrsh	r6, [r0, r5]
     838: 4d 45        	cmp	r5, r9
     83a: 4d 4f        	ldr	r7, [pc, #308]          @ 0x970 <.debug_info+0x970>
     83c: 52 59        	ldr	r2, [r2, r5]
     83e: 00 46        	mov	r0, r0
     840: 50 55        	strb	r0, [r2, r5]
     842: 5f 49        	ldr	r1, [pc, #380]          @ 0x9c0 <.debug_info+0x9c0>
     844: 52 51        	str	r2, [r2, r5]
     846: 6e 00        	lsls	r6, r5, #1
     848: 55 41        	adcs	r5, r2
     84a: 52 54        	strb	r2, [r2, r1]
     84c: 34 5f        	ldrsh	r4, [r6, r4]
     84e: 49 52        	strh	r1, [r1, r1]
     850: 51 6e        	ldr	r1, [r2, #100]
     852: 00 66        	str	r0, [r0, #96]
     854: 6c 6f        	ldr	r4, [r5, #116]
     856: 61 74        	strb	r1, [r4, #17]
     858: 00 4f        	ldr	r7, [pc, #0]            @ 0x85c <.debug_info+0x85c>
     85a: 54 47        	bx	r10
     85c: 5f 46        	mov	r7, r11
     85e: 53 5f        	ldrsh	r3, [r2, r5]
     860: 57 4b        	ldr	r3, [pc, #348]          @ 0x9c0 <.debug_info+0x9c0>
     862: 55 50        	str	r5, [r2, r1]
     864: 5f 49        	ldr	r1, [pc, #380]          @ 0x9e4 <.debug_info+0x9e4>
     866: 52 51        	str	r2, [r2, r5]
     868: 6e 00        	lsls	r6, r5, #1
     86a: 43 54        	strb	r3, [r0, r1]
     86c: 52 4c        	ldr	r4, [pc, #328]          @ 0x9b8 <.debug_info+0x9b8>
     86e: 00 54        	strb	r0, [r0, r0]
     870: 49 4d        	ldr	r5, [pc, #292]          @ 0x998 <.debug_info+0x998>
     872: 36 5f        	ldrsh	r6, [r6, r4]
     874: 44 41        	adcs	r4, r0
     876: 43 5f        	ldrsh	r3, [r0, r5]
     878: 49 52        	strh	r1, [r1, r1]
     87a: 51 6e        	ldr	r1, [r2, #100]
     87c: 00 5f        	ldrsh	r0, [r0, r4]
     87e: 69 6e        	ldr	r1, [r5, #100]
     880: 69 74        	strb	r1, [r5, #17]
     882: 00 47        	bx	r0
     884: 50 49        	ldr	r1, [pc, #320]          @ 0x9c8 <.debug_info+0x9c8>
     886: 4f 5f        	ldrsh	r7, [r1, r5]
     888: 50 69        	ldr	r0, [r2, #20]
     88a: 6e 41        	adcs	r6, r5
     88c: 46 43        	muls	r6, r0, r6
     88e: 6f 6e        	ldr	r7, [r5, #100]
     890: 66 69        	ldr	r6, [r4, #20]
     892: 67 00        	lsls	r7, r4, #1
     894: 47 50        	str	r7, [r0, r1]
     896: 49 4f        	ldr	r7, [pc, #292]          @ 0x9bc <.debug_info+0x9bc>
     898: 5f 53        	strh	r7, [r3, r5]
     89a: 70 65        	str	r0, [r6, #84]
     89c: 65 64        	str	r5, [r4, #68]
     89e: 00 73        	strb	r0, [r0, #12]
     8a0: 61 6d        	ldr	r1, [r4, #84]
     8a2: 70 72        	strb	r0, [r6, #9]
     8a4: 61 74        	strb	r1, [r4, #17]
     8a6: 65 00        	lsls	r5, r4, #1
     8a8: 49 32        	adds	r2, #73
     8aa: 43 32        	adds	r2, #67
     8ac: 5f 45        	cmp	r7, r11
     8ae: 56 5f        	ldrsh	r6, [r2, r5]
     8b0: 49 52        	strh	r1, [r1, r1]
     8b2: 51 6e        	ldr	r1, [r2, #100]
     8b4: 00 41        	asrs	r0, r0
     8b6: 75 64        	str	r5, [r6, #68]
     8b8: 69 6f        	ldr	r1, [r5, #116]
     8ba: 43 61        	str	r3, [r0, #20]
     8bc: 6c 6c        	ldr	r4, [r5, #68]
     8be: 62 61        	str	r2, [r4, #20]
     8c0: 63 6b        	ldr	r3, [r4, #52]
     8c2: 00 6c        	ldr	r0, [r0, #64]
     8c4: 61 79        	ldrb	r1, [r4, #5]
     8c6: 65 72        	strb	r5, [r4, #9]
     8c8: 00 42        	tst	r0, r0
     8ca: 46 41        	adcs	r6, r0
     8cc: 52 00        	lsls	r2, r2, #1
     8ce: 6f 66        	str	r7, [r5, #100]
     8d0: 66 73        	strb	r6, [r4, #13]
     8d2: 65 74        	strb	r5, [r4, #17]
     8d4: 00 44        	add	r0, r0
     8d6: 4d 41        	adcs	r5, r1
     8d8: 31 5f        	ldrsh	r1, [r6, r4]
     8da: 53 74        	strb	r3, [r2, #17]
     8dc: 72 65        	str	r2, [r6, #84]
     8de: 61 6d        	ldr	r1, [r4, #84]
     8e0: 31 5f        	ldrsh	r1, [r6, r4]
     8e2: 49 52        	strh	r1, [r1, r1]
     8e4: 51 6e        	ldr	r1, [r2, #100]
     8e6: 00 44        	add	r0, r0
     8e8: 4d 41        	adcs	r5, r1
     8ea: 32 5f        	ldrsh	r2, [r6, r4]
     8ec: 53 74        	strb	r3, [r2, #17]
     8ee: 72 65        	str	r2, [r6, #84]
     8f0: 61 6d        	ldr	r1, [r4, #84]
     8f2: 33 5f        	ldrsh	r3, [r6, r4]
     8f4: 49 52        	strh	r1, [r1, r1]
     8f6: 51 6e        	ldr	r1, [r2, #100]
     8f8: 00 43        	orrs	r0, r0
     8fa: 41 4e        	ldr	r6, [pc, #260]          @ 0xa00 <.debug_info+0xa00>
     8fc: 32 5f        	ldrsh	r2, [r6, r4]
     8fe: 54 58        	ldr	r4, [r2, r1]
     900: 5f 49        	ldr	r1, [pc, #380]          @ 0xa80 <.debug_info+0xa80>
     902: 52 51        	str	r2, [r2, r5]
     904: 6e 00        	lsls	r6, r5, #1
     906: 53 79        	ldrb	r3, [r2, #5]
     908: 73 54        	strb	r3, [r6, r1]
     90a: 69 63        	str	r1, [r5, #52]
     90c: 6b 5f        	ldrsh	r3, [r5, r5]
     90e: 54 79        	ldrb	r4, [r2, #5]
     910: 70 65        	str	r0, [r6, #84]
     912: 00 6c        	ldr	r0, [r0, #64]
     914: 6f 6e        	ldr	r7, [r5, #100]
     916: 67 20        	movs	r0, #103
     918: 64 6f        	ldr	r4, [r4, #116]
     91a: 75 62        	str	r5, [r6, #36]
     91c: 6c 65        	str	r4, [r5, #84]
     91e: 00 44        	add	r0, r0
     920: 4d 41        	adcs	r5, r1
     922: 31 5f        	ldrsh	r1, [r6, r4]
     924: 53 74        	strb	r3, [r2, #17]
     926: 72 65        	str	r2, [r6, #84]
     928: 61 6d        	ldr	r1, [r4, #84]
     92a: 30 5f        	ldrsh	r0, [r6, r4]
     92c: 49 52        	strh	r1, [r1, r1]
     92e: 51 6e        	ldr	r1, [r2, #100]
     930: 00 6f        	ldr	r0, [r0, #112]
     932: 75 74        	strb	r5, [r6, #17]
     934: 4f 66        	str	r7, [r1, #100]
     936: 44 61        	str	r4, [r0, #20]
     938: 74 61        	str	r4, [r6, #20]
     93a: 00 52        	strh	r0, [r0, r0]
     93c: 54 43        	muls	r4, r2, r4
     93e: 5f 41        	adcs	r7, r3
     940: 6c 61        	str	r4, [r5, #20]
     942: 72 6d        	ldr	r2, [r6, #84]
     944: 5f 49        	ldr	r1, [pc, #380]          @ 0xac4 <.debug_info+0xac4>
     946: 52 51        	str	r2, [r2, r5]
     948: 6e 00        	lsls	r6, r5, #1
     94a: 4e 56        	ldrsb	r6, [r1, r1]
     94c: 49 43        	muls	r1, r1, r1
     94e: 5f 54        	strb	r7, [r3, r1]
     950: 79 70        	strb	r1, [r7, #1]
     952: 65 00        	lsls	r5, r4, #1
     954: 46 75        	strb	r6, [r0, #21]
     956: 6e 63        	str	r6, [r5, #52]
     958: 74 69        	ldr	r4, [r6, #20]
     95a: 6f 6e        	ldr	r7, [r5, #100]
     95c: 61 6c        	ldr	r1, [r4, #68]
     95e: 53 74        	strb	r3, [r2, #17]
     960: 61 74        	strb	r1, [r4, #17]
     962: 65 00        	lsls	r5, r4, #1
     964: 49 32        	adds	r2, #73
     966: 43 33        	adds	r3, #67
     968: 5f 45        	cmp	r7, r11
     96a: 52 5f        	ldrsh	r2, [r2, r5]
     96c: 49 52        	strh	r1, [r1, r1]
     96e: 51 6e        	ldr	r1, [r2, #100]
     970: 00 43        	orrs	r0, r0
     972: 52 59        	ldr	r2, [r2, r5]
     974: 50 5f        	ldrsh	r0, [r2, r5]
     976: 49 52        	strh	r1, [r1, r1]
     978: 51 6e        	ldr	r1, [r2, #100]
     97a: 00 45        	cmp	r0, r0
     97c: 58 54        	strb	r0, [r3, r1]
     97e: 49 31        	adds	r1, #73
     980: 35 5f        	ldrsh	r5, [r6, r4]
     982: 31 30        	adds	r0, #49
     984: 5f 49        	ldr	r1, [pc, #380]          @ 0xb04 <.debug_info+0xb04>
     986: 52 51        	str	r2, [r2, r5]
     988: 6e 00        	lsls	r6, r5, #1
     98a: 6c 6f        	ldr	r4, [r5, #116]
     98c: 6e 67        	str	r6, [r5, #116]
     98e: 20 6c        	ldr	r0, [r4, #64]
     990: 6f 6e        	ldr	r7, [r5, #100]
     992: 67 20        	movs	r0, #103
     994: 75 6e        	ldr	r5, [r6, #100]
     996: 73 69        	ldr	r3, [r6, #20]
     998: 67 6e        	ldr	r7, [r4, #100]
     99a: 65 64        	str	r5, [r4, #68]
     99c: 20 69        	ldr	r0, [r4, #16]
     99e: 6e 74        	strb	r6, [r5, #17]
     9a0: 00 47        	bx	r0
     9a2: 50 49        	ldr	r1, [pc, #320]          @ 0xae4 <.debug_info+0xae4>
     9a4: 4f 5f        	ldrsh	r7, [r1, r5]
     9a6: 52 65        	str	r2, [r2, #84]
     9a8: 73 65        	str	r3, [r6, #84]
     9aa: 74 42        	rsbs	r4, r6, #0
     9ac: 69 74        	strb	r1, [r5, #17]
     9ae: 73 00        	lsls	r3, r6, #1
     9b0: 54 49        	ldr	r1, [pc, #336]          @ 0xb04 <.debug_info+0xb04>
     9b2: 4d 33        	adds	r3, #77
     9b4: 5f 49        	ldr	r1, [pc, #380]          @ 0xb34 <.debug_info+0xb34>
     9b6: 52 51        	str	r2, [r2, r5]
     9b8: 6e 00        	lsls	r6, r5, #1
     9ba: 55 53        	strh	r5, [r2, r5]
     9bc: 41 52        	strh	r1, [r0, r1]
     9be: 54 31        	adds	r1, #84
     9c0: 5f 49        	ldr	r1, [pc, #380]          @ 0xb40 <.debug_info+0xb40>
     9c2: 52 51        	str	r2, [r2, r5]
     9c4: 6e 00        	lsls	r6, r5, #1
     9c6: 47 50        	str	r7, [r0, r1]
     9c8: 49 4f        	ldr	r7, [pc, #292]          @ 0xaf0 <.debug_info+0xaf0>
     9ca: 5f 49        	ldr	r1, [pc, #380]          @ 0xb48 <.debug_info+0xb48>
     9cc: 6e 69        	ldr	r6, [r5, #20]
     9ce: 74 53        	strh	r4, [r6, r5]
     9d0: 74 72        	strb	r4, [r6, #9]
     9d2: 75 63        	str	r5, [r6, #52]
     9d4: 74 75        	strb	r4, [r6, #21]
     9d6: 72 65        	str	r2, [r6, #84]
     9d8: 00 47        	bx	r0
     9da: 50 49        	ldr	r1, [pc, #320]          @ 0xb1c <.debug_info+0xb1c>
     9dc: 4f 5f        	ldrsh	r7, [r1, r5]
     9de: 4d 6f        	ldr	r5, [r1, #116]
     9e0: 64 65        	str	r4, [r4, #84]
     9e2: 00 55        	strb	r0, [r0, r4]
     9e4: 53 41        	adcs	r3, r2
     9e6: 52 54        	strb	r2, [r2, r1]
     9e8: 5f 43        	muls	r7, r3, r7
     9ea: 6d 64        	str	r5, [r5, #68]
     9ec: 00 43        	orrs	r0, r0
     9ee: 41 4e        	ldr	r6, [pc, #260]          @ 0xaf4 <.debug_info+0xaf4>
     9f0: 32 5f        	ldrsh	r2, [r6, r4]
     9f2: 52 58        	ldr	r2, [r2, r1]
     9f4: 31 5f        	ldrsh	r1, [r6, r4]
     9f6: 49 52        	strh	r1, [r1, r1]
     9f8: 51 6e        	ldr	r1, [r2, #100]
     9fa: 00 41        	asrs	r0, r0
     9fc: 44 43        	muls	r4, r0, r4
     9fe: 5f 49        	ldr	r1, [pc, #380]          @ 0xb7c <.debug_info+0xb7c>
     a00: 52 51        	str	r2, [r2, r5]
     a02: 6e 00        	lsls	r6, r5, #1
     a04: 49 43        	muls	r1, r1, r1
     a06: 45 52        	strh	r5, [r0, r1]
     a08: 00 76        	strb	r0, [r0, #24]
     a0a: 65 72        	strb	r5, [r4, #9]
     a0c: 73 69        	ldr	r3, [r6, #20]
     a0e: 6f 6e        	ldr	r7, [r5, #100]
     a10: 00 47        	bx	r0
     a12: 50 49        	ldr	r1, [pc, #320]          @ 0xb54 <.debug_info+0xb54>
     a14: 4f 4d        	ldr	r5, [pc, #316]          @ 0xb54 <.debug_info+0xb54>
     a16: 6f 64        	str	r7, [r5, #68]
     a18: 65 5f        	ldrsh	r5, [r4, r5]
     a1a: 54 79        	ldrb	r4, [r2, #5]
     a1c: 70 65        	str	r0, [r6, #84]
     a1e: 44 65        	str	r4, [r0, #84]
     a20: 66 00        	lsls	r6, r4, #1
     a22: 5f 5f        	ldrsh	r7, [r3, r5]
     a24: 69 6e        	ldr	r1, [r5, #100]
     a26: 74 31        	adds	r1, #116
     a28: 36 5f        	ldrsh	r6, [r6, r4]
     a2a: 74 00        	lsls	r4, r6, #1
     a2c: 53 79        	ldrb	r3, [r2, #5]
     a2e: 73 54        	strb	r3, [r6, r1]
     a30: 69 63        	str	r1, [r5, #52]
     a32: 6b 5f        	ldrsh	r3, [r5, r5]
     a34: 43 6f        	ldr	r3, [r0, #116]
     a36: 6e 66        	str	r6, [r5, #100]
     a38: 69 67        	str	r1, [r5, #116]
     a3a: 00 55        	strb	r0, [r0, r4]
     a3c: 53 41        	adcs	r3, r2
     a3e: 52 54        	strb	r2, [r2, r1]
     a40: 5f 49        	ldr	r1, [pc, #380]          @ 0xbc0 <.debug_info+0xbc0>
     a42: 6e 69        	ldr	r6, [r5, #20]
     a44: 74 54        	strb	r4, [r6, r1]
     a46: 79 70        	strb	r1, [r7, #1]
     a48: 65 44        	add	r5, r12
     a4a: 65 66        	str	r5, [r4, #100]
     a4c: 00 50        	str	r0, [r0, r0]
     a4e: 56 44        	add	r6, r10
     a50: 5f 49        	ldr	r1, [pc, #380]          @ 0xbd0 <.debug_info+0xbd0>
     a52: 52 51        	str	r2, [r2, r5]
     a54: 6e 00        	lsls	r6, r5, #1
     a56: 41 46        	mov	r1, r8
     a58: 53 52        	strh	r3, [r2, r1]
     a5a: 00 4f        	ldr	r7, [pc, #0]            @ 0xa5c <.debug_info+0xa5c>
     a5c: 54 59        	ldr	r4, [r2, r5]
     a5e: 50 45        	cmp	r0, r10
     a60: 52 00        	lsls	r2, r2, #1
     a62: 43 41        	adcs	r3, r0
     a64: 4c 49        	ldr	r1, [pc, #304]          @ 0xb98 <.debug_info+0xb98>
     a66: 42 00        	lsls	r2, r0, #1
     a68: 2f 55        	strb	r7, [r5, r4]
     a6a: 73 65        	str	r3, [r6, #84]
     a6c: 72 73        	strb	r2, [r6, #13]
     a6e: 2f 73        	strb	r7, [r5, #12]
     a70: 61 6d        	ldr	r1, [r4, #84]
     a72: 64 65        	str	r4, [r4, #84]
     a74: 74 6f        	ldr	r4, [r6, #116]
     a76: 72 2f        	cmp	r7, #114
     a78: 53 54        	strb	r3, [r2, r1]
     a7a: 4d 33        	adds	r3, #77
     a7c: 32 46        	mov	r2, r6
     a7e: 34 5f        	ldrsh	r4, [r6, r4]
     a80: 44 69        	ldr	r4, [r0, #20]
     a82: 73 63        	str	r3, [r6, #52]
     a84: 6f 76        	strb	r7, [r5, #25]
     a86: 65 72        	strb	r5, [r4, #9]
     a88: 79 5f        	ldrsh	r1, [r7, r5]
     a8a: 4d 50        	str	r5, [r1, r1]
     a8c: 33 00        	movs	r3, r6
     a8e: 6e 43        	muls	r6, r5, r6
     a90: 68 61        	str	r0, [r5, #20]
     a92: 6e 73        	strb	r6, [r5, #13]
     a94: 00 46        	mov	r0, r0
     a96: 53 4d        	ldr	r5, [pc, #332]          @ 0xbe4 <.debug_info+0xbe4>
     a98: 43 5f        	ldrsh	r3, [r0, r5]
     a9a: 49 52        	strh	r1, [r1, r1]
     a9c: 51 6e        	ldr	r1, [r2, #100]
     a9e: 00 45        	cmp	r0, r0
     aa0: 58 54        	strb	r0, [r3, r1]
     aa2: 49 30        	adds	r0, #73
     aa4: 5f 49        	ldr	r1, [pc, #380]          @ 0xc24 <.debug_info+0xc24>
     aa6: 52 51        	str	r2, [r2, r5]
     aa8: 6e 00        	lsls	r6, r5, #1
     aaa: 43 46        	mov	r3, r8
     aac: 53 52        	strh	r3, [r2, r1]
     aae: 00 44        	add	r0, r0
     ab0: 4d 41        	adcs	r5, r1
     ab2: 31 5f        	ldrsh	r1, [r6, r4]
     ab4: 53 74        	strb	r3, [r2, #17]
     ab6: 72 65        	str	r2, [r6, #84]
     ab8: 61 6d        	ldr	r1, [r4, #84]
     aba: 34 5f        	ldrsh	r4, [r6, r4]
     abc: 49 52        	strh	r1, [r1, r1]
     abe: 51 6e        	ldr	r1, [r2, #100]
     ac0: 00 44        	add	r0, r0
     ac2: 4d 41        	adcs	r5, r1
     ac4: 32 5f        	ldrsh	r2, [r6, r4]
     ac6: 53 74        	strb	r3, [r2, #17]
     ac8: 72 65        	str	r2, [r6, #84]
     aca: 61 6d        	ldr	r1, [r4, #84]
     acc: 36 5f        	ldrsh	r6, [r6, r4]
     ace: 49 52        	strh	r1, [r1, r1]
     ad0: 51 6e        	ldr	r1, [r2, #100]
     ad2: 00 4c        	ldr	r4, [pc, #0]            @ 0xad4 <.debug_info+0xad4>
     ad4: 4f 41        	adcs	r7, r1
     ad6: 44 00        	lsls	r4, r0, #1
     ad8: 47 50        	str	r7, [r0, r1]
     ada: 49 4f        	ldr	r7, [pc, #292]          @ 0xc00 <.debug_info+0xc00>
     adc: 5f 53        	strh	r7, [r3, r5]
     ade: 70 65        	str	r0, [r6, #84]
     ae0: 65 64        	str	r5, [r4, #68]
     ae2: 5f 32        	adds	r2, #95
     ae4: 4d 48        	ldr	r0, [pc, #308]          @ 0xc1c <.debug_info+0xc1c>
     ae6: 7a 00        	lsls	r2, r7, #1
     ae8: 47 50        	str	r7, [r0, r1]
     aea: 49 4f        	ldr	r7, [pc, #292]          @ 0xc10 <.debug_info+0xc10>
     aec: 53 70        	strb	r3, [r2, #1]
     aee: 65 65        	str	r5, [r4, #84]
     af0: 64 5f        	ldrsh	r4, [r4, r5]
     af2: 54 79        	ldrb	r4, [r2, #5]
     af4: 70 65        	str	r0, [r6, #84]
     af6: 44 65        	str	r4, [r0, #84]
     af8: 66 00        	lsls	r6, r4, #1
     afa: 44 65        	str	r4, [r0, #84]
     afc: 62 75        	strb	r2, [r4, #21]
     afe: 67 4d        	ldr	r5, [pc, #412]          @ 0xc9c <.debug_info+0xc9c>
     b00: 6f 6e        	ldr	r7, [r5, #100]
     b02: 69 74        	strb	r1, [r5, #17]
     b04: 6f 72        	strb	r7, [r5, #9]
     b06: 5f 49        	ldr	r1, [pc, #380]          @ 0xc84 <.debug_info+0xc84>
     b08: 52 51        	str	r2, [r2, r5]
     b0a: 6e 00        	lsls	r6, r5, #1
     b0c: 47 50        	str	r7, [r0, r1]
     b0e: 49 4f        	ldr	r7, [pc, #292]          @ 0xc34 <.debug_info+0xc34>
     b10: 5f 50        	str	r7, [r3, r1]
     b12: 69 6e        	ldr	r1, [r5, #100]
     b14: 00 49        	ldr	r1, [pc, #0]            @ 0xb18 <.debug_info+0xb18>
     b16: 32 43        	orrs	r2, r6
     b18: 33 5f        	ldrsh	r3, [r6, r4]
     b1a: 45 56        	ldrsb	r5, [r0, r1]
     b1c: 5f 49        	ldr	r1, [pc, #380]          @ 0xc9c <.debug_info+0xc9c>
     b1e: 52 51        	str	r2, [r2, r5]
     b20: 6e 00        	lsls	r6, r5, #1
     b22: 47 50        	str	r7, [r0, r1]
     b24: 49 4f        	ldr	r7, [pc, #292]          @ 0xc4c <.debug_info+0xc4c>
     b26: 5f 50        	str	r7, [r3, r1]
     b28: 75 50        	str	r5, [r6, r1]
     b2a: 64 00        	lsls	r4, r4, #1
     b2c: 45 54        	strb	r5, [r0, r1]
     b2e: 48 5f        	ldrsh	r0, [r1, r5]
     b30: 49 52        	strh	r1, [r1, r1]
     b32: 51 6e        	ldr	r1, [r2, #100]
     b34: 00 6f        	ldr	r0, [r0, #112]
     b36: 75 74        	strb	r5, [r6, #17]
     b38: 70 75        	strb	r0, [r6, #21]
     b3a: 74 53        	strh	r4, [r6, r5]
     b3c: 61 6d        	ldr	r1, [r4, #84]
     b3e: 70 73        	strb	r0, [r6, #13]
     b40: 00 4d        	ldr	r5, [pc, #0]            @ 0xb44 <.debug_info+0xb44>
     b42: 4d 46        	mov	r5, r9
     b44: 52 00        	lsls	r2, r2, #1
     b46: 4d 4d        	ldr	r5, [pc, #308]          @ 0xc7c <.debug_info+0xc7c>
     b48: 46 41        	adcs	r6, r0
     b4a: 52 00        	lsls	r2, r2, #1
     b4c: 73 68        	ldr	r3, [r6, #4]
     b4e: 6f 72        	strb	r7, [r5, #9]
     b50: 74 20        	movs	r0, #116
     b52: 69 6e        	ldr	r1, [r5, #100]
     b54: 74 00        	lsls	r4, r6, #1
     b56: 45 52        	strh	r5, [r0, r1]
     b58: 52 5f        	ldrsh	r2, [r2, r5]
     b5a: 4d 50        	str	r5, [r1, r1]
     b5c: 33 5f        	ldrsh	r3, [r6, r4]
     b5e: 4e 4f        	ldr	r7, [pc, #312]          @ 0xc98 <.debug_info+0xc98>
     b60: 4e 45        	cmp	r6, r9
     b62: 00 52        	strh	r0, [r0, r0]
     b64: 43 43        	muls	r3, r0, r3
     b66: 5f 49        	ldr	r1, [pc, #380]          @ 0xce4 <.debug_info+0xce4>
     b68: 52 51        	str	r2, [r2, r5]
     b6a: 6e 00        	lsls	r6, r5, #1
     b6c: 70 72        	strb	r0, [r6, #9]
     b6e: 69 6f        	ldr	r1, [r5, #116]
     b70: 72 69        	ldr	r2, [r6, #20]
     b72: 74 79        	ldrb	r4, [r6, #5]
     b74: 00 62        	str	r0, [r0, #32]
     b76: 79 74        	strb	r1, [r7, #17]
     b78: 65 73        	strb	r5, [r4, #13]
     b7a: 5f 6c        	ldr	r7, [r3, #68]
     b7c: 65 66        	str	r5, [r4, #100]
     b7e: 74 00        	lsls	r4, r6, #1
     b80: 49 53        	strh	r1, [r1, r5]
     b82: 41 52        	strh	r1, [r0, r1]
     b84: 00 4d        	ldr	r5, [pc, #0]            @ 0xb88 <.debug_info+0xb88>
     b86: 50 33        	adds	r3, #80
     b88: 47 65        	str	r7, [r0, #84]
     b8a: 74 4c        	ldr	r4, [pc, #464]          @ 0xd5c <.debug_info+0xd5c>
     b8c: 61 73        	strb	r1, [r4, #13]
     b8e: 74 46        	mov	r4, lr
     b90: 72 61        	str	r2, [r6, #20]
     b92: 6d 65        	str	r5, [r5, #84]
     b94: 49 6e        	ldr	r1, [r1, #100]
     b96: 66 6f        	ldr	r6, [r4, #116]
     b98: 00 44        	add	r0, r0
     b9a: 4d 41        	adcs	r5, r1
     b9c: 31 5f        	ldrsh	r1, [r6, r4]
     b9e: 53 74        	strb	r3, [r2, #17]
     ba0: 72 65        	str	r2, [r6, #84]
     ba2: 61 6d        	ldr	r1, [r4, #84]
     ba4: 33 5f        	ldrsh	r3, [r6, r4]
     ba6: 49 52        	strh	r1, [r1, r1]
     ba8: 51 6e        	ldr	r1, [r2, #100]
     baa: 00 45        	cmp	r0, r0
     bac: 4e 41        	adcs	r6, r1
     bae: 42 4c        	ldr	r4, [pc, #264]          @ 0xcb8 <.debug_info+0xcb8>
     bb0: 45 00        	lsls	r5, r0, #1
     bb2: 45 52        	strh	r5, [r0, r1]
     bb4: 52 5f        	ldrsh	r2, [r2, r5]
     bb6: 4d 50        	str	r5, [r1, r1]
     bb8: 33 5f        	ldrsh	r3, [r6, r4]
     bba: 49 4e        	ldr	r6, [pc, #292]          @ 0xce0 <.debug_info+0xce0>
     bbc: 56 41        	adcs	r6, r2
     bbe: 4c 49        	ldr	r1, [pc, #304]          @ 0xcf0 <.debug_info+0xcf0>
     bc0: 44 5f        	ldrsh	r4, [r0, r5]
     bc2: 46 52        	strh	r6, [r0, r1]
     bc4: 41 4d        	ldr	r5, [pc, #260]          @ 0xccc <.debug_info+0xccc>
     bc6: 45 48        	ldr	r0, [pc, #276]          @ 0xcdc <.debug_info+0xcdc>
     bc8: 45 41        	adcs	r5, r0
     bca: 44 45        	cmp	r4, r8
     bcc: 52 00        	lsls	r2, r2, #1
     bce: 76 6f        	ldr	r6, [r6, #116]
     bd0: 6c 75        	strb	r4, [r5, #21]
     bd2: 6d 65        	str	r5, [r5, #84]
     bd4: 00 47        	bx	r0
     bd6: 50 49        	ldr	r1, [pc, #320]          @ 0xd18 <.debug_info+0xd18>
     bd8: 4f 5f        	ldrsh	r7, [r1, r5]
     bda: 54 79        	ldrb	r4, [r2, #5]
     bdc: 70 65        	str	r0, [r6, #84]
     bde: 44 65        	str	r4, [r0, #84]
     be0: 66 00        	lsls	r6, r4, #1
     be2: 54 49        	ldr	r1, [pc, #336]          @ 0xd34 <.debug_info+0xd34>
     be4: 4d 31        	adds	r1, #77
     be6: 5f 55        	strb	r7, [r3, r5]
     be8: 50 5f        	ldrsh	r0, [r2, r5]
     bea: 54 49        	ldr	r1, [pc, #336]          @ 0xd3c <.debug_info+0xd3c>
     bec: 4d 31        	adds	r1, #77
     bee: 30 5f        	ldrsh	r0, [r6, r4]
     bf0: 49 52        	strh	r1, [r1, r1]
     bf2: 51 6e        	ldr	r1, [r2, #100]
     bf4: 00 49        	ldr	r1, [pc, #0]            @ 0xbf8 <.debug_info+0xbf8>
     bf6: 54 4d        	ldr	r5, [pc, #336]          @ 0xd48 <.debug_info+0xd48>
     bf8: 5f 52        	strh	r7, [r3, r1]
     bfa: 78 42        	rsbs	r0, r7, #0
     bfc: 75 66        	str	r5, [r6, #100]
     bfe: 66 65        	str	r6, [r4, #84]
     c00: 72 00        	lsls	r2, r6, #1
     c02: 45 52        	strh	r5, [r0, r1]
     c04: 52 5f        	ldrsh	r2, [r2, r5]
     c06: 4d 50        	str	r5, [r1, r1]
     c08: 33 5f        	ldrsh	r3, [r6, r4]
     c0a: 4d 41        	adcs	r5, r1
     c0c: 49 4e        	ldr	r6, [pc, #292]          @ 0xd34 <.debug_info+0xd34>
     c0e: 44 41        	adcs	r4, r0
     c10: 54 41        	adcs	r4, r2
     c12: 5f 55        	strb	r7, [r3, r5]
     c14: 4e 44        	add	r6, r9
     c16: 45 52        	strh	r5, [r0, r1]
     c18: 46 4c        	ldr	r4, [pc, #280]          @ 0xd34 <.debug_info+0xd34>
     c1a: 4f 57        	ldrsb	r7, [r1, r5]
     c1c: 00 6d        	ldr	r0, [r0, #80]
     c1e: 61 69        	ldr	r1, [r4, #20]
     c20: 6e 00        	lsls	r6, r5, #1
     c22: 55 53        	strh	r5, [r2, r5]
     c24: 41 52        	strh	r1, [r0, r1]
     c26: 54 5f        	ldrsh	r4, [r2, r5]
     c28: 50 61        	str	r0, [r2, #20]
     c2a: 72 69        	ldr	r2, [r6, #20]
     c2c: 74 79        	ldrb	r4, [r6, #5]
     c2e: 00 4f        	ldr	r7, [pc, #0]            @ 0xc30 <.debug_info+0xc30>
     c30: 54 47        	bx	r10
     c32: 5f 48        	ldr	r0, [pc, #380]          @ 0xdb0 <.debug_info+0xdb0>
     c34: 53 5f        	ldrsh	r3, [r2, r5]
     c36: 45 50        	str	r5, [r0, r1]
     c38: 31 5f        	ldrsh	r1, [r6, r4]
     c3a: 4f 55        	strb	r7, [r1, r5]
     c3c: 54 5f        	ldrsh	r4, [r2, r5]
     c3e: 49 52        	strh	r1, [r1, r1]
     c40: 51 6e        	ldr	r1, [r2, #100]
     c42: 00 47        	bx	r0
     c44: 50 49        	ldr	r1, [pc, #320]          @ 0xd88 <.debug_info+0xd88>
     c46: 4f 5f        	ldrsh	r7, [r1, r5]
     c48: 53 65        	str	r3, [r2, #84]
     c4a: 74 42        	rsbs	r4, r6, #0
     c4c: 69 74        	strb	r1, [r5, #17]
     c4e: 73 00        	lsls	r3, r6, #1
     c50: 68 4d        	ldr	r5, [pc, #416]          @ 0xdf4 <.debug_info+0xdf4>
     c52: 50 33        	adds	r3, #80
     c54: 44 65        	str	r4, [r0, #84]
     c56: 63 6f        	ldr	r3, [r4, #116]
     c58: 64 65        	str	r4, [r4, #84]
     c5a: 72 00        	lsls	r2, r6, #1
     c5c: 45 52        	strh	r5, [r0, r1]
     c5e: 52 5f        	ldrsh	r2, [r2, r5]
     c60: 4d 50        	str	r5, [r1, r1]
     c62: 33 5f        	ldrsh	r3, [r6, r4]
     c64: 49 4e        	ldr	r6, [pc, #292]          @ 0xd8c <.debug_info+0xd8c>
     c66: 44 41        	adcs	r4, r0
     c68: 54 41        	adcs	r4, r2
     c6a: 5f 55        	strb	r7, [r3, r5]
     c6c: 4e 44        	add	r6, r9
     c6e: 45 52        	strh	r5, [r0, r1]
     c70: 46 4c        	ldr	r4, [pc, #280]          @ 0xd8c <.debug_info+0xd8c>
     c72: 4f 57        	ldrsb	r7, [r1, r5]
     c74: 00 4d        	ldr	r5, [pc, #0]            @ 0xc78 <.debug_info+0xc78>
     c76: 4f 44        	add	r7, r9
     c78: 45 52        	strh	r5, [r0, r1]
     c7a: 00 4e        	ldr	r6, [pc, #0]            @ 0xc7c <.debug_info+0xc7c>
     c7c: 56 49        	ldr	r1, [pc, #344]          @ 0xdd8 <.debug_info+0xdd8>
     c7e: 43 5f        	ldrsh	r3, [r0, r5]
     c80: 53 65        	str	r3, [r2, #84]
     c82: 74 50        	str	r4, [r6, r1]
     c84: 72 69        	ldr	r2, [r6, #20]
     c86: 6f 72        	strb	r7, [r5, #9]
     c88: 69 74        	strb	r1, [r5, #17]
     c8a: 79 00        	lsls	r1, r7, #1
     c8c: 43 41        	adcs	r3, r0
     c8e: 4e 31        	adds	r1, #78
     c90: 5f 52        	strh	r7, [r3, r1]
     c92: 58 31        	adds	r1, #88
     c94: 5f 49        	ldr	r1, [pc, #380]          @ 0xe14 <.debug_info+0xe14>
     c96: 52 51        	str	r2, [r2, r5]
     c98: 6e 00        	lsls	r6, r5, #1
     c9a: 55 53        	strh	r5, [r2, r5]
     c9c: 41 52        	strh	r1, [r0, r1]
     c9e: 54 5f        	ldrsh	r4, [r2, r5]
     ca0: 48 61        	str	r0, [r1, #20]
     ca2: 72 64        	str	r2, [r6, #68]
     ca4: 77 61        	str	r7, [r6, #20]
     ca6: 72 65        	str	r2, [r6, #84]
     ca8: 46 6c        	ldr	r6, [r0, #68]
     caa: 6f 77        	strb	r7, [r5, #29]
     cac: 43 6f        	ldr	r3, [r0, #116]
     cae: 6e 74        	strb	r6, [r5, #17]
     cb0: 72 6f        	ldr	r2, [r6, #116]
     cb2: 6c 00        	lsls	r4, r5, #1
     cb4: 47 50        	str	r7, [r0, r1]
     cb6: 49 4f        	ldr	r7, [pc, #292]          @ 0xddc <.debug_info+0xddc>
     cb8: 5f 50        	str	r7, [r3, r1]
     cba: 75 50        	str	r5, [r6, r1]
     cbc: 64 5f        	ldrsh	r4, [r4, r5]
     cbe: 55 50        	str	r5, [r2, r1]
     cc0: 00 45        	cmp	r0, r0
     cc2: 58 54        	strb	r0, [r3, r1]
     cc4: 49 39        	subs	r1, #73
     cc6: 5f 35        	adds	r5, #95
     cc8: 5f 49        	ldr	r1, [pc, #380]          @ 0xe48 <.debug_info+0xe48>
     cca: 52 51        	str	r2, [r2, r5]
     ccc: 6e 00        	lsls	r6, r5, #1
     cce: 45 52        	strh	r5, [r0, r1]
     cd0: 52 5f        	ldrsh	r2, [r2, r5]
     cd2: 4d 50        	str	r5, [r1, r1]
     cd4: 33 5f        	ldrsh	r3, [r6, r4]
     cd6: 49 4e        	ldr	r6, [pc, #292]          @ 0xdfc <.debug_info+0xdfc>
     cd8: 56 41        	adcs	r6, r2
     cda: 4c 49        	ldr	r1, [pc, #304]          @ 0xe0c <.debug_info+0xe0c>
     cdc: 44 5f        	ldrsh	r4, [r0, r5]
     cde: 53 49        	ldr	r1, [pc, #332]          @ 0xe2c <.debug_info+0xe2c>
     ce0: 44 45        	cmp	r4, r8
     ce2: 49 4e        	ldr	r6, [pc, #292]          @ 0xe08 <.debug_info+0xe08>
     ce4: 46 4f        	ldr	r7, [pc, #280]          @ 0xe00 <.debug_info+0xe00>
     ce6: 00 52        	strh	r0, [r0, r0]
     ce8: 43 43        	muls	r3, r0, r3
     cea: 5f 41        	adcs	r7, r3
     cec: 48 42        	rsbs	r0, r1, #0
     cee: 31 50        	str	r1, [r6, r0]
     cf0: 65 72        	strb	r5, [r4, #9]
     cf2: 69 70        	strb	r1, [r5, #1]
     cf4: 68 43        	muls	r0, r5, r0
     cf6: 6c 6f        	ldr	r4, [r5, #116]
     cf8: 63 6b        	ldr	r3, [r4, #52]
     cfa: 43 6d        	ldr	r3, [r0, #84]
     cfc: 64 00        	lsls	r4, r4, #1
     cfe: 45 58        	ldr	r5, [r0, r1]
     d00: 54 49        	ldr	r1, [pc, #336]          @ 0xe54 <.debug_info+0xe54>
     d02: 34 5f        	ldrsh	r4, [r6, r4]
     d04: 49 52        	strh	r1, [r1, r1]
     d06: 51 6e        	ldr	r1, [r2, #100]
     d08: 00 73        	strb	r0, [r0, #12]
     d0a: 68 6f        	ldr	r0, [r5, #116]
     d0c: 72 74        	strb	r2, [r6, #17]
     d0e: 20 75        	strb	r0, [r4, #20]
     d10: 6e 73        	strb	r6, [r5, #13]
     d12: 69 67        	str	r1, [r5, #116]
     d14: 6e 65        	str	r6, [r5, #84]
     d16: 64 20        	movs	r0, #100
     d18: 69 6e        	ldr	r1, [r5, #100]
     d1a: 74 00        	lsls	r4, r6, #1
     d1c: 54 49        	ldr	r1, [pc, #336]          @ 0xe70 <.debug_info+0xe70>
     d1e: 4d 38        	subs	r0, #77
     d20: 5f 43        	muls	r7, r3, r7
     d22: 43 5f        	ldrsh	r3, [r0, r5]
     d24: 49 52        	strh	r1, [r1, r1]
     d26: 51 6e        	ldr	r1, [r2, #100]
     d28: 00 53        	strh	r0, [r0, r4]
     d2a: 44 49        	ldr	r1, [pc, #272]          @ 0xe3c <.debug_info+0xe3c>
     d2c: 4f 5f        	ldrsh	r7, [r1, r5]
     d2e: 49 52        	strh	r1, [r1, r1]
     d30: 51 6e        	ldr	r1, [r2, #100]
     d32: 00 43        	orrs	r0, r0
     d34: 50 41        	adcs	r0, r2
     d36: 43 52        	strh	r3, [r0, r1]
     d38: 00 62        	str	r0, [r0, #32]
     d3a: 69 74        	strb	r1, [r5, #17]
     d3c: 72 61        	str	r2, [r6, #20]
     d3e: 74 65        	str	r4, [r6, #84]
     d40: 00 49        	ldr	r1, [pc, #0]            @ 0xd44 <.debug_info+0xd44>
     d42: 53 50        	str	r3, [r2, r1]
     d44: 52 00        	lsls	r2, r2, #1
     d46: 45 58        	ldr	r5, [r0, r1]
     d48: 54 49        	ldr	r1, [pc, #336]          @ 0xe9c <.debug_info+0xe9c>
     d4a: 33 5f        	ldrsh	r3, [r6, r4]
     d4c: 49 52        	strh	r1, [r1, r1]
     d4e: 51 6e        	ldr	r1, [r2, #100]
     d50: 00 50        	str	r0, [r0, r0]
     d52: 65 6e        	ldr	r5, [r4, #100]
     d54: 64 53        	strh	r4, [r4, r5]
     d56: 56 5f        	ldrsh	r6, [r2, r5]
     d58: 49 52        	strh	r1, [r1, r1]
     d5a: 51 6e        	ldr	r1, [r2, #100]
     d5c: 00 4f        	ldr	r7, [pc, #0]            @ 0xd60 <.debug_info+0xd60>
     d5e: 54 47        	bx	r10
     d60: 5f 48        	ldr	r0, [pc, #380]          @ 0xee0 <.debug_info+0xee0>
     d62: 53 5f        	ldrsh	r3, [r2, r5]
     d64: 45 50        	str	r5, [r0, r1]
     d66: 31 5f        	ldrsh	r1, [r6, r4]
     d68: 49 4e        	ldr	r6, [pc, #292]          @ 0xe90 <.debug_info+0xe90>
     d6a: 5f 49        	ldr	r1, [pc, #380]          @ 0xee8 <.debug_info+0xee8>
     d6c: 52 51        	str	r2, [r2, r5]
     d6e: 6e 00        	lsls	r6, r5, #1
     d70: 44 4d        	ldr	r5, [pc, #272]          @ 0xe84 <.debug_info+0xe84>
     d72: 41 31        	adds	r1, #65
     d74: 5f 53        	strh	r7, [r3, r5]
     d76: 74 72        	strb	r4, [r6, #9]
     d78: 65 61        	str	r5, [r4, #20]
     d7a: 6d 37        	adds	r7, #109
     d7c: 5f 49        	ldr	r1, [pc, #380]          @ 0xefc <.debug_info+0xefc>
     d7e: 52 51        	str	r2, [r2, r5]
     d80: 6e 00        	lsls	r6, r5, #1
     d82: 5f 5f        	ldrsh	r7, [r3, r5]
     d84: 69 6e        	ldr	r1, [r5, #100]
     d86: 74 33        	adds	r3, #116
     d88: 32 5f        	ldrsh	r2, [r6, r4]
     d8a: 74 00        	lsls	r4, r6, #1
     d8c: 49 53        	strh	r1, [r1, r5]
     d8e: 45 52        	strh	r5, [r0, r1]
     d90: 00 45        	cmp	r0, r0
     d92: 52 52        	strh	r2, [r2, r1]
     d94: 5f 55        	strb	r7, [r3, r5]
     d96: 4e 4b        	ldr	r3, [pc, #312]          @ 0xed0 <.debug_info+0xed0>
     d98: 4e 4f        	ldr	r7, [pc, #312]          @ 0xed4 <.debug_info+0xed4>
     d9a: 57 4e        	ldr	r6, [pc, #348]          @ 0xef8 <.debug_info+0xef8>
     d9c: 00 50        	str	r0, [r0, r0]
     d9e: 6c 61        	str	r4, [r5, #20]
     da0: 79 41        	adcs	r1, r7
     da2: 75 64        	str	r5, [r6, #68]
     da4: 69 6f        	ldr	r1, [r5, #116]
     da6: 57 69        	ldr	r7, [r2, #20]
     da8: 74 68        	ldr	r4, [r6, #4]
     daa: 43 61        	str	r3, [r0, #20]
     dac: 6c 6c        	ldr	r4, [r5, #68]
     dae: 62 61        	str	r2, [r4, #20]
     db0: 63 6b        	ldr	r3, [r4, #52]
     db2: 00 6d        	ldr	r0, [r0, #80]
     db4: 70 33        	adds	r3, #112
     db6: 46 72        	strb	r6, [r0, #9]
     db8: 61 6d        	ldr	r1, [r4, #84]
     dba: 65 49        	ldr	r1, [pc, #404]          @ 0xf50 <.debug_info+0xf50>
     dbc: 6e 66        	str	r6, [r5, #100]
     dbe: 6f 00        	lsls	r7, r5, #1
     dc0: 44 4d        	ldr	r5, [pc, #272]          @ 0xed4 <.debug_info+0xed4>
     dc2: 41 32        	adds	r2, #65
     dc4: 5f 53        	strh	r7, [r3, r5]
     dc6: 74 72        	strb	r4, [r6, #9]
     dc8: 65 61        	str	r5, [r4, #20]
     dca: 6d 32        	adds	r2, #109
     dcc: 5f 49        	ldr	r1, [pc, #380]          @ 0xf4c <.debug_info+0xf4c>
     dce: 52 51        	str	r2, [r2, r5]
     dd0: 6e 00        	lsls	r6, r5, #1
     dd2: 70 6c        	ldr	r0, [r6, #68]
     dd4: 6c 6e        	ldr	r4, [r5, #100]
     dd6: 00 4d        	ldr	r5, [pc, #0]            @ 0xdd8 <.debug_info+0xdd8>
     dd8: 31 41        	asrs	r1, r6
     dda: 52 00        	lsls	r2, r2, #1
     ddc: 70 6c        	ldr	r0, [r6, #68]
     dde: 6c 72        	strb	r4, [r5, #9]
     de0: 00 4e        	ldr	r6, [pc, #0]            @ 0xde4 <.debug_info+0xde4>
     de2: 56 49        	ldr	r1, [pc, #344]          @ 0xf3c <.debug_info+0xf3c>
     de4: 43 5f        	ldrsh	r3, [r0, r5]
     de6: 45 6e        	ldr	r5, [r0, #100]
     de8: 61 62        	str	r1, [r4, #36]
     dea: 6c 65        	str	r4, [r5, #84]
     dec: 49 52        	strh	r1, [r1, r1]
     dee: 51 00        	lsls	r1, r2, #1
     df0: 50 4c        	ldr	r4, [pc, #320]          @ 0xf34 <.debug_info+0xf34>
     df2: 4c 49        	ldr	r1, [pc, #304]          @ 0xf24 <.debug_info+0xf24>
     df4: 32 53        	strh	r2, [r6, r4]
     df6: 43 46        	mov	r3, r8
     df8: 47 52        	strh	r7, [r0, r1]
     dfa: 00 57        	ldrsb	r0, [r0, r4]
     dfc: 72 69        	ldr	r2, [r6, #20]
     dfe: 74 65        	str	r4, [r6, #84]
     e00: 52 65        	str	r2, [r2, #84]
     e02: 67 69        	ldr	r7, [r4, #20]
     e04: 73 74        	strb	r3, [r6, #17]
     e06: 65 72        	strb	r5, [r4, #9]
     e08: 00 69        	ldr	r0, [r0, #16]
     e0a: 32 73        	strb	r2, [r6, #12]
     e0c: 6f 64        	str	r7, [r5, #68]
     e0e: 64 00        	lsls	r4, r4, #1
     e10: 52 43        	muls	r2, r2, r2
     e12: 43 5f        	ldrsh	r3, [r0, r5]
     e14: 41 50        	str	r1, [r0, r1]
     e16: 42 31        	adds	r1, #66
     e18: 50 65        	str	r0, [r2, #84]
     e1a: 72 69        	ldr	r2, [r6, #20]
     e1c: 70 68        	ldr	r0, [r6, #4]
     e1e: 52 65        	str	r2, [r2, #84]
     e20: 73 65        	str	r3, [r6, #84]
     e22: 74 43        	muls	r4, r6, r4
     e24: 6d 64        	str	r5, [r5, #68]
     e26: 00 63        	str	r0, [r0, #48]
     e28: 61 6c        	ldr	r1, [r4, #68]
     e2a: 6c 62        	str	r4, [r5, #36]
     e2c: 61 63        	str	r1, [r4, #52]
     e2e: 6b 00        	lsls	r3, r5, #1
     e30: 41 48        	ldr	r0, [pc, #260]          @ 0xf38 <.debug_info+0xf38>
     e32: 42 32        	adds	r2, #66
     e34: 4c 50        	str	r4, [r1, r1]
     e36: 45 4e        	ldr	r6, [pc, #276]          @ 0xf4c <.debug_info+0xf4c>
     e38: 52 00        	lsls	r2, r2, #1
     e3a: 54 58        	ldr	r4, [r2, r1]
     e3c: 43 52        	strh	r3, [r0, r1]
     e3e: 43 52        	strh	r3, [r0, r1]
     e40: 00 76        	strb	r0, [r0, #24]
     e42: 61 6c        	ldr	r1, [r4, #68]
     e44: 75 65        	str	r5, [r6, #84]
     e46: 00 41        	asrs	r0, r0
     e48: 50 42        	rsbs	r0, r2, #0
     e4a: 32 45        	cmp	r2, r6
     e4c: 4e 52        	strh	r6, [r1, r1]
     e4e: 00 41        	asrs	r0, r0
     e50: 48 42        	rsbs	r0, r1, #0
     e52: 31 4c        	ldr	r4, [pc, #196]          @ 0xf18 <.debug_info+0xf18>
     e54: 50 45        	cmp	r0, r10
     e56: 4e 52        	strh	r6, [r1, r1]
     e58: 00 50        	str	r0, [r0, r0]
     e5a: 72 6f        	ldr	r2, [r6, #116]
     e5c: 76 69        	ldr	r6, [r6, #20]
     e5e: 64 65        	str	r4, [r4, #84]
     e60: 41 75        	strb	r1, [r0, #21]
     e62: 64 69        	ldr	r4, [r4, #20]
     e64: 6f 42        	rsbs	r7, r5, #0
     e66: 75 66        	str	r5, [r6, #100]
     e68: 66 65        	str	r6, [r4, #84]
     e6a: 72 57        	ldrsb	r2, [r6, r5]
     e6c: 69 74        	strb	r1, [r5, #17]
     e6e: 68 6f        	ldr	r0, [r5, #116]
     e70: 75 74        	strb	r5, [r6, #17]
     e72: 42 6c        	ldr	r2, [r0, #68]
     e74: 6f 63        	str	r7, [r5, #52]
     e76: 6b 69        	ldr	r3, [r5, #20]
     e78: 6e 67        	str	r6, [r5, #116]
     e7a: 00 52        	strh	r0, [r0, r0]
     e7c: 45 53        	strh	r5, [r0, r5]
     e7e: 45 52        	strh	r5, [r0, r1]
     e80: 56 45        	cmp	r6, r10
     e82: 44 37        	adds	r7, #68
     e84: 00 52        	strh	r0, [r0, r0]
     e86: 45 53        	strh	r5, [r0, r5]
     e88: 45 52        	strh	r5, [r0, r1]
     e8a: 56 45        	cmp	r6, r10
     e8c: 44 38        	subs	r0, #68
     e8e: 00 44        	add	r0, r0
     e90: 4d 41        	adcs	r5, r1
     e92: 5f 54        	strb	r7, [r3, r1]
     e94: 79 70        	strb	r1, [r7, #1]
     e96: 65 44        	add	r5, r12
     e98: 65 66        	str	r5, [r4, #100]
     e9a: 00 44        	add	r0, r0
     e9c: 4d 41        	adcs	r5, r1
     e9e: 52 75        	strb	r2, [r2, #21]
     ea0: 6e 6e        	ldr	r6, [r5, #100]
     ea2: 69 6e        	ldr	r1, [r5, #100]
     ea4: 67 00        	lsls	r7, r4, #1
     ea6: 5f 42        	rsbs	r7, r3, #0
     ea8: 6f 6f        	ldr	r7, [r5, #116]
     eaa: 6c 00        	lsls	r4, r5, #1
     eac: 4c 49        	ldr	r1, [pc, #304]          @ 0xfe0 <.debug_info+0xfe0>
     eae: 46 43        	muls	r6, r0, r6
     eb0: 52 00        	lsls	r2, r2, #1
     eb2: 41 48        	ldr	r0, [pc, #260]          @ 0xfb8 <.debug_info+0xfb8>
     eb4: 42 31        	adds	r1, #66
     eb6: 52 53        	strh	r2, [r2, r5]
     eb8: 54 52        	strh	r4, [r2, r1]
     eba: 00 41        	asrs	r0, r0
     ebc: 48 42        	rsbs	r0, r1, #0
     ebe: 32 45        	cmp	r2, r6
     ec0: 4e 52        	strh	r6, [r1, r1]
     ec2: 00 73        	strb	r0, [r0, #12]
     ec4: 61 6d        	ldr	r1, [r4, #84]
     ec6: 70 6c        	ldr	r0, [r6, #68]
     ec8: 65 00        	lsls	r5, r4, #1
     eca: 42 44        	add	r2, r8
     ecc: 43 52        	strh	r3, [r0, r1]
     ece: 00 4e        	ldr	r6, [pc, #0]            @ 0xed0 <.debug_info+0xed0>
     ed0: 65 78        	ldrb	r5, [r4, #1]
     ed2: 74 42        	rsbs	r4, r6, #0
     ed4: 75 66        	str	r5, [r6, #100]
     ed6: 66 65        	str	r6, [r4, #84]
     ed8: 72 4c        	ldr	r4, [pc, #456]          @ 0x10a4 <.debug_info+0x10a4>
     eda: 65 6e        	ldr	r5, [r4, #100]
     edc: 67 74        	strb	r7, [r4, #17]
     ede: 68 00        	lsls	r0, r5, #1
     ee0: 61 64        	str	r1, [r4, #68]
     ee2: 64 72        	strb	r4, [r4, #9]
     ee4: 65 73        	strb	r5, [r4, #13]
     ee6: 73 00        	lsls	r3, r6, #1
     ee8: 41 75        	strb	r1, [r0, #21]
     eea: 64 69        	ldr	r4, [r4, #20]
     eec: 6f 4f        	ldr	r7, [pc, #444]          @ 0x10ac <.debug_info+0x10ac>
     eee: 66 66        	str	r6, [r4, #100]
     ef0: 00 54        	strb	r0, [r0, r0]
     ef2: 52 49        	ldr	r1, [pc, #328]          @ 0x103c <.debug_info+0x103c>
     ef4: 53 45        	cmp	r3, r10
     ef6: 00 43        	orrs	r0, r0
     ef8: 61 6c        	ldr	r1, [r4, #68]
     efa: 6c 62        	str	r4, [r5, #36]
     efc: 61 63        	str	r1, [r4, #52]
     efe: 6b 43        	muls	r3, r5, r3
     f00: 6f 6e        	ldr	r7, [r5, #100]
     f02: 74 65        	str	r4, [r6, #84]
     f04: 78 74        	strb	r0, [r7, #17]
     f06: 00 50        	str	r0, [r0, r0]
     f08: 4c 4c        	ldr	r4, [pc, #304]          @ 0x103c <.debug_info+0x103c>
     f0a: 43 46        	mov	r3, r8
     f0c: 47 52        	strh	r7, [r0, r1]
     f0e: 00 53        	strh	r0, [r0, r4]
     f10: 53 43        	muls	r3, r2, r3
     f12: 47 52        	strh	r7, [r0, r1]
     f14: 00 41        	asrs	r0, r0
     f16: 50 42        	rsbs	r0, r2, #0
     f18: 32 52        	strh	r2, [r6, r0]
     f1a: 53 54        	strb	r3, [r2, r1]
     f1c: 52 00        	lsls	r2, r2, #1
     f1e: 70 63        	str	r0, [r6, #52]
     f20: 6c 6b        	ldr	r4, [r5, #52]
     f22: 31 00        	movs	r1, r6
     f24: 52 58        	ldr	r2, [r2, r1]
     f26: 43 52        	strh	r3, [r0, r1]
     f28: 43 52        	strh	r3, [r0, r1]
     f2a: 00 41        	asrs	r0, r0
     f2c: 50 42        	rsbs	r0, r2, #0
     f2e: 32 4c        	ldr	r4, [pc, #200]          @ 0xff8 <.debug_info+0xff8>
     f30: 50 45        	cmp	r0, r10
     f32: 4e 52        	strh	r6, [r1, r1]
     f34: 00 41        	asrs	r0, r0
     f36: 50 42        	rsbs	r0, r2, #0
     f38: 31 4c        	ldr	r4, [pc, #196]          @ 0x1000 <.debug_info+0x1000>
     f3a: 50 45        	cmp	r0, r10
     f3c: 4e 52        	strh	r6, [r1, r1]
     f3e: 00 44        	add	r0, r0
     f40: 4d 41        	adcs	r5, r1
     f42: 5f 53        	strh	r7, [r3, r5]
     f44: 74 72        	strb	r4, [r6, #9]
     f46: 65 61        	str	r5, [r4, #20]
     f48: 6d 5f        	ldrsh	r5, [r5, r5]
     f4a: 54 79        	ldrb	r4, [r2, #5]
     f4c: 70 65        	str	r0, [r6, #84]
     f4e: 44 65        	str	r4, [r0, #84]
     f50: 66 00        	lsls	r6, r4, #1
     f52: 53 74        	strb	r3, [r2, #17]
     f54: 61 72        	strb	r1, [r4, #9]
     f56: 74 41        	adcs	r4, r6
     f58: 75 64        	str	r5, [r6, #68]
     f5a: 69 6f        	ldr	r1, [r5, #116]
     f5c: 44 4d        	ldr	r5, [pc, #272]          @ 0x1070 <.debug_info+0x1070>
     f5e: 41 41        	adcs	r1, r0
     f60: 6e 64        	str	r6, [r5, #68]
     f62: 52 65        	str	r2, [r2, #84]
     f64: 71 75        	strb	r1, [r6, #21]
     f66: 65 73        	strb	r5, [r4, #13]
     f68: 74 42        	rsbs	r4, r6, #0
     f6a: 75 66        	str	r5, [r6, #100]
     f6c: 66 65        	str	r6, [r4, #84]
     f6e: 72 73        	strb	r2, [r6, #13]
     f70: 00 48        	ldr	r0, [pc, #0]            @ 0xf74 <.debug_info+0xf74>
     f72: 49 46        	mov	r1, r9
     f74: 43 52        	strh	r3, [r0, r1]
     f76: 00 41        	asrs	r0, r0
     f78: 48 42        	rsbs	r0, r1, #0
     f7a: 33 52        	strh	r3, [r6, r0]
     f7c: 53 54        	strb	r3, [r2, r1]
     f7e: 52 00        	lsls	r2, r2, #1
     f80: 42 75        	strb	r2, [r0, #21]
     f82: 66 66        	str	r6, [r4, #100]
     f84: 65 72        	strb	r5, [r4, #9]
     f86: 4e 75        	strb	r6, [r1, #21]
     f88: 6d 62        	str	r5, [r5, #36]
     f8a: 65 72        	strb	r5, [r4, #9]
     f8c: 00 41        	asrs	r0, r0
     f8e: 50 42        	rsbs	r0, r2, #0
     f90: 31 52        	strh	r1, [r6, r0]
     f92: 53 54        	strb	r3, [r2, r1]
     f94: 52 00        	lsls	r2, r2, #1
     f96: 41 50        	str	r1, [r0, r1]
     f98: 42 31        	adds	r1, #66
     f9a: 45 4e        	ldr	r6, [pc, #276]          @ 0x10b0 <.debug_info+0x10b0>
     f9c: 52 00        	lsls	r2, r2, #1
     f9e: 4f 75        	strb	r7, [r1, #21]
     fa0: 74 70        	strb	r4, [r6, #1]
     fa2: 75 74        	strb	r5, [r6, #17]
     fa4: 41 75        	strb	r1, [r0, #21]
     fa6: 64 69        	ldr	r4, [r4, #20]
     fa8: 6f 53        	strh	r7, [r5, r5]
     faa: 61 6d        	ldr	r1, [r4, #84]
     fac: 70 6c        	ldr	r0, [r6, #68]
     fae: 65 00        	lsls	r5, r4, #1
     fb0: 4e 56        	ldrsb	r6, [r1, r1]
     fb2: 49 43        	muls	r1, r1, r1
     fb4: 5f 44        	add	r7, r11
     fb6: 69 73        	strb	r1, [r5, #13]
     fb8: 61 62        	str	r1, [r4, #36]
     fba: 6c 65        	str	r4, [r5, #84]
     fbc: 49 52        	strh	r1, [r1, r1]
     fbe: 51 00        	lsls	r1, r2, #1
     fc0: 49 32        	adds	r2, #73
     fc2: 43 5f        	ldrsh	r3, [r0, r5]
     fc4: 54 79        	ldrb	r4, [r2, #5]
     fc6: 70 65        	str	r0, [r6, #84]
     fc8: 44 65        	str	r4, [r0, #84]
     fca: 66 00        	lsls	r6, r4, #1
     fcc: 41 48        	ldr	r0, [pc, #260]          @ 0x10d4 <.debug_info+0x10d4>
     fce: 42 33        	adds	r3, #66
     fd0: 4c 50        	str	r4, [r1, r1]
     fd2: 45 4e        	ldr	r6, [pc, #276]          @ 0x10e8 <.debug_info+0x10e8>
     fd4: 52 00        	lsls	r2, r2, #1
     fd6: 53 74        	strb	r3, [r2, #17]
     fd8: 6f 70        	strb	r7, [r5, #1]
     fda: 41 75        	strb	r1, [r0, #21]
     fdc: 64 69        	ldr	r4, [r4, #20]
     fde: 6f 44        	add	r7, sp, r7
     fe0: 4d 41        	adcs	r5, r1
     fe2: 00 63        	str	r0, [r0, #48]
     fe4: 63 72        	strb	r3, [r4, #9]
     fe6: 73 70        	strb	r3, [r6, #1]
     fe8: 65 65        	str	r5, [r4, #84]
     fea: 64 00        	lsls	r4, r4, #1
     fec: 53 50        	str	r3, [r2, r1]
     fee: 49 5f        	ldrsh	r1, [r1, r5]
     ff0: 54 79        	ldrb	r4, [r2, #5]
     ff2: 70 65        	str	r0, [r6, #84]
     ff4: 44 65        	str	r4, [r0, #84]
     ff6: 66 00        	lsls	r6, r4, #1
     ff8: 43 52        	strh	r3, [r0, r1]
     ffa: 43 50        	str	r3, [r0, r1]
     ffc: 52 00        	lsls	r2, r2, #1
     ffe: 4f 41        	adcs	r7, r1
    1000: 52 31        	adds	r1, #82
    1002: 00 4f        	ldr	r7, [pc, #0]            @ 0x1004 <.debug_info+0x1004>
    1004: 41 52        	strh	r1, [r0, r1]
    1006: 32 00        	movs	r2, r6
    1008: 41 48        	ldr	r0, [pc, #260]          @ 0x1110 <.debug_info+0x1110>
    100a: 42 31        	adds	r1, #66
    100c: 45 4e        	ldr	r6, [pc, #276]          @ 0x1124 <.debug_info+0x1124>
    100e: 52 00        	lsls	r2, r2, #1
    1010: 4e 65        	str	r6, [r1, #84]
    1012: 78 74        	strb	r0, [r7, #17]
    1014: 42 75        	strb	r2, [r0, #21]
    1016: 66 66        	str	r6, [r4, #100]
    1018: 65 72        	strb	r5, [r4, #9]
    101a: 53 61        	str	r3, [r2, #20]
    101c: 6d 70        	strb	r5, [r5, #1]
    101e: 6c 65        	str	r4, [r5, #84]
    1020: 73 00        	lsls	r3, r6, #1
    1022: 41 48        	ldr	r0, [pc, #260]          @ 0x1128 <.debug_info+0x1128>
    1024: 42 32        	adds	r2, #66
    1026: 52 53        	strh	r2, [r2, r5]
    1028: 54 52        	strh	r4, [r2, r1]
    102a: 00 4d        	ldr	r5, [pc, #0]            @ 0x102c <.debug_info+0x102c>
    102c: 30 41        	asrs	r0, r6
    102e: 52 00        	lsls	r2, r2, #1
    1030: 52 43        	muls	r2, r2, r2
    1032: 43 5f        	ldrsh	r3, [r0, r5]
    1034: 54 79        	ldrb	r4, [r2, #5]
    1036: 70 65        	str	r0, [r6, #84]
    1038: 44 65        	str	r4, [r0, #84]
    103a: 66 00        	lsls	r6, r4, #1
    103c: 53 74        	strb	r3, [r2, #17]
    103e: 6f 70        	strb	r7, [r5, #1]
    1040: 41 75        	strb	r1, [r0, #21]
    1042: 64 69        	ldr	r4, [r4, #20]
    1044: 6f 00        	lsls	r7, r5, #1
    1046: 6e 75        	strb	r6, [r5, #21]
    1048: 6d 73        	strb	r5, [r5, #13]
    104a: 61 6d        	ldr	r1, [r4, #84]
    104c: 70 6c        	ldr	r0, [r6, #68]
    104e: 65 73        	strb	r5, [r4, #13]
    1050: 00 41        	asrs	r0, r0
    1052: 75 64        	str	r5, [r6, #68]
    1054: 69 6f        	ldr	r1, [r5, #116]
    1056: 4f 6e        	ldr	r7, [r1, #100]
    1058: 00 69        	ldr	r0, [r0, #16]
    105a: 32 63        	str	r2, [r6, #48]
    105c: 5f 73        	strb	r7, [r3, #13]
    105e: 70 65        	str	r0, [r6, #84]
    1060: 65 64        	str	r5, [r4, #68]
    1062: 00 73        	strb	r0, [r0, #12]
    1064: 72 63        	str	r2, [r6, #52]
    1066: 2f 41        	asrs	r7, r5
    1068: 75 64        	str	r5, [r6, #68]
    106a: 69 6f        	ldr	r1, [r5, #116]
    106c: 2e 63        	str	r6, [r5, #48]
    106e: 00 44        	add	r0, r0
    1070: 4d 41        	adcs	r5, r1
    1072: 31 5f        	ldrsh	r1, [r6, r4]
    1074: 53 74        	strb	r3, [r2, #17]
    1076: 72 65        	str	r2, [r6, #84]
    1078: 61 6d        	ldr	r1, [r4, #84]
    107a: 37 5f        	ldrsh	r7, [r6, r4]
    107c: 49 52        	strh	r1, [r1, r1]
    107e: 51 48        	ldr	r0, [pc, #324]          @ 0x11c4 <.debug_info+0x11c4>
    1080: 61 6e        	ldr	r1, [r4, #100]
    1082: 64 6c        	ldr	r4, [r4, #68]
    1084: 65 72        	strb	r5, [r4, #9]
    1086: 00 48        	ldr	r0, [pc, #0]            @ 0x1088 <.debug_info+0x1088>
    1088: 49 53        	strh	r1, [r1, r5]
    108a: 52 00        	lsls	r2, r2, #1
    108c: 49 32        	adds	r2, #73
    108e: 53 50        	str	r3, [r2, r1]
    1090: 52 00        	lsls	r2, r2, #1
    1092: 4c 49        	ldr	r1, [pc, #304]          @ 0x11c4 <.debug_info+0x11c4>
    1094: 53 52        	strh	r3, [r2, r1]
    1096: 00 4f        	ldr	r7, [pc, #0]            @ 0x1098 <.debug_info+0x1098>
    1098: 75 74        	strb	r5, [r6, #17]
    109a: 70 75        	strb	r0, [r6, #21]
    109c: 74 41        	adcs	r4, r6
    109e: 75 64        	str	r5, [r6, #68]
    10a0: 69 6f        	ldr	r1, [r5, #116]
    10a2: 53 61        	str	r3, [r2, #20]
    10a4: 6d 70        	strb	r5, [r5, #1]
    10a6: 6c 65        	str	r4, [r5, #84]
    10a8: 57 69        	ldr	r7, [r2, #20]
    10aa: 74 68        	ldr	r4, [r6, #4]
    10ac: 6f 75        	strb	r7, [r5, #21]
    10ae: 74 42        	rsbs	r4, r6, #0
    10b0: 6c 6f        	ldr	r4, [r5, #116]
    10b2: 63 6b        	ldr	r3, [r4, #52]
    10b4: 69 6e        	ldr	r1, [r5, #100]
    10b6: 67 00        	lsls	r7, r4, #1
    10b8: 4e 44        	add	r6, r9
    10ba: 54 52        	strh	r4, [r2, r1]
    10bc: 00 41        	asrs	r0, r0
    10be: 48 42        	rsbs	r0, r1, #0
    10c0: 33 45        	cmp	r3, r6
    10c2: 4e 52        	strh	r6, [r1, r1]
    10c4: 00 69        	ldr	r0, [r0, #16]
    10c6: 32 73        	strb	r2, [r6, #12]
    10c8: 64 69        	ldr	r4, [r4, #20]
    10ca: 76 00        	lsls	r6, r6, #1
    10cc: 45 52        	strh	r5, [r0, r1]
    10ce: 52 4f        	ldr	r7, [pc, #328]          @ 0x1218 <.debug_info+0x1218>
    10d0: 52 00        	lsls	r2, r2, #1
    10d2: 52 43        	muls	r2, r2, r2
    10d4: 43 5f        	ldrsh	r3, [r0, r5]
    10d6: 53 59        	ldr	r3, [r2, r5]
    10d8: 53 43        	muls	r3, r2, r3
    10da: 4c 4b        	ldr	r3, [pc, #304]          @ 0x120c <.debug_info+0x120c>
    10dc: 43 6f        	ldr	r3, [r0, #116]
    10de: 6e 66        	str	r6, [r5, #100]
    10e0: 69 67        	str	r1, [r5, #116]
    10e2: 00 52        	strh	r0, [r0, r0]
    10e4: 43 43        	muls	r3, r0, r3
    10e6: 5f 53        	strh	r7, [r3, r5]
    10e8: 59 53        	strh	r1, [r3, r5]
    10ea: 43 4c        	ldr	r4, [pc, #268]          @ 0x11f8 <.debug_info+0x11f8>
    10ec: 4b 00        	lsls	r3, r1, #1
    10ee: 52 43        	muls	r2, r2, r2
    10f0: 43 5f        	ldrsh	r3, [r0, r5]
    10f2: 4d 43        	muls	r5, r1, r5
    10f4: 4f 32        	adds	r2, #79
    10f6: 53 6f        	ldr	r3, [r2, #116]
    10f8: 75 72        	strb	r5, [r6, #9]
    10fa: 63 65        	str	r3, [r4, #84]
    10fc: 00 52        	strh	r0, [r0, r0]
    10fe: 43 43        	muls	r3, r0, r3
    1100: 5f 4d        	ldr	r5, [pc, #380]          @ 0x1280 <.debug_info+0x1280>
    1102: 43 4f        	ldr	r7, [pc, #268]          @ 0x1210 <.debug_info+0x1210>
    1104: 32 44        	add	r2, r6
    1106: 69 76        	strb	r1, [r5, #25]
    1108: 00 50        	str	r0, [r0, r0]
    110a: 4c 4c        	ldr	r4, [pc, #304]          @ 0x123c <.debug_info+0x123c>
    110c: 49 32        	adds	r2, #73
    110e: 53 4e        	ldr	r6, [pc, #332]          @ 0x125c <.debug_info+0x125c>
    1110: 00 50        	str	r0, [r0, r0]
    1112: 4c 4c        	ldr	r4, [pc, #304]          @ 0x1244 <.debug_info+0x1244>
    1114: 49 32        	adds	r2, #73
    1116: 53 52        	strh	r3, [r2, r1]
    1118: 00 52        	strh	r0, [r0, r0]
    111a: 43 43        	muls	r3, r0, r3
    111c: 5f 44        	add	r7, r11
    111e: 65 49        	ldr	r1, [pc, #404]          @ 0x12b4 <.debug_info+0x12b4>
    1120: 6e 69        	ldr	r6, [r5, #20]
    1122: 74 00        	lsls	r4, r6, #1
    1124: 45 72        	strb	r5, [r0, #9]
    1126: 72 6f        	ldr	r2, [r6, #116]
    1128: 72 53        	strh	r2, [r6, r5]
    112a: 74 61        	str	r4, [r6, #20]
    112c: 74 75        	strb	r4, [r6, #21]
    112e: 73 00        	lsls	r3, r6, #1
    1130: 52 43        	muls	r2, r2, r2
    1132: 43 5f        	ldrsh	r3, [r0, r5]
    1134: 53 59        	ldr	r3, [r2, r5]
    1136: 53 43        	muls	r3, r2, r3
    1138: 4c 4b        	ldr	r3, [pc, #304]          @ 0x126c <.debug_info+0x126c>
    113a: 53 6f        	ldr	r3, [r2, #116]
    113c: 75 72        	strb	r5, [r6, #9]
    113e: 63 65        	str	r3, [r4, #84]
    1140: 00 52        	strh	r0, [r0, r0]
    1142: 43 43        	muls	r3, r0, r3
    1144: 5f 43        	muls	r7, r3, r7
    1146: 6c 6f        	ldr	r4, [r5, #116]
    1148: 63 6b        	ldr	r3, [r4, #52]
    114a: 73 54        	strb	r3, [r6, r1]
    114c: 79 70        	strb	r1, [r7, #1]
    114e: 65 44        	add	r5, r12
    1150: 65 66        	str	r5, [r4, #100]
    1152: 00 52        	strh	r0, [r0, r0]
    1154: 43 43        	muls	r3, r0, r3
    1156: 5f 50        	str	r7, [r3, r1]
    1158: 4c 4c        	ldr	r4, [pc, #304]          @ 0x128c <.debug_info+0x128c>
    115a: 43 6f        	ldr	r3, [r0, #116]
    115c: 6e 66        	str	r6, [r5, #100]
    115e: 69 67        	str	r1, [r5, #116]
    1160: 00 52        	strh	r0, [r0, r0]
    1162: 43 43        	muls	r3, r0, r3
    1164: 5f 50        	str	r7, [r3, r1]
    1166: 43 4c        	ldr	r4, [pc, #268]          @ 0x1274 <.debug_info+0x1274>
    1168: 4b 32        	adds	r2, #75
    116a: 43 6f        	ldr	r3, [r0, #116]
    116c: 6e 66        	str	r6, [r5, #100]
    116e: 69 67        	str	r1, [r5, #116]
    1170: 00 52        	strh	r0, [r0, r0]
    1172: 43 43        	muls	r3, r0, r3
    1174: 5f 57        	ldrsb	r7, [r3, r5]
    1176: 61 69        	ldr	r1, [r4, #20]
    1178: 74 46        	mov	r4, lr
    117a: 6f 72        	strb	r7, [r5, #9]
    117c: 48 53        	strh	r0, [r1, r5]
    117e: 45 53        	strh	r5, [r0, r5]
    1180: 74 61        	str	r4, [r6, #20]
    1182: 72 74        	strb	r2, [r6, #17]
    1184: 55 70        	strb	r5, [r2, #1]
    1186: 00 52        	strh	r0, [r0, r0]
    1188: 43 43        	muls	r3, r0, r3
    118a: 5f 50        	str	r7, [r3, r1]
    118c: 4c 4c        	ldr	r4, [pc, #304]          @ 0x12c0 <.debug_info+0x12c0>
    118e: 53 6f        	ldr	r3, [r2, #116]
    1190: 75 72        	strb	r5, [r6, #9]
    1192: 63 65        	str	r3, [r4, #84]
    1194: 00 52        	strh	r0, [r0, r0]
    1196: 43 43        	muls	r3, r0, r3
    1198: 5f 41        	adcs	r7, r3
    119a: 48 42        	rsbs	r0, r1, #0
    119c: 32 50        	str	r2, [r6, r0]
    119e: 65 72        	strb	r5, [r4, #9]
    11a0: 69 70        	strb	r1, [r5, #1]
    11a2: 68 00        	lsls	r0, r5, #1
    11a4: 70 6c        	ldr	r0, [r6, #68]
    11a6: 6c 6d        	ldr	r4, [r5, #84]
    11a8: 00 70        	strb	r0, [r0]
    11aa: 6c 6c        	ldr	r4, [r5, #68]
    11ac: 70 00        	lsls	r0, r6, #1
    11ae: 52 43        	muls	r2, r2, r2
    11b0: 43 5f        	ldrsh	r3, [r0, r5]
    11b2: 43 6c        	ldr	r3, [r0, #68]
    11b4: 65 61        	str	r5, [r4, #20]
    11b6: 72 49        	ldr	r1, [pc, #456]          @ 0x1380 <.debug_info+0x1380>
    11b8: 54 50        	str	r4, [r2, r1]
    11ba: 65 6e        	ldr	r5, [r4, #100]
    11bc: 64 69        	ldr	r4, [r4, #20]
    11be: 6e 67        	str	r6, [r5, #116]
    11c0: 42 69        	ldr	r2, [r0, #20]
    11c2: 74 00        	lsls	r4, r6, #1
    11c4: 70 6c        	ldr	r0, [r6, #68]
    11c6: 6c 76        	strb	r4, [r5, #25]
    11c8: 63 6f        	ldr	r3, [r4, #116]
    11ca: 00 73        	strb	r0, [r0, #12]
    11cc: 74 61        	str	r4, [r6, #20]
    11ce: 74 75        	strb	r4, [r6, #21]
    11d0: 73 72        	strb	r3, [r6, #9]
    11d2: 65 67        	str	r5, [r4, #116]
    11d4: 00 52        	strh	r0, [r0, r0]
    11d6: 43 43        	muls	r3, r0, r3
    11d8: 5f 41        	adcs	r7, r3
    11da: 48 42        	rsbs	r0, r1, #0
    11dc: 33 50        	str	r3, [r6, r0]
    11de: 65 72        	strb	r5, [r4, #9]
    11e0: 69 70        	strb	r1, [r5, #1]
    11e2: 68 43        	muls	r0, r5, r0
    11e4: 6c 6f        	ldr	r4, [r5, #116]
    11e6: 63 6b        	ldr	r3, [r4, #52]
    11e8: 4c 50        	str	r4, [r1, r1]
    11ea: 4d 6f        	ldr	r5, [r1, #116]
    11ec: 64 65        	str	r4, [r4, #84]
    11ee: 43 6d        	ldr	r3, [r0, #84]
    11f0: 64 00        	lsls	r4, r4, #1
    11f2: 52 43        	muls	r2, r2, r2
    11f4: 43 5f        	ldrsh	r3, [r0, r5]
    11f6: 47 65        	str	r7, [r0, #84]
    11f8: 74 43        	muls	r4, r6, r4
    11fa: 6c 6f        	ldr	r4, [r5, #116]
    11fc: 63 6b        	ldr	r3, [r4, #52]
    11fe: 73 46        	mov	r3, lr
    1200: 72 65        	str	r2, [r6, #84]
    1202: 71 00        	lsls	r1, r6, #1
    1204: 52 43        	muls	r2, r2, r2
    1206: 43 5f        	ldrsh	r3, [r0, r5]
    1208: 4c 53        	strh	r4, [r1, r5]
    120a: 49 43        	muls	r1, r1, r1
    120c: 6d 64        	str	r5, [r5, #68]
    120e: 00 52        	strh	r0, [r0, r0]
    1210: 43 43        	muls	r3, r0, r3
    1212: 5f 50        	str	r7, [r3, r1]
    1214: 4c 4c        	ldr	r4, [pc, #304]          @ 0x1348 <.debug_info+0x1348>
    1216: 49 32        	adds	r2, #73
    1218: 53 43        	muls	r3, r2, r3
    121a: 6f 6e        	ldr	r7, [r5, #100]
    121c: 66 69        	ldr	r6, [r4, #20]
    121e: 67 00        	lsls	r7, r4, #1
    1220: 52 43        	muls	r2, r2, r2
    1222: 43 5f        	ldrsh	r3, [r0, r5]
    1224: 49 32        	adds	r2, #73
    1226: 53 43        	muls	r3, r2, r3
    1228: 4c 4b        	ldr	r3, [pc, #304]          @ 0x135c <.debug_info+0x135c>
    122a: 43 6f        	ldr	r3, [r0, #116]
    122c: 6e 66        	str	r6, [r5, #100]
    122e: 69 67        	str	r1, [r5, #116]
    1230: 00 53        	strh	r0, [r0, r4]
    1232: 59 53        	strh	r1, [r3, r5]
    1234: 43 4c        	ldr	r4, [pc, #268]          @ 0x1344 <.debug_info+0x1344>
    1236: 4b 5f        	ldrsh	r3, [r1, r5]
    1238: 46 72        	strb	r6, [r0, #9]
    123a: 65 71        	strb	r5, [r4, #5]
    123c: 75 65        	str	r5, [r6, #84]
    123e: 6e 63        	str	r6, [r5, #52]
    1240: 79 00        	lsls	r1, r7, #1
    1242: 52 43        	muls	r2, r2, r2
    1244: 43 5f        	ldrsh	r3, [r0, r5]
    1246: 47 65        	str	r7, [r0, #84]
    1248: 74 49        	ldr	r1, [pc, #464]          @ 0x141c <.debug_info+0x141c>
    124a: 54 53        	strh	r4, [r2, r5]
    124c: 74 61        	str	r4, [r6, #20]
    124e: 74 75        	strb	r4, [r6, #21]
    1250: 73 00        	lsls	r3, r6, #1
    1252: 52 43        	muls	r2, r2, r2
    1254: 43 5f        	ldrsh	r3, [r0, r5]
    1256: 48 43        	muls	r0, r1, r0
    1258: 4c 4b        	ldr	r3, [pc, #304]          @ 0x138c <.debug_info+0x138c>
    125a: 00 52        	strh	r0, [r0, r0]
    125c: 43 43        	muls	r3, r0, r3
    125e: 5f 41        	adcs	r7, r3
    1260: 48 42        	rsbs	r0, r1, #0
    1262: 33 50        	str	r3, [r6, r0]
    1264: 65 72        	strb	r5, [r4, #9]
    1266: 69 70        	strb	r1, [r5, #1]
    1268: 68 43        	muls	r0, r5, r0
    126a: 6c 6f        	ldr	r4, [r5, #116]
    126c: 63 6b        	ldr	r3, [r4, #52]
    126e: 43 6d        	ldr	r3, [r0, #84]
    1270: 64 00        	lsls	r4, r4, #1
    1272: 52 43        	muls	r2, r2, r2
    1274: 43 5f        	ldrsh	r3, [r0, r5]
    1276: 48 53        	strh	r0, [r1, r5]
    1278: 45 00        	lsls	r5, r0, #1
    127a: 52 43        	muls	r2, r2, r2
    127c: 43 5f        	ldrsh	r3, [r0, r5]
    127e: 41 48        	ldr	r0, [pc, #260]          @ 0x1384 <.debug_info+0x1384>
    1280: 42 33        	adds	r3, #66
    1282: 50 65        	str	r0, [r2, #84]
    1284: 72 69        	ldr	r2, [r6, #20]
    1286: 70 68        	ldr	r0, [r6, #4]
    1288: 00 52        	strh	r0, [r0, r0]
    128a: 43 43        	muls	r3, r0, r3
    128c: 5f 50        	str	r7, [r3, r1]
    128e: 43 4c        	ldr	r4, [pc, #268]          @ 0x139c <.debug_info+0x139c>
    1290: 4b 31        	adds	r1, #75
    1292: 43 6f        	ldr	r3, [r0, #116]
    1294: 6e 66        	str	r6, [r5, #100]
    1296: 69 67        	str	r1, [r5, #116]
    1298: 00 74        	strb	r0, [r0, #16]
    129a: 6d 70        	strb	r5, [r5, #1]
    129c: 72 65        	str	r2, [r6, #84]
    129e: 67 00        	lsls	r7, r4, #1
    12a0: 48 43        	muls	r0, r1, r0
    12a2: 4c 4b        	ldr	r3, [pc, #304]          @ 0x13d4 <.debug_info+0x13d4>
    12a4: 5f 46        	mov	r7, r11
    12a6: 72 65        	str	r2, [r6, #84]
    12a8: 71 75        	strb	r1, [r6, #21]
    12aa: 65 6e        	ldr	r5, [r4, #100]
    12ac: 63 79        	ldrb	r3, [r4, #5]
    12ae: 00 52        	strh	r0, [r0, r0]
    12b0: 43 43        	muls	r3, r0, r3
    12b2: 5f 41        	adcs	r7, r3
    12b4: 64 6a        	ldr	r4, [r4, #36]
    12b6: 75 73        	strb	r5, [r6, #13]
    12b8: 74 48        	ldr	r0, [pc, #464]          @ 0x148c <.debug_info+0x148c>
    12ba: 53 49        	ldr	r1, [pc, #332]          @ 0x1408 <.debug_info+0x1408>
    12bc: 43 61        	str	r3, [r0, #20]
    12be: 6c 69        	ldr	r4, [r5, #20]
    12c0: 62 72        	strb	r2, [r4, #9]
    12c2: 61 74        	strb	r1, [r4, #17]
    12c4: 69 6f        	ldr	r1, [r5, #116]
    12c6: 6e 56        	ldrsb	r6, [r5, r1]
    12c8: 61 6c        	ldr	r1, [r4, #68]
    12ca: 75 65        	str	r5, [r6, #84]
    12cc: 00 52        	strh	r0, [r0, r0]
    12ce: 43 43        	muls	r3, r0, r3
    12d0: 5f 49        	ldr	r1, [pc, #380]          @ 0x1450 <.debug_info+0x1450>
    12d2: 32 53        	strh	r2, [r6, r4]
    12d4: 43 4c        	ldr	r4, [pc, #268]          @ 0x13e4 <.debug_info+0x13e4>
    12d6: 4b 53        	strh	r3, [r1, r5]
    12d8: 6f 75        	strb	r7, [r5, #21]
    12da: 72 63        	str	r2, [r6, #52]
    12dc: 65 00        	lsls	r5, r4, #1
    12de: 52 43        	muls	r2, r2, r2
    12e0: 43 5f        	ldrsh	r3, [r0, r5]
    12e2: 4d 43        	muls	r5, r1, r5
    12e4: 4f 31        	adds	r1, #79
    12e6: 43 6f        	ldr	r3, [r0, #116]
    12e8: 6e 66        	str	r6, [r5, #100]
    12ea: 69 67        	str	r1, [r5, #116]
    12ec: 00 4e        	ldr	r6, [pc, #0]            @ 0x12f0 <.debug_info+0x12f0>
    12ee: 65 77        	strb	r5, [r4, #29]
    12f0: 53 74        	strb	r3, [r2, #17]
    12f2: 61 74        	strb	r1, [r4, #17]
    12f4: 65 00        	lsls	r5, r4, #1
    12f6: 70 72        	strb	r0, [r6, #9]
    12f8: 65 73        	strb	r5, [r4, #13]
    12fa: 63 00        	lsls	r3, r4, #1
    12fc: 52 43        	muls	r2, r2, r2
    12fe: 43 5f        	ldrsh	r3, [r0, r5]
    1300: 41 48        	ldr	r0, [pc, #260]          @ 0x1408 <.debug_info+0x1408>
    1302: 42 32        	adds	r2, #66
    1304: 50 65        	str	r0, [r2, #84]
    1306: 72 69        	ldr	r2, [r6, #20]
    1308: 70 68        	ldr	r0, [r6, #4]
    130a: 43 6c        	ldr	r3, [r0, #68]
    130c: 6f 63        	str	r7, [r5, #52]
    130e: 6b 43        	muls	r3, r5, r3
    1310: 6d 64        	str	r5, [r5, #68]
    1312: 00 53        	strh	r0, [r0, r4]
    1314: 55 43        	muls	r5, r2, r5
    1316: 43 45        	cmp	r3, r8
    1318: 53 53        	strh	r3, [r2, r5]
    131a: 00 73        	strb	r0, [r0, #12]
    131c: 74 61        	str	r4, [r6, #20]
    131e: 72 74        	strb	r2, [r6, #17]
    1320: 75 70        	strb	r5, [r6, #1]
    1322: 63 6f        	ldr	r3, [r4, #116]
    1324: 75 6e        	ldr	r5, [r6, #100]
    1326: 74 65        	str	r4, [r6, #84]
    1328: 72 00        	lsls	r2, r6, #1
    132a: 52 43        	muls	r2, r2, r2
    132c: 43 5f        	ldrsh	r3, [r0, r5]
    132e: 43 6c        	ldr	r3, [r0, #68]
    1330: 6f 63        	str	r7, [r5, #52]
    1332: 6b 53        	strh	r3, [r5, r5]
    1334: 65 63        	str	r5, [r4, #52]
    1336: 75 72        	strb	r5, [r6, #9]
    1338: 69 74        	strb	r1, [r5, #17]
    133a: 79 53        	strh	r1, [r7, r5]
    133c: 79 73        	strb	r1, [r7, #13]
    133e: 74 65        	str	r4, [r6, #84]
    1340: 6d 43        	muls	r5, r5, r5
    1342: 6d 64        	str	r5, [r5, #68]
    1344: 00 52        	strh	r0, [r0, r0]
    1346: 43 43        	muls	r3, r0, r3
    1348: 5f 4d        	ldr	r5, [pc, #380]          @ 0x14c8 <.debug_info+0x14c8>
    134a: 43 4f        	ldr	r7, [pc, #268]          @ 0x1458 <.debug_info+0x1458>
    134c: 31 53        	strh	r1, [r6, r4]
    134e: 6f 75        	strb	r7, [r5, #21]
    1350: 72 63        	str	r2, [r6, #52]
    1352: 65 00        	lsls	r5, r4, #1
    1354: 52 43        	muls	r2, r2, r2
    1356: 43 5f        	ldrsh	r3, [r0, r5]
    1358: 4d 43        	muls	r5, r1, r5
    135a: 4f 31        	adds	r1, #79
    135c: 44 69        	ldr	r4, [r0, #20]
    135e: 76 00        	lsls	r6, r6, #1
    1360: 52 43        	muls	r2, r2, r2
    1362: 43 5f        	ldrsh	r3, [r0, r5]
    1364: 48 53        	strh	r0, [r1, r5]
    1366: 45 43        	muls	r5, r0, r5
    1368: 6f 6e        	ldr	r7, [r5, #100]
    136a: 66 69        	ldr	r6, [r4, #20]
    136c: 67 00        	lsls	r7, r4, #1
    136e: 52 43        	muls	r2, r2, r2
    1370: 43 5f        	ldrsh	r3, [r0, r5]
    1372: 41 50        	str	r1, [r0, r1]
    1374: 42 32        	adds	r2, #66
    1376: 50 65        	str	r0, [r2, #84]
    1378: 72 69        	ldr	r2, [r6, #20]
    137a: 70 68        	ldr	r0, [r6, #4]
    137c: 00 47        	bx	r0
    137e: 4e 55        	strb	r6, [r1, r5]
    1380: 20 43        	orrs	r0, r4
    1382: 20 34        	adds	r4, #32
    1384: 2e 39        	subs	r1, #46
    1386: 2e 33        	adds	r3, #46
    1388: 20 32        	adds	r2, #32
    138a: 30 31        	adds	r1, #48
    138c: 35 30        	adds	r0, #53
    138e: 35 32        	adds	r2, #53
    1390: 39 20        	movs	r0, #57
    1392: 28 72        	strb	r0, [r5, #8]
    1394: 65 6c        	ldr	r5, [r4, #68]
    1396: 65 61        	str	r5, [r4, #20]
    1398: 73 65        	str	r3, [r6, #84]
    139a: 29 20        	movs	r0, #41
    139c: 5b 41        	adcs	r3, r3
    139e: 52 4d        	ldr	r5, [pc, #328]          @ 0x14e8 <.debug_info+0x14e8>
    13a0: 2f 65        	str	r7, [r5, #80]
    13a2: 6d 62        	str	r5, [r5, #36]
    13a4: 65 64        	str	r5, [r4, #68]
    13a6: 64 65        	str	r4, [r4, #84]
    13a8: 64 2d        	cmp	r5, #100
    13aa: 34 5f        	ldrsh	r4, [r6, r4]
    13ac: 39 2d        	cmp	r5, #57
    13ae: 62 72        	strb	r2, [r4, #9]
    13b0: 61 6e        	ldr	r1, [r4, #100]
    13b2: 63 68        	ldr	r3, [r4, #4]
    13b4: 20 72        	strb	r0, [r4, #8]
    13b6: 65 76        	strb	r5, [r4, #25]
    13b8: 69 73        	strb	r1, [r5, #13]
    13ba: 69 6f        	ldr	r1, [r5, #116]
    13bc: 6e 20        	movs	r0, #110
    13be: 32 32        	adds	r2, #50
    13c0: 37 39        	subs	r1, #55
    13c2: 37 37        	adds	r7, #55
    13c4: 5d 20        	movs	r0, #93
    13c6: 2d 6d        	ldr	r5, [r5, #80]
    13c8: 6c 69        	ldr	r4, [r5, #20]
    13ca: 74 74        	strb	r4, [r6, #17]
    13cc: 6c 65        	str	r4, [r5, #84]
    13ce: 2d 65        	str	r5, [r5, #80]
    13d0: 6e 64        	str	r6, [r5, #68]
    13d2: 69 61        	str	r1, [r5, #20]
    13d4: 6e 20        	movs	r0, #110
    13d6: 2d 6d        	ldr	r5, [r5, #80]
    13d8: 74 68        	ldr	r4, [r6, #4]
    13da: 75 6d        	ldr	r5, [r6, #84]
    13dc: 62 20        	movs	r0, #98
    13de: 2d 6d        	ldr	r5, [r5, #80]
    13e0: 74 68        	ldr	r4, [r6, #4]
    13e2: 75 6d        	ldr	r5, [r6, #84]
    13e4: 62 2d        	cmp	r5, #98
    13e6: 69 6e        	ldr	r1, [r5, #100]
    13e8: 74 65        	str	r4, [r6, #84]
    13ea: 72 77        	strb	r2, [r6, #29]
    13ec: 6f 72        	strb	r7, [r5, #9]
    13ee: 6b 20        	movs	r0, #107
    13f0: 2d 6d        	ldr	r5, [r5, #80]
    13f2: 63 70        	strb	r3, [r4, #1]
    13f4: 75 3d        	subs	r5, #117
    13f6: 63 6f        	ldr	r3, [r4, #116]
    13f8: 72 74        	strb	r2, [r6, #17]
    13fa: 65 78        	ldrb	r5, [r4, #1]
    13fc: 2d 6d        	ldr	r5, [r5, #80]
    13fe: 34 20        	movs	r0, #52
    1400: 2d 6d        	ldr	r5, [r5, #80]
    1402: 66 70        	strb	r6, [r4, #1]
    1404: 75 3d        	subs	r5, #117
    1406: 66 70        	strb	r6, [r4, #1]
    1408: 76 34        	adds	r4, #118
    140a: 2d 73        	strb	r5, [r5, #12]
    140c: 70 2d        	cmp	r5, #112
    140e: 64 31        	adds	r1, #100
    1410: 36 20        	movs	r0, #54
    1412: 2d 6d        	ldr	r5, [r5, #80]
    1414: 66 6c        	ldr	r6, [r4, #68]
    1416: 6f 61        	str	r7, [r5, #20]
    1418: 74 2d        	cmp	r5, #116
    141a: 61 62        	str	r1, [r4, #36]
    141c: 69 3d        	subs	r5, #105
    141e: 68 61        	str	r0, [r5, #20]
    1420: 72 64        	str	r2, [r6, #68]
    1422: 20 2d        	cmp	r5, #32
    1424: 67 20        	movs	r0, #103
    1426: 2d 4f        	ldr	r7, [pc, #180]          @ 0x14dc <.debug_info+0x14dc>
    1428: 67 20        	movs	r0, #103
    142a: 2d 66        	str	r5, [r5, #96]
    142c: 73 69        	ldr	r3, [r6, #20]
    142e: 6e 67        	str	r6, [r5, #116]
    1430: 6c 65        	str	r4, [r5, #84]
    1432: 2d 70        	strb	r5, [r5]
    1434: 72 65        	str	r2, [r6, #84]
    1436: 63 69        	ldr	r3, [r4, #20]
    1438: 73 69        	ldr	r3, [r6, #20]
    143a: 6f 6e        	ldr	r7, [r5, #100]
    143c: 2d 63        	str	r5, [r5, #48]
    143e: 6f 6e        	ldr	r7, [r5, #100]
    1440: 73 74        	strb	r3, [r6, #17]
    1442: 61 6e        	ldr	r1, [r4, #100]
    1444: 74 20        	movs	r0, #116
    1446: 2d 66        	str	r5, [r5, #96]
    1448: 66 72        	strb	r6, [r4, #9]
    144a: 65 65        	str	r5, [r4, #84]
    144c: 73 74        	strb	r3, [r6, #17]
    144e: 61 6e        	ldr	r1, [r4, #100]
    1450: 64 69        	ldr	r4, [r4, #20]
    1452: 6e 67        	str	r6, [r5, #116]
    1454: 00 73        	strb	r0, [r0, #12]
    1456: 72 63        	str	r2, [r6, #52]
    1458: 2f 70        	strb	r7, [r5]
    145a: 65 72        	strb	r5, [r4, #9]
    145c: 69 70        	strb	r1, [r5, #1]
    145e: 68 65        	str	r0, [r5, #84]
    1460: 72 61        	str	r2, [r6, #20]
    1462: 6c 73        	strb	r4, [r5, #13]
    1464: 2f 73        	strb	r7, [r5, #12]
    1466: 74 6d        	ldr	r4, [r6, #84]
    1468: 33 32        	adds	r2, #51
    146a: 66 34        	adds	r4, #102
    146c: 78 78        	ldrb	r0, [r7, #1]
    146e: 5f 72        	strb	r7, [r3, #9]
    1470: 63 63        	str	r3, [r4, #52]
    1472: 2e 63        	str	r6, [r5, #48]
    1474: 00 52        	strh	r0, [r0, r0]
    1476: 43 43        	muls	r3, r0, r3
    1478: 5f 48        	ldr	r0, [pc, #380]          @ 0x15f8 <.debug_info+0x15f8>
    147a: 43 4c        	ldr	r4, [pc, #268]          @ 0x1588 <.debug_info+0x1588>
    147c: 4b 43        	muls	r3, r1, r3
    147e: 6f 6e        	ldr	r7, [r5, #100]
    1480: 66 69        	ldr	r6, [r4, #20]
    1482: 67 00        	lsls	r7, r4, #1
    1484: 41 50        	str	r1, [r0, r1]
    1486: 42 41        	adcs	r2, r0
    1488: 48 42        	rsbs	r0, r1, #0
    148a: 50 72        	strb	r0, [r2, #9]
    148c: 65 73        	strb	r5, [r4, #13]
    148e: 63 54        	strb	r3, [r4, r1]
    1490: 61 62        	str	r1, [r4, #36]
    1492: 6c 65        	str	r4, [r5, #84]
    1494: 00 52        	strh	r0, [r0, r0]
    1496: 43 43        	muls	r3, r0, r3
    1498: 5f 43        	muls	r7, r3, r7
    149a: 6c 6f        	ldr	r4, [r5, #116]
    149c: 63 6b        	ldr	r3, [r4, #52]
    149e: 73 00        	lsls	r3, r6, #1
    14a0: 52 43        	muls	r2, r2, r2
    14a2: 43 5f        	ldrsh	r3, [r0, r5]
    14a4: 41 48        	ldr	r0, [pc, #260]          @ 0x15ac <.debug_info+0x15ac>
    14a6: 42 32        	adds	r2, #66
    14a8: 50 65        	str	r0, [r2, #84]
    14aa: 72 69        	ldr	r2, [r6, #20]
    14ac: 70 68        	ldr	r0, [r6, #4]
    14ae: 43 6c        	ldr	r3, [r0, #68]
    14b0: 6f 63        	str	r7, [r5, #52]
    14b2: 6b 4c        	ldr	r4, [pc, #428]          @ 0x1660 <.debug_info+0x1660>
    14b4: 50 4d        	ldr	r5, [pc, #320]          @ 0x15f8 <.debug_info+0x15f8>
    14b6: 6f 64        	str	r7, [r5, #68]
    14b8: 65 43        	muls	r5, r4, r5
    14ba: 6d 64        	str	r5, [r5, #68]
    14bc: 00 52        	strh	r0, [r0, r0]
    14be: 43 43        	muls	r3, r0, r3
    14c0: 5f 4c        	ldr	r4, [pc, #380]          @ 0x1640 <.debug_info+0x1640>
    14c2: 53 45        	cmp	r3, r10
    14c4: 43 6f        	ldr	r3, [r0, #116]
    14c6: 6e 66        	str	r6, [r5, #100]
    14c8: 69 67        	str	r1, [r5, #116]
    14ca: 00 52        	strh	r0, [r0, r0]
    14cc: 43 43        	muls	r3, r0, r3
    14ce: 5f 41        	adcs	r7, r3
    14d0: 48 42        	rsbs	r0, r1, #0
    14d2: 31 50        	str	r1, [r6, r0]
    14d4: 65 72        	strb	r5, [r4, #9]
    14d6: 69 70        	strb	r1, [r5, #1]
    14d8: 68 00        	lsls	r0, r5, #1
    14da: 52 43        	muls	r2, r2, r2
    14dc: 43 5f        	ldrsh	r3, [r0, r5]
    14de: 47 65        	str	r7, [r0, #84]
    14e0: 74 46        	mov	r4, lr
    14e2: 6c 61        	str	r4, [r5, #20]
    14e4: 67 53        	strh	r7, [r4, r5]
    14e6: 74 61        	str	r4, [r6, #20]
    14e8: 74 75        	strb	r4, [r6, #21]
    14ea: 73 00        	lsls	r3, r6, #1
    14ec: 2f 55        	strb	r7, [r5, r4]
    14ee: 73 65        	str	r3, [r6, #84]
    14f0: 72 73        	strb	r2, [r6, #13]
    14f2: 2f 73        	strb	r7, [r5, #12]
    14f4: 61 6d        	ldr	r1, [r4, #84]
    14f6: 64 65        	str	r4, [r4, #84]
    14f8: 74 6f        	ldr	r4, [r6, #116]
    14fa: 72 2f        	cmp	r7, #114
    14fc: 53 54        	strb	r3, [r2, r1]
    14fe: 4d 33        	adds	r3, #77
    1500: 32 46        	mov	r2, r6
    1502: 34 5f        	ldrsh	r4, [r6, r4]
    1504: 44 69        	ldr	r4, [r0, #20]
    1506: 73 63        	str	r3, [r6, #52]
    1508: 6f 76        	strb	r7, [r5, #25]
    150a: 65 72        	strb	r5, [r4, #9]
    150c: 79 5f        	ldrsh	r1, [r7, r5]
    150e: 4d 50        	str	r5, [r1, r1]
    1510: 33 2f        	cmp	r7, #51
    1512: 6c 69        	ldr	r4, [r5, #20]
    1514: 62 00        	lsls	r2, r4, #1
    1516: 52 43        	muls	r2, r2, r2
    1518: 43 5f        	ldrsh	r3, [r0, r5]
    151a: 41 50        	str	r1, [r0, r1]
    151c: 42 32        	adds	r2, #66
    151e: 50 65        	str	r0, [r2, #84]
    1520: 72 69        	ldr	r2, [r6, #20]
    1522: 70 68        	ldr	r0, [r6, #4]
    1524: 43 6c        	ldr	r3, [r0, #68]
    1526: 6f 63        	str	r7, [r5, #52]
    1528: 6b 4c        	ldr	r4, [pc, #428]          @ 0x16d8 <.debug_info+0x16d8>
    152a: 50 4d        	ldr	r5, [pc, #320]          @ 0x166c <.debug_info+0x166c>
    152c: 6f 64        	str	r7, [r5, #68]
    152e: 65 43        	muls	r5, r4, r5
    1530: 6d 64        	str	r5, [r5, #68]
    1532: 00 50        	str	r0, [r0, r0]
    1534: 43 4c        	ldr	r4, [pc, #268]          @ 0x1644 <.debug_info+0x1644>
    1536: 4b 32        	adds	r2, #75
    1538: 5f 46        	mov	r7, r11
    153a: 72 65        	str	r2, [r6, #84]
    153c: 71 75        	strb	r1, [r6, #21]
    153e: 65 6e        	ldr	r5, [r4, #100]
    1540: 63 79        	ldrb	r3, [r4, #5]
    1542: 00 52        	strh	r0, [r0, r0]
    1544: 43 43        	muls	r3, r0, r3
    1546: 5f 52        	strh	r7, [r3, r1]
    1548: 54 43        	muls	r4, r2, r4
    154a: 43 4c        	ldr	r4, [pc, #268]          @ 0x1658 <.debug_info+0x1658>
    154c: 4b 53        	strh	r3, [r1, r5]
    154e: 6f 75        	strb	r7, [r5, #21]
    1550: 72 63        	str	r2, [r6, #52]
    1552: 65 00        	lsls	r5, r4, #1
    1554: 52 43        	muls	r2, r2, r2
    1556: 43 5f        	ldrsh	r3, [r0, r5]
    1558: 49 54        	strb	r1, [r1, r1]
    155a: 43 6f        	ldr	r3, [r0, #116]
    155c: 6e 66        	str	r6, [r5, #100]
    155e: 69 67        	str	r1, [r5, #116]
    1560: 00 52        	strh	r0, [r0, r0]
    1562: 43 43        	muls	r3, r0, r3
    1564: 5f 52        	strh	r7, [r3, r1]
    1566: 54 43        	muls	r4, r2, r4
    1568: 43 4c        	ldr	r4, [pc, #268]          @ 0x1678 <.debug_info+0x1678>
    156a: 4b 43        	muls	r3, r1, r3
    156c: 6f 6e        	ldr	r7, [r5, #100]
    156e: 66 69        	ldr	r6, [r4, #20]
    1570: 67 00        	lsls	r7, r4, #1
    1572: 52 43        	muls	r2, r2, r2
    1574: 43 5f        	ldrsh	r3, [r0, r5]
    1576: 47 65        	str	r7, [r0, #84]
    1578: 74 53        	strh	r4, [r6, r5]
    157a: 59 53        	strh	r1, [r3, r5]
    157c: 43 4c        	ldr	r4, [pc, #268]          @ 0x168c <.debug_info+0x168c>
    157e: 4b 53        	strh	r3, [r1, r5]
    1580: 6f 75        	strb	r7, [r5, #21]
    1582: 72 63        	str	r2, [r6, #52]
    1584: 65 00        	lsls	r5, r4, #1
    1586: 52 43        	muls	r2, r2, r2
    1588: 43 5f        	ldrsh	r3, [r0, r5]
    158a: 42 61        	str	r2, [r0, #20]
    158c: 63 6b        	ldr	r3, [r4, #52]
    158e: 75 70        	strb	r5, [r6, #1]
    1590: 52 65        	str	r2, [r2, #84]
    1592: 73 65        	str	r3, [r6, #84]
    1594: 74 43        	muls	r4, r6, r4
    1596: 6d 64        	str	r5, [r5, #68]
    1598: 00 52        	strh	r0, [r0, r0]
    159a: 43 43        	muls	r3, r0, r3
    159c: 5f 41        	adcs	r7, r3
    159e: 48 42        	rsbs	r0, r1, #0
    15a0: 33 50        	str	r3, [r6, r0]
    15a2: 65 72        	strb	r5, [r4, #9]
    15a4: 69 70        	strb	r1, [r5, #1]
    15a6: 68 52        	strh	r0, [r5, r1]
    15a8: 65 73        	strb	r5, [r4, #13]
    15aa: 65 74        	strb	r5, [r4, #17]
    15ac: 43 6d        	ldr	r3, [r0, #84]
    15ae: 64 00        	lsls	r4, r4, #1
    15b0: 52 43        	muls	r2, r2, r2
    15b2: 43 5f        	ldrsh	r3, [r0, r5]
    15b4: 41 48        	ldr	r0, [pc, #260]          @ 0x16bc <.debug_info+0x16bc>
    15b6: 42 32        	adds	r2, #66
    15b8: 50 65        	str	r0, [r2, #84]
    15ba: 72 69        	ldr	r2, [r6, #20]
    15bc: 70 68        	ldr	r0, [r6, #4]
    15be: 52 65        	str	r2, [r2, #84]
    15c0: 73 65        	str	r3, [r6, #84]
    15c2: 74 43        	muls	r4, r6, r4
    15c4: 6d 64        	str	r5, [r5, #68]
    15c6: 00 52        	strh	r0, [r0, r0]
    15c8: 43 43        	muls	r3, r0, r3
    15ca: 5f 41        	adcs	r7, r3
    15cc: 50 42        	rsbs	r0, r2, #0
    15ce: 32 50        	str	r2, [r6, r0]
    15d0: 65 72        	strb	r5, [r4, #9]
    15d2: 69 70        	strb	r1, [r5, #1]
    15d4: 68 52        	strh	r0, [r5, r1]
    15d6: 65 73        	strb	r5, [r4, #13]
    15d8: 65 74        	strb	r5, [r4, #17]
    15da: 43 6d        	ldr	r3, [r0, #84]
    15dc: 64 00        	lsls	r4, r4, #1
    15de: 52 43        	muls	r2, r2, r2
    15e0: 43 5f        	ldrsh	r3, [r0, r5]
    15e2: 48 53        	strh	r0, [r1, r5]
    15e4: 49 43        	muls	r1, r1, r1
    15e6: 6d 64        	str	r5, [r5, #68]
    15e8: 00 52        	strh	r0, [r0, r0]
    15ea: 43 43        	muls	r3, r0, r3
    15ec: 5f 41        	adcs	r7, r3
    15ee: 48 42        	rsbs	r0, r1, #0
    15f0: 31 50        	str	r1, [r6, r0]
    15f2: 65 72        	strb	r5, [r4, #9]
    15f4: 69 70        	strb	r1, [r5, #1]
    15f6: 68 52        	strh	r0, [r5, r1]
    15f8: 65 73        	strb	r5, [r4, #13]
    15fa: 65 74        	strb	r5, [r4, #17]
    15fc: 43 6d        	ldr	r3, [r0, #84]
    15fe: 64 00        	lsls	r4, r4, #1
    1600: 52 43        	muls	r2, r2, r2
    1602: 43 5f        	ldrsh	r3, [r0, r5]
    1604: 50 4c        	ldr	r4, [pc, #320]          @ 0x1748 <.debug_info+0x1748>
    1606: 4c 49        	ldr	r1, [pc, #304]          @ 0x1738 <.debug_info+0x1738>
    1608: 32 53        	strh	r2, [r6, r4]
    160a: 43 6d        	ldr	r3, [r0, #84]
    160c: 64 00        	lsls	r4, r4, #1
    160e: 68 73        	strb	r0, [r5, #13]
    1610: 65 73        	strb	r5, [r4, #13]
    1612: 74 61        	str	r4, [r6, #20]
    1614: 74 75        	strb	r4, [r6, #21]
    1616: 73 00        	lsls	r3, r6, #1
    1618: 70 6c        	ldr	r0, [r6, #68]
    161a: 6c 73        	strb	r4, [r5, #13]
    161c: 6f 75        	strb	r7, [r5, #21]
    161e: 72 63        	str	r2, [r6, #52]
    1620: 65 00        	lsls	r5, r4, #1
    1622: 50 43        	muls	r0, r2, r0
    1624: 4c 4b        	ldr	r3, [pc, #304]          @ 0x1758 <.debug_info+0x1758>
    1626: 31 5f        	ldrsh	r1, [r6, r4]
    1628: 46 72        	strb	r6, [r0, #9]
    162a: 65 71        	strb	r5, [r4, #5]
    162c: 75 65        	str	r5, [r6, #84]
    162e: 6e 63        	str	r6, [r5, #52]
    1630: 79 00        	lsls	r1, r7, #1
    1632: 52 43        	muls	r2, r2, r2
    1634: 43 5f        	ldrsh	r3, [r0, r5]
    1636: 41 50        	str	r1, [r0, r1]
    1638: 42 32        	adds	r2, #66
    163a: 50 65        	str	r0, [r2, #84]
    163c: 72 69        	ldr	r2, [r6, #20]
    163e: 70 68        	ldr	r0, [r6, #4]
    1640: 43 6c        	ldr	r3, [r0, #68]
    1642: 6f 63        	str	r7, [r5, #52]
    1644: 6b 43        	muls	r3, r5, r3
    1646: 6d 64        	str	r5, [r5, #68]
    1648: 00 52        	strh	r0, [r0, r0]
    164a: 43 43        	muls	r3, r0, r3
    164c: 5f 50        	str	r7, [r3, r1]
    164e: 4c 4c        	ldr	r4, [pc, #304]          @ 0x1780 <.debug_info+0x1780>
    1650: 43 6d        	ldr	r3, [r0, #84]
    1652: 64 00        	lsls	r4, r4, #1
    1654: 52 43        	muls	r2, r2, r2
    1656: 43 5f        	ldrsh	r3, [r0, r5]
    1658: 41 50        	str	r1, [r0, r1]
    165a: 42 31        	adds	r1, #66
    165c: 50 65        	str	r0, [r2, #84]
    165e: 72 69        	ldr	r2, [r6, #20]
    1660: 70 68        	ldr	r0, [r6, #4]
    1662: 43 6c        	ldr	r3, [r0, #68]
    1664: 6f 63        	str	r7, [r5, #52]
    1666: 6b 4c        	ldr	r4, [pc, #428]          @ 0x1814 <.debug_info+0x1814>
    1668: 50 4d        	ldr	r5, [pc, #320]          @ 0x17ac <.debug_info+0x17ac>
    166a: 6f 64        	str	r7, [r5, #68]
    166c: 65 43        	muls	r5, r4, r5
    166e: 6d 64        	str	r5, [r5, #68]
    1670: 00 52        	strh	r0, [r0, r0]
    1672: 43 43        	muls	r3, r0, r3
    1674: 5f 4c        	ldr	r4, [pc, #380]          @ 0x17f4 <.debug_info+0x17f4>
    1676: 53 45        	cmp	r3, r10
    1678: 00 50        	str	r0, [r0, r0]
    167a: 4c 4c        	ldr	r4, [pc, #304]          @ 0x17ac <.debug_info+0x17ac>
    167c: 4d 00        	lsls	r5, r1, #1
    167e: 50 4c        	ldr	r4, [pc, #320]          @ 0x17c0 <.debug_info+0x17c0>
    1680: 4c 4e        	ldr	r6, [pc, #304]          @ 0x17b4 <.debug_info+0x17b4>
    1682: 00 50        	str	r0, [r0, r0]
    1684: 4c 4c        	ldr	r4, [pc, #304]          @ 0x17b8 <.debug_info+0x17b8>
    1686: 50 00        	lsls	r0, r2, #1
    1688: 50 4c        	ldr	r4, [pc, #320]          @ 0x17cc <.debug_info+0x17cc>
    168a: 4c 51        	str	r4, [r1, r5]
    168c: 00 52        	strh	r0, [r0, r0]
    168e: 43 43        	muls	r3, r0, r3
    1690: 5f 41        	adcs	r7, r3
    1692: 50 42        	rsbs	r0, r2, #0
    1694: 31 50        	str	r1, [r6, r0]
    1696: 65 72        	strb	r5, [r4, #9]
    1698: 69 70        	strb	r1, [r5, #1]
    169a: 68 00        	lsls	r0, r5, #1
    169c: 52 43        	muls	r2, r2, r2
    169e: 43 5f        	ldrsh	r3, [r0, r5]
    16a0: 4d 43        	muls	r5, r1, r5
    16a2: 4f 32        	adds	r2, #79
    16a4: 43 6f        	ldr	r3, [r0, #116]
    16a6: 6e 66        	str	r6, [r5, #100]
    16a8: 69 67        	str	r1, [r5, #116]
    16aa: 00 62        	str	r0, [r0, #32]
    16ac: 69 74        	strb	r1, [r5, #17]
    16ae: 73 74        	strb	r3, [r6, #17]
    16b0: 61 74        	strb	r1, [r4, #17]
    16b2: 75 73        	strb	r5, [r6, #13]
    16b4: 00 52        	strh	r0, [r0, r0]
    16b6: 43 43        	muls	r3, r0, r3
    16b8: 5f 49        	ldr	r1, [pc, #380]          @ 0x1838 <.debug_info+0x1838>
    16ba: 54 00        	lsls	r4, r2, #1
    16bc: 52 43        	muls	r2, r2, r2
    16be: 43 5f        	ldrsh	r3, [r0, r5]
    16c0: 46 4c        	ldr	r4, [pc, #280]          @ 0x17dc <.debug_info+0x17dc>
    16c2: 41 47        	bx	r8
    16c4: 00 52        	strh	r0, [r0, r0]
    16c6: 43 43        	muls	r3, r0, r3
    16c8: 5f 43        	muls	r7, r3, r7
    16ca: 6c 65        	str	r4, [r5, #84]
    16cc: 61 72        	strb	r1, [r4, #9]
    16ce: 46 6c        	ldr	r6, [r0, #68]
    16d0: 61 67        	str	r1, [r4, #116]
    16d2: 00 52        	strh	r0, [r0, r0]
    16d4: 43 43        	muls	r3, r0, r3
    16d6: 5f 41        	adcs	r7, r3
    16d8: 48 42        	rsbs	r0, r1, #0
    16da: 31 50        	str	r1, [r6, r0]
    16dc: 65 72        	strb	r5, [r4, #9]
    16de: 69 70        	strb	r1, [r5, #1]
    16e0: 68 43        	muls	r0, r5, r0
    16e2: 6c 6f        	ldr	r4, [r5, #116]
    16e4: 63 6b        	ldr	r3, [r4, #52]
    16e6: 4c 50        	str	r4, [r1, r1]
    16e8: 4d 6f        	ldr	r5, [r1, #116]
    16ea: 64 65        	str	r4, [r4, #84]
    16ec: 43 6d        	ldr	r3, [r0, #84]
    16ee: 64 00        	lsls	r4, r4, #1
    16f0: 52 43        	muls	r2, r2, r2
    16f2: 43 5f        	ldrsh	r3, [r0, r5]
    16f4: 52 54        	strb	r2, [r2, r1]
    16f6: 43 43        	muls	r3, r0, r3
    16f8: 4c 4b        	ldr	r3, [pc, #304]          @ 0x182c <.debug_info+0x182c>
    16fa: 43 6d        	ldr	r3, [r0, #84]
    16fc: 64 00        	lsls	r4, r4, #1
    16fe: 70 69        	ldr	r0, [r6, #20]
    1700: 6e 70        	strb	r6, [r5, #1]
    1702: 6f 73        	strb	r7, [r5, #13]
    1704: 00 42        	tst	r0, r0
    1706: 69 74        	strb	r1, [r5, #17]
    1708: 5f 53        	strh	r7, [r3, r5]
    170a: 45 54        	strb	r5, [r0, r1]
    170c: 00 47        	bx	r0
    170e: 50 49        	ldr	r1, [pc, #320]          @ 0x1850 <.debug_info+0x1850>
    1710: 4f 5f        	ldrsh	r7, [r1, r5]
    1712: 52 65        	str	r2, [r2, #84]
    1714: 61 64        	str	r1, [r4, #68]
    1716: 4f 75        	strb	r7, [r1, #21]
    1718: 74 70        	strb	r4, [r6, #1]
    171a: 75 74        	strb	r5, [r6, #17]
    171c: 44 61        	str	r4, [r0, #20]
    171e: 74 61        	str	r4, [r6, #20]
    1720: 00 74        	strb	r0, [r0, #16]
    1722: 65 6d        	ldr	r5, [r4, #84]
    1724: 70 00        	lsls	r0, r6, #1
    1726: 47 50        	str	r7, [r0, r1]
    1728: 49 4f        	ldr	r7, [pc, #292]          @ 0x1850 <.debug_info+0x1850>
    172a: 5f 53        	strh	r7, [r3, r5]
    172c: 74 72        	strb	r4, [r6, #9]
    172e: 75 63        	str	r5, [r6, #52]
    1730: 74 49        	ldr	r1, [pc, #464]          @ 0x1904 <.debug_info+0x1904>
    1732: 6e 69        	ldr	r6, [r5, #20]
    1734: 74 00        	lsls	r4, r6, #1
    1736: 42 69        	ldr	r2, [r0, #20]
    1738: 74 56        	ldrsb	r4, [r6, r1]
    173a: 61 6c        	ldr	r1, [r4, #68]
    173c: 00 42        	tst	r0, r0
    173e: 69 74        	strb	r1, [r5, #17]
    1740: 5f 52        	strh	r7, [r3, r1]
    1742: 45 53        	strh	r5, [r0, r5]
    1744: 45 54        	strb	r5, [r0, r1]
    1746: 00 47        	bx	r0
    1748: 50 49        	ldr	r1, [pc, #320]          @ 0x188c <.debug_info+0x188c>
    174a: 4f 5f        	ldrsh	r7, [r1, r5]
    174c: 57 72        	strb	r7, [r2, #9]
    174e: 69 74        	strb	r1, [r5, #17]
    1750: 65 42        	rsbs	r5, r4, #0
    1752: 69 74        	strb	r1, [r5, #17]
    1754: 00 74        	strb	r0, [r0, #16]
    1756: 65 6d        	ldr	r5, [r4, #84]
    1758: 70 5f        	ldrsh	r0, [r6, r5]
    175a: 32 00        	movs	r2, r6
    175c: 47 50        	str	r7, [r0, r1]
    175e: 49 4f        	ldr	r7, [pc, #292]          @ 0x1884 <.debug_info+0x1884>
    1760: 5f 44        	add	r7, r11
    1762: 65 49        	ldr	r1, [pc, #404]          @ 0x18f8 <.debug_info+0x18f8>
    1764: 6e 69        	ldr	r6, [r5, #20]
    1766: 74 00        	lsls	r4, r6, #1
    1768: 47 50        	str	r7, [r0, r1]
    176a: 49 4f        	ldr	r7, [pc, #292]          @ 0x1890 <.debug_info+0x1890>
    176c: 5f 52        	strh	r7, [r3, r1]
    176e: 65 61        	str	r5, [r4, #20]
    1770: 64 49        	ldr	r1, [pc, #400]          @ 0x1904 <.debug_info+0x1904>
    1772: 6e 70        	strb	r6, [r5, #1]
    1774: 75 74        	strb	r5, [r6, #17]
    1776: 44 61        	str	r4, [r0, #20]
    1778: 74 61        	str	r4, [r6, #20]
    177a: 42 69        	ldr	r2, [r0, #20]
    177c: 74 00        	lsls	r4, r6, #1
    177e: 47 50        	str	r7, [r0, r1]
    1780: 49 4f        	ldr	r7, [pc, #292]          @ 0x18a8 <.debug_info+0x18a8>
    1782: 5f 41        	adcs	r7, r3
    1784: 46 00        	lsls	r6, r0, #1
    1786: 50 6f        	ldr	r0, [r2, #116]
    1788: 72 74        	strb	r2, [r6, #17]
    178a: 56 61        	str	r6, [r2, #20]
    178c: 6c 00        	lsls	r4, r5, #1
    178e: 47 50        	str	r7, [r0, r1]
    1790: 49 4f        	ldr	r7, [pc, #292]          @ 0x18b8 <.debug_info+0x18b8>
    1792: 5f 50        	str	r7, [r3, r1]
    1794: 69 6e        	ldr	r1, [r5, #100]
    1796: 53 6f        	ldr	r3, [r2, #116]
    1798: 75 72        	strb	r5, [r6, #9]
    179a: 63 65        	str	r3, [r4, #84]
    179c: 00 47        	bx	r0
    179e: 50 49        	ldr	r1, [pc, #320]          @ 0x18e0 <.debug_info+0x18e0>
    17a0: 4f 5f        	ldrsh	r7, [r1, r5]
    17a2: 52 65        	str	r2, [r2, #84]
    17a4: 61 64        	str	r1, [r4, #68]
    17a6: 49 6e        	ldr	r1, [r1, #100]
    17a8: 70 75        	strb	r0, [r6, #21]
    17aa: 74 44        	add	r4, lr
    17ac: 61 74        	strb	r1, [r4, #17]
    17ae: 61 00        	lsls	r1, r4, #1
    17b0: 47 50        	str	r7, [r0, r1]
    17b2: 49 4f        	ldr	r7, [pc, #292]          @ 0x18d8 <.debug_info+0x18d8>
    17b4: 5f 50        	str	r7, [r3, r1]
    17b6: 69 6e        	ldr	r1, [r5, #100]
    17b8: 4c 6f        	ldr	r4, [r1, #116]
    17ba: 63 6b        	ldr	r3, [r4, #52]
    17bc: 43 6f        	ldr	r3, [r0, #116]
    17be: 6e 66        	str	r6, [r5, #100]
    17c0: 69 67        	str	r1, [r5, #116]
    17c2: 00 63        	str	r0, [r0, #48]
    17c4: 75 72        	strb	r5, [r6, #9]
    17c6: 72 65        	str	r2, [r6, #84]
    17c8: 6e 74        	strb	r6, [r5, #17]
    17ca: 70 69        	ldr	r0, [r6, #20]
    17cc: 6e 00        	lsls	r6, r5, #1
    17ce: 47 50        	str	r7, [r0, r1]
    17d0: 49 4f        	ldr	r7, [pc, #292]          @ 0x18f8 <.debug_info+0x18f8>
    17d2: 5f 57        	ldrsb	r7, [r3, r5]
    17d4: 72 69        	ldr	r2, [r6, #20]
    17d6: 74 65        	str	r4, [r6, #84]
    17d8: 00 73        	strb	r0, [r0, #12]
    17da: 72 63        	str	r2, [r6, #52]
    17dc: 2f 70        	strb	r7, [r5]
    17de: 65 72        	strb	r5, [r4, #9]
    17e0: 69 70        	strb	r1, [r5, #1]
    17e2: 68 65        	str	r0, [r5, #84]
    17e4: 72 61        	str	r2, [r6, #20]
    17e6: 6c 73        	strb	r4, [r5, #13]
    17e8: 2f 73        	strb	r7, [r5, #12]
    17ea: 74 6d        	ldr	r4, [r6, #84]
    17ec: 33 32        	adds	r2, #51
    17ee: 66 34        	adds	r4, #102
    17f0: 78 78        	ldrb	r0, [r7, #1]
    17f2: 5f 67        	str	r7, [r3, #116]
    17f4: 70 69        	ldr	r0, [r6, #20]
    17f6: 6f 2e        	cmp	r6, #111
    17f8: 63 00        	lsls	r3, r4, #1
    17fa: 42 69        	ldr	r2, [r0, #20]
    17fc: 74 41        	adcs	r4, r6
    17fe: 63 74        	strb	r3, [r4, #17]
    1800: 69 6f        	ldr	r1, [r5, #116]
    1802: 6e 00        	lsls	r6, r5, #1
    1804: 47 50        	str	r7, [r0, r1]
    1806: 49 4f        	ldr	r7, [pc, #292]          @ 0x192c <.debug_info+0x192c>
    1808: 78 00        	lsls	r0, r7, #1
    180a: 47 50        	str	r7, [r0, r1]
    180c: 49 4f        	ldr	r7, [pc, #292]          @ 0x1934 <.debug_info+0x1934>
    180e: 5f 54        	strb	r7, [r3, r1]
    1810: 6f 67        	str	r7, [r5, #116]
    1812: 67 6c        	ldr	r7, [r4, #68]
    1814: 65 42        	rsbs	r5, r4, #0
    1816: 69 74        	strb	r1, [r5, #17]
    1818: 73 00        	lsls	r3, r6, #1
    181a: 47 50        	str	r7, [r0, r1]
    181c: 49 4f        	ldr	r7, [pc, #292]          @ 0x1944 <.debug_info+0x1944>
    181e: 5f 52        	strh	r7, [r3, r1]
    1820: 65 61        	str	r5, [r4, #20]
    1822: 64 4f        	ldr	r7, [pc, #400]          @ 0x19b4 <.debug_info+0x19b4>
    1824: 75 74        	strb	r5, [r6, #17]
    1826: 70 75        	strb	r0, [r6, #21]
    1828: 74 44        	add	r4, lr
    182a: 61 74        	strb	r1, [r4, #17]
    182c: 61 42        	rsbs	r1, r4, #0
    182e: 69 74        	strb	r1, [r5, #17]
    1830: 00 47        	bx	r0
    1832: 50 49        	ldr	r1, [pc, #320]          @ 0x1974 <.debug_info+0x1974>
    1834: 4f 5f        	ldrsh	r7, [r1, r5]
    1836: 49 6e        	ldr	r1, [r1, #100]
    1838: 69 74        	strb	r1, [r5, #17]
    183a: 53 74        	strb	r3, [r2, #17]
    183c: 72 75        	strb	r2, [r6, #21]
    183e: 63 74        	strb	r3, [r4, #17]
    1840: 00           	<unknown>

Disassembly of section .comment:

00000000 <.comment>:
       0: 47 43        	muls	r7, r0, r7
       2: 43 3a        	subs	r2, #67
       4: 20 28        	cmp	r0, #32
       6: 47 4e        	ldr	r6, [pc, #284]          @ 0x124 <.debug_info+0x124>
       8: 55 20        	movs	r0, #85
       a: 54 6f        	ldr	r4, [r2, #116]
       c: 6f 6c        	ldr	r7, [r5, #68]
       e: 73 20        	movs	r0, #115
      10: 66 6f        	ldr	r6, [r4, #116]
      12: 72 20        	movs	r0, #114
      14: 41 52        	strh	r1, [r0, r1]
      16: 4d 20        	movs	r0, #77
      18: 45 6d        	ldr	r5, [r0, #84]
      1a: 62 65        	str	r2, [r4, #84]
      1c: 64 64        	str	r4, [r4, #68]
      1e: 65 64        	str	r5, [r4, #68]
      20: 20 50        	str	r0, [r4, r0]
      22: 72 6f        	ldr	r2, [r6, #116]
      24: 63 65        	str	r3, [r4, #84]
      26: 73 73        	strb	r3, [r6, #13]
      28: 6f 72        	strb	r7, [r5, #9]
      2a: 73 29        	cmp	r1, #115
      2c: 20 34        	adds	r4, #32
      2e: 2e 39        	subs	r1, #46
      30: 2e 33        	adds	r3, #46
      32: 20 32        	adds	r2, #32
      34: 30 31        	adds	r1, #48
      36: 35 30        	adds	r0, #53
      38: 35 32        	adds	r2, #53
      3a: 39 20        	movs	r0, #57
      3c: 28 72        	strb	r0, [r5, #8]
      3e: 65 6c        	ldr	r5, [r4, #68]
      40: 65 61        	str	r5, [r4, #20]
      42: 73 65        	str	r3, [r6, #84]
      44: 29 20        	movs	r0, #41
      46: 5b 41        	adcs	r3, r3
      48: 52 4d        	ldr	r5, [pc, #328]          @ 0x194 <.debug_info+0x194>
      4a: 2f 65        	str	r7, [r5, #80]
      4c: 6d 62        	str	r5, [r5, #36]
      4e: 65 64        	str	r5, [r4, #68]
      50: 64 65        	str	r4, [r4, #84]
      52: 64 2d        	cmp	r5, #100
      54: 34 5f        	ldrsh	r4, [r6, r4]
      56: 39 2d        	cmp	r5, #57
      58: 62 72        	strb	r2, [r4, #9]
      5a: 61 6e        	ldr	r1, [r4, #100]
      5c: 63 68        	ldr	r3, [r4, #4]
      5e: 20 72        	strb	r0, [r4, #8]
      60: 65 76        	strb	r5, [r4, #25]
      62: 69 73        	strb	r1, [r5, #13]
      64: 69 6f        	ldr	r1, [r5, #116]
      66: 6e 20        	movs	r0, #110
      68: 32 32        	adds	r2, #50
      6a: 37 39        	subs	r1, #55
      6c: 37 37        	adds	r7, #55
      6e: 5d 00        	lsls	r5, r3, #1

Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
       0: 41 36        	adds	r6, #65
       2: 00 00        	movs	r0, r0
       4: 00 61        	str	r0, [r0, #16]
       6: 65 61        	str	r5, [r4, #20]
       8: 62 69        	ldr	r2, [r4, #20]
       a: 00 01        	lsls	r0, r0, #4
       c: 2c 00        	movs	r4, r5
       e: 00 00        	movs	r0, r0
      10: 05 43        	orrs	r5, r0
      12: 6f 72        	strb	r7, [r5, #9]
      14: 74 65        	str	r4, [r6, #84]
      16: 78 2d        	cmp	r5, #120
      18: 4d 34        	adds	r4, #77
      1a: 00 06        	lsls	r0, r0, #24
      1c: 0d 07        	lsls	r5, r1, #28
      1e: 4d 09        	lsrs	r5, r1, #5
      20: 02 0a        	lsrs	r2, r0, #8
      22: 06 12        	asrs	r6, r0, #8
      24: 04 14        	asrs	r4, r0, #16
      26: 01 15        	asrs	r1, r0, #20
      28: 01 17        	asrs	r1, r0, #28
      2a: 03 18        	adds	r3, r0, r0
      2c: 01 1a        	subs	r1, r0, r0
      2e: 01 1b        	subs	r1, r0, r4
      30: 01 1c        	adds	r1, r0, #0
      32: 01 1e        	subs	r1, r0, #0
      34: 01 22        	movs	r2, #1
      36: 01           	<unknown>

Disassembly of section .debug_frame:

00000000 <.debug_frame>:
       0: 0c 00        	movs	r4, r1
       2: 00 00        	movs	r0, r0
       4: ff           	<unknown>
       5: ff           	<unknown>
       6: ff           	<unknown>
       7: ff 01        	lsls	r7, r7, #7
       9: 00 02        	lsls	r0, r0, #8
       b: 7c 0e        	lsrs	r4, r7, #25
       d: 0c 0d        	lsrs	r4, r1, #20
       f: 00 1c        	adds	r0, r0, #0

00000010 <$d>:
      10: 1c 00        	movs	r4, r3
		...
      1a: 00 00        	movs	r0, r0
      1c: c4 00        	lsls	r4, r0, #3
      1e: 00 00        	movs	r0, r0
      20: 41 0e        	lsrs	r1, r0, #25
      22: 0c 84        	strh	r4, [r1, #32]
      24: 03 85        	strh	r3, [r0, #40]
      26: 02 8e        	ldrh	r2, [r0, #48]
      28: 01 41        	asrs	r1, r0
      2a: 0e 18        	adds	r6, r1, r0
      2c: 02 4e        	ldr	r6, [pc, #8]            @ 0x38 <.debug_info+0x38>
      2e: 0e 0c        	lsrs	r6, r1, #16
      30: 20 00        	movs	r0, r4
		...
      3a: 00 00        	movs	r0, r0
      3c: bc 00        	lsls	r4, r7, #2
      3e: 00 00        	movs	r0, r0
      40: 41 0e        	lsrs	r1, r0, #25
      42: 10 84        	strh	r0, [r2, #32]
      44: 04 85        	strh	r4, [r0, #40]
      46: 03 86        	strh	r3, [r0, #48]
      48: 02 8e        	ldrh	r2, [r0, #48]
      4a: 01 41        	asrs	r1, r0
      4c: 0e 28        	cmp	r0, #14
      4e: 02 4f        	ldr	r7, [pc, #8]            @ 0x58 <.debug_info+0x58>
      50: 0e 10        	asrs	r6, r1, #32
      52: 00 00        	movs	r0, r0
      54: 1c 00        	movs	r4, r3
      56: 00 00        	movs	r0, r0
      58: 00 00        	movs	r0, r0
      5a: 00 00        	movs	r0, r0
      5c: 10 09        	lsrs	r0, r2, #4
      5e: 00 20        	movs	r0, #0
      60: 5c 00        	lsls	r4, r3, #1
      62: 00 00        	movs	r0, r0
      64: 41 0e        	lsrs	r1, r0, #25
      66: 0c 84        	strh	r4, [r1, #32]
      68: 03 85        	strh	r3, [r0, #40]
      6a: 02 8e        	ldrh	r2, [r0, #48]
      6c: 01 41        	asrs	r1, r0
      6e: 0e 18        	adds	r6, r1, r0
      70: 68 0e        	lsrs	r0, r5, #25
      72: 0c 00        	movs	r4, r1
      74: 0c 00        	movs	r4, r1
		...
      7e: 00 00        	movs	r0, r0
      80: 20 00        	movs	r0, r4
      82: 00 00        	movs	r0, r0
      84: 14 00        	movs	r4, r2
		...
      8e: 00 00        	movs	r0, r0
      90: 1c 00        	movs	r4, r3
      92: 00 00        	movs	r0, r0
      94: 41 0e        	lsrs	r1, r0, #25
      96: 08 49        	ldr	r1, [pc, #32]           @ 0xb8 <.debug_info+0xb8>
      98: 0e 00        	movs	r6, r1
      9a: 00 00        	movs	r0, r0
      9c: 14 00        	movs	r4, r2
		...
      a6: 00 00        	movs	r0, r0
      a8: 70 00        	lsls	r0, r6, #1
      aa: 00 00        	movs	r0, r0
      ac: 41 0e        	lsrs	r1, r0, #25
      ae: 08 84        	strh	r0, [r1, #32]
      b0: 02 8e        	ldrh	r2, [r0, #48]
      b2: 01 00        	movs	r1, r0
      b4: 0c 00        	movs	r4, r1
		...
      be: 00 00        	movs	r0, r0
      c0: 02 00        	movs	r2, r0
      c2: 00 00        	movs	r0, r0
      c4: 0c 00        	movs	r4, r1
      c6: 00 00        	movs	r0, r0
      c8: ff           	<unknown>
      c9: ff           	<unknown>
      ca: ff           	<unknown>
      cb: ff 01        	lsls	r7, r7, #7
      cd: 00 02        	lsls	r0, r0, #8
      cf: 7c 0e        	lsrs	r4, r7, #25
      d1: 0c 0d        	lsrs	r4, r1, #20
      d3: 00 0c        	lsrs	r0, r0, #16

000000d4 <$d>:
      d4: 0c 00        	movs	r4, r1
      d6: 00 00        	movs	r0, r0
      d8: c4 00        	lsls	r4, r0, #3
      da: 00 00        	movs	r0, r0
      dc: 6c 09        	lsrs	r4, r5, #5
      de: 00 20        	movs	r0, #0
      e0: 74 00        	lsls	r4, r6, #1
      e2: 00 00        	movs	r0, r0
      e4: 14 00        	movs	r4, r2
      e6: 00 00        	movs	r0, r0
      e8: c4 00        	lsls	r4, r0, #3
      ea: 00 00        	movs	r0, r0
      ec: 00 00        	movs	r0, r0
      ee: 00 00        	movs	r0, r0
      f0: 50 00        	lsls	r0, r2, #1
      f2: 00 00        	movs	r0, r0
      f4: 41 0e        	lsrs	r1, r0, #25
      f6: 08 83        	strh	r0, [r1, #24]
      f8: 02 8e        	ldrh	r2, [r0, #48]
      fa: 01 00        	movs	r1, r0
      fc: 0c 00        	movs	r4, r1
      fe: 00 00        	movs	r0, r0
     100: c4 00        	lsls	r4, r0, #3
     102: 00 00        	movs	r0, r0
     104: 00 00        	movs	r0, r0
     106: 00 00        	movs	r0, r0
     108: 24 00        	movs	r4, r4
     10a: 00 00        	movs	r0, r0
     10c: 14 00        	movs	r4, r2
     10e: 00 00        	movs	r0, r0
     110: c4 00        	lsls	r4, r0, #3
     112: 00 00        	movs	r0, r0
     114: 00 00        	movs	r0, r0
     116: 00 00        	movs	r0, r0
     118: 18 00        	movs	r0, r3
     11a: 00 00        	movs	r0, r0
     11c: 41 0e        	lsrs	r1, r0, #25
     11e: 08 83        	strh	r0, [r1, #24]
     120: 02 8e        	ldrh	r2, [r0, #48]
     122: 01 00        	movs	r1, r0
     124: 14 00        	movs	r4, r2
     126: 00 00        	movs	r0, r0
     128: c4 00        	lsls	r4, r0, #3
     12a: 00 00        	movs	r0, r0
     12c: 00 00        	movs	r0, r0
     12e: 00 00        	movs	r0, r0
     130: 18 00        	movs	r0, r3
     132: 00 00        	movs	r0, r0
     134: 41 0e        	lsrs	r1, r0, #25
     136: 08 83        	strh	r0, [r1, #24]
     138: 02 8e        	ldrh	r2, [r0, #48]
     13a: 01 00        	movs	r1, r0
     13c: 14 00        	movs	r4, r2
     13e: 00 00        	movs	r0, r0
     140: c4 00        	lsls	r4, r0, #3
     142: 00 00        	movs	r0, r0
     144: e0 09        	lsrs	r0, r4, #7
     146: 00 20        	movs	r0, #0
     148: 18 00        	movs	r0, r3
     14a: 00 00        	movs	r0, r0
     14c: 41 0e        	lsrs	r1, r0, #25
     14e: 08 84        	strh	r0, [r1, #32]
     150: 02 8e        	ldrh	r2, [r0, #48]
     152: 01 00        	movs	r1, r0
     154: 2c 00        	movs	r4, r5
     156: 00 00        	movs	r0, r0
     158: c4 00        	lsls	r4, r0, #3
     15a: 00 00        	movs	r0, r0
     15c: f8 09        	lsrs	r0, r7, #7
     15e: 00 20        	movs	r0, #0
     160: 40 02        	lsls	r0, r0, #9
     162: 00 00        	movs	r0, r0
     164: 42 0e        	lsrs	r2, r0, #25
     166: 24 84        	strh	r4, [r4, #32]
     168: 09 85        	strh	r1, [r1, #40]
     16a: 08 86        	strh	r0, [r1, #48]
     16c: 07 87        	strh	r7, [r0, #56]
     16e: 06 88        	ldrh	r6, [r0]
     170: 05 89        	ldrh	r5, [r0, #8]
     172: 04 8a        	ldrh	r4, [r0, #16]
     174: 03 8b        	ldrh	r3, [r0, #24]
     176: 02 8e        	ldrh	r2, [r0, #48]
     178: 01 41        	asrs	r1, r0
     17a: 0e 40        	ands	r6, r1
     17c: 03 0c        	lsrs	r3, r0, #16
     17e: 01 0e        	lsrs	r1, r0, #24
     180: 24 00        	movs	r4, r4
     182: 00 00        	movs	r0, r0
     184: 0c 00        	movs	r4, r1
     186: 00 00        	movs	r0, r0
     188: c4 00        	lsls	r4, r0, #3
     18a: 00 00        	movs	r0, r0
     18c: 00 00        	movs	r0, r0
     18e: 00 00        	movs	r0, r0
     190: 1c 00        	movs	r4, r3
     192: 00 00        	movs	r0, r0
     194: 0c 00        	movs	r4, r1
     196: 00 00        	movs	r0, r0
     198: c4 00        	lsls	r4, r0, #3
     19a: 00 00        	movs	r0, r0
     19c: 00 00        	movs	r0, r0
     19e: 00 00        	movs	r0, r0
     1a0: 0c 00        	movs	r4, r1
     1a2: 00 00        	movs	r0, r0
     1a4: 18 00        	movs	r0, r3
     1a6: 00 00        	movs	r0, r0
     1a8: c4 00        	lsls	r4, r0, #3
     1aa: 00 00        	movs	r0, r0
     1ac: 00 00        	movs	r0, r0
     1ae: 00 00        	movs	r0, r0
     1b0: 44 00        	lsls	r4, r0, #1
     1b2: 00 00        	movs	r0, r0
     1b4: 41 0e        	lsrs	r1, r0, #25
     1b6: 10 83        	strh	r0, [r2, #24]
     1b8: 04 84        	strh	r4, [r0, #32]
     1ba: 03 85        	strh	r3, [r0, #40]
     1bc: 02 8e        	ldrh	r2, [r0, #48]
     1be: 01 00        	movs	r1, r0
     1c0: 14 00        	movs	r4, r2
     1c2: 00 00        	movs	r0, r0
     1c4: c4 00        	lsls	r4, r0, #3
     1c6: 00 00        	movs	r0, r0
     1c8: 00 00        	movs	r0, r0
     1ca: 00 00        	movs	r0, r0
     1cc: 34 00        	movs	r4, r6
     1ce: 00 00        	movs	r0, r0
     1d0: 41 0e        	lsrs	r1, r0, #25
     1d2: 08 83        	strh	r0, [r1, #24]
     1d4: 02 8e        	ldrh	r2, [r0, #48]
     1d6: 01 00        	movs	r1, r0
     1d8: 14 00        	movs	r4, r2
     1da: 00 00        	movs	r0, r0
     1dc: c4 00        	lsls	r4, r0, #3
     1de: 00 00        	movs	r0, r0
     1e0: 00 00        	movs	r0, r0
     1e2: 00 00        	movs	r0, r0
     1e4: 3c 00        	movs	r4, r7
     1e6: 00 00        	movs	r0, r0
     1e8: 41 0e        	lsrs	r1, r0, #25
     1ea: 08 83        	strh	r0, [r1, #24]
     1ec: 02 8e        	ldrh	r2, [r0, #48]
     1ee: 01 00        	movs	r1, r0
     1f0: 18 00        	movs	r0, r3
     1f2: 00 00        	movs	r0, r0
     1f4: c4 00        	lsls	r4, r0, #3
     1f6: 00 00        	movs	r0, r0
     1f8: 00 00        	movs	r0, r0
     1fa: 00 00        	movs	r0, r0
     1fc: 18 00        	movs	r0, r3
     1fe: 00 00        	movs	r0, r0
     200: 41 0e        	lsrs	r1, r0, #25
     202: 10 83        	strh	r0, [r2, #24]
     204: 04 84        	strh	r4, [r0, #32]
     206: 03 85        	strh	r3, [r0, #40]
     208: 02 8e        	ldrh	r2, [r0, #48]
     20a: 01 00        	movs	r1, r0
     20c: 14 00        	movs	r4, r2
     20e: 00 00        	movs	r0, r0
     210: c4 00        	lsls	r4, r0, #3
     212: 00 00        	movs	r0, r0
     214: 00 00        	movs	r0, r0
     216: 00 00        	movs	r0, r0
     218: 28 00        	movs	r0, r5
     21a: 00 00        	movs	r0, r0
     21c: 41 0e        	lsrs	r1, r0, #25
     21e: 08 83        	strh	r0, [r1, #24]
     220: 02 8e        	ldrh	r2, [r0, #48]
     222: 01 00        	movs	r1, r0
     224: 0c 00        	movs	r4, r1
     226: 00 00        	movs	r0, r0
     228: ff           	<unknown>
     229: ff           	<unknown>
     22a: ff           	<unknown>
     22b: ff 01        	lsls	r7, r7, #7
     22d: 00 02        	lsls	r0, r0, #8
     22f: 7c 0e        	lsrs	r4, r7, #25
     231: 0c 0d        	lsrs	r4, r1, #20
     233: 00 0c        	lsrs	r0, r0, #16

00000234 <$d>:
     234: 0c 00        	movs	r4, r1
     236: 00 00        	movs	r0, r0
     238: 24 02        	lsls	r4, r4, #8
     23a: 00 00        	movs	r0, r0
     23c: 40 0c        	lsrs	r0, r0, #17
     23e: 00 20        	movs	r0, #0
     240: 34 00        	movs	r4, r6
     242: 00 00        	movs	r0, r0
     244: 0c 00        	movs	r4, r1
     246: 00 00        	movs	r0, r0
     248: 24 02        	lsls	r4, r4, #8
     24a: 00 00        	movs	r0, r0
     24c: 74 0c        	lsrs	r4, r6, #17
     24e: 00 20        	movs	r0, #0
     250: 10 00        	movs	r0, r2
     252: 00 00        	movs	r0, r0
     254: 0c 00        	movs	r4, r1
     256: 00 00        	movs	r0, r0
     258: 24 02        	lsls	r4, r4, #8
     25a: 00 00        	movs	r0, r0
     25c: 84 0c        	lsrs	r4, r0, #18
     25e: 00 20        	movs	r0, #0
     260: 14 00        	movs	r4, r2
     262: 00 00        	movs	r0, r0
     264: 0c 00        	movs	r4, r1
     266: 00 00        	movs	r0, r0
     268: 24 02        	lsls	r4, r4, #8
     26a: 00 00        	movs	r0, r0
     26c: 98 0c        	lsrs	r0, r3, #18
     26e: 00 20        	movs	r0, #0
     270: 0c 00        	movs	r4, r1
     272: 00 00        	movs	r0, r0
     274: 0c 00        	movs	r4, r1
     276: 00 00        	movs	r0, r0
     278: 24 02        	lsls	r4, r4, #8
     27a: 00 00        	movs	r0, r0
     27c: a4 0c        	lsrs	r4, r4, #18
     27e: 00 20        	movs	r0, #0
     280: 28 00        	movs	r0, r5
     282: 00 00        	movs	r0, r0
     284: 0c 00        	movs	r4, r1
     286: 00 00        	movs	r0, r0
     288: 24 02        	lsls	r4, r4, #8
     28a: 00 00        	movs	r0, r0
     28c: cc 0c        	lsrs	r4, r1, #19
     28e: 00 20        	movs	r0, #0
     290: 0c 00        	movs	r4, r1
     292: 00 00        	movs	r0, r0
     294: 0c 00        	movs	r4, r1
     296: 00 00        	movs	r0, r0
     298: 24 02        	lsls	r4, r4, #8
     29a: 00 00        	movs	r0, r0
     29c: d8 0c        	lsrs	r0, r3, #19
     29e: 00 20        	movs	r0, #0
     2a0: 20 00        	movs	r0, r4
     2a2: 00 00        	movs	r0, r0
     2a4: 0c 00        	movs	r4, r1
     2a6: 00 00        	movs	r0, r0
     2a8: 24 02        	lsls	r4, r4, #8
     2aa: 00 00        	movs	r0, r0
     2ac: f8 0c        	lsrs	r0, r7, #19
     2ae: 00 20        	movs	r0, #0
     2b0: 0c 00        	movs	r4, r1
     2b2: 00 00        	movs	r0, r0
     2b4: 0c 00        	movs	r4, r1
     2b6: 00 00        	movs	r0, r0
     2b8: 24 02        	lsls	r4, r4, #8
     2ba: 00 00        	movs	r0, r0
     2bc: 04 0d        	lsrs	r4, r0, #20
     2be: 00 20        	movs	r0, #0
     2c0: 14 00        	movs	r4, r2
     2c2: 00 00        	movs	r0, r0
     2c4: 0c 00        	movs	r4, r1
     2c6: 00 00        	movs	r0, r0
     2c8: 24 02        	lsls	r4, r4, #8
     2ca: 00 00        	movs	r0, r0
     2cc: 18 0d        	lsrs	r0, r3, #20
     2ce: 00 20        	movs	r0, #0
     2d0: 0c 00        	movs	r4, r1
     2d2: 00 00        	movs	r0, r0
     2d4: 0c 00        	movs	r4, r1
     2d6: 00 00        	movs	r0, r0
     2d8: 24 02        	lsls	r4, r4, #8
     2da: 00 00        	movs	r0, r0
     2dc: 24 0d        	lsrs	r4, r4, #20
     2de: 00 20        	movs	r0, #0
     2e0: 0c 00        	movs	r4, r1
     2e2: 00 00        	movs	r0, r0
     2e4: 0c 00        	movs	r4, r1
     2e6: 00 00        	movs	r0, r0
     2e8: 24 02        	lsls	r4, r4, #8
     2ea: 00 00        	movs	r0, r0
     2ec: 30 0d        	lsrs	r0, r6, #20
     2ee: 00 20        	movs	r0, #0
     2f0: 14 00        	movs	r4, r2
     2f2: 00 00        	movs	r0, r0
     2f4: 0c 00        	movs	r4, r1
     2f6: 00 00        	movs	r0, r0
     2f8: 24 02        	lsls	r4, r4, #8
     2fa: 00 00        	movs	r0, r0
     2fc: 44 0d        	lsrs	r4, r0, #21
     2fe: 00 20        	movs	r0, #0
     300: 14 00        	movs	r4, r2
     302: 00 00        	movs	r0, r0
     304: 0c 00        	movs	r4, r1
     306: 00 00        	movs	r0, r0
     308: 24 02        	lsls	r4, r4, #8
     30a: 00 00        	movs	r0, r0
     30c: 58 0d        	lsrs	r0, r3, #21
     30e: 00 20        	movs	r0, #0
     310: 14 00        	movs	r4, r2
     312: 00 00        	movs	r0, r0
     314: 0c 00        	movs	r4, r1
     316: 00 00        	movs	r0, r0
     318: 24 02        	lsls	r4, r4, #8
     31a: 00 00        	movs	r0, r0
     31c: 6c 0d        	lsrs	r4, r5, #21
     31e: 00 20        	movs	r0, #0
     320: 10 00        	movs	r0, r2
     322: 00 00        	movs	r0, r0
     324: 0c 00        	movs	r4, r1
     326: 00 00        	movs	r0, r0
     328: 24 02        	lsls	r4, r4, #8
     32a: 00 00        	movs	r0, r0
     32c: 7c 0d        	lsrs	r4, r7, #21
     32e: 00 20        	movs	r0, #0
     330: 14 00        	movs	r4, r2
     332: 00 00        	movs	r0, r0
     334: 0c 00        	movs	r4, r1
     336: 00 00        	movs	r0, r0
     338: 24 02        	lsls	r4, r4, #8
     33a: 00 00        	movs	r0, r0
     33c: 90 0d        	lsrs	r0, r2, #22
     33e: 00 20        	movs	r0, #0
     340: 14 00        	movs	r4, r2
     342: 00 00        	movs	r0, r0
     344: 0c 00        	movs	r4, r1
     346: 00 00        	movs	r0, r0
     348: 24 02        	lsls	r4, r4, #8
     34a: 00 00        	movs	r0, r0
     34c: a4 0d        	lsrs	r4, r4, #22
     34e: 00 20        	movs	r0, #0
     350: 14 00        	movs	r4, r2
     352: 00 00        	movs	r0, r0
     354: 18 00        	movs	r0, r3
     356: 00 00        	movs	r0, r0
     358: 24 02        	lsls	r4, r4, #8
     35a: 00 00        	movs	r0, r0
     35c: b8 0d        	lsrs	r0, r7, #22
     35e: 00 20        	movs	r0, #0
     360: b8 00        	lsls	r0, r7, #2
     362: 00 00        	movs	r0, r0
     364: 41 0e        	lsrs	r1, r0, #25
     366: 04 84        	strh	r4, [r0, #32]
     368: 01 02        	lsls	r1, r0, #8
     36a: 51 c4        	stm	r4!, {r0, r4, r6}
     36c: 0e 00        	movs	r6, r1
     36e: 00 00        	movs	r0, r0
     370: 0c 00        	movs	r4, r1
     372: 00 00        	movs	r0, r0
     374: 24 02        	lsls	r4, r4, #8
     376: 00 00        	movs	r0, r0
     378: 70 0e        	lsrs	r0, r6, #25
     37a: 00 20        	movs	r0, #0
     37c: 30 00        	movs	r0, r6
     37e: 00 00        	movs	r0, r0
     380: 0c 00        	movs	r4, r1
     382: 00 00        	movs	r0, r0
     384: 24 02        	lsls	r4, r4, #8
     386: 00 00        	movs	r0, r0
     388: a0 0e        	lsrs	r0, r4, #26
     38a: 00 20        	movs	r0, #0
     38c: 0c 00        	movs	r4, r1
     38e: 00 00        	movs	r0, r0
     390: 0c 00        	movs	r4, r1
     392: 00 00        	movs	r0, r0
     394: 24 02        	lsls	r4, r4, #8
     396: 00 00        	movs	r0, r0
     398: ac 0e        	lsrs	r4, r5, #26
     39a: 00 20        	movs	r0, #0
     39c: 0c 00        	movs	r4, r1
     39e: 00 00        	movs	r0, r0
     3a0: 0c 00        	movs	r4, r1
     3a2: 00 00        	movs	r0, r0
     3a4: 24 02        	lsls	r4, r4, #8
     3a6: 00 00        	movs	r0, r0
     3a8: b8 0e        	lsrs	r0, r7, #26
     3aa: 00 20        	movs	r0, #0
     3ac: 0c 00        	movs	r4, r1
     3ae: 00 00        	movs	r0, r0
     3b0: 0c 00        	movs	r4, r1
     3b2: 00 00        	movs	r0, r0
     3b4: 24 02        	lsls	r4, r4, #8
     3b6: 00 00        	movs	r0, r0
     3b8: c4 0e        	lsrs	r4, r0, #27
     3ba: 00 20        	movs	r0, #0
     3bc: 1c 00        	movs	r4, r3
     3be: 00 00        	movs	r0, r0
     3c0: 0c 00        	movs	r4, r1
     3c2: 00 00        	movs	r0, r0
     3c4: 24 02        	lsls	r4, r4, #8
     3c6: 00 00        	movs	r0, r0
     3c8: e0 0e        	lsrs	r0, r4, #27
     3ca: 00 20        	movs	r0, #0
     3cc: 1c 00        	movs	r4, r3
     3ce: 00 00        	movs	r0, r0
     3d0: 0c 00        	movs	r4, r1
     3d2: 00 00        	movs	r0, r0
     3d4: 24 02        	lsls	r4, r4, #8
     3d6: 00 00        	movs	r0, r0
     3d8: fc 0e        	lsrs	r4, r7, #27
     3da: 00 20        	movs	r0, #0
     3dc: 1c 00        	movs	r4, r3
     3de: 00 00        	movs	r0, r0
     3e0: 0c 00        	movs	r4, r1
     3e2: 00 00        	movs	r0, r0
     3e4: 24 02        	lsls	r4, r4, #8
     3e6: 00 00        	movs	r0, r0
     3e8: 18 0f        	lsrs	r0, r3, #28
     3ea: 00 20        	movs	r0, #0
     3ec: 1c 00        	movs	r4, r3
     3ee: 00 00        	movs	r0, r0
     3f0: 0c 00        	movs	r4, r1
     3f2: 00 00        	movs	r0, r0
     3f4: 24 02        	lsls	r4, r4, #8
     3f6: 00 00        	movs	r0, r0
     3f8: 34 0f        	lsrs	r4, r6, #28
     3fa: 00 20        	movs	r0, #0
     3fc: 1c 00        	movs	r4, r3
     3fe: 00 00        	movs	r0, r0
     400: 0c 00        	movs	r4, r1
     402: 00 00        	movs	r0, r0
     404: 24 02        	lsls	r4, r4, #8
     406: 00 00        	movs	r0, r0
     408: 50 0f        	lsrs	r0, r2, #29
     40a: 00 20        	movs	r0, #0
     40c: 1c 00        	movs	r4, r3
     40e: 00 00        	movs	r0, r0
     410: 0c 00        	movs	r4, r1
     412: 00 00        	movs	r0, r0
     414: 24 02        	lsls	r4, r4, #8
     416: 00 00        	movs	r0, r0
     418: 6c 0f        	lsrs	r4, r5, #29
     41a: 00 20        	movs	r0, #0
     41c: 1c 00        	movs	r4, r3
     41e: 00 00        	movs	r0, r0
     420: 0c 00        	movs	r4, r1
     422: 00 00        	movs	r0, r0
     424: 24 02        	lsls	r4, r4, #8
     426: 00 00        	movs	r0, r0
     428: 88 0f        	lsrs	r0, r1, #30
     42a: 00 20        	movs	r0, #0
     42c: 1c 00        	movs	r4, r3
     42e: 00 00        	movs	r0, r0
     430: 0c 00        	movs	r4, r1
     432: 00 00        	movs	r0, r0
     434: 24 02        	lsls	r4, r4, #8
     436: 00 00        	movs	r0, r0
     438: a4 0f        	lsrs	r4, r4, #30
     43a: 00 20        	movs	r0, #0
     43c: 1c 00        	movs	r4, r3
     43e: 00 00        	movs	r0, r0
     440: 0c 00        	movs	r4, r1
     442: 00 00        	movs	r0, r0
     444: 24 02        	lsls	r4, r4, #8
     446: 00 00        	movs	r0, r0
     448: c0 0f        	lsrs	r0, r0, #31
     44a: 00 20        	movs	r0, #0
     44c: 1c 00        	movs	r4, r3
     44e: 00 00        	movs	r0, r0
     450: 0c 00        	movs	r4, r1
     452: 00 00        	movs	r0, r0
     454: 24 02        	lsls	r4, r4, #8
     456: 00 00        	movs	r0, r0
     458: dc 0f        	lsrs	r4, r3, #31
     45a: 00 20        	movs	r0, #0
     45c: 1c 00        	movs	r4, r3
     45e: 00 00        	movs	r0, r0
     460: 0c 00        	movs	r4, r1
     462: 00 00        	movs	r0, r0
     464: 24 02        	lsls	r4, r4, #8
     466: 00 00        	movs	r0, r0
     468: f8 0f        	lsrs	r0, r7, #31
     46a: 00 20        	movs	r0, #0
     46c: 1c 00        	movs	r4, r3
     46e: 00 00        	movs	r0, r0
     470: 0c 00        	movs	r4, r1
     472: 00 00        	movs	r0, r0
     474: 24 02        	lsls	r4, r4, #8
     476: 00 00        	movs	r0, r0
     478: 14 10        	asrs	r4, r2, #32
     47a: 00 20        	movs	r0, #0
     47c: 1c 00        	movs	r4, r3
     47e: 00 00        	movs	r0, r0
     480: 0c 00        	movs	r4, r1
     482: 00 00        	movs	r0, r0
     484: 24 02        	lsls	r4, r4, #8
     486: 00 00        	movs	r0, r0
     488: 30 10        	asrs	r0, r6, #32
     48a: 00 20        	movs	r0, #0
     48c: 1c 00        	movs	r4, r3
     48e: 00 00        	movs	r0, r0
     490: 0c 00        	movs	r4, r1
     492: 00 00        	movs	r0, r0
     494: 24 02        	lsls	r4, r4, #8
     496: 00 00        	movs	r0, r0
     498: 4c 10        	asrs	r4, r1, #1
     49a: 00 20        	movs	r0, #0
     49c: 1c 00        	movs	r4, r3
     49e: 00 00        	movs	r0, r0
     4a0: 0c 00        	movs	r4, r1
     4a2: 00 00        	movs	r0, r0
     4a4: 24 02        	lsls	r4, r4, #8
     4a6: 00 00        	movs	r0, r0
     4a8: 68 10        	asrs	r0, r5, #1
     4aa: 00 20        	movs	r0, #0
     4ac: 1c 00        	movs	r4, r3
     4ae: 00 00        	movs	r0, r0
     4b0: 0c 00        	movs	r4, r1
     4b2: 00 00        	movs	r0, r0
     4b4: 24 02        	lsls	r4, r4, #8
     4b6: 00 00        	movs	r0, r0
     4b8: 84 10        	asrs	r4, r0, #2
     4ba: 00 20        	movs	r0, #0
     4bc: 34 00        	movs	r4, r6
     4be: 00 00        	movs	r0, r0
     4c0: 18 00        	movs	r0, r3
     4c2: 00 00        	movs	r0, r0
     4c4: 24 02        	lsls	r4, r4, #8
     4c6: 00 00        	movs	r0, r0
     4c8: b8 10        	asrs	r0, r7, #2
     4ca: 00 20        	movs	r0, #0
     4cc: 34 00        	movs	r4, r6
     4ce: 00 00        	movs	r0, r0
     4d0: 41 0e        	lsrs	r1, r0, #25
     4d2: 04 8e        	ldrh	r4, [r0, #48]
     4d4: 01 41        	asrs	r1, r0
     4d6: 0e 10        	asrs	r6, r1, #32
     4d8: 56 0e        	lsrs	r6, r2, #25
     4da: 04 00        	movs	r4, r0
     4dc: 0c 00        	movs	r4, r1
     4de: 00 00        	movs	r0, r0
     4e0: 24 02        	lsls	r4, r4, #8
     4e2: 00 00        	movs	r0, r0
     4e4: ec 10        	asrs	r4, r5, #3
     4e6: 00 20        	movs	r0, #0
     4e8: 10 00        	movs	r0, r2
     4ea: 00 00        	movs	r0, r0
     4ec: 0c 00        	movs	r4, r1
     4ee: 00 00        	movs	r0, r0
     4f0: 24 02        	lsls	r4, r4, #8
     4f2: 00 00        	movs	r0, r0
     4f4: fc 10        	asrs	r4, r7, #3
     4f6: 00 20        	movs	r0, #0
     4f8: 14 00        	movs	r4, r2
     4fa: 00 00        	movs	r0, r0
     4fc: 0c 00        	movs	r4, r1
     4fe: 00 00        	movs	r0, r0
     500: 24 02        	lsls	r4, r4, #8
     502: 00 00        	movs	r0, r0
     504: 10 11        	asrs	r0, r2, #4
     506: 00 20        	movs	r0, #0
     508: 0c 00        	movs	r4, r1
     50a: 00 00        	movs	r0, r0
     50c: 0c 00        	movs	r4, r1
     50e: 00 00        	movs	r0, r0
     510: ff           	<unknown>
     511: ff           	<unknown>
     512: ff           	<unknown>
     513: ff 01        	lsls	r7, r7, #7
     515: 00 02        	lsls	r0, r0, #8
     517: 7c 0e        	lsrs	r4, r7, #25
     519: 0c 0d        	lsrs	r4, r1, #20
     51b: 00 14        	asrs	r0, r0, #16

0000051c <$d>:
     51c: 14 00        	movs	r4, r2
     51e: 00 00        	movs	r0, r0
     520: 0c 05        	lsls	r4, r1, #20
     522: 00 00        	movs	r0, r0
     524: 1c 11        	asrs	r4, r3, #4
     526: 00 20        	movs	r0, #0
     528: 04 01        	lsls	r4, r0, #4
     52a: 00 00        	movs	r0, r0
     52c: 41 0e        	lsrs	r1, r0, #25
     52e: 08 83        	strh	r0, [r1, #24]
     530: 02 8e        	ldrh	r2, [r0, #48]
     532: 01 00        	movs	r1, r0
     534: 1c 00        	movs	r4, r3
     536: 00 00        	movs	r0, r0
     538: 0c 05        	lsls	r4, r1, #20
     53a: 00 00        	movs	r0, r0
     53c: 20 12        	asrs	r0, r4, #8
     53e: 00 20        	movs	r0, #0
     540: 82 00        	lsls	r2, r0, #2
     542: 00 00        	movs	r0, r0
     544: 41 0e        	lsrs	r1, r0, #25
     546: 0c 84        	strh	r4, [r1, #32]
     548: 03 85        	strh	r3, [r0, #40]
     54a: 02 86        	strh	r2, [r0, #48]
     54c: 01 7f        	ldrb	r1, [r0, #28]
     54e: c6 c5        	stm	r5!, {r1, r2, r6, r7}
     550: c4 0e        	lsrs	r4, r0, #27
     552: 00 00        	movs	r0, r0
     554: 0c 00        	movs	r4, r1
     556: 00 00        	movs	r0, r0
     558: 0c 05        	lsls	r4, r1, #20
     55a: 00 00        	movs	r0, r0
     55c: a4 12        	asrs	r4, r4, #10
     55e: 00 20        	movs	r0, #0
     560: 12 00        	movs	r2, r2
     562: 00 00        	movs	r0, r0
     564: 14 00        	movs	r4, r2
     566: 00 00        	movs	r0, r0
     568: 0c 05        	lsls	r4, r1, #20
     56a: 00 00        	movs	r0, r0
     56c: b8 12        	asrs	r0, r7, #10
     56e: 00 20        	movs	r0, #0
     570: 24 00        	movs	r4, r4
     572: 00 00        	movs	r0, r0
     574: 41 0e        	lsrs	r1, r0, #25
     576: 08 50        	str	r0, [r1, r0]
     578: 0e 00        	movs	r6, r1
     57a: 00 00        	movs	r0, r0
     57c: 0c 00        	movs	r4, r1
     57e: 00 00        	movs	r0, r0
     580: 0c 05        	lsls	r4, r1, #20
     582: 00 00        	movs	r0, r0
     584: dc 12        	asrs	r4, r3, #11
     586: 00 20        	movs	r0, #0
     588: 0e 00        	movs	r6, r1
     58a: 00 00        	movs	r0, r0
     58c: 0c 00        	movs	r4, r1
     58e: 00 00        	movs	r0, r0
     590: 0c 05        	lsls	r4, r1, #20
     592: 00 00        	movs	r0, r0
     594: ec 12        	asrs	r4, r5, #11
     596: 00 20        	movs	r0, #0
     598: 06 00        	movs	r6, r0
     59a: 00 00        	movs	r0, r0
     59c: 0c 00        	movs	r4, r1
     59e: 00 00        	movs	r0, r0
     5a0: 0c 05        	lsls	r4, r1, #20
     5a2: 00 00        	movs	r0, r0
     5a4: f4 12        	asrs	r4, r6, #11
     5a6: 00 20        	movs	r0, #0
     5a8: 0e 00        	movs	r6, r1
     5aa: 00 00        	movs	r0, r0
     5ac: 0c 00        	movs	r4, r1
     5ae: 00 00        	movs	r0, r0
     5b0: 0c 05        	lsls	r4, r1, #20
     5b2: 00 00        	movs	r0, r0
     5b4: 04 13        	asrs	r4, r0, #12
     5b6: 00 20        	movs	r0, #0
     5b8: 06 00        	movs	r6, r0
     5ba: 00 00        	movs	r0, r0
     5bc: 0c 00        	movs	r4, r1
     5be: 00 00        	movs	r0, r0
     5c0: 0c 05        	lsls	r4, r1, #20
     5c2: 00 00        	movs	r0, r0
     5c4: 0c 13        	asrs	r4, r1, #12
     5c6: 00 20        	movs	r0, #0
     5c8: 04 00        	movs	r4, r0
     5ca: 00 00        	movs	r0, r0
     5cc: 0c 00        	movs	r4, r1
     5ce: 00 00        	movs	r0, r0
     5d0: 0c 05        	lsls	r4, r1, #20
     5d2: 00 00        	movs	r0, r0
     5d4: 10 13        	asrs	r0, r2, #12
     5d6: 00 20        	movs	r0, #0
     5d8: 04 00        	movs	r4, r0
     5da: 00 00        	movs	r0, r0
     5dc: 0c 00        	movs	r4, r1
     5de: 00 00        	movs	r0, r0
     5e0: 0c 05        	lsls	r4, r1, #20
     5e2: 00 00        	movs	r0, r0
     5e4: 14 13        	asrs	r4, r2, #12
     5e6: 00 20        	movs	r0, #0
     5e8: 0a 00        	movs	r2, r1
     5ea: 00 00        	movs	r0, r0
     5ec: 0c 00        	movs	r4, r1
     5ee: 00 00        	movs	r0, r0
     5f0: 0c 05        	lsls	r4, r1, #20
     5f2: 00 00        	movs	r0, r0
     5f4: 20 13        	asrs	r0, r4, #12
     5f6: 00 20        	movs	r0, #0
     5f8: 04 00        	movs	r4, r0
     5fa: 00 00        	movs	r0, r0
     5fc: 0c 00        	movs	r4, r1
     5fe: 00 00        	movs	r0, r0
     600: 0c 05        	lsls	r4, r1, #20
     602: 00 00        	movs	r0, r0
     604: 24 13        	asrs	r4, r4, #12
     606: 00 20        	movs	r0, #0
     608: 08 00        	movs	r0, r1
     60a: 00 00        	movs	r0, r0
     60c: 18 00        	movs	r0, r3
     60e: 00 00        	movs	r0, r0
     610: 0c 05        	lsls	r4, r1, #20
     612: 00 00        	movs	r0, r0
     614: 2c 13        	asrs	r4, r5, #12
     616: 00 20        	movs	r0, #0
     618: 2e 00        	movs	r6, r5
     61a: 00 00        	movs	r0, r0
     61c: 41 0e        	lsrs	r1, r0, #25
     61e: 08 84        	strh	r0, [r1, #32]
     620: 02 85        	strh	r2, [r0, #40]
     622: 01 55        	strb	r1, [r0, r4]
     624: c5 c4        	stm	r4!, {r0, r2, r6, r7}
     626: 0e 00        	movs	r6, r1

Disassembly of section .shstrtab:

00000000 <.shstrtab>:
       0: 00 2e        	cmp	r6, #0
       2: 73 79        	ldrb	r3, [r6, #5]
       4: 6d 74        	strb	r5, [r5, #17]
       6: 61 62        	str	r1, [r4, #36]
       8: 00 2e        	cmp	r6, #0
       a: 73 74        	strb	r3, [r6, #17]
       c: 72 74        	strb	r2, [r6, #17]
       e: 61 62        	str	r1, [r4, #36]
      10: 00 2e        	cmp	r6, #0
      12: 73 68        	ldr	r3, [r6, #4]
      14: 73 74        	strb	r3, [r6, #17]
      16: 72 74        	strb	r2, [r6, #17]
      18: 61 62        	str	r1, [r4, #36]
      1a: 00 2e        	cmp	r6, #0
      1c: 74 65        	str	r4, [r6, #84]
      1e: 78 74        	strb	r0, [r7, #17]
      20: 00 2e        	cmp	r6, #0
      22: 64 61        	str	r4, [r4, #20]
      24: 74 61        	str	r4, [r6, #20]
      26: 00 2e        	cmp	r6, #0
      28: 62 73        	strb	r2, [r4, #13]
      2a: 73 00        	lsls	r3, r6, #1
      2c: 2e 64        	str	r6, [r5, #64]
      2e: 65 62        	str	r5, [r4, #36]
      30: 75 67        	str	r5, [r6, #116]
      32: 5f 69        	ldr	r7, [r3, #20]
      34: 6e 66        	str	r6, [r5, #100]
      36: 6f 00        	lsls	r7, r5, #1
      38: 2e 64        	str	r6, [r5, #64]
      3a: 65 62        	str	r5, [r4, #36]
      3c: 75 67        	str	r5, [r6, #116]
      3e: 5f 61        	str	r7, [r3, #20]
      40: 62 62        	str	r2, [r4, #36]
      42: 72 65        	str	r2, [r6, #84]
      44: 76 00        	lsls	r6, r6, #1
      46: 2e 64        	str	r6, [r5, #64]
      48: 65 62        	str	r5, [r4, #36]
      4a: 75 67        	str	r5, [r6, #116]
      4c: 5f 6c        	ldr	r7, [r3, #68]
      4e: 6f 63        	str	r7, [r5, #52]
      50: 00 2e        	cmp	r6, #0
      52: 64 65        	str	r4, [r4, #84]
      54: 62 75        	strb	r2, [r4, #21]
      56: 67 5f        	ldrsh	r7, [r4, r5]
      58: 61 72        	strb	r1, [r4, #9]
      5a: 61 6e        	ldr	r1, [r4, #100]
      5c: 67 65        	str	r7, [r4, #84]
      5e: 73 00        	lsls	r3, r6, #1
      60: 2e 64        	str	r6, [r5, #64]
      62: 65 62        	str	r5, [r4, #36]
      64: 75 67        	str	r5, [r6, #116]
      66: 5f 72        	strb	r7, [r3, #9]
      68: 61 6e        	ldr	r1, [r4, #100]
      6a: 67 65        	str	r7, [r4, #84]
      6c: 73 00        	lsls	r3, r6, #1
      6e: 2e 64        	str	r6, [r5, #64]
      70: 65 62        	str	r5, [r4, #36]
      72: 75 67        	str	r5, [r6, #116]
      74: 5f 6c        	ldr	r7, [r3, #68]
      76: 69 6e        	ldr	r1, [r5, #100]
      78: 65 00        	lsls	r5, r4, #1
      7a: 2e 64        	str	r6, [r5, #64]
      7c: 65 62        	str	r5, [r4, #36]
      7e: 75 67        	str	r5, [r6, #116]
      80: 5f 73        	strb	r7, [r3, #13]
      82: 74 72        	strb	r4, [r6, #9]
      84: 00 2e        	cmp	r6, #0
      86: 63 6f        	ldr	r3, [r4, #116]
      88: 6d 6d        	ldr	r5, [r5, #84]
      8a: 65 6e        	ldr	r5, [r4, #100]
      8c: 74 00        	lsls	r4, r6, #1
      8e: 2e 41        	asrs	r6, r5
      90: 52 4d        	ldr	r5, [pc, #328]          @ 0x1dc <.debug_info+0x1dc>
      92: 2e 61        	str	r6, [r5, #16]
      94: 74 74        	strb	r4, [r6, #17]
      96: 72 69        	ldr	r2, [r6, #20]
      98: 62 75        	strb	r2, [r4, #21]
      9a: 74 65        	str	r4, [r6, #84]
      9c: 73 00        	lsls	r3, r6, #1
      9e: 2e 64        	str	r6, [r5, #64]
      a0: 65 62        	str	r5, [r4, #36]
      a2: 75 67        	str	r5, [r6, #116]
      a4: 5f 66        	str	r7, [r3, #100]
      a6: 72 61        	str	r2, [r6, #20]
      a8: 6d 65        	str	r5, [r5, #84]
      aa: 00           	<unknown>

Disassembly of section .symtab:

00000000 <.symtab>:
		...
      14: 10 09        	lsrs	r0, r2, #4
      16: 00 20        	movs	r0, #0
      18: 00 00        	movs	r0, r0
      1a: 00 00        	movs	r0, r0
      1c: 03 00        	movs	r3, r0
      1e: 01 00        	movs	r1, r0
      20: 00 00        	movs	r0, r0
      22: 00 00        	movs	r0, r0
      24: 5c 13        	asrs	r4, r3, #13
      26: 00 20        	movs	r0, #0
      28: 00 00        	movs	r0, r0
      2a: 00 00        	movs	r0, r0
      2c: 03 00        	movs	r3, r0
      2e: 02 00        	movs	r2, r0
      30: 00 00        	movs	r0, r0
      32: 00 00        	movs	r0, r0
      34: 6c 13        	asrs	r4, r5, #13
      36: 00 20        	movs	r0, #0
      38: 00 00        	movs	r0, r0
      3a: 00 00        	movs	r0, r0
      3c: 03 00        	movs	r3, r0
      3e: 03 00        	movs	r3, r0
		...
      4c: 03 00        	movs	r3, r0
      4e: 04 00        	movs	r4, r0
		...
      5c: 03 00        	movs	r3, r0
      5e: 05 00        	movs	r5, r0
		...
      6c: 03 00        	movs	r3, r0
      6e: 06 00        	movs	r6, r0
		...
      7c: 03 00        	movs	r3, r0
      7e: 07 00        	movs	r7, r0
		...
      8c: 03 00        	movs	r3, r0
      8e: 08 00        	movs	r0, r1
		...
      9c: 03 00        	movs	r3, r0
      9e: 09 00        	movs	r1, r1
		...
      ac: 03 00        	movs	r3, r0
      ae: 0a 00        	movs	r2, r1
		...
      bc: 03 00        	movs	r3, r0
      be: 0b 00        	movs	r3, r1
		...
      cc: 03 00        	movs	r3, r0
      ce: 0c 00        	movs	r4, r1
		...
      dc: 03 00        	movs	r3, r0
      de: 0d 00        	movs	r5, r1
      e0: 01 00        	movs	r1, r0
		...
      ea: 00 00        	movs	r0, r0
      ec: 04 00        	movs	r4, r0
      ee: f1           	<unknown>
      ef: ff 08        	lsrs	r7, r7, #3
      f1: 00 00        	movs	r0, r0
      f3: 00 10        	asrs	r0, r0, #32
      f5: 09 00        	movs	r1, r1
      f7: 20 00        	movs	r0, r4
      f9: 00 00        	movs	r0, r0
      fb: 00 00        	movs	r0, r0
      fd: 00 01        	lsls	r0, r0, #4
      ff: 00 0b        	lsrs	r0, r0, #12
     101: 00 00        	movs	r0, r0
     103: 00 68        	ldr	r0, [r0]
     105: 09 00        	movs	r1, r1
     107: 20 00        	movs	r0, r4
     109: 00 00        	movs	r0, r0
     10b: 00 00        	movs	r0, r0
     10d: 00 01        	lsls	r0, r0, #4
     10f: 00 0b        	lsrs	r0, r0, #12
     111: 00 00        	movs	r0, r0
     113: 00 10        	asrs	r0, r0, #32
		...
     11d: 00 0d        	lsrs	r0, r0, #20
     11f: 00 0e        	lsrs	r0, r0, #24
		...
     129: 00 00        	movs	r0, r0
     12b: 00 04        	lsls	r0, r0, #16
     12d: 00 f1 ff 08  	add.w	r8, r0, #255
     131: 00 00        	movs	r0, r0
     133: 00 6c        	ldr	r0, [r0, #64]
     135: 09 00        	movs	r1, r1
     137: 20 00        	movs	r0, r4
     139: 00 00        	movs	r0, r0
     13b: 00 00        	movs	r0, r0
     13d: 00 01        	lsls	r0, r0, #4
     13f: 00 16        	asrs	r0, r0, #24
     141: 00 00        	movs	r0, r0
     143: 00 6d        	ldr	r0, [r0, #80]
     145: 09 00        	movs	r1, r1
     147: 20 74        	strb	r0, [r4, #16]
     149: 00 00        	movs	r0, r0
     14b: 00 02        	lsls	r0, r0, #8
     14d: 00 01        	lsls	r0, r0, #4
     14f: 00 0b        	lsrs	r0, r0, #12
     151: 00 00        	movs	r0, r0
     153: 00 dc        	bgt	0x157 <.debug_info+0x157> @ imm = #0
     155: 09 00        	movs	r1, r1
     157: 20 00        	movs	r0, r4
     159: 00 00        	movs	r0, r0
     15b: 00 00        	movs	r0, r0
     15d: 00 01        	lsls	r0, r0, #4
     15f: 00 08        	lsrs	r0, r0, #32
     161: 00 00        	movs	r0, r0
     163: 00 e0        	b	0x167 <.debug_info+0x167> @ imm = #0
     165: 09 00        	movs	r1, r1
     167: 20 00        	movs	r0, r4
     169: 00 00        	movs	r0, r0
     16b: 00 00        	movs	r0, r0
     16d: 00 01        	lsls	r0, r0, #4
     16f: 00 08        	lsrs	r0, r0, #32
     171: 00 00        	movs	r0, r0
     173: 00 f8 09 00  	strb.w	r0, [r0, r9]
     177: 20 00        	movs	r0, r4
     179: 00 00        	movs	r0, r0
     17b: 00 00        	movs	r0, r0
     17d: 00 01        	lsls	r0, r0, #4
     17f: 00 0b        	lsrs	r0, r0, #12
     181: 00 00        	movs	r0, r0
     183: 00 1c        	adds	r0, r0, #0
     185: 0c 00        	movs	r4, r1
     187: 20 00        	movs	r0, r4
     189: 00 00        	movs	r0, r0
     18b: 00 00        	movs	r0, r0
     18d: 00 01        	lsls	r0, r0, #4
     18f: 00 0b        	lsrs	r0, r0, #12
     191: 00 00        	movs	r0, r0
     193: 00 6c        	ldr	r0, [r0, #64]
     195: 13 00        	movs	r3, r2
     197: 20 00        	movs	r0, r4
     199: 00 00        	movs	r0, r0
     19b: 00 00        	movs	r0, r0
     19d: 00 03        	lsls	r0, r0, #12
     19f: 00 24        	movs	r4, #0
     1a1: 00 00        	movs	r0, r0
     1a3: 00 6c        	ldr	r0, [r0, #64]
     1a5: 13 00        	movs	r3, r2
     1a7: 20 04        	lsls	r0, r4, #16
     1a9: 00 00        	movs	r0, r0
     1ab: 00 01        	lsls	r0, r0, #4
     1ad: 00 03        	lsls	r0, r0, #12
     1af: 00 35        	adds	r5, #0
     1b1: 00 00        	movs	r0, r0
     1b3: 00 70        	strb	r0, [r0]
     1b5: 13 00        	movs	r3, r2
     1b7: 20 04        	lsls	r0, r4, #16
     1b9: 00 00        	movs	r0, r0
     1bb: 00 01        	lsls	r0, r0, #4
     1bd: 00 03        	lsls	r0, r0, #12
     1bf: 00 47        	bx	r0
     1c1: 00 00        	movs	r0, r0
     1c3: 00 74        	strb	r0, [r0, #16]
     1c5: 13 00        	movs	r3, r2
     1c7: 20 04        	lsls	r0, r4, #16
     1c9: 00 00        	movs	r0, r0
     1cb: 00 01        	lsls	r0, r0, #4
     1cd: 00 03        	lsls	r0, r0, #12
     1cf: 00 54        	strb	r0, [r0, r0]
     1d1: 00 00        	movs	r0, r0
     1d3: 00 78        	ldrb	r0, [r0]
     1d5: 13 00        	movs	r3, r2
     1d7: 20 01        	lsls	r0, r4, #4
     1d9: 00 00        	movs	r0, r0
     1db: 00 01        	lsls	r0, r0, #4
     1dd: 00 03        	lsls	r0, r0, #12
     1df: 00 5f        	ldrsh	r0, [r0, r4]
     1e1: 00 00        	movs	r0, r0
     1e3: 00 7c        	ldrb	r0, [r0, #16]
     1e5: 13 00        	movs	r3, r2
     1e7: 20 04        	lsls	r0, r4, #16
     1e9: 00 00        	movs	r0, r0
     1eb: 00 01        	lsls	r0, r0, #4
     1ed: 00 03        	lsls	r0, r0, #12
     1ef: 00 70        	strb	r0, [r0]
     1f1: 00 00        	movs	r0, r0
     1f3: 00 80        	strh	r0, [r0]
     1f5: 13 00        	movs	r3, r2
     1f7: 20 04        	lsls	r0, r4, #16
     1f9: 00 00        	movs	r0, r0
     1fb: 00 01        	lsls	r0, r0, #4
     1fd: 00 03        	lsls	r0, r0, #12
     1ff: 00 0b        	lsrs	r0, r0, #12
     201: 00 00        	movs	r0, r0
     203: 00 d4        	bmi	0x207 <.debug_info+0x207> @ imm = #0
		...
     20d: 00 0d        	lsrs	r0, r0, #20
     20f: 00 80        	strh	r0, [r0]
		...
     219: 00 00        	movs	r0, r0
     21b: 00 04        	lsls	r0, r0, #16
     21d: 00 f1 ff 08  	add.w	r8, r0, #255
     221: 00 00        	movs	r0, r0
     223: 00 38        	subs	r0, #0
     225: 0c 00        	movs	r4, r1
     227: 20 00        	movs	r0, r4
     229: 00 00        	movs	r0, r0
     22b: 00 00        	movs	r0, r0
     22d: 00 01        	lsls	r0, r0, #4
     22f: 00 0b        	lsrs	r0, r0, #12
     231: 00 00        	movs	r0, r0
     233: 00 e4        	b	0xfffffa37 <CallbackContext+0xffffffffdfffe6b7> @ imm = #-2048
		...
     23d: 00 07        	lsls	r0, r0, #28
     23f: 00 bd        	pop	{pc}
		...
     249: 00 00        	movs	r0, r0
     24b: 00 04        	lsls	r0, r0, #16
     24d: 00 f1 ff 08  	add.w	r8, r0, #255
     251: 00 00        	movs	r0, r0
     253: 00 40        	ands	r0, r0
     255: 0c 00        	movs	r4, r1
     257: 20 00        	movs	r0, r4
     259: 00 00        	movs	r0, r0
     25b: 00 00        	movs	r0, r0
     25d: 00 01        	lsls	r0, r0, #4
     25f: 00 0b        	lsrs	r0, r0, #12
     261: 00 00        	movs	r0, r0
     263: 00 6c        	ldr	r0, [r0, #64]
     265: 0c 00        	movs	r4, r1
     267: 20 00        	movs	r0, r4
     269: 00 00        	movs	r0, r0
     26b: 00 00        	movs	r0, r0
     26d: 00 01        	lsls	r0, r0, #4
     26f: 00 08        	lsrs	r0, r0, #32
     271: 00 00        	movs	r0, r0
     273: 00 74        	strb	r0, [r0, #16]
     275: 0c 00        	movs	r4, r1
     277: 20 00        	movs	r0, r4
     279: 00 00        	movs	r0, r0
     27b: 00 00        	movs	r0, r0
     27d: 00 01        	lsls	r0, r0, #4
     27f: 00 0b        	lsrs	r0, r0, #12
     281: 00 00        	movs	r0, r0
     283: 00 80        	strh	r0, [r0]
     285: 0c 00        	movs	r4, r1
     287: 20 00        	movs	r0, r4
     289: 00 00        	movs	r0, r0
     28b: 00 00        	movs	r0, r0
     28d: 00 01        	lsls	r0, r0, #4
     28f: 00 08        	lsrs	r0, r0, #32
     291: 00 00        	movs	r0, r0
     293: 00 84        	strh	r0, [r0, #32]
     295: 0c 00        	movs	r4, r1
     297: 20 00        	movs	r0, r4
     299: 00 00        	movs	r0, r0
     29b: 00 00        	movs	r0, r0
     29d: 00 01        	lsls	r0, r0, #4
     29f: 00 0b        	lsrs	r0, r0, #12
     2a1: 00 00        	movs	r0, r0
     2a3: 00 94        	str	r4, [sp]
     2a5: 0c 00        	movs	r4, r1
     2a7: 20 00        	movs	r0, r4
     2a9: 00 00        	movs	r0, r0
     2ab: 00 00        	movs	r0, r0
     2ad: 00 01        	lsls	r0, r0, #4
     2af: 00 08        	lsrs	r0, r0, #32
     2b1: 00 00        	movs	r0, r0
     2b3: 00 98        	ldr	r0, [sp]
     2b5: 0c 00        	movs	r4, r1
     2b7: 20 00        	movs	r0, r4
     2b9: 00 00        	movs	r0, r0
     2bb: 00 00        	movs	r0, r0
     2bd: 00 01        	lsls	r0, r0, #4
     2bf: 00 0b        	lsrs	r0, r0, #12
     2c1: 00 00        	movs	r0, r0
     2c3: 00 a0        	adr	r0, #0 <.debug_info+0x2c7>
     2c5: 0c 00        	movs	r4, r1
     2c7: 20 00        	movs	r0, r4
     2c9: 00 00        	movs	r0, r0
     2cb: 00 00        	movs	r0, r0
     2cd: 00 01        	lsls	r0, r0, #4
     2cf: 00 08        	lsrs	r0, r0, #32
     2d1: 00 00        	movs	r0, r0
     2d3: 00 a4        	adr	r4, #0 <.debug_info+0x2d7>
     2d5: 0c 00        	movs	r4, r1
     2d7: 20 00        	movs	r0, r4
     2d9: 00 00        	movs	r0, r0
     2db: 00 00        	movs	r0, r0
     2dd: 00 01        	lsls	r0, r0, #4
     2df: 00 0b        	lsrs	r0, r0, #12
     2e1: 00 00        	movs	r0, r0
     2e3: 00           	<unknown>
     2e4: c8 0c        	lsrs	r0, r1, #19
     2e6: 00 20        	movs	r0, #0
     2e8: 00 00        	movs	r0, r0
     2ea: 00 00        	movs	r0, r0
     2ec: 00 00        	movs	r0, r0
     2ee: 01 00        	movs	r1, r0
     2f0: 08 00        	movs	r0, r1
     2f2: 00 00        	movs	r0, r0
     2f4: cc 0c        	lsrs	r4, r1, #19
     2f6: 00 20        	movs	r0, #0
     2f8: 00 00        	movs	r0, r0
     2fa: 00 00        	movs	r0, r0
     2fc: 00 00        	movs	r0, r0
     2fe: 01 00        	movs	r1, r0
     300: 0b 00        	movs	r3, r1
     302: 00 00        	movs	r0, r0
     304: d4 0c        	lsrs	r4, r2, #19
     306: 00 20        	movs	r0, #0
     308: 00 00        	movs	r0, r0
     30a: 00 00        	movs	r0, r0
     30c: 00 00        	movs	r0, r0
     30e: 01 00        	movs	r1, r0
     310: 08 00        	movs	r0, r1
     312: 00 00        	movs	r0, r0
     314: d8 0c        	lsrs	r0, r3, #19
     316: 00 20        	movs	r0, #0
     318: 00 00        	movs	r0, r0
     31a: 00 00        	movs	r0, r0
     31c: 00 00        	movs	r0, r0
     31e: 01 00        	movs	r1, r0
     320: 0b 00        	movs	r3, r1
     322: 00 00        	movs	r0, r0
     324: f4 0c        	lsrs	r4, r6, #19
     326: 00 20        	movs	r0, #0
     328: 00 00        	movs	r0, r0
     32a: 00 00        	movs	r0, r0
     32c: 00 00        	movs	r0, r0
     32e: 01 00        	movs	r1, r0
     330: 08 00        	movs	r0, r1
     332: 00 00        	movs	r0, r0
     334: f8 0c        	lsrs	r0, r7, #19
     336: 00 20        	movs	r0, #0
     338: 00 00        	movs	r0, r0
     33a: 00 00        	movs	r0, r0
     33c: 00 00        	movs	r0, r0
     33e: 01 00        	movs	r1, r0
     340: 0b 00        	movs	r3, r1
     342: 00 00        	movs	r0, r0
     344: 00 0d        	lsrs	r0, r0, #20
     346: 00 20        	movs	r0, #0
     348: 00 00        	movs	r0, r0
     34a: 00 00        	movs	r0, r0
     34c: 00 00        	movs	r0, r0
     34e: 01 00        	movs	r1, r0
     350: 08 00        	movs	r0, r1
     352: 00 00        	movs	r0, r0
     354: 04 0d        	lsrs	r4, r0, #20
     356: 00 20        	movs	r0, #0
     358: 00 00        	movs	r0, r0
     35a: 00 00        	movs	r0, r0
     35c: 00 00        	movs	r0, r0
     35e: 01 00        	movs	r1, r0
     360: 0b 00        	movs	r3, r1
     362: 00 00        	movs	r0, r0
     364: 14 0d        	lsrs	r4, r2, #20
     366: 00 20        	movs	r0, #0
     368: 00 00        	movs	r0, r0
     36a: 00 00        	movs	r0, r0
     36c: 00 00        	movs	r0, r0
     36e: 01 00        	movs	r1, r0
     370: 08 00        	movs	r0, r1
     372: 00 00        	movs	r0, r0
     374: 18 0d        	lsrs	r0, r3, #20
     376: 00 20        	movs	r0, #0
     378: 00 00        	movs	r0, r0
     37a: 00 00        	movs	r0, r0
     37c: 00 00        	movs	r0, r0
     37e: 01 00        	movs	r1, r0
     380: 0b 00        	movs	r3, r1
     382: 00 00        	movs	r0, r0
     384: 20 0d        	lsrs	r0, r4, #20
     386: 00 20        	movs	r0, #0
     388: 00 00        	movs	r0, r0
     38a: 00 00        	movs	r0, r0
     38c: 00 00        	movs	r0, r0
     38e: 01 00        	movs	r1, r0
     390: 08 00        	movs	r0, r1
     392: 00 00        	movs	r0, r0
     394: 24 0d        	lsrs	r4, r4, #20
     396: 00 20        	movs	r0, #0
     398: 00 00        	movs	r0, r0
     39a: 00 00        	movs	r0, r0
     39c: 00 00        	movs	r0, r0
     39e: 01 00        	movs	r1, r0
     3a0: 0b 00        	movs	r3, r1
     3a2: 00 00        	movs	r0, r0
     3a4: 2c 0d        	lsrs	r4, r5, #20
     3a6: 00 20        	movs	r0, #0
     3a8: 00 00        	movs	r0, r0
     3aa: 00 00        	movs	r0, r0
     3ac: 00 00        	movs	r0, r0
     3ae: 01 00        	movs	r1, r0
     3b0: 08 00        	movs	r0, r1
     3b2: 00 00        	movs	r0, r0
     3b4: 30 0d        	lsrs	r0, r6, #20
     3b6: 00 20        	movs	r0, #0
     3b8: 00 00        	movs	r0, r0
     3ba: 00 00        	movs	r0, r0
     3bc: 00 00        	movs	r0, r0
     3be: 01 00        	movs	r1, r0
     3c0: 0b 00        	movs	r3, r1
     3c2: 00 00        	movs	r0, r0
     3c4: 40 0d        	lsrs	r0, r0, #21
     3c6: 00 20        	movs	r0, #0
     3c8: 00 00        	movs	r0, r0
     3ca: 00 00        	movs	r0, r0
     3cc: 00 00        	movs	r0, r0
     3ce: 01 00        	movs	r1, r0
     3d0: 08 00        	movs	r0, r1
     3d2: 00 00        	movs	r0, r0
     3d4: 44 0d        	lsrs	r4, r0, #21
     3d6: 00 20        	movs	r0, #0
     3d8: 00 00        	movs	r0, r0
     3da: 00 00        	movs	r0, r0
     3dc: 00 00        	movs	r0, r0
     3de: 01 00        	movs	r1, r0
     3e0: 0b 00        	movs	r3, r1
     3e2: 00 00        	movs	r0, r0
     3e4: 54 0d        	lsrs	r4, r2, #21
     3e6: 00 20        	movs	r0, #0
     3e8: 00 00        	movs	r0, r0
     3ea: 00 00        	movs	r0, r0
     3ec: 00 00        	movs	r0, r0
     3ee: 01 00        	movs	r1, r0
     3f0: 08 00        	movs	r0, r1
     3f2: 00 00        	movs	r0, r0
     3f4: 58 0d        	lsrs	r0, r3, #21
     3f6: 00 20        	movs	r0, #0
     3f8: 00 00        	movs	r0, r0
     3fa: 00 00        	movs	r0, r0
     3fc: 00 00        	movs	r0, r0
     3fe: 01 00        	movs	r1, r0
     400: 0b 00        	movs	r3, r1
     402: 00 00        	movs	r0, r0
     404: 68 0d        	lsrs	r0, r5, #21
     406: 00 20        	movs	r0, #0
     408: 00 00        	movs	r0, r0
     40a: 00 00        	movs	r0, r0
     40c: 00 00        	movs	r0, r0
     40e: 01 00        	movs	r1, r0
     410: 08 00        	movs	r0, r1
     412: 00 00        	movs	r0, r0
     414: 6c 0d        	lsrs	r4, r5, #21
     416: 00 20        	movs	r0, #0
     418: 00 00        	movs	r0, r0
     41a: 00 00        	movs	r0, r0
     41c: 00 00        	movs	r0, r0
     41e: 01 00        	movs	r1, r0
     420: 0b 00        	movs	r3, r1
     422: 00 00        	movs	r0, r0
     424: 78 0d        	lsrs	r0, r7, #21
     426: 00 20        	movs	r0, #0
     428: 00 00        	movs	r0, r0
     42a: 00 00        	movs	r0, r0
     42c: 00 00        	movs	r0, r0
     42e: 01 00        	movs	r1, r0
     430: 08 00        	movs	r0, r1
     432: 00 00        	movs	r0, r0
     434: 7c 0d        	lsrs	r4, r7, #21
     436: 00 20        	movs	r0, #0
     438: 00 00        	movs	r0, r0
     43a: 00 00        	movs	r0, r0
     43c: 00 00        	movs	r0, r0
     43e: 01 00        	movs	r1, r0
     440: 0b 00        	movs	r3, r1
     442: 00 00        	movs	r0, r0
     444: 8c 0d        	lsrs	r4, r1, #22
     446: 00 20        	movs	r0, #0
     448: 00 00        	movs	r0, r0
     44a: 00 00        	movs	r0, r0
     44c: 00 00        	movs	r0, r0
     44e: 01 00        	movs	r1, r0
     450: 08 00        	movs	r0, r1
     452: 00 00        	movs	r0, r0
     454: 90 0d        	lsrs	r0, r2, #22
     456: 00 20        	movs	r0, #0
     458: 00 00        	movs	r0, r0
     45a: 00 00        	movs	r0, r0
     45c: 00 00        	movs	r0, r0
     45e: 01 00        	movs	r1, r0
     460: 0b 00        	movs	r3, r1
     462: 00 00        	movs	r0, r0
     464: a0 0d        	lsrs	r0, r4, #22
     466: 00 20        	movs	r0, #0
     468: 00 00        	movs	r0, r0
     46a: 00 00        	movs	r0, r0
     46c: 00 00        	movs	r0, r0
     46e: 01 00        	movs	r1, r0
     470: 08 00        	movs	r0, r1
     472: 00 00        	movs	r0, r0
     474: a4 0d        	lsrs	r4, r4, #22
     476: 00 20        	movs	r0, #0
     478: 00 00        	movs	r0, r0
     47a: 00 00        	movs	r0, r0
     47c: 00 00        	movs	r0, r0
     47e: 01 00        	movs	r1, r0
     480: 0b 00        	movs	r3, r1
     482: 00 00        	movs	r0, r0
     484: b4 0d        	lsrs	r4, r6, #22
     486: 00 20        	movs	r0, #0
     488: 00 00        	movs	r0, r0
     48a: 00 00        	movs	r0, r0
     48c: 00 00        	movs	r0, r0
     48e: 01 00        	movs	r1, r0
     490: 08 00        	movs	r0, r1
     492: 00 00        	movs	r0, r0
     494: b8 0d        	lsrs	r0, r7, #22
     496: 00 20        	movs	r0, #0
     498: 00 00        	movs	r0, r0
     49a: 00 00        	movs	r0, r0
     49c: 00 00        	movs	r0, r0
     49e: 01 00        	movs	r1, r0
     4a0: 0b 00        	movs	r3, r1
     4a2: 00 00        	movs	r0, r0
     4a4: 60 0e        	lsrs	r0, r4, #25
     4a6: 00 20        	movs	r0, #0
     4a8: 00 00        	movs	r0, r0
     4aa: 00 00        	movs	r0, r0
     4ac: 00 00        	movs	r0, r0
     4ae: 01 00        	movs	r1, r0
     4b0: 08 00        	movs	r0, r1
     4b2: 00 00        	movs	r0, r0
     4b4: 70 0e        	lsrs	r0, r6, #25
     4b6: 00 20        	movs	r0, #0
     4b8: 00 00        	movs	r0, r0
     4ba: 00 00        	movs	r0, r0
     4bc: 00 00        	movs	r0, r0
     4be: 01 00        	movs	r1, r0
     4c0: 0b 00        	movs	r3, r1
     4c2: 00 00        	movs	r0, r0
     4c4: 9c 0e        	lsrs	r4, r3, #26
     4c6: 00 20        	movs	r0, #0
     4c8: 00 00        	movs	r0, r0
     4ca: 00 00        	movs	r0, r0
     4cc: 00 00        	movs	r0, r0
     4ce: 01 00        	movs	r1, r0
     4d0: 08 00        	movs	r0, r1
     4d2: 00 00        	movs	r0, r0
     4d4: a0 0e        	lsrs	r0, r4, #26
     4d6: 00 20        	movs	r0, #0
     4d8: 00 00        	movs	r0, r0
     4da: 00 00        	movs	r0, r0
     4dc: 00 00        	movs	r0, r0
     4de: 01 00        	movs	r1, r0
     4e0: 0b 00        	movs	r3, r1
     4e2: 00 00        	movs	r0, r0
     4e4: a8 0e        	lsrs	r0, r5, #26
     4e6: 00 20        	movs	r0, #0
     4e8: 00 00        	movs	r0, r0
     4ea: 00 00        	movs	r0, r0
     4ec: 00 00        	movs	r0, r0
     4ee: 01 00        	movs	r1, r0
     4f0: 08 00        	movs	r0, r1
     4f2: 00 00        	movs	r0, r0
     4f4: ac 0e        	lsrs	r4, r5, #26
     4f6: 00 20        	movs	r0, #0
     4f8: 00 00        	movs	r0, r0
     4fa: 00 00        	movs	r0, r0
     4fc: 00 00        	movs	r0, r0
     4fe: 01 00        	movs	r1, r0
     500: 0b 00        	movs	r3, r1
     502: 00 00        	movs	r0, r0
     504: b4 0e        	lsrs	r4, r6, #26
     506: 00 20        	movs	r0, #0
     508: 00 00        	movs	r0, r0
     50a: 00 00        	movs	r0, r0
     50c: 00 00        	movs	r0, r0
     50e: 01 00        	movs	r1, r0
     510: 08 00        	movs	r0, r1
     512: 00 00        	movs	r0, r0
     514: b8 0e        	lsrs	r0, r7, #26
     516: 00 20        	movs	r0, #0
     518: 00 00        	movs	r0, r0
     51a: 00 00        	movs	r0, r0
     51c: 00 00        	movs	r0, r0
     51e: 01 00        	movs	r1, r0
     520: 0b 00        	movs	r3, r1
     522: 00 00        	movs	r0, r0
     524: c0 0e        	lsrs	r0, r0, #27
     526: 00 20        	movs	r0, #0
     528: 00 00        	movs	r0, r0
     52a: 00 00        	movs	r0, r0
     52c: 00 00        	movs	r0, r0
     52e: 01 00        	movs	r1, r0
     530: 08 00        	movs	r0, r1
     532: 00 00        	movs	r0, r0
     534: c4 0e        	lsrs	r4, r0, #27
     536: 00 20        	movs	r0, #0
     538: 00 00        	movs	r0, r0
     53a: 00 00        	movs	r0, r0
     53c: 00 00        	movs	r0, r0
     53e: 01 00        	movs	r1, r0
     540: 0b 00        	movs	r3, r1
     542: 00 00        	movs	r0, r0
     544: dc 0e        	lsrs	r4, r3, #27
     546: 00 20        	movs	r0, #0
     548: 00 00        	movs	r0, r0
     54a: 00 00        	movs	r0, r0
     54c: 00 00        	movs	r0, r0
     54e: 01 00        	movs	r1, r0
     550: 08 00        	movs	r0, r1
     552: 00 00        	movs	r0, r0
     554: e0 0e        	lsrs	r0, r4, #27
     556: 00 20        	movs	r0, #0
     558: 00 00        	movs	r0, r0
     55a: 00 00        	movs	r0, r0
     55c: 00 00        	movs	r0, r0
     55e: 01 00        	movs	r1, r0
     560: 0b 00        	movs	r3, r1
     562: 00 00        	movs	r0, r0
     564: f8 0e        	lsrs	r0, r7, #27
     566: 00 20        	movs	r0, #0
     568: 00 00        	movs	r0, r0
     56a: 00 00        	movs	r0, r0
     56c: 00 00        	movs	r0, r0
     56e: 01 00        	movs	r1, r0
     570: 08 00        	movs	r0, r1
     572: 00 00        	movs	r0, r0
     574: fc 0e        	lsrs	r4, r7, #27
     576: 00 20        	movs	r0, #0
     578: 00 00        	movs	r0, r0
     57a: 00 00        	movs	r0, r0
     57c: 00 00        	movs	r0, r0
     57e: 01 00        	movs	r1, r0
     580: 0b 00        	movs	r3, r1
     582: 00 00        	movs	r0, r0
     584: 14 0f        	lsrs	r4, r2, #28
     586: 00 20        	movs	r0, #0
     588: 00 00        	movs	r0, r0
     58a: 00 00        	movs	r0, r0
     58c: 00 00        	movs	r0, r0
     58e: 01 00        	movs	r1, r0
     590: 08 00        	movs	r0, r1
     592: 00 00        	movs	r0, r0
     594: 18 0f        	lsrs	r0, r3, #28
     596: 00 20        	movs	r0, #0
     598: 00 00        	movs	r0, r0
     59a: 00 00        	movs	r0, r0
     59c: 00 00        	movs	r0, r0
     59e: 01 00        	movs	r1, r0
     5a0: 0b 00        	movs	r3, r1
     5a2: 00 00        	movs	r0, r0
     5a4: 30 0f        	lsrs	r0, r6, #28
     5a6: 00 20        	movs	r0, #0
     5a8: 00 00        	movs	r0, r0
     5aa: 00 00        	movs	r0, r0
     5ac: 00 00        	movs	r0, r0
     5ae: 01 00        	movs	r1, r0
     5b0: 08 00        	movs	r0, r1
     5b2: 00 00        	movs	r0, r0
     5b4: 34 0f        	lsrs	r4, r6, #28
     5b6: 00 20        	movs	r0, #0
     5b8: 00 00        	movs	r0, r0
     5ba: 00 00        	movs	r0, r0
     5bc: 00 00        	movs	r0, r0
     5be: 01 00        	movs	r1, r0
     5c0: 0b 00        	movs	r3, r1
     5c2: 00 00        	movs	r0, r0
     5c4: 4c 0f        	lsrs	r4, r1, #29
     5c6: 00 20        	movs	r0, #0
     5c8: 00 00        	movs	r0, r0
     5ca: 00 00        	movs	r0, r0
     5cc: 00 00        	movs	r0, r0
     5ce: 01 00        	movs	r1, r0
     5d0: 08 00        	movs	r0, r1
     5d2: 00 00        	movs	r0, r0
     5d4: 50 0f        	lsrs	r0, r2, #29
     5d6: 00 20        	movs	r0, #0
     5d8: 00 00        	movs	r0, r0
     5da: 00 00        	movs	r0, r0
     5dc: 00 00        	movs	r0, r0
     5de: 01 00        	movs	r1, r0
     5e0: 0b 00        	movs	r3, r1
     5e2: 00 00        	movs	r0, r0
     5e4: 68 0f        	lsrs	r0, r5, #29
     5e6: 00 20        	movs	r0, #0
     5e8: 00 00        	movs	r0, r0
     5ea: 00 00        	movs	r0, r0
     5ec: 00 00        	movs	r0, r0
     5ee: 01 00        	movs	r1, r0
     5f0: 08 00        	movs	r0, r1
     5f2: 00 00        	movs	r0, r0
     5f4: 6c 0f        	lsrs	r4, r5, #29
     5f6: 00 20        	movs	r0, #0
     5f8: 00 00        	movs	r0, r0
     5fa: 00 00        	movs	r0, r0
     5fc: 00 00        	movs	r0, r0
     5fe: 01 00        	movs	r1, r0
     600: 0b 00        	movs	r3, r1
     602: 00 00        	movs	r0, r0
     604: 84 0f        	lsrs	r4, r0, #30
     606: 00 20        	movs	r0, #0
     608: 00 00        	movs	r0, r0
     60a: 00 00        	movs	r0, r0
     60c: 00 00        	movs	r0, r0
     60e: 01 00        	movs	r1, r0
     610: 08 00        	movs	r0, r1
     612: 00 00        	movs	r0, r0
     614: 88 0f        	lsrs	r0, r1, #30
     616: 00 20        	movs	r0, #0
     618: 00 00        	movs	r0, r0
     61a: 00 00        	movs	r0, r0
     61c: 00 00        	movs	r0, r0
     61e: 01 00        	movs	r1, r0
     620: 0b 00        	movs	r3, r1
     622: 00 00        	movs	r0, r0
     624: a0 0f        	lsrs	r0, r4, #30
     626: 00 20        	movs	r0, #0
     628: 00 00        	movs	r0, r0
     62a: 00 00        	movs	r0, r0
     62c: 00 00        	movs	r0, r0
     62e: 01 00        	movs	r1, r0
     630: 08 00        	movs	r0, r1
     632: 00 00        	movs	r0, r0
     634: a4 0f        	lsrs	r4, r4, #30
     636: 00 20        	movs	r0, #0
     638: 00 00        	movs	r0, r0
     63a: 00 00        	movs	r0, r0
     63c: 00 00        	movs	r0, r0
     63e: 01 00        	movs	r1, r0
     640: 0b 00        	movs	r3, r1
     642: 00 00        	movs	r0, r0
     644: bc 0f        	lsrs	r4, r7, #30
     646: 00 20        	movs	r0, #0
     648: 00 00        	movs	r0, r0
     64a: 00 00        	movs	r0, r0
     64c: 00 00        	movs	r0, r0
     64e: 01 00        	movs	r1, r0
     650: 08 00        	movs	r0, r1
     652: 00 00        	movs	r0, r0
     654: c0 0f        	lsrs	r0, r0, #31
     656: 00 20        	movs	r0, #0
     658: 00 00        	movs	r0, r0
     65a: 00 00        	movs	r0, r0
     65c: 00 00        	movs	r0, r0
     65e: 01 00        	movs	r1, r0
     660: 0b 00        	movs	r3, r1
     662: 00 00        	movs	r0, r0
     664: d8 0f        	lsrs	r0, r3, #31
     666: 00 20        	movs	r0, #0
     668: 00 00        	movs	r0, r0
     66a: 00 00        	movs	r0, r0
     66c: 00 00        	movs	r0, r0
     66e: 01 00        	movs	r1, r0
     670: 08 00        	movs	r0, r1
     672: 00 00        	movs	r0, r0
     674: dc 0f        	lsrs	r4, r3, #31
     676: 00 20        	movs	r0, #0
     678: 00 00        	movs	r0, r0
     67a: 00 00        	movs	r0, r0
     67c: 00 00        	movs	r0, r0
     67e: 01 00        	movs	r1, r0
     680: 0b 00        	movs	r3, r1
     682: 00 00        	movs	r0, r0
     684: f4 0f        	lsrs	r4, r6, #31
     686: 00 20        	movs	r0, #0
     688: 00 00        	movs	r0, r0
     68a: 00 00        	movs	r0, r0
     68c: 00 00        	movs	r0, r0
     68e: 01 00        	movs	r1, r0
     690: 08 00        	movs	r0, r1
     692: 00 00        	movs	r0, r0
     694: f8 0f        	lsrs	r0, r7, #31
     696: 00 20        	movs	r0, #0
     698: 00 00        	movs	r0, r0
     69a: 00 00        	movs	r0, r0
     69c: 00 00        	movs	r0, r0
     69e: 01 00        	movs	r1, r0
     6a0: 0b 00        	movs	r3, r1
     6a2: 00 00        	movs	r0, r0
     6a4: 10 10        	asrs	r0, r2, #32
     6a6: 00 20        	movs	r0, #0
     6a8: 00 00        	movs	r0, r0
     6aa: 00 00        	movs	r0, r0
     6ac: 00 00        	movs	r0, r0
     6ae: 01 00        	movs	r1, r0
     6b0: 08 00        	movs	r0, r1
     6b2: 00 00        	movs	r0, r0
     6b4: 14 10        	asrs	r4, r2, #32
     6b6: 00 20        	movs	r0, #0
     6b8: 00 00        	movs	r0, r0
     6ba: 00 00        	movs	r0, r0
     6bc: 00 00        	movs	r0, r0
     6be: 01 00        	movs	r1, r0
     6c0: 0b 00        	movs	r3, r1
     6c2: 00 00        	movs	r0, r0
     6c4: 2c 10        	asrs	r4, r5, #32
     6c6: 00 20        	movs	r0, #0
     6c8: 00 00        	movs	r0, r0
     6ca: 00 00        	movs	r0, r0
     6cc: 00 00        	movs	r0, r0
     6ce: 01 00        	movs	r1, r0
     6d0: 08 00        	movs	r0, r1
     6d2: 00 00        	movs	r0, r0
     6d4: 30 10        	asrs	r0, r6, #32
     6d6: 00 20        	movs	r0, #0
     6d8: 00 00        	movs	r0, r0
     6da: 00 00        	movs	r0, r0
     6dc: 00 00        	movs	r0, r0
     6de: 01 00        	movs	r1, r0
     6e0: 0b 00        	movs	r3, r1
     6e2: 00 00        	movs	r0, r0
     6e4: 48 10        	asrs	r0, r1, #1
     6e6: 00 20        	movs	r0, #0
     6e8: 00 00        	movs	r0, r0
     6ea: 00 00        	movs	r0, r0
     6ec: 00 00        	movs	r0, r0
     6ee: 01 00        	movs	r1, r0
     6f0: 08 00        	movs	r0, r1
     6f2: 00 00        	movs	r0, r0
     6f4: 4c 10        	asrs	r4, r1, #1
     6f6: 00 20        	movs	r0, #0
     6f8: 00 00        	movs	r0, r0
     6fa: 00 00        	movs	r0, r0
     6fc: 00 00        	movs	r0, r0
     6fe: 01 00        	movs	r1, r0
     700: 0b 00        	movs	r3, r1
     702: 00 00        	movs	r0, r0
     704: 64 10        	asrs	r4, r4, #1
     706: 00 20        	movs	r0, #0
     708: 00 00        	movs	r0, r0
     70a: 00 00        	movs	r0, r0
     70c: 00 00        	movs	r0, r0
     70e: 01 00        	movs	r1, r0
     710: 08 00        	movs	r0, r1
     712: 00 00        	movs	r0, r0
     714: 68 10        	asrs	r0, r5, #1
     716: 00 20        	movs	r0, #0
     718: 00 00        	movs	r0, r0
     71a: 00 00        	movs	r0, r0
     71c: 00 00        	movs	r0, r0
     71e: 01 00        	movs	r1, r0
     720: 0b 00        	movs	r3, r1
     722: 00 00        	movs	r0, r0
     724: 80 10        	asrs	r0, r0, #2
     726: 00 20        	movs	r0, #0
     728: 00 00        	movs	r0, r0
     72a: 00 00        	movs	r0, r0
     72c: 00 00        	movs	r0, r0
     72e: 01 00        	movs	r1, r0
     730: 08 00        	movs	r0, r1
     732: 00 00        	movs	r0, r0
     734: 84 10        	asrs	r4, r0, #2
     736: 00 20        	movs	r0, #0
     738: 00 00        	movs	r0, r0
     73a: 00 00        	movs	r0, r0
     73c: 00 00        	movs	r0, r0
     73e: 01 00        	movs	r1, r0
     740: 0b 00        	movs	r3, r1
     742: 00 00        	movs	r0, r0
     744: b4 10        	asrs	r4, r6, #2
     746: 00 20        	movs	r0, #0
     748: 00 00        	movs	r0, r0
     74a: 00 00        	movs	r0, r0
     74c: 00 00        	movs	r0, r0
     74e: 01 00        	movs	r1, r0
     750: 08 00        	movs	r0, r1
     752: 00 00        	movs	r0, r0
     754: b8 10        	asrs	r0, r7, #2
     756: 00 20        	movs	r0, #0
     758: 00 00        	movs	r0, r0
     75a: 00 00        	movs	r0, r0
     75c: 00 00        	movs	r0, r0
     75e: 01 00        	movs	r1, r0
     760: 0b 00        	movs	r3, r1
     762: 00 00        	movs	r0, r0
     764: f8 10        	asrs	r0, r7, #3
     766: 00 20        	movs	r0, #0
     768: 00 00        	movs	r0, r0
     76a: 00 00        	movs	r0, r0
     76c: 00 00        	movs	r0, r0
     76e: 01 00        	movs	r1, r0
     770: 08 00        	movs	r0, r1
     772: 00 00        	movs	r0, r0
     774: fc 10        	asrs	r4, r7, #3
     776: 00 20        	movs	r0, #0
     778: 00 00        	movs	r0, r0
     77a: 00 00        	movs	r0, r0
     77c: 00 00        	movs	r0, r0
     77e: 01 00        	movs	r1, r0
     780: 0b 00        	movs	r3, r1
     782: 00 00        	movs	r0, r0
     784: 0c 11        	asrs	r4, r1, #4
     786: 00 20        	movs	r0, #0
     788: 00 00        	movs	r0, r0
     78a: 00 00        	movs	r0, r0
     78c: 00 00        	movs	r0, r0
     78e: 01 00        	movs	r1, r0
     790: 08 00        	movs	r0, r1
     792: 00 00        	movs	r0, r0
     794: 10 11        	asrs	r0, r2, #4
     796: 00 20        	movs	r0, #0
     798: 00 00        	movs	r0, r0
     79a: 00 00        	movs	r0, r0
     79c: 00 00        	movs	r0, r0
     79e: 01 00        	movs	r1, r0
     7a0: 0b 00        	movs	r3, r1
     7a2: 00 00        	movs	r0, r0
     7a4: 18 11        	asrs	r0, r3, #4
     7a6: 00 20        	movs	r0, #0
     7a8: 00 00        	movs	r0, r0
     7aa: 00 00        	movs	r0, r0
     7ac: 00 00        	movs	r0, r0
     7ae: 01 00        	movs	r1, r0
     7b0: 0b 00        	movs	r3, r1
     7b2: 00 00        	movs	r0, r0
     7b4: 5c 13        	asrs	r4, r3, #13
     7b6: 00 20        	movs	r0, #0
     7b8: 00 00        	movs	r0, r0
     7ba: 00 00        	movs	r0, r0
     7bc: 00 00        	movs	r0, r0
     7be: 02 00        	movs	r2, r0
     7c0: cd 00        	lsls	r5, r1, #3
     7c2: 00 00        	movs	r0, r0
     7c4: 5c 13        	asrs	r4, r3, #13
     7c6: 00 20        	movs	r0, #0
     7c8: 10 00        	movs	r0, r2
     7ca: 00 00        	movs	r0, r0
     7cc: 01 00        	movs	r1, r0
     7ce: 02 00        	movs	r2, r0
     7d0: 0b 00        	movs	r3, r1
     7d2: 00 00        	movs	r0, r0
     7d4: 34 02        	lsls	r4, r6, #8
		...
     7de: 0d 00        	movs	r5, r1
     7e0: de 00        	lsls	r6, r3, #3
		...
     7ea: 00 00        	movs	r0, r0
     7ec: 04 00        	movs	r4, r0
     7ee: f1           	<unknown>
     7ef: ff 08        	lsrs	r7, r7, #3
     7f1: 00 00        	movs	r0, r0
     7f3: 00 1c        	adds	r0, r0, #0
     7f5: 11 00        	movs	r1, r2
     7f7: 20 00        	movs	r0, r4
     7f9: 00 00        	movs	r0, r0
     7fb: 00 00        	movs	r0, r0
     7fd: 00 01        	lsls	r0, r0, #4
     7ff: 00 0b        	lsrs	r0, r0, #12
     801: 00 00        	movs	r0, r0
     803: 00           	<unknown>
     804: fc 11        	asrs	r4, r7, #7
     806: 00 20        	movs	r0, #0
     808: 00 00        	movs	r0, r0
     80a: 00 00        	movs	r0, r0
     80c: 00 00        	movs	r0, r0
     80e: 01 00        	movs	r1, r0
     810: 08 00        	movs	r0, r1
     812: 00 00        	movs	r0, r0
     814: 20 12        	asrs	r0, r4, #8
     816: 00 20        	movs	r0, #0
     818: 00 00        	movs	r0, r0
     81a: 00 00        	movs	r0, r0
     81c: 00 00        	movs	r0, r0
     81e: 01 00        	movs	r1, r0
     820: 0b 00        	movs	r3, r1
     822: 00 00        	movs	r0, r0
     824: 1c 05        	lsls	r4, r3, #20
		...
     82e: 0d 00        	movs	r5, r1
		...
     83c: 04 00        	movs	r4, r0
     83e: f1           	<unknown>
     83f: ff           	<unknown>
     840: ef 00        	lsls	r7, r5, #3
     842: 00 00        	movs	r0, r0
     844: 00 04        	lsls	r0, r0, #16
		...
     84e: f1           	<unknown>
     84f: ff           	<unknown>
     850: ff 00        	lsls	r7, r7, #3
		...
     85e: 00 00        	movs	r0, r0
     860: 03 01        	lsls	r3, r0, #4
		...
     86e: f1           	<unknown>
     86f: ff 12        	asrs	r7, r7, #11
     871: 01 00        	movs	r1, r0
     873: 00 99        	ldr	r1, [sp]
     875: 0c 00        	movs	r4, r1
     877: 20 0c        	lsrs	r0, r4, #16
     879: 00 00        	movs	r0, r0
     87b: 00 12        	asrs	r0, r0, #8
     87d: 00 01        	lsls	r0, r0, #4
     87f: 00 1d        	adds	r0, r0, #4
     881: 01 00        	movs	r1, r0
     883: 00 e1        	b	0xa87 <.debug_info+0xa87> @ imm = #512
     885: 09 00        	movs	r1, r1
     887: 20 18        	adds	r0, r4, r0
     889: 00 00        	movs	r0, r0
     88b: 00 12        	asrs	r0, r0, #8
     88d: 00 01        	lsls	r0, r0, #4
     88f: 00 2c        	cmp	r4, #0
     891: 01 00        	movs	r1, r0
     893: 00           	<unknown>
     894: f9 0c        	lsrs	r1, r7, #19
     896: 00 20        	movs	r0, #0
     898: 0c 00        	movs	r4, r1
     89a: 00 00        	movs	r0, r0
     89c: 12 00        	movs	r2, r2
     89e: 01 00        	movs	r1, r0
     8a0: 37 01        	lsls	r7, r6, #4
     8a2: 00 00        	movs	r0, r0
     8a4: 05 0d        	lsrs	r5, r0, #20
     8a6: 00 20        	movs	r0, #0
     8a8: 14 00        	movs	r4, r2
     8aa: 00 00        	movs	r0, r0
     8ac: 12 00        	movs	r2, r2
     8ae: 01 00        	movs	r1, r0
     8b0: 48 01        	lsls	r0, r1, #5
     8b2: 00 00        	movs	r0, r0
     8b4: 2d 13        	asrs	r5, r5, #12
     8b6: 00 20        	movs	r0, #0
     8b8: 2e 00        	movs	r6, r5
     8ba: 00 00        	movs	r0, r0
     8bc: 12 00        	movs	r2, r2
     8be: 01 00        	movs	r1, r0
     8c0: 59 01        	lsls	r1, r3, #5
     8c2: 00 00        	movs	r0, r0
     8c4: 11 11        	asrs	r1, r2, #4
     8c6: 00 20        	movs	r0, #0
     8c8: 0c 00        	movs	r4, r1
     8ca: 00 00        	movs	r0, r0
     8cc: 12 00        	movs	r2, r2
     8ce: 01 00        	movs	r1, r0
     8d0: 6f 01        	lsls	r7, r5, #5
     8d2: 00 00        	movs	r0, r0
     8d4: f5 12        	asrs	r5, r6, #11
     8d6: 00 20        	movs	r0, #0
     8d8: 0e 00        	movs	r6, r1
     8da: 00 00        	movs	r0, r0
     8dc: 12 00        	movs	r2, r2
     8de: 01 00        	movs	r1, r0
     8e0: 86 01        	lsls	r6, r0, #6
     8e2: 00 00        	movs	r0, r0
     8e4: 6d 0f        	lsrs	r5, r5, #29
     8e6: 00 20        	movs	r0, #0
     8e8: 1c 00        	movs	r4, r3
     8ea: 00 00        	movs	r0, r0
     8ec: 12 00        	movs	r2, r2
     8ee: 01 00        	movs	r1, r0
     8f0: 9d 01        	lsls	r5, r3, #6
     8f2: 00 00        	movs	r0, r0
     8f4: 69 10        	asrs	r1, r5, #1
     8f6: 00 20        	movs	r0, #0
     8f8: 1c 00        	movs	r4, r3
     8fa: 00 00        	movs	r0, r0
     8fc: 12 00        	movs	r2, r2
     8fe: 01 00        	movs	r1, r0
     900: aa 01        	lsls	r2, r5, #6
     902: 00 00        	movs	r0, r0
     904: 51 0f        	lsrs	r1, r2, #29
     906: 00 20        	movs	r0, #0
     908: 1c 00        	movs	r4, r3
     90a: 00 00        	movs	r0, r0
     90c: 12 00        	movs	r2, r2
     90e: 01 00        	movs	r1, r0
     910: c1 01        	lsls	r1, r0, #7
     912: 00 00        	movs	r0, r0
     914: 5c 13        	asrs	r4, r3, #13
     916: 00 20        	movs	r0, #0
     918: 00 00        	movs	r0, r0
     91a: 00 00        	movs	r0, r0
     91c: 10 00        	movs	r0, r2
     91e: 01 00        	movs	r1, r0
     920: c8 01        	lsls	r0, r1, #7
     922: 00 00        	movs	r0, r0
     924: 59 0d        	lsrs	r1, r3, #21
     926: 00 20        	movs	r0, #0
     928: 14 00        	movs	r4, r2
     92a: 00 00        	movs	r0, r0
     92c: 12 00        	movs	r2, r2
     92e: 01 00        	movs	r1, r0
     930: d9 01        	lsls	r1, r3, #7
     932: 00 00        	movs	r0, r0
     934: b9 10        	asrs	r1, r7, #2
     936: 00 20        	movs	r0, #0
     938: 34 00        	movs	r4, r6
     93a: 00 00        	movs	r0, r0
     93c: 12 00        	movs	r2, r2
     93e: 01 00        	movs	r1, r0
     940: ef 01        	lsls	r7, r5, #7
     942: 00 00        	movs	r0, r0
     944: ad 0e        	lsrs	r5, r5, #26
     946: 00 20        	movs	r0, #0
     948: 0c 00        	movs	r4, r1
     94a: 00 00        	movs	r0, r0
     94c: 12 00        	movs	r2, r2
     94e: 01 00        	movs	r1, r0
     950: 02 02        	lsls	r2, r0, #8
     952: 00 00        	movs	r0, r0
     954: 25 0d        	lsrs	r5, r4, #20
     956: 00 20        	movs	r0, #0
     958: 0c 00        	movs	r4, r1
     95a: 00 00        	movs	r0, r0
     95c: 12 00        	movs	r2, r2
     95e: 01 00        	movs	r1, r0
     960: 1d 02        	lsls	r5, r3, #8
     962: 00 00        	movs	r0, r0
     964: ed 10        	asrs	r5, r5, #3
     966: 00 20        	movs	r0, #0
     968: 10 00        	movs	r0, r2
     96a: 00 00        	movs	r0, r0
     96c: 12 00        	movs	r2, r2
     96e: 01 00        	movs	r1, r0
     970: 2b 02        	lsls	r3, r5, #8
     972: 00 00        	movs	r0, r0
     974: 75 0c        	lsrs	r5, r6, #17
     976: 00 20        	movs	r0, #0
     978: 10 00        	movs	r0, r2
     97a: 00 00        	movs	r0, r0
     97c: 12 00        	movs	r2, r2
     97e: 01 00        	movs	r1, r0
     980: 39 02        	lsls	r1, r7, #8
     982: 00 00        	movs	r0, r0
     984: 25 13        	asrs	r5, r4, #12
     986: 00 20        	movs	r0, #0
     988: 08 00        	movs	r0, r1
     98a: 00 00        	movs	r0, r0
     98c: 12 00        	movs	r2, r2
     98e: 01 00        	movs	r1, r0
     990: 49 02        	lsls	r1, r1, #9
     992: 00 00        	movs	r0, r0
     994: 35 0f        	lsrs	r5, r6, #28
     996: 00 20        	movs	r0, #0
     998: 1c 00        	movs	r4, r3
     99a: 00 00        	movs	r0, r0
     99c: 12 00        	movs	r2, r2
     99e: 01 00        	movs	r1, r0
     9a0: 60 02        	lsls	r0, r4, #9
     9a2: 00 00        	movs	r0, r0
     9a4: 21 12        	asrs	r1, r4, #8
     9a6: 00 20        	movs	r0, #0
     9a8: 82 00        	lsls	r2, r0, #2
     9aa: 00 00        	movs	r0, r0
     9ac: 12 00        	movs	r2, r2
     9ae: 01 00        	movs	r1, r0
     9b0: 6a 02        	lsls	r2, r5, #9
     9b2: 00 00        	movs	r0, r0
     9b4: d9 0c        	lsrs	r1, r3, #19
     9b6: 00 20        	movs	r0, #0
     9b8: 20 00        	movs	r0, r4
     9ba: 00 00        	movs	r0, r0
     9bc: 12 00        	movs	r2, r2
     9be: 01 00        	movs	r1, r0
     9c0: 78 02        	lsls	r0, r7, #9
     9c2: 00 00        	movs	r0, r0
     9c4: 15 10        	asrs	r5, r2, #32
     9c6: 00 20        	movs	r0, #0
     9c8: 1c 00        	movs	r4, r3
     9ca: 00 00        	movs	r0, r0
     9cc: 12 00        	movs	r2, r2
     9ce: 01 00        	movs	r1, r0
     9d0: 95 02        	lsls	r5, r2, #10
     9d2: 00 00        	movs	r0, r0
     9d4: 21 13        	asrs	r1, r4, #12
     9d6: 00 20        	movs	r0, #0
     9d8: 04 00        	movs	r4, r0
     9da: 00 00        	movs	r0, r0
     9dc: 12 00        	movs	r2, r2
     9de: 01 00        	movs	r1, r0
     9e0: a0 02        	lsls	r0, r4, #10
     9e2: 00 00        	movs	r0, r0
     9e4: 05 13        	asrs	r5, r0, #12
     9e6: 00 20        	movs	r0, #0
     9e8: 06 00        	movs	r6, r0
     9ea: 00 00        	movs	r0, r0
     9ec: 12 00        	movs	r2, r2
     9ee: 01 00        	movs	r1, r0
     9f0: b4 02        	lsls	r4, r6, #10
     9f2: 00 00        	movs	r0, r0
     9f4: a5 0c        	lsrs	r5, r4, #18
     9f6: 00 20        	movs	r0, #0
     9f8: 28 00        	movs	r0, r5
     9fa: 00 00        	movs	r0, r0
     9fc: 12 00        	movs	r2, r2
     9fe: 01 00        	movs	r1, r0
     a00: c2 02        	lsls	r2, r0, #11
     a02: 00 00        	movs	r0, r0
     a04: a1 0e        	lsrs	r1, r4, #26
     a06: 00 20        	movs	r0, #0
     a08: 0c 00        	movs	r4, r1
     a0a: 00 00        	movs	r0, r0
     a0c: 12 00        	movs	r2, r2
     a0e: 01 00        	movs	r1, r0
     a10: d0 02        	lsls	r0, r2, #11
     a12: 00 00        	movs	r0, r0
     a14: 19 0f        	lsrs	r1, r3, #28
     a16: 00 20        	movs	r0, #0
     a18: 1c 00        	movs	r4, r3
     a1a: 00 00        	movs	r0, r0
     a1c: 12 00        	movs	r2, r2
     a1e: 01 00        	movs	r1, r0
     a20: e7 02        	lsls	r7, r4, #11
     a22: 00 00        	movs	r0, r0
     a24: fd 10        	asrs	r5, r7, #3
     a26: 00 20        	movs	r0, #0
     a28: 14 00        	movs	r4, r2
     a2a: 00 00        	movs	r0, r0
     a2c: 12 00        	movs	r2, r2
     a2e: 01 00        	movs	r1, r0
     a30: f7 02        	lsls	r7, r6, #11
     a32: 00 00        	movs	r0, r0
     a34: e1 0e        	lsrs	r1, r4, #27
     a36: 00 20        	movs	r0, #0
     a38: 1c 00        	movs	r4, r3
     a3a: 00 00        	movs	r0, r0
     a3c: 12 00        	movs	r2, r2
     a3e: 01 00        	movs	r1, r0
     a40: 0e 03        	lsls	r6, r1, #12
     a42: 00 00        	movs	r0, r0
     a44: 11 09        	lsrs	r1, r2, #4
     a46: 00 20        	movs	r0, #0
     a48: 5c 00        	lsls	r4, r3, #1
     a4a: 00 00        	movs	r0, r0
     a4c: 12 00        	movs	r2, r2
     a4e: 01 00        	movs	r1, r0
     a50: 1c 03        	lsls	r4, r3, #12
     a52: 00 00        	movs	r0, r0
     a54: 31 0d        	lsrs	r1, r6, #20
     a56: 00 20        	movs	r0, #0
     a58: 14 00        	movs	r4, r2
     a5a: 00 00        	movs	r0, r0
     a5c: 12 00        	movs	r2, r2
     a5e: 01 00        	movs	r1, r0
     a60: 2b 03        	lsls	r3, r5, #12
     a62: 00 00        	movs	r0, r0
     a64: 39 0c        	lsrs	r1, r7, #16
     a66: 00 20        	movs	r0, #0
     a68: 06 00        	movs	r6, r0
     a6a: 00 00        	movs	r0, r0
     a6c: 22 00        	movs	r2, r4
     a6e: 01 00        	movs	r1, r0
     a70: 39 03        	lsls	r1, r7, #12
     a72: 00 00        	movs	r0, r0
     a74: ed 12        	asrs	r5, r5, #11
     a76: 00 20        	movs	r0, #0
     a78: 06 00        	movs	r6, r0
     a7a: 00 00        	movs	r0, r0
     a7c: 12 00        	movs	r2, r2
     a7e: 01 00        	movs	r1, r0
     a80: 4c 03        	lsls	r4, r1, #13
     a82: 00 00        	movs	r0, r0
     a84: 85 10        	asrs	r5, r0, #2
     a86: 00 20        	movs	r0, #0
     a88: 34 00        	movs	r4, r6
     a8a: 00 00        	movs	r0, r0
     a8c: 12 00        	movs	r2, r2
     a8e: 01 00        	movs	r1, r0
     a90: 5e 03        	lsls	r6, r3, #13
     a92: 00 00        	movs	r0, r0
     a94: 0d 13        	asrs	r5, r1, #12
     a96: 00 20        	movs	r0, #0
     a98: 04 00        	movs	r4, r0
     a9a: 00 00        	movs	r0, r0
     a9c: 12 00        	movs	r2, r2
     a9e: 01 00        	movs	r1, r0
     aa0: 6b 03        	lsls	r3, r5, #13
     aa2: 00 00        	movs	r0, r0
     aa4: 6d 0d        	lsrs	r5, r5, #21
     aa6: 00 20        	movs	r0, #0
     aa8: 10 00        	movs	r0, r2
     aaa: 00 00        	movs	r0, r0
     aac: 12 00        	movs	r2, r2
     aae: 01 00        	movs	r1, r0
     ab0: 7f 03        	lsls	r7, r7, #13
     ab2: 00 00        	movs	r0, r0
     ab4: 15 13        	asrs	r5, r2, #12
     ab6: 00 20        	movs	r0, #0
     ab8: 0a 00        	movs	r2, r1
     aba: 00 00        	movs	r0, r0
     abc: 12 00        	movs	r2, r2
     abe: 01 00        	movs	r1, r0
     ac0: 8d 03        	lsls	r5, r1, #14
     ac2: 00 00        	movs	r0, r0
     ac4: 89 0f        	lsrs	r1, r1, #30
     ac6: 00 20        	movs	r0, #0
     ac8: 1c 00        	movs	r4, r3
     aca: 00 00        	movs	r0, r0
     acc: 12 00        	movs	r2, r2
     ace: 01 00        	movs	r1, r0
     ad0: a4 03        	lsls	r4, r4, #14
     ad2: 00 00        	movs	r0, r0
     ad4: b9 0d        	lsrs	r1, r7, #22
     ad6: 00 20        	movs	r0, #0
     ad8: b8 00        	lsls	r0, r7, #2
     ada: 00 00        	movs	r0, r0
     adc: 12 00        	movs	r2, r2
     ade: 01 00        	movs	r1, r0
     ae0: b6 03        	lsls	r6, r6, #14
     ae2: 00 00        	movs	r0, r0
     ae4: 4d 10        	asrs	r5, r1, #1
     ae6: 00 20        	movs	r0, #0
     ae8: 1c 00        	movs	r4, r3
     aea: 00 00        	movs	r0, r0
     aec: 12 00        	movs	r2, r2
     aee: 01 00        	movs	r1, r0
     af0: d3 03        	lsls	r3, r2, #15
     af2: 00 00        	movs	r0, r0
     af4: 71 0e        	lsrs	r1, r6, #25
     af6: 00 20        	movs	r0, #0
     af8: 30 00        	movs	r0, r6
     afa: 00 00        	movs	r0, r0
     afc: 12 00        	movs	r2, r2
     afe: 01 00        	movs	r1, r0
     b00: e4 03        	lsls	r4, r4, #15
     b02: 00 00        	movs	r0, r0
     b04: 19 0d        	lsrs	r1, r3, #20
     b06: 00 20        	movs	r0, #0
     b08: 0c 00        	movs	r4, r1
     b0a: 00 00        	movs	r0, r0
     b0c: 12 00        	movs	r2, r2
     b0e: 01 00        	movs	r1, r0
     b10: f2 03        	lsls	r2, r6, #15
     b12: 00 00        	movs	r0, r0
     b14: 11 13        	asrs	r1, r2, #12
     b16: 00 20        	movs	r0, #0
     b18: 04 00        	movs	r4, r0
     b1a: 00 00        	movs	r0, r0
     b1c: 12 00        	movs	r2, r2
     b1e: 01 00        	movs	r1, r0
     b20: 01 04        	lsls	r1, r0, #16
     b22: 00 00        	movs	r0, r0
     b24: 31 10        	asrs	r1, r6, #32
     b26: 00 20        	movs	r0, #0
     b28: 1c 00        	movs	r4, r3
     b2a: 00 00        	movs	r0, r0
     b2c: 12 00        	movs	r2, r2
     b2e: 01 00        	movs	r1, r0
     b30: 1e 04        	lsls	r6, r3, #16
     b32: 00 00        	movs	r0, r0
     b34: 85 0c        	lsrs	r5, r0, #18
     b36: 00 20        	movs	r0, #0
     b38: 14 00        	movs	r4, r2
     b3a: 00 00        	movs	r0, r0
     b3c: 12 00        	movs	r2, r2
     b3e: 01 00        	movs	r1, r0
     b40: 3c 04        	lsls	r4, r7, #16
     b42: 00 00        	movs	r0, r0
     b44: dd 0f        	lsrs	r5, r3, #31
     b46: 00 20        	movs	r0, #0
     b48: 1c 00        	movs	r4, r3
     b4a: 00 00        	movs	r0, r0
     b4c: 12 00        	movs	r2, r2
     b4e: 01 00        	movs	r1, r0
     b50: 59 04        	lsls	r1, r3, #17
     b52: 00 00        	movs	r0, r0
     b54: 91 0d        	lsrs	r1, r2, #22
     b56: 00 20        	movs	r0, #0
     b58: 14 00        	movs	r4, r2
     b5a: 00 00        	movs	r0, r0
     b5c: 12 00        	movs	r2, r2
     b5e: 01 00        	movs	r1, r0
     b60: 69 04        	lsls	r1, r5, #17
     b62: 00 00        	movs	r0, r0
     b64: a5 0d        	lsrs	r5, r4, #22
     b66: 00 20        	movs	r0, #0
     b68: 14 00        	movs	r4, r2
     b6a: 00 00        	movs	r0, r0
     b6c: 12 00        	movs	r2, r2
     b6e: 01 00        	movs	r1, r0
     b70: 79 04        	lsls	r1, r7, #17
     b72: 00 00        	movs	r0, r0
     b74: 1d 11        	asrs	r5, r3, #4
     b76: 00 20        	movs	r0, #0
     b78: 04 01        	lsls	r4, r0, #4
     b7a: 00 00        	movs	r0, r0
     b7c: 12 00        	movs	r2, r2
     b7e: 01 00        	movs	r1, r0
     b80: 85 04        	lsls	r5, r0, #18
     b82: 00 00        	movs	r0, r0
     b84: 41 0c        	lsrs	r1, r0, #17
     b86: 00 20        	movs	r0, #0
     b88: 34 00        	movs	r4, r6
     b8a: 00 00        	movs	r0, r0
     b8c: 12 00        	movs	r2, r2
     b8e: 01 00        	movs	r1, r0
     b90: 90 04        	lsls	r0, r2, #18
     b92: 00 00        	movs	r0, r0
     b94: 45 0d        	lsrs	r5, r0, #21
     b96: 00 20        	movs	r0, #0
     b98: 14 00        	movs	r4, r2
     b9a: 00 00        	movs	r0, r0
     b9c: 12 00        	movs	r2, r2
     b9e: 01 00        	movs	r1, r0
     ba0: 9f 04        	lsls	r7, r3, #18
     ba2: 00 00        	movs	r0, r0
     ba4: f9 0f        	lsrs	r1, r7, #31
     ba6: 00 20        	movs	r0, #0
     ba8: 1c 00        	movs	r4, r3
     baa: 00 00        	movs	r0, r0
     bac: 12 00        	movs	r2, r2
     bae: 01 00        	movs	r1, r0
     bb0: bc 04        	lsls	r4, r7, #18
     bb2: 00 00        	movs	r0, r0
     bb4: a5 0f        	lsrs	r5, r4, #30
     bb6: 00 20        	movs	r0, #0
     bb8: 1c 00        	movs	r4, r3
     bba: 00 00        	movs	r0, r0
     bbc: 12 00        	movs	r2, r2
     bbe: 01 00        	movs	r1, r0
     bc0: d3 04        	lsls	r3, r2, #19
     bc2: 00 00        	movs	r0, r0
     bc4: a5 12        	asrs	r5, r4, #10
     bc6: 00 20        	movs	r0, #0
     bc8: 12 00        	movs	r2, r2
     bca: 00 00        	movs	r0, r0
     bcc: 12 00        	movs	r2, r2
     bce: 01 00        	movs	r1, r0
     bd0: e3 04        	lsls	r3, r4, #19
     bd2: 00 00        	movs	r0, r0
     bd4: f9 09        	lsrs	r1, r7, #7
     bd6: 00 20        	movs	r0, #0
     bd8: 40 02        	lsls	r0, r0, #9
     bda: 00 00        	movs	r0, r0
     bdc: 12 00        	movs	r2, r2
     bde: 01 00        	movs	r1, r0
     be0: f3 04        	lsls	r3, r6, #19
     be2: 00 00        	movs	r0, r0
     be4: fd 0e        	lsrs	r5, r7, #27
     be6: 00 20        	movs	r0, #0
     be8: 1c 00        	movs	r4, r3
     bea: 00 00        	movs	r0, r0
     bec: 12 00        	movs	r2, r2
     bee: 01 00        	movs	r1, r0
     bf0: 0a 05        	lsls	r2, r1, #20
     bf2: 00 00        	movs	r0, r0
     bf4: b9 0e        	lsrs	r1, r7, #26
     bf6: 00 20        	movs	r0, #0
     bf8: 0c 00        	movs	r4, r1
     bfa: 00 00        	movs	r0, r0
     bfc: 12 00        	movs	r2, r2
     bfe: 01 00        	movs	r1, r0
     c00: 1b 05        	lsls	r3, r3, #20
     c02: 00 00        	movs	r0, r0
     c04: 5c 13        	asrs	r4, r3, #13
     c06: 00 20        	movs	r0, #0
     c08: 00 00        	movs	r0, r0
     c0a: 00 00        	movs	r0, r0
     c0c: 10 00        	movs	r0, r2
     c0e: 01 00        	movs	r1, r0
     c10: 21 05        	lsls	r1, r4, #20
     c12: 00 00        	movs	r0, r0
     c14: b9 12        	asrs	r1, r7, #10
     c16: 00 20        	movs	r0, #0
     c18: 24 00        	movs	r4, r4
     c1a: 00 00        	movs	r0, r0
     c1c: 12 00        	movs	r2, r2
     c1e: 01 00        	movs	r1, r0
     c20: 34 05        	lsls	r4, r6, #20
     c22: 00 00        	movs	r0, r0
     c24: c5 0e        	lsrs	r5, r0, #27
     c26: 00 20        	movs	r0, #0
     c28: 1c 00        	movs	r4, r3
     c2a: 00 00        	movs	r0, r0
     c2c: 12 00        	movs	r2, r2
     c2e: 01 00        	movs	r1, r0
     c30: 4b 05        	lsls	r3, r1, #21
     c32: 00 00        	movs	r0, r0
     c34: cd 0c        	lsrs	r5, r1, #19
     c36: 00 20        	movs	r0, #0
     c38: 0c 00        	movs	r4, r1
     c3a: 00 00        	movs	r0, r0
     c3c: 12 00        	movs	r2, r2
     c3e: 01 00        	movs	r1, r0
     c40: 56 05        	lsls	r6, r2, #21
     c42: 00 00        	movs	r0, r0
     c44: c1 0f        	lsrs	r1, r0, #31
     c46: 00 20        	movs	r0, #0
     c48: 1c 00        	movs	r4, r3
     c4a: 00 00        	movs	r0, r0
     c4c: 12 00        	movs	r2, r2
     c4e: 01 00        	movs	r1, r0
     c50: 6d 05        	lsls	r5, r5, #21
     c52: 00 00        	movs	r0, r0
     c54: dd 12        	asrs	r5, r3, #11
     c56: 00 20        	movs	r0, #0
     c58: 0e 00        	movs	r6, r1
     c5a: 00 00        	movs	r0, r0
     c5c: 12 00        	movs	r2, r2
     c5e: 01 00        	movs	r1, r0
     c60: 83 05        	lsls	r3, r0, #22
     c62: 00 00        	movs	r0, r0
     c64: 7d 0d        	lsrs	r5, r7, #21
     c66: 00 20        	movs	r0, #0
     c68: 14 00        	movs	r4, r2
     c6a: 00 00        	movs	r0, r0
     c6c: 12 00        	movs	r2, r2
     c6e: 01 00        	movs	r1, r0

Disassembly of section .strtab:

00000000 <.strtab>:
       0: 00 6d        	ldr	r0, [r0, #80]
       2: 61 69        	ldr	r1, [r4, #20]
       4: 6e 2e        	cmp	r6, #110
       6: 63 00        	lsls	r3, r4, #1
       8: 24 74        	strb	r4, [r4, #16]
       a: 00 24        	movs	r4, #0
       c: 64 00        	lsls	r4, r4, #1
       e: 41 75        	strb	r1, [r0, #21]
      10: 64 69        	ldr	r4, [r4, #20]
      12: 6f 2e        	cmp	r6, #111
      14: 63 00        	lsls	r3, r4, #1
      16: 57 72        	strb	r7, [r2, #9]
      18: 69 74        	strb	r1, [r5, #17]
      1a: 65 52        	strh	r5, [r4, r1]
      1c: 65 67        	str	r5, [r4, #116]
      1e: 69 73        	strb	r1, [r5, #13]
      20: 74 65        	str	r4, [r6, #84]
      22: 72 00        	lsls	r2, r6, #1
      24: 4e 65        	str	r6, [r1, #84]
      26: 78 74        	strb	r0, [r7, #17]
      28: 42 75        	strb	r2, [r0, #21]
      2a: 66 66        	str	r6, [r4, #100]
      2c: 65 72        	strb	r5, [r4, #9]
      2e: 4c 65        	str	r4, [r1, #84]
      30: 6e 67        	str	r6, [r5, #116]
      32: 74 68        	ldr	r4, [r6, #4]
      34: 00 4e        	ldr	r6, [pc, #0]            @ 0x38 <.debug_info+0x38>
      36: 65 78        	ldrb	r5, [r4, #1]
      38: 74 42        	rsbs	r4, r6, #0
      3a: 75 66        	str	r5, [r6, #100]
      3c: 66 65        	str	r6, [r4, #84]
      3e: 72 53        	strh	r2, [r6, r5]
      40: 61 6d        	ldr	r1, [r4, #84]
      42: 70 6c        	ldr	r0, [r6, #68]
      44: 65 73        	strb	r5, [r4, #13]
      46: 00 42        	tst	r0, r0
      48: 75 66        	str	r5, [r6, #100]
      4a: 66 65        	str	r6, [r4, #84]
      4c: 72 4e        	ldr	r6, [pc, #456]          @ 0x218 <.debug_info+0x218>
      4e: 75 6d        	ldr	r5, [r6, #84]
      50: 62 65        	str	r2, [r4, #84]
      52: 72 00        	lsls	r2, r6, #1
      54: 44 4d        	ldr	r5, [pc, #272]          @ 0x168 <.debug_info+0x168>
      56: 41 52        	strh	r1, [r0, r1]
      58: 75 6e        	ldr	r5, [r6, #100]
      5a: 6e 69        	ldr	r6, [r5, #20]
      5c: 6e 67        	str	r6, [r5, #116]
      5e: 00 43        	orrs	r0, r0
      60: 61 6c        	ldr	r1, [r4, #68]
      62: 6c 62        	str	r4, [r5, #36]
      64: 61 63        	str	r1, [r4, #52]
      66: 6b 46        	mov	r3, sp
      68: 75 6e        	ldr	r5, [r6, #100]
      6a: 63 74        	strb	r3, [r4, #17]
      6c: 69 6f        	ldr	r1, [r5, #116]
      6e: 6e 00        	lsls	r6, r5, #1
      70: 43 61        	str	r3, [r0, #20]
      72: 6c 6c        	ldr	r4, [r5, #68]
      74: 62 61        	str	r2, [r4, #20]
      76: 63 6b        	ldr	r3, [r4, #52]
      78: 43 6f        	ldr	r3, [r0, #116]
      7a: 6e 74        	strb	r6, [r5, #17]
      7c: 65 78        	ldrb	r5, [r4, #1]
      7e: 74 00        	lsls	r4, r6, #1
      80: 2f 76        	strb	r7, [r5, #24]
      82: 61 72        	strb	r1, [r4, #9]
      84: 2f 66        	str	r7, [r5, #96]
      86: 6f 6c        	ldr	r7, [r5, #68]
      88: 64 65        	str	r4, [r4, #84]
      8a: 72 73        	strb	r2, [r6, #13]
      8c: 2f 72        	strb	r7, [r5, #8]
      8e: 6e 2f        	cmp	r7, #110
      90: 31 73        	strb	r1, [r6, #12]
      92: 6d 77        	strb	r5, [r5, #29]
      94: 68 6d        	ldr	r0, [r5, #84]
      96: 36 6a        	ldr	r6, [r6, #32]
      98: 30 66        	str	r0, [r6, #96]
      9a: 37 33        	adds	r3, #55
      9c: 36 66        	str	r6, [r6, #96]
      9e: 38 78        	ldrb	r0, [r7]
      a0: 6a 6c        	ldr	r2, [r5, #68]
      a2: 7a 36        	adds	r6, #122
      a4: 39 66        	str	r1, [r7, #96]
      a6: 67 68        	ldr	r7, [r4, #4]
      a8: 30 30        	adds	r0, #48
      aa: 30 30        	adds	r0, #48
      ac: 67 6e        	ldr	r7, [r4, #100]
      ae: 2f 54        	strb	r7, [r5, r0]
      b0: 2f 2f        	cmp	r7, #47
      b2: 63 63        	str	r3, [r4, #52]
      b4: 61 57        	ldrsb	r1, [r4, r5]
      b6: 70 6c        	ldr	r0, [r6, #68]
      b8: 47 34        	adds	r4, #71
      ba: 2e 6f        	ldr	r6, [r5, #112]
      bc: 00 73        	strb	r0, [r0, #12]
      be: 74 6d        	ldr	r4, [r6, #84]
      c0: 33 32        	adds	r2, #51
      c2: 66 34        	adds	r4, #102
      c4: 78 78        	ldrb	r0, [r7, #1]
      c6: 5f 72        	strb	r7, [r3, #9]
      c8: 63 63        	str	r3, [r4, #52]
      ca: 2e 63        	str	r6, [r5, #48]
      cc: 00 41        	asrs	r0, r0
      ce: 50 42        	rsbs	r0, r2, #0
      d0: 41 48        	ldr	r0, [pc, #260]          @ 0x1d8 <.debug_info+0x1d8>
      d2: 42 50        	str	r2, [r0, r1]
      d4: 72 65        	str	r2, [r6, #84]
      d6: 73 63        	str	r3, [r6, #52]
      d8: 54 61        	str	r4, [r2, #20]
      da: 62 6c        	ldr	r2, [r4, #68]
      dc: 65 00        	lsls	r5, r4, #1
      de: 73 74        	strb	r3, [r6, #17]
      e0: 6d 33        	adds	r3, #109
      e2: 32 66        	str	r2, [r6, #96]
      e4: 34 78        	ldrb	r4, [r6]
      e6: 78 5f        	ldrsh	r0, [r7, r5]
      e8: 67 70        	strb	r7, [r4, #1]
      ea: 69 6f        	ldr	r1, [r5, #116]
      ec: 2e 63        	str	r6, [r5, #48]
      ee: 00 5f        	ldrsh	r0, [r0, r4]
      f0: 4d 69        	ldr	r5, [r1, #20]
      f2: 6e 5f        	ldrsh	r6, [r5, r5]
      f4: 53 74        	strb	r3, [r2, #17]
      f6: 61 63        	str	r1, [r4, #52]
      f8: 6b 5f        	ldrsh	r3, [r5, r5]
      fa: 53 69        	ldr	r3, [r2, #20]
      fc: 7a 65        	str	r2, [r7, #84]
      fe: 00 65        	str	r0, [r0, #80]
     100: 6e 64        	str	r6, [r5, #68]
     102: 00 5f        	ldrsh	r0, [r0, r4]
     104: 4d 69        	ldr	r5, [r1, #20]
     106: 6e 5f        	ldrsh	r6, [r5, r5]
     108: 48 65        	str	r0, [r1, #84]
     10a: 61 70        	strb	r1, [r4, #1]
     10c: 5f 53        	strh	r7, [r3, r5]
     10e: 69 7a        	ldrb	r1, [r5, #9]
     110: 65 00        	lsls	r5, r4, #1
     112: 52 43        	muls	r2, r2, r2
     114: 43 5f        	ldrsh	r3, [r0, r5]
     116: 48 53        	strh	r0, [r1, r5]
     118: 49 43        	muls	r1, r1, r1
     11a: 6d 64        	str	r5, [r5, #68]
     11c: 00 53        	strh	r0, [r0, r4]
     11e: 65 74        	strb	r5, [r4, #17]
     120: 41 75        	strb	r1, [r0, #21]
     122: 64 69        	ldr	r4, [r4, #20]
     124: 6f 56        	ldrsb	r7, [r5, r1]
     126: 6f 6c        	ldr	r7, [r5, #68]
     128: 75 6d        	ldr	r5, [r6, #84]
     12a: 65 00        	lsls	r5, r4, #1
     12c: 52 43        	muls	r2, r2, r2
     12e: 43 5f        	ldrsh	r3, [r0, r5]
     130: 50 4c        	ldr	r4, [pc, #320]          @ 0x274 <.debug_info+0x274>
     132: 4c 43        	muls	r4, r1, r4
     134: 6d 64        	str	r5, [r5, #68]
     136: 00 52        	strh	r0, [r0, r0]
     138: 43 43        	muls	r3, r0, r3
     13a: 5f 50        	str	r7, [r3, r1]
     13c: 4c 4c        	ldr	r4, [pc, #304]          @ 0x270 <.debug_info+0x270>
     13e: 49 32        	adds	r2, #73
     140: 53 43        	muls	r3, r2, r3
     142: 6f 6e        	ldr	r7, [r5, #100]
     144: 66 69        	ldr	r6, [r4, #20]
     146: 67 00        	lsls	r7, r4, #1
     148: 47 50        	str	r7, [r0, r1]
     14a: 49 4f        	ldr	r7, [pc, #292]          @ 0x270 <.debug_info+0x270>
     14c: 5f 50        	str	r7, [r3, r1]
     14e: 69 6e        	ldr	r1, [r5, #100]
     150: 41 46        	mov	r1, r8
     152: 43 6f        	ldr	r3, [r0, #116]
     154: 6e 66        	str	r6, [r5, #100]
     156: 69 67        	str	r1, [r5, #116]
     158: 00 52        	strh	r0, [r0, r0]
     15a: 43 43        	muls	r3, r0, r3
     15c: 5f 43        	muls	r7, r3, r7
     15e: 6c 65        	str	r4, [r5, #84]
     160: 61 72        	strb	r1, [r4, #9]
     162: 49 54        	strb	r1, [r1, r1]
     164: 50 65        	str	r0, [r2, #84]
     166: 6e 64        	str	r6, [r5, #68]
     168: 69 6e        	ldr	r1, [r5, #100]
     16a: 67 42        	rsbs	r7, r4, #0
     16c: 69 74        	strb	r1, [r5, #17]
     16e: 00 47        	bx	r0
     170: 50 49        	ldr	r1, [pc, #320]          @ 0x2b4 <.debug_info+0x2b4>
     172: 4f 5f        	ldrsh	r7, [r1, r5]
     174: 52 65        	str	r2, [r2, #84]
     176: 61 64        	str	r1, [r4, #68]
     178: 4f 75        	strb	r7, [r1, #21]
     17a: 74 70        	strb	r4, [r6, #1]
     17c: 75 74        	strb	r5, [r6, #17]
     17e: 44 61        	str	r4, [r0, #20]
     180: 74 61        	str	r4, [r6, #20]
     182: 42 69        	ldr	r2, [r0, #20]
     184: 74 00        	lsls	r4, r6, #1
     186: 52 43        	muls	r2, r2, r2
     188: 43 5f        	ldrsh	r3, [r0, r5]
     18a: 41 48        	ldr	r0, [pc, #260]          @ 0x290 <.debug_info+0x290>
     18c: 42 32        	adds	r2, #66
     18e: 50 65        	str	r0, [r2, #84]
     190: 72 69        	ldr	r2, [r6, #20]
     192: 70 68        	ldr	r0, [r6, #4]
     194: 52 65        	str	r2, [r2, #84]
     196: 73 65        	str	r3, [r6, #84]
     198: 74 43        	muls	r4, r6, r4
     19a: 6d 64        	str	r5, [r5, #68]
     19c: 00 52        	strh	r0, [r0, r0]
     19e: 43 43        	muls	r3, r0, r3
     1a0: 5f 49        	ldr	r1, [pc, #380]          @ 0x320 <.debug_info+0x320>
     1a2: 54 43        	muls	r4, r2, r4
     1a4: 6f 6e        	ldr	r7, [r5, #100]
     1a6: 66 69        	ldr	r6, [r4, #20]
     1a8: 67 00        	lsls	r7, r4, #1
     1aa: 52 43        	muls	r2, r2, r2
     1ac: 43 5f        	ldrsh	r3, [r0, r5]
     1ae: 41 48        	ldr	r0, [pc, #260]          @ 0x2b4 <.debug_info+0x2b4>
     1b0: 42 31        	adds	r1, #66
     1b2: 50 65        	str	r0, [r2, #84]
     1b4: 72 69        	ldr	r2, [r6, #20]
     1b6: 70 68        	ldr	r0, [r6, #4]
     1b8: 52 65        	str	r2, [r2, #84]
     1ba: 73 65        	str	r3, [r6, #84]
     1bc: 74 43        	muls	r4, r6, r4
     1be: 6d 64        	str	r5, [r5, #68]
     1c0: 00 5f        	ldrsh	r0, [r0, r4]
     1c2: 65 74        	strb	r5, [r4, #17]
     1c4: 65 78        	ldrb	r5, [r4, #1]
     1c6: 74 00        	lsls	r4, r6, #1
     1c8: 52 43        	muls	r2, r2, r2
     1ca: 43 5f        	ldrsh	r3, [r0, r5]
     1cc: 53 59        	ldr	r3, [r2, r5]
     1ce: 53 43        	muls	r3, r2, r3
     1d0: 4c 4b        	ldr	r3, [pc, #304]          @ 0x304 <.debug_info+0x304>
     1d2: 43 6f        	ldr	r3, [r0, #116]
     1d4: 6e 66        	str	r6, [r5, #100]
     1d6: 69 67        	str	r1, [r5, #116]
     1d8: 00 52        	strh	r0, [r0, r0]
     1da: 43 43        	muls	r3, r0, r3
     1dc: 5f 57        	ldrsb	r7, [r3, r5]
     1de: 61 69        	ldr	r1, [r4, #20]
     1e0: 74 46        	mov	r4, lr
     1e2: 6f 72        	strb	r7, [r5, #9]
     1e4: 48 53        	strh	r0, [r1, r5]
     1e6: 45 53        	strh	r5, [r0, r5]
     1e8: 74 61        	str	r4, [r6, #20]
     1ea: 72 74        	strb	r2, [r6, #17]
     1ec: 55 70        	strb	r5, [r2, #1]
     1ee: 00 52        	strh	r0, [r0, r0]
     1f0: 43 43        	muls	r3, r0, r3
     1f2: 5f 42        	rsbs	r7, r3, #0
     1f4: 61 63        	str	r1, [r4, #52]
     1f6: 6b 75        	strb	r3, [r5, #21]
     1f8: 70 52        	strh	r0, [r6, r1]
     1fa: 65 73        	strb	r5, [r4, #13]
     1fc: 65 74        	strb	r5, [r4, #17]
     1fe: 43 6d        	ldr	r3, [r0, #84]
     200: 64 00        	lsls	r4, r4, #1
     202: 52 43        	muls	r2, r2, r2
     204: 43 5f        	ldrsh	r3, [r0, r5]
     206: 43 6c        	ldr	r3, [r0, #68]
     208: 6f 63        	str	r7, [r5, #52]
     20a: 6b 53        	strh	r3, [r5, r5]
     20c: 65 63        	str	r5, [r4, #52]
     20e: 75 72        	strb	r5, [r6, #9]
     210: 69 74        	strb	r1, [r5, #17]
     212: 79 53        	strh	r1, [r7, r5]
     214: 79 73        	strb	r1, [r7, #13]
     216: 74 65        	str	r4, [r6, #84]
     218: 6d 43        	muls	r5, r5, r5
     21a: 6d 64        	str	r5, [r5, #68]
     21c: 00 52        	strh	r0, [r0, r0]
     21e: 43 43        	muls	r3, r0, r3
     220: 5f 43        	muls	r7, r3, r7
     222: 6c 65        	str	r4, [r5, #84]
     224: 61 72        	strb	r1, [r4, #9]
     226: 46 6c        	ldr	r6, [r0, #68]
     228: 61 67        	str	r1, [r4, #116]
     22a: 00 52        	strh	r0, [r0, r0]
     22c: 43 43        	muls	r3, r0, r3
     22e: 5f 48        	ldr	r0, [pc, #380]          @ 0x3ac <.debug_info+0x3ac>
     230: 53 45        	cmp	r3, r10
     232: 43 6f        	ldr	r3, [r0, #116]
     234: 6e 66        	str	r6, [r5, #100]
     236: 69 67        	str	r1, [r5, #116]
     238: 00 47        	bx	r0
     23a: 50 49        	ldr	r1, [pc, #320]          @ 0x37c <.debug_info+0x37c>
     23c: 4f 5f        	ldrsh	r7, [r1, r5]
     23e: 54 6f        	ldr	r4, [r2, #116]
     240: 67 67        	str	r7, [r4, #116]
     242: 6c 65        	str	r4, [r5, #84]
     244: 42 69        	ldr	r2, [r0, #20]
     246: 74 73        	strb	r4, [r6, #13]
     248: 00 52        	strh	r0, [r0, r0]
     24a: 43 43        	muls	r3, r0, r3
     24c: 5f 41        	adcs	r7, r3
     24e: 50 42        	rsbs	r0, r2, #0
     250: 32 50        	str	r2, [r6, r0]
     252: 65 72        	strb	r5, [r4, #9]
     254: 69 70        	strb	r1, [r5, #1]
     256: 68 43        	muls	r0, r5, r0
     258: 6c 6f        	ldr	r4, [r5, #116]
     25a: 63 6b        	ldr	r3, [r4, #52]
     25c: 43 6d        	ldr	r3, [r0, #84]
     25e: 64 00        	lsls	r4, r4, #1
     260: 47 50        	str	r7, [r0, r1]
     262: 49 4f        	ldr	r7, [pc, #292]          @ 0x388 <.debug_info+0x388>
     264: 5f 49        	ldr	r1, [pc, #380]          @ 0x3e4 <.debug_info+0x3e4>
     266: 6e 69        	ldr	r6, [r5, #20]
     268: 74 00        	lsls	r4, r6, #1
     26a: 52 43        	muls	r2, r2, r2
     26c: 43 5f        	ldrsh	r3, [r0, r5]
     26e: 50 4c        	ldr	r4, [pc, #320]          @ 0x3b0 <.debug_info+0x3b0>
     270: 4c 43        	muls	r4, r1, r4
     272: 6f 6e        	ldr	r7, [r5, #100]
     274: 66 69        	ldr	r6, [r4, #20]
     276: 67 00        	lsls	r7, r4, #1
     278: 52 43        	muls	r2, r2, r2
     27a: 43 5f        	ldrsh	r3, [r0, r5]
     27c: 41 48        	ldr	r0, [pc, #260]          @ 0x384 <.debug_info+0x384>
     27e: 42 33        	adds	r3, #66
     280: 50 65        	str	r0, [r2, #84]
     282: 72 69        	ldr	r2, [r6, #20]
     284: 70 68        	ldr	r0, [r6, #4]
     286: 43 6c        	ldr	r3, [r0, #68]
     288: 6f 63        	str	r7, [r5, #52]
     28a: 6b 4c        	ldr	r4, [pc, #428]          @ 0x438 <.debug_info+0x438>
     28c: 50 4d        	ldr	r5, [pc, #320]          @ 0x3d0 <.debug_info+0x3d0>
     28e: 6f 64        	str	r7, [r5, #68]
     290: 65 43        	muls	r5, r4, r5
     292: 6d 64        	str	r5, [r5, #68]
     294: 00 47        	bx	r0
     296: 50 49        	ldr	r1, [pc, #320]          @ 0x3d8 <.debug_info+0x3d8>
     298: 4f 5f        	ldrsh	r7, [r1, r5]
     29a: 57 72        	strb	r7, [r2, #9]
     29c: 69 74        	strb	r1, [r5, #17]
     29e: 65 00        	lsls	r5, r4, #1
     2a0: 47 50        	str	r7, [r0, r1]
     2a2: 49 4f        	ldr	r7, [pc, #292]          @ 0x3c8 <.debug_info+0x3c8>
     2a4: 5f 52        	strh	r7, [r3, r1]
     2a6: 65 61        	str	r5, [r4, #20]
     2a8: 64 4f        	ldr	r7, [pc, #400]          @ 0x43c <.debug_info+0x43c>
     2aa: 75 74        	strb	r5, [r6, #17]
     2ac: 70 75        	strb	r0, [r6, #21]
     2ae: 74 44        	add	r4, lr
     2b0: 61 74        	strb	r1, [r4, #17]
     2b2: 61 00        	lsls	r1, r4, #1
     2b4: 52 43        	muls	r2, r2, r2
     2b6: 43 5f        	ldrsh	r3, [r0, r5]
     2b8: 4c 53        	strh	r4, [r1, r5]
     2ba: 45 43        	muls	r5, r0, r5
     2bc: 6f 6e        	ldr	r7, [r5, #100]
     2be: 66 69        	ldr	r6, [r4, #20]
     2c0: 67 00        	lsls	r7, r4, #1
     2c2: 52 43        	muls	r2, r2, r2
     2c4: 43 5f        	ldrsh	r3, [r0, r5]
     2c6: 52 54        	strb	r2, [r2, r1]
     2c8: 43 43        	muls	r3, r0, r3
     2ca: 4c 4b        	ldr	r3, [pc, #304]          @ 0x3fc <.debug_info+0x3fc>
     2cc: 43 6d        	ldr	r3, [r0, #84]
     2ce: 64 00        	lsls	r4, r4, #1
     2d0: 52 43        	muls	r2, r2, r2
     2d2: 43 5f        	ldrsh	r3, [r0, r5]
     2d4: 41 50        	str	r1, [r0, r1]
     2d6: 42 31        	adds	r1, #66
     2d8: 50 65        	str	r0, [r2, #84]
     2da: 72 69        	ldr	r2, [r6, #20]
     2dc: 70 68        	ldr	r0, [r6, #4]
     2de: 43 6c        	ldr	r3, [r0, #68]
     2e0: 6f 63        	str	r7, [r5, #52]
     2e2: 6b 43        	muls	r3, r5, r3
     2e4: 6d 64        	str	r5, [r5, #68]
     2e6: 00 52        	strh	r0, [r0, r0]
     2e8: 43 43        	muls	r3, r0, r3
     2ea: 5f 47        	bx	r11
     2ec: 65 74        	strb	r5, [r4, #17]
     2ee: 49 54        	strb	r1, [r1, r1]
     2f0: 53 74        	strb	r3, [r2, #17]
     2f2: 61 74        	strb	r1, [r4, #17]
     2f4: 75 73        	strb	r5, [r6, #13]
     2f6: 00 52        	strh	r0, [r0, r0]
     2f8: 43 43        	muls	r3, r0, r3
     2fa: 5f 41        	adcs	r7, r3
     2fc: 48 42        	rsbs	r0, r1, #0
     2fe: 32 50        	str	r2, [r6, r0]
     300: 65 72        	strb	r5, [r4, #9]
     302: 69 70        	strb	r1, [r5, #1]
     304: 68 43        	muls	r0, r5, r0
     306: 6c 6f        	ldr	r4, [r5, #116]
     308: 63 6b        	ldr	r3, [r4, #52]
     30a: 43 6d        	ldr	r3, [r0, #84]
     30c: 64 00        	lsls	r4, r4, #1
     30e: 6f 66        	str	r7, [r5, #100]
     310: 66 6c        	ldr	r6, [r4, #68]
     312: 6f 61        	str	r7, [r5, #20]
     314: 64 65        	str	r4, [r4, #84]
     316: 64 43        	muls	r4, r4, r4
     318: 6f 64        	str	r7, [r5, #68]
     31a: 65 00        	lsls	r5, r4, #1
     31c: 52 43        	muls	r2, r2, r2
     31e: 43 5f        	ldrsh	r3, [r0, r5]
     320: 4d 43        	muls	r5, r1, r5
     322: 4f 31        	adds	r1, #79
     324: 43 6f        	ldr	r3, [r0, #116]
     326: 6e 66        	str	r6, [r5, #100]
     328: 69 67        	str	r1, [r5, #116]
     32a: 00 52        	strh	r0, [r0, r0]
     32c: 65 73        	strb	r5, [r4, #13]
     32e: 65 74        	strb	r5, [r4, #17]
     330: 5f 48        	ldr	r0, [pc, #380]          @ 0x4b0 <.debug_info+0x4b0>
     332: 61 6e        	ldr	r1, [r4, #100]
     334: 64 6c        	ldr	r4, [r4, #68]
     336: 65 72        	strb	r5, [r4, #9]
     338: 00 47        	bx	r0
     33a: 50 49        	ldr	r1, [pc, #320]          @ 0x47c <.debug_info+0x47c>
     33c: 4f 5f        	ldrsh	r7, [r1, r5]
     33e: 52 65        	str	r2, [r2, #84]
     340: 61 64        	str	r1, [r4, #68]
     342: 49 6e        	ldr	r1, [r1, #100]
     344: 70 75        	strb	r0, [r6, #21]
     346: 74 44        	add	r4, lr
     348: 61 74        	strb	r1, [r4, #17]
     34a: 61 00        	lsls	r1, r4, #1
     34c: 52 43        	muls	r2, r2, r2
     34e: 43 5f        	ldrsh	r3, [r0, r5]
     350: 47 65        	str	r7, [r0, #84]
     352: 74 46        	mov	r4, lr
     354: 6c 61        	str	r4, [r5, #20]
     356: 67 53        	strh	r7, [r4, r5]
     358: 74 61        	str	r4, [r6, #20]
     35a: 74 75        	strb	r4, [r6, #21]
     35c: 73 00        	lsls	r3, r6, #1
     35e: 47 50        	str	r7, [r0, r1]
     360: 49 4f        	ldr	r7, [pc, #292]          @ 0x488 <.debug_info+0x488>
     362: 5f 53        	strh	r7, [r3, r5]
     364: 65 74        	strb	r5, [r4, #17]
     366: 42 69        	ldr	r2, [r0, #20]
     368: 74 73        	strb	r4, [r6, #13]
     36a: 00 52        	strh	r0, [r0, r0]
     36c: 43 43        	muls	r3, r0, r3
     36e: 5f 47        	bx	r11
     370: 65 74        	strb	r5, [r4, #17]
     372: 53 59        	ldr	r3, [r2, r5]
     374: 53 43        	muls	r3, r2, r3
     376: 4c 4b        	ldr	r3, [pc, #304]          @ 0x4a8 <.debug_info+0x4a8>
     378: 53 6f        	ldr	r3, [r2, #116]
     37a: 75 72        	strb	r5, [r6, #9]
     37c: 63 65        	str	r3, [r4, #84]
     37e: 00 47        	bx	r0
     380: 50 49        	ldr	r1, [pc, #320]          @ 0x4c4 <.debug_info+0x4c4>
     382: 4f 5f        	ldrsh	r7, [r1, r5]
     384: 57 72        	strb	r7, [r2, #9]
     386: 69 74        	strb	r1, [r5, #17]
     388: 65 42        	rsbs	r5, r4, #0
     38a: 69 74        	strb	r1, [r5, #17]
     38c: 00 52        	strh	r0, [r0, r0]
     38e: 43 43        	muls	r3, r0, r3
     390: 5f 41        	adcs	r7, r3
     392: 48 42        	rsbs	r0, r1, #0
     394: 33 50        	str	r3, [r6, r0]
     396: 65 72        	strb	r5, [r4, #9]
     398: 69 70        	strb	r1, [r5, #1]
     39a: 68 52        	strh	r0, [r5, r1]
     39c: 65 73        	strb	r5, [r4, #13]
     39e: 65 74        	strb	r5, [r4, #17]
     3a0: 43 6d        	ldr	r3, [r0, #84]
     3a2: 64 00        	lsls	r4, r4, #1
     3a4: 52 43        	muls	r2, r2, r2
     3a6: 43 5f        	ldrsh	r3, [r0, r5]
     3a8: 47 65        	str	r7, [r0, #84]
     3aa: 74 43        	muls	r4, r6, r4
     3ac: 6c 6f        	ldr	r4, [r5, #116]
     3ae: 63 6b        	ldr	r3, [r4, #52]
     3b0: 73 46        	mov	r3, lr
     3b2: 72 65        	str	r2, [r6, #84]
     3b4: 71 00        	lsls	r1, r6, #1
     3b6: 52 43        	muls	r2, r2, r2
     3b8: 43 5f        	ldrsh	r3, [r0, r5]
     3ba: 41 50        	str	r1, [r0, r1]
     3bc: 42 32        	adds	r2, #66
     3be: 50 65        	str	r0, [r2, #84]
     3c0: 72 69        	ldr	r2, [r6, #20]
     3c2: 70 68        	ldr	r0, [r6, #4]
     3c4: 43 6c        	ldr	r3, [r0, #68]
     3c6: 6f 63        	str	r7, [r5, #52]
     3c8: 6b 4c        	ldr	r4, [pc, #428]          @ 0x578 <.debug_info+0x578>
     3ca: 50 4d        	ldr	r5, [pc, #320]          @ 0x50c <.debug_info+0x50c>
     3cc: 6f 64        	str	r7, [r5, #68]
     3ce: 65 43        	muls	r5, r4, r5
     3d0: 6d 64        	str	r5, [r5, #68]
     3d2: 00 52        	strh	r0, [r0, r0]
     3d4: 43 43        	muls	r3, r0, r3
     3d6: 5f 52        	strh	r7, [r3, r1]
     3d8: 54 43        	muls	r4, r2, r4
     3da: 43 4c        	ldr	r4, [pc, #268]          @ 0x4e8 <.debug_info+0x4e8>
     3dc: 4b 43        	muls	r3, r1, r3
     3de: 6f 6e        	ldr	r7, [r5, #100]
     3e0: 66 69        	ldr	r6, [r4, #20]
     3e2: 67 00        	lsls	r7, r4, #1
     3e4: 52 43        	muls	r2, r2, r2
     3e6: 43 5f        	ldrsh	r3, [r0, r5]
     3e8: 50 4c        	ldr	r4, [pc, #320]          @ 0x52c <.debug_info+0x52c>
     3ea: 4c 49        	ldr	r1, [pc, #304]          @ 0x51c <.debug_info+0x51c>
     3ec: 32 53        	strh	r2, [r6, r4]
     3ee: 43 6d        	ldr	r3, [r0, #84]
     3f0: 64 00        	lsls	r4, r4, #1
     3f2: 47 50        	str	r7, [r0, r1]
     3f4: 49 4f        	ldr	r7, [pc, #292]          @ 0x51c <.debug_info+0x51c>
     3f6: 5f 52        	strh	r7, [r3, r1]
     3f8: 65 73        	strb	r5, [r4, #13]
     3fa: 65 74        	strb	r5, [r4, #17]
     3fc: 42 69        	ldr	r2, [r0, #20]
     3fe: 74 73        	strb	r4, [r6, #13]
     400: 00 52        	strh	r0, [r0, r0]
     402: 43 43        	muls	r3, r0, r3
     404: 5f 41        	adcs	r7, r3
     406: 50 42        	rsbs	r0, r2, #0
     408: 31 50        	str	r1, [r6, r0]
     40a: 65 72        	strb	r5, [r4, #9]
     40c: 69 70        	strb	r1, [r5, #1]
     40e: 68 43        	muls	r0, r5, r0
     410: 6c 6f        	ldr	r4, [r5, #116]
     412: 63 6b        	ldr	r3, [r4, #52]
     414: 4c 50        	str	r4, [r1, r1]
     416: 4d 6f        	ldr	r5, [r1, #116]
     418: 64 65        	str	r4, [r4, #84]
     41a: 43 6d        	ldr	r3, [r0, #84]
     41c: 64 00        	lsls	r4, r4, #1
     41e: 52 43        	muls	r2, r2, r2
     420: 43 5f        	ldrsh	r3, [r0, r5]
     422: 41 64        	str	r1, [r0, #68]
     424: 6a 75        	strb	r2, [r5, #21]
     426: 73 74        	strb	r3, [r6, #17]
     428: 48 53        	strh	r0, [r1, r5]
     42a: 49 43        	muls	r1, r1, r1
     42c: 61 6c        	ldr	r1, [r4, #68]
     42e: 69 62        	str	r1, [r5, #36]
     430: 72 61        	str	r2, [r6, #20]
     432: 74 69        	ldr	r4, [r6, #20]
     434: 6f 6e        	ldr	r7, [r5, #100]
     436: 56 61        	str	r6, [r2, #20]
     438: 6c 75        	strb	r4, [r5, #21]
     43a: 65 00        	lsls	r5, r4, #1
     43c: 52 43        	muls	r2, r2, r2
     43e: 43 5f        	ldrsh	r3, [r0, r5]
     440: 41 48        	ldr	r0, [pc, #260]          @ 0x548 <.debug_info+0x548>
     442: 42 31        	adds	r1, #66
     444: 50 65        	str	r0, [r2, #84]
     446: 72 69        	ldr	r2, [r6, #20]
     448: 70 68        	ldr	r0, [r6, #4]
     44a: 43 6c        	ldr	r3, [r0, #68]
     44c: 6f 63        	str	r7, [r5, #52]
     44e: 6b 4c        	ldr	r4, [pc, #428]          @ 0x5fc <.debug_info+0x5fc>
     450: 50 4d        	ldr	r5, [pc, #320]          @ 0x594 <.debug_info+0x594>
     452: 6f 64        	str	r7, [r5, #68]
     454: 65 43        	muls	r5, r4, r5
     456: 6d 64        	str	r5, [r5, #68]
     458: 00 52        	strh	r0, [r0, r0]
     45a: 43 43        	muls	r3, r0, r3
     45c: 5f 50        	str	r7, [r3, r1]
     45e: 43 4c        	ldr	r4, [pc, #268]          @ 0x56c <.debug_info+0x56c>
     460: 4b 31        	adds	r1, #75
     462: 43 6f        	ldr	r3, [r0, #116]
     464: 6e 66        	str	r6, [r5, #100]
     466: 69 67        	str	r1, [r5, #116]
     468: 00 52        	strh	r0, [r0, r0]
     46a: 43 43        	muls	r3, r0, r3
     46c: 5f 50        	str	r7, [r3, r1]
     46e: 43 4c        	ldr	r4, [pc, #268]          @ 0x57c <.debug_info+0x57c>
     470: 4b 32        	adds	r2, #75
     472: 43 6f        	ldr	r3, [r0, #116]
     474: 6e 66        	str	r6, [r5, #100]
     476: 69 67        	str	r1, [r5, #116]
     478: 00 47        	bx	r0
     47a: 50 49        	ldr	r1, [pc, #320]          @ 0x5bc <.debug_info+0x5bc>
     47c: 4f 5f        	ldrsh	r7, [r1, r5]
     47e: 44 65        	str	r4, [r0, #84]
     480: 49 6e        	ldr	r1, [r1, #100]
     482: 69 74        	strb	r1, [r5, #17]
     484: 00 52        	strh	r0, [r0, r0]
     486: 43 43        	muls	r3, r0, r3
     488: 5f 44        	add	r7, r11
     48a: 65 49        	ldr	r1, [pc, #404]          @ 0x620 <.debug_info+0x620>
     48c: 6e 69        	ldr	r6, [r5, #20]
     48e: 74 00        	lsls	r4, r6, #1
     490: 52 43        	muls	r2, r2, r2
     492: 43 5f        	ldrsh	r3, [r0, r5]
     494: 4d 43        	muls	r5, r1, r5
     496: 4f 32        	adds	r2, #79
     498: 43 6f        	ldr	r3, [r0, #116]
     49a: 6e 66        	str	r6, [r5, #100]
     49c: 69 67        	str	r1, [r5, #116]
     49e: 00 52        	strh	r0, [r0, r0]
     4a0: 43 43        	muls	r3, r0, r3
     4a2: 5f 41        	adcs	r7, r3
     4a4: 48 42        	rsbs	r0, r1, #0
     4a6: 32 50        	str	r2, [r6, r0]
     4a8: 65 72        	strb	r5, [r4, #9]
     4aa: 69 70        	strb	r1, [r5, #1]
     4ac: 68 43        	muls	r0, r5, r0
     4ae: 6c 6f        	ldr	r4, [r5, #116]
     4b0: 63 6b        	ldr	r3, [r4, #52]
     4b2: 4c 50        	str	r4, [r1, r1]
     4b4: 4d 6f        	ldr	r5, [r1, #116]
     4b6: 64 65        	str	r4, [r4, #84]
     4b8: 43 6d        	ldr	r3, [r0, #84]
     4ba: 64 00        	lsls	r4, r4, #1
     4bc: 52 43        	muls	r2, r2, r2
     4be: 43 5f        	ldrsh	r3, [r0, r5]
     4c0: 41 50        	str	r1, [r0, r1]
     4c2: 42 31        	adds	r1, #66
     4c4: 50 65        	str	r0, [r2, #84]
     4c6: 72 69        	ldr	r2, [r6, #20]
     4c8: 70 68        	ldr	r0, [r6, #4]
     4ca: 52 65        	str	r2, [r2, #84]
     4cc: 73 65        	str	r3, [r6, #84]
     4ce: 74 43        	muls	r4, r6, r4
     4d0: 6d 64        	str	r5, [r5, #68]
     4d2: 00 47        	bx	r0
     4d4: 50 49        	ldr	r1, [pc, #320]          @ 0x618 <.debug_info+0x618>
     4d6: 4f 5f        	ldrsh	r7, [r1, r5]
     4d8: 53 74        	strb	r3, [r2, #17]
     4da: 72 75        	strb	r2, [r6, #21]
     4dc: 63 74        	strb	r3, [r4, #17]
     4de: 49 6e        	ldr	r1, [r1, #100]
     4e0: 69 74        	strb	r1, [r5, #17]
     4e2: 00 49        	ldr	r1, [pc, #0]            @ 0x4e4 <.debug_info+0x4e4>
     4e4: 6e 69        	ldr	r6, [r5, #20]
     4e6: 74 69        	ldr	r4, [r6, #20]
     4e8: 61 6c        	ldr	r1, [r4, #68]
     4ea: 69 7a        	ldrb	r1, [r5, #9]
     4ec: 65 41        	adcs	r5, r4
     4ee: 75 64        	str	r5, [r6, #68]
     4f0: 69 6f        	ldr	r1, [r5, #116]
     4f2: 00 52        	strh	r0, [r0, r0]
     4f4: 43 43        	muls	r3, r0, r3
     4f6: 5f 41        	adcs	r7, r3
     4f8: 48 42        	rsbs	r0, r1, #0
     4fa: 33 50        	str	r3, [r6, r0]
     4fc: 65 72        	strb	r5, [r4, #9]
     4fe: 69 70        	strb	r1, [r5, #1]
     500: 68 43        	muls	r0, r5, r0
     502: 6c 6f        	ldr	r4, [r5, #116]
     504: 63 6b        	ldr	r3, [r4, #52]
     506: 43 6d        	ldr	r3, [r0, #84]
     508: 64 00        	lsls	r4, r4, #1
     50a: 52 43        	muls	r2, r2, r2
     50c: 43 5f        	ldrsh	r3, [r0, r5]
     50e: 49 32        	adds	r2, #73
     510: 53 43        	muls	r3, r2, r3
     512: 4c 4b        	ldr	r3, [pc, #304]          @ 0x644 <.debug_info+0x644>
     514: 43 6f        	ldr	r3, [r0, #116]
     516: 6e 66        	str	r6, [r5, #100]
     518: 69 67        	str	r1, [r5, #116]
     51a: 00 5f        	ldrsh	r0, [r0, r4]
     51c: 65 78        	ldrb	r5, [r4, #1]
     51e: 69 74        	strb	r1, [r5, #17]
     520: 00 47        	bx	r0
     522: 50 49        	ldr	r1, [pc, #320]          @ 0x664 <.debug_info+0x664>
     524: 4f 5f        	ldrsh	r7, [r1, r5]
     526: 50 69        	ldr	r0, [r2, #20]
     528: 6e 4c        	ldr	r4, [pc, #440]          @ 0x6e4 <.debug_info+0x6e4>
     52a: 6f 63        	str	r7, [r5, #52]
     52c: 6b 43        	muls	r3, r5, r3
     52e: 6f 6e        	ldr	r7, [r5, #100]
     530: 66 69        	ldr	r6, [r4, #20]
     532: 67 00        	lsls	r7, r4, #1
     534: 52 43        	muls	r2, r2, r2
     536: 43 5f        	ldrsh	r3, [r0, r5]
     538: 41 48        	ldr	r0, [pc, #260]          @ 0x640 <.debug_info+0x640>
     53a: 42 31        	adds	r1, #66
     53c: 50 65        	str	r0, [r2, #84]
     53e: 72 69        	ldr	r2, [r6, #20]
     540: 70 68        	ldr	r0, [r6, #4]
     542: 43 6c        	ldr	r3, [r0, #68]
     544: 6f 63        	str	r7, [r5, #52]
     546: 6b 43        	muls	r3, r5, r3
     548: 6d 64        	str	r5, [r5, #68]
     54a: 00 52        	strh	r0, [r0, r0]
     54c: 43 43        	muls	r3, r0, r3
     54e: 5f 4c        	ldr	r4, [pc, #380]          @ 0x6cc <.debug_info+0x6cc>
     550: 53 49        	ldr	r1, [pc, #332]          @ 0x6a0 <.debug_info+0x6a0>
     552: 43 6d        	ldr	r3, [r0, #84]
     554: 64 00        	lsls	r4, r4, #1
     556: 52 43        	muls	r2, r2, r2
     558: 43 5f        	ldrsh	r3, [r0, r5]
     55a: 41 50        	str	r1, [r0, r1]
     55c: 42 32        	adds	r2, #66
     55e: 50 65        	str	r0, [r2, #84]
     560: 72 69        	ldr	r2, [r6, #20]
     562: 70 68        	ldr	r0, [r6, #4]
     564: 52 65        	str	r2, [r2, #84]
     566: 73 65        	str	r3, [r6, #84]
     568: 74 43        	muls	r4, r6, r4
     56a: 6d 64        	str	r5, [r5, #68]
     56c: 00 47        	bx	r0
     56e: 50 49        	ldr	r1, [pc, #320]          @ 0x6b0 <.debug_info+0x6b0>
     570: 4f 5f        	ldrsh	r7, [r1, r5]
     572: 52 65        	str	r2, [r2, #84]
     574: 61 64        	str	r1, [r4, #68]
     576: 49 6e        	ldr	r1, [r1, #100]
     578: 70 75        	strb	r0, [r6, #21]
     57a: 74 44        	add	r4, lr
     57c: 61 74        	strb	r1, [r4, #17]
     57e: 61 42        	rsbs	r1, r4, #0
     580: 69 74        	strb	r1, [r5, #17]
     582: 00 52        	strh	r0, [r0, r0]
     584: 43 43        	muls	r3, r0, r3
     586: 5f 48        	ldr	r0, [pc, #380]          @ 0x704 <.debug_info+0x704>
     588: 43 4c        	ldr	r4, [pc, #268]          @ 0x698 <.debug_info+0x698>
     58a: 4b 43        	muls	r3, r1, r3
     58c: 6f 6e        	ldr	r7, [r5, #100]
     58e: 66 69        	ldr	r6, [r4, #20]
     590: 67 00        	lsls	r7, r4, #1
