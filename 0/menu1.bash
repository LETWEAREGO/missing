#!/bin/bash

press_enter() {
    echo -en "\nPress Enter to continue"
    read
    clear
}

while true; do
    echo "
    PROGRAM MENU
    1 - display free disk space
    2 - display free memory

    0 - exit program
"
    read -n 1 -p "Enter selection: " selection
    echo ""  # 打印一个新行，因为 -n 选项在 read 命令中防止了新行的打印

    case "$selection" in
        1 ) df
            press_enter
            ;;
        2 ) free
            press_enter
            ;;
        0 ) break  # 使用 break 退出循环
            ;;
        * ) echo "Please enter 1, 2, or 0"
            press_enter
            ;;
    esac
done

