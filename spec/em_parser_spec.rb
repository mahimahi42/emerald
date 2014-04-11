require "./lib/emerald/parser"

class EmeraldParserTester
    describe "Testing the parser" do
        before do
            @emerald = EmeraldLang.new
        end

        it "parses digits" do
            @result = @emerald.parse("2")
            @result.should == 2
        end

        it "parses calculations" do
            @result = @emerald.parse("2 + 2")
            @result.should == 4
        end

        it "parses expressions in parens" do
            @result = @emerald.parse("(2 + 2)")
            @result.should == 4
        end

        it "parses mutable assignment" do
            @result = @emerald.parse("var x = 2")
            @result["x"].should == 2
        end
    end
end
