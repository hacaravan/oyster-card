
class Oystercard

  LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "You cannot top up above £#{LIMIT}. You are at £#{@balance}" if @balance + amount > LIMIT
    @balance += amount
  end

end
