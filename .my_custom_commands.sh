#!/bin/bash

# Colors
red=$(printf '\033[0;31m')
green=$(printf '\033[0;32m')
blue=$(printf '\033[34m')
white=$(printf '\033[97m')
bold=$(printf '\033[1m')
cl=$(printf '\033[0m')

function confirm_and_run() {
  cmd=$1
  read -p "${white}Run ${green}${cmd}${white}? [y/n] " -n 1 -r resp
  printf "\n"

  case $resp in [yY][eE][sS]|[yY])
      printf "\n${green}Running: ${blue}${bold}$1${cl}\n"
      eval $1
      ;;
    [nN][oO]|[nN])
      printf "${red}${bold}Skipping ${green}$1${cl}\n"
      ;;
    *)
      echo "Invalid input...\n"
      exit 1
      ;;
  esac
}

function updatemepls() {

  printf "\n${bold}Good ol apt :)))) !${cl}\n"
  sudo apt-get update
  sudo apt-get install
  
  printf "\n${bold}Updating Git Hub Repos :)))) !${cl}\n"
  
  cd Documents/Formula/AdvancedResearch
  sudo git pull upstream main
  cd ~
  
  cd Documents/Formula/MKV-Boards
  sudo git pull upstream main
  cd ~
  
  cd Documents/Formula/MKV-Code
  sudo git pull upstream main
  cd ~
  
  cd Documents/Formula/OEM_Preferred_Parts
  sudo git pull upstream main
  cd ~
}


