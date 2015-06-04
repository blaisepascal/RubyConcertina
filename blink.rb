require 'pi_piper'

pin = PiPiper::Pin.new(:pin => 18, :direction => :out)

10.times { 
  pin.on
  sleep 1
  pin.off
  sleep 1
}
  

