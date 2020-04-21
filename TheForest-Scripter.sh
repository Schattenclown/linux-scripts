# TheForest Scripter v6.9.4.20
#
# CC-BY Joyki
# edited by Schattenclown for TheForest
#
#! /bin/bash
updater="TheForest-update.sh"
starter="TheForest-start.sh"
checker="TheForest-check.sh"
if [ -f "$updater" ]
then
echo  "[Updater] exists"
else
cd ~
touch TheForest-update.sh
echo '#! /bin/bash
echo "[Start Update TheForest]"
cd ~/TheForest/
./steamcmd.sh +@sSteamCmdForcePlatformType windows +force_install_dir ~/TheForest/Serverfiles +login anonymous +app_update 556450 validate +quit
echo "[done]"' > $updater
chmod +x TheForest-update.sh
echo  "[Updater] created"
fi
if [ -f "$starter" ]
then
echo  "[Starter] exists"
else
cd ~
touch TheForest-start.sh
echo '#! /bin/bash
cd ~/TheForest/Serverfiles
screen -dmS TheForest /usr/src/wine-3.0/wine TheForestSandboxServer.exe -log ' >$starter
chmod +x TheForest-start.sh
echo  "[Starter] created"
fi
if [ -f "$checker" ]
then
echo  "[Checker] exists"
else
cd ~
touch TheForest-check.sh
echo '#! /bin/bash
case "$(pidof TheForest | wc -w)" in
0)
~/TheForest-start.sh
;;
1)
;;
esac' > $checker
chmod +x TheForest-check.sh
echo  "[Checker] created"
fi
