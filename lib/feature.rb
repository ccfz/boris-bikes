require_relative 'docking_station'
require_relative 'garage'
require_relative 'bike.rb'
require_relative 'van'



station = DockingStation.new
bike1 = Bike.new
bike2 = Bike.new
garage = Garage.new
van = Van.new

bike1.report_broken
station.dock(bike1)

station.dock(bike2)

p station.bikes

van.pickup(docking_station.broken)

