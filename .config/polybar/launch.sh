#!/usr/bin/env bash
killall -q polybar


# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch main screen bar
CPID=$(pgrep -x polybar)

if [ -n "${CPID}" ] ; then
  kill -TERM ${CPID}
fi

# add window titles
# using bspc query here to get monitors in the same order bspwm sees them
#for m in $( bspc query -M --names ); do
#    index=$((index + 1))
#    export P_BSPWM_WINDOW_CMD="tail ${HOME}/.cache/bspwm_windows_${index}.txt"
#
#    MONITOR=$m polybar --reload example &
#done

#echo "---" | tee -a /tmp/wacom-polybar.log

# Launch wacom screen bar
#polybar -r wacom >> /tmp/wacom-polybar.log 2>&1 &

polybar -reload left >> /tmp/polybar.log 2>&1 &
polybar -reload right >> /tmp/polybar.log 2>&1 &

echo "---" | tee -a /tmp/polybar.log
