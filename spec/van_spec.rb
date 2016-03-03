require 'van'
require 'docking_station'
require 'garage'

describe Van do
  let(:bike_working) { double(:bike, :broken? => false ) }
  let(:bike_broken) { double(:bike, :broken? => true ) }
  let(:station1) { double(:station, :bikes => [bike_working, bike_broken] ) }

  it {is_expected.to respond_to(:pickup).with(1).argument}
  it {is_expected.to respond_to(:dropoff).with(1).argument}

  describe "#initialize" do
    it "should initalize van as an empty array" do
      van = Van.new
      expect(van.bikes).to eq []
    end
  end

  describe "#pickup" do
    it "should return broken bikes in station" do
      expect(subject.pickup(station1)).to eq([bike_broken])
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

    # it "should raise an error when there is no broken bike in the station" do
    #   station = DockingStation.new
    #   van = Van.new
    #   5.times {station.dock Bike.new}
    #   expect{van.pickup(station)}.to raise_error("There are no broken bikes in this station.")
    # end
  end

  describe "#dropoff" do
    it "should drop off broken bikes to garage" do
      van = Van.new
      garage = Garage.new
      broken_bike = Bike.new
      broken_bike.report_broken
      van.bikes << broken_bike
      before_dropoff = van.bikes
      van.dropoff(garage)
      expect(garage.bikes).to eq(before_dropoff)
    end

    it "should empty van following dropoff" do
      van = Van.new
      garage = Garage.new
      broken_bike = Bike.new
      broken_bike.report_broken
      van.bikes << broken_bike
      van.dropoff(garage)
      expect(van.bikes).to be_empty
    end

  end

end
