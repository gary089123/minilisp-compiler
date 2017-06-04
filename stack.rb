
class Pair
  def initialize(lexer,token)
    @token=token
    @lexer=lexer
  end

  def lexer
    return @lexer
  end

  def token
    return @token
  end
end


class Stack

  def initialize
    @stack=Hash.new()
  end

  def push(object)
    @stack[@stack.length+1]=object
    return @stack
  end

  def pop
    object=@stack[@stack.length]
    @stack.delete(@stack.length)
    return object
  end

  def peek
    return @stack[@stack.length]
  end


  def size
    return @stack.length
  end

end


