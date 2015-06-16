require 'pi_piper'

ledPin = PiPiper::Pin.new(:pin => 18, :direction => :out)

10.times { 
  ledPin.on
  sleep 1
  ledPin.off
  sleep 1
}
  

