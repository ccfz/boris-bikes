
class Van

attr_accessor :storage
attr_accessor :capacity
DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @storage = []
    @capacity = capacity
  end

  def pickup(bike)
    raise if full? 
    @storage << bike 
  end

  def unload
    @storage.pop
  end

private

  def full?
    @storage.size >= @capacity
  end

  def empty?
    @storage.size == 0
  end


end
