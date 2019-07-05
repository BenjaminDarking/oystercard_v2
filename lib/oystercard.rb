# frozen_string_literal: true

require 'pry'

class Oystercard
  DEFAULT_MAX_BALANCE = 90

  def initialize(balance = 0, max_balance = DEFAULT_MAX_BALANCE)
    @balance = balance
    @max_balance = max_balance
    @variable_journey_log = JourneyLog.new(Journey.new)
  end

  def top_up(amount)
    raise 'Max top up allowed is £90. Please select different amount' if above_max(amount) # amount + balance > DEFAULT_MAX_BALANCE

    @balance += amount
  end

  def touch_in(station)
    check_sufficient_funds
    @variable_journey_log.start(station)
  end

  def touch_out(station)
    variable_journey_log.finish(station)
    deduct(variable_journey_log.current_fare)
  end

  def check_sufficient_funds
    raise 'Insufficient funds - please top up' if @balance < MINIMUM_FARE # balance also works here
  end

  private

  def above_max(amount)
    amount + @balance > DEFAULT_MAX_BALANCE # also works with balance
  end

  def deduct(fare)
    @balance -= fare
  end
end

# binding.pry
