#!/bin/bash

set -o errexit

USERNAME=$SUDO_USER

echo
echo "Installing Spinnaker packages..."

sudo dpkg -i libspinnaker_*.deb
sudo dpkg -i libspinnaker-dev_*.deb
sudo dpkg -i libspinnaker-c_*.deb
sudo dpkg -i libspinnaker-c-dev_*.deb
sudo dpkg -i libspinvideo_*.deb
sudo dpkg -i libspinvideo-dev_*.deb
sudo dpkg -i libspinvideo-c_*.deb
sudo dpkg -i libspinvideo-c-dev_*.deb
sudo dpkg -i spinview-qt_*.deb
sudo dpkg -i spinview-qt-dev_*.deb
sudo dpkg -i spinupdate_*.deb
sudo dpkg -i spinupdate-dev_*.deb
sudo dpkg -i spinnaker_*.deb
sudo dpkg -i spinnaker-doc_*.deb

echo
echo "Adding udev entry to allow access to USB hardware."
echo "If a udev entry is not added, your cameras may only be accessible by running Spinnaker as sudo."
sh configure_spinnaker.sh $USERNAME

echo
echo "Set USB-FS memory size to 1000 MB at startup (via /etc/rc.local)"
echo "By default, Linux systems only allocate 16 MB of USB-FS buffer memory for all USB devices."
echo "This may result in image acquisition issues from high-resolution cameras or multiple-camera set ups."
sh configure_usbfs.sh

echo
echo "Spinnaker installation complete."

exit 0
