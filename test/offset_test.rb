require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset.rb'

class OffsetTest < Minitest::Test
  def test_it_exists
    offset = Offset.new
    assert_instance_of Offset, offset
  end

  def test_it_defaults_today
    offset = Offset.new
    actual = offset.date.year
    expected = 2018
    assert_equal expected, actual
  end

  def test_it_accepts_date
    offset = Offset.new(Date.new(2018,8,1))
    actual = offset.date.day
    expected = 1
    assert_equal expected, actual
  end

  def test_it_can_square_date
    offset = Offset.new(Date.new(2018,8,1))
    actual = offset.date_squared
    expected = 407264729001601
    assert_equal expected, actual
  end

  def test_it_makes_offset_array
    offset = Offset.new(Date.new(2018,8,1))
    actual = offset.nums
    expected = [1, 6, 0, 1]
    assert_equal expected, actual
  end
end
