
class Garage

  attr_accessor :storage

  def initialize
    @storage = []
  end

  def broken_bikes(bikes)
   @storage += bikes
  end

  def fixed_bikes 
    storage.each do |bike|
      bike.working=(true)
    end
  end

end