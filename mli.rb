require './scanner'
require './Stack'
require './action'


counter=0
first = ARGV
input = gets
my_lexer = Scanner.new
output = my_lexer.lex(input)
stack= Stack.new


output.each do |lexer, token|

  pair = Pair.new(lexer,token)
  if token=="("
    counter=counter+1
  end

  #p pair.lexer
  if token == ")"
    counter=counter-1
    stack=dostack(stack)

    a=doaction
    #if a!=false
      stack.push(a)
    #end

    if counter==0 && stack.peek!=nil
       stack.pop.token
    end

  else
    stack.push(pair)
  end
end

