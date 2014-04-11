#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.11
# from Racc grammer file "".
#

require 'racc/parser.rb'

    require_relative "lexer"
    require_relative "../emerald"

class EmeraldLang < Racc::Parser

module_eval(<<'...end em_parser.y.rb/module_eval...', 'em_parser.y.rb', 20)
    def initialize
        @global_env = Emerald::EmeraldEnvironment.new()
    end

    def parse(input)
        scan_str(input)
    end

    def bin_op(left, op, right)
        return eval("#{left} #{op} #{right}")
    end
...end em_parser.y.rb/module_eval...
##### State transition tables begin ###

racc_action_table = [
     5,    12,     9,     6,     2,     3,     4,     6,     2,     3,
     4,     2,     3,     4,     2,     3,     4,     7,     6,     6 ]

racc_action_check = [
     1,     8,     5,     8,     0,     0,     0,     1,     4,     4,
     4,     7,     7,     7,     6,     6,     6,     3,    10,    11 ]

racc_action_pointer = [
     2,     0,   nil,    11,     6,     2,    12,     9,    -4,   nil,
    11,    12,   nil ]

racc_action_default = [
    -6,    -6,    -1,    -2,    -6,    -6,    -6,    -6,    -6,    13,
    -5,    -4,    -3 ]

racc_goto_table = [
     1,   nil,   nil,   nil,     8,   nil,    10,    11 ]

racc_goto_check = [
     1,   nil,   nil,   nil,     1,   nil,     1,     1 ]

racc_goto_pointer = [
   nil,     0 ]

racc_goto_default = [
   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 9, :_reduce_1,
  1, 9, :_reduce_2,
  3, 9, :_reduce_3,
  3, 9, :_reduce_4,
  3, 9, :_reduce_5 ]

racc_reduce_n = 6

racc_shift_n = 13

racc_token_table = {
  false => 0,
  :error => 1,
  :INT => 2,
  :SYM => 3,
  :LPAREN => 4,
  :RPAREN => 5,
  :EQUAL => 6,
  :OP => 7 }

racc_nt_base = 8

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "INT",
  "SYM",
  "LPAREN",
  "RPAREN",
  "EQUAL",
  "OP",
  "$start",
  "expr" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'em_parser.y.rb', 2)
  def _reduce_1(val, _values, result)
     return val[0].to_i 
    result
  end
.,.,

module_eval(<<'.,.,', 'em_parser.y.rb', 3)
  def _reduce_2(val, _values, result)
     res = @global_env.lookup(val[0])
                                if res.nil?
                                    return val[0]
                                else
                                    return res 
                                end 
    result
  end
.,.,

module_eval(<<'.,.,', 'em_parser.y.rb', 9)
  def _reduce_3(val, _values, result)
     return val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'em_parser.y.rb', 10)
  def _reduce_4(val, _values, result)
     @global_env[val[0]] = val[2]; return @global_env 
    result
  end
.,.,

module_eval(<<'.,.,', 'em_parser.y.rb', 11)
  def _reduce_5(val, _values, result)
     return self.bin_op(val[0], val[1], val[2]) 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

end   # class EmeraldLang
