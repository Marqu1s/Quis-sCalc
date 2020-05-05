class Money
  attr_reader :cents

  def initialize(cents)
    raise(ArgumentError, 'must be integer value') unless cents.is_a?(Integer)

    @cents = cents
  end

  def value
    cents / 100.0
  end

  def +(other)
    raise(ArgumentError, 'must be another Money object') unless other.is_a?(Money)

    Money.new(cents + other.cents)
  end

  def -(other)
    raise(ArgumentError, 'must be another Money object') unless other.is_a?(Money)

    Money.new(cents - other.cents)
  end

  def *(other)
    unless [Integer, Float].include?(other.class)
      raise(ArgumentError, 'must be a number')
    end

    Money.new((cents * other).round)
  end

  def /(other)
    unless [Integer, Float].include?(other.class)
      raise(ArgumentError, 'must be a number')
    end

    Money.new((cents / other.to_f).round)
  end
end
