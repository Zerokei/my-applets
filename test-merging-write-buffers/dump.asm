
a.out：     文件格式 elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 2f 00 00 	mov    0x2fd9(%rip),%rax        # 3fe8 <__gmon_start__@Base>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <_Znam@plt-0x10>:
    1020:	ff 35 e2 2f 00 00    	push   0x2fe2(%rip)        # 4008 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 e4 2f 00 00    	jmp    *0x2fe4(%rip)        # 4010 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001030 <_Znam@plt>:
    1030:	ff 25 e2 2f 00 00    	jmp    *0x2fe2(%rip)        # 4018 <_Znam@GLIBCXX_3.4>
    1036:	68 00 00 00 00       	push   $0x0
    103b:	e9 e0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001040 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>:
    1040:	ff 25 da 2f 00 00    	jmp    *0x2fda(%rip)        # 4020 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    1046:	68 01 00 00 00       	push   $0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001050 <clock@plt>:
    1050:	ff 25 d2 2f 00 00    	jmp    *0x2fd2(%rip)        # 4028 <clock@GLIBC_2.2.5>
    1056:	68 02 00 00 00       	push   $0x2
    105b:	e9 c0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001060 <__cxa_atexit@plt>:
    1060:	ff 25 ca 2f 00 00    	jmp    *0x2fca(%rip)        # 4030 <__cxa_atexit@GLIBC_2.2.5>
    1066:	68 03 00 00 00       	push   $0x3
    106b:	e9 b0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>:
    1070:	ff 25 c2 2f 00 00    	jmp    *0x2fc2(%rip)        # 4038 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@GLIBCXX_3.4>
    1076:	68 04 00 00 00       	push   $0x4
    107b:	e9 a0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001080 <_ZdaPv@plt>:
    1080:	ff 25 ba 2f 00 00    	jmp    *0x2fba(%rip)        # 4040 <_ZdaPv@GLIBCXX_3.4>
    1086:	68 05 00 00 00       	push   $0x5
    108b:	e9 90 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001090 <_ZNSt8ios_base4InitC1Ev@plt>:
    1090:	ff 25 b2 2f 00 00    	jmp    *0x2fb2(%rip)        # 4048 <_ZNSt8ios_base4InitC1Ev@GLIBCXX_3.4>
    1096:	68 06 00 00 00       	push   $0x6
    109b:	e9 80 ff ff ff       	jmp    1020 <_init+0x20>

00000000000010a0 <_ZNSo9_M_insertIdEERSoT_@plt>:
    10a0:	ff 25 aa 2f 00 00    	jmp    *0x2faa(%rip)        # 4050 <_ZNSo9_M_insertIdEERSoT_@GLIBCXX_3.4.9>
    10a6:	68 07 00 00 00       	push   $0x7
    10ab:	e9 70 ff ff ff       	jmp    1020 <_init+0x20>

Disassembly of section .text:

00000000000010b0 <_start>:
    10b0:	f3 0f 1e fa          	endbr64 
    10b4:	31 ed                	xor    %ebp,%ebp
    10b6:	49 89 d1             	mov    %rdx,%r9
    10b9:	5e                   	pop    %rsi
    10ba:	48 89 e2             	mov    %rsp,%rdx
    10bd:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    10c1:	50                   	push   %rax
    10c2:	54                   	push   %rsp
    10c3:	45 31 c0             	xor    %r8d,%r8d
    10c6:	31 c9                	xor    %ecx,%ecx
    10c8:	48 8d 3d 83 05 00 00 	lea    0x583(%rip),%rdi        # 1652 <main>
    10cf:	ff 15 03 2f 00 00    	call   *0x2f03(%rip)        # 3fd8 <__libc_start_main@GLIBC_2.34>
    10d5:	f4                   	hlt    
    10d6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    10dd:	00 00 00 

00000000000010e0 <deregister_tm_clones>:
    10e0:	48 8d 3d 81 2f 00 00 	lea    0x2f81(%rip),%rdi        # 4068 <__TMC_END__>
    10e7:	48 8d 05 7a 2f 00 00 	lea    0x2f7a(%rip),%rax        # 4068 <__TMC_END__>
    10ee:	48 39 f8             	cmp    %rdi,%rax
    10f1:	74 15                	je     1108 <deregister_tm_clones+0x28>
    10f3:	48 8b 05 e6 2e 00 00 	mov    0x2ee6(%rip),%rax        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    10fa:	48 85 c0             	test   %rax,%rax
    10fd:	74 09                	je     1108 <deregister_tm_clones+0x28>
    10ff:	ff e0                	jmp    *%rax
    1101:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1108:	c3                   	ret    
    1109:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001110 <register_tm_clones>:
    1110:	48 8d 3d 51 2f 00 00 	lea    0x2f51(%rip),%rdi        # 4068 <__TMC_END__>
    1117:	48 8d 35 4a 2f 00 00 	lea    0x2f4a(%rip),%rsi        # 4068 <__TMC_END__>
    111e:	48 29 fe             	sub    %rdi,%rsi
    1121:	48 89 f0             	mov    %rsi,%rax
    1124:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1128:	48 c1 f8 03          	sar    $0x3,%rax
    112c:	48 01 c6             	add    %rax,%rsi
    112f:	48 d1 fe             	sar    %rsi
    1132:	74 14                	je     1148 <register_tm_clones+0x38>
    1134:	48 8b 05 b5 2e 00 00 	mov    0x2eb5(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable@Base>
    113b:	48 85 c0             	test   %rax,%rax
    113e:	74 08                	je     1148 <register_tm_clones+0x38>
    1140:	ff e0                	jmp    *%rax
    1142:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1148:	c3                   	ret    
    1149:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001150 <__do_global_dtors_aux>:
    1150:	f3 0f 1e fa          	endbr64 
    1154:	80 3d 35 30 00 00 00 	cmpb   $0x0,0x3035(%rip)        # 4190 <completed.0>
    115b:	75 33                	jne    1190 <__do_global_dtors_aux+0x40>
    115d:	55                   	push   %rbp
    115e:	48 83 3d 6a 2e 00 00 	cmpq   $0x0,0x2e6a(%rip)        # 3fd0 <__cxa_finalize@GLIBC_2.2.5>
    1165:	00 
    1166:	48 89 e5             	mov    %rsp,%rbp
    1169:	74 0d                	je     1178 <__do_global_dtors_aux+0x28>
    116b:	48 8b 3d ee 2e 00 00 	mov    0x2eee(%rip),%rdi        # 4060 <__dso_handle>
    1172:	ff 15 58 2e 00 00    	call   *0x2e58(%rip)        # 3fd0 <__cxa_finalize@GLIBC_2.2.5>
    1178:	e8 63 ff ff ff       	call   10e0 <deregister_tm_clones>
    117d:	c6 05 0c 30 00 00 01 	movb   $0x1,0x300c(%rip)        # 4190 <completed.0>
    1184:	5d                   	pop    %rbp
    1185:	c3                   	ret    
    1186:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    118d:	00 00 00 
    1190:	c3                   	ret    
    1191:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    1198:	00 00 00 00 
    119c:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000011a0 <frame_dummy>:
    11a0:	f3 0f 1e fa          	endbr64 
    11a4:	e9 67 ff ff ff       	jmp    1110 <register_tm_clones>

00000000000011a9 <_Z4fun1v>:
    11a9:	41 57                	push   %r15
    11ab:	41 56                	push   %r14
    11ad:	41 55                	push   %r13
    11af:	41 54                	push   %r12
    11b1:	55                   	push   %rbp
    11b2:	53                   	push   %rbx
    11b3:	48 83 ec 18          	sub    $0x18,%rsp
    11b7:	bf 00 80 00 00       	mov    $0x8000,%edi
    11bc:	e8 6f fe ff ff       	call   1030 <_Znam@plt>
    11c1:	49 89 c7             	mov    %rax,%r15
    11c4:	bf 00 80 00 00       	mov    $0x8000,%edi
    11c9:	e8 62 fe ff ff       	call   1030 <_Znam@plt>
    11ce:	49 89 c6             	mov    %rax,%r14
    11d1:	bf 00 80 00 00       	mov    $0x8000,%edi
    11d6:	e8 55 fe ff ff       	call   1030 <_Znam@plt>
    11db:	49 89 c5             	mov    %rax,%r13
    11de:	bf 00 80 00 00       	mov    $0x8000,%edi
    11e3:	e8 48 fe ff ff       	call   1030 <_Znam@plt>
    11e8:	49 89 c4             	mov    %rax,%r12
    11eb:	bf 00 80 00 00       	mov    $0x8000,%edi
    11f0:	e8 3b fe ff ff       	call   1030 <_Znam@plt>
    11f5:	48 89 c5             	mov    %rax,%rbp
    11f8:	bf 00 80 00 00       	mov    $0x8000,%edi
    11fd:	e8 2e fe ff ff       	call   1030 <_Znam@plt>
    1202:	48 89 c3             	mov    %rax,%rbx
    1205:	bf 00 80 00 00       	mov    $0x8000,%edi
    120a:	e8 21 fe ff ff       	call   1030 <_Znam@plt>
    120f:	48 89 04 24          	mov    %rax,(%rsp)
    1213:	bf 00 80 00 00       	mov    $0x8000,%edi
    1218:	e8 13 fe ff ff       	call   1030 <_Znam@plt>
    121d:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    1222:	b8 ff 93 35 77       	mov    $0x773593ff,%eax
    1227:	48 89 c2             	mov    %rax,%rdx
    122a:	83 e2 0f             	and    $0xf,%edx
    122d:	49 89 04 d7          	mov    %rax,(%r15,%rdx,8)
    1231:	49 89 04 d6          	mov    %rax,(%r14,%rdx,8)
    1235:	49 89 44 d5 00       	mov    %rax,0x0(%r13,%rdx,8)
    123a:	49 89 04 d4          	mov    %rax,(%r12,%rdx,8)
    123e:	48 89 44 d5 00       	mov    %rax,0x0(%rbp,%rdx,8)
    1243:	48 89 04 d3          	mov    %rax,(%rbx,%rdx,8)
    1247:	48 8b 0c 24          	mov    (%rsp),%rcx
    124b:	48 89 04 d1          	mov    %rax,(%rcx,%rdx,8)
    124f:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    1254:	48 89 04 d6          	mov    %rax,(%rsi,%rdx,8)
    1258:	48 83 e8 01          	sub    $0x1,%rax
    125c:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
    1260:	75 c5                	jne    1227 <_Z4fun1v+0x7e>
    1262:	4c 89 ff             	mov    %r15,%rdi
    1265:	e8 16 fe ff ff       	call   1080 <_ZdaPv@plt>
    126a:	4c 89 f7             	mov    %r14,%rdi
    126d:	e8 0e fe ff ff       	call   1080 <_ZdaPv@plt>
    1272:	4c 89 ef             	mov    %r13,%rdi
    1275:	e8 06 fe ff ff       	call   1080 <_ZdaPv@plt>
    127a:	4c 89 e7             	mov    %r12,%rdi
    127d:	e8 fe fd ff ff       	call   1080 <_ZdaPv@plt>
    1282:	48 89 ef             	mov    %rbp,%rdi
    1285:	e8 f6 fd ff ff       	call   1080 <_ZdaPv@plt>
    128a:	48 89 df             	mov    %rbx,%rdi
    128d:	e8 ee fd ff ff       	call   1080 <_ZdaPv@plt>
    1292:	48 8b 3c 24          	mov    (%rsp),%rdi
    1296:	e8 e5 fd ff ff       	call   1080 <_ZdaPv@plt>
    129b:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    12a0:	e8 db fd ff ff       	call   1080 <_ZdaPv@plt>
    12a5:	e8 a6 fd ff ff       	call   1050 <clock@plt>
    12aa:	48 83 c4 18          	add    $0x18,%rsp
    12ae:	5b                   	pop    %rbx
    12af:	5d                   	pop    %rbp
    12b0:	41 5c                	pop    %r12
    12b2:	41 5d                	pop    %r13
    12b4:	41 5e                	pop    %r14
    12b6:	41 5f                	pop    %r15
    12b8:	c3                   	ret    

00000000000012b9 <_Z4fun2v>:
    12b9:	41 57                	push   %r15
    12bb:	41 56                	push   %r14
    12bd:	41 55                	push   %r13
    12bf:	41 54                	push   %r12
    12c1:	55                   	push   %rbp
    12c2:	53                   	push   %rbx
    12c3:	48 83 ec 18          	sub    $0x18,%rsp
    12c7:	bf 00 80 00 00       	mov    $0x8000,%edi
    12cc:	e8 5f fd ff ff       	call   1030 <_Znam@plt>
    12d1:	49 89 c7             	mov    %rax,%r15
    12d4:	bf 00 80 00 00       	mov    $0x8000,%edi
    12d9:	e8 52 fd ff ff       	call   1030 <_Znam@plt>
    12de:	49 89 c6             	mov    %rax,%r14
    12e1:	bf 00 80 00 00       	mov    $0x8000,%edi
    12e6:	e8 45 fd ff ff       	call   1030 <_Znam@plt>
    12eb:	49 89 c5             	mov    %rax,%r13
    12ee:	bf 00 80 00 00       	mov    $0x8000,%edi
    12f3:	e8 38 fd ff ff       	call   1030 <_Znam@plt>
    12f8:	49 89 c4             	mov    %rax,%r12
    12fb:	bf 00 80 00 00       	mov    $0x8000,%edi
    1300:	e8 2b fd ff ff       	call   1030 <_Znam@plt>
    1305:	48 89 c5             	mov    %rax,%rbp
    1308:	bf 00 80 00 00       	mov    $0x8000,%edi
    130d:	e8 1e fd ff ff       	call   1030 <_Znam@plt>
    1312:	48 89 c3             	mov    %rax,%rbx
    1315:	bf 00 80 00 00       	mov    $0x8000,%edi
    131a:	e8 11 fd ff ff       	call   1030 <_Znam@plt>
    131f:	48 89 04 24          	mov    %rax,(%rsp)
    1323:	bf 00 80 00 00       	mov    $0x8000,%edi
    1328:	e8 03 fd ff ff       	call   1030 <_Znam@plt>
    132d:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    1332:	b8 ff 93 35 77       	mov    $0x773593ff,%eax
    1337:	48 89 c2             	mov    %rax,%rdx
    133a:	83 e2 0f             	and    $0xf,%edx
    133d:	49 89 04 d7          	mov    %rax,(%r15,%rdx,8)
    1341:	49 89 04 d6          	mov    %rax,(%r14,%rdx,8)
    1345:	49 89 44 d5 00       	mov    %rax,0x0(%r13,%rdx,8)
    134a:	49 89 04 d4          	mov    %rax,(%r12,%rdx,8)
    134e:	48 83 e8 01          	sub    $0x1,%rax
    1352:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
    1356:	75 df                	jne    1337 <_Z4fun2v+0x7e>
    1358:	b8 ff 93 35 77       	mov    $0x773593ff,%eax
    135d:	48 89 c2             	mov    %rax,%rdx
    1360:	83 e2 0f             	and    $0xf,%edx
    1363:	48 89 44 d5 00       	mov    %rax,0x0(%rbp,%rdx,8)
    1368:	48 89 04 d3          	mov    %rax,(%rbx,%rdx,8)
    136c:	48 8b 0c 24          	mov    (%rsp),%rcx
    1370:	48 89 04 d1          	mov    %rax,(%rcx,%rdx,8)
    1374:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    1379:	48 89 04 d6          	mov    %rax,(%rsi,%rdx,8)
    137d:	48 83 e8 01          	sub    $0x1,%rax
    1381:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
    1385:	75 d6                	jne    135d <_Z4fun2v+0xa4>
    1387:	4c 89 ff             	mov    %r15,%rdi
    138a:	e8 f1 fc ff ff       	call   1080 <_ZdaPv@plt>
    138f:	4c 89 f7             	mov    %r14,%rdi
    1392:	e8 e9 fc ff ff       	call   1080 <_ZdaPv@plt>
    1397:	4c 89 ef             	mov    %r13,%rdi
    139a:	e8 e1 fc ff ff       	call   1080 <_ZdaPv@plt>
    139f:	4c 89 e7             	mov    %r12,%rdi
    13a2:	e8 d9 fc ff ff       	call   1080 <_ZdaPv@plt>
    13a7:	48 89 ef             	mov    %rbp,%rdi
    13aa:	e8 d1 fc ff ff       	call   1080 <_ZdaPv@plt>
    13af:	48 89 df             	mov    %rbx,%rdi
    13b2:	e8 c9 fc ff ff       	call   1080 <_ZdaPv@plt>
    13b7:	48 8b 3c 24          	mov    (%rsp),%rdi
    13bb:	e8 c0 fc ff ff       	call   1080 <_ZdaPv@plt>
    13c0:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    13c5:	e8 b6 fc ff ff       	call   1080 <_ZdaPv@plt>
    13ca:	e8 81 fc ff ff       	call   1050 <clock@plt>
    13cf:	48 83 c4 18          	add    $0x18,%rsp
    13d3:	5b                   	pop    %rbx
    13d4:	5d                   	pop    %rbp
    13d5:	41 5c                	pop    %r12
    13d7:	41 5d                	pop    %r13
    13d9:	41 5e                	pop    %r14
    13db:	41 5f                	pop    %r15
    13dd:	c3                   	ret    

00000000000013de <_Z4fun3v>:
    13de:	41 57                	push   %r15
    13e0:	41 56                	push   %r14
    13e2:	41 55                	push   %r13
    13e4:	41 54                	push   %r12
    13e6:	55                   	push   %rbp
    13e7:	53                   	push   %rbx
    13e8:	48 83 ec 18          	sub    $0x18,%rsp
    13ec:	bf 00 80 00 00       	mov    $0x8000,%edi
    13f1:	e8 3a fc ff ff       	call   1030 <_Znam@plt>
    13f6:	49 89 c7             	mov    %rax,%r15
    13f9:	bf 00 80 00 00       	mov    $0x8000,%edi
    13fe:	e8 2d fc ff ff       	call   1030 <_Znam@plt>
    1403:	49 89 c6             	mov    %rax,%r14
    1406:	bf 00 80 00 00       	mov    $0x8000,%edi
    140b:	e8 20 fc ff ff       	call   1030 <_Znam@plt>
    1410:	49 89 c5             	mov    %rax,%r13
    1413:	bf 00 80 00 00       	mov    $0x8000,%edi
    1418:	e8 13 fc ff ff       	call   1030 <_Znam@plt>
    141d:	49 89 c4             	mov    %rax,%r12
    1420:	bf 00 80 00 00       	mov    $0x8000,%edi
    1425:	e8 06 fc ff ff       	call   1030 <_Znam@plt>
    142a:	48 89 c5             	mov    %rax,%rbp
    142d:	bf 00 80 00 00       	mov    $0x8000,%edi
    1432:	e8 f9 fb ff ff       	call   1030 <_Znam@plt>
    1437:	48 89 c3             	mov    %rax,%rbx
    143a:	bf 00 80 00 00       	mov    $0x8000,%edi
    143f:	e8 ec fb ff ff       	call   1030 <_Znam@plt>
    1444:	48 89 04 24          	mov    %rax,(%rsp)
    1448:	bf 00 80 00 00       	mov    $0x8000,%edi
    144d:	e8 de fb ff ff       	call   1030 <_Znam@plt>
    1452:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    1457:	b8 ff 93 35 77       	mov    $0x773593ff,%eax
    145c:	48 89 c2             	mov    %rax,%rdx
    145f:	83 e2 0f             	and    $0xf,%edx
    1462:	49 89 04 d7          	mov    %rax,(%r15,%rdx,8)
    1466:	49 89 04 d6          	mov    %rax,(%r14,%rdx,8)
    146a:	48 83 e8 01          	sub    $0x1,%rax
    146e:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
    1472:	75 e8                	jne    145c <_Z4fun3v+0x7e>
    1474:	b8 ff 93 35 77       	mov    $0x773593ff,%eax
    1479:	48 89 c2             	mov    %rax,%rdx
    147c:	83 e2 0f             	and    $0xf,%edx
    147f:	49 89 44 d5 00       	mov    %rax,0x0(%r13,%rdx,8)
    1484:	49 89 04 d4          	mov    %rax,(%r12,%rdx,8)
    1488:	48 83 e8 01          	sub    $0x1,%rax
    148c:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
    1490:	75 e7                	jne    1479 <_Z4fun3v+0x9b>
    1492:	b8 ff 93 35 77       	mov    $0x773593ff,%eax
    1497:	48 89 c2             	mov    %rax,%rdx
    149a:	83 e2 0f             	and    $0xf,%edx
    149d:	48 89 44 d5 00       	mov    %rax,0x0(%rbp,%rdx,8)
    14a2:	48 89 04 d3          	mov    %rax,(%rbx,%rdx,8)
    14a6:	48 83 e8 01          	sub    $0x1,%rax
    14aa:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
    14ae:	75 e7                	jne    1497 <_Z4fun3v+0xb9>
    14b0:	b8 ff 93 35 77       	mov    $0x773593ff,%eax
    14b5:	48 89 c2             	mov    %rax,%rdx
    14b8:	83 e2 0f             	and    $0xf,%edx
    14bb:	48 8b 0c 24          	mov    (%rsp),%rcx
    14bf:	48 89 04 d1          	mov    %rax,(%rcx,%rdx,8)
    14c3:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    14c8:	48 89 04 d6          	mov    %rax,(%rsi,%rdx,8)
    14cc:	48 83 e8 01          	sub    $0x1,%rax
    14d0:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
    14d4:	75 df                	jne    14b5 <_Z4fun3v+0xd7>
    14d6:	4c 89 ff             	mov    %r15,%rdi
    14d9:	e8 a2 fb ff ff       	call   1080 <_ZdaPv@plt>
    14de:	4c 89 f7             	mov    %r14,%rdi
    14e1:	e8 9a fb ff ff       	call   1080 <_ZdaPv@plt>
    14e6:	4c 89 ef             	mov    %r13,%rdi
    14e9:	e8 92 fb ff ff       	call   1080 <_ZdaPv@plt>
    14ee:	4c 89 e7             	mov    %r12,%rdi
    14f1:	e8 8a fb ff ff       	call   1080 <_ZdaPv@plt>
    14f6:	48 89 ef             	mov    %rbp,%rdi
    14f9:	e8 82 fb ff ff       	call   1080 <_ZdaPv@plt>
    14fe:	48 89 df             	mov    %rbx,%rdi
    1501:	e8 7a fb ff ff       	call   1080 <_ZdaPv@plt>
    1506:	48 8b 3c 24          	mov    (%rsp),%rdi
    150a:	e8 71 fb ff ff       	call   1080 <_ZdaPv@plt>
    150f:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    1514:	e8 67 fb ff ff       	call   1080 <_ZdaPv@plt>
    1519:	e8 32 fb ff ff       	call   1050 <clock@plt>
    151e:	48 83 c4 18          	add    $0x18,%rsp
    1522:	5b                   	pop    %rbx
    1523:	5d                   	pop    %rbp
    1524:	41 5c                	pop    %r12
    1526:	41 5d                	pop    %r13
    1528:	41 5e                	pop    %r14
    152a:	41 5f                	pop    %r15
    152c:	c3                   	ret    

000000000000152d <_Z4fun4v>:
    152d:	41 57                	push   %r15
    152f:	41 56                	push   %r14
    1531:	41 55                	push   %r13
    1533:	41 54                	push   %r12
    1535:	55                   	push   %rbp
    1536:	53                   	push   %rbx
    1537:	48 83 ec 18          	sub    $0x18,%rsp
    153b:	bf 00 80 00 00       	mov    $0x8000,%edi
    1540:	e8 eb fa ff ff       	call   1030 <_Znam@plt>
    1545:	49 89 c7             	mov    %rax,%r15
    1548:	bf 00 80 00 00       	mov    $0x8000,%edi
    154d:	e8 de fa ff ff       	call   1030 <_Znam@plt>
    1552:	49 89 c6             	mov    %rax,%r14
    1555:	bf 00 80 00 00       	mov    $0x8000,%edi
    155a:	e8 d1 fa ff ff       	call   1030 <_Znam@plt>
    155f:	49 89 c5             	mov    %rax,%r13
    1562:	bf 00 80 00 00       	mov    $0x8000,%edi
    1567:	e8 c4 fa ff ff       	call   1030 <_Znam@plt>
    156c:	49 89 c4             	mov    %rax,%r12
    156f:	bf 00 80 00 00       	mov    $0x8000,%edi
    1574:	e8 b7 fa ff ff       	call   1030 <_Znam@plt>
    1579:	48 89 c5             	mov    %rax,%rbp
    157c:	bf 00 80 00 00       	mov    $0x8000,%edi
    1581:	e8 aa fa ff ff       	call   1030 <_Znam@plt>
    1586:	48 89 c3             	mov    %rax,%rbx
    1589:	bf 00 80 00 00       	mov    $0x8000,%edi
    158e:	e8 9d fa ff ff       	call   1030 <_Znam@plt>
    1593:	48 89 04 24          	mov    %rax,(%rsp)
    1597:	bf 00 80 00 00       	mov    $0x8000,%edi
    159c:	e8 8f fa ff ff       	call   1030 <_Znam@plt>
    15a1:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    15a6:	b8 ff 93 35 77       	mov    $0x773593ff,%eax
    15ab:	48 89 c2             	mov    %rax,%rdx
    15ae:	83 e2 0f             	and    $0xf,%edx
    15b1:	49 89 04 d7          	mov    %rax,(%r15,%rdx,8)
    15b5:	49 89 04 d6          	mov    %rax,(%r14,%rdx,8)
    15b9:	49 89 44 d5 00       	mov    %rax,0x0(%r13,%rdx,8)
    15be:	49 89 04 d4          	mov    %rax,(%r12,%rdx,8)
    15c2:	48 8b 0c 24          	mov    (%rsp),%rcx
    15c6:	48 89 04 d1          	mov    %rax,(%rcx,%rdx,8)
    15ca:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    15cf:	48 89 04 d6          	mov    %rax,(%rsi,%rdx,8)
    15d3:	48 83 e8 01          	sub    $0x1,%rax
    15d7:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
    15db:	75 ce                	jne    15ab <_Z4fun4v+0x7e>
    15dd:	b8 ff 93 35 77       	mov    $0x773593ff,%eax
    15e2:	48 89 c2             	mov    %rax,%rdx
    15e5:	83 e2 0f             	and    $0xf,%edx
    15e8:	48 89 44 d5 00       	mov    %rax,0x0(%rbp,%rdx,8)
    15ed:	48 89 04 d3          	mov    %rax,(%rbx,%rdx,8)
    15f1:	48 83 e8 01          	sub    $0x1,%rax
    15f5:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
    15f9:	75 e7                	jne    15e2 <_Z4fun4v+0xb5>
    15fb:	4c 89 ff             	mov    %r15,%rdi
    15fe:	e8 7d fa ff ff       	call   1080 <_ZdaPv@plt>
    1603:	4c 89 f7             	mov    %r14,%rdi
    1606:	e8 75 fa ff ff       	call   1080 <_ZdaPv@plt>
    160b:	4c 89 ef             	mov    %r13,%rdi
    160e:	e8 6d fa ff ff       	call   1080 <_ZdaPv@plt>
    1613:	4c 89 e7             	mov    %r12,%rdi
    1616:	e8 65 fa ff ff       	call   1080 <_ZdaPv@plt>
    161b:	48 89 ef             	mov    %rbp,%rdi
    161e:	e8 5d fa ff ff       	call   1080 <_ZdaPv@plt>
    1623:	48 89 df             	mov    %rbx,%rdi
    1626:	e8 55 fa ff ff       	call   1080 <_ZdaPv@plt>
    162b:	48 8b 3c 24          	mov    (%rsp),%rdi
    162f:	e8 4c fa ff ff       	call   1080 <_ZdaPv@plt>
    1634:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    1639:	e8 42 fa ff ff       	call   1080 <_ZdaPv@plt>
    163e:	e8 0d fa ff ff       	call   1050 <clock@plt>
    1643:	48 83 c4 18          	add    $0x18,%rsp
    1647:	5b                   	pop    %rbx
    1648:	5d                   	pop    %rbp
    1649:	41 5c                	pop    %r12
    164b:	41 5d                	pop    %r13
    164d:	41 5e                	pop    %r14
    164f:	41 5f                	pop    %r15
    1651:	c3                   	ret    

0000000000001652 <main>:
    1652:	41 54                	push   %r12
    1654:	55                   	push   %rbp
    1655:	53                   	push   %rbx
    1656:	e8 f5 f9 ff ff       	call   1050 <clock@plt>
    165b:	49 89 c4             	mov    %rax,%r12
    165e:	48 8d 35 9f 09 00 00 	lea    0x99f(%rip),%rsi        # 2004 <_IO_stdin_used+0x4>
    1665:	48 8d 1d 14 2a 00 00 	lea    0x2a14(%rip),%rbx        # 4080 <_ZSt4cout@GLIBCXX_3.4>
    166c:	48 89 df             	mov    %rbx,%rdi
    166f:	e8 fc f9 ff ff       	call   1070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    1674:	48 89 c5             	mov    %rax,%rbp
    1677:	e8 2d fb ff ff       	call   11a9 <_Z4fun1v>
    167c:	44 29 e0             	sub    %r12d,%eax
    167f:	66 0f ef c0          	pxor   %xmm0,%xmm0
    1683:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
    1687:	f2 0f 5e 05 91 09 00 	divsd  0x991(%rip),%xmm0        # 2020 <_IO_stdin_used+0x20>
    168e:	00 
    168f:	48 89 ef             	mov    %rbp,%rdi
    1692:	e8 09 fa ff ff       	call   10a0 <_ZNSo9_M_insertIdEERSoT_@plt>
    1697:	48 89 c7             	mov    %rax,%rdi
    169a:	e8 a1 f9 ff ff       	call   1040 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    169f:	e8 ac f9 ff ff       	call   1050 <clock@plt>
    16a4:	49 89 c4             	mov    %rax,%r12
    16a7:	48 8d 35 5a 09 00 00 	lea    0x95a(%rip),%rsi        # 2008 <_IO_stdin_used+0x8>
    16ae:	48 89 df             	mov    %rbx,%rdi
    16b1:	e8 ba f9 ff ff       	call   1070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    16b6:	48 89 c5             	mov    %rax,%rbp
    16b9:	e8 fb fb ff ff       	call   12b9 <_Z4fun2v>
    16be:	44 29 e0             	sub    %r12d,%eax
    16c1:	66 0f ef c0          	pxor   %xmm0,%xmm0
    16c5:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
    16c9:	f2 0f 5e 05 4f 09 00 	divsd  0x94f(%rip),%xmm0        # 2020 <_IO_stdin_used+0x20>
    16d0:	00 
    16d1:	48 89 ef             	mov    %rbp,%rdi
    16d4:	e8 c7 f9 ff ff       	call   10a0 <_ZNSo9_M_insertIdEERSoT_@plt>
    16d9:	48 89 c7             	mov    %rax,%rdi
    16dc:	e8 5f f9 ff ff       	call   1040 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    16e1:	e8 6a f9 ff ff       	call   1050 <clock@plt>
    16e6:	49 89 c4             	mov    %rax,%r12
    16e9:	48 8d 35 1d 09 00 00 	lea    0x91d(%rip),%rsi        # 200d <_IO_stdin_used+0xd>
    16f0:	48 89 df             	mov    %rbx,%rdi
    16f3:	e8 78 f9 ff ff       	call   1070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    16f8:	48 89 c5             	mov    %rax,%rbp
    16fb:	e8 de fc ff ff       	call   13de <_Z4fun3v>
    1700:	44 29 e0             	sub    %r12d,%eax
    1703:	66 0f ef c0          	pxor   %xmm0,%xmm0
    1707:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
    170b:	f2 0f 5e 05 0d 09 00 	divsd  0x90d(%rip),%xmm0        # 2020 <_IO_stdin_used+0x20>
    1712:	00 
    1713:	48 89 ef             	mov    %rbp,%rdi
    1716:	e8 85 f9 ff ff       	call   10a0 <_ZNSo9_M_insertIdEERSoT_@plt>
    171b:	48 89 c7             	mov    %rax,%rdi
    171e:	e8 1d f9 ff ff       	call   1040 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    1723:	e8 28 f9 ff ff       	call   1050 <clock@plt>
    1728:	48 89 c5             	mov    %rax,%rbp
    172b:	48 8d 35 e2 08 00 00 	lea    0x8e2(%rip),%rsi        # 2014 <_IO_stdin_used+0x14>
    1732:	48 89 df             	mov    %rbx,%rdi
    1735:	e8 36 f9 ff ff       	call   1070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    173a:	48 89 c3             	mov    %rax,%rbx
    173d:	e8 eb fd ff ff       	call   152d <_Z4fun4v>
    1742:	29 e8                	sub    %ebp,%eax
    1744:	66 0f ef c0          	pxor   %xmm0,%xmm0
    1748:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
    174c:	f2 0f 5e 05 cc 08 00 	divsd  0x8cc(%rip),%xmm0        # 2020 <_IO_stdin_used+0x20>
    1753:	00 
    1754:	48 89 df             	mov    %rbx,%rdi
    1757:	e8 44 f9 ff ff       	call   10a0 <_ZNSo9_M_insertIdEERSoT_@plt>
    175c:	48 89 c7             	mov    %rax,%rdi
    175f:	e8 dc f8 ff ff       	call   1040 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    1764:	b8 00 00 00 00       	mov    $0x0,%eax
    1769:	5b                   	pop    %rbx
    176a:	5d                   	pop    %rbp
    176b:	41 5c                	pop    %r12
    176d:	c3                   	ret    

000000000000176e <_GLOBAL__sub_I__Z4fun1v>:
    176e:	53                   	push   %rbx
    176f:	48 8d 1d 1b 2a 00 00 	lea    0x2a1b(%rip),%rbx        # 4191 <_ZStL8__ioinit>
    1776:	48 89 df             	mov    %rbx,%rdi
    1779:	e8 12 f9 ff ff       	call   1090 <_ZNSt8ios_base4InitC1Ev@plt>
    177e:	48 8d 15 db 28 00 00 	lea    0x28db(%rip),%rdx        # 4060 <__dso_handle>
    1785:	48 89 de             	mov    %rbx,%rsi
    1788:	48 8b 3d 69 28 00 00 	mov    0x2869(%rip),%rdi        # 3ff8 <_ZNSt8ios_base4InitD1Ev@GLIBCXX_3.4>
    178f:	e8 cc f8 ff ff       	call   1060 <__cxa_atexit@plt>
    1794:	5b                   	pop    %rbx
    1795:	c3                   	ret    

Disassembly of section .fini:

0000000000001798 <_fini>:
    1798:	f3 0f 1e fa          	endbr64 
    179c:	48 83 ec 08          	sub    $0x8,%rsp
    17a0:	48 83 c4 08          	add    $0x8,%rsp
    17a4:	c3                   	ret    
