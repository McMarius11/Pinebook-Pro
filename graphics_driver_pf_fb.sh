#!/bin/bash
fbturbo=xf86-video-fbturbo-git
mesa=mesa-git
fbturbofile=/etc/X11/xorg.conf.d/99-fbturbo.conf
echo "-----------------------------------"
echo "Little PBP Panfrost or fbturbo bash"
echo "-----------------------------------"
echo "Type 1 for Panfrost only (remove Panfrost install newest mesa)"
echo "Type 2 for fbturbo only (install fbturbo)"
echo "Type 3 to exit"
read n
case $n in
1)
echo "Deinstalling Fbturbo" 
sudo pacman -R $fbturbo
sudo rm $fbturbofile
echo "installing newest Graphic Driver"
sudo pacman -S $mesa;;
2)
echo "Installing FBturbo" 
sudo pacman -S $fbturbo;;
3)
echo "Bye Bye" 
exit;;
*)
echo "Bye Bye" ;;
esac

