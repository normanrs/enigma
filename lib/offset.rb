class Offset
  attr_reader :date

	def initialize(date = Date.today)
	   @date = date
	end

  def date_squared
    day = @date.day.to_s.rjust(2, "0")
    month = @date.month.to_s.rjust(2, "0")
    date_int = (@date.year.to_s + month + day).to_i
    date_int ** 2
  end

  def nums
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
