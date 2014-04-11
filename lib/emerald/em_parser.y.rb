class EmeraldLang
rule
    expr : INT                { return val[0].to_i }
         | SYM                { return @global_env.lookup(val[0]) }
         | LPAREN expr RPAREN { return val[1] }
         | SYM EQUAL expr     { @global_env[val[0]] = val[2]; return @global_env }
         | expr OP expr       { return self.bin_op(val[0], val[1], val[2]) }
end

---- header
    require_relative "lexer"
    require_relative "../emerald"
    @global_env = Emerald::EmeraldEnvironment.new()

---- inner
    def parse(input)
        scan_str(input)
    end

    def bin_op(left, op, right)
        return eval("#{left} #{op} #{right}")
    end
