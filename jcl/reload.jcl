//HERC01R  JOB (SYS),IEBCOPY,CLASS=A,MSGCLASS=H,MSGLEVEL=(1,1),         00010000
//   USER=HERC01,PASSWORD=CUL8TR
//********************************************************************* 00020000
//* THIS JOB RELOADS THE THREE PARTITIONED DATASETS CONTAINING THE    * 00030000
//* SOURCE, OBJECT, AND LOAD MODULES REQUIRED FOR THE XPL COMPILER.   * 00040000
//* THEY WERE UNLOADED FROM A 3350 VOLUME.  THE ATTRIBUTES FOR THE    * 00050000
//* OBJECT LIBRARY MUST NOT BE CHANGED FROM RECFM=F,LRECL=7200,       * 00060000
//* BLKSIZE=7200 OR THE COMPILER WILL NOT FUNCTION.  CHANGE THE TVOL= * 00070000
//* AND THLQ= PARAMETERS BELOW TO ALTER THE DESTINATION VOLUME TO A   * 00080000
//* 3350 VOLUME THAT EXISTS ON YOUR SYSTEM AND TO SPECIFY A HIGH      * 00090000
//* LEVEL QUALIFIER FOR THE DATASET NAMES THAT WILL FIT YOUR CATALOG  * 00100000
//* ENVIRONMENT.                                                      * 00110000
//********************************************************************* 00120000
//RESTORE  PROC TVOL='PUB001',THLQ='SYSC'                               00130000
//RESTORES EXEC PGM=IEBCOPY,REGION=1024K                                00140000
//SYSPRINT DD  SYSOUT=*                                                 00150000
//LIBIN1   DD  UNIT=TAPE,VOL=(,RETAIN,SER=XPLXPL),LABEL=(1,SL),         00160000
//             DSN=XPL.SOURCE                                           00170000
//LIBOUT1  DD  UNIT=SYSDA,DSN=&THLQ..XPL.SOURCE,                        00180000
//             VOL=SER=&TVOL.,DISP=(,CATLG,KEEP),                       00190000
//             SPACE=(TRK,(60,,2),RLSE)                                 00200000
//SYSUT3   DD  UNIT=SYSDA,SPACE=(80,(60,45)),DISP=(NEW,DELETE)          00210000
//RESTOREO EXEC PGM=IEBCOPY,REGION=1024K                                00220000
//SYSPRINT DD  SYSOUT=*                                                 00230000
//LIBIN1   DD  UNIT=TAPE,VOL=(,RETAIN,SER=XPLXPL),LABEL=(2,SL),         00240000
//             DSN=XPL.OBJECT                                           00250000
//LIBOUT1  DD  UNIT=SYSDA,DSN=&THLQ..XPL.OBJECT,                        00260000
//             VOL=SER=&TVOL.,DISP=(,CATLG,KEEP),                       00270000
//             SPACE=(TRK,(20,,1),RLSE)                                 00280000
//SYSUT3   DD  UNIT=SYSDA,SPACE=(80,(60,45)),DISP=(NEW,DELETE)          00290000
//RESTOREL EXEC PGM=IEBCOPY,REGION=1024K                                00300000
//SYSPRINT DD  SYSOUT=*                                                 00310000
//LIBIN1   DD  UNIT=TAPE,VOL=(,RETAIN,SER=XPLXPL),LABEL=(3,SL),         00320000
//             DSN=XPL.LOAD                                             00330000
//LIBOUT1  DD  UNIT=SYSDA,DSN=&THLQ..XPL.LOAD,                          00340000
//             VOL=SER=&TVOL.,DISP=(,CATLG,KEEP),                       00350000
//             SPACE=(TRK,(5,,1),RLSE)                                  00360000
//SYSUT3   DD  UNIT=SYSDA,SPACE=(80,(60,45)),DISP=(NEW,DELETE)          00370000
//         PEND                                                         00380000
// EXEC RESTORE                                                         00390000
//RESTORES.SYSIN    DD  *                                               00400000
  COPY INDD=LIBIN1,OUTDD=LIBOUT1                                        00410000
//RESTOREO.SYSIN    DD  *                                               00420000
  COPY INDD=LIBIN1,OUTDD=LIBOUT1                                        00430000
//RESTOREL.SYSIN    DD  *                                               00440000
  COPY INDD=LIBIN1,OUTDD=LIBOUT1                                        00450000
//                                                                      00460000
