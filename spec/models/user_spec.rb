require 'rails_helper'

	describe User do

		let! (:andrey) {User.create(first_name: "Andrey", last_name: "Slonski", password_digest: "password", email:"a@a.a", city: "Chicago", state_province: "IL", country: "USA", personal_info: "The man", language: "English", gender: "Male", is_host: true)}

		let! (:patrick) {User.create(first_name: "Patrick", last_name: "Dewitte", password_digest: "password", city: "Chicago", email:"p@p.p", state_province: "IL", country: "USA", personal_info: "The main man", language: "English", gender: "Male", is_host: true)}

		let (:users) {User.all}
		let! (:interest) {Interest.create!(name: "music")}
		let! (:andreys_interest) {UserInterest.create(user_id: andrey.id, interest_id: interest.id)}
		let! (:patrick_interest) {UserInterest.create(user_id: patrick.id, interest_id: interest.id)}

		it "Has a method that returns a collection of hosts" do
			expect(users.hosts).to_not be_empty
		end

		it "Has a method that return a collection of users with the same interests" do
			expect(andrey.possible_matches.first).to eq(patrick)
		end

		it { should validate_presence_of(:first_name) }
		it { should validate_presence_of(:last_name) }
		it { should validate_presence_of(:city) }
		it { should validate_presence_of(:email) }
		it { should validate_uniqueness_of(:email) }
		it { should validate_presence_of(:state_province) }
		it { should validate_presence_of(:country) }
		it { should validate_presence_of(:personal_info) }
		it { should validate_presence_of(:language) }
		it { should validate_presence_of(:gender) }


		it{ should have_many(:visitor_itineraries).with_foreign_key('visitor_id').class_name('Itinerary') }
		it{ should have_many(:host_itineraries).with_foreign_key('host_id').class_name('Itinerary') }
		it { should have_many(:user_interests) }
		it { should have_many(:interests).through(:user_interests) }
		it { should have_many(:likeminded_users).through(:interests).source(:users) }
		it { should have_many(:started_conversations).with_foreign_key('sender_id').class_name('Conversation') }
		it { should have_many(:continued_conversations).with_foreign_key('recipient_id').class_name('Conversation') }
		it { should have_many(:messages) }

	end
