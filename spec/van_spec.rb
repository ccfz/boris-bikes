require 'van'
require 'docking_station'
require 'garage'

describe Van do
  let(:bike_working) { double(:bike, :broken? => false ) }
  let(:bike_broken) { double(:bike, :broken? => true ) }
  # let(:station1) { double(:station, :bikes => [bike_working, bike_broken] ) }
  # let(:station2) { double(:station, :bikes => [bike_working] ) }
  let(:bike) { Bike.new }
  let(:garage) { Garage.new }
  let(:van) { Van.new }
  let(:docking_station) { DockingStation.new }

  it {is_expected.to respond_to(:pickup).with(1).argument}
  it {is_expected.to respond_to(:dropoff).with(1).argument}

  describe "#initialize" do
    it "should initalize van as an empty array" do
      expect(van.bikes).to eq []
    end
  end

  describe "#pickup" do
    it "should only pick up broken bikes" do
      docking_station.dock(bike_working)
      docking_station.dock(bike_broken)
      expect(subject.pickup(docking_station)).to eq([bike_broken])
    end

    it "should not pick up working bikes" do
      docking_station.dock(bike_working)
      docking_station.dock(bike_broken)
      subject.pickup(docking_station)
      expect(docking_station.bikes).to eq([bike_working])
    end
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
