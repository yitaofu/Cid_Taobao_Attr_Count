#!/bin/bash

awk -F"\t" '{
	if (NF != 4){
		continue;
	}

	cid = $1;
	id = $2;
	cid_id = cid" "id;
	if (cid_id in cid_idcount){
		cid_idcount[cid_id] += 1;
	}else{
		cid_idcount[cid_id] = 1;
		cid_count[cid] += 1;
	}
	print $0;
}END{
	for (cid in cid_count){
		print cid"\t*\t"cid_count[cid];
	}
}'
