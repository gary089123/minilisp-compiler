require './scanner'
require './Stack'

input = "(define y (+ 1 2 3))if"
my_lexer = Scanner.new
output = my_lexer.lex(input)
output.each{|lexer, token| p token}

