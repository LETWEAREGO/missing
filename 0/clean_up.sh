#!/bin/bash

# Program to print a text file with headers and footers

TEMP_FILE=/tmp/printfile.txt

# 使用 'pr' 命令处理文件并重定向到临时文件
pr "$1" > "$TEMP_FILE"

# 询问用户是否想要打印文件
read -p "Print file? [y/n]: " REPLY

# 如果用户回答 'y'，则打印文件
if [ "$REPLY" = "y" ]; then
  lpr "$TEMP_FILE"
fi

# 删除临时文件
rm "$TEMP_FILE"

