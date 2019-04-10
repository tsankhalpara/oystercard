class Oystercard

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    @balance += amount
    return "Your card has a balance of £#{@balance}"
  end

end
