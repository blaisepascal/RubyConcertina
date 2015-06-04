# Electric English Concertina project, Raspberry Pi Edition

At this point, there are two ruby programs in this project. This is
still a work in progress.

## Menuet in G Major

To get it to work, you will need to install Timidity, the Fluidsound
sound fonts, and libasound2-dev. 

I am using the timidity setup info from
https://gist.github.com/nickstanish/8423074 

You will also need to use the included timidity.cfg file, and use the
following commands once per pi session: 

    sudo modprobe snd-virmidi index=1
    timidity -iA -oS &
    aconnect 20:0 128:0
    # if you want the audio jack, also use
    amixer cset numid=3 1

and then you should be able to run

    ruby menuetInG.rb

For some reason, it doesn't seem to work on a console screen, only in X.

## Blink

The quintessential GPIO "Hello World" app.

This is configured to use GPIO pin 18
