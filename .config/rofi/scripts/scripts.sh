
#!/bin/bash

if [ $@ == "picom-kill" ]; then
    pkill picom
    exit 0
elif [[ $@ == "picom-start" ]]; then
    picom --experimental-backends -b
    exit 0
fi

echo "picom-kill"
echo "picom-start"
