require 'pry'
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

  def encrypt(message, key = random_key_number, date = Date.today)
    @key = key.chars
    @date = date

    rotations
    require "pry"; binding.pry
    # message_arrays = slice_four(message)
    # translated_array = translate_array(message_arrays)


  end

  def random_key_number
    randomized_number = rand(00000..99999).to_s.rjust(5, '0')
  end

  def key_a
    a = @key[0] + @key[1]
    a.to_i
  end

  def key_b
    b = @key[1] + @key[2]
    b.to_i
  end

  def key_c
    c = @key[2] + @key[3]
    c.to_i
  end

  def key_d
    d = @key[3] + @key[4]
    d.to_i
  end

  def date_squared
    day = @date.day.to_s.rjust(2, "0")
    month = @date.month.to_s.rjust(2, "0")
    date_int = (@date.year.to_s + month + day).to_i
    date_int ** 2
  end

  def offset
    offset_array = []
    string = date_squared.to_s
    strip = string[-4..-1]
    characters = strip.chars
    characters.each do |x|
      offset_array << x.to_i
    end
    offset_array
  end

  def rotations
    [     (offset_array[0] + key_a),
          (offset_array[1] + key_b),
          (offset_array[2] + key_c),
          (offset_array[3] + key_d)
    ]
  end

  def rotate(quad, rotation)
    snip = quad.chars
    quad_rotated = []
    snip.each do |character|
      position = @characters.index("#{character}")
      rotated = @characters.rotate(rotation)
      quad_rotated << rotated[position]
    end
    quad_rotated
  end

  def slice_four(message)
    message.downcase.chars.each_slice(4).to_a
  end
end
