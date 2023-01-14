#!/bin/bash

# https://askubuntu.com/a/620114/1404034
turbo_active=$( cat /sys/devices/system/cpu/intel_pstate/no_turbo )

if [ $turbo_active == 0 ]; then
    echo "enabled"
else
    echo "disabled"
fi
