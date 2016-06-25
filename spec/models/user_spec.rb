require 'rails_helper'

	describe User do

		let! (:andrey) {User.create(first_name: "Andrey", last_name: "Slonski", password: "password", email:"a@a.a", city: "Chicago", state_province: "IL", country: "USA", personal_info: "The man", language: "English", gender: "Male", is_host: true)}

		let! (:patrick) {User.create(first_name: "Patrick", last_name: "Dewitte", password: "password", city: "Chicago", email:"p@p.p", state_province: "IL", country: "USA", personal_info: "The main man", language: "English", gender: "Male", is_host: true)}

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

	end
