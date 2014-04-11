# Emerald

Emerald is a simple programming language inspired by Ruby and C. It is written
in Ruby, using `rex` and `racc` to generate the grammer and parser. It combines
the expressiveness of Ruby with the (in my opinion) easier on the eyes syntax
of C.

#### Note

Emerald is pre-alpha, and nothing works (yet).

## Installation

Add this line to your application's Gemfile:

    gem 'emerald'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install emerald

## Usage

Here is what I'd like Emerald to look like

    // This is an Emerald comment
    ### This is also an Emerald comment,
        but will be a comment until another
        three octothorpes are encountered ###
    val x = 3; // Immutable
    var y = 4; // Mutable
    y = 5;     // Ok
    x = 5;     // NOT Ok

    def fib(n) {
        if (n < 3) {
            // Explicit returns are OK, but not required
            return 1;
        } else {
            return fib(n - 1) + fib(n - 2);
        }
    }

    // Another way to define a function
    val hello_world = func(name) { print("Hello, #{name}"); }
    hello_world("Bryce"); // #=> Hello, Bryce

    val test = true;
    // Everything is an expression, and therefore
    // has to return a value
    val result = if (test) { 1 } else { 0 };

## Contributing

1. Fork it ( https://github.com/mahimahi42/emerald/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
