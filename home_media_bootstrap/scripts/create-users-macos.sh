sudo dscl . create /Users/p2p
sudo dscl . create /Users/p2p UniqueID 2000
sudo dscl . create /Users/p2p PrimaryGroupID 2000
sudo dscl . create /Users/p2p UserShell /bin/bash
sudo dscl . create /Users/p2p NFSHomeDirectory /Users/p2p
sudo mkdir -p /Users/p2p
sudo chown -R p2p:p2p /Users/p2p
