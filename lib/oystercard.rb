require 'money'
class Oystercard
attr_accessor :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(money)
    @balance += money
  end
end
