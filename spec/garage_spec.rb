require 'garage'

describe Garage do

  let(:bike) { double(:bike) }
  let(:garage) { Garage.new }
  

  it {is_expected.to respond_to(:fix)}

  describe "#fix" do
    it "should fix bikes brought to the garage" do
      allow(bike).to receive(:working)
        spy(bike)
        garage.pickup(bike)
        garage.fix
        expect(bike).to have_received(:working)
    end
  end

end
