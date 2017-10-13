require 'lex'
class Scanner < Lex::Lexer
  tokens(
      :NUMBER,
      :PLUS,
      :MINUS,
      :TIMES,
      :DIVIDE,
      :MOD,
      :LPAREN,
      :RPAREN,
      :EQUALS,
      :ID,
      :AND,
      :OR,
      :NOT,
      :DEFINE,
      :FUN,
      :IF,
      :BL,
      :SL,
      :TF
  )

  # Regular expression rules for simple tokens
  rule(:DEFINE, /define/)
  rule(:IF,     /if/)
  rule(:PLUS,   /\+/)
  rule(:MINUS,  /\-/)
  rule(:TIMES,  /\*/)
  rule(:DIVIDE, /\//)
  rule(:MOD,    /mod/)
  rule(:LPAREN, /\(/)
  rule(:RPAREN, /\)/)
  rule(:EQUALS, /\=/)
  rule(:AND,    /and/)
  rule(:OR,     /or/)
  rule(:NOT,    /not/)
  rule(:FUN,    /fun/)
  rule(:BL,     /\>/)
  rule(:SL,     /\</)
  rule(:TF,     /#[t|f]/)
  rule(:ID,     /[a-z][a-z0-9\-]*/)


  # A regular expression rules with actions
  rule(:NUMBER, /-?[0-9]+/) do |lexer, token|
    token.value = token.value.to_i
    token
  end

  # Define a rule so we can track line numbers
  rule(:newline, /\n+/) do |lexer, token|
    lexer.advance_line(token.value.length)
  end

  # A string containing ignored characters (spaces and tabs)
  ignore " \t"

  error do |lexer, token|
    puts "Illegal character #{token.value}"
  end
end
