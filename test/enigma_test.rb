require 'simplecov'
SimpleCov.start

require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma.rb'

class EnigmaTest < Minitest::Test
  def test_it_exists
    e = Enigma.new
    assert_instance_of Enigma, e
  end

  def test_it_square_todays_date
    e = Enigma.new
    e.encrypt("test")
    actual = e.date_squared
    # expected must be changed to reflect current date
    expected = 407265778403929
    assert_equal expected, actual
  end

  def test_it_square_a_given_date
    e = Enigma.new
    e.encrypt("test", 12345, Date.new(2018,8,1))
    actual = e.date_squared
    # expected must be changed to reflect current date
    expected = 407264729001601
    assert_equal expected, actual
  end

  def test_it_creates_the_offset
    skip
    e = Enigma.new
    actual = e.offset
    # expected must be changed to reflect current date
    expected = [0, 6, 2, 5]
    assert_equal expected, actual
  end

  def test_it_rotates
    e = Enigma.new
    actual = e.rotate("ab", 5)
    expected = ["f", "g"]
    assert_equal expected, actual
  end

  def test_it_can_generate_random_key_array
    e = Enigma.new

    assert_equal 4, e.random_key_number.length
    assert_instance_of Array, e.key
  end

  # def test_it_can_generate_key_a
  #   e = Enigma
  #   e.encrypt("test", "12345", Date.new(1993, 4, 10))
  #
  #   assert_equal 12, e.key_a
  #   assert_instance_of Integer, e.key_a
  # end
end
