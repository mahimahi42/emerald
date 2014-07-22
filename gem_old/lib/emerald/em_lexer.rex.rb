class EmeraldLang
macro
    BLANK   [\ \t\n]+
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
    VAR     var
    VAL     val
    IF      if
    ELSE    else
    ELSIF   elsif
    NIL     nil
    SYM     \w+

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
    {VAR}     {[:VAR, text]}
    {VAL}     {[:VAL, text]}
    {IF}      {[:IF, text]}
    {ELSE}    {[:ELSE, text]}
    {ELSIF}   {[:ELSIF, text]}
    {NIL}     {[:NIL, nil]}
    {SYM}     {[:SYM, text]}
    #.         {"Unknown char"}

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
