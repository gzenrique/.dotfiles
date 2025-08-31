#!/usr/bin/env osascript

# Set default browser to Brave
# See https://github.com/kerma/defaultbrowser/issues/25
do shell script "defaultbrowser browser"
try
  delay 2
  tell application "System Events"
    tell application process "CoreServicesUIAgent"
      repeat until window 1 exists
        delay 0.2
      end repeat
      tell window 1
        tell (first button whose name starts with "use")
          perform action "AXPress"
	end tell
      end tell
    end tell
  end tell
end try
