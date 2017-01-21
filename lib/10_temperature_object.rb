class Temperature
  attr_accessor :temp

  def initialize(temp = {})
    @temp = temp
    if temp[:f] != nil
      @temp[:c] = ftoc(temp[:f])
    elsif temp[:c] != nil
      @temp[:f] =  ctof(temp[:c])
    end
  end

  def in_celsius
    @temp[:c]
  end

  def in_fahrenheit
    @temp[:f]
  end

  def self.from_celsius(celsius)
    self.new(:c => celsius)
  end

  def self.from_fahrenheit(fahrenheit)
    self.new(:f => fahrenheit)
  end

  def self.ftoc(fahrenheit)
    (fahrenheit - 32) * (5.0 / 9.0)
  end

  def self.ctof(celcius)
     celsius * 9.0 / 5.0 + 32
  end
end

class Celsius < Temperature
  def initialize(temp)
    super @temp = {:c => temp}
  end
end

class Fahrenheit < Temperature
  def initialize(temp)
    super @temp = {:f => temp}
  end
end
