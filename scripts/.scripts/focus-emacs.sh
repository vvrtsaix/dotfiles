#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Focus Emacs
# @raycast.mode silent
# @raycast.icon 📝

# 1. Force macOS to pull the Emacs application to the front
open -a Emacs

# 2. Tell Emacs to focus and raise its frame internally
# (We redirect output to /dev/null to swallow that "nil" message)
/opt/homebrew/bin/emacsclient -a "" -n -e "(progn (select-frame-set-input-focus (selected-frame)) (raise-frame))" >/dev/null 2>&1
