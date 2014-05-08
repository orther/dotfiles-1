#!/bin/bash
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true
defaults write com.apple.screencapture location -string "$HOME/Desktop"
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture disable-shadow -bool true
defaults write NSGlobalDomain AppleFontSmoothing -int 2
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
chflags nohidden ~/Library

# Disable and hide the Dock
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.Dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 9999999
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock showhidden -bool true
defaults write com.apple.dock dashboard-in-overlay -bool true
killall Dock

# Disable press and hold keyboard shortcuts
defaults write -g ApplePressAndHoldEnabled -bool false

# Enable AirDrop on Ethernet
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# KeyRemap4MacBook
defaults import org.pqrs.KeyRemap4MacBook ./setup/keyremap4macbook.plist

# Experimental iterm2 optimizations, hopefully won't be needed once
# the new version is released. See:
# https://code.google.com/p/iterm2/issues/detail?id=2553#c14
# defaults write com.googlecode.iterm2 ExperimentalOptimizationsEnabled -bool true
echo Defaults written, you may need to reboot or at least relog.
