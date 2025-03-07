#!/bin/bash

# 遍历所有传递给脚本的参数
for filename in "$@"; do
    result=""
    
    # 检查是否是普通文件
    if [ -f "$filename" ]; then
        result="$filename is a regular file"
    
    # 检查是否是目录
    elif [ -d "$filename" ]; then
        result="$filename is a directory"
    fi
    
    # 检查文件或目录是否可写
    if [ -w "$filename" ]; then
        result="$result and it is writable"
    else
        result="$result and it is not writable"
    fi
    
    # 打印结果
    echo "$result"
done

