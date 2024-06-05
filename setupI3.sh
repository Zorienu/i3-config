laptopMonitor=eDP-1
hdmi=HDMI-1

xrandr --output $laptopMonitor --scale 0.8 

if xrandr | grep "$hdmi connected"; then
  xrandr --output $hdmi --mode 1920x1080 --refresh 144.01 --right-of $laptopMonitor --scale 1
  # Configure to use the external keyboard layout
  setxkbmap -layout es,es
else
  xrandr --output $hdmi --off
  # Configure to use the laptop keyboard layout
  setxkbmap -layout us,us
fi



i3 restart
