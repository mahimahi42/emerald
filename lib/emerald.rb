require "emerald/version"
require_relative "emerald/parser"

module Emerald
    class EmeraldREPL
        def initialize
            @emerald = EmeraldLang.new()
            puts "Welcome to the Emerald REPL v#{Emerald::VERSION}\n\n"
            repl = -> prompt do
                print prompt
                handle_input(gets.chomp!)
            end
            loop do
                repl[">> "]
            end
        end

        def handle_input(input)
            if input.eql? "quit_repl"
                abort("Goodbye!")
            end
            puts(" => #{@emerald.parse(input)}")
        end
    end

    class EmeraldEnvironment < Hash
        attr_accessor :parent
        
        def initialize(parent = {})
            @parent = parent
        end

        def lookup(var)
            self.fetch(var)
        end
    end
end
