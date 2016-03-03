require "docking_station"

describe DockingStation do

  let(:bike) { double(:bike) }

  describe '#initialization' do
    subject { DockingStation.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect { subject.dock(bike) }.to raise_error "The docking station is full"
    end

    it "accepts a given capacity" do
      docking_station = DockingStation.new(30)
      30.times { docking_station.dock (bike) }
      expect{ docking_station.dock (bike)}.to raise_error "The docking station is full"
    end
  end

  it { is_expected.to respond_to(:release_bike) }
  describe "#release_bike" do
    it "releases bike" do
      bike = double(:bike, broken?: false)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "raises an error" do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end

    it "expects bikes to be working" do
      bike = double(:bike, working?: true)
      allow(bike).to receive(:broken?)
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  describe "#dock" do
    it "docks something" do
      expect(subject.dock(bike)).to eq bike
    end

    it "raises an error" do
      subject.capacity.times { subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error "The docking station is full"
    end

    it "bike properly docked" do
      subject.dock(bike)
      expect(subject.bikes[-1]).to eq bike
    end
  end
end
