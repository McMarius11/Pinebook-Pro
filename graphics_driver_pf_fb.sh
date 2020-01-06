#!/bin/bash
fbturbo=xf86-video-fbturbo-git
mesa=mesa-git
fbturbofile=/etc/X11/xorg.conf.d/99-fbturbo.conf
GLES_en=('qt5-es2-base qt5-es2-declarative qt5-es2-multimedia')
GLES_di=('qt5-base  qt5-declarative qt5-multimedia')
echo "-----------------------------------"
echo "Little PBP Panfrost or fbturbo bash"
echo "-----------------------------------"
echo "Type 1 for Panfrost only (remove fbturbo install newest mesa)"
echo "Type 2 for fbturbo only (install fbturbo)"
echo "Type 3 for OpenGLES (enabled es2_QT5 packages)"
echo "Type 4 for non_OpenGLES (deinstall es2_QT5 packages)"
echo "Type 5 for QT_Software backend to Hardware"
echo "Type 6 for QT_Software backend to Software"
echo "Type 7 to exit"
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
echo "Installing OpenGLES enabled QT5 packages" 
sudo pacman -S $GLES_en;;
4)
echo "Installing non_OpenGLES QT5 packages" 
sudo pacman -S $GLES_di;;
7)
echo "Bye Bye" 
exit;;
*)
echo "Bye Bye" ;;
esac

