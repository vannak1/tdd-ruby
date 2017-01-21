class Array
  def sum
    if self.length == 0
      0
    else
      self.reduce(:+)
    end
  end

  def square
    self.collect do |x|
      x * x
    end
  end

  def square!
    self.collect! do |x|
      x * x
    end
  end
end
