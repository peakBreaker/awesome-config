# Script for installing basics for awesome wm
if echo $(pwd) | grep -E */awesome-config
then 
  sudo apt update
  sudo apt install awesome
  cp ./.Xresources ~/
  cp -r ./* ~/.config/awesome/
  echo "-------------- INSTALL SUCCESSFUL -------------------"
  echo "Awesome configurations from this repository installed"
  echo "-----------------------------------------------------"
else 
  echo "You must cd to the directory before running this script"
fi
