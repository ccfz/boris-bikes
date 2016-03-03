class Van
  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def load(bike)
    @bikes += bike
  end

  def deliver
    @bikes.pop(@bikes.count)
  end

end
