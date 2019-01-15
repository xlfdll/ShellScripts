#/bin/bash

sudo apt install -y lib64stdc++6 mesa-utils

cd ~/Android/Sdk/emulator/lib64/libstdc++
sudo rm libstdc++.so.6
sudo ln -s /usr/lib64/libstdc++.so.6 ~/Android/Sdk/emulator/lib64/libstdc++