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

end
