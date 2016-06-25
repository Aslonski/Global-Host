require 'rails_helper'

RSpec.describe Interest, type: :model do

  let(:interest) { Interest.new(name: "House music") }

  it "has a valid name" do
    expect(interest.name).to eq("House music")
  end

  it { should have_many(:user_interests) }

  it { should have_many(:users) }

  it { should validate_presence_of(:name) }
end
