require 'rails_helper'

RSpec.describe Location, type: :model do

  let(:location) { Location.new(name: "Playa Badalona", address: "08918 Badalona", city: "Barcelona")}

  it "has a valid name" do
    expect(location.name).to eq("Playa Badalona")
  end

  it "has a valid address" do
    expect(location.address).to eq("08918 Badalona")
  end

  it "has a valid city" do
    expect(location.city).to eq("Barcelona")
  end

  it { should have_many(:activities) }

  it { should have_many(:itineraries) }

  it { should have_many(:travelers) }

  it { should have_many(:natives) }

  xit { should validate_presence_of(:name) }

  xit { should validate_presence_of(:address) }

  xit { should validate_presence_of(:city) }

end
