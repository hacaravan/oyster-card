class Oystercard

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  attr_reader :balance, :entry_station, :exit_station, :journey_list, :journey

  def initialize
    @balance = 0
    @entry_station
    @exit_station
    @journey
    @journey_list = []
  end

  def top_up(top_up_amount)
    raise "You cannot top up above £#{MAX_BALANCE}. You are at £#{@balance}" if @balance + top_up_amount > MAX_BALANCE
    @balance += top_up_amount
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(station)
    raise "Insufficient funds to touch in. You need at least £#{MIN_BALANCE} and you have £#{@balance}" if @balance < MIN_BALANCE
    @entry_station = station
    station
  end

  def touch_out(exit_station)
    @exit_station = exit_station
    update_journey_list
    @entry_station = nil
    deduct(MIN_BALANCE)
  end

  private

  def update_journey_list
    @journey = {entry_station: @entry_station,
              exit_station: @exit_station}
    @journey_list << @journey
  end

  def deduct(deduct_amount)
    @balance -= deduct_amount
  end

end
