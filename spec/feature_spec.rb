require_relative '../lib/docking_station'

p docking_station = DockingStation.new(10)
first_bike = Bike.new
second_bike = Bike.new

docking_station.dock(first_bike)
docking_station.release_bike
