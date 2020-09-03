#!/usr/bin/env fish
set -l min_brightness 0
set -l max_brightness (cat /sys/class/backlight/intel_backlight/max_brightness)
# echo $max_brightness
set -l current_brightness (cat /sys/class/backlight/intel_backlight/brightness)
# echo $current_brightness
set -g brightness $max_brightness

set -l step 20

if test "$argv" != "up"
  if test "$argv" != "down"
    exit
  end
end

if test "$argv" = "up"
  # echo 'up'
  set brightness (math $current_brightness + $step)
  # echo 'new brightness' $brightness
  if test $brightness -gt $max_brightness
    set brightness $max_brightness
    # echo 'adjusted brightness' $brightness
  end
else
  echo 'down'
  set brightness (math $current_brightness - $step)
  # echo 'new brightness' $brightness
  if test $brightness -lt $min_brightness
    set brightness (echo $min_brightness)
    # echo 'adjusted brightness' $brightness
  end
end

# echo "echo $brightness > /sys/class/backlight/intel_backlight/brightness"
bash -c "echo $brightness > /sys/class/backlight/intel_backlight/brightness"
