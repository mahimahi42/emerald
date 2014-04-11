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
    end
end
