#!/usr/bin/env nu

def main [setup: string] {
    if $setup == "auto" { use_auto } else if $setup == "dual" { use_dual } else if $setup == "hdmi" { use_hdmi } else if $setup == "internal" { use_internal }
}

def get_connected_monitor [name: string] {
    let result = (xrandr
        | lines
        | split column " "
        | get column1
        | find $name
        | first)
    return $result
}

def get_internal [] { return (get_connected_monitor "eDP") }

def get_hdmi [] { return (get_connected_monitor "HDMI") }

def use_auto [] {
    let hdmi = (get_hdmi)

    if ($hdmi | is-empty) { use_internal } else { use_dual }
}

def use_dual [] {
    let internal = (get_internal)
    let hdmi = (get_hdmi)

    (xrandr
        --output $hdmi
            --primary
            --mode 1920x1080
            --rate 144.0
            --pos 0x0
        --output $internal
            --mode 1920x1080
            --pos 1920x0
            --rate 144.0)
}

def use_internal [] {
    let internal = (get_internal)
    let hdmi = (get_hdmi)

    if ($hdmi | is-empty) {
        (xrandr
            --output $internal
                --primary
                --mode 1920x1080
                --rate 144.0)
    } else {
        (xrandr
            --output $internal
                --primary
                --mode 1920x1080
                --rate 144.0
            --output $hdmi
                --off)
    }
}

def use_hdmi [] {
    let internal = (get_internal)
    let hdmi = (get_hdmi)

    (xrandr
        --output $hdmi
            --primary
            --mode 1920x1080
            --rate 144.0
        --output $internal
            --off)
}
