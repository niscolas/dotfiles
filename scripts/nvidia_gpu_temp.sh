#!/usr/bin/env bash
nvidia-smi -q -d TEMPERATURE | rg "GPU Current Temp" | awk '{print $5}' | sed 's/$/ºC/'
