require "emerald/version"

module Emerald
    class EmeraldREPL
        def initialize
            repl = -> prompt do
                print prompt
                handle_input(gets.chomp!)
            end
            loop do
                repl[">> "]
            end
        end

        def handle_input(input)
            puts(" => #{input}")
        end
    end
end
