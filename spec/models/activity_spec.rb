require 'rails_helper'

RSpec.describe Activity, type: :model do

  let! (:activity) { Activity.create(description: "Here is a description.", itinerary_id: 1, location_id: 2) }

  it "has a valid description" do
    expect(activity.description).to eq("Here is a description.")
  end

  it "has a valid itinerary ID" do
    expect(activity.itinerary_id).to eq(1)
  end

  it "has a valid location ID" do
    expect(activity.location_id).to eq(2)
  end

  xit "creates a new location for an activity" do
    params = {name: "a", address: "b", city: "c"}
    location = double(:locations)
    expect_any_instance_of(Activity).to receive(:make_location).with(params).and_return(self)

    # location = Location.create(name: params[:name], address: params[:address], city: params[:city])
    # expect(make_location(params)).to eq location
  end

  it { should belong_to(:itinerary) }

  it { should belong_to(:location) }

  it { should validate_presence_of(:description)}

  it { should validate_presence_of(:itinerary_id)}

end
