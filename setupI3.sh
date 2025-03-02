laptopMonitor=eDP-1
hdmi=HDMI-1
scale=0.8

xrandr --output $laptopMonitor --scale $scale
# Get the current X axis resolution for the laptop monitor
hdmiOffset=$(xrandr | grep $laptopMonitor | awk '{print $4}' | awk -Fx '{print $1}')
echo $hdmiOffset

if xrandr | grep "$hdmi connected"; then
  # https://askubuntu.com/questions/450655/mouse-flickering-on-one-of-my-two-screens
  # https://superuser.com/questions/1245756/xrandr-set-offset-to-monitor
  xrandr --output $hdmi --mode 3840x2160 --refresh 60 --scale 0.75x0.75 --pos $hdmiOffsetx0
  # Configure to use the external keyboard layout
  setxkbmap -layout es,es
else
  xrandr --output $hdmi --off
  # Configure to use the laptop keyboard layout
  setxkbmap -layout us,us
fi

# i3 restart
