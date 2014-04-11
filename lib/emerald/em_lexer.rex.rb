class EmeraldLang
rule
    \d+     { return text.to_i }
    .       { return "Unknown char" }

inner
def tokenize(code)
    scan_setup(code)
    tokens = []
    while token = next_token
        tokens << token
    end
    tokens
end
end
