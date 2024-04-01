#!/bin/bash
# Complete POSCAR file (adding T and F, in respective positions)
sed -n 1,7p POSCAR>POSCAR_new
echo Selective Dynamics>>POSCAR_new
echo Cartesian>>POSCAR_new
#sed -n 8p POSCAR | awk '{print $1}'
T=`wc -l POSCAR | awk '{print $1}'`
for j in `seq 9 $T`;
do
	b=`sed -n "$j"p POSCAR | awk '{printf "%15.9f %15.9f %15.9f",   $1,  $2,    $3}'`
	n=`sed -n "$j"p POSCAR | awk '{print $3}'`
	k=20.003
	a=`sed -n "$j"p POSCAR`
	if [ 1 -eq "$(echo "${n} < ${k}" | bc)" ]                                  #if [[ $n -lt $k ]];
	then
		f=F
		echo $b $f $f $f >>POSCAR_new
	else 
		t=T
		echo $b $t $t $t >>POSCAR_new
	fi 
done
#mv POSCAR POSCAR_old
mv POSCAR_new POSCAR
