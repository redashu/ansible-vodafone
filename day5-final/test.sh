#!/bin/bash
for i in `seq 20`
do
	echo "hello $i" >>/tmp/data.txt
	sleep 0.3
done
