# Hyprland Configuration

A comprehensive Hyprland setup optimized for ultrawide displays (5120x1440) with Gruvbox Dark theming.

## Features

- **Ultrawide optimized**: Configured for 5120x1440 displays
- **Gruvbox Dark theme**: Consistent theming across all components
- **Gaming ready**: VRR support, tearing allowance, optimized for games
- **Productivity focused**: Smart workspace management, window rules
- **Complete ecosystem**: Waybar, Rofi, Dunst all themed consistently

## Components

### Core Configuration
- `hyprland.conf` - Main Hyprland configuration
- `hyprpaper.conf` - Wallpaper management

### Application Launchers & Menus
- **Rofi** - Application launcher with gruvbox theme
- Custom gruvbox-dark theme for rofi

### Status Bar
- **Waybar** - Feature-rich status bar
- Gruvbox themed with system information
- Workspaces, window info, system stats

### Notifications
- **Dunst** - Lightweight notification daemon
- Gruvbox colors with app-specific rules

## Installation

1. **Install dependencies**:
   ```bash
   # Arch Linux
   sudo pacman -S hyprland waybar rofi dunst hyprpaper grim slurp wl-clipboard cliphist swaylock alacritty

   # Ubuntu/Debian (may need to add repositories)
   sudo apt install hyprland waybar rofi dunst grim slurp wl-clipboard
   ```

2. **Deploy configuration**:
   ```bash
   cd ~/dotfiles
   stow hyprland
   ```

3. **Set up wallpapers**:
   ```bash
   ./scripts/setup-wallpapers.sh
   ```

## Key Bindings

### Application Shortcuts
- `Super + Return` - Terminal (Alacritty)
- `Super + D` - Application launcher (Rofi)
- `Super + B` - Browser
- `Super + E` - File manager

### Window Management
- `Super + Q` - Close window
- `Super + V` - Toggle floating
- `Super + F` - Fullscreen
- `Super + H/J/K/L` - Move focus (vim-like)
- `Super + Shift + H/J/K/L` - Move window
- `Super + Ctrl + H/J/K/L` - Resize window

### Ultrawide Specific
- `Super + Alt + 1` - Resize to 1/3 width (1707px)
- `Super + Alt + 2` - Resize to 1/2 width (2560px)  
- `Super + Alt + 3` - Resize to 2/3 width (3413px)

### Workspaces
- `Super + 1-10` - Switch workspace
- `Super + Shift + 1-10` - Move window to workspace
- `Super + Ctrl + Shift + 1-5` - Move window and follow

### System
- `Super + X` - Lock screen
- `Super + Shift + X` - Power menu
- `Print` - Screenshot selection
- `Super + C` - Clipboard history

## Workspace Layout

Optimized for productivity with automatic application placement:

1. **Terminal** - Development workspace
2. **Browser** - Web browsing, research
3. **Code** - VS Code, development tools
4. **Files** - File management
5. **Communication** - Discord, Slack
6. **Media** - Spotify, media players
7. **Recording** - OBS, streaming tools
8. **Graphics** - GIMP, Blender
9. **Gaming** - Games, Steam
10. **Misc** - Overflow workspace

## Gaming Configuration

- **VRR enabled**: Variable refresh rate support
- **Tearing allowed**: Reduced input lag for games
- **Immediate mode**: For gaming applications
- **Workspace 9**: Dedicated gaming workspace
- **Fullscreen optimization**: Games automatically go fullscreen

## AMD GPU Optimizations

The configuration includes AMD-specific environment variables:
- `LIBVA_DRIVER_NAME=radeonsi`
- `WLR_DRM_NO_ATOMIC=1`
- Proper DRM device ordering

## Theming

All components use the Gruvbox Dark color palette:
- **Background**: #282828
- **Foreground**: #ebdbb2  
- **Accent**: #d79921 (orange)
- **Error**: #cc241d (red)
- **Success**: #98971a (green)
- **Info**: #458588 (blue)

## Customization

### Changing Wallpapers
1. Add images to `~/Pictures/wallpapers/`
2. Edit `~/.config/hypr/hyprpaper.conf`
3. Run `hyprctl reload` or restart Hyprland

### Modifying Keybinds
Edit the keybindings section in `~/.config/hypr/hyprland.conf`

### Adjusting for Different Monitor Sizes
Modify the monitor configuration and ultrawide-specific resize bindings in `hyprland.conf`

## Troubleshooting

### Common Issues

1. **Applications not starting**:
   - Check if dependencies are installed
   - Verify paths in configuration files

2. **Wallpaper not loading**:
   - Ensure wallpaper file exists
   - Check hyprpaper.conf paths
   - Restart hyprpaper: `killall hyprpaper && hyprpaper &`

3. **Rofi theme not loading**:
   - Verify rofi theme files are in place
   - Test with: `rofi -show drun -theme gruvbox-dark`

4. **Gaming performance**:
   - Ensure VRR is enabled in monitor settings
   - Check that tearing is allowed
   - Verify immediate mode for games

### Performance Tips

- Disable blur for better performance: Set `blur.enabled = false`
- Reduce animation complexity if needed
- Use `immediate` window rule for performance-critical applications

## Dependencies

### Required
- hyprland
- waybar
- rofi
- dunst
- hyprpaper
- alacritty

### Optional but Recommended
- grim + slurp (screenshots)
- wl-clipboard + cliphist (clipboard)
- swaylock (screen locking)
- playerctl (media controls)
- pavucontrol (audio control)
- nm-applet (network management)

### Fonts
- JetBrainsMono Nerd Font
- Font Awesome (for icons)

## Contributing

Feel free to customize and improve this configuration. The setup is designed to be modular and easily extensible.