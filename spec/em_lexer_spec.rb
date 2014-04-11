require_relative "../lib/emerald/lexer"

class EmeraldLexerTester
    describe "Testing the lexer" do
        before do
            @emerald = EmeraldLang.new            
        end

        it "tests for integers" do
            result = @emerald.tokenize("234")
            result[0].should == 234
        end

        it "tests for unknown chars" do
            result = @emerald.tokenize("abc")
            result[0].should == "Unknown char"
        end
    end
end
