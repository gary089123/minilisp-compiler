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
    @define_flag==false
  end

  def push(object)
    @stack[@stack.length+1]=object
    return @stack
  end

  def pop
    object=@stack[@stack.length]
    @stack.delete(@stack.length)
    
    #p object
    #if object.lexer==:ID && @define_flag==false
    #  p "qwe"
    #  p @@map
    #  object=@@map[object.token]
    #end
    #p object
    return object
  end

  def peek
    return @stack[@stack.length]
  end


  def size
    return @stack.length
  end

  def def_flag(flag)
    @define_flag=flag
  end
end


