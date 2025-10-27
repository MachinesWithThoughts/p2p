ps -elf | grep -i docker | grep -v grep

set -x
sudo pkill -9 -f Docker
sudo pkill -9 -f com.docker
sudo pkill -9 -f hyperkit
set +x

ps -elf | grep -i docker | grep -v grep
