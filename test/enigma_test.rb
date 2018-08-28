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
    e.encrypt("a dumb message", "12345", Date.new(2018,8,1))
    actual = e.date_squared
    # expected must be changed to reflect current date
    expected = 407264729001601
    assert_equal expected, actual
  end

  def test_it_square_a_given_date
    e = Enigma.new
    e.encrypt("a dumb message", "12345", Date.new(2018,8,1))
    actual = e.date_squared
    # expected must be changed to reflect current date
    expected = 407264729001601
    assert_equal expected, actual
  end

  def test_it_can_generate_a_random_five_number_key_string
    e = Enigma.new
    assert_equal 5, e.random_key_number.length
  end

  def test_it_calculates_rotations
    e = Enigma.new
    actual = e.encrypt("a dumb message", "12345", Date.new(2018,8,1))
    expected = "n1.2z56zriiht8"
    assert_equal expected, actual
  end
end
