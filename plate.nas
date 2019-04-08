INIT MASTER(S)
NASTRAN OP2NEW=0,SYSTEM(319)=1
ID plate,Femap
SOL SESTATIC
CEND
  TITLE = static_test
  ECHO = NONE
  DISPLACEMENT(PUNCH) = ALL
  SPCFORCE(PUNCH) = ALL
  OLOAD(PUNCH) = ALL
  FORCE(PUNCH,CORNER) = ALL
  STRESS(PUNCH,CORNER) = ALL
  SPC = 1
  LOAD = 1
BEGIN BULK
$ ***************************************************************************
$   Written by : Femap
$   Version    : 11.4.2
$   Translator : MSC/MD Nastran
$   From Model : C:\Users\fschwa02\Desktop\SOL_101\plate.modfem
$   Date       : Thu Apr 04 08:02:32 2019
$   Output To  : C:\Users\fschwa02\Desktop\SOL_101\
$ ***************************************************************************
$
PARAM,PRGPST,YES
PARAM,POST,-1
PARAM,OGEOM,NO
PARAM,AUTOSPC,YES
PARAM,GRDPNT,0
CORD2C         1       0      0.      0.      0.      0.      0.      1.+FEMAPC1
+FEMAPC1      1.      0.      1.        
CORD2S         2       0      0.      0.      0.      0.      0.      1.+FEMAPC2
+FEMAPC2      1.      0.      1.        
$ Femap Load Set 1 : test
FORCE          1       2       0      1.      0.      0.   -100.
FORCE          1       4       0      1.      0.      0.   -100.
FORCE          1      14       0      1.      0.      0.   -100.
FORCE          1      19       0      1.      0.      0.   -100.
FORCE          1      24       0      1.      0.      0.   -100.
$ Femap Constraint Set 1 : Fixed
SPC1           1  123456       1
SPC1           1  123456       3
SPC1           1  123456      10
SPC1           1  123456      15
SPC1           1  123456      20
$ Femap Property 1 : plate
PSHELL         1       1     .25       1               1              0.
$ Femap Material 1 : A286 Alloy Steel-Solution Treated and Aged,   Min Properties
MAT1           1  2.91+7             .31    .287    9.-6     70.        +       
+        130000.  85000.  85000.
MAT4           11.6667-442.46979    .287                        
GRID           1       0      0.      0.      0.       0
GRID           2       0      1.      0.      0.       0
GRID           3       0      0.      1.      0.       0
GRID           4       0      1.      1.      0.       0
GRID           5       0      0.      0.      0.       0
GRID           6       0     .25      0.      0.       0
GRID           7       0      .5      0.      0.       0
GRID           8       0     .75      0.      0.       0
GRID           9       0      1.      0.      0.       0
GRID          10       0      0.     .25      0.       0
GRID          11       0     .25     .25      0.       0
GRID          12       0      .5     .25      0.       0
GRID          13       0     .75     .25      0.       0
GRID          14       0      1.     .25      0.       0
GRID          15       0      0.      .5      0.       0
GRID          16       0     .25      .5      0.       0
GRID          17       0      .5      .5      0.       0
GRID          18       0     .75      .5      0.       0
GRID          19       0      1.      .5      0.       0
GRID          20       0      0.     .75      0.       0
GRID          21       0     .25     .75      0.       0
GRID          22       0      .5     .75      0.       0
GRID          23       0     .75     .75      0.       0
GRID          24       0      1.     .75      0.       0
GRID          25       0      0.      1.      0.       0
GRID          26       0     .25      1.      0.       0
GRID          27       0      .5      1.      0.       0
GRID          28       0     .75      1.      0.       0
GRID          29       0      1.      1.      0.       0
CQUADR         1       1       5       6      11      10                
CQUADR         2       1       6       7      12      11                
CQUADR         3       1       7       8      13      12                
CQUADR         4       1       8       9      14      13                
CQUADR         5       1      10      11      16      15                
CQUADR         6       1      11      12      17      16                
CQUADR         7       1      12      13      18      17                
CQUADR         8       1      13      14      19      18                
CQUADR         9       1      15      16      21      20                
CQUADR        10       1      16      17      22      21                
CQUADR        11       1      17      18      23      22                
CQUADR        12       1      18      19      24      23                
CQUADR        13       1      20      21      26      25                
CQUADR        14       1      21      22      27      26                
CQUADR        15       1      22      23      28      27                
CQUADR        16       1      23      24      29      28                
ENDDATA
