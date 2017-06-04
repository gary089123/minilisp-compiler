require './stack'

map = Hash.new()

def plus
  result = @actionstack.pop.token
  while @actionstack.size!=0
    result=result+@actionstack.pop.token
  end
  return result
end

def minus
  result = @actionstack.pop.token
  result = result-@actionstack.pop.token
  return result
end

def multi
  result = @actionstack.pop.token
  while @actionstack.size!=0
    result=result*@actionstack.pop.token
  end
  return result
end

def div
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

def define
  result = @actionstack.pop.token
  value =@actionstack.pop.token
  map[result]=value
end

def dostack(stack)
  @actionstack=Stack.new
  while
    token=stack.pop
    #p token
    if token.token=="("
      break
    else
      @actionstack.push(token)
    end
  end
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
    when "if"
      return iff
    when "define"
      return define
  end
end