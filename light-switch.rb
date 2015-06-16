require 'pi_piper'
require './button.rb'
require "midi"

@midi = UniMIDI::Output.use(:first)

rows = [ 17, 16 ]
cols = [ 19 ]

rowPins = rows.map { |r| PiPiper::Pin.new(:pin => r, :direction => :in, :pull => :down) }
colPins = cols.map { |c| PiPiper::Pin.new(:pin => c, :direction => :out) }


buttons = {
  "c"   => Button.new(row: rowPins[0], col: colPins[0]),
  "d"  => Button.new(row: rowPins[1], col: colPins[0]),
}

ledPin = PiPiper::Pin.new(:pin => 18, :direction => :out)

3.times { 
  ledPin.on
  sleep 1
  ledPin.off
  sleep 1
}

MIDI.using(@midi) do
  loop do
    buttons.each do |note, button|
      button.read
      if button.changed? then    
        if button.value == 1 then
          note note
        else
          note_off note
        end
      end
    end
  end
end

       


