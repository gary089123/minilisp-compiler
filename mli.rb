require './scanner'


input = "(define y (+ 1 2 3))"
my_lexer = Scanner.new
output = my_lexer.lex(input)
output.each{|lexer, token| p token}

