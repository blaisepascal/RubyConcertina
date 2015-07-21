require "midi"

# prompt the user to select an input and output

@output = UniMIDI::Output.use(:first)

tempo = 180
q = 60.0/tempo
e = q/2

MIDI.using(@output) do
  play "d5", q
  play "g4", e
  play "a4", e
  play "b4", e
  play "c5", e

  play "d5",q
  play "g4",q
  play "g4",q

  play "e5", q
  play "c5", e
  play "d5", e
  play "e5", e
  play "f#5", e

  play "g5",q
  play "g4",q
  play "g4",q

  play "c5", q
  play "d5", e
  play "c5", e
  play "b4", e
  play "a4", e

  
  play "b4", q
  play "c5", e
  play "b4", e
  play "a4", e
  play "g4", e
  
  play "f#4", q
  play "g4", e
  play "a4", e
  play "b4", e
  play "g4", e

  play "b4", e
  play "a4", e+2*q
  
end
