require 'rails_helper'

	describe User do
		
		let (:andrey) {User.create(first_name: "Andrey", last_name: "Slonski", city: "Chicago", state_province: "IL", country: "USA", personal_info: "The man", language: "English", gender: "Male", is_host: true)}

		let (:patrick) {User.create(first_name: "Patrick", last_name: "Dewitte", city: "Chicago", state_province: "IL", country: "USA", personal_info: "The main man", language: "English", gender: "Male", is_host: true)}

		let (:users) {User.all}
		let (:interest) {Interest.create!(name: "music")}
		let (:user_interest) {UserInterest.create(user_id: 1, interest_id: 1)}
		let (:user_interest) {UserInterest.create(user_id: 2, interest_id: 1)}

		it "Has a method that returns a collection of hosts" do
			expect(users.hosts).to be_empty
		end

		it "Has a method that return a collection of users with the same interests" do
			expect(andrey.possible_matches).to eq(patrick)
		end


	end