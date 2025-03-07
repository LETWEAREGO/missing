home_space() {
    echo "<h2>Home directory space by user</h2>"
    echo "<pre>"
    format="%8s%10s%10s   %-s\n"
    printf "$format" "Dirs" "Files" "Blocks" "Directory"
    printf "$format" "----" "-----" "------" "---------"

    # 仅当用户ID为0（通常是root用户）时列出所有用户的家目录
    if [ "$(id -u)" -eq "0" ]; then
        dir_list="/home/*"
    else
        # 对于非root用户，只列出当前用户的家目录
        dir_list="$HOME"
    fi

    # 遍历目录列表
    for home_dir in $dir_list; do
        total_dirs=$(find "$home_dir" -type d | wc -l)
        total_files=$(find "$home_dir" -type f | wc -l)
        total_blocks=$(du -s "$home_dir" | cut -f1)
        printf "$format" "$total_dirs" "$total_files" "$total_blocks" "$home_dir"
    done
    echo "</pre>"
}

# 调用函数
home_space


