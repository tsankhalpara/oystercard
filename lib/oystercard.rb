class Oystercard

  attr_reader :balance, :entry_station, :exit_station

  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def top_up(amount)
    raise "Exceeded limit of #{MAX_BALANCE}" if @balance >= MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise 'Insufficient funds!' if @balance < MIN_FARE
    @entry_station = station
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @entry_station = nil
    @exit_station = station
  end

  def in_journey?
    !(!entry_station)
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
