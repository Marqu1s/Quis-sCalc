module Rules
  class OnePercent
    def initialize(property_price:, rental_price:)
      unless property_price.is_a?(Money) && rental_price.is_a?(Money)
        raise(ArgumentError, 'must be Money objects')
      end

      @property_price = property_price
      @rental_price = rental_price
    end

    def pass?
      rental >= one_percent_of_property
    end

    private

    attr_reader :property_price, :rental_price

    def rental
      rental_price.cents
    end

    def one_percent_of_property
      (property_price * 0.01).cents
    end
  end
end
