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
    end
end
