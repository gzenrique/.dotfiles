#!/bin/sh

set -e

__dock_item() {
    printf '%s%s%s%s%s' \
           '<dict><key>tile-data</key><dict><key>file-data</key><dict>' \
           '<key>_CFURLString</key><string>' \
           "$1" \
           '</string><key>_CFURLStringType</key><integer>0</integer>' \
           '</dict></dict></dict>'
}

#######
# Menu
#######

# Show Battery percentage
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist "BatteryShowPercentage" -bool "true"

# Show Bluetooth Icon
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist "Bluetooth" -int "18"

# Hide Spotlight Icon
defaults -currentHost write com.apple.Spotlight "MenuItemHidden" -int "1"


#######
# Dock
#######

# Autohide
defaults write com.apple.dock "autohide" -bool "true"

# Remove Autohide delay
defaults write com.apple.dock "autohide-delay" -float "0"

# Icon Size
defaults write com.apple.dock "tilesize" -int "36"

# Speed up Mission Control Animations
defaults write com.apple.dock "expose-animation-duration" -float "0.12"

# Permanent Icons
defaults write com.apple.dock persistent-apps -array \
        "$(__dock_item /Applications/Brave\ Browser.app)" \
        "$(__dock_item /Applications/kitty.app)" \
        "$(__dock_item /Applications/Slack.app)" \
        "$(__dock_item /Applications/Spotify.app)"

# Position
defaults write com.apple.dock "orientation" -string "left"

# Enable Spring Loading for all Dock Items
defaults write com.apple.dock "enable-spring-load-actions-on-all-items" -bool "true"

killall Dock


#########
# Finder
#########

# Hide Desktop Icons
defaults write com.apple.finder "CreateDesktop" -bool "false"

# Show hidden files
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"

# Column view style
defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv"

# Show path bar
defaults write com.apple.finder "ShowPathbar" -bool "true"

# Keep folders on top
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"

# Empty bin items after 30 days
defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "true"

# Search Within Folder
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"

killall Finder


###########
# Keyboard
###########

# Disable AutoCorrect
# defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Key Repeats customization
defaults write -g "KeyRepeat" -float 1.3
defaults write -g "InitialKeyRepeat" -int 15

# Disable Auto Capitalization
defaults write NSGlobalDomain "NSAutomaticCapitalizationEnabled" -bool false

# Disable Smart Dashes
defaults write NSGlobalDomain "NSAutomaticDashSubstitutionEnabled" -bool false

# Disable Automatic Period Substitutions
defaults write NSGlobalDomain "NSAutomaticPeriodSubstitutionEnabled" -bool false

# Disable Smart Quotes 
defaults write NSGlobalDomain "NSAutomaticQuoteSubstitutionEnabled" -bool false


########
# Misc.
########

# Mouse tracking speed
defaults write -g "com.apple.mouse.scaling" -float "2.5"

# Screenshots placement
# defaults write com.apple.screencapture "location" -string ~/Pictures/Screenshots

