require_relative 'oystercard'

class Journey

  attr_accessor :entry_station, :exit_station, :trip

  def initialize
    @entry_station = entry_station
    @exit_station = exit_station
    @trip = {}
  end

  def start_journey(station)
    @entry_station = station
    @trip[:entry_station] = station
  end

  def end_journey(station)
    @exit_station = station
    @trip[:exit_station] = station
  end

  def completed_journey?
    @trip[:entry_station] != nil && @trip[:exit_station] != nil
  end


end
