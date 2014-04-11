class EmeraldLang
rule
    #value : INT ;

    #op : ADD
    #   | SUB
    #   | MUL
    #   | DIV
    #   | CEQUAL
    #   | NEQUAL
    #   | LT
    #   | GT
    #   | LE
    #   | GE ;

    expr : INT
         | INT OP INT         { return self.bin_op(val[0], val[1], val[2]) }
         | LPAREN expr RPAREN { return val[1] }

   #expression : INT 
   #     | INT ADD INT    { return val[0] + val[2] }
   #     | INT SUB INT    { return val[0] - val[2] }
   #     | INT MUL INT    { return val[0] * val[2] }
   #     | INT DIV INT    { if val[2] == 0
   #                                return 0
   #                            else
   #                                return val[0] / val[2] 
   #                            end }
   #     | LPAREN expression RPAREN { return val[1] }
end

---- header
    require_relative "lexer"

---- inner
    def parse(input)
        scan_str(input)
    end

    def bin_op(left, op, right)
        case op
            when "+"
                return left + right
            when "-"
                return left - right
            when "*"
                return left * right
            when "/"
                return left / right unless right == 0
                return 0
            when "=="
                return left == right
            when "!="
                return left != right
            when "<"
                return left < right
            when ">"
                return left > right
            when "<="
                return left <= right
            when ">="
                return left >= right
            else
                return nil
        end
    end
