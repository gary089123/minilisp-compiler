require './stack'

def plus
  result = @actionstack.pop
  while @actionstack.size!=0
    result=result+@actionstack.pop
  end
  return result
end

def minus
  result = @actionstack.pop
  result = result-@actionstack.pop
  return result
end

def multi
  result = @actionstack.pop
  while @actionstack.size!=0
    result=result*@actionstack.pop
  end
  return result
end

def div
  result = @actionstack.pop
  result = result/@actionstack.pop
  return result
end

def mod
  result = @actionstack.pop
  result = result%@actionstack.pop
  return result
end

def bl
  result = @actionstack.pop
  if result>@actionstack.pop
    return "#t"
  else
    return "#f"
  end
end

def sl
  result = @actionstack.pop
  if result<@actionstack.pop
    return "#t"
  else
    return "#f"
  end
end

def equal

  result = "#t"
  temp=@actionstack.pop
  while @actionstack.size!=0
    if @actionstack.pop!=temp
      result = "#f"
    end
  end
  return result
end

def dostack(stack)
  @actionstack=Stack.new
  while
    token=stack.pop
    if token=="("
      break
    else
      @actionstack.push(token)
    end
  end
  return stack
end


def doaction
  case @actionstack.pop
    when "+"
      return plus
    when "-"
      return minus
    when "*"
      return multi
    when "/"
      return div
    when "mod"
      return mod
    when ">"
      return bl
    when "<"
      return sl
    when "="
      return equal
  end



  return token
end