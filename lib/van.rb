# class Van
#   attr_reader :bikes
#
#   def initialize
#     @bikes = []
#   end
#
#   def station_pickup(station)
#     station.bikes.each {|bike| @bikes << bike if bike.broken?}
#     station.bikes.delete_if {|bike| bike.broken?}
#     @bikes
#   end
#
#   def dropoff(garage)
#     garage.bikes = @bikes
#     @bikes = []
#   end
#
#   def garage_pickup(garage)
#     @bikes << garage.bikes
#   end
#
# end
class Van

attr_accessor :storage
attr_accessor :capacity
DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @storage = []
    @capacity = capacity
  end

  def pickup(bike)
    @storage << bike if bike != nil

  end


  # private

  def full?
    @storage.size >= @capacity
  end

  def empty?
    @storage.size == 0
  end


end
