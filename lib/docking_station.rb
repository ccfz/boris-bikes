require_relative "bike"

class DockingStation

  attr_accessor :capacity
  attr_reader :bikes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
    @broken_bikes = []
  end

  def release_bike
    raise "No bikes available" if empty? || @bikes[-1].broken?
    @bikes.pop
  end

  def dock(bike, state)
    raise "The docking station is full" if full?
    bike.broken= state
    if state == true
      @broken_bikes << bike
    else
      @bikes << bike
    end
    bike
  end

  def broken_bikes
    @broken_bikes
  end

  private

  def full?
    @bikes.size >= @capacity
  end

  def empty?
    @bikes.size == 0
  end

end
