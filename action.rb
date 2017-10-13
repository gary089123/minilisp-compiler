require './stack'

#@@map=Hash.new()


def plus
  if @actionstack.peek==nil
    puts "syntax error"
    exit(0)
  end
  result = @actionstack.pop.token
  while @actionstack.size!=0
    a=@actionstack.pop
    if (a.lexer!=:NUMBER && a.lexer !=":NUMBER")
      p a
      puts "syntax error"
      exit(0)
    end
    result=result+a.token
  end
  return result
end

def minus
  if @actionstack.peek==nil
    puts "syntax error"
    exit(0)
  end
  a=@actionstack.pop

  result = a.token
  a=@actionstack.pop
  if (a.lexer!=:NUMBER && a.lexer !=":NUMBER")
    puts "syntax error"
    exit(0)
  end
  result = result- a.token
  return result
end

def multi
  if @actionstack.peek==nil
    puts "syntax error"
    exit(0)
  end
  result = @actionstack.pop.token
  while @actionstack.size!=0
    result=result*@actionstack.pop.token
  end
  return result
end

def div
  if @actionstack.peek==nil
    puts "syntax error"
    exit(0)
  end
  result = @actionstack.pop.token
  result = result/@actionstack.pop.token
  return result
end

def mod
  result = @actionstack.pop.token
  result = result%@actionstack.pop.token
  return result
end

def bl
  result = @actionstack.pop.token
  if result>@actionstack.pop.token
    return "#t"
  else
    return "#f"
  end
end

def sl
  result = @actionstack.pop.token
  if result<@actionstack.pop.token
    return "#t"
  else
    return "#f"
  end
end

def equal

  result = "#t"
  temp=@actionstack.pop.token
  while @actionstack.size!=0
    if @actionstack.pop.token!=temp
      result = "#f"
    end
  end
  return result
end

def andf
  result = "#t"
  while @actionstack.size!=0
    if @actionstack.pop.token=="#f"
      result = "#f"
    end
  end
  return result
end

def orf
  result = "#f"
  while @actionstack.size!=0
    if @actionstack.pop.token=="#t"
      result = "#t"
    end
  end
  return result
end

def notf
  result = @actionstack.pop.token
  if result=="#t"
    result="#f"
  else
    result="#t"
  end
  return result
end

def iff
  result = @actionstack.pop.token
  if result=="#t"
    result=@actionstack.pop.token
  else
    @actionstack.pop
    result = @actionstack.pop.token
  end
  return result
end

def definef
  @actionstack.def_flag(true)
  result = @actionstack.pop.token
  value =@actionstack.pop
  @@map[result]=value
  p @@map
  @actionstack.def_flag(false)
end

def printfun
  result = @actionstack.pop.token
  p result
  return result
end

def dostack(stack)

  @actionstack=Stack.new
  while
    token=stack.pop
    #p token
    #p "-------"
    #p token
    if token.token=="("
      break
    else
      @actionstack.push(token)
    end
  end
  #p @actionstack
  #p "asd"
  return stack
end


def doaction
  case  @actionstack.pop.token
    when "+"
      return Pair.new(":NUMBER",plus)
    when "-"
      return Pair.new(":NUMBER",minus)
    when "*"
      return Pair.new(":NUMBER",multi)
    when "/"
      return Pair.new(":NUMBER",div)
    when "mod"
      return Pair.new(":NUMBER",mod)
    when ">"
      return Pair.new(":TF",bl)
    when "<"
      return Pair.new(":TF",sl)
    when "="
      return Pair.new(":TF",equal)
    when "and"
      return Pair.new(":TF",andf)
    when "or"
      return Pair.new(":TF",orf)
    when "not"
      return Pair.new(":TF",orf)
    when "print-num"
      return Pair.new(":NUMBER" ,printfun)
    when "print-bool"
      return Pair.new(":NUMBER" ,printfun)
    when "if"
      return Pair.new(":NULL", iff)
    when "define"
      definef
      #p "123123"
      return false
  end
end