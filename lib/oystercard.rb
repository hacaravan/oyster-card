
class Oystercard

  LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(top_up_amount)
    raise "You cannot top up above £#{LIMIT}. You are at £#{@balance}" if @balance + top_up_amount > LIMIT
    @balance += top_up_amount
  end

  def deduct(deduct_amount)
    @balance -= deduct_amount
  end

end
