# Don't leak PII via bluetooth, WiFi or networking
sudo scutil --set ComputerName MacBook
sudo scutil --set LocalHostName MacBook

# Don't store filevault key in memory on sleep/hibernation
sudo pmset -a destroyfvkeyonstandby 1
sudo pmset -a hibernatemode 25
sudo pmset -a powernap 0
sudo pmset -a standby 0
sudo pmset -a standbydelay 0
sudo pmset -a autopoweroff 0

# Configure firewall for outgoing connections
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on

# Don't automatically whitelist signed code
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp off

# Restart firewall to take effect
sudo pkill -HUP socketfilterfw

# Disable WiFi captive portals
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -bool false

# Prompt for password on screensaver and sleep
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Show dotfiles, file extensions and /Library
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
chflags nohidden ~/Library

# Say no to iCloud
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable crash reporter
defaults write com.apple.CrashReporter DialogType none

# Don't advertise on Bluetooth
sudo defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisments -bool YES

# TODO: automate this
csrutil status
echo "[ ] MANUAL STEP: confirm the above line says 'System Integrity Protection status: enabled.'"

# prompt to remove spotlight suggestions
echo "[ ] MANUAL STEP: disable spotlight suggestions: System Preferences > Spotlight > Search Results"
echo "[ ] MANUAL STEP: disable spotlight suggestions: Safari > Preferences > Search > 'Include Spotlight Suggestions'"

# Prompt to enable filevault
echo "[ ] MANUAL STEP: enable FileVault and reboot"
