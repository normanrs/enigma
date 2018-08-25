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
  end

  def date_squared
    day = Date.today.day.to_s.rjust(2, "0")
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
