class Oystercard

  attr_reader :balance, :in_journey

  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Exceeded limit of #{MAX_BALANCE}" if @balance >= MAX_BALANCE
    @balance += amount
    return "Your card has a balance of £#{@balance}"
  end

  def touch_in
    raise 'Insufficient funds!' if @balance < MIN_FARE
    @in_journey = true
  end

  def touch_out
    deduct(MIN_FARE)
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
