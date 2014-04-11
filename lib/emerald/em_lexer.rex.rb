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
    COMMA   ,

rule
    {BLANK}   # no action
    {INT}     {[:INT, text.to_i]}
    {ADD}     {[:OP, text]}
    {SUB}     {[:OP, text]}
    {MUL}     {[:OP, text]}
    {DIV}     {[:OP, text]}
    {LPAREN}  {[:LPAREN, text]}
    {RPAREN}  {[:RPAREN, text]}
    {LBRACE}  {[:LBRACE, text]}
    {RBRACE}  {[:RBRACE, text]}
    {EQUAL}   {[:EQUAL, text]}
    {CEQUAL}  {[:OP, text]}
    {NEQUAL}  {[:OP, text]}
    {LT}      {[:OP, text]}
    {GT}      {[:OP, text]}
    {LE}      {[:OP, text]}
    {GE}      {[:OP, text]}
    {COMMA}   {[:COMMA, text]}
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
