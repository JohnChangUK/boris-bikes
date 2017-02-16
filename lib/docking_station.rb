require_relative 'bike'

class DockingStation
  attr_reader :bike


  def release_bike
    # In order to get the bike back from the dock,
    # We initialized bike in the dock method to an instance bike method. @bike
    # So now, we can get the bike from the dock and finally RELEASE IT, because we got the bike from the dock method
  # fail 'No Bikes Available' unless @bike
  # @bike

if @bike == nil
  raise 'No bikes left'
else
  @bike
  end
end

  def dock(bike)
    #We create a new instance of the bike class
    #bike = Bike.new
    #when we call station.dock(bike), the new instance bike gets passed as an argument
    #we want station.release_bike to equal bike
    #In order to do this, we need to pass this bike in its current state to the release_bike method
    #Hence why we make the bike we created into an instance variable, so it can be accessed by released_bike method.
    if @bike
      raise 'Station is full'
    else
    @bike = bike
  end
end

end
