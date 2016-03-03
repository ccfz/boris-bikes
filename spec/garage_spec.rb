require 'garage'
require 'bike'
 

describe Garage do



  it 'should receive broken bikes from van' do
    subject.broken_bikes([Bike.new])
    expect(subject.storage).to be_a Array
  end

  it 'should fix bikes!' do
    bikes = [Bike.new]
    subject.broken_bikes(bikes)
    expect(subject.fixed_bikes.last.working).to eq true
  end
end