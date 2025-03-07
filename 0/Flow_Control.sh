#!/bin/bash
count=0
#读取~/.bash_profile文件的内容并遍历每个单词
for i in $(cat ~/.bash_profile); do
	#增加计数器
	count=$((count +1))
	#输出每个单词及其字符数
	echo "word $count ($i) contains $(echo -n$i | wc -c) characters"
done

