
user/_sh:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <getcmd>:
  exit(0);
}

int
getcmd(char *buf, int nbuf)
{
       0:	1101                	addi	sp,sp,-32
       2:	ec06                	sd	ra,24(sp)
       4:	e822                	sd	s0,16(sp)
       6:	e426                	sd	s1,8(sp)
       8:	e04a                	sd	s2,0(sp)
       a:	1000                	addi	s0,sp,32
       c:	84aa                	mv	s1,a0
       e:	892e                	mv	s2,a1
  write(2, "payam-negin$ ", 13);
      10:	4635                	li	a2,13
      12:	00001597          	auipc	a1,0x1
      16:	1fe58593          	addi	a1,a1,510 # 1210 <malloc+0x104>
      1a:	4509                	li	a0,2
      1c:	445000ef          	jal	c60 <write>
  memset(buf, 0, nbuf);
      20:	864a                	mv	a2,s2
      22:	4581                	li	a1,0
      24:	8526                	mv	a0,s1
      26:	235000ef          	jal	a5a <memset>
  gets(buf, nbuf);
      2a:	85ca                	mv	a1,s2
      2c:	8526                	mv	a0,s1
      2e:	273000ef          	jal	aa0 <gets>
  if(buf[0] == 0) // EOF
      32:	0004c503          	lbu	a0,0(s1)
      36:	00153513          	seqz	a0,a0
    return -1;
  return 0;
}
      3a:	40a00533          	neg	a0,a0
      3e:	60e2                	ld	ra,24(sp)
      40:	6442                	ld	s0,16(sp)
      42:	64a2                	ld	s1,8(sp)
      44:	6902                	ld	s2,0(sp)
      46:	6105                	addi	sp,sp,32
      48:	8082                	ret

000000000000004a <panic>:
  exit(0);
}

void
panic(char *s)
{
      4a:	1141                	addi	sp,sp,-16
      4c:	e406                	sd	ra,8(sp)
      4e:	e022                	sd	s0,0(sp)
      50:	0800                	addi	s0,sp,16
      52:	862a                	mv	a2,a0
  fprintf(2, "%s\n", s);
      54:	00001597          	auipc	a1,0x1
      58:	1d458593          	addi	a1,a1,468 # 1228 <malloc+0x11c>
      5c:	4509                	li	a0,2
      5e:	7d1000ef          	jal	102e <fprintf>
  exit(1);
      62:	4505                	li	a0,1
      64:	3dd000ef          	jal	c40 <exit>

0000000000000068 <fork1>:
}

int
fork1(void)
{
      68:	1141                	addi	sp,sp,-16
      6a:	e406                	sd	ra,8(sp)
      6c:	e022                	sd	s0,0(sp)
      6e:	0800                	addi	s0,sp,16
  int pid;

  pid = fork();
      70:	3c9000ef          	jal	c38 <fork>
  if(pid == -1)
      74:	57fd                	li	a5,-1
      76:	00f50663          	beq	a0,a5,82 <fork1+0x1a>
    panic("fork");
  return pid;
}
      7a:	60a2                	ld	ra,8(sp)
      7c:	6402                	ld	s0,0(sp)
      7e:	0141                	addi	sp,sp,16
      80:	8082                	ret
    panic("fork");
      82:	00001517          	auipc	a0,0x1
      86:	1ae50513          	addi	a0,a0,430 # 1230 <malloc+0x124>
      8a:	fc1ff0ef          	jal	4a <panic>

000000000000008e <runcmd>:
{
      8e:	7179                	addi	sp,sp,-48
      90:	f406                	sd	ra,40(sp)
      92:	f022                	sd	s0,32(sp)
      94:	1800                	addi	s0,sp,48
  if(cmd == 0)
      96:	c11d                	beqz	a0,bc <runcmd+0x2e>
      98:	ec26                	sd	s1,24(sp)
      9a:	e84a                	sd	s2,16(sp)
      9c:	84aa                	mv	s1,a0
  switch(cmd->type){
      9e:	4118                	lw	a4,0(a0)
      a0:	4795                	li	a5,5
      a2:	02e7e263          	bltu	a5,a4,c6 <runcmd+0x38>
      a6:	00056783          	lwu	a5,0(a0)
      aa:	078a                	slli	a5,a5,0x2
      ac:	00001717          	auipc	a4,0x1
      b0:	29470713          	addi	a4,a4,660 # 1340 <malloc+0x234>
      b4:	97ba                	add	a5,a5,a4
      b6:	439c                	lw	a5,0(a5)
      b8:	97ba                	add	a5,a5,a4
      ba:	8782                	jr	a5
      bc:	ec26                	sd	s1,24(sp)
      be:	e84a                	sd	s2,16(sp)
    exit(1);
      c0:	4505                	li	a0,1
      c2:	37f000ef          	jal	c40 <exit>
    panic("runcmd");
      c6:	00001517          	auipc	a0,0x1
      ca:	17250513          	addi	a0,a0,370 # 1238 <malloc+0x12c>
      ce:	f7dff0ef          	jal	4a <panic>
    if(ecmd->argv[0] == 0)
      d2:	00853903          	ld	s2,8(a0)
      d6:	02090f63          	beqz	s2,114 <runcmd+0x86>
    if (ecmd->argv[0] && strcmp(ecmd->argv[0], "!")==0){
      da:	00001597          	auipc	a1,0x1
      de:	16658593          	addi	a1,a1,358 # 1240 <malloc+0x134>
      e2:	854a                	mv	a0,s2
      e4:	121000ef          	jal	a04 <strcmp>
      e8:	e90d                	bnez	a0,11a <runcmd+0x8c>
      write(1,ecmd->argv[1],strlen(ecmd->argv[1]));
      ea:	6884                	ld	s1,16(s1)
      ec:	8526                	mv	a0,s1
      ee:	143000ef          	jal	a30 <strlen>
      f2:	0005061b          	sext.w	a2,a0
      f6:	85a6                	mv	a1,s1
      f8:	4505                	li	a0,1
      fa:	367000ef          	jal	c60 <write>
      write(1,"\n",1);
      fe:	4605                	li	a2,1
     100:	00001597          	auipc	a1,0x1
     104:	14858593          	addi	a1,a1,328 # 1248 <malloc+0x13c>
     108:	4505                	li	a0,1
     10a:	357000ef          	jal	c60 <write>
      exit(0);  
     10e:	4501                	li	a0,0
     110:	331000ef          	jal	c40 <exit>
      exit(1);
     114:	4505                	li	a0,1
     116:	32b000ef          	jal	c40 <exit>
    exec(ecmd->argv[0], ecmd->argv);
     11a:	00848593          	addi	a1,s1,8
     11e:	854a                	mv	a0,s2
     120:	359000ef          	jal	c78 <exec>
    fprintf(2, "exec %s failed\n", ecmd->argv[0]);
     124:	6490                	ld	a2,8(s1)
     126:	00001597          	auipc	a1,0x1
     12a:	12a58593          	addi	a1,a1,298 # 1250 <malloc+0x144>
     12e:	4509                	li	a0,2
     130:	6ff000ef          	jal	102e <fprintf>
    break;
     134:	a8d9                	j	20a <runcmd+0x17c>
    close(rcmd->fd);
     136:	5148                	lw	a0,36(a0)
     138:	331000ef          	jal	c68 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     13c:	508c                	lw	a1,32(s1)
     13e:	6888                	ld	a0,16(s1)
     140:	341000ef          	jal	c80 <open>
     144:	00054563          	bltz	a0,14e <runcmd+0xc0>
    runcmd(rcmd->cmd);
     148:	6488                	ld	a0,8(s1)
     14a:	f45ff0ef          	jal	8e <runcmd>
      fprintf(2, "open %s failed\n", rcmd->file);
     14e:	6890                	ld	a2,16(s1)
     150:	00001597          	auipc	a1,0x1
     154:	11058593          	addi	a1,a1,272 # 1260 <malloc+0x154>
     158:	4509                	li	a0,2
     15a:	6d5000ef          	jal	102e <fprintf>
      exit(1);
     15e:	4505                	li	a0,1
     160:	2e1000ef          	jal	c40 <exit>
    if(fork1() == 0)
     164:	f05ff0ef          	jal	68 <fork1>
     168:	e501                	bnez	a0,170 <runcmd+0xe2>
      runcmd(lcmd->left);
     16a:	6488                	ld	a0,8(s1)
     16c:	f23ff0ef          	jal	8e <runcmd>
    wait(0);
     170:	4501                	li	a0,0
     172:	2d7000ef          	jal	c48 <wait>
    runcmd(lcmd->right);
     176:	6888                	ld	a0,16(s1)
     178:	f17ff0ef          	jal	8e <runcmd>
    if(pipe(p) < 0)
     17c:	fd840513          	addi	a0,s0,-40
     180:	2d1000ef          	jal	c50 <pipe>
     184:	02054763          	bltz	a0,1b2 <runcmd+0x124>
    if(fork1() == 0){
     188:	ee1ff0ef          	jal	68 <fork1>
     18c:	e90d                	bnez	a0,1be <runcmd+0x130>
      close(1);
     18e:	4505                	li	a0,1
     190:	2d9000ef          	jal	c68 <close>
      dup(p[1]);
     194:	fdc42503          	lw	a0,-36(s0)
     198:	321000ef          	jal	cb8 <dup>
      close(p[0]);
     19c:	fd842503          	lw	a0,-40(s0)
     1a0:	2c9000ef          	jal	c68 <close>
      close(p[1]);
     1a4:	fdc42503          	lw	a0,-36(s0)
     1a8:	2c1000ef          	jal	c68 <close>
      runcmd(pcmd->left);
     1ac:	6488                	ld	a0,8(s1)
     1ae:	ee1ff0ef          	jal	8e <runcmd>
      panic("pipe");
     1b2:	00001517          	auipc	a0,0x1
     1b6:	0be50513          	addi	a0,a0,190 # 1270 <malloc+0x164>
     1ba:	e91ff0ef          	jal	4a <panic>
    if(fork1() == 0){
     1be:	eabff0ef          	jal	68 <fork1>
     1c2:	e115                	bnez	a0,1e6 <runcmd+0x158>
      close(0);
     1c4:	2a5000ef          	jal	c68 <close>
      dup(p[0]);
     1c8:	fd842503          	lw	a0,-40(s0)
     1cc:	2ed000ef          	jal	cb8 <dup>
      close(p[0]);
     1d0:	fd842503          	lw	a0,-40(s0)
     1d4:	295000ef          	jal	c68 <close>
      close(p[1]);
     1d8:	fdc42503          	lw	a0,-36(s0)
     1dc:	28d000ef          	jal	c68 <close>
      runcmd(pcmd->right);
     1e0:	6888                	ld	a0,16(s1)
     1e2:	eadff0ef          	jal	8e <runcmd>
    close(p[0]);
     1e6:	fd842503          	lw	a0,-40(s0)
     1ea:	27f000ef          	jal	c68 <close>
    close(p[1]);
     1ee:	fdc42503          	lw	a0,-36(s0)
     1f2:	277000ef          	jal	c68 <close>
    wait(0);
     1f6:	4501                	li	a0,0
     1f8:	251000ef          	jal	c48 <wait>
    wait(0);
     1fc:	4501                	li	a0,0
     1fe:	24b000ef          	jal	c48 <wait>
    break;
     202:	a021                	j	20a <runcmd+0x17c>
    if(fork1() == 0)
     204:	e65ff0ef          	jal	68 <fork1>
     208:	c501                	beqz	a0,210 <runcmd+0x182>
  exit(0);
     20a:	4501                	li	a0,0
     20c:	235000ef          	jal	c40 <exit>
      runcmd(bcmd->cmd);
     210:	6488                	ld	a0,8(s1)
     212:	e7dff0ef          	jal	8e <runcmd>

0000000000000216 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     216:	1101                	addi	sp,sp,-32
     218:	ec06                	sd	ra,24(sp)
     21a:	e822                	sd	s0,16(sp)
     21c:	e426                	sd	s1,8(sp)
     21e:	1000                	addi	s0,sp,32
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     220:	0a800513          	li	a0,168
     224:	6e9000ef          	jal	110c <malloc>
     228:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     22a:	0a800613          	li	a2,168
     22e:	4581                	li	a1,0
     230:	02b000ef          	jal	a5a <memset>
  cmd->type = EXEC;
     234:	4785                	li	a5,1
     236:	c09c                	sw	a5,0(s1)
  return (struct cmd*)cmd;
}
     238:	8526                	mv	a0,s1
     23a:	60e2                	ld	ra,24(sp)
     23c:	6442                	ld	s0,16(sp)
     23e:	64a2                	ld	s1,8(sp)
     240:	6105                	addi	sp,sp,32
     242:	8082                	ret

0000000000000244 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     244:	7139                	addi	sp,sp,-64
     246:	fc06                	sd	ra,56(sp)
     248:	f822                	sd	s0,48(sp)
     24a:	f426                	sd	s1,40(sp)
     24c:	f04a                	sd	s2,32(sp)
     24e:	ec4e                	sd	s3,24(sp)
     250:	e852                	sd	s4,16(sp)
     252:	e456                	sd	s5,8(sp)
     254:	e05a                	sd	s6,0(sp)
     256:	0080                	addi	s0,sp,64
     258:	8b2a                	mv	s6,a0
     25a:	8aae                	mv	s5,a1
     25c:	8a32                	mv	s4,a2
     25e:	89b6                	mv	s3,a3
     260:	893a                	mv	s2,a4
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     262:	02800513          	li	a0,40
     266:	6a7000ef          	jal	110c <malloc>
     26a:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     26c:	02800613          	li	a2,40
     270:	4581                	li	a1,0
     272:	7e8000ef          	jal	a5a <memset>
  cmd->type = REDIR;
     276:	4789                	li	a5,2
     278:	c09c                	sw	a5,0(s1)
  cmd->cmd = subcmd;
     27a:	0164b423          	sd	s6,8(s1)
  cmd->file = file;
     27e:	0154b823          	sd	s5,16(s1)
  cmd->efile = efile;
     282:	0144bc23          	sd	s4,24(s1)
  cmd->mode = mode;
     286:	0334a023          	sw	s3,32(s1)
  cmd->fd = fd;
     28a:	0324a223          	sw	s2,36(s1)
  return (struct cmd*)cmd;
}
     28e:	8526                	mv	a0,s1
     290:	70e2                	ld	ra,56(sp)
     292:	7442                	ld	s0,48(sp)
     294:	74a2                	ld	s1,40(sp)
     296:	7902                	ld	s2,32(sp)
     298:	69e2                	ld	s3,24(sp)
     29a:	6a42                	ld	s4,16(sp)
     29c:	6aa2                	ld	s5,8(sp)
     29e:	6b02                	ld	s6,0(sp)
     2a0:	6121                	addi	sp,sp,64
     2a2:	8082                	ret

00000000000002a4 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     2a4:	7179                	addi	sp,sp,-48
     2a6:	f406                	sd	ra,40(sp)
     2a8:	f022                	sd	s0,32(sp)
     2aa:	ec26                	sd	s1,24(sp)
     2ac:	e84a                	sd	s2,16(sp)
     2ae:	e44e                	sd	s3,8(sp)
     2b0:	1800                	addi	s0,sp,48
     2b2:	89aa                	mv	s3,a0
     2b4:	892e                	mv	s2,a1
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     2b6:	4561                	li	a0,24
     2b8:	655000ef          	jal	110c <malloc>
     2bc:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     2be:	4661                	li	a2,24
     2c0:	4581                	li	a1,0
     2c2:	798000ef          	jal	a5a <memset>
  cmd->type = PIPE;
     2c6:	478d                	li	a5,3
     2c8:	c09c                	sw	a5,0(s1)
  cmd->left = left;
     2ca:	0134b423          	sd	s3,8(s1)
  cmd->right = right;
     2ce:	0124b823          	sd	s2,16(s1)
  return (struct cmd*)cmd;
}
     2d2:	8526                	mv	a0,s1
     2d4:	70a2                	ld	ra,40(sp)
     2d6:	7402                	ld	s0,32(sp)
     2d8:	64e2                	ld	s1,24(sp)
     2da:	6942                	ld	s2,16(sp)
     2dc:	69a2                	ld	s3,8(sp)
     2de:	6145                	addi	sp,sp,48
     2e0:	8082                	ret

00000000000002e2 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     2e2:	7179                	addi	sp,sp,-48
     2e4:	f406                	sd	ra,40(sp)
     2e6:	f022                	sd	s0,32(sp)
     2e8:	ec26                	sd	s1,24(sp)
     2ea:	e84a                	sd	s2,16(sp)
     2ec:	e44e                	sd	s3,8(sp)
     2ee:	1800                	addi	s0,sp,48
     2f0:	89aa                	mv	s3,a0
     2f2:	892e                	mv	s2,a1
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     2f4:	4561                	li	a0,24
     2f6:	617000ef          	jal	110c <malloc>
     2fa:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     2fc:	4661                	li	a2,24
     2fe:	4581                	li	a1,0
     300:	75a000ef          	jal	a5a <memset>
  cmd->type = LIST;
     304:	4791                	li	a5,4
     306:	c09c                	sw	a5,0(s1)
  cmd->left = left;
     308:	0134b423          	sd	s3,8(s1)
  cmd->right = right;
     30c:	0124b823          	sd	s2,16(s1)
  return (struct cmd*)cmd;
}
     310:	8526                	mv	a0,s1
     312:	70a2                	ld	ra,40(sp)
     314:	7402                	ld	s0,32(sp)
     316:	64e2                	ld	s1,24(sp)
     318:	6942                	ld	s2,16(sp)
     31a:	69a2                	ld	s3,8(sp)
     31c:	6145                	addi	sp,sp,48
     31e:	8082                	ret

0000000000000320 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     320:	1101                	addi	sp,sp,-32
     322:	ec06                	sd	ra,24(sp)
     324:	e822                	sd	s0,16(sp)
     326:	e426                	sd	s1,8(sp)
     328:	e04a                	sd	s2,0(sp)
     32a:	1000                	addi	s0,sp,32
     32c:	892a                	mv	s2,a0
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     32e:	4541                	li	a0,16
     330:	5dd000ef          	jal	110c <malloc>
     334:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     336:	4641                	li	a2,16
     338:	4581                	li	a1,0
     33a:	720000ef          	jal	a5a <memset>
  cmd->type = BACK;
     33e:	4795                	li	a5,5
     340:	c09c                	sw	a5,0(s1)
  cmd->cmd = subcmd;
     342:	0124b423          	sd	s2,8(s1)
  return (struct cmd*)cmd;
}
     346:	8526                	mv	a0,s1
     348:	60e2                	ld	ra,24(sp)
     34a:	6442                	ld	s0,16(sp)
     34c:	64a2                	ld	s1,8(sp)
     34e:	6902                	ld	s2,0(sp)
     350:	6105                	addi	sp,sp,32
     352:	8082                	ret

0000000000000354 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     354:	7139                	addi	sp,sp,-64
     356:	fc06                	sd	ra,56(sp)
     358:	f822                	sd	s0,48(sp)
     35a:	f426                	sd	s1,40(sp)
     35c:	f04a                	sd	s2,32(sp)
     35e:	ec4e                	sd	s3,24(sp)
     360:	e852                	sd	s4,16(sp)
     362:	e456                	sd	s5,8(sp)
     364:	e05a                	sd	s6,0(sp)
     366:	0080                	addi	s0,sp,64
     368:	8a2a                	mv	s4,a0
     36a:	892e                	mv	s2,a1
     36c:	8ab2                	mv	s5,a2
     36e:	8b36                	mv	s6,a3
  char *s;
  int ret;

  s = *ps;
     370:	6104                	ld	s1,0(a0)
  while(s < es && strchr(whitespace, *s))
     372:	00002997          	auipc	s3,0x2
     376:	c9698993          	addi	s3,s3,-874 # 2008 <whitespace>
     37a:	00b4fc63          	bgeu	s1,a1,392 <gettoken+0x3e>
     37e:	0004c583          	lbu	a1,0(s1)
     382:	854e                	mv	a0,s3
     384:	6f8000ef          	jal	a7c <strchr>
     388:	c509                	beqz	a0,392 <gettoken+0x3e>
    s++;
     38a:	0485                	addi	s1,s1,1
  while(s < es && strchr(whitespace, *s))
     38c:	fe9919e3          	bne	s2,s1,37e <gettoken+0x2a>
     390:	84ca                	mv	s1,s2
  if(q)
     392:	000a8463          	beqz	s5,39a <gettoken+0x46>
    *q = s;
     396:	009ab023          	sd	s1,0(s5)
  ret = *s;
     39a:	0004c783          	lbu	a5,0(s1)
     39e:	00078a9b          	sext.w	s5,a5
  switch(*s){
     3a2:	03c00713          	li	a4,60
     3a6:	06f76463          	bltu	a4,a5,40e <gettoken+0xba>
     3aa:	03a00713          	li	a4,58
     3ae:	00f76e63          	bltu	a4,a5,3ca <gettoken+0x76>
     3b2:	cf89                	beqz	a5,3cc <gettoken+0x78>
     3b4:	02600713          	li	a4,38
     3b8:	00e78963          	beq	a5,a4,3ca <gettoken+0x76>
     3bc:	fd87879b          	addiw	a5,a5,-40
     3c0:	0ff7f793          	zext.b	a5,a5
     3c4:	4705                	li	a4,1
     3c6:	06f76b63          	bltu	a4,a5,43c <gettoken+0xe8>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
     3ca:	0485                	addi	s1,s1,1
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     3cc:	000b0463          	beqz	s6,3d4 <gettoken+0x80>
    *eq = s;
     3d0:	009b3023          	sd	s1,0(s6)

  while(s < es && strchr(whitespace, *s))
     3d4:	00002997          	auipc	s3,0x2
     3d8:	c3498993          	addi	s3,s3,-972 # 2008 <whitespace>
     3dc:	0124fc63          	bgeu	s1,s2,3f4 <gettoken+0xa0>
     3e0:	0004c583          	lbu	a1,0(s1)
     3e4:	854e                	mv	a0,s3
     3e6:	696000ef          	jal	a7c <strchr>
     3ea:	c509                	beqz	a0,3f4 <gettoken+0xa0>
    s++;
     3ec:	0485                	addi	s1,s1,1
  while(s < es && strchr(whitespace, *s))
     3ee:	fe9919e3          	bne	s2,s1,3e0 <gettoken+0x8c>
     3f2:	84ca                	mv	s1,s2
  *ps = s;
     3f4:	009a3023          	sd	s1,0(s4)
  return ret;
}
     3f8:	8556                	mv	a0,s5
     3fa:	70e2                	ld	ra,56(sp)
     3fc:	7442                	ld	s0,48(sp)
     3fe:	74a2                	ld	s1,40(sp)
     400:	7902                	ld	s2,32(sp)
     402:	69e2                	ld	s3,24(sp)
     404:	6a42                	ld	s4,16(sp)
     406:	6aa2                	ld	s5,8(sp)
     408:	6b02                	ld	s6,0(sp)
     40a:	6121                	addi	sp,sp,64
     40c:	8082                	ret
  switch(*s){
     40e:	03e00713          	li	a4,62
     412:	02e79163          	bne	a5,a4,434 <gettoken+0xe0>
    s++;
     416:	00148693          	addi	a3,s1,1
    if(*s == '>'){
     41a:	0014c703          	lbu	a4,1(s1)
     41e:	03e00793          	li	a5,62
      s++;
     422:	0489                	addi	s1,s1,2
      ret = '+';
     424:	02b00a93          	li	s5,43
    if(*s == '>'){
     428:	faf702e3          	beq	a4,a5,3cc <gettoken+0x78>
    s++;
     42c:	84b6                	mv	s1,a3
  ret = *s;
     42e:	03e00a93          	li	s5,62
     432:	bf69                	j	3cc <gettoken+0x78>
  switch(*s){
     434:	07c00713          	li	a4,124
     438:	f8e789e3          	beq	a5,a4,3ca <gettoken+0x76>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     43c:	00002997          	auipc	s3,0x2
     440:	bcc98993          	addi	s3,s3,-1076 # 2008 <whitespace>
     444:	00002a97          	auipc	s5,0x2
     448:	bbca8a93          	addi	s5,s5,-1092 # 2000 <symbols>
     44c:	0324fd63          	bgeu	s1,s2,486 <gettoken+0x132>
     450:	0004c583          	lbu	a1,0(s1)
     454:	854e                	mv	a0,s3
     456:	626000ef          	jal	a7c <strchr>
     45a:	e11d                	bnez	a0,480 <gettoken+0x12c>
     45c:	0004c583          	lbu	a1,0(s1)
     460:	8556                	mv	a0,s5
     462:	61a000ef          	jal	a7c <strchr>
     466:	e911                	bnez	a0,47a <gettoken+0x126>
      s++;
     468:	0485                	addi	s1,s1,1
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     46a:	fe9913e3          	bne	s2,s1,450 <gettoken+0xfc>
  if(eq)
     46e:	84ca                	mv	s1,s2
    ret = 'a';
     470:	06100a93          	li	s5,97
  if(eq)
     474:	f40b1ee3          	bnez	s6,3d0 <gettoken+0x7c>
     478:	bfb5                	j	3f4 <gettoken+0xa0>
    ret = 'a';
     47a:	06100a93          	li	s5,97
     47e:	b7b9                	j	3cc <gettoken+0x78>
     480:	06100a93          	li	s5,97
     484:	b7a1                	j	3cc <gettoken+0x78>
     486:	06100a93          	li	s5,97
  if(eq)
     48a:	f40b13e3          	bnez	s6,3d0 <gettoken+0x7c>
     48e:	b79d                	j	3f4 <gettoken+0xa0>

0000000000000490 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     490:	7139                	addi	sp,sp,-64
     492:	fc06                	sd	ra,56(sp)
     494:	f822                	sd	s0,48(sp)
     496:	f426                	sd	s1,40(sp)
     498:	f04a                	sd	s2,32(sp)
     49a:	ec4e                	sd	s3,24(sp)
     49c:	e852                	sd	s4,16(sp)
     49e:	e456                	sd	s5,8(sp)
     4a0:	0080                	addi	s0,sp,64
     4a2:	8a2a                	mv	s4,a0
     4a4:	892e                	mv	s2,a1
     4a6:	8ab2                	mv	s5,a2
  char *s;

  s = *ps;
     4a8:	6104                	ld	s1,0(a0)
  while(s < es && strchr(whitespace, *s))
     4aa:	00002997          	auipc	s3,0x2
     4ae:	b5e98993          	addi	s3,s3,-1186 # 2008 <whitespace>
     4b2:	00b4fc63          	bgeu	s1,a1,4ca <peek+0x3a>
     4b6:	0004c583          	lbu	a1,0(s1)
     4ba:	854e                	mv	a0,s3
     4bc:	5c0000ef          	jal	a7c <strchr>
     4c0:	c509                	beqz	a0,4ca <peek+0x3a>
    s++;
     4c2:	0485                	addi	s1,s1,1
  while(s < es && strchr(whitespace, *s))
     4c4:	fe9919e3          	bne	s2,s1,4b6 <peek+0x26>
     4c8:	84ca                	mv	s1,s2
  *ps = s;
     4ca:	009a3023          	sd	s1,0(s4)
  return *s && strchr(toks, *s);
     4ce:	0004c583          	lbu	a1,0(s1)
     4d2:	4501                	li	a0,0
     4d4:	e991                	bnez	a1,4e8 <peek+0x58>
}
     4d6:	70e2                	ld	ra,56(sp)
     4d8:	7442                	ld	s0,48(sp)
     4da:	74a2                	ld	s1,40(sp)
     4dc:	7902                	ld	s2,32(sp)
     4de:	69e2                	ld	s3,24(sp)
     4e0:	6a42                	ld	s4,16(sp)
     4e2:	6aa2                	ld	s5,8(sp)
     4e4:	6121                	addi	sp,sp,64
     4e6:	8082                	ret
  return *s && strchr(toks, *s);
     4e8:	8556                	mv	a0,s5
     4ea:	592000ef          	jal	a7c <strchr>
     4ee:	00a03533          	snez	a0,a0
     4f2:	b7d5                	j	4d6 <peek+0x46>

00000000000004f4 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     4f4:	711d                	addi	sp,sp,-96
     4f6:	ec86                	sd	ra,88(sp)
     4f8:	e8a2                	sd	s0,80(sp)
     4fa:	e4a6                	sd	s1,72(sp)
     4fc:	e0ca                	sd	s2,64(sp)
     4fe:	fc4e                	sd	s3,56(sp)
     500:	f852                	sd	s4,48(sp)
     502:	f456                	sd	s5,40(sp)
     504:	f05a                	sd	s6,32(sp)
     506:	ec5e                	sd	s7,24(sp)
     508:	1080                	addi	s0,sp,96
     50a:	8a2a                	mv	s4,a0
     50c:	89ae                	mv	s3,a1
     50e:	8932                	mv	s2,a2
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     510:	00001a97          	auipc	s5,0x1
     514:	d88a8a93          	addi	s5,s5,-632 # 1298 <malloc+0x18c>
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
     518:	06100b13          	li	s6,97
      panic("missing file for redirection");
    switch(tok){
     51c:	03c00b93          	li	s7,60
  while(peek(ps, es, "<>")){
     520:	a00d                	j	542 <parseredirs+0x4e>
      panic("missing file for redirection");
     522:	00001517          	auipc	a0,0x1
     526:	d5650513          	addi	a0,a0,-682 # 1278 <malloc+0x16c>
     52a:	b21ff0ef          	jal	4a <panic>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     52e:	4701                	li	a4,0
     530:	4681                	li	a3,0
     532:	fa043603          	ld	a2,-96(s0)
     536:	fa843583          	ld	a1,-88(s0)
     53a:	8552                	mv	a0,s4
     53c:	d09ff0ef          	jal	244 <redircmd>
     540:	8a2a                	mv	s4,a0
  while(peek(ps, es, "<>")){
     542:	8656                	mv	a2,s5
     544:	85ca                	mv	a1,s2
     546:	854e                	mv	a0,s3
     548:	f49ff0ef          	jal	490 <peek>
     54c:	c525                	beqz	a0,5b4 <parseredirs+0xc0>
    tok = gettoken(ps, es, 0, 0);
     54e:	4681                	li	a3,0
     550:	4601                	li	a2,0
     552:	85ca                	mv	a1,s2
     554:	854e                	mv	a0,s3
     556:	dffff0ef          	jal	354 <gettoken>
     55a:	84aa                	mv	s1,a0
    if(gettoken(ps, es, &q, &eq) != 'a')
     55c:	fa040693          	addi	a3,s0,-96
     560:	fa840613          	addi	a2,s0,-88
     564:	85ca                	mv	a1,s2
     566:	854e                	mv	a0,s3
     568:	dedff0ef          	jal	354 <gettoken>
     56c:	fb651be3          	bne	a0,s6,522 <parseredirs+0x2e>
    switch(tok){
     570:	fb748fe3          	beq	s1,s7,52e <parseredirs+0x3a>
     574:	03e00793          	li	a5,62
     578:	02f48263          	beq	s1,a5,59c <parseredirs+0xa8>
     57c:	02b00793          	li	a5,43
     580:	fcf491e3          	bne	s1,a5,542 <parseredirs+0x4e>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE|O_TRUNC, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     584:	4705                	li	a4,1
     586:	20100693          	li	a3,513
     58a:	fa043603          	ld	a2,-96(s0)
     58e:	fa843583          	ld	a1,-88(s0)
     592:	8552                	mv	a0,s4
     594:	cb1ff0ef          	jal	244 <redircmd>
     598:	8a2a                	mv	s4,a0
      break;
     59a:	b765                	j	542 <parseredirs+0x4e>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE|O_TRUNC, 1);
     59c:	4705                	li	a4,1
     59e:	60100693          	li	a3,1537
     5a2:	fa043603          	ld	a2,-96(s0)
     5a6:	fa843583          	ld	a1,-88(s0)
     5aa:	8552                	mv	a0,s4
     5ac:	c99ff0ef          	jal	244 <redircmd>
     5b0:	8a2a                	mv	s4,a0
      break;
     5b2:	bf41                	j	542 <parseredirs+0x4e>
    }
  }
  return cmd;
}
     5b4:	8552                	mv	a0,s4
     5b6:	60e6                	ld	ra,88(sp)
     5b8:	6446                	ld	s0,80(sp)
     5ba:	64a6                	ld	s1,72(sp)
     5bc:	6906                	ld	s2,64(sp)
     5be:	79e2                	ld	s3,56(sp)
     5c0:	7a42                	ld	s4,48(sp)
     5c2:	7aa2                	ld	s5,40(sp)
     5c4:	7b02                	ld	s6,32(sp)
     5c6:	6be2                	ld	s7,24(sp)
     5c8:	6125                	addi	sp,sp,96
     5ca:	8082                	ret

00000000000005cc <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     5cc:	7159                	addi	sp,sp,-112
     5ce:	f486                	sd	ra,104(sp)
     5d0:	f0a2                	sd	s0,96(sp)
     5d2:	eca6                	sd	s1,88(sp)
     5d4:	e0d2                	sd	s4,64(sp)
     5d6:	fc56                	sd	s5,56(sp)
     5d8:	1880                	addi	s0,sp,112
     5da:	8a2a                	mv	s4,a0
     5dc:	8aae                	mv	s5,a1
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     5de:	00001617          	auipc	a2,0x1
     5e2:	cc260613          	addi	a2,a2,-830 # 12a0 <malloc+0x194>
     5e6:	eabff0ef          	jal	490 <peek>
     5ea:	e915                	bnez	a0,61e <parseexec+0x52>
     5ec:	e8ca                	sd	s2,80(sp)
     5ee:	e4ce                	sd	s3,72(sp)
     5f0:	f85a                	sd	s6,48(sp)
     5f2:	f45e                	sd	s7,40(sp)
     5f4:	f062                	sd	s8,32(sp)
     5f6:	ec66                	sd	s9,24(sp)
     5f8:	89aa                	mv	s3,a0
    return parseblock(ps, es);

  ret = execcmd();
     5fa:	c1dff0ef          	jal	216 <execcmd>
     5fe:	8c2a                	mv	s8,a0
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     600:	8656                	mv	a2,s5
     602:	85d2                	mv	a1,s4
     604:	ef1ff0ef          	jal	4f4 <parseredirs>
     608:	84aa                	mv	s1,a0
  while(!peek(ps, es, "|)&;")){
     60a:	008c0913          	addi	s2,s8,8
     60e:	00001b17          	auipc	s6,0x1
     612:	cb2b0b13          	addi	s6,s6,-846 # 12c0 <malloc+0x1b4>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
     616:	06100c93          	li	s9,97
      panic("syntax");
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
     61a:	4ba9                	li	s7,10
  while(!peek(ps, es, "|)&;")){
     61c:	a815                	j	650 <parseexec+0x84>
    return parseblock(ps, es);
     61e:	85d6                	mv	a1,s5
     620:	8552                	mv	a0,s4
     622:	170000ef          	jal	792 <parseblock>
     626:	84aa                	mv	s1,a0
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     628:	8526                	mv	a0,s1
     62a:	70a6                	ld	ra,104(sp)
     62c:	7406                	ld	s0,96(sp)
     62e:	64e6                	ld	s1,88(sp)
     630:	6a06                	ld	s4,64(sp)
     632:	7ae2                	ld	s5,56(sp)
     634:	6165                	addi	sp,sp,112
     636:	8082                	ret
      panic("syntax");
     638:	00001517          	auipc	a0,0x1
     63c:	c7050513          	addi	a0,a0,-912 # 12a8 <malloc+0x19c>
     640:	a0bff0ef          	jal	4a <panic>
    ret = parseredirs(ret, ps, es);
     644:	8656                	mv	a2,s5
     646:	85d2                	mv	a1,s4
     648:	8526                	mv	a0,s1
     64a:	eabff0ef          	jal	4f4 <parseredirs>
     64e:	84aa                	mv	s1,a0
  while(!peek(ps, es, "|)&;")){
     650:	865a                	mv	a2,s6
     652:	85d6                	mv	a1,s5
     654:	8552                	mv	a0,s4
     656:	e3bff0ef          	jal	490 <peek>
     65a:	ed15                	bnez	a0,696 <parseexec+0xca>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     65c:	f9040693          	addi	a3,s0,-112
     660:	f9840613          	addi	a2,s0,-104
     664:	85d6                	mv	a1,s5
     666:	8552                	mv	a0,s4
     668:	cedff0ef          	jal	354 <gettoken>
     66c:	c50d                	beqz	a0,696 <parseexec+0xca>
    if(tok != 'a')
     66e:	fd9515e3          	bne	a0,s9,638 <parseexec+0x6c>
    cmd->argv[argc] = q;
     672:	f9843783          	ld	a5,-104(s0)
     676:	00f93023          	sd	a5,0(s2)
    cmd->eargv[argc] = eq;
     67a:	f9043783          	ld	a5,-112(s0)
     67e:	04f93823          	sd	a5,80(s2)
    argc++;
     682:	2985                	addiw	s3,s3,1
    if(argc >= MAXARGS)
     684:	0921                	addi	s2,s2,8
     686:	fb799fe3          	bne	s3,s7,644 <parseexec+0x78>
      panic("too many args");
     68a:	00001517          	auipc	a0,0x1
     68e:	c2650513          	addi	a0,a0,-986 # 12b0 <malloc+0x1a4>
     692:	9b9ff0ef          	jal	4a <panic>
  cmd->argv[argc] = 0;
     696:	098e                	slli	s3,s3,0x3
     698:	9c4e                	add	s8,s8,s3
     69a:	000c3423          	sd	zero,8(s8)
  cmd->eargv[argc] = 0;
     69e:	040c3c23          	sd	zero,88(s8)
     6a2:	6946                	ld	s2,80(sp)
     6a4:	69a6                	ld	s3,72(sp)
     6a6:	7b42                	ld	s6,48(sp)
     6a8:	7ba2                	ld	s7,40(sp)
     6aa:	7c02                	ld	s8,32(sp)
     6ac:	6ce2                	ld	s9,24(sp)
  return ret;
     6ae:	bfad                	j	628 <parseexec+0x5c>

00000000000006b0 <parsepipe>:
{
     6b0:	7179                	addi	sp,sp,-48
     6b2:	f406                	sd	ra,40(sp)
     6b4:	f022                	sd	s0,32(sp)
     6b6:	ec26                	sd	s1,24(sp)
     6b8:	e84a                	sd	s2,16(sp)
     6ba:	e44e                	sd	s3,8(sp)
     6bc:	1800                	addi	s0,sp,48
     6be:	892a                	mv	s2,a0
     6c0:	89ae                	mv	s3,a1
  cmd = parseexec(ps, es);
     6c2:	f0bff0ef          	jal	5cc <parseexec>
     6c6:	84aa                	mv	s1,a0
  if(peek(ps, es, "|")){
     6c8:	00001617          	auipc	a2,0x1
     6cc:	c0060613          	addi	a2,a2,-1024 # 12c8 <malloc+0x1bc>
     6d0:	85ce                	mv	a1,s3
     6d2:	854a                	mv	a0,s2
     6d4:	dbdff0ef          	jal	490 <peek>
     6d8:	e909                	bnez	a0,6ea <parsepipe+0x3a>
}
     6da:	8526                	mv	a0,s1
     6dc:	70a2                	ld	ra,40(sp)
     6de:	7402                	ld	s0,32(sp)
     6e0:	64e2                	ld	s1,24(sp)
     6e2:	6942                	ld	s2,16(sp)
     6e4:	69a2                	ld	s3,8(sp)
     6e6:	6145                	addi	sp,sp,48
     6e8:	8082                	ret
    gettoken(ps, es, 0, 0);
     6ea:	4681                	li	a3,0
     6ec:	4601                	li	a2,0
     6ee:	85ce                	mv	a1,s3
     6f0:	854a                	mv	a0,s2
     6f2:	c63ff0ef          	jal	354 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     6f6:	85ce                	mv	a1,s3
     6f8:	854a                	mv	a0,s2
     6fa:	fb7ff0ef          	jal	6b0 <parsepipe>
     6fe:	85aa                	mv	a1,a0
     700:	8526                	mv	a0,s1
     702:	ba3ff0ef          	jal	2a4 <pipecmd>
     706:	84aa                	mv	s1,a0
  return cmd;
     708:	bfc9                	j	6da <parsepipe+0x2a>

000000000000070a <parseline>:
{
     70a:	7179                	addi	sp,sp,-48
     70c:	f406                	sd	ra,40(sp)
     70e:	f022                	sd	s0,32(sp)
     710:	ec26                	sd	s1,24(sp)
     712:	e84a                	sd	s2,16(sp)
     714:	e44e                	sd	s3,8(sp)
     716:	e052                	sd	s4,0(sp)
     718:	1800                	addi	s0,sp,48
     71a:	892a                	mv	s2,a0
     71c:	89ae                	mv	s3,a1
  cmd = parsepipe(ps, es);
     71e:	f93ff0ef          	jal	6b0 <parsepipe>
     722:	84aa                	mv	s1,a0
  while(peek(ps, es, "&")){
     724:	00001a17          	auipc	s4,0x1
     728:	baca0a13          	addi	s4,s4,-1108 # 12d0 <malloc+0x1c4>
     72c:	a819                	j	742 <parseline+0x38>
    gettoken(ps, es, 0, 0);
     72e:	4681                	li	a3,0
     730:	4601                	li	a2,0
     732:	85ce                	mv	a1,s3
     734:	854a                	mv	a0,s2
     736:	c1fff0ef          	jal	354 <gettoken>
    cmd = backcmd(cmd);
     73a:	8526                	mv	a0,s1
     73c:	be5ff0ef          	jal	320 <backcmd>
     740:	84aa                	mv	s1,a0
  while(peek(ps, es, "&")){
     742:	8652                	mv	a2,s4
     744:	85ce                	mv	a1,s3
     746:	854a                	mv	a0,s2
     748:	d49ff0ef          	jal	490 <peek>
     74c:	f16d                	bnez	a0,72e <parseline+0x24>
  if(peek(ps, es, ";")){
     74e:	00001617          	auipc	a2,0x1
     752:	b8a60613          	addi	a2,a2,-1142 # 12d8 <malloc+0x1cc>
     756:	85ce                	mv	a1,s3
     758:	854a                	mv	a0,s2
     75a:	d37ff0ef          	jal	490 <peek>
     75e:	e911                	bnez	a0,772 <parseline+0x68>
}
     760:	8526                	mv	a0,s1
     762:	70a2                	ld	ra,40(sp)
     764:	7402                	ld	s0,32(sp)
     766:	64e2                	ld	s1,24(sp)
     768:	6942                	ld	s2,16(sp)
     76a:	69a2                	ld	s3,8(sp)
     76c:	6a02                	ld	s4,0(sp)
     76e:	6145                	addi	sp,sp,48
     770:	8082                	ret
    gettoken(ps, es, 0, 0);
     772:	4681                	li	a3,0
     774:	4601                	li	a2,0
     776:	85ce                	mv	a1,s3
     778:	854a                	mv	a0,s2
     77a:	bdbff0ef          	jal	354 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     77e:	85ce                	mv	a1,s3
     780:	854a                	mv	a0,s2
     782:	f89ff0ef          	jal	70a <parseline>
     786:	85aa                	mv	a1,a0
     788:	8526                	mv	a0,s1
     78a:	b59ff0ef          	jal	2e2 <listcmd>
     78e:	84aa                	mv	s1,a0
  return cmd;
     790:	bfc1                	j	760 <parseline+0x56>

0000000000000792 <parseblock>:
{
     792:	7179                	addi	sp,sp,-48
     794:	f406                	sd	ra,40(sp)
     796:	f022                	sd	s0,32(sp)
     798:	ec26                	sd	s1,24(sp)
     79a:	e84a                	sd	s2,16(sp)
     79c:	e44e                	sd	s3,8(sp)
     79e:	1800                	addi	s0,sp,48
     7a0:	84aa                	mv	s1,a0
     7a2:	892e                	mv	s2,a1
  if(!peek(ps, es, "("))
     7a4:	00001617          	auipc	a2,0x1
     7a8:	afc60613          	addi	a2,a2,-1284 # 12a0 <malloc+0x194>
     7ac:	ce5ff0ef          	jal	490 <peek>
     7b0:	c539                	beqz	a0,7fe <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     7b2:	4681                	li	a3,0
     7b4:	4601                	li	a2,0
     7b6:	85ca                	mv	a1,s2
     7b8:	8526                	mv	a0,s1
     7ba:	b9bff0ef          	jal	354 <gettoken>
  cmd = parseline(ps, es);
     7be:	85ca                	mv	a1,s2
     7c0:	8526                	mv	a0,s1
     7c2:	f49ff0ef          	jal	70a <parseline>
     7c6:	89aa                	mv	s3,a0
  if(!peek(ps, es, ")"))
     7c8:	00001617          	auipc	a2,0x1
     7cc:	b2860613          	addi	a2,a2,-1240 # 12f0 <malloc+0x1e4>
     7d0:	85ca                	mv	a1,s2
     7d2:	8526                	mv	a0,s1
     7d4:	cbdff0ef          	jal	490 <peek>
     7d8:	c90d                	beqz	a0,80a <parseblock+0x78>
  gettoken(ps, es, 0, 0);
     7da:	4681                	li	a3,0
     7dc:	4601                	li	a2,0
     7de:	85ca                	mv	a1,s2
     7e0:	8526                	mv	a0,s1
     7e2:	b73ff0ef          	jal	354 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     7e6:	864a                	mv	a2,s2
     7e8:	85a6                	mv	a1,s1
     7ea:	854e                	mv	a0,s3
     7ec:	d09ff0ef          	jal	4f4 <parseredirs>
}
     7f0:	70a2                	ld	ra,40(sp)
     7f2:	7402                	ld	s0,32(sp)
     7f4:	64e2                	ld	s1,24(sp)
     7f6:	6942                	ld	s2,16(sp)
     7f8:	69a2                	ld	s3,8(sp)
     7fa:	6145                	addi	sp,sp,48
     7fc:	8082                	ret
    panic("parseblock");
     7fe:	00001517          	auipc	a0,0x1
     802:	ae250513          	addi	a0,a0,-1310 # 12e0 <malloc+0x1d4>
     806:	845ff0ef          	jal	4a <panic>
    panic("syntax - missing )");
     80a:	00001517          	auipc	a0,0x1
     80e:	aee50513          	addi	a0,a0,-1298 # 12f8 <malloc+0x1ec>
     812:	839ff0ef          	jal	4a <panic>

0000000000000816 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     816:	1101                	addi	sp,sp,-32
     818:	ec06                	sd	ra,24(sp)
     81a:	e822                	sd	s0,16(sp)
     81c:	e426                	sd	s1,8(sp)
     81e:	1000                	addi	s0,sp,32
     820:	84aa                	mv	s1,a0
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     822:	c131                	beqz	a0,866 <nulterminate+0x50>
    return 0;

  switch(cmd->type){
     824:	4118                	lw	a4,0(a0)
     826:	4795                	li	a5,5
     828:	02e7ef63          	bltu	a5,a4,866 <nulterminate+0x50>
     82c:	00056783          	lwu	a5,0(a0)
     830:	078a                	slli	a5,a5,0x2
     832:	00001717          	auipc	a4,0x1
     836:	b2670713          	addi	a4,a4,-1242 # 1358 <malloc+0x24c>
     83a:	97ba                	add	a5,a5,a4
     83c:	439c                	lw	a5,0(a5)
     83e:	97ba                	add	a5,a5,a4
     840:	8782                	jr	a5
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     842:	651c                	ld	a5,8(a0)
     844:	c38d                	beqz	a5,866 <nulterminate+0x50>
     846:	01050793          	addi	a5,a0,16
      *ecmd->eargv[i] = 0;
     84a:	67b8                	ld	a4,72(a5)
     84c:	00070023          	sb	zero,0(a4)
    for(i=0; ecmd->argv[i]; i++)
     850:	07a1                	addi	a5,a5,8
     852:	ff87b703          	ld	a4,-8(a5)
     856:	fb75                	bnez	a4,84a <nulterminate+0x34>
     858:	a039                	j	866 <nulterminate+0x50>
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
     85a:	6508                	ld	a0,8(a0)
     85c:	fbbff0ef          	jal	816 <nulterminate>
    *rcmd->efile = 0;
     860:	6c9c                	ld	a5,24(s1)
     862:	00078023          	sb	zero,0(a5)
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     866:	8526                	mv	a0,s1
     868:	60e2                	ld	ra,24(sp)
     86a:	6442                	ld	s0,16(sp)
     86c:	64a2                	ld	s1,8(sp)
     86e:	6105                	addi	sp,sp,32
     870:	8082                	ret
    nulterminate(pcmd->left);
     872:	6508                	ld	a0,8(a0)
     874:	fa3ff0ef          	jal	816 <nulterminate>
    nulterminate(pcmd->right);
     878:	6888                	ld	a0,16(s1)
     87a:	f9dff0ef          	jal	816 <nulterminate>
    break;
     87e:	b7e5                	j	866 <nulterminate+0x50>
    nulterminate(lcmd->left);
     880:	6508                	ld	a0,8(a0)
     882:	f95ff0ef          	jal	816 <nulterminate>
    nulterminate(lcmd->right);
     886:	6888                	ld	a0,16(s1)
     888:	f8fff0ef          	jal	816 <nulterminate>
    break;
     88c:	bfe9                	j	866 <nulterminate+0x50>
    nulterminate(bcmd->cmd);
     88e:	6508                	ld	a0,8(a0)
     890:	f87ff0ef          	jal	816 <nulterminate>
    break;
     894:	bfc9                	j	866 <nulterminate+0x50>

0000000000000896 <parsecmd>:
{
     896:	7179                	addi	sp,sp,-48
     898:	f406                	sd	ra,40(sp)
     89a:	f022                	sd	s0,32(sp)
     89c:	ec26                	sd	s1,24(sp)
     89e:	e84a                	sd	s2,16(sp)
     8a0:	1800                	addi	s0,sp,48
     8a2:	fca43c23          	sd	a0,-40(s0)
  es = s + strlen(s);
     8a6:	84aa                	mv	s1,a0
     8a8:	188000ef          	jal	a30 <strlen>
     8ac:	1502                	slli	a0,a0,0x20
     8ae:	9101                	srli	a0,a0,0x20
     8b0:	94aa                	add	s1,s1,a0
  cmd = parseline(&s, es);
     8b2:	85a6                	mv	a1,s1
     8b4:	fd840513          	addi	a0,s0,-40
     8b8:	e53ff0ef          	jal	70a <parseline>
     8bc:	892a                	mv	s2,a0
  peek(&s, es, "");
     8be:	00001617          	auipc	a2,0x1
     8c2:	96260613          	addi	a2,a2,-1694 # 1220 <malloc+0x114>
     8c6:	85a6                	mv	a1,s1
     8c8:	fd840513          	addi	a0,s0,-40
     8cc:	bc5ff0ef          	jal	490 <peek>
  if(s != es){
     8d0:	fd843603          	ld	a2,-40(s0)
     8d4:	00961c63          	bne	a2,s1,8ec <parsecmd+0x56>
  nulterminate(cmd);
     8d8:	854a                	mv	a0,s2
     8da:	f3dff0ef          	jal	816 <nulterminate>
}
     8de:	854a                	mv	a0,s2
     8e0:	70a2                	ld	ra,40(sp)
     8e2:	7402                	ld	s0,32(sp)
     8e4:	64e2                	ld	s1,24(sp)
     8e6:	6942                	ld	s2,16(sp)
     8e8:	6145                	addi	sp,sp,48
     8ea:	8082                	ret
    fprintf(2, "leftovers: %s\n", s);
     8ec:	00001597          	auipc	a1,0x1
     8f0:	a2458593          	addi	a1,a1,-1500 # 1310 <malloc+0x204>
     8f4:	4509                	li	a0,2
     8f6:	738000ef          	jal	102e <fprintf>
    panic("syntax");
     8fa:	00001517          	auipc	a0,0x1
     8fe:	9ae50513          	addi	a0,a0,-1618 # 12a8 <malloc+0x19c>
     902:	f48ff0ef          	jal	4a <panic>

0000000000000906 <main>:
{
     906:	7179                	addi	sp,sp,-48
     908:	f406                	sd	ra,40(sp)
     90a:	f022                	sd	s0,32(sp)
     90c:	ec26                	sd	s1,24(sp)
     90e:	e84a                	sd	s2,16(sp)
     910:	e44e                	sd	s3,8(sp)
     912:	e052                	sd	s4,0(sp)
     914:	1800                	addi	s0,sp,48
  while((fd = open("console", O_RDWR)) >= 0){
     916:	00001497          	auipc	s1,0x1
     91a:	a0a48493          	addi	s1,s1,-1526 # 1320 <malloc+0x214>
     91e:	4589                	li	a1,2
     920:	8526                	mv	a0,s1
     922:	35e000ef          	jal	c80 <open>
     926:	00054763          	bltz	a0,934 <main+0x2e>
    if(fd >= 3){
     92a:	4789                	li	a5,2
     92c:	fea7d9e3          	bge	a5,a0,91e <main+0x18>
      close(fd);
     930:	338000ef          	jal	c68 <close>
  while(getcmd(buf, sizeof(buf)) >= 0){
     934:	00001497          	auipc	s1,0x1
     938:	6ec48493          	addi	s1,s1,1772 # 2020 <buf.0>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     93c:	06300913          	li	s2,99
     940:	02000993          	li	s3,32
     944:	a039                	j	952 <main+0x4c>
    if(fork1() == 0)
     946:	f22ff0ef          	jal	68 <fork1>
     94a:	c93d                	beqz	a0,9c0 <main+0xba>
    wait(0);
     94c:	4501                	li	a0,0
     94e:	2fa000ef          	jal	c48 <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
     952:	06400593          	li	a1,100
     956:	8526                	mv	a0,s1
     958:	ea8ff0ef          	jal	0 <getcmd>
     95c:	06054a63          	bltz	a0,9d0 <main+0xca>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     960:	0004c783          	lbu	a5,0(s1)
     964:	ff2791e3          	bne	a5,s2,946 <main+0x40>
     968:	0014c703          	lbu	a4,1(s1)
     96c:	06400793          	li	a5,100
     970:	fcf71be3          	bne	a4,a5,946 <main+0x40>
     974:	0024c783          	lbu	a5,2(s1)
     978:	fd3797e3          	bne	a5,s3,946 <main+0x40>
      buf[strlen(buf)-1] = 0;  // chop \n
     97c:	00001a17          	auipc	s4,0x1
     980:	6a4a0a13          	addi	s4,s4,1700 # 2020 <buf.0>
     984:	8552                	mv	a0,s4
     986:	0aa000ef          	jal	a30 <strlen>
     98a:	fff5079b          	addiw	a5,a0,-1
     98e:	1782                	slli	a5,a5,0x20
     990:	9381                	srli	a5,a5,0x20
     992:	9a3e                	add	s4,s4,a5
     994:	000a0023          	sb	zero,0(s4)
      if(chdir(buf+3) < 0)
     998:	00001517          	auipc	a0,0x1
     99c:	68b50513          	addi	a0,a0,1675 # 2023 <buf.0+0x3>
     9a0:	310000ef          	jal	cb0 <chdir>
     9a4:	fa0557e3          	bgez	a0,952 <main+0x4c>
        fprintf(2, "cannot cd %s\n", buf+3);
     9a8:	00001617          	auipc	a2,0x1
     9ac:	67b60613          	addi	a2,a2,1659 # 2023 <buf.0+0x3>
     9b0:	00001597          	auipc	a1,0x1
     9b4:	97858593          	addi	a1,a1,-1672 # 1328 <malloc+0x21c>
     9b8:	4509                	li	a0,2
     9ba:	674000ef          	jal	102e <fprintf>
     9be:	bf51                	j	952 <main+0x4c>
      runcmd(parsecmd(buf));
     9c0:	00001517          	auipc	a0,0x1
     9c4:	66050513          	addi	a0,a0,1632 # 2020 <buf.0>
     9c8:	ecfff0ef          	jal	896 <parsecmd>
     9cc:	ec2ff0ef          	jal	8e <runcmd>
  exit(0);
     9d0:	4501                	li	a0,0
     9d2:	26e000ef          	jal	c40 <exit>

00000000000009d6 <start>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
start()
{
     9d6:	1141                	addi	sp,sp,-16
     9d8:	e406                	sd	ra,8(sp)
     9da:	e022                	sd	s0,0(sp)
     9dc:	0800                	addi	s0,sp,16
  extern int main();
  main();
     9de:	f29ff0ef          	jal	906 <main>
  exit(0);
     9e2:	4501                	li	a0,0
     9e4:	25c000ef          	jal	c40 <exit>

00000000000009e8 <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
     9e8:	1141                	addi	sp,sp,-16
     9ea:	e422                	sd	s0,8(sp)
     9ec:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     9ee:	87aa                	mv	a5,a0
     9f0:	0585                	addi	a1,a1,1
     9f2:	0785                	addi	a5,a5,1
     9f4:	fff5c703          	lbu	a4,-1(a1)
     9f8:	fee78fa3          	sb	a4,-1(a5)
     9fc:	fb75                	bnez	a4,9f0 <strcpy+0x8>
    ;
  return os;
}
     9fe:	6422                	ld	s0,8(sp)
     a00:	0141                	addi	sp,sp,16
     a02:	8082                	ret

0000000000000a04 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     a04:	1141                	addi	sp,sp,-16
     a06:	e422                	sd	s0,8(sp)
     a08:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
     a0a:	00054783          	lbu	a5,0(a0)
     a0e:	cb91                	beqz	a5,a22 <strcmp+0x1e>
     a10:	0005c703          	lbu	a4,0(a1)
     a14:	00f71763          	bne	a4,a5,a22 <strcmp+0x1e>
    p++, q++;
     a18:	0505                	addi	a0,a0,1
     a1a:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
     a1c:	00054783          	lbu	a5,0(a0)
     a20:	fbe5                	bnez	a5,a10 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
     a22:	0005c503          	lbu	a0,0(a1)
}
     a26:	40a7853b          	subw	a0,a5,a0
     a2a:	6422                	ld	s0,8(sp)
     a2c:	0141                	addi	sp,sp,16
     a2e:	8082                	ret

0000000000000a30 <strlen>:

uint
strlen(const char *s)
{
     a30:	1141                	addi	sp,sp,-16
     a32:	e422                	sd	s0,8(sp)
     a34:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
     a36:	00054783          	lbu	a5,0(a0)
     a3a:	cf91                	beqz	a5,a56 <strlen+0x26>
     a3c:	0505                	addi	a0,a0,1
     a3e:	87aa                	mv	a5,a0
     a40:	86be                	mv	a3,a5
     a42:	0785                	addi	a5,a5,1
     a44:	fff7c703          	lbu	a4,-1(a5)
     a48:	ff65                	bnez	a4,a40 <strlen+0x10>
     a4a:	40a6853b          	subw	a0,a3,a0
     a4e:	2505                	addiw	a0,a0,1
    ;
  return n;
}
     a50:	6422                	ld	s0,8(sp)
     a52:	0141                	addi	sp,sp,16
     a54:	8082                	ret
  for(n = 0; s[n]; n++)
     a56:	4501                	li	a0,0
     a58:	bfe5                	j	a50 <strlen+0x20>

0000000000000a5a <memset>:

void*
memset(void *dst, int c, uint n)
{
     a5a:	1141                	addi	sp,sp,-16
     a5c:	e422                	sd	s0,8(sp)
     a5e:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
     a60:	ca19                	beqz	a2,a76 <memset+0x1c>
     a62:	87aa                	mv	a5,a0
     a64:	1602                	slli	a2,a2,0x20
     a66:	9201                	srli	a2,a2,0x20
     a68:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
     a6c:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
     a70:	0785                	addi	a5,a5,1
     a72:	fee79de3          	bne	a5,a4,a6c <memset+0x12>
  }
  return dst;
}
     a76:	6422                	ld	s0,8(sp)
     a78:	0141                	addi	sp,sp,16
     a7a:	8082                	ret

0000000000000a7c <strchr>:

char*
strchr(const char *s, char c)
{
     a7c:	1141                	addi	sp,sp,-16
     a7e:	e422                	sd	s0,8(sp)
     a80:	0800                	addi	s0,sp,16
  for(; *s; s++)
     a82:	00054783          	lbu	a5,0(a0)
     a86:	cb99                	beqz	a5,a9c <strchr+0x20>
    if(*s == c)
     a88:	00f58763          	beq	a1,a5,a96 <strchr+0x1a>
  for(; *s; s++)
     a8c:	0505                	addi	a0,a0,1
     a8e:	00054783          	lbu	a5,0(a0)
     a92:	fbfd                	bnez	a5,a88 <strchr+0xc>
      return (char*)s;
  return 0;
     a94:	4501                	li	a0,0
}
     a96:	6422                	ld	s0,8(sp)
     a98:	0141                	addi	sp,sp,16
     a9a:	8082                	ret
  return 0;
     a9c:	4501                	li	a0,0
     a9e:	bfe5                	j	a96 <strchr+0x1a>

0000000000000aa0 <gets>:

char*
gets(char *buf, int max)
{
     aa0:	711d                	addi	sp,sp,-96
     aa2:	ec86                	sd	ra,88(sp)
     aa4:	e8a2                	sd	s0,80(sp)
     aa6:	e4a6                	sd	s1,72(sp)
     aa8:	e0ca                	sd	s2,64(sp)
     aaa:	fc4e                	sd	s3,56(sp)
     aac:	f852                	sd	s4,48(sp)
     aae:	f456                	sd	s5,40(sp)
     ab0:	f05a                	sd	s6,32(sp)
     ab2:	ec5e                	sd	s7,24(sp)
     ab4:	1080                	addi	s0,sp,96
     ab6:	8baa                	mv	s7,a0
     ab8:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     aba:	892a                	mv	s2,a0
     abc:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
     abe:	4aa9                	li	s5,10
     ac0:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
     ac2:	89a6                	mv	s3,s1
     ac4:	2485                	addiw	s1,s1,1
     ac6:	0344d663          	bge	s1,s4,af2 <gets+0x52>
    cc = read(0, &c, 1);
     aca:	4605                	li	a2,1
     acc:	faf40593          	addi	a1,s0,-81
     ad0:	4501                	li	a0,0
     ad2:	186000ef          	jal	c58 <read>
    if(cc < 1)
     ad6:	00a05e63          	blez	a0,af2 <gets+0x52>
    buf[i++] = c;
     ada:	faf44783          	lbu	a5,-81(s0)
     ade:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
     ae2:	01578763          	beq	a5,s5,af0 <gets+0x50>
     ae6:	0905                	addi	s2,s2,1
     ae8:	fd679de3          	bne	a5,s6,ac2 <gets+0x22>
    buf[i++] = c;
     aec:	89a6                	mv	s3,s1
     aee:	a011                	j	af2 <gets+0x52>
     af0:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
     af2:	99de                	add	s3,s3,s7
     af4:	00098023          	sb	zero,0(s3)
  return buf;
}
     af8:	855e                	mv	a0,s7
     afa:	60e6                	ld	ra,88(sp)
     afc:	6446                	ld	s0,80(sp)
     afe:	64a6                	ld	s1,72(sp)
     b00:	6906                	ld	s2,64(sp)
     b02:	79e2                	ld	s3,56(sp)
     b04:	7a42                	ld	s4,48(sp)
     b06:	7aa2                	ld	s5,40(sp)
     b08:	7b02                	ld	s6,32(sp)
     b0a:	6be2                	ld	s7,24(sp)
     b0c:	6125                	addi	sp,sp,96
     b0e:	8082                	ret

0000000000000b10 <stat>:

int
stat(const char *n, struct stat *st)
{
     b10:	1101                	addi	sp,sp,-32
     b12:	ec06                	sd	ra,24(sp)
     b14:	e822                	sd	s0,16(sp)
     b16:	e04a                	sd	s2,0(sp)
     b18:	1000                	addi	s0,sp,32
     b1a:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     b1c:	4581                	li	a1,0
     b1e:	162000ef          	jal	c80 <open>
  if(fd < 0)
     b22:	02054263          	bltz	a0,b46 <stat+0x36>
     b26:	e426                	sd	s1,8(sp)
     b28:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
     b2a:	85ca                	mv	a1,s2
     b2c:	16c000ef          	jal	c98 <fstat>
     b30:	892a                	mv	s2,a0
  close(fd);
     b32:	8526                	mv	a0,s1
     b34:	134000ef          	jal	c68 <close>
  return r;
     b38:	64a2                	ld	s1,8(sp)
}
     b3a:	854a                	mv	a0,s2
     b3c:	60e2                	ld	ra,24(sp)
     b3e:	6442                	ld	s0,16(sp)
     b40:	6902                	ld	s2,0(sp)
     b42:	6105                	addi	sp,sp,32
     b44:	8082                	ret
    return -1;
     b46:	597d                	li	s2,-1
     b48:	bfcd                	j	b3a <stat+0x2a>

0000000000000b4a <atoi>:

int
atoi(const char *s)
{
     b4a:	1141                	addi	sp,sp,-16
     b4c:	e422                	sd	s0,8(sp)
     b4e:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     b50:	00054683          	lbu	a3,0(a0)
     b54:	fd06879b          	addiw	a5,a3,-48
     b58:	0ff7f793          	zext.b	a5,a5
     b5c:	4625                	li	a2,9
     b5e:	02f66863          	bltu	a2,a5,b8e <atoi+0x44>
     b62:	872a                	mv	a4,a0
  n = 0;
     b64:	4501                	li	a0,0
    n = n*10 + *s++ - '0';
     b66:	0705                	addi	a4,a4,1
     b68:	0025179b          	slliw	a5,a0,0x2
     b6c:	9fa9                	addw	a5,a5,a0
     b6e:	0017979b          	slliw	a5,a5,0x1
     b72:	9fb5                	addw	a5,a5,a3
     b74:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
     b78:	00074683          	lbu	a3,0(a4)
     b7c:	fd06879b          	addiw	a5,a3,-48
     b80:	0ff7f793          	zext.b	a5,a5
     b84:	fef671e3          	bgeu	a2,a5,b66 <atoi+0x1c>
  return n;
}
     b88:	6422                	ld	s0,8(sp)
     b8a:	0141                	addi	sp,sp,16
     b8c:	8082                	ret
  n = 0;
     b8e:	4501                	li	a0,0
     b90:	bfe5                	j	b88 <atoi+0x3e>

0000000000000b92 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     b92:	1141                	addi	sp,sp,-16
     b94:	e422                	sd	s0,8(sp)
     b96:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
     b98:	02b57463          	bgeu	a0,a1,bc0 <memmove+0x2e>
    while(n-- > 0)
     b9c:	00c05f63          	blez	a2,bba <memmove+0x28>
     ba0:	1602                	slli	a2,a2,0x20
     ba2:	9201                	srli	a2,a2,0x20
     ba4:	00c507b3          	add	a5,a0,a2
  dst = vdst;
     ba8:	872a                	mv	a4,a0
      *dst++ = *src++;
     baa:	0585                	addi	a1,a1,1
     bac:	0705                	addi	a4,a4,1
     bae:	fff5c683          	lbu	a3,-1(a1)
     bb2:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
     bb6:	fef71ae3          	bne	a4,a5,baa <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
     bba:	6422                	ld	s0,8(sp)
     bbc:	0141                	addi	sp,sp,16
     bbe:	8082                	ret
    dst += n;
     bc0:	00c50733          	add	a4,a0,a2
    src += n;
     bc4:	95b2                	add	a1,a1,a2
    while(n-- > 0)
     bc6:	fec05ae3          	blez	a2,bba <memmove+0x28>
     bca:	fff6079b          	addiw	a5,a2,-1
     bce:	1782                	slli	a5,a5,0x20
     bd0:	9381                	srli	a5,a5,0x20
     bd2:	fff7c793          	not	a5,a5
     bd6:	97ba                	add	a5,a5,a4
      *--dst = *--src;
     bd8:	15fd                	addi	a1,a1,-1
     bda:	177d                	addi	a4,a4,-1
     bdc:	0005c683          	lbu	a3,0(a1)
     be0:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
     be4:	fee79ae3          	bne	a5,a4,bd8 <memmove+0x46>
     be8:	bfc9                	j	bba <memmove+0x28>

0000000000000bea <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     bea:	1141                	addi	sp,sp,-16
     bec:	e422                	sd	s0,8(sp)
     bee:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
     bf0:	ca05                	beqz	a2,c20 <memcmp+0x36>
     bf2:	fff6069b          	addiw	a3,a2,-1
     bf6:	1682                	slli	a3,a3,0x20
     bf8:	9281                	srli	a3,a3,0x20
     bfa:	0685                	addi	a3,a3,1
     bfc:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
     bfe:	00054783          	lbu	a5,0(a0)
     c02:	0005c703          	lbu	a4,0(a1)
     c06:	00e79863          	bne	a5,a4,c16 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
     c0a:	0505                	addi	a0,a0,1
    p2++;
     c0c:	0585                	addi	a1,a1,1
  while (n-- > 0) {
     c0e:	fed518e3          	bne	a0,a3,bfe <memcmp+0x14>
  }
  return 0;
     c12:	4501                	li	a0,0
     c14:	a019                	j	c1a <memcmp+0x30>
      return *p1 - *p2;
     c16:	40e7853b          	subw	a0,a5,a4
}
     c1a:	6422                	ld	s0,8(sp)
     c1c:	0141                	addi	sp,sp,16
     c1e:	8082                	ret
  return 0;
     c20:	4501                	li	a0,0
     c22:	bfe5                	j	c1a <memcmp+0x30>

0000000000000c24 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     c24:	1141                	addi	sp,sp,-16
     c26:	e406                	sd	ra,8(sp)
     c28:	e022                	sd	s0,0(sp)
     c2a:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
     c2c:	f67ff0ef          	jal	b92 <memmove>
}
     c30:	60a2                	ld	ra,8(sp)
     c32:	6402                	ld	s0,0(sp)
     c34:	0141                	addi	sp,sp,16
     c36:	8082                	ret

0000000000000c38 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     c38:	4885                	li	a7,1
 ecall
     c3a:	00000073          	ecall
 ret
     c3e:	8082                	ret

0000000000000c40 <exit>:
.global exit
exit:
 li a7, SYS_exit
     c40:	4889                	li	a7,2
 ecall
     c42:	00000073          	ecall
 ret
     c46:	8082                	ret

0000000000000c48 <wait>:
.global wait
wait:
 li a7, SYS_wait
     c48:	488d                	li	a7,3
 ecall
     c4a:	00000073          	ecall
 ret
     c4e:	8082                	ret

0000000000000c50 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     c50:	4891                	li	a7,4
 ecall
     c52:	00000073          	ecall
 ret
     c56:	8082                	ret

0000000000000c58 <read>:
.global read
read:
 li a7, SYS_read
     c58:	4895                	li	a7,5
 ecall
     c5a:	00000073          	ecall
 ret
     c5e:	8082                	ret

0000000000000c60 <write>:
.global write
write:
 li a7, SYS_write
     c60:	48c1                	li	a7,16
 ecall
     c62:	00000073          	ecall
 ret
     c66:	8082                	ret

0000000000000c68 <close>:
.global close
close:
 li a7, SYS_close
     c68:	48d5                	li	a7,21
 ecall
     c6a:	00000073          	ecall
 ret
     c6e:	8082                	ret

0000000000000c70 <kill>:
.global kill
kill:
 li a7, SYS_kill
     c70:	4899                	li	a7,6
 ecall
     c72:	00000073          	ecall
 ret
     c76:	8082                	ret

0000000000000c78 <exec>:
.global exec
exec:
 li a7, SYS_exec
     c78:	489d                	li	a7,7
 ecall
     c7a:	00000073          	ecall
 ret
     c7e:	8082                	ret

0000000000000c80 <open>:
.global open
open:
 li a7, SYS_open
     c80:	48bd                	li	a7,15
 ecall
     c82:	00000073          	ecall
 ret
     c86:	8082                	ret

0000000000000c88 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     c88:	48c5                	li	a7,17
 ecall
     c8a:	00000073          	ecall
 ret
     c8e:	8082                	ret

0000000000000c90 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     c90:	48c9                	li	a7,18
 ecall
     c92:	00000073          	ecall
 ret
     c96:	8082                	ret

0000000000000c98 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     c98:	48a1                	li	a7,8
 ecall
     c9a:	00000073          	ecall
 ret
     c9e:	8082                	ret

0000000000000ca0 <link>:
.global link
link:
 li a7, SYS_link
     ca0:	48cd                	li	a7,19
 ecall
     ca2:	00000073          	ecall
 ret
     ca6:	8082                	ret

0000000000000ca8 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     ca8:	48d1                	li	a7,20
 ecall
     caa:	00000073          	ecall
 ret
     cae:	8082                	ret

0000000000000cb0 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     cb0:	48a5                	li	a7,9
 ecall
     cb2:	00000073          	ecall
 ret
     cb6:	8082                	ret

0000000000000cb8 <dup>:
.global dup
dup:
 li a7, SYS_dup
     cb8:	48a9                	li	a7,10
 ecall
     cba:	00000073          	ecall
 ret
     cbe:	8082                	ret

0000000000000cc0 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     cc0:	48ad                	li	a7,11
 ecall
     cc2:	00000073          	ecall
 ret
     cc6:	8082                	ret

0000000000000cc8 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     cc8:	48b1                	li	a7,12
 ecall
     cca:	00000073          	ecall
 ret
     cce:	8082                	ret

0000000000000cd0 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     cd0:	48b5                	li	a7,13
 ecall
     cd2:	00000073          	ecall
 ret
     cd6:	8082                	ret

0000000000000cd8 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     cd8:	48b9                	li	a7,14
 ecall
     cda:	00000073          	ecall
 ret
     cde:	8082                	ret

0000000000000ce0 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     ce0:	1101                	addi	sp,sp,-32
     ce2:	ec06                	sd	ra,24(sp)
     ce4:	e822                	sd	s0,16(sp)
     ce6:	1000                	addi	s0,sp,32
     ce8:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
     cec:	4605                	li	a2,1
     cee:	fef40593          	addi	a1,s0,-17
     cf2:	f6fff0ef          	jal	c60 <write>
}
     cf6:	60e2                	ld	ra,24(sp)
     cf8:	6442                	ld	s0,16(sp)
     cfa:	6105                	addi	sp,sp,32
     cfc:	8082                	ret

0000000000000cfe <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     cfe:	7139                	addi	sp,sp,-64
     d00:	fc06                	sd	ra,56(sp)
     d02:	f822                	sd	s0,48(sp)
     d04:	f426                	sd	s1,40(sp)
     d06:	0080                	addi	s0,sp,64
     d08:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     d0a:	c299                	beqz	a3,d10 <printint+0x12>
     d0c:	0805c963          	bltz	a1,d9e <printint+0xa0>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     d10:	2581                	sext.w	a1,a1
  neg = 0;
     d12:	4881                	li	a7,0
     d14:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
     d18:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
     d1a:	2601                	sext.w	a2,a2
     d1c:	00000517          	auipc	a0,0x0
     d20:	65450513          	addi	a0,a0,1620 # 1370 <digits>
     d24:	883a                	mv	a6,a4
     d26:	2705                	addiw	a4,a4,1
     d28:	02c5f7bb          	remuw	a5,a1,a2
     d2c:	1782                	slli	a5,a5,0x20
     d2e:	9381                	srli	a5,a5,0x20
     d30:	97aa                	add	a5,a5,a0
     d32:	0007c783          	lbu	a5,0(a5)
     d36:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
     d3a:	0005879b          	sext.w	a5,a1
     d3e:	02c5d5bb          	divuw	a1,a1,a2
     d42:	0685                	addi	a3,a3,1
     d44:	fec7f0e3          	bgeu	a5,a2,d24 <printint+0x26>
  if(neg)
     d48:	00088c63          	beqz	a7,d60 <printint+0x62>
    buf[i++] = '-';
     d4c:	fd070793          	addi	a5,a4,-48
     d50:	00878733          	add	a4,a5,s0
     d54:	02d00793          	li	a5,45
     d58:	fef70823          	sb	a5,-16(a4)
     d5c:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
     d60:	02e05a63          	blez	a4,d94 <printint+0x96>
     d64:	f04a                	sd	s2,32(sp)
     d66:	ec4e                	sd	s3,24(sp)
     d68:	fc040793          	addi	a5,s0,-64
     d6c:	00e78933          	add	s2,a5,a4
     d70:	fff78993          	addi	s3,a5,-1
     d74:	99ba                	add	s3,s3,a4
     d76:	377d                	addiw	a4,a4,-1
     d78:	1702                	slli	a4,a4,0x20
     d7a:	9301                	srli	a4,a4,0x20
     d7c:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
     d80:	fff94583          	lbu	a1,-1(s2)
     d84:	8526                	mv	a0,s1
     d86:	f5bff0ef          	jal	ce0 <putc>
  while(--i >= 0)
     d8a:	197d                	addi	s2,s2,-1
     d8c:	ff391ae3          	bne	s2,s3,d80 <printint+0x82>
     d90:	7902                	ld	s2,32(sp)
     d92:	69e2                	ld	s3,24(sp)
}
     d94:	70e2                	ld	ra,56(sp)
     d96:	7442                	ld	s0,48(sp)
     d98:	74a2                	ld	s1,40(sp)
     d9a:	6121                	addi	sp,sp,64
     d9c:	8082                	ret
    x = -xx;
     d9e:	40b005bb          	negw	a1,a1
    neg = 1;
     da2:	4885                	li	a7,1
    x = -xx;
     da4:	bf85                	j	d14 <printint+0x16>

0000000000000da6 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     da6:	711d                	addi	sp,sp,-96
     da8:	ec86                	sd	ra,88(sp)
     daa:	e8a2                	sd	s0,80(sp)
     dac:	e0ca                	sd	s2,64(sp)
     dae:	1080                	addi	s0,sp,96
  char *s;
  int c0, c1, c2, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
     db0:	0005c903          	lbu	s2,0(a1)
     db4:	26090863          	beqz	s2,1024 <vprintf+0x27e>
     db8:	e4a6                	sd	s1,72(sp)
     dba:	fc4e                	sd	s3,56(sp)
     dbc:	f852                	sd	s4,48(sp)
     dbe:	f456                	sd	s5,40(sp)
     dc0:	f05a                	sd	s6,32(sp)
     dc2:	ec5e                	sd	s7,24(sp)
     dc4:	e862                	sd	s8,16(sp)
     dc6:	e466                	sd	s9,8(sp)
     dc8:	8b2a                	mv	s6,a0
     dca:	8a2e                	mv	s4,a1
     dcc:	8bb2                	mv	s7,a2
  state = 0;
     dce:	4981                	li	s3,0
  for(i = 0; fmt[i]; i++){
     dd0:	4481                	li	s1,0
     dd2:	4701                	li	a4,0
      if(c0 == '%'){
        state = '%';
      } else {
        putc(fd, c0);
      }
    } else if(state == '%'){
     dd4:	02500a93          	li	s5,37
      c1 = c2 = 0;
      if(c0) c1 = fmt[i+1] & 0xff;
      if(c1) c2 = fmt[i+2] & 0xff;
      if(c0 == 'd'){
     dd8:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c0 == 'l' && c1 == 'd'){
     ddc:	06c00c93          	li	s9,108
     de0:	a005                	j	e00 <vprintf+0x5a>
        putc(fd, c0);
     de2:	85ca                	mv	a1,s2
     de4:	855a                	mv	a0,s6
     de6:	efbff0ef          	jal	ce0 <putc>
     dea:	a019                	j	df0 <vprintf+0x4a>
    } else if(state == '%'){
     dec:	03598263          	beq	s3,s5,e10 <vprintf+0x6a>
  for(i = 0; fmt[i]; i++){
     df0:	2485                	addiw	s1,s1,1
     df2:	8726                	mv	a4,s1
     df4:	009a07b3          	add	a5,s4,s1
     df8:	0007c903          	lbu	s2,0(a5)
     dfc:	20090c63          	beqz	s2,1014 <vprintf+0x26e>
    c0 = fmt[i] & 0xff;
     e00:	0009079b          	sext.w	a5,s2
    if(state == 0){
     e04:	fe0994e3          	bnez	s3,dec <vprintf+0x46>
      if(c0 == '%'){
     e08:	fd579de3          	bne	a5,s5,de2 <vprintf+0x3c>
        state = '%';
     e0c:	89be                	mv	s3,a5
     e0e:	b7cd                	j	df0 <vprintf+0x4a>
      if(c0) c1 = fmt[i+1] & 0xff;
     e10:	00ea06b3          	add	a3,s4,a4
     e14:	0016c683          	lbu	a3,1(a3)
      c1 = c2 = 0;
     e18:	8636                	mv	a2,a3
      if(c1) c2 = fmt[i+2] & 0xff;
     e1a:	c681                	beqz	a3,e22 <vprintf+0x7c>
     e1c:	9752                	add	a4,a4,s4
     e1e:	00274603          	lbu	a2,2(a4)
      if(c0 == 'd'){
     e22:	03878f63          	beq	a5,s8,e60 <vprintf+0xba>
      } else if(c0 == 'l' && c1 == 'd'){
     e26:	05978963          	beq	a5,s9,e78 <vprintf+0xd2>
        printint(fd, va_arg(ap, uint64), 10, 1);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
        printint(fd, va_arg(ap, uint64), 10, 1);
        i += 2;
      } else if(c0 == 'u'){
     e2a:	07500713          	li	a4,117
     e2e:	0ee78363          	beq	a5,a4,f14 <vprintf+0x16e>
        printint(fd, va_arg(ap, uint64), 10, 0);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
        printint(fd, va_arg(ap, uint64), 10, 0);
        i += 2;
      } else if(c0 == 'x'){
     e32:	07800713          	li	a4,120
     e36:	12e78563          	beq	a5,a4,f60 <vprintf+0x1ba>
        printint(fd, va_arg(ap, uint64), 16, 0);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'x'){
        printint(fd, va_arg(ap, uint64), 16, 0);
        i += 2;
      } else if(c0 == 'p'){
     e3a:	07000713          	li	a4,112
     e3e:	14e78a63          	beq	a5,a4,f92 <vprintf+0x1ec>
        printptr(fd, va_arg(ap, uint64));
      } else if(c0 == 's'){
     e42:	07300713          	li	a4,115
     e46:	18e78a63          	beq	a5,a4,fda <vprintf+0x234>
        if((s = va_arg(ap, char*)) == 0)
          s = "(null)";
        for(; *s; s++)
          putc(fd, *s);
      } else if(c0 == '%'){
     e4a:	02500713          	li	a4,37
     e4e:	04e79563          	bne	a5,a4,e98 <vprintf+0xf2>
        putc(fd, '%');
     e52:	02500593          	li	a1,37
     e56:	855a                	mv	a0,s6
     e58:	e89ff0ef          	jal	ce0 <putc>
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
#endif
      state = 0;
     e5c:	4981                	li	s3,0
     e5e:	bf49                	j	df0 <vprintf+0x4a>
        printint(fd, va_arg(ap, int), 10, 1);
     e60:	008b8913          	addi	s2,s7,8
     e64:	4685                	li	a3,1
     e66:	4629                	li	a2,10
     e68:	000ba583          	lw	a1,0(s7)
     e6c:	855a                	mv	a0,s6
     e6e:	e91ff0ef          	jal	cfe <printint>
     e72:	8bca                	mv	s7,s2
      state = 0;
     e74:	4981                	li	s3,0
     e76:	bfad                	j	df0 <vprintf+0x4a>
      } else if(c0 == 'l' && c1 == 'd'){
     e78:	06400793          	li	a5,100
     e7c:	02f68963          	beq	a3,a5,eae <vprintf+0x108>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
     e80:	06c00793          	li	a5,108
     e84:	04f68263          	beq	a3,a5,ec8 <vprintf+0x122>
      } else if(c0 == 'l' && c1 == 'u'){
     e88:	07500793          	li	a5,117
     e8c:	0af68063          	beq	a3,a5,f2c <vprintf+0x186>
      } else if(c0 == 'l' && c1 == 'x'){
     e90:	07800793          	li	a5,120
     e94:	0ef68263          	beq	a3,a5,f78 <vprintf+0x1d2>
        putc(fd, '%');
     e98:	02500593          	li	a1,37
     e9c:	855a                	mv	a0,s6
     e9e:	e43ff0ef          	jal	ce0 <putc>
        putc(fd, c0);
     ea2:	85ca                	mv	a1,s2
     ea4:	855a                	mv	a0,s6
     ea6:	e3bff0ef          	jal	ce0 <putc>
      state = 0;
     eaa:	4981                	li	s3,0
     eac:	b791                	j	df0 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 10, 1);
     eae:	008b8913          	addi	s2,s7,8
     eb2:	4685                	li	a3,1
     eb4:	4629                	li	a2,10
     eb6:	000ba583          	lw	a1,0(s7)
     eba:	855a                	mv	a0,s6
     ebc:	e43ff0ef          	jal	cfe <printint>
        i += 1;
     ec0:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 10, 1);
     ec2:	8bca                	mv	s7,s2
      state = 0;
     ec4:	4981                	li	s3,0
        i += 1;
     ec6:	b72d                	j	df0 <vprintf+0x4a>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
     ec8:	06400793          	li	a5,100
     ecc:	02f60763          	beq	a2,a5,efa <vprintf+0x154>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
     ed0:	07500793          	li	a5,117
     ed4:	06f60963          	beq	a2,a5,f46 <vprintf+0x1a0>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'x'){
     ed8:	07800793          	li	a5,120
     edc:	faf61ee3          	bne	a2,a5,e98 <vprintf+0xf2>
        printint(fd, va_arg(ap, uint64), 16, 0);
     ee0:	008b8913          	addi	s2,s7,8
     ee4:	4681                	li	a3,0
     ee6:	4641                	li	a2,16
     ee8:	000ba583          	lw	a1,0(s7)
     eec:	855a                	mv	a0,s6
     eee:	e11ff0ef          	jal	cfe <printint>
        i += 2;
     ef2:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 16, 0);
     ef4:	8bca                	mv	s7,s2
      state = 0;
     ef6:	4981                	li	s3,0
        i += 2;
     ef8:	bde5                	j	df0 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 10, 1);
     efa:	008b8913          	addi	s2,s7,8
     efe:	4685                	li	a3,1
     f00:	4629                	li	a2,10
     f02:	000ba583          	lw	a1,0(s7)
     f06:	855a                	mv	a0,s6
     f08:	df7ff0ef          	jal	cfe <printint>
        i += 2;
     f0c:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 10, 1);
     f0e:	8bca                	mv	s7,s2
      state = 0;
     f10:	4981                	li	s3,0
        i += 2;
     f12:	bdf9                	j	df0 <vprintf+0x4a>
        printint(fd, va_arg(ap, int), 10, 0);
     f14:	008b8913          	addi	s2,s7,8
     f18:	4681                	li	a3,0
     f1a:	4629                	li	a2,10
     f1c:	000ba583          	lw	a1,0(s7)
     f20:	855a                	mv	a0,s6
     f22:	dddff0ef          	jal	cfe <printint>
     f26:	8bca                	mv	s7,s2
      state = 0;
     f28:	4981                	li	s3,0
     f2a:	b5d9                	j	df0 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 10, 0);
     f2c:	008b8913          	addi	s2,s7,8
     f30:	4681                	li	a3,0
     f32:	4629                	li	a2,10
     f34:	000ba583          	lw	a1,0(s7)
     f38:	855a                	mv	a0,s6
     f3a:	dc5ff0ef          	jal	cfe <printint>
        i += 1;
     f3e:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 10, 0);
     f40:	8bca                	mv	s7,s2
      state = 0;
     f42:	4981                	li	s3,0
        i += 1;
     f44:	b575                	j	df0 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 10, 0);
     f46:	008b8913          	addi	s2,s7,8
     f4a:	4681                	li	a3,0
     f4c:	4629                	li	a2,10
     f4e:	000ba583          	lw	a1,0(s7)
     f52:	855a                	mv	a0,s6
     f54:	dabff0ef          	jal	cfe <printint>
        i += 2;
     f58:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 10, 0);
     f5a:	8bca                	mv	s7,s2
      state = 0;
     f5c:	4981                	li	s3,0
        i += 2;
     f5e:	bd49                	j	df0 <vprintf+0x4a>
        printint(fd, va_arg(ap, int), 16, 0);
     f60:	008b8913          	addi	s2,s7,8
     f64:	4681                	li	a3,0
     f66:	4641                	li	a2,16
     f68:	000ba583          	lw	a1,0(s7)
     f6c:	855a                	mv	a0,s6
     f6e:	d91ff0ef          	jal	cfe <printint>
     f72:	8bca                	mv	s7,s2
      state = 0;
     f74:	4981                	li	s3,0
     f76:	bdad                	j	df0 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 16, 0);
     f78:	008b8913          	addi	s2,s7,8
     f7c:	4681                	li	a3,0
     f7e:	4641                	li	a2,16
     f80:	000ba583          	lw	a1,0(s7)
     f84:	855a                	mv	a0,s6
     f86:	d79ff0ef          	jal	cfe <printint>
        i += 1;
     f8a:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 16, 0);
     f8c:	8bca                	mv	s7,s2
      state = 0;
     f8e:	4981                	li	s3,0
        i += 1;
     f90:	b585                	j	df0 <vprintf+0x4a>
     f92:	e06a                	sd	s10,0(sp)
        printptr(fd, va_arg(ap, uint64));
     f94:	008b8d13          	addi	s10,s7,8
     f98:	000bb983          	ld	s3,0(s7)
  putc(fd, '0');
     f9c:	03000593          	li	a1,48
     fa0:	855a                	mv	a0,s6
     fa2:	d3fff0ef          	jal	ce0 <putc>
  putc(fd, 'x');
     fa6:	07800593          	li	a1,120
     faa:	855a                	mv	a0,s6
     fac:	d35ff0ef          	jal	ce0 <putc>
     fb0:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     fb2:	00000b97          	auipc	s7,0x0
     fb6:	3beb8b93          	addi	s7,s7,958 # 1370 <digits>
     fba:	03c9d793          	srli	a5,s3,0x3c
     fbe:	97de                	add	a5,a5,s7
     fc0:	0007c583          	lbu	a1,0(a5)
     fc4:	855a                	mv	a0,s6
     fc6:	d1bff0ef          	jal	ce0 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     fca:	0992                	slli	s3,s3,0x4
     fcc:	397d                	addiw	s2,s2,-1
     fce:	fe0916e3          	bnez	s2,fba <vprintf+0x214>
        printptr(fd, va_arg(ap, uint64));
     fd2:	8bea                	mv	s7,s10
      state = 0;
     fd4:	4981                	li	s3,0
     fd6:	6d02                	ld	s10,0(sp)
     fd8:	bd21                	j	df0 <vprintf+0x4a>
        if((s = va_arg(ap, char*)) == 0)
     fda:	008b8993          	addi	s3,s7,8
     fde:	000bb903          	ld	s2,0(s7)
     fe2:	00090f63          	beqz	s2,1000 <vprintf+0x25a>
        for(; *s; s++)
     fe6:	00094583          	lbu	a1,0(s2)
     fea:	c195                	beqz	a1,100e <vprintf+0x268>
          putc(fd, *s);
     fec:	855a                	mv	a0,s6
     fee:	cf3ff0ef          	jal	ce0 <putc>
        for(; *s; s++)
     ff2:	0905                	addi	s2,s2,1
     ff4:	00094583          	lbu	a1,0(s2)
     ff8:	f9f5                	bnez	a1,fec <vprintf+0x246>
        if((s = va_arg(ap, char*)) == 0)
     ffa:	8bce                	mv	s7,s3
      state = 0;
     ffc:	4981                	li	s3,0
     ffe:	bbcd                	j	df0 <vprintf+0x4a>
          s = "(null)";
    1000:	00000917          	auipc	s2,0x0
    1004:	33890913          	addi	s2,s2,824 # 1338 <malloc+0x22c>
        for(; *s; s++)
    1008:	02800593          	li	a1,40
    100c:	b7c5                	j	fec <vprintf+0x246>
        if((s = va_arg(ap, char*)) == 0)
    100e:	8bce                	mv	s7,s3
      state = 0;
    1010:	4981                	li	s3,0
    1012:	bbf9                	j	df0 <vprintf+0x4a>
    1014:	64a6                	ld	s1,72(sp)
    1016:	79e2                	ld	s3,56(sp)
    1018:	7a42                	ld	s4,48(sp)
    101a:	7aa2                	ld	s5,40(sp)
    101c:	7b02                	ld	s6,32(sp)
    101e:	6be2                	ld	s7,24(sp)
    1020:	6c42                	ld	s8,16(sp)
    1022:	6ca2                	ld	s9,8(sp)
    }
  }
}
    1024:	60e6                	ld	ra,88(sp)
    1026:	6446                	ld	s0,80(sp)
    1028:	6906                	ld	s2,64(sp)
    102a:	6125                	addi	sp,sp,96
    102c:	8082                	ret

000000000000102e <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
    102e:	715d                	addi	sp,sp,-80
    1030:	ec06                	sd	ra,24(sp)
    1032:	e822                	sd	s0,16(sp)
    1034:	1000                	addi	s0,sp,32
    1036:	e010                	sd	a2,0(s0)
    1038:	e414                	sd	a3,8(s0)
    103a:	e818                	sd	a4,16(s0)
    103c:	ec1c                	sd	a5,24(s0)
    103e:	03043023          	sd	a6,32(s0)
    1042:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
    1046:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
    104a:	8622                	mv	a2,s0
    104c:	d5bff0ef          	jal	da6 <vprintf>
}
    1050:	60e2                	ld	ra,24(sp)
    1052:	6442                	ld	s0,16(sp)
    1054:	6161                	addi	sp,sp,80
    1056:	8082                	ret

0000000000001058 <printf>:

void
printf(const char *fmt, ...)
{
    1058:	711d                	addi	sp,sp,-96
    105a:	ec06                	sd	ra,24(sp)
    105c:	e822                	sd	s0,16(sp)
    105e:	1000                	addi	s0,sp,32
    1060:	e40c                	sd	a1,8(s0)
    1062:	e810                	sd	a2,16(s0)
    1064:	ec14                	sd	a3,24(s0)
    1066:	f018                	sd	a4,32(s0)
    1068:	f41c                	sd	a5,40(s0)
    106a:	03043823          	sd	a6,48(s0)
    106e:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
    1072:	00840613          	addi	a2,s0,8
    1076:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
    107a:	85aa                	mv	a1,a0
    107c:	4505                	li	a0,1
    107e:	d29ff0ef          	jal	da6 <vprintf>
}
    1082:	60e2                	ld	ra,24(sp)
    1084:	6442                	ld	s0,16(sp)
    1086:	6125                	addi	sp,sp,96
    1088:	8082                	ret

000000000000108a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    108a:	1141                	addi	sp,sp,-16
    108c:	e422                	sd	s0,8(sp)
    108e:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1090:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1094:	00001797          	auipc	a5,0x1
    1098:	f7c7b783          	ld	a5,-132(a5) # 2010 <freep>
    109c:	a02d                	j	10c6 <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    109e:	4618                	lw	a4,8(a2)
    10a0:	9f2d                	addw	a4,a4,a1
    10a2:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
    10a6:	6398                	ld	a4,0(a5)
    10a8:	6310                	ld	a2,0(a4)
    10aa:	a83d                	j	10e8 <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    10ac:	ff852703          	lw	a4,-8(a0)
    10b0:	9f31                	addw	a4,a4,a2
    10b2:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
    10b4:	ff053683          	ld	a3,-16(a0)
    10b8:	a091                	j	10fc <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    10ba:	6398                	ld	a4,0(a5)
    10bc:	00e7e463          	bltu	a5,a4,10c4 <free+0x3a>
    10c0:	00e6ea63          	bltu	a3,a4,10d4 <free+0x4a>
{
    10c4:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    10c6:	fed7fae3          	bgeu	a5,a3,10ba <free+0x30>
    10ca:	6398                	ld	a4,0(a5)
    10cc:	00e6e463          	bltu	a3,a4,10d4 <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    10d0:	fee7eae3          	bltu	a5,a4,10c4 <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
    10d4:	ff852583          	lw	a1,-8(a0)
    10d8:	6390                	ld	a2,0(a5)
    10da:	02059813          	slli	a6,a1,0x20
    10de:	01c85713          	srli	a4,a6,0x1c
    10e2:	9736                	add	a4,a4,a3
    10e4:	fae60de3          	beq	a2,a4,109e <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
    10e8:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
    10ec:	4790                	lw	a2,8(a5)
    10ee:	02061593          	slli	a1,a2,0x20
    10f2:	01c5d713          	srli	a4,a1,0x1c
    10f6:	973e                	add	a4,a4,a5
    10f8:	fae68ae3          	beq	a3,a4,10ac <free+0x22>
    p->s.ptr = bp->s.ptr;
    10fc:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
    10fe:	00001717          	auipc	a4,0x1
    1102:	f0f73923          	sd	a5,-238(a4) # 2010 <freep>
}
    1106:	6422                	ld	s0,8(sp)
    1108:	0141                	addi	sp,sp,16
    110a:	8082                	ret

000000000000110c <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    110c:	7139                	addi	sp,sp,-64
    110e:	fc06                	sd	ra,56(sp)
    1110:	f822                	sd	s0,48(sp)
    1112:	f426                	sd	s1,40(sp)
    1114:	ec4e                	sd	s3,24(sp)
    1116:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1118:	02051493          	slli	s1,a0,0x20
    111c:	9081                	srli	s1,s1,0x20
    111e:	04bd                	addi	s1,s1,15
    1120:	8091                	srli	s1,s1,0x4
    1122:	0014899b          	addiw	s3,s1,1
    1126:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
    1128:	00001517          	auipc	a0,0x1
    112c:	ee853503          	ld	a0,-280(a0) # 2010 <freep>
    1130:	c915                	beqz	a0,1164 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1132:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
    1134:	4798                	lw	a4,8(a5)
    1136:	08977a63          	bgeu	a4,s1,11ca <malloc+0xbe>
    113a:	f04a                	sd	s2,32(sp)
    113c:	e852                	sd	s4,16(sp)
    113e:	e456                	sd	s5,8(sp)
    1140:	e05a                	sd	s6,0(sp)
  if(nu < 4096)
    1142:	8a4e                	mv	s4,s3
    1144:	0009871b          	sext.w	a4,s3
    1148:	6685                	lui	a3,0x1
    114a:	00d77363          	bgeu	a4,a3,1150 <malloc+0x44>
    114e:	6a05                	lui	s4,0x1
    1150:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
    1154:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1158:	00001917          	auipc	s2,0x1
    115c:	eb890913          	addi	s2,s2,-328 # 2010 <freep>
  if(p == (char*)-1)
    1160:	5afd                	li	s5,-1
    1162:	a081                	j	11a2 <malloc+0x96>
    1164:	f04a                	sd	s2,32(sp)
    1166:	e852                	sd	s4,16(sp)
    1168:	e456                	sd	s5,8(sp)
    116a:	e05a                	sd	s6,0(sp)
    base.s.ptr = freep = prevp = &base;
    116c:	00001797          	auipc	a5,0x1
    1170:	f1c78793          	addi	a5,a5,-228 # 2088 <base>
    1174:	00001717          	auipc	a4,0x1
    1178:	e8f73e23          	sd	a5,-356(a4) # 2010 <freep>
    117c:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
    117e:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
    1182:	b7c1                	j	1142 <malloc+0x36>
        prevp->s.ptr = p->s.ptr;
    1184:	6398                	ld	a4,0(a5)
    1186:	e118                	sd	a4,0(a0)
    1188:	a8a9                	j	11e2 <malloc+0xd6>
  hp->s.size = nu;
    118a:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
    118e:	0541                	addi	a0,a0,16
    1190:	efbff0ef          	jal	108a <free>
  return freep;
    1194:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
    1198:	c12d                	beqz	a0,11fa <malloc+0xee>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    119a:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
    119c:	4798                	lw	a4,8(a5)
    119e:	02977263          	bgeu	a4,s1,11c2 <malloc+0xb6>
    if(p == freep)
    11a2:	00093703          	ld	a4,0(s2)
    11a6:	853e                	mv	a0,a5
    11a8:	fef719e3          	bne	a4,a5,119a <malloc+0x8e>
  p = sbrk(nu * sizeof(Header));
    11ac:	8552                	mv	a0,s4
    11ae:	b1bff0ef          	jal	cc8 <sbrk>
  if(p == (char*)-1)
    11b2:	fd551ce3          	bne	a0,s5,118a <malloc+0x7e>
        return 0;
    11b6:	4501                	li	a0,0
    11b8:	7902                	ld	s2,32(sp)
    11ba:	6a42                	ld	s4,16(sp)
    11bc:	6aa2                	ld	s5,8(sp)
    11be:	6b02                	ld	s6,0(sp)
    11c0:	a03d                	j	11ee <malloc+0xe2>
    11c2:	7902                	ld	s2,32(sp)
    11c4:	6a42                	ld	s4,16(sp)
    11c6:	6aa2                	ld	s5,8(sp)
    11c8:	6b02                	ld	s6,0(sp)
      if(p->s.size == nunits)
    11ca:	fae48de3          	beq	s1,a4,1184 <malloc+0x78>
        p->s.size -= nunits;
    11ce:	4137073b          	subw	a4,a4,s3
    11d2:	c798                	sw	a4,8(a5)
        p += p->s.size;
    11d4:	02071693          	slli	a3,a4,0x20
    11d8:	01c6d713          	srli	a4,a3,0x1c
    11dc:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
    11de:	0137a423          	sw	s3,8(a5)
      freep = prevp;
    11e2:	00001717          	auipc	a4,0x1
    11e6:	e2a73723          	sd	a0,-466(a4) # 2010 <freep>
      return (void*)(p + 1);
    11ea:	01078513          	addi	a0,a5,16
  }
}
    11ee:	70e2                	ld	ra,56(sp)
    11f0:	7442                	ld	s0,48(sp)
    11f2:	74a2                	ld	s1,40(sp)
    11f4:	69e2                	ld	s3,24(sp)
    11f6:	6121                	addi	sp,sp,64
    11f8:	8082                	ret
    11fa:	7902                	ld	s2,32(sp)
    11fc:	6a42                	ld	s4,16(sp)
    11fe:	6aa2                	ld	s5,8(sp)
    1200:	6b02                	ld	s6,0(sp)
    1202:	b7f5                	j	11ee <malloc+0xe2>
