require "./lib/emerald/lexer"

class EmeraldLexerTester
    describe "Testing the lexer" do
        before do
            @emerald = EmeraldLang.new            
        end

        it "tests for integers" do
            result = @emerald.tokenize("234")
            result[0][0].should == :INT
            result[0][1].should == 234
        end

        it "tests for multitoken inputs" do
            result = @emerald.tokenize("2 + 2")
            result[0][0].should == :INT
            result[0][1].should == 2
            result[1][0].should == :OP
            result[1][1].should == "+"
            result[2][0].should == :INT
            result[2][1].should == 2
        end

        it "ignores whitespace" do
            result = @emerald.tokenize("        ")
            result[0].should == nil
        end

        it "handles commas" do
            result = @emerald.tokenize(",")
            result[0][0].should == :COMMA
            result[0][1].should == ","
        end

        it "handles comma separated values" do
            result = @emerald.tokenize("2,2")
            result[0].should == [:INT, 2]
            result[1].should == [:COMMA, ","]
            result[2].should == [:INT, 2]
        end

        it "handles symbols" do
            result = @emerald.tokenize("derp")
            result[0].should == [:SYM, "derp"]
        end

        it "handles if exprs" do
            result = @emerald.tokenize("if (2) { 4 }")
            result[0].should == [:IF, "if"]
            result[1].should == [:LPAREN, "("]
            result[2].should == [:INT, 2]
            result[3].should == [:RPAREN, ")"]
            result[4].should == [:LBRACE, "{"]
            result[5].should == [:INT, 4]
            result[6].should == [:RBRACE, "}"]
        end

        it "handles if/else exprs" do
            result = @emerald.tokenize("if nil { 4 } else { 5 }")
            result[0].should == [:IF, "if"]
            result[1].should == [:NIL, nil]
            result[2].should == [:LBRACE, "{"]
            result[3].should == [:INT, 4]
            result[4].should == [:RBRACE, "}"]
            result[5].should == [:ELSE, "else"]
            result[6].should == [:LBRACE, "{"]
            result[7].should == [:INT, 5]
            result[8].should == [:RBRACE, "}"]
        end

        it "handles if/elsif/else exprs" do
            result = @emerald.tokenize("if nil {4} elsif 1 {5} else {6}")
            result[0].should == [:IF, "if"]
            result[1].should == [:NIL, nil]
            result[2].should == [:LBRACE, "{"]
            result[3].should == [:INT, 4]
            result[4].should == [:RBRACE, "}"]
            result[5].should == [:ELSIF, "elsif"]
            result[6].should == [:INT, 1]
            result[7].should == [:LBRACE, "{"]
            result[8].should == [:INT, 5]
            result[9].should == [:RBRACE, "}"]
            result[10].should == [:ELSE, "else"]
            result[11].should == [:LBRACE, "{"]
            result[12].should == [:INT, 6]
            result[13].should == [:RBRACE, "}"]
        end
    end
end
