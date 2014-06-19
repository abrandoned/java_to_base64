require 'spec_helper'

class Java::JavaLang::String
  include JavaToBase64
end

describe JavaToBase64 do

  it "adds to_base64 to an isntance" do
    Java::JavaLang::String.new().must_respond_to :to_base64
  end

  it "adds from_base64 to the class" do
    Java::JavaLang::String.must_respond_to :from_base64
  end

  it "serializes and deserializes back to the original" do
    string = ::Java::JavaLang::String.new("derp")
    new_string = ::Java::JavaLang::String.from_base64(string.to_base64)

    string.to_s.must_equal(new_string.to_s)
  end

end
