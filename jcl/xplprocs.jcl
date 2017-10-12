//HERC01S JOB (SYS),'XPL PROCS',CLASS=A,MSGCLASS=H,                     00010000
// MSGLEVEL=(1,1),USER=HERC01,PASSWORD=CUL8TR
//*                                                                     00020000
//*  Change all (hlq) to match the high level qualifier used            00030000
//*  when XPL Partitioned Datasets were reloaded to your system.        00040000
//*                                                                     00050000
//IEBUPDTE EXEC PGM=IEBUPDTE,REGION=1024K,PARM=NEW                      00060000
//SYSUT2   DD  DISP=SHR,DSN=SYS2.PROCLIB                                00070000
//SYSPRINT DD  SYSOUT=*                                                 00080000
//SYSIN DD DATA,DLM='%%'                                                00090000
./ ADD NAME=XPLC                                                        00100000
//*                                                                     00110000
//*    XPLC      COMPILE AN XPL PROGRAM                                 00120000
//*                                                                     00130000
//XPL    EXEC  PGM=XPLSM,REGION=512K                                    00140000
//STEPLIB DD   DISP=SHR,DSN=SYSC.XPL.LOAD                               00150000
//PROGRAM DD   DISP=SHR,DSN=SYSC.XPL.OBJECT(XCOM)                       00160000
//FILE1  DD    UNIT=SYSDA,SPACE=(TRK,(15,15))                           00170000
//FILE2  DD    UNIT=SYSDA,SPACE=(TRK,(15,15))                           00180000
//FILE3  DD    UNIT=SYSDA,SPACE=(TRK,(15,15))                           00190000
//INPUT2 DD    DISP=SHR,DSN=SYSC.XPL.SOURCE(XPLLIBR)                    00200000
//SYSPRINT DD  SYSOUT=*                                                 00210000
//SYSUDUMP DD  SYSOUT=*                                                 00220000
./ ADD NAME=XPLCG                                                       00230000
//*                                                                     00240000
//*    XPLCG     COMPILE AND EXECUTE AN XPL PROGRAM                     00250000
//*                                                                     00260000
//XPL    EXEC  PGM=XPLSM,REGION=512K                                    00270000
//STEPLIB DD   DISP=SHR,DSN=SYSC.XPL.LOAD                               00280000
//PROGRAM DD   DISP=SHR,DSN=SYSC.XPL.OBJECT(XCOM)                       00290000
//FILE1  DD    UNIT=SYSDA,SPACE=(TRK,(15,15)),DISP=(,PASS)              00300000
//FILE2  DD    UNIT=SYSDA,SPACE=(TRK,(15,15))                           00310000
//FILE3  DD    UNIT=SYSDA,SPACE=(TRK,(15,15))                           00320000
//INPUT2 DD    DISP=SHR,DSN=SYSC.XPL.SOURCE(XPLLIBR)                    00330000
//SYSPRINT DD  SYSOUT=*                                                 00340000
//SYSUDUMP DD  SYSOUT=*                                                 00350000
//GO     EXEC  PGM=XPLSM,COND=(0,NE)                                    00360000
//STEPLIB DD   DISP=SHR,DSN=SYSC.XPL.LOAD                               00370000
//PROGRAM DD   DISP=OLD,DSN=*.XPL.FILE1                                 00380000
//FILE1  DD    UNIT=SYSDA,SPACE=(TRK,(15,15))                           00390000
//FILE2  DD    UNIT=SYSDA,SPACE=(TRK,(15,15))                           00400000
//FILE3  DD    UNIT=SYSDA,SPACE=(TRK,(15,15))                           00410000
//SYSPRINT DD  SYSOUT=*                                                 00420000
//SYSPUNCH DD  SYSOUT=B                                                 00430000
//SYSUDUMP DD  SYSOUT=*                                                 00440000
./ ADD NAME=XPLG                                                        00450000
//*                                                                     00460000
//*    XPLG      EXECUTE A PREVIOUSLY COMPILED XPL PROGRAM              00470000
//*                                                                     00480000
//GO     EXEC  PGM=XPLSM                                                00490000
//STEPLIB DD   DISP=SHR,DSN=SYSC.XPL.LOAD                               00500000
//FILE1  DD    UNIT=SYSDA,SPACE=(TRK,(15,15))                           00510000
//FILE2  DD    UNIT=SYSDA,SPACE=(TRK,(15,15))                           00520000
//FILE3  DD    UNIT=SYSDA,SPACE=(TRK,(15,15))                           00530000
//SYSPRINT DD  SYSOUT=*                                                 00540000
//SYSPUNCH DD  UNIT=SYSCP                                               00550000
//SYSUDUMP DD  SYSOUT=*                                                 00560000
./ ADD NAME=XPLA                                                        00570000
//*                                                                     00580000
//*    ANALYZE   EXECUTE THE SYNTAX ANALYSIS PROGRAM                    00590000
//*                                                                     00600000
 //ANALYZE EXEC PGM=XPLSM                                               00610000
//STEPLIB DD   DISP=SHR,DSN=SYSC.XPL.LOAD                               00620000
//PROGRAM DD   DISP=SHR,DSN=SYSC.XPL.OBJECT(ANALYZER)                   00630000
//SYSPRINT DD  SYSOUT=*                                                 00640000
//SYSPUNCH DD  UNIT=SYSCP                                               00650000
//SYSUDUMP DD  SYSOUT=*                                                 00660000
./ ENDUP                                                                00670000
%%                                                                      00680000
//                                                                      00690000
