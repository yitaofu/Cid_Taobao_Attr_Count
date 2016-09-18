#!/bin/bash

awk -F"\t" '{
	if (NF == 3){
		judge = 0;
		len = split($0, rec, "\t");
		tempNum = rec[3];
		num += tempNum;
	}else if (NF == 4){
		cid = $1;
		if (judge == 0){
			judge = 1;
			print cid"\t"num;
			num = 0;
		}
		print $0;
	}
}'
