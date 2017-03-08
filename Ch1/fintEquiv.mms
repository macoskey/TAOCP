Main   SETH  $0,#4330 % SETH = 'set to high wyde' - $0=2^52
       SET   $1,$Z    % $1=$Z
       ANDNH $1,#8000 % %1=abs($Z)
       ANDN  $2,$Z,$1 % ANDN = 'bitwise and-not' - $2=signbit($Z)
       FUN   $3,$Z,$Z % FUN = 'floating unordered' - $3=[$Z is a NaN]
       BNZ   $3,1F    % BNZ = 'branch if nonzero' - skip ahead if $Z is a NaN
       FCMP  $3,$1,$0 % FCMP = 'floating compare' - %3=[abs($Z)>2^52]-[abs($Z)<2^52]
       CSNN  $0,$3,$0 % CSNN = 'cond. set if nonneg.' - set $0=0 if $3>=0
       OR    $0,$2,$0 % attach sign of $Z to $0
1H     FADD  $1,$Z,$0 % FADD = 'floating add' - $1=$Z+$0
       FSUB  $1,$1,$0 % FSUB = 'floatin subtract' - $X=$1-$0
       OR    $X,$1,$2 % make sure minus zero isn't lost

