#!/bin/bash

awk -F"\t" '{
	num = $1;
	cid = $2;
	print cid"\t"num;
}'
