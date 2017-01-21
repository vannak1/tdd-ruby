require 'pry'

class RPNCalculator
  def initialize
    @stack = Array.new
    @value = 0
  end

  def push(x)
    @stack.push(x)
  end

  def plus
    raise 'calculator is empty' if @stack.length < 2
    @value = @stack.pop + @stack.pop
    @stack.push(value)
  end

  def minus
    raise 'calculator is empty' if @stack.length < 2
    @value = -@stack.pop + @stack.pop
    @stack.push(@value)
  end

  def divide
    raise 'calculator is empty' if @stack.length < 2
    right = Float(@stack.pop)
    left = Float(@stack.pop)
    @value = left / right
    @stack.push(@value)
  end

  def times
    raise 'calculator is empty' if @stack.length < 2
    @value = @stack.pop * @stack.pop
    @stack.push(@value)
  end

  def value
    @value
  end

  def tokens(token_string)
    tokens = token_string.split(" ")
    tokens.collect! do |token|
      if token =~ /[\*\+\-\/]/
        token.to_sym
      else
        token.to_i
      end
    end
  end

  def evaluate(str)
    t = tokens(str)
    stack = []

    while t.size > 0
         token = t.shift
         case token
         when :+
           right = stack.pop
           left = stack.pop
           stack.push(left + right)
         when :-
           right = stack.pop
           left = stack.pop
           stack.push(left - right)
         when :/
           right = Float(stack.pop)
           left = Float(stack.pop)
           stack.push(left / right)
         when :*
           right = stack.pop
           left = stack.pop
           stack.push(left * right)
         else
           stack.push(token)
         end
    end
    stack[0]
  end
end
