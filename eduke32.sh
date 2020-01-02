folder=eduke32
echo $folder

# check upto date
sudo apt-get update

# install pre-requisites
sudo apt-get install -y build-essential nasm libgl1-mesa-dev libglu1-mesa-dev libsdl1.2-dev libsdl-mixer1.2-dev libsdl2-dev libsdl2-mixer-dev flac libflac-dev libvorbis-dev libvpx-dev libgtk2.0-dev freepats

# create folder
mkdir -p ~/$folder
cd ~/$folder

# download source
wget http://dukeworld.com/eduke32/synthesis/latest/eduke32_src_20181118-7241.tar.xz -O eduke32_src_20181118-7241.tar.xz
# unzip
tar -xvf eduke32_src_20181118-7241.tar.xz -C ~/$folder --strip-components=1

# add 'int' declaration !!!
sed -i -e 's/  glrendmode = (settings.polymer) ? REND_POLYMER : REND_POLYMOST;/  int glrendmode = (settings.polymer) ? REND_POLYMER : REND_POLYMOST;/g' source/duke3d/src/startgtk.game.cpp

# build
make USE_OPENGL=0

# get demo data
wget http://hendricks266.duke4.net/files/3dduke13_data.7z -O 3dduke13_data.7z
# install p7zip
sudo apt-get install -y p7zip
# unzip
p7zip -d 3dduke13_data.7z
