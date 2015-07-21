require 'pi_piper'
require './button.rb'
require "midi"

@midi = UniMIDI::Output.use(:first)

rows = [ 17, 16,13,12,6,5 ]
cols = [ 19,20,21,22 ]

rowPins = rows.map { |r| PiPiper::Pin.new(:pin => r, :direction => :in, :pull => :down) }
colPins = cols.map { |c| PiPiper::Pin.new(:pin => c, :direction => :out) }


buttons = {
  "c3"   => Button.new(row: rowPins[0], col: colPins[0]),
  "c#3"  => Button.new(row: rowPins[1], col: colPins[0]),
  "d3"   => Button.new(row: rowPins[2], col: colPins[0]),
  "d#3"  => Button.new(row: rowPins[3], col: colPins[0]),
  "e3"   => Button.new(row: rowPins[4], col: colPins[0]),
  "f3"   => Button.new(row: rowPins[5], col: colPins[0]),
  "f#3"  => Button.new(row: rowPins[0], col: colPins[1]),
  "g3"   => Button.new(row: rowPins[1], col: colPins[1]),
  "g#3"  => Button.new(row: rowPins[2], col: colPins[1]),
  "a3"   => Button.new(row: rowPins[3], col: colPins[1]),
  "a#3"  => Button.new(row: rowPins[4], col: colPins[1]),
  "b3"   => Button.new(row: rowPins[5], col: colPins[1]),
  "C4"   => Button.new(row: rowPins[0], col: colPins[2]),
  "C#4"  => Button.new(row: rowPins[1], col: colPins[2]),
  "D4"   => Button.new(row: rowPins[2], col: colPins[2]),
  "D#4"  => Button.new(row: rowPins[3], col: colPins[2]),
  "E4"   => Button.new(row: rowPins[4], col: colPins[2]),
  "F4"   => Button.new(row: rowPins[5], col: colPins[2]),
  "F#4"  => Button.new(row: rowPins[0], col: colPins[3]),
  "G4"   => Button.new(row: rowPins[1], col: colPins[3]),
  "G#4"  => Button.new(row: rowPins[2], col: colPins[3]),
  "A4"   => Button.new(row: rowPins[3], col: colPins[3]),
  "A#4"  => Button.new(row: rowPins[4], col: colPins[3]),
  "B4"   => Button.new(row: rowPins[5], col: colPins[3]),
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

       


