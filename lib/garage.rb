class Garage

  attr_accessor :bikes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

    def initialize(capacity = DEFAULT_CAPACITY)
      @capacity = capacity
      @bikes = []
    end

  def fix
     @bikes.each { |bike| bike.broken = false }
  end

  def pickup(bike)
    @bikes << bike if bike != nil
  end

  def full?
    @bikes.size >= @capacity
  end

  def empty?
    @bikes.size == 0
  end

end
