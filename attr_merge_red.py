#!/usr/bin/env python
#-*- coding:utf-8 -*-

import sys

fileReadMerge = open("guiyiResult")
cid_attrMergeDict = {}
for line in fileReadMerge.readlines():
	rec = line.strip().split("\t")
	if len(rec) != 3:
		continue
	cid = rec[0]
	attrResult = rec[1]
	attrList = rec[2]
	attrArry = attrList.split(" ")
	for i in range(len(attrArry)):
		attr = attrArry[i]
		cid_attr = cid + " " + attr
		cid_attrMergeDict[cid_attr] = attrResult
fileReadMerge.close()

for line in sys.stdin:
	rec = line.strip().split("\t")
	if len(rec) != 4:
		continue
	cid = rec[0]
	id = rec[1]
	attr = rec[2]
	val = rec[3]
	cid_attr = cid + " " + attr
	if cid_attr in cid_attrMergeDict:
		attr = cid_attrMergeDict[cid_attr]

	print ("%s\t%s\t%s\t%s" %(cid, id, attr, val))
	
