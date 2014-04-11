class EmeraldLang
macro
    BLANK   [\ \t]+
    INT     \d+
    ADD     \+
    SUB     \-
    MUL     \*
    DIV     \/

rule
    {BLANK}   # no action
    {INT}     {[:INT, text.to_i]}
    {ADD}     {[:ADD, text]}
    {SUB}     {[:SUB, text]}
    {MUL}     {[:MUL, text]}
    {DIV}     {[:DIV, text]}
    .         {"Unknown char"}

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
