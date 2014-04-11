class EmeraldLang
macro
    BLANK   [\ \t]+
    INT     \d+
    ADD     \+
    SUB     \-
    MUL     \*
    DIV     \/
    LPAREN  \(
    RPAREN  \)
    LBRACE  \{
    RBRACE  \}
    EQUAL   =
    CEQUAL  ==
    NEQUAL  !=
    LT      <
    GT      >
    LE      <=
    GE      >=

rule
    {BLANK}   # no action
    {INT}     {[:INT, text.to_i]}
    {ADD}     {[:ADD, text]}
    {SUB}     {[:SUB, text]}
    {MUL}     {[:MUL, text]}
    {DIV}     {[:DIV, text]}
    {LPAREN}  {[:LPAREN, text]}
    {RPAREN}  {[:RPAREN, text]}
    {LBRACE}  {[:LBRACE, text]}
    {RBRACE}  {[:RBRACE, text]}
    {EQUAL}   {[:EQUAL, text]}
    {CEQUAL}  {[:CEQUAL, text]}
    {NEQUAL}  {[:NEQUAL, text]}
    {LT}      {[:LT, text]}
    {GT}      {[:GT, text]}
    {LE}      {[:LE, text]}
    {GE}      {[:GE, text]}
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
