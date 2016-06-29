require 'rails_helper'

RSpec.describe Itinerary, type: :model do

  let(:itinerary) { Itinerary.new(name: "Barcelona", visitor_id: 1, host_id: 2, date: "Sept 1, 2016") }

  it "has a valid name" do
    expect(itinerary.name).to eq("Barcelona")
  end

  xit "has a valid visitor ID" do
    expect(itinerary.visitor_id).to eq(1)
  end

  xit "has a valid host ID" do
    expect(itinerary.host_id).to eq(2)
  end

  it "has a valid date" do
    expect(itinerary.date).to eq("Sept 1, 2016")
  end
 

  it { should have_many(:activities) }

  it { should have_many(:locations) }

  xit { should belong_to(:visitor) }

  xit { should belong_to(:host) }

end
