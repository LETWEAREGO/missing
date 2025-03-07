#!/bin/bash

# 检查是否提供了目录参数
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

# 指定的目录
directory=$1

# 检查目录是否存在
if [ ! -d "$directory" ]; then
    echo "The specified directory does not exist."
    exit 1
fi

# 使用find命令递归查找所有文件，并使用ls -ltu命令按最后访问时间排序
# -l：长格式列表
# -t：按修改时间排序
# -u：按最后访问时间排序
# 最后使用head -n 1获取排序后的第一个文件，即最近使用的文件
find "$directory" -type f -exec ls -ltu {} + | head -n 1

