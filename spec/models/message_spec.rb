require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:patrick) {User.create!(first_name: "Patrick", last_name: "DeWitte", city: "Chicago", state_province: "IL", country: "USA", personal_info: "Is a cool guy", language: "English", gender: "male", is_host: false)}
  let(:andrey) {User.create!(first_name: "Andrey", last_name: "Slonski", city: "Cincinatti", state_province: "OH", country: "USA", personal_info: "Is a cool guy too", language: "English", gender: "male", is_host: true)}

  let(:conversation) {Conversation.create(sender: patrick, recipient: andrey)}

  let(:message) {conversation.messages.create!(body: "Sweet message!", conversation_id: 99, user_id: 99, read: true)}

  describe "Message validations" do
    it "is not valid without a body" do
      Message.new(:body => "").should_not be_valid
    end

    it "is not valid without a conversation id" do
      Message.new(:conversation_id => "").should_not be_valid
    end

    it "is not valid without a user id" do
      Message.new(:user_id => "").should_not be_valid
    end
  end

  describe "Message structure" do
    it "has a body" do
      expect(message.body).to eq("Sweet message!")
    end

    it "is part of a conversation" do
      expect(message.conversation).to eq conversation
    end

    it "can be marked as read" do
      expect(message.read).to be true
    end
  end

  describe "custom message time display" do

  end

  describe "Message associations" do

  end

end
