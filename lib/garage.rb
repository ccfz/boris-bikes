class Garage

  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def fix
     @bikes.each { |bike| bike.broken = false }
  end

end
