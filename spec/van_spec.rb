require 'van'

describe Van do

  it{is_expected.to respond_to(:bikes)}
  it{is_expected.to respond_to(:load).with(1).argument}

  it 'should return the bikes it loaded' do
    bike = Bike.new
    subject.load([bike])
    expect(subject.bikes).to be_a Array
  end

  it 'should unload all bikes at garage' do
      5.times{subject.load([Bike.new])}
  expect(subject.deliver).to be_a Array
  end
end
