# describe Van do
#   let(:bike_working) { double(:bike, :broken? => false ) }
#   let(:bike_broken) { double(:bike, :broken? => true ) }
#   let(:bike) { double :bike }
#   let(:garage) { double :garage }
#   let(:van) { double :van }
#   let(:docking_station) { double :docking_station }
#
#   it {is_expected.to respond_to(:station_pickup).with(1).argument}
#   it {is_expected.to respond_to(:dropoff).with(1).argument}
#
#   describe "#initialize" do
#     it "should initalize van as an empty array" do
#       expect(van.bike).to eq []
#     end
#   end
#
#   describe "#dock_pickup" do
#     it "should only pick up broken bikes" do
#       docking_station.dock(bike_working)
#       docking_station.dock(bike_broken)
#       expect(subject.station_pickup(docking_station)).to eq([bike_broken])
#     end
#
#     it "should not pick up working bikes" do
#       docking_station.dock(bike_working)
#       docking_station.dock(bike_broken)
#       subject.station_pickup(docking_station)
#       expect(docking_station.bikes).to eq([bike_working])
#     end
#   end
#
#   describe "#dropoff" do
#     it "should drop off broken bikes to garage" do
#       bike.report_broken
#       van.bikes << bike
#       before_dropoff = van.bikes
#       van.dropoff(garage)
#       expect(garage.bikes).to eq(before_dropoff)
#     end
#
#     it "should empty van following dropoff" do
#       bike.report_broken
#       van.bikes << bike
#       van.dropoff(garage)
#       expect(van.bikes).to be_empty
#     end
#
#   end
#
#   describe "#garage_pickup" do
#     it "expects the bikes being picked up from garage to be working" do
#       bike.report_broken
#       garage.bikes << bike
#       garage.fix
#       van.garage_pickup(garage)
#       expect(garage.bikes[0].broken).to eq (false)
#     end
#   end
# end

require 'van'
require 'bike'


describe Van do

  it {is_expected.to respond_to(:pickup)}

  describe "#pickup" do
    it "van can pick up and store bikes" do
      bike = Bike.new
      subject.pickup(bike)
      expect(subject.storage).to be_a Array
    end
  end

end
