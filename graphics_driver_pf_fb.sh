#!/bin/bash
fbturbo=xf86-video-fbturbo-git
mesa=mesa-git
fbturbofile=/etc/X11/xorg.conf.d/99-fbturbo.conf
GLES_en=('qt5-es2-base qt5-es2-declarative qt5-es2-multimedia')
GLES_di=('qt5-base  qt5-declarative qt5-multimedia')
QT_file=/etc/environment
echo "                                          "
echo "-----------------------------------"
echo "Little PBP Panfrost or fbturbo bash"
echo "  only tested on the KDE Edition"
echo "-----------------------------------"
echo "                                          "
echo "-AUTOMATIC-----------------------------------"
echo "Type 1 for full Panfrost with QT Hardware installation"
echo "Type 2 for full fbturbo with QT Software installation"
echo "                                          "
echo "-MANUAL-----------------------------------"
echo "Type 3 for Panfrost only (remove fbturbo install newest mesa)"
echo "Type 4 for fbturbo only (install fbturbo)"
echo "Type 5 for OpenGLES (enabled es2_QT5 packages)"
echo "Type 6 for non_OpenGLES (deinstall es2_QT5 packages)"
echo "Type 7 for QT_Software backend to Hardware"
echo "Type 8 for QT_Software backend to Software"
echo "Type 9 to exit"
read n
case $n in
1)
echo "Deinstalling Fbturbo" 
sudo pacman -R $fbturbo
sudo rm $fbturbofile
echo "installing newest Graphic Driver"
sudo pacman -S $mesa
echo "Installing OpenGLES enabled QT5 packages" 
sudo pacman -S $GLES_en
echo "QT_Software backend to Hardware" 
sudo sed -i 's/QT_QUICK_BACKEND=software/#QT_QUICK_BACKEND=software/g' $QT_file;;
echo "please enable Compositor on startup and change xrender to OpenGL2.0"
echo "please reboot after that change"
2)
echo "Installing FBturbo" 
sudo pacman -S $fbturbo
echo "Installing non_OpenGLES QT5 packages" 
sudo pacman -S $GLES_di
echo "QT_Software backend to Software" 
sudo sed -i 's/#QT_QUICK_BACKEND=software/QT_QUICK_BACKEND=software/g' $QT_file
echo "please disable Compositor on startup and change OpenGL2.0 to xrender"
echo "please reboot after that change"
echo "please reboot your Laptop";;
3)
echo "Deinstalling Fbturbo" 
sudo pacman -R $fbturbo
sudo rm $fbturbofile
echo "installing newest Graphic Driver"
sudo pacman -S $mesa;;
4)
echo "Installing FBturbo" 
sudo pacman -S $fbturbo;;
5)
echo "Installing OpenGLES enabled QT5 packages" 
sudo pacman -S $GLES_en;;
6)
echo "Installing non_OpenGLES QT5 packages" 
sudo pacman -S $GLES_di;;
7)
echo "QT_Software backend to Hardware" 
sudo sed -i 's/QT_QUICK_BACKEND=software/#QT_QUICK_BACKEND=software/g' $QT_file
echo "please reboot your Laptop";;
8)
echo "QT_Software backend to Software" 
sudo sed -i 's/#QT_QUICK_BACKEND=software/QT_QUICK_BACKEND=software/g' $QT_file
echo "please reboot your Laptop";;
9)
echo "Bye Bye" 
exit;;
*)
echo "Bye Bye" ;;
esac



