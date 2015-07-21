sudo modprobe snd-virmidi index=1
timidity -iA -Os &
aconnect 20:0 128:0
