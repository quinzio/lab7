#!/bin/bash

let cnt=0
unset zpid
while [ 0 ]
do 
	sleep 2
	let cnt=0
	unset newzpid
	echo 
	echo begin 
	echo scan ps
	for pid in `ps -el | awk '$2 ~ /Z/ {print $4}'`
	do
		newzpid[$cnt]=$pid	
		echo -newzpid- $pid
	done
	#continue	
	for pid1 in $newzpid
	do
		echo -pid- $pid1 
		let zpid[$pid1]=${zpid[$pid1]}+1
		let cnt=$cnt+1
	done
	for i in ${!zpid[@]}
	do
		echo index $i value ${zpid[$i]}
	done
	#continue
	for _zpid in ${!zpid[@]}
	do
		let found=0
		for _newzpid in $newzpid
		do
			if [[ _zpid -eq _newzpid ]]
			then 
				let found=1
				echo -found-
			fi
		done	
		echo found? $found
		if [ $found -eq 0 ]
		then 
			echo unsetting $zpid[$_zpid]
			unset zpid[$_zpid]
		fi
	done

done


