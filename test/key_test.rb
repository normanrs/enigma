require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'

class KeyTest < Minitest::Test
  def test_it_exists
    key = Key.new(["1","2","3","4","5"])

    assert_instance_of Key, key
  end

  def test_it_can_generate_a_random_five_number_key_string
    key = Key.new
    assert_equal 5, key.random_key_number.length
  end

  def test_it_has_attribute
    key = Key.new(["1","2","3","4","5"])

    assert_equal ["1","2","3","4","5"], key.key_chars
  end

  def test_it_can_generate_key_a_through_key_d
    key = Key.new(["1","2","3","4","5"])

    assert_equal 12, key.key_a
    assert_equal 23, key.key_b
    assert_equal 34, key.key_c
    assert_equal 45, key.key_d
  end

  def test_it_can_create_key_offset_array_with_key_given
    key = Key.new("12345")


    assert_equal [12, 23, 34, 45], key.nums
  end

  def test_it_can_create_key_offset_array_without_key_given
    key = Key.new

    assert_equal 4, key.nums.length
  end
end
