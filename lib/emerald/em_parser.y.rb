class EmeraldLang
rule
   expression : INT 
        | INT ADD INT    { return val[0] + val[2] }
        | INT SUB INT    { return val[0] - val[2] }
        | INT MUL INT    { return val[0] * val[2] }
        | INT DIV INT    { if val[2] == 0
                                   return 0
                               else
                                   return val[0] / val[2] 
                               end } ;
end

---- header
    require_relative "lexer"

---- inner
    def parse(input)
        scan_str(input)
    end
