require 'docking_station'

describe DockingStation do
    it { is_expected.to respond_to(:release_bike) }
    describe "release_bike" do
      it "releases bike" do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
      end

      it "raises an error" do
        expect { subject.release_bike }.to raise_error "There are no bikes left"
      end
    end

    it 'expects bikes to be working' do
      bike = Bike.new
      expect(subject.dock(bike)).to be_working
    end

    it { is_expected.to respond_to(:dock).with(1).argument }
    it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end

    it 'bike properly docked' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq bike
    end

end
