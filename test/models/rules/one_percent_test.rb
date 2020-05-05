require 'test_helper'

describe Rules::OnePercent do
  describe '#initialize' do
    it 'takes the property price and rental price' do
      property_price = Money.new(20_000_000)
      rental_price = Money.new(200_000)

      assert(
        Rules::OnePercent.new(property_price: property_price, rental_price: rental_price)
      )
    end

    it 'only takes Money objects as arguments' do
      assert_raises(ArgumentError) do
        Rules::OnePercent.new(property_price: 200_000, rental_price: 2_000)
      end
    end
  end

  describe '#pass?' do
    it 'returns true if the property and rental prices pass the check' do
      prop = Money.new(20_000_000)
      rent = Money.new(200_000)

      assert(Rules::OnePercent.new(property_price: prop, rental_price: rent).pass?)
    end

    it 'returns false if the property and rental prices fail the check' do
      prop = Money.new(20_000_000)
      rent = Money.new(100_000)

      refute(Rules::OnePercent.new(property_price: prop, rental_price: rent).pass?)
    end
  end
end
