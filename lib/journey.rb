require_relative 'oystercard'

class Journey

  attr_reader :entry_station, :exit_station

  def initialize
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def start_journey(station)
    @entry_station = station
  end

  def end_journey(station)
    @exit_station = station
  end


end
