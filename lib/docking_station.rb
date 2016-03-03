require_relative 'bike'

class DockingStation
Default_capacity = 20
  attr_accessor :Default_capacity, :capacity, :broken_bikes


  def initialize(capacity=Default_capacity)
  @capacity = capacity
  @docked_bikes = []
  @broken_bikes = []
  end



  def release_bike
    if empty?
      raise "no bikes available"
    else
      @docked_bikes.pop
    end
  end

  def dock(bike_name, *status)
    raise "station is full" if full?

    if status.first == 'broken'
      bike_name.working=false
      @broken_bikes << bike_name
    else
      @docked_bikes << bike_name
    end

    bike_name
  end

  def dock_status
    @docked_bikes == 0 ? "empty" : "#{@docked_bikes.length} bikes"
  end

  def bike
    @docked_bikes.last
  end

  private

  def full?
    @docked_bikes.length == @capacity ? true : false
  end

  def empty?
    @docked_bikes.length == 0
  end
end
