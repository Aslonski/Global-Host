require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:patrick) {User.create!(first_name: "Patrick", last_name: "DeWitte", city: "Chicago", password_digest: "password",
  email: "p@p.p", state_province: "IL", country: "USA", personal_info: "Is a cool guy", language: "English", gender: "male", is_host: false)}
  let(:andrey) {User.create!(first_name: "Andrey", last_name: "Slonski", city: "Cincinatti", password_digest: "password",
  email: "a@a.a", state_province: "OH", country: "USA", personal_info: "Is a cool guy too", language: "English", gender: "male", is_host: true)}

  let(:conversation) {Conversation.create(sender_id: patrick.id, recipient_id: andrey.id)}

  let(:message) {conversation.messages.create!(body: "Sweet message!", conversation_id: conversation.id, user_id: patrick.id, read: true)}

  describe "Message validations" do
    it "is not valid without a body" do
      expect(Message.new(:body => "")).to_not be_valid
    end

    it "is not valid without a conversation id" do
      expect(Message.new(:conversation_id => "")).to_not be_valid
    end

    it "is not valid without a user id" do
      expect(Message.new(:user_id => "")).to_not be_valid
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

    it "has a recipient" do
      expect(conversation.recipient_id).to eq andrey.id
    end

  end

end
