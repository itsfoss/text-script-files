#!/usr/bin/env sh

# Terminate already running Polyabr instances
killall -q polybar

# Wait until the process have been shut down
while pgrep -x polybar > /dev/null; do sleep 1; done

# Launch Polybar
polybar &
