class EmeraldLang
rule
    expr : INT                  { return val[0].to_i }
         | SYM                  { res = @global_env.lookup(val[0])
                                  if res.nil?
                                      return val[0]
                                  else
                                      return res.value 
                                  end }
         | NIL                  { return nil }
         | LPAREN expr RPAREN   { return val[1] }
         | VAR SYM EQUAL expr   { obj = self.make_new_value(val[3])
                                  self.add_to_global_env(val[1], obj)
                                  return val[3] }
         | SYM EQUAL expr       { obj = self.make_new_value(val[2])
                                  self.add_to_global_env(val[0], obj)
                                  return val[2] }
         | expr OP expr         { return self.bin_op(val[0], val[1], val[2]) }
         | IF expr LBRACE expr RBRACE { if val[1]
                                            return val[3]
                                        end }
         | IF expr LBRACE expr RBRACE ELSE LBRACE expr RBRACE { if val[1]
                                                                 return val[3]
                                                                else
                                                                 return val[7]
                                                                end } 
         | IF expr LBRACE expr RBRACE ELSIF expr LBRACE expr RBRACE ELSE LBRACE expr RBRACE { if val[1]
                                                                                               return val[3]
                                                                                              elsif val[6]
                                                                                               return val[8]
                                                                                              else
                                                                                               return val[12]
                                                                                              end }
end

---- header
    require_relative "lexer"
    require_relative "../emerald"

---- inner
    def initialize
        @global_env = Emerald::EmeraldEnvironment.new()
    end

    def parse(input)
        scan_str(input)
    end

    def make_new_value(value)
        return Emerald::EmeraldValue.new(value)
    end

    def add_to_global_env(key, value)
        @global_env[key] = value
    end

    def bin_op(left, op, right)
        return eval("#{left} #{op} #{right}")
    end
