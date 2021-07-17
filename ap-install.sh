#!/bin/busybox ash

. /etc/init.d/tc-functions
. /var/www/cgi-bin/pcp-functions
useBusybox

cd /tmp/
wget https://raw.githubusercontent.com/lovehifi/picoreaddon/main/APMenu.tgz
tar -zxf /tmp/APMenu.tgz --overwrite -C /home/tc/

pcp_write_var_to_config USER_COMMAND_2 "%2fbin/sleep%2010;%2fhome%2ftc%2faplayer%2faplayer.sh;%2fhome%2ftc%2faprenderer%2faprenderer.sh;%2fhome%2ftc%2fapmenu%2fapmenu.sh"

echo "Rebooting..."
sleep 3
pcp br
