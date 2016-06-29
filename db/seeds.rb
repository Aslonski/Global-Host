# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Interest.destroy_all
User.destroy_all
UserInterest.destroy_all
Itinerary.destroy_all
Activity.destroy_all
Location.destroy_all

gender = ["Male", "Female", "Other"]
languages = ["English", "Spanish", "Chinese", "Korean", "Japanese", "Russian"]
numbers_to_sample = [1,2,3,4,5,6,7,8,9,10]

5.times do User.create!(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		email: Faker::Internet.email,
		city: "Chicago",
		state_province: "IL",
		country: "U.S.A.",
		personal_info: Faker::Hipster.paragraph,
		language: "English",
		password:'password',
		gender: gender.sample,
		is_host: true
	)
end

5.times do User.create!(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		email: Faker::Internet.email,
		city: "Chicago",
		state_province: "IL",
		country: "U.S.A.",
		personal_info: Faker::Hipster.paragraph,
		language: "English",
		password:'password',
		gender: gender.sample,
		is_host: false
	)
end

Review.create!(reviewee_id: 1, reviewer_id: 6, title: Faker::Book.title, body:Faker::Hipster.paragraph, score: rand(4..5))
Review.create!(reviewee_id: 2, reviewer_id: 6, title: Faker::Book.title, body:Faker::Hipster.paragraph, score: rand(4..5))
Review.create!(reviewee_id: 3, reviewer_id: 6, title: Faker::Book.title, body:Faker::Hipster.paragraph, score: rand(4..5))
Review.create!(reviewee_id: 1, reviewer_id: 7, title: Faker::Book.title, body:Faker::Hipster.paragraph, score: rand(4..5))
Review.create!(reviewee_id: 2, reviewer_id: 7, title: Faker::Book.title, body:Faker::Hipster.paragraph, score: rand(4..5))
Review.create!(reviewee_id: 3, reviewer_id: 7, title: Faker::Book.title, body:Faker::Hipster.paragraph, score: rand(4..5))
Review.create!(reviewee_id: 1, reviewer_id: 8, title: Faker::Book.title, body:Faker::Hipster.paragraph, score: rand(4..5))
Review.create!(reviewee_id: 2, reviewer_id: 8, title: Faker::Book.title, body:Faker::Hipster.paragraph, score: rand(4..5))
Review.create!(reviewee_id: 3, reviewer_id: 8, title: Faker::Book.title, body:Faker::Hipster.paragraph, score: rand(4..5))
Review.create!(reviewee_id: 1, reviewer_id: 9, title: Faker::Book.title, body:Faker::Hipster.paragraph, score: rand(4..5))
Review.create!(reviewee_id: 2, reviewer_id: 9, title: Faker::Book.title, body:Faker::Hipster.paragraph, score: rand(4..5))
Review.create!(reviewee_id: 3, reviewer_id: 9, title: Faker::Book.title, body:Faker::Hipster.paragraph, score: rand(4..5))
Review.create!(reviewee_id: 4, reviewer_id: 10, title: Faker::Book.title, body:Faker::Hipster.paragraph, score: rand(4..5))
Review.create!(reviewee_id: 5, reviewer_id: 10, title: Faker::Book.title, body:Faker::Hipster.paragraph, score: rand(4..5))
Review.create!(reviewee_id: 6, reviewer_id: 10, title: Faker::Book.title, body:Faker::Hipster.paragraph, score: rand(4..5))
Review.create!(reviewee_id: 4, reviewer_id: 1, title: Faker::Book.title, body:Faker::Hipster.paragraph, score: rand(4..5))
Review.create!(reviewee_id: 5, reviewer_id: 2, title: Faker::Book.title, body:Faker::Hipster.paragraph, score: rand(4..5))
Review.create!(reviewee_id: 6, reviewer_id: 3, title: Faker::Book.title, body:Faker::Hipster.paragraph, score: rand(4..5))
Review.create!(reviewee_id: 1, reviewer_id: 4, title: Faker::Book.title, body:Faker::Hipster.paragraph, score: rand(4..5))
Review.create!(reviewee_id: 2, reviewer_id: 5, title: Faker::Book.title, body:Faker::Hipster.paragraph, score: rand(4..5))

Interest.create!(name: "History & Culture")
Interest.create!(name: "Art & Museums")
Interest.create!(name: "Exploration")
Interest.create!(name: "Food & Restaurant")
Interest.create!(name: "Nightlife & Bars")
Interest.create!(name: "Shopping")
Interest.create!(name: "Translation")

UserInterest.create!(interest_id: 1, user_id: 1)
UserInterest.create!(interest_id: 2, user_id: 1)
UserInterest.create!(interest_id: 3, user_id: 1)
UserInterest.create!(interest_id: 1, user_id: 2)
UserInterest.create!(interest_id: 4, user_id: 2)
UserInterest.create!(interest_id: 1, user_id: 3)
UserInterest.create!(interest_id: 2, user_id: 3)
UserInterest.create!(interest_id: 3, user_id: 3)
UserInterest.create!(interest_id: 1, user_id: 4)
UserInterest.create!(interest_id: 2, user_id: 4)
UserInterest.create!(interest_id: 3, user_id: 4)
UserInterest.create!(interest_id: 1, user_id: 5)
UserInterest.create!(interest_id: 4, user_id: 5)
UserInterest.create!(interest_id: 5, user_id: 5)
UserInterest.create!(interest_id: 2, user_id: 6)
UserInterest.create!(interest_id: 6, user_id: 6)
UserInterest.create!(interest_id: 1, user_id: 7)
UserInterest.create!(interest_id: 5, user_id: 7)
UserInterest.create!(interest_id: 6, user_id: 7)
UserInterest.create!(interest_id: 1, user_id: 8)
UserInterest.create!(interest_id: 1, user_id: 9)
UserInterest.create!(interest_id: 7, user_id: 9)
UserInterest.create!(interest_id: 1, user_id: 10)
UserInterest.create!(interest_id: 6, user_id: 10)

10.times do
  Itinerary.create!(
		name: Faker::Book.genre,
		visitor_id: rand(1..10),
		host_id: rand(1..10),
		date:rand(1..10)
	)
end

10.times do
  Activity.create!(
		description: Faker::Hacker.verb,
		itinerary_id: rand(1..10),
		location_id: rand(1..10)
	)
end

10.times do
  Location.create!(
		name: Faker::Hacker.abbreviation,
		address: Faker::Address.street_address,
		city: "Chicago"
	)
end
