#!/bin/bash

awk -F"\t" '{
	if (NF == 2){
		cid = $1;
		num = $2;
		print num"\t"cid;
	}
}'
