require 'java'
require "java_to_base64/version"
require 'i_can_has_java_class'

unless ::ICanHasJavaClass.java_class_defined?("org.apache.commons.codec.binary.Base64.encodeBase64URLSafeString")
  require 'java_to_base64/jars/commons-codec-1.9.jar'
end

module JavaToBase64
  def self.included(klass)
    unless klass.java_kind_of?(::Java::JavaIo::Serializable)
      warn <<-SERIALIZABLE
        To include JavaToBase64 in a Java class you must implement java.io.Serializable
      SERIALIZABLE
    end

    klass.class_eval do 
      include ::JavaToBase64::InstanceMethods
      extend ::JavaToBase64::ClassMethods
    end
  end

  module InstanceMethods
    def to_base64
      byte_array_output_stream = java.io.ByteArrayOutputStream.new
      object_output_stream = java.io.ObjectOutputStream.new(byte_array_output_stream)
      object_output_stream.write_object(self)
      bytes = byte_array_output_stream.to_byte_array

      return org.apache.commons.codec.binary.Base64.encodeBase64URLSafeString(bytes)
    end
  end

  module ClassMethods
    def from_base64(base64_string)
      decoded_form = org.apache.commons.codec.binary.Base64.decodeBase64(base64_string) 
      byte_array_input_stream = java.io.ByteArrayInputStream.new(decoded_form)
      # NOTE: JRuby ObjectInputStream https://github.com/ribrdb/jruby/commit/8ab064f4fffc86f89d5ceca1cbf29a6783b83802
      # Overrides the class loader to allow for JRuby objects to be deserialized correctly
      jruby_input_stream = org.jruby.util.JRubyObjectInputStream.new(::JRuby.runtime, byte_array_input_stream)

      return jruby_input_stream.read_object
    end
  end
end
