#!/bin/bash

# tclock - Display a clock in a terminal

# Define colors
BG_BLUE=$(tput setab 4)
FG_BLACK=$(tput setaf 0)
FG_WHITE=$(tput setaf 7)

# Function to get terminal size
terminal_size() {
  terminal_cols=$(tput cols)
  terminal_rows=$(tput lines)
}

# Function to calculate banner size
banner_size() {
  local banner_cols=0
  local banner_rows=0
  while read -r line; do
    [[ ${#line} -gt $banner_cols ]] && banner_cols=${#line}
    ((++banner_rows))
  done < <(echo "12:34 PM" | banner -w $(tput cols))
}

# Function to display the clock
display_clock() {
  local row=$clock_row
  while read -r line; do
    tput cup $row$clock_col
    echo -n "$line"
    ((++row))
  done < <(date +'%I:%M %p' | banner -w $(tput cols))
}

# Trap to restore terminal on Ctrl-C
trap 'tput sgr0; tput cnorm; tput rmcup; exit 0' SIGINT

# Save screen contents and make cursor invisible
tput smcup
tput civis

# Main loop
while true; do
  # Calculate sizes and positions
  terminal_size
  banner_size
  clock_row=$(((terminal_rows - banner_rows) / 2))
  clock_col=$(((terminal_cols - banner_cols) / 2))

  # Clear the screen or paint it with spaces if 'bce' is not supported
  if tput bce; then
    clear
  else
    tput home
    printf "%${terminal_cols}s" " "
  fi

  # Display the clock
  display_clock

  # Draw a progress bar
  current_second=$(date +%S)
  progress_col=$((clock_col + banner_cols + 2))
  tput cup $((clock_row + banner_rows + 1))$progress_col
  echo -n ${FG_BLACK}
  printf '=%.0s' $(seq 1$current_second)
  echo -n ${FG_WHITE}
  printf '=%.0s' $(seq$((current_second + 1)) 60)

  # Wait for a second
  sleep 1
done

