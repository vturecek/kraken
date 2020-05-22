#build and run in a container
docker build -t vturecek/kraken:1.0 .
docker run --device=/dev/hidraw0 vturecek/kraken:1.0

#pre-req install to run with systemd
apt-get update
apt-get -y upgrade
apt-get install -y python3-pip libusb-1.0-0-dev libudev-dev
python3 -m pip install liquidctl

#install systemd service
cp kraken.sh /usr/local/sbin/kraken.sh
cp kraken.service /etc/systemd/system
systemctl start kraken.service
systemctl enable kraken.service