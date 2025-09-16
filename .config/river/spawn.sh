#!/bin/bash
# startup-apps.sh

# Set rules to assign tags to applications based on their app-id
riverctl rule-add -app-id "Firefox" tags 2   # Tag 2 for Firefox
riverctl rule-add -app-id "Code - OSS" tags 4  # Tag 3 for Code-OSS
riverctl rule-add -app-id "thunar" tags 8    # Tag 4 for Thunar
riverctl rule-add -app-id "spotify-qt" tags 16    # Tag 5 for spotify

# Spawn the applications
riverctl spawn foot
riverctl spawn firefox
riverctl spawn code-oss
riverctl spawn thunar
riverctl spawn spotify-qt

# Set the focused tag to 1 at the end
riverctl set-focused-tags 1
