class Timer
  attr_accessor :seconds

  def initialize
    @seconds = 0
  end

  def time_string
    time_left = @seconds
    seconds = pad(time_left % 60)
    minutes = pad((time_left / 60) % 60)
    hours = pad((time_left / 3600) % 24)
    
    "#{hours}:#{minutes}:#{seconds}"
  end

  def pad(time)
    if time < 10
      "0#{time}"
    else
      time
    end
  end
end
