system_info() {
    # Find any release files in /etc and display their first line
    echo "<h2>System release info</h2>"
    echo "<pre>"
    for i in /etc/*release; do
        # Check if the file exists
        if [ -f "$i" ]; then
            # Since we can't be sure of the length of the file, only display the first line.
            head -n 1 "$i"
        fi
    done
    # Display kernel information
    uname -orp
    echo "</pre>"
}

# Call the function to display system information
system_info

