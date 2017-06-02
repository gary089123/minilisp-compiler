require './scanner'
require './Stack'
require './action'


first = ARGV
input = "(> 13 2 )"
my_lexer = Scanner.new
output = my_lexer.lex(input)

stack= Stack.new

output.each do |lexer, token|

  if token == ")"
    stack=dostack(stack)
    stack.push(doaction)
    p stack.peek
  else
    stack.push(token)
  end
end

