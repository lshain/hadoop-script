#########################################################################
# File Name: hadoop_script.sh
# Author: lshain
# mail: 284779230@qq.com
# Created Time: 2014年09月26日 星期五 12时09分57秒
#########################################################################
#!/bin/bash

function hadoop_start( )
{
	echo "start-dfs..."
	source start-dfs.sh
	echo "start-tarn..."
	source start-yarn.sh
	
	echo "start-zkServer..."

	local SLAVES="hadoop-master hadoop-slave1 hadoop-slave2"

	for s in $SLAVES
	do
		ssh $s
		source zkServer.sh  start
		exit
	done

	echo "start-hbase..."
	source start-hbase.sh
}

function hadoop_stop( )
{
	echo "stop-hbase..."
	source stop-hbase.sh
	
	echo "stop-zkServer..."

	local SLAVES="hadoop-master hadoop-slave1 hadoop-slave2"

	for s in $SLAVES
	do
		ssh $s
		source zkServer.sh stop
		exit
	done

	echo "stop-yarn..."
	source stop-yarn.sh
	echo "stop-dfs..."
	source stop-dfs.sh"
}


