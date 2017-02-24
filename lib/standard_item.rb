require_relative 'item.rb'

class StandardItem < Item
  QUALITY_DELTA = 1
  SELL_IN_DELTA = 1
  SELL_IN_BELOW_ZERO_QUALITY_DELTA = 2

  def update_quality
    update_sell_in
    affect_quality(QUALITY_DELTA) if quality_value_greater_than_zero? && sell_in_greater_than_zero?
    affect_quality(SELL_IN_BELOW_ZERO_QUALITY_DELTA) if quality_value_greater_than_zero? && !sell_in_greater_than_zero?
  end

  def update_sell_in
    @sell_in -= SELL_IN_DELTA
  end

  def affect_quality(value)
    @quality -= value
  end

  def quality_value_greater_than_zero?
    @quality > 0
  end

  def sell_in_greater_than_zero?
    @sell_in > 0
  end

end
