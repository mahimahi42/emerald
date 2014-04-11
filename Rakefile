require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new do |c|
    options = ["--color"]
    options += ["--format", "documentation"]
    c.rspec_opts = options
end

desc "Generate lexer"
task :lexer do
    `rex lib/emerald/em_lexer.rex.rb -o lib/emerald/lexer.rb`
end

desc "Generate parser"
task :parser do
    `racc lib/emerald/em_parser.y.rb -o lib/emerald/parser.rb`    
end

desc "Generate lexer and parser"
task :gen => [:lexer, :parser]
