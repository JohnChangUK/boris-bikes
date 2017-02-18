require './lib/bike'

class DockingStation
  attr_reader :bike_station
  attr_accessor :capacity

  CAPACITY = 20

  def initialize(capacity = CAPACITY)
    @capacity = capacity
    @bike_station = []
  end

  def release_bike
    # In order to get the bike back from the dock,
    # We initialized bike in the dock method to an instance bike method. @bike
    # So now, we can get the bike from the dock and finally RELEASE IT, because we got the bike from the dock method
  # fail 'No Bikes Available' unless @bike
  # @bike

  raise 'No bikes left' if empty?

  pop_working_bike

#   @bike_station.each do |bike|
#     if bike.working == true
#       @bike_station.delete(bike)
#     else
#   raise 'No working bikes'
# end
# end
end

  def dock(bike)
    #We create a new instance of the bike class
    #bike = Bike.new
    #when we call station.dock(bike), the new instance bike gets passed as an argument
    #we want station.release_bike to equal bike
    #In order to do this, we need to pass this bike in its current state to the release_bike method
    #Hence why we make the bike we created into an instance variable, so it can be accessed by released_bike method.
      raise 'Station is full' if full?
    @bike_station << bike
  end

  def broken_bikes
    broken_bikes = @bike_station.select { |bike| !bike.working }
    delete_bikes = @bike_station.delete_if { |bike| bike == false}
    broken_bikes
    delete_bikes
  end

  def pop_working_bike
    working_bikes = @bike_station.select { |bike| bike.working}.pop
    @bike_station.delete(working_bikes)
      raise 'No more working bikes' if !working_bikes
  end


private

def full?
  @bike_station.length >= CAPACITY
end

def empty?
  @bike_station.empty?
end

end
