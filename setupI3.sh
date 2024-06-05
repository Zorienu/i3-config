laptopMonitor=eDP-1
hdmi=HDMI-1

if xrandr | grep "$hdmi connected"; then
  xrandr --output $hdmi --mode 1920x1080 --refresh 144.01 --right-of $laptopMonitor
else
  xrandr --output $hdmi --off
fi

i3 restart
