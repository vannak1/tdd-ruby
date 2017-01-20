def measure(time = 1)
  results = []

  time.times do
    start = Time.now
    yield
    finish = Time.now
    results.push(finish - start)
  end

  avg_time = results.inject(:+) / results.length
end
