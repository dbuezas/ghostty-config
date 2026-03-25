#!/bin/bash
# Opens Ghostty with 3 tabs for constant-jerk-planner
# Usage: ~/.config/ghostty/startup.sh

osascript <<'EOF'
on typeCommand(cmd)
    tell application "System Events"
        tell process "Ghostty"
            set the clipboard to cmd
            keystroke "v" using command down
            delay 0.1
            key code 36 -- Enter
        end tell
    end tell
end typeCommand

tell application "Ghostty" to activate
delay 0.5

tell application "System Events"
    tell process "Ghostty"
        -- First tab (already open)
        my typeCommand("cd ~/code/constant-jerk-planner && claude --resume algorithms")

        -- Second split
        delay 0.3
        keystroke "d" using command down
        delay 0.3
        my typeCommand("cd ~/code/constant-jerk-planner && claude --resume benchmarks")

        -- Third split
        delay 0.3
        keystroke "d" using command down
        delay 0.3
        my typeCommand("cd ~/code/constant-jerk-planner && bun dev")

        -- Go back to first split
        delay 0.3
        keystroke "[" using command down
        keystroke "[" using command down
    end tell
end tell
EOF
