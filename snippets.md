# Pulse audio echo cancellation
```
pacmd load-module module-echo-cancel use_master_format=1 aec_method=webrtc aec_args="analog_gain_control=0\ digital_gain_control=1"
```
