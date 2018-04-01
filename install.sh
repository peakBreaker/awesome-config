# Script for installing basics for awesome wm
if echo $(pwd) | grep -E */awesome-config
then 
  cp -r ./* ~/.config/awesome/
  echo "-------------- INSTALL SUCCESSFUL -------------------"
  echo "Awesome configurations from this repository installed"
  echo "-----------------------------------------------------"
else 
  echo "You must cd to the directory before running this script"
fi
