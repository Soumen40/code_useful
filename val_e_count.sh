#!/bin/bash


for j in 3d 4d 5d;
do
	cd $j
	for i in *;
	do
		cd $i
		
		grep 'PAW_PBE' POTCAR -A 1
		cd ../
	done
	cd ../
done


