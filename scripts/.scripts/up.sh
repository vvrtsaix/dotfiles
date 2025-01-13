#!/bin/bash

TEXT_COLOR="\033[34;1m"
SUCCESS_COLOR="\033[32;7m"
RESET_COLOR="\033[0m"

printf "${TEXT_COLOR}Updating homebrew and local base of available packages and versions...${RESET_COLOR}\n"
brew update

printf "${TEXT_COLOR}Checking for outdated packeges...${RESET_COLOR}\n"
brew outdated

printf "${TEXT_COLOR}Upgrading outdated packages...${RESET_COLOR}\n"
brew upgrade

printf "${TEXT_COLOR}Upgrading outdated casks (applications)...${RESET_COLOR}\n"
brew upgrade --cask

printf "${SUCCESS_COLOR}Brew update complete!${RESET_COLOR}\n"

printf "${TEXT_COLOR}Yabai: Reloading configuration...${RESET_COLOR}\n"
yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"

printf "${TEXT_COLOR}Yabai: Restarting service...${RESET_COLOR}\n"
sudo yabai --load-sa && yabai --restart-service

printf "${SUCCESS_COLOR}Yabai: Done!${RESET_COLOR}\n"
