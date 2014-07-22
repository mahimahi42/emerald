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
            @result.should == 2
        end
        
        it "parses if exprs" do
            @result = @emerald.parse("if (2) { 4 }")
            @result.should == 4
        end
        
        it "parses if/else exprs" do
            @result = @emerald.parse("if nil { 4 } else { 5 }")
            @result.should == 5
        end

        it "parses if/elsif/else exprs" do
            @result = @emerald.parse("if nil { 4 } elsif 2 { 5 } else { 6 }")
            @result.should == 5
        end
    end
end
