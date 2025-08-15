#!/bin/bash

# Script to set Caps Lock as Escape based on desktop environment
# Works on both X11 and Wayland

set_caps_to_escape() {
    local method="$1"
    local command="$2"
    
    echo "Detected: $method"
    echo "Executing: $command"
    
    if eval "$command"; then
        echo "✓ Successfully set Caps Lock to Escape"
        return 0
    else
        echo "✗ Failed to set Caps Lock to Escape"
        return 1
    fi
}

# Function to detect desktop environment
detect_desktop_environment() {
    # Check if we're in Wayland or X11
    if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
        echo "Running on Wayland"
    elif [ "$XDG_SESSION_TYPE" = "x11" ]; then
        echo "Running on X11"
    else
        echo "Unknown session type: $XDG_SESSION_TYPE"
    fi
    
    echo "Desktop Environment Detection:"
    echo "XDG_CURRENT_DESKTOP: $XDG_CURRENT_DESKTOP"
    echo "DESKTOP_SESSION: $DESKTOP_SESSION"
    echo "WAYLAND_DISPLAY: $WAYLAND_DISPLAY"
    echo "DISPLAY: $DISPLAY"
    echo ""
}

# Main logic
main() {
    detect_desktop_environment
    
    # Try methods in order of preference/reliability
    case "$XDG_CURRENT_DESKTOP" in
        *GNOME*)
            set_caps_to_escape "GNOME (gsettings)" \
                "gsettings set org.gnome.desktop.input-sources xkb-options \"['caps:escape']\""
            ;;
        *KDE*|*Plasma*)
            if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
                set_caps_to_escape "KDE Plasma (Wayland)" \
                    "kwriteconfig5 --file kxkbrc --group Layout --key Options 'caps:escape' && qdbus org.kde.keyboard /Layouts setLayout 0"
            else
                set_caps_to_escape "KDE Plasma (X11)" \
                    "setxkbmap -option caps:escape"
            fi
            ;;
        *XFCE*|*Xfce*)
            set_caps_to_escape "XFCE" \
                "setxkbmap -option caps:escape"
            ;;
        *MATE*)
            set_caps_to_escape "MATE" \
                "gsettings set org.mate.peripherals-keyboard-xkb.kbd xkb-options \"['caps\tcaps:escape']\""
            ;;
        *Cinnamon*)
            set_caps_to_escape "Cinnamon" \
                "gsettings set org.gnome.desktop.input-sources xkb-options \"['caps:escape']\""
            ;;
        *LXQt*)
            set_caps_to_escape "LXQt" \
                "setxkbmap -option caps:escape"
            ;;
        sway|*sway*)
            set_caps_to_escape "Sway" \
                "swaymsg 'input \"type:keyboard\" xkb_options caps:escape'"
            ;;
        Hyprland|*hyprland*)
            set_caps_to_escape "Hyprland" \
                "hyprctl keyword input:kb_options caps:escape"
            ;;
        river)
            set_caps_to_escape "River" \
                "riverctl keyboard-layout -options caps:escape us"
            ;;
        *)
            echo "Unknown or unsupported desktop environment: $XDG_CURRENT_DESKTOP"
            echo ""
            echo "Trying fallback methods..."
            
            # Fallback methods
            if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
                echo "Trying generic Wayland method..."
                if command -v gsettings >/dev/null 2>&1; then
                    set_caps_to_escape "Generic Wayland (gsettings fallback)" \
                        "gsettings set org.gnome.desktop.input-sources xkb-options \"['caps:escape']\""
                else
                    echo "No suitable Wayland method found for unknown desktop environment"
                    echo "You may need to configure this manually in your compositor's settings"
                    exit 1
                fi
            else
                # X11 fallback
                set_caps_to_escape "X11 (setxkbmap)" \
                    "setxkbmap -option caps:escape"
            fi
            ;;
    esac
}

# Help function
show_help() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Set Caps Lock key to act as Escape key based on current desktop environment"
    echo ""
    echo "OPTIONS:"
    echo "  -h, --help     Show this help message"
    echo "  -d, --detect   Only detect and show desktop environment info"
    echo "  -r, --reset    Reset Caps Lock to default behavior"
    echo ""
    echo "Supported environments:"
    echo "  - GNOME (Wayland/X11)"
    echo "  - KDE Plasma (Wayland/X11)"
    echo "  - XFCE, MATE, Cinnamon, LXQt (X11)"
    echo "  - Sway, Hyprland, River (Wayland)"
    echo ""
}

# Reset function
reset_caps_lock() {
    echo "Resetting Caps Lock to default behavior..."
    
    case "$XDG_CURRENT_DESKTOP" in
        *GNOME*|*Cinnamon*)
            gsettings reset org.gnome.desktop.input-sources xkb-options
            ;;
        *KDE*|*Plasma*)
            if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
                kwriteconfig5 --file kxkbrc --group Layout --key Options ""
            else
                setxkbmap -option
            fi
            ;;
        *MATE*)
            gsettings reset org.mate.peripherals-keyboard-xkb.kbd xkb-options
            ;;
        sway|*sway*)
            swaymsg 'input "type:keyboard" xkb_options ""'
            ;;
        Hyprland|*hyprland*)
            hyprctl keyword input:kb_options ""
            ;;
        *)
            if [ "$XDG_SESSION_TYPE" != "wayland" ]; then
                setxkbmap -option
            else
                echo "Reset method not implemented for this desktop environment"
                exit 1
            fi
            ;;
    esac
    
    echo "✓ Caps Lock reset to default"
}

# Parse command line arguments
case "$1" in
    -h|--help)
        show_help
        exit 0
        ;;
    -d|--detect)
        detect_desktop_environment
        exit 0
        ;;
    -r|--reset)
        reset_caps_lock
        exit 0
        ;;
    "")
        main
        ;;
    *)
        echo "Unknown option: $1"
        show_help
        exit 1
        ;;
esac