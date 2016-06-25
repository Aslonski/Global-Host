require 'rails_helper'

RSpec.describe Conversation, type: :model do
  let(:patrick) {User.create!(first_name: "Patrick", last_name: "DeWitte", city: "Chicago", state_province: "IL", country: "USA", personal_info: "Is a cool guy", language: "English", gender: "male", is_host: false)}
  let(:andrey) {User.create!(first_name: "Andrey", last_name: "Slonski", city: "Cincinatti", state_province: "OH", country: "USA", personal_info: "Is a cool guy too", language: "English", gender: "male", is_host: true)}

  let(:conversation) {Conversation.create(sender: patrick, recipient: andrey)}

  it "is started by one user" do
    expect(conversation.sender).to eq patrick
  end

  it "is continued by another user" do
    expect(conversation.recipient).to eq andrey
  end
end
