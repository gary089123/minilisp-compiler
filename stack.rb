
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


  def search(token)
    p @stack
    for i in 1..@stack.length
      if @stack[@stack.length-i+1]==token
        return @stack.length+1-i
      end
    end
    return "fail"
  end

  def next(i)
    return @stack[i+1]
  end

  def size
    return @stack.length
  end


end
