#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar
# Bar is the name set in the polybar config, so if you change it, you have to change it here too.
if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload toph &
    done
else
    polybar --reload toph &
fi

echo "Bars launched..."
