require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma.rb'

class EnigmaTest < Minitest::Test
  def test_it_exists
    e = Enigma.new
    assert_instance_of Enigma, e
  end

  def test_it_has_arguments
    e = Enigma.new
    actual = e.characters[0]
    expected = "a"
    assert_equal expected, actual
  end

  def test_it_creates_turns
    e = Enigma.new
    e.encrypt("a dumb message", "12345", Date.new(2018,8,1))
    actual = e.turns
    expected = [13, 29, 34, 46]
    assert_equal expected, actual
  end

  def test_it_rotates
    e = Enigma.new
    e.encrypt("a dumb message", "12345", Date.new(2018,8,1))
    actual = e.rotate(["a", " ", "d", "u"])
    expected = ["n", "1", ".", "2"]
    assert_equal expected, actual
  end

  def test_it_encrypts
    e = Enigma.new
    actual = e.encrypt("a dumb message", "12345", Date.new(2018,8,1))
    expected = "n1.2z56zriiht8"
    assert_equal expected, actual
  end

  def test_it_encrypts_without_key_or_date
    skip
    e = Enigma.new
    actual = e.encrypt("a dumb message").length
    expected = 14
    assert_equal expected, actual
  end

  def test_it_decrypts
    e = Enigma.new
    actual = e.decrypt("n1.2z56zriiht8", "12345", Date.new(2018,8,1))
    expected = "a dumb message"
    assert_equal expected, actual
  end

  def test_it_decrypts_without_date
    e = Enigma.new
    actual = e.decrypt("twc26106xeehz4", "12345")
    expected = "a dumb message"
    assert_equal expected, actual
  end

end
