require './scanner'
require './Stack'
require './action'



first = ARGV
input = "(+ (+ 3 3) (/ 2 2))"
my_lexer = Scanner.new
output = my_lexer.lex(input)

stack= Stack.new
output.each do |lexer, token|

  pair = Pair.new(lexer,token)
  p pair.lexer
  if token == ")"
    stack=dostack(stack)

    stack.push(doaction)
    p stack.peek.token
  else
    stack.push(pair)
  end
end

