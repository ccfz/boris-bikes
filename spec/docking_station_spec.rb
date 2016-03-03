require 'docking_station'


describe DockingStation do

  let(:bike) {double :bike, :working => false, :working= => 'anything'}


  it {is_expected.to respond_to(:dock).with(1).argument}
  it {is_expected.to respond_to(:dock).with(2).argument}

  it {is_expected.to respond_to :dock}


  it 'expects capacity to be modifiable by the user' do
    station = DockingStation.new(5)
    expect(station.capacity).to eq 5
  end


  it 'expects instance of bike class' do
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it 'dock the bike' do
  bike1 = bike
  expect(subject.dock(bike1)).to be  bike1
  end

  it 'should return a bike if one is docked' do
    subject.dock(bike)
    expect(subject.bike).to be bike
  end

  it 'should raise an error if there are no bikes' do
    expect{subject.release_bike while true}.to raise_error(RuntimeError)
  end

  it 'should raise an error if station is full' do
    expect{
      while true
        subject.dock(bike)
      end
    }.to raise_error(RuntimeError)
  end

  it 'expects dock to receive a bike status "broken"' do
    station = DockingStation.new
    station.dock(bike, 'broken')
    expect(bike.working).to be false
  end

  it 'should not release a broken bike' do
    subject.dock(bike,'broken')
    expect {subject.release_bike}.to raise_error(RuntimeError)
  end

  it 'needs to know, which bikes are broken' do
    subject.dock(bike,'broken')
    expect(subject.broken_bikes.last).to be bike
  end

end
=begin
  it 'should release a bike if there are bikes' do
    @docked_bikes = Bike.new
    expect(subject.release_bike).to be @docked_bikes
  end
=end
