require_relative 'Journey'

class Oystercard
  attr_reader :balance
  attr_accessor :entry_station, :exit_station, :journeys, :trip
  MAX_BALANCE = 90


  def initialize
    @balance = 0
    @entry_station = entry_station
    @exit_station = exit_station
    @journeys = []
    @trip = {}
  end

  def top_up(amount)
    raise "Exceeded limit of #{MAX_BALANCE}" if @balance >= MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise 'Insufficient funds!' if @balance < Journey::MIN_FARE
    @entry_station = station
    @trip[:entry_station] = station
  end

  def touch_out(station)
    deduct(Journey::MIN_FARE)
    @entry_station = nil
    @exit_station = station
    @trip[:exit_station] = station
    @journeys << @trip
  end

  def in_journey?
    !(!entry_station)
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
