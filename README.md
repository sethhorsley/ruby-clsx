# Clsx
## A gem for constructing HTML class strings conditionally

Ruby utility for constructing HTML class strings conditionally with the provided syntax, you can define a module named Clsx that includes a method to handle each case: strings, objects (hashes), arrays, and a combination of these with nested structures. This method will recursively process each argument, filter out falsy values, and concatenate the truthy values into a single string.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add "clsx"


## Usage
Strings (variadic)
```ruby
  clsx("foo", true && "bar", "baz")
  #=> "foo bar baz"
```

Objects
```ruby
  clsx({ foo:true, bar:false, baz:is_true? })
  #=> "foo baz"
```

Objects (variadic)
```ruby
  clsx({ foo:true }, { bar:false }, null, { "--foobar":"hello" })
  #=> "foo --foobar"
```

Arrays
```ruby
  clsx(["foo", 0, false, "bar"])
  #=> "foo bar"
```

Arrays (variadic)
```ruby
  clsx(["foo"], ["", 0, false, "bar"], [["baz", [["hello"], "there"]]])
  #=> "foo bar baz hello there"
```

Kitchen sink (with nesting)
```ruby
  clsx("foo", [1 && "bar", { baz:false, bat:null }, ["hello", ["world"]]], "cya")
  #=> "foo bar hello world cya"
```

You can also use clsx in Rails views like this:
```ruby
  <div class="<%= clsx({ 'border': true, "border-t": false, "border-b":true }) %>">
    <!-- ... -->
  </div>
```

### Using with Phlex

To use clsx in your Phlex components, include the helper module:

```ruby
class MyComponent < Phlex::HTML
  include Clsx::Phlex::Helper

  def view_template
    div(class: clsx("base-class", { active: @active, disabled: @disabled })) do
      h1 { "Hello World" }
    end
  end
end
```

Or include it in your base component to make it available everywhere:

```ruby
class ApplicationComponent < Phlex::HTML
  include Clsx::Phlex::Helper
end

class MyComponent < ApplicationComponent
  def view_template
    div(class: clsx("foo", { bar: true })) do
      # ...
    end
  end
end
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome. Just fork this repo make the changes you want and submit a pull request back to this repo :)

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Clsx project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/clsx/blob/main/CODE_OF_CONDUCT.md).
