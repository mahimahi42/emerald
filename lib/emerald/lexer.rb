#--
# DO NOT MODIFY!!!!
# This file is automatically generated by rex 1.0.5
# from lexical definition file "lib/emerald/em_lexer.rex.rb".
#++

require 'racc/parser'
class EmeraldLang < Racc::Parser
  require 'strscan'

  class ScanError < StandardError ; end

  attr_reader   :lineno
  attr_reader   :filename
  attr_accessor :state

  def scan_setup(str)
    @ss = StringScanner.new(str)
    @lineno =  1
    @state  = nil
  end

  def action
    yield
  end

  def scan_str(str)
    scan_setup(str)
    do_parse
  end
  alias :scan :scan_str

  def load_file( filename )
    @filename = filename
    open(filename, "r") do |f|
      scan_setup(f.read)
    end
  end

  def scan_file( filename )
    load_file(filename)
    do_parse
  end


  def next_token
    return if @ss.eos?
    
    # skips empty actions
    until token = _next_token or @ss.eos?; end
    token
  end

  def _next_token
    text = @ss.peek(1)
    @lineno  +=  1  if text == "\n"
    token = case @state
    when nil
      case
      when (text = @ss.scan(/[ \t]+/))
        ;

      when (text = @ss.scan(/\d+/))
         action {[:INT, text.to_i]}

      when (text = @ss.scan(/\+/))
         action {[:OP, text]}

      when (text = @ss.scan(/\-/))
         action {[:OP, text]}

      when (text = @ss.scan(/\*/))
         action {[:OP, text]}

      when (text = @ss.scan(/\//))
         action {[:OP, text]}

      when (text = @ss.scan(/\(/))
         action {[:LPAREN, text]}

      when (text = @ss.scan(/\)/))
         action {[:RPAREN, text]}

      when (text = @ss.scan(/\{/))
         action {[:LBRACE, text]}

      when (text = @ss.scan(/\}/))
         action {[:RBRACE, text]}

      when (text = @ss.scan(/=/))
         action {[:EQUAL, text]}

      when (text = @ss.scan(/==/))
         action {[:OP, text]}

      when (text = @ss.scan(/!=/))
         action {[:OP, text]}

      when (text = @ss.scan(/</))
         action {[:OP, text]}

      when (text = @ss.scan(/>/))
         action {[:OP, text]}

      when (text = @ss.scan(/<=/))
         action {[:OP, text]}

      when (text = @ss.scan(/>=/))
         action {[:OP, text]}

      when (text = @ss.scan(/,/))
         action {[:COMMA, text]}

      when (text = @ss.scan(/var/))
         action {[:VAR, text]}

      when (text = @ss.scan(/val/))
         action {[:VAL, text]}

      when (text = @ss.scan(/if/))
         action {[:IF, text]}

      when (text = @ss.scan(/else/))
         action {[:ELSE, text]}

      when (text = @ss.scan(/elsif/))
         action {[:ELSIF, text]}

      when (text = @ss.scan(/nil/))
         action {[:NIL, nil]}

      when (text = @ss.scan(/\w+/))
         action {[:SYM, text]}

      else
        text = @ss.string[@ss.pos .. -1]
        raise  ScanError, "can not match: '" + text + "'"
      end  # if

    else
      raise  ScanError, "undefined state: '" + state.to_s + "'"
    end  # case state
    token
  end  # def _next_token

    def tokenize(code)
        scan_setup(code)
        tokens = []
        while token = next_token
            tokens << token
        end
        tokens
    end
end # class
