require_relative 'key.rb'
require_relative 'offset.rb'

class Enigma

  attr_reader :characters, :key, :date

  def initialize
    @characters = ["a", "b", "c", "d", "e", "f",
                    "g", "h", "i", "j", "k", "l",
                    "m", "n", "o", "p", "q", "r",
                    "s", "t", "u", "v", "w", "x",
                    "y", "z", "1", "2", "3", "4",
                    "5", "6", "7", "8", "9", "0",
                    " ", ".", "," ]
    @key = []
  end

  def encrypt(message, keyin, datein)
    # @message = message
    # @key = key.chars
    # @date = date

    key = Key.new(keyin)
    offset = Offset.new(datein)

    sliced_message = message.downcase.chars.each_slice(4).to_a
    sliced_message.map do |four_character_array|
      rotate(four_character_array)
    end.join
  end

  def turns
              #Have to change these to call the object attributes
             [(offset.nums[0] + key.nums[0]),
              (offset.nums[1] + key.nums[1]),
              (offset.nums[2] + key.nums[2]),
              (offset.nums[3] + key.nums[3])]
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
