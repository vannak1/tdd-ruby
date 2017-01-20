def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def sum(numbers)
  if numbers.length < 1
    0
  else
    numbers.reduce(:+)
  end
end

def multiply(a,b)
  a * b
end

def power(a, b)
  a ** b
end

def factorial(a)
  return 1 if a == 0 || a == 1

  return a * factorial(a - 1)
end
