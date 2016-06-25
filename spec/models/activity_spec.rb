require 'rails_helper'

RSpec.describe Activity, type: :model do

  let(:activity) { Activity.new(description: "Here is a description.", itinerary_id: 1, location_id: 2) }

  it "has a valid description" do
    expect(activity.description).to eq("Here is a description.")
  end

  it "has a valid itinerary ID" do
    expect(activity.itinerary_id).to eq(1)
  end

  it "has a valid location ID" do
    expect(activity.location_id).to eq(2)
  end

  it { should belong_to(:itinerary) }

  it { should belong_to(:location) }

  it { should validate_presence_of(:description)}

  it { should validate_presence_of(:itinerary_id)}

  it { should validate_presence_of(:location_id)}

end
