def reverser
  str = yield
  result = []
  str.split(" ").each{|word| result.push(word.reverse)}
  result.join(" ")
end

def adder(x = 1)
  yield + x
end

def repeater(x = 1)
  x.times { yield }
end
