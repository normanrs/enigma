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
    actual = e.date_squared
    expected = 407265697680625
    assert_equal expected, actual
  end

  def test_it_creates_the_offset
    e = Enigma.new
    actual = e.offset
    expected = [0, 6, 2, 5]
    assert_equal expected, actual
  end


end
