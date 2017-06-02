
class Stack

  def initialize
    @stack=Hash.new(0)
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

  def size
    return @stack.length
  end
  

end
