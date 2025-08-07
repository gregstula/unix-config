# Thinkpad E16 AMD 2024 - REALTEK RTW8852BE WIFI CARD - LINUX DRIVER  SOLUTION

My thinkpad model uses Realtek Wifi Driver 

TLDR: put rtw8852be.conf in /etc/modprobe.d,  power off laptop, unplug charger, wait, turn on laptop

Driver in the kernel is good but needs powersaving stuff in the conf or it breaks even on reboot

The card get's disabled/stuck in a disabled state. 

Power cycle fixes it if installing new OS without these driver settings.
HowTo Power cycle: Power off the Thinkpad. Pull the charger out. Wait 2-3 minutes, then turn it back on.
*You do not need to boot Windows to reset the wifi card although that also works and put's it ina good state*
*It is totally safe to wipe windows off this laptop :)

Solution was incredibly hard to find and I could not reproduce it a second time. (Many wrong answers cluttering page)
Thankfully I saved this file and reverse googled it to find the source
https://bbs.archlinux.org/viewtopic.php?id=290480


