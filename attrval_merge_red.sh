#!/bin/bash

awk -F"\t" '{
	if (NF == 4){
		cid = $1;
		id = $2;
		attr = $3;
		val = $4;

		if (NR == 1){
			total_cid = cid;
			total_id = id;
			total_attr = attr;
			total_val = val;
		}

		if (cid != total_cid || id != total_id || attr != total_attr){
			print total_cid"\t"total_id"\t"total_attr"\t"total_val;
			total_cid = cid;
			total_id = id;
			total_attr = attr;
			total_val = val;
		}else{
			if (NR != 1){
				total_val = total_val"|"val;
			}
		}
	}
}END{
	print total_cid"\t"total_id"\t"total_attr"\t"total_val;
}'
