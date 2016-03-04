class Bike

  def initialize
    @broken = false
  end

  def broken
    @broken = true
  end

  def working
    @broken = false
  end

  def status
    @broken
  end

end
