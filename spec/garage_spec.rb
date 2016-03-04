require 'garage'
require 'van'
require 'bike'

describe Garage do

  let(:bike) { Bike.new }
  let(:garage) { Garage.new }

  it {is_expected.to respond_to(:fix)}

  describe "#fix" do
    it "should fix bikes brought to the garage" do
        bike.broken
        garage.pickup(bike)
        garage.fix
        expect(garage.unload.status).to eq false
    end
  end

end
