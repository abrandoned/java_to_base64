# JavaToBase64

I got tired of writing the apache commons base64 serializer/deserializer into each app that I need to serialize
raw Java objects into some type of database/cache. If you include `JavaToBase64` into a Java class it will then
respond to `to_base64` (which is URL safe) and the class will respond to `from_base64`.

As long as the java class implements serializable all will be well with the world.

This gem has it's own version of apache commons codec, but if you have another version already loaded it will
not load the packaged version (through the use of `i_can_has_java_class`)

## Installation

Add this line to your application's Gemfile:

    gem 'java_to_base64'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install java_to_base64

## Usage

```ruby
  require 'java_to_base64'

  class Java::JavaLang::String
    include JavaToBase64
  end

  string = ::Java::JavaLang::String.new("derp")
  new_string = ::Java::JavaLang::String.from_base64(string.to_base64)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
