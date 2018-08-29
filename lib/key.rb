class Key
  attr_reader :key_chars

  def initialize(key_chars = random_key_number)
    @key_chars = key_chars
  end

  def random_key_number
    randomized_number = rand(00000..99999).to_s.rjust(5, '0')
  end

  def key_a
    a = @key_chars[0] + @key_chars[1]
    a.to_i
  end

  def key_b
    b = @key_chars[1] + @key_chars[2]
    b.to_i
  end

  def key_c
    c = @key_chars[2] + @key_chars[3]
    c.to_i
  end

  def key_d
    d = @key_chars[3] + @key_chars[4]
    d.to_i
  end

  def nums
    [key_a, key_b, key_c, key_d]
  end
end
