require "emerald/version"

module Emerald
    class EmeraldREPL
        def initialize
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
            puts(" => #{input}")
        end
    end
end
