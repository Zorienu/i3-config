laptopMonitor=eDP-1
hdmi=HDMI-1
scale=0.8

xrandr --output $laptopMonitor --scale $scale
# Get the current X axis resolution for the laptop monitor
hdmiOffset=$(xrandr | grep $laptopMonitor | awk '{print $4}' | awk -Fx '{print $1}')

if xrandr | grep "$hdmi connected"; then
  # https://askubuntu.com/questions/450655/mouse-flickering-on-one-of-my-two-screens
  # https://superuser.com/questions/1245756/xrandr-set-offset-to-monitor
  xrandr --output $hdmi --mode 1920x1080 --refresh 144.01 --scale 0.9999x0.9999 --pos $hdmiOffsetx0
  # Configure to use the external keyboard layout
  setxkbmap -layout es,es
else
  xrandr --output $hdmi --off
  # Configure to use the laptop keyboard layout
  setxkbmap -layout us,us
fi

i3 restart
