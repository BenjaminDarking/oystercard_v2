# frozen_string_literal: true

class JourneyLog
  attr_reader :journeys :current_fare
  def initialize(journey_class)
    @journeys = []
    @journey_class = journey_class
    @current_journey = nil
    @current_fare = nil

  end

  def start(station = nil)
    current_journey
    finsh(station)
    @current_journey = journey_class.new(station)
  end

  def current_journey
    @current_journey ||= journey_class.new
  end

  def finish(station = nil)
    current_journey
    @current_journey.end_journey(station)
    @current_fare = @current_journey.fare
    store_and_reset
  end

  def store_and_reset
    @journeys << @current_journey
    @current_journey = nil
  end

end
