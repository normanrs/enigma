require_relative 'key.rb'
require_relative 'offset.rb'

class Enigma
  attr_reader :characters

  def initialize
    @characters = ["a", "b", "c", "d", "e", "f",
                    "g", "h", "i", "j", "k", "l",
                    "m", "n", "o", "p", "q", "r",
                    "s", "t", "u", "v", "w", "x",
                    "y", "z", "1", "2", "3", "4",
                    "5", "6", "7", "8", "9", "0",
                    " ", ".", "," ]
  end

  def encrypt(message, key_in = nil, date_in = nil)
    @message = message
    @key_in = key_in
    @date_in = date_in
    @neg = 1

    sliced_message = message.downcase.chars.each_slice(4).to_a
    sliced_message.map do |four_character_array|
      rotate(four_character_array)
    end.join
  end

  def decrypt(code, key_in, date_in = nil)
    @mcode = code
    @key_in = key_in
    @date_in = date_in
    @neg = -1

    sliced_code = code.downcase.chars.each_slice(4).to_a
    sliced_code.map do |four_character_array|
      rotate(four_character_array)
    end.join
  end

  def turns
    if @key_in == nil
      key = Key.new
    else
      key = Key.new(@key_in)
    end

    if @date_in == nil
      offset = Offset.new
    else
      offset = Offset.new(@date_in)
    end

    [(offset.nums[0] + key.nums[0]) * @neg,
    (offset.nums[1] + key.nums[1]) * @neg,
    (offset.nums[2] + key.nums[2]) * @neg,
    (offset.nums[3] + key.nums[3]) * @neg]
  end

  def rotate(array)
    quad_rotated = []
    array.each do |character|
      position = @characters.index("#{character}")
      rotated = @characters.rotate(turns[array.index("#{character}")])
      quad_rotated << rotated[position]
    end
    quad_rotated
  end

end
