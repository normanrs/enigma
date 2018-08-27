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

  def test_it_can_accept_a_key
    e = Enigma.new

    assert_equal
  end

  def test_it_square_todays_date
    skip
    e = Enigma.new
    actual = e.date_squared
    # expected must be changed to reflect current date
    expected = 407265697680625
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

  def test_it_can_generate_a_random_five_number_key_string
    e = Enigma.new

    assert_equal 5, e.random_key_number.length
  end

  # def test_it_can_generate_key_a
  #   e = Enigma
  #   e.encrypt("test", "12345", Date.new(1993, 4, 10))
  #
  #   assert_equal 12, e.key_a
  #   assert_instance_of Integer, e.key_a
  # end
end
