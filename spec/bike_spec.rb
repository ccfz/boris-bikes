require 'bike'

describe Bike do

  it {is_expected.to respond_to(:working)}

  it "can be reported broken" do
    expect(subject.broken).to eq true
  end

  it "status can be changed to working" do
    expect(subject.working).to eq false
  end

end
