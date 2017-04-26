#!/usr/bin/env bash

# Copied by MacBot - https://github.com/echohack/macbot
highlight=$(tput bold)
reset=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
white=$(tput setaf 7)

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

title() {
  echo "${highlight} ▸ ${@}${reset}"
}

test() {
  eval "$@"
  if [ $? -eq 0 ]; then
    echo "    ${green}OK${white} - ${@}"
  else
    echo "    ${red}FAIL${white} - ${@}"
  fi
}

# Close any open System Preferences panes, to prevent them from overriding settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
if [ $(sudo -n uptime 2>&1|grep "load"|wc -l) -eq 0 ]
then
  title "${highlight}Some of these settings are system-wide, therefore we need your permission.${reset}"
  sudo -v
  echo ""
fi

title "Setting your computer name, what would you like it to be?"
read computer_name
test sudo scutil --set ComputerName "$computer_name"
test sudo scutil --set HostName "$computer_name"
test sudo scutil --set LocalHostName "$computer_name"
test sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "'$computer_name'"

title "Disable sudden motion sensor. (Not useful for SSDs)."
test sudo pmset -a sms 0 && \

title "Disable press-and-hold for keys in favor of key repeat."
test defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

title "Disable auto-correct."
test defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

title "Expand save panel by default"
test defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
test defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

title "Automatically quit printer app once the print jobs complete"
test defaults write com.apple.print.PrintingPrefs \"Quit When Finished\" -bool true

title "Disable the “Are you sure you want to open this application?” dialog"
test defaults write com.apple.LaunchServices LSQuarantine -bool false

title "Disable smart quotes as they’re annoying when typing code"
test defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

title "Disable smart dashes as they’re annoying when typing code"
test defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

title "Disable Dashboard"
test defaults write com.apple.dashboard mcx-disabled -bool true

title "Don’t show Dashboard as a Space"
test defaults write com.apple.dock dashboard-in-overlay -bool true

title "Don’t automatically rearrange Spaces based on most recent use"
test defaults write com.apple.dock mru-spaces -bool false

title "Automatically hide and show the Dock"
test defaults write com.apple.dock autohide -bool true

title "Disable the Launchpad gesture (pinch with thumb and three fingers)"
test defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

title "Remove all icons in the Dock"
test defaults write com.apple.dock persistent-apps -array

#title "Add iOS & Watch Simulator to Launchpad""
#test sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app" "/Applications/Simulator.app"
#test sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator (Watch).app" "/Applications/Simulator (Watch).app"

title "Disable hot corners"
# Top left screen corner
test defaults write com.apple.dock wvous-tl-corner -int 0
test defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner
test defaults write com.apple.dock wvous-tr-corner -int 0
test defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner
test defaults write com.apple.dock wvous-bl-corner -int 0
test defaults write com.apple.dock wvous-bl-modifier -int 0
# Bottom right screen corner
test defaults write com.apple.dock wvous-br-corner -int 0
test defaults write com.apple.dock wvous-br-modifier -int 0

# title "Use the dark theme."
# test defaults write ~/Library/Preferences/.GlobalPreferences AppleInterfaceStyle -string "Dark"

# title "Save screenshots in PNG format."
# test defaults write com.apple.screencapture type -string png

title "Disable mouse enlargement with jiggle."
test defaults write ~/Library/Preferences/.GlobalPreferences CGDisableCursorLocationMagnification -bool true

title "Show all filename extensions."
test defaults write NSGlobalDomain AppleShowAllExtensions -bool true

title "Disable the warning when changing a file extension."
test defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

title "Use list view in all Finder windows by default."
test defaults write com.apple.finder FXPreferredViewStyle -string '"clmv"'

title "Show the ~/Library folder."
test chflags nohidden ~/Library

title "Show the /Volumes folder."
test sudo chflags nohidden /Volumes

title "Show hidden files (whose name starts with dot) in finder."
test defaults write com.apple.finder AppleShowAllFiles -int 1

title "Don't write DS_Store files to network shares."
test defaults write DSDontWriteNetworkStores com.apple.desktopservices -int 1

title "Don't ask to use external drives as a Time Machine backup."
test defaults write DoNotOfferNewDisksForBackup com.apple.TimeMachine -int 1

title "Disable Safari from auto-filling sensitive data."
test defaults write ~/Library/Preferences/com.apple.Safari AutoFillCreditCardData -bool false
test defaults write ~/Library/Preferences/com.apple.Safari AutoFillFromAddressBook -bool false
test defaults write ~/Library/Preferences/com.apple.Safari AutoFillMiscellaneousForms -bool false
test defaults write ~/Library/Preferences/com.apple.Safari AutoFillPasswords -bool false

title "Disable Safari from automatically opening files."
test defaults write ~/Library/Preferences/com.apple.Safari AutoOpenSafeDownloads -bool false

title "Disable spotlight universal search (don't send info to Apple)."
test defaults write com.apple.safari UniversalSearchEnabled -int 0

title "Disable Spotlight Suggestions, Bing Web Search, and other leaky data."
export PYTHONPATH="/System/Library/Frameworks/Python.framework/Versions/2.6/Extras/lib/python/"
test python ./scripts/fix_leaky_data.py

title "Set screen to lock as soon as the screensaver starts."
test defaults write com.apple.screensaver askForPassword -int 1
test defaults write com.apple.screensaver askForPasswordDelay -int 0

title "Don't default to saving documents to iCloud."
test defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

title "Disable crash reporter."
test defaults write com.apple.CrashReporter DialogType none

title "Enable Stealth Mode. Computer will not respond to ICMP ping requests or connection attempts from a closed TCP/UDP port."
test sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -bool true

title "Set all network interfaces to use Google DNS."
test source ./scripts/use_google_dns.sh

title "Disable wake on network access."
test sudo systemsetup -setwakeonnetworkaccess off &>/dev/null

title "Disable Bonjour multicast advertisements."
test sudo defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool YES

title "Enable Mac App Store automatic updates."
test defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

title "Check for Mac App Store updates daily."
test defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

title "Download Mac App Store updates in the background."
test defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

title "Install Mac App Store system data files & security updates."
test defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

title "Turn on Mac App Store auto-update."
test defaults write com.apple.commerce AutoUpdate -bool true
