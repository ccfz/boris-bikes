require_relative "bike"

class DockingStation

  attr_accessor :capacity
  attr_reader :bikes
  attr_reader :broken_bike

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
    @broken_bike = []
  end

  def release_bike
    raise "No bikes available" if empty? || @bikes[-1].broken?
    @bikes.pop
  end

  def dock(bike, state)
    raise "The docking station is full" if full?
      bike.broken=state
    state== true ? (@broken_bike << bike) : (@bikes << bike)
    bike
  end

  def unload
  raise 'no broken bikes' if brokens_empty?
  @broken_bike.pop
  end

  # private

  def full?
    @bikes.size >= @capacity
  end

  def empty?
    @bikes.size == 0
  end

  def brokens_empty?
    @broken_bike.size == 0
  end

end
