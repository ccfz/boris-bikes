require 'van'
require 'docking_station'

describe Van do

  it {is_expected.to respond_to(:pickup).with(1).argument}

  describe "#initialize" do
    it "should initalize van as an empty array" do
      van = Van.new
      expect(van.bikes).to eq []
    end
  end

  describe "#pickup" do
    it "should return broken bikes in station" do
      station = DockingStation.new
      van = Van.new
      5.times {station.dock Bike.new}
      broken_bike = Bike.new
      broken_bike.report_broken
      station.dock broken_bike
      broken_bike1 = Bike.new
      broken_bike1.report_broken
      station.dock broken_bike1
      expect(van.pickup(station)).to eq([broken_bike, broken_bike1])
    end

    it "should remove broken bikes from the station" do
      station = DockingStation.new
      van = Van.new
      working_bike = Bike.new
      station.dock working_bike
      broken_bike = Bike.new
      broken_bike.report_broken
      station.dock broken_bike
      van.pickup(station)
      expect(station.bikes).to eq([working_bike])
    end

    it "should raise an error when there is no broken bike in the station" do
      station = DockingStation.new
      van = Van.new
      5.times {station.dock Bike.new}
      expect{van.pickup(station)}.to raise_error("There are no broken bikes in this station.")
    end
  end

end
