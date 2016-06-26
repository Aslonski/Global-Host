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

gender = ["Male", "Female"]

5.times do User.create!(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		email: Faker::Internet.email,
		city: Faker::Address.city,
		state_province: Faker::Address.state,
		country: Faker::Address.country,
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
		city: Faker::Address.city,
		state_province: Faker::Address.state,
		country: Faker::Address.country,
		personal_info: Faker::Hipster.paragraph,
		language: "English",
		password:'password',
		gender: gender.sample,
		is_host: false
	)
end

Interest.create!(name: "History & Culture")
Interest.create!(name: "Art & Museums")
Interest.create!(name: "Exploration")
Interest.create!(name: "Food & Restaurant")
Interest.create!(name: "Nightlife & Bars")
Interest.create!(name: "Shopping")
Interest.create!(name: "Translation")

25.times do
	UserInterest.create!(
		user_id: rand(1..10),
		interest_id: rand(1..7)
		)
end

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
		city: Faker::Address.city
	)
end
