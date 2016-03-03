require 'van'
require 'bike'

describe Garage do

  let(:bike) { Bike.new }
  let(:garage) { Garage.new }

  it {is_expected.to respond_to(:fix)}

  describe "#fix" do
    it "should fix bikes brought to the garage" do
        bike.report_broken
        garage.bikes << bike
        garage.fix
        expect(bike.broken?).to eq false
    end
  end

end
