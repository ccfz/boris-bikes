class Bike
  attr_accessor :broken

  def initialize
    @broken = false
  end

  def working?
    @broken
  end

  def report_broken
    @broken = !@broken
  end

  def broken?
    @broken
  end
end
