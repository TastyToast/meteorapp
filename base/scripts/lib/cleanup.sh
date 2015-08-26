# Borrowed from: https://github.com/chriswessles/meteor-tupperware

set -e

# Autoremove any junk
apt-get autoremove -y

# Clean out docs
rm -rf /usr/share/doc /usr/share/doc-base /usr/share/man usr/share/locale /user/share/zoneinfo

# Clean out package managment dirs
rm -rf /var/lib/cache /var/lib/log

# Clean out /tmp
rm -rf /tmp/*

# Clear npm cache
npm cache clear
