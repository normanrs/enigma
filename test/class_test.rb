require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require 'simplecov'
require './lib/morse_translator.rb'

SimpleCov.start

class ClassFile < Minitest::Test
  def test_it_exists
    class_file = ClassFile.new
    assert_instance_of ClassFile, class_file
  end

  def test_method
    class_file = ClassFile.new
    actual = class_file.method("hello world")
    expected = "......-...-..--- .-----.-..-..-.."
    assert_equal expected, actual
  end

end
