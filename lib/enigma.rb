class Enigma
  attr_reader :characters, :key_code, :date

  def initialize
    @characters = ["a", "b", "c", "d", "e", "f",
                    "g", "h", "i", "j", "k", "l",
                    "m", "n", "o", "p", "q", "r",
                    "s", "t", "u", "v", "w", "x",
                    "y", "z", "1", "2", "3", "4",
                    "5", "6", "7", "8", "9", "0",
                    " ", ".", "," ]
    @key_code = []
    @date = date
  end

  def encrypt(message, key = random_key_number, date = Date.today)
    @key_code = key.chars
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

  def random_key_number
    key_code = []
    randomized_number = rand(00000..99999).to_s.rjust(5, '0').chars

    4.times do |index|
      key_code << (randomized_number[index] + randomized_number[index + 1]).to_i
    end
    key_code
  end

  def key_a
    a = @key_code[0].to_s + @key_code[1].to_s
    a.to_i
  end

  def key_b
    b = @key_code[0].to_s + @key_code[1].to_s
    b.to_i
  end

  def key_c
    c = @key_code[0].to_s + @key_code[1].to_s
    c.to_i
  end

  def key_d
    d = @key_code[0].to_s + @key_code[1].to_s
    d.to_i
  end
end
