# Electric English Concertina project, Raspberry Pi Edition

For now, the ruby exploration simply plays Menuet in G Major by JS Bach.

To get it to work, you will need to install Timidity, the Fluidsound sound fonts, and libasound2-dev.
You will also need to use the included timidity.cfg file, and use the following commands once per pi session:

sudo modprobe snd-virmidi index=1
timidity -iA -oS &
aconnect 20:0 128:0

and then you should be able to run "ruby menuetInG.rb"

For some reason, it doesn't seem to work on a console screen, only in X.
