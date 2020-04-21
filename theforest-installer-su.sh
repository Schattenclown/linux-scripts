# TheForest Installer v6.9.4.20
#
# CC-BY Joyki
# edited by Schattenclown for TheForest
#
sleep 1
echo ""
echo -e "\e[1;33m"
echo "[INST_1]: APT Update & Upgrade"
echo -e "\e[0m"
sudo apt-get update
sudo apt-get upgrade -y
sleep 1
echo ""
echo -e "\e[1;33m"
echo "[INST_2]: Install Packages"
echo -e "\e[0m"
sudo apt-get install xorg-dev libx11-dev libfreetype6-dev libxml2-dev libxslt1-dev make flex bison lib32gcc1 curl screen ca-certificates build-essential -y
sleep 1
echo ""
echo -e "\e[1;33m"
echo "[INST_3]: Download Wine 3.0"
echo -e "\e[0m"
wget https://dl.winehq.org/wine/source/3.0/wine-3.0.tar.xz
tar xvfJ wine-3.0.tar.xz -C /usr/src/ 
rm wine-3.0.tar.xz 
sleep 1
echo ""
echo -e "\e[1;33m"
echo "[INST_4]: Configure Wine 3.0"
echo -e "\e[0m"
cd /usr/src/wine-3.0/
sudo ./configure --with-png --enable-win64
sleep 1
echo ""
echo -e "\e[1;33m"
echo "[INST_5]: Compile Wine 3.0"
echo -e "\e[0m"
cpux=$(cat /proc/cpuinfo | grep processor | wc -l)
sudo make -j $cpux
sudo make install 
sleep 1
echo ""
echo -e "\e[1;33m"
echo "[INST_6]: Download Files"
echo -e "\e[0m"
cd ~
mkdir TheForest
cd TheForest
curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
./steamcmd.sh +@sSteamCmdForcePlatformType windows +force_install_dir ~/TheForest/Serverfiles +login anonymous +app_update 556450 validate +quit 
sleep 1
echo ""
echo -e "\e[1;32m"
echo "[DONE]: Install is done"
echo ""
echo ""
echo " To start the Server, type:"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo ""
echo "screen"
echo "cd ~/TheForest/Serverfiles"
echo "/usr/src/wine-3.0/wine TheForestSandboxServer.exe -log"
echo ""
echo " Have fun ! "
echo -e "\e[0m"
echo ""
