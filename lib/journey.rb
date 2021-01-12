class Journey

  attr_reader :entry_station, :exit_station

  def initialize
    @entry_station
    @exit_station
  end

  def start_journey(entry_station)
    @entry_station = entry_station
  end

  def end_journey(exit_station)
    @exit_station = exit_station
  end

end
