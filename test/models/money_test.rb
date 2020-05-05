require 'test_helper'

describe Money do
  describe '#initialize' do
    it 'takes an integer value' do
      assert(Money.new(1_000))
      assert_raises(ArgumentError) { Money.new('1_000') }
      assert_raises(ArgumentError) { Money.new(1.0) }
    end

    it 'stores internal value as cents' do
      assert_instance_of(Integer, Money.new(1_000).cents)
    end
  end

  describe '#value' do
    it 'returns the decimal value' do
      assert_equal(10.0, Money.new(1_000).value)
      assert_equal(12.34, Money.new(1_234).value)
      assert_equal(0.55, Money.new(55).value)
    end
  end

  describe 'math operations' do
    describe '#+' do
      before do
        @result = Money.new(1832) + Money.new(234)
      end

      it 'returns a money object when added' do
        assert_instance_of(Money, @result)
      end

      it 'correctly adds values' do
        assert_equal(20.66, @result.value)
      end

      it 'only adds money objects' do
        assert_raises(ArgumentError) do
          Money.new(1_000) + 5
        end
      end
    end

    describe '#-' do
      before do
        @result = Money.new(1832) - Money.new(234)
      end

      it 'returns a money object when subtracted' do
        assert_instance_of(Money, @result)
      end

      it 'correctly subtracts values' do
        assert_equal(15.98, @result.value)
      end

      it 'only subtracts money objects' do
        assert_raises(ArgumentError) do
          Money.new(1_000) - 5
        end
      end
    end

    describe '#*' do
      before do
        @result = Money.new(1832) * 5
      end

      it 'returns a money object when multiplied' do
        assert_instance_of(Money, @result)
      end

      it 'correctly multiplies values' do
        assert_equal(91.6, @result.value)
      end

      it 'multiplies by float values' do
        assert_equal(3.09, (Money.new(1234) * 0.25).value)
      end

      it 'only multiplies numbers' do
        assert_raises(ArgumentError) do
          Money.new(1_000) * Money.new(5)
        end
      end
    end

    describe '#/' do
      before do
        @result = Money.new(1832) / 2
      end

      it 'returns a money object when divided' do
        assert_instance_of(Money, @result)
      end

      it 'correctly divides values' do
        assert_equal(9.16, @result.value)
      end

      it 'divides by float values' do
        assert_equal(49.36, (Money.new(1234) / 0.25).value)
      end

      it 'only divides numbers' do
        assert_raises(ArgumentError) do
          Money.new(1_000) / Money.new(5)
        end
      end
    end
  end
end
