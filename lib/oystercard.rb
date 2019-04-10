class Oystercard

  attr_reader :balance

  MAX_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Exceeded limit of #{MAX_BALANCE}" if @balance >= MAX_BALANCE
    @balance += amount
    return "Your card has a balance of £#{@balance}"
  end

end
