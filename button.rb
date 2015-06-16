require "pi_piper"

class Button
  attr_reader :rowPin, :colPin, :value
              
  # Initializes a new button reader for a button in a row/column button matrix
  #
  # @param [Hash] options A hash of options
  # @option options [Fixnum] :row The pin number of the row in a button matrix
  # @option options [Fixnum] :col The pin number of the column in a button matrix
              
  def initialize(options)
    @rowPin = options[:row]
    @colPin = options[:col]

    raise "No row pin given" unless @rowPin
    raise "No column pin given" unless @colPin

    read
  end

  def turnColOff
    @colPin.off
  end    
  
  def turnColOn
    @colPin.on
  end    
  
  def read
    @last_value = @value
    
    turnColOn   
    @rowPin.read
    @value = @rowPin.value
    turnColOff
  end

  def changed?
    @last_value != @value
  end
end


  
    
