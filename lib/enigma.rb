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
    @key = key
    @date = date

  end


  def encrypt
# This will need to accept three arguments: a message, a key, and a date
# Key and date will need default values in case no argument is given
# Key default will be to generate a random key
# Date default will be Date.today

  end

  def date_squared
    day = Date.today.day.to_s.rjust(2, "0")
    # day will have to be changed to the instance variable
    # we create above, defaulting at Date.today
    month = Date.today.month.to_s.rjust(2, "0")
    date_int = (Date.today.year.to_s + month + day).to_i
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

  # def quad
  #   # Method to break message down into four-character array
  # end

  def rotations
    [     (offset[0] + key[0]),
          (offset[1] + key[1]),
          (offset[2] + key[2]),
          (offset[3] + key[3])
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
end
