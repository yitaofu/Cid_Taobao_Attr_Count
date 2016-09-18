#!/bin/bash

HADOOP_BIN="/usr/local/webserver/hadoop/bin/hadoop"
STREAMING_JAR="/usr/local/webserver/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.6.0.jar"

DATE=`date +%F_%H:%M:%S`
AUTHOR="fuyitao"
CID_ID_COUNT_MODULE="cid_id_count"
ID_COUNT_MODULE="id_count"
ATTRVAL_MERGE_MODULE="attrval_merge"
ATTR_MERGE_MODULE="attr_merge"

mkdir cid_id_count_logs/${DATE}
CID_ID_COUNT_LOG_DIR="cid_id_count_logs/${DATE}"
mkdir id_count_logs/${DATE}
ID_COUNT_LOG_DIR="id_count_logs/${DATE}"
mkdir attrval_merge_logs/${DATE}
ATTRVAL_MERGE_LOG_DIR="attrval_merge_logs/${DATE}"
mkdir attr_merge_logs/${DATE}
ATTR_MERGE_LOG_DIR="attr_merge_logs/${DATE}"

##################################
#hadoop path
HHOME="/data/archive/app_oeudjgn5872a7c3aaa54_datamine/${AUTHOR}/"
CID_ID_COUNT_INPUT="/data/archive/app_oeudjgn5872a7c3aaa54_datamine/zhanghua/taobao_mine/2016-09-07/cid_id_attr_val/part-*"
ID_COUNT_INPUT="${HHOME}cid_id_count"
ATTRVAL_MERGE_INPUT="${HHOME}cid_id_count"
ATTR_MERGE_INPUT="${HHOME}attrval_merge"

#生成数据路径
CID_ID_COUNT_OUTPUT="${HHOME}cid_id_count"
ID_COUNT_OUTPUT="${HHOME}id_count"
ATTRVAL_MERGE_OUTPUT="${HHOME}attrval_merge"
ATTR_MERGE_OUTPUT="${HHOME}attr_merge"

# CID_ID_COUNT
#${HADOOP_BIN} fs -rm -r ${CID_ID_COUNT_OUTPUT}

#${HADOOP_BIN} jar ${STREAMING_JAR} \
#		-input ${CID_ID_COUNT_INPUT} \
#		-output ${CID_ID_COUNT_OUTPUT} \
#		-mapper cid_count_map.sh \
#		-reducer cid_count_red.sh \
#		-file cid_count_map.sh \
#		-file cid_count_red.sh \
#		-jobconf mapred.map.tasks=501 \
#		-jobconf mapred.reduce.tasks=901 \
#		-jobconf mapred.job.priority="NORMAL" \
#		-partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner \
#		-jobconf stream.num.map.output.key.fields=2 \
#		-jobconf num.key.fields.for.partition=1 \
#		-jobconf mapred.job.name="${CID_ID_COUNT_MODULE}_${AUTHOR}" \
#		1>${CID_ID_COUNT_LOG_DIR}/${CID_ID_COUNT_MODULE}.msg 2>${CID_ID_COUNT_LOG_DIR}/${CID_ID_COUNT_MODULE}.err

# ID_COUNT
#${HADOOP_BIN} fs -rm -r ${ID_COUNT_OUTPUT}

#${HADOOP_BIN} jar ${STREAMING_JAR} \
#		-input ${ID_COUNT_INPUT} \
#		-output ${ID_COUNT_OUTPUT} \
#		-mapper id_count_map.sh \
#		-reducer id_count_red.sh \
#		-file id_count_map.sh \
#		-file id_count_red.sh \
#		-jobconf mapred.map.tasks=301 \
#		-jobconf mapred.reduce.tasks=1 \
#		-jobconf mapred.job.priority="NORMAL" \
#		-partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner \
#		-jobconf num.key.fields.for.partition=1 \
#		-jobconf mapred.job.name="${ID_COUNT_MODULE}_${AUTHOR}" \
#		1>${ID_COUNT_LOG_DIR}/${ID_COUNT_MODULE}.msg 2>${ID_COUNT_LOG_DIR}/${ID_COUNT_MODULE}.err

# ATTRVAL_MERGE
#${HADOOP_BIN} fs -rm -r ${ATTRVAL_MERGE_OUTPUT}

#${HADOOP_BIN} jar ${STREAMING_JAR} \
#		-input ${ATTRVAL_MERGE_INPUT} \
#		-output ${ATTRVAL_MERGE_OUTPUT} \
#		-mapper attrval_merge_map.sh \
#		-reducer attrval_merge_red.sh \
#		-file attrval_merge_map.sh \
#		-file attrval_merge_red.sh \
#		-jobconf mapred.map.tasks=301 \
#		-jobconf mapred.reduce.tasks=901 \
#		-jobconf mapred.job.priority="NORMAL" \
#		-partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner \
#		-jobconf stream.num.map.output.key.fields=3 \
#		-jobconf num.key.fields.for.partition=1 \
#		-jobconf mapred.job.name="${ATTRVAL_MERGE_MODULE}_${AUTHOR}" \
#		1>${ATTRVAL_MERGE_LOG_DIR}/${ATTRVAL_MERGE_MODULE}.msg 2>${ATTRVAL_MERGE_LOG_DIR}/${ATTRVAL_MERGE_MODULE}.err

# ATTR_MERGE
${HADOOP_BIN} fs -rm -r ${ATTR_MERGE_OUTPUT}

${HADOOP_BIN} jar ${STREAMING_JAR} \
		-input ${ATTR_MERGE_INPUT} \
		-output ${ATTR_MERGE_OUTPUT} \
		-mapper attr_merge_map.sh \
		-reducer attr_merge_red.py \
		-file attr_merge_map.sh \
		-file attr_merge_red.py \
		-file guiyiResult \
		-jobconf mapred.map.tasks=301 \
		-jobconf mapred.reduce.tasks=901 \
		-jobconf mapred.job.priority="NORMAL" \
		-partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner \
		-jobconf stream.num.map.output.key.fields=3 \
		-jobconf num.key.fields.for.partition=1 \
		-jobconf mapred.job.name="${ATTR_MERGE_MODULE}_${AUTHOR}" \
		1>${ATTR_MERGE_LOG_DIR}/${ATTR_MERGE_MODULE}.msg 2>${ATTR_MERGE_LOG_DIR}/${ATTR_MERGE_MODULE}.err
