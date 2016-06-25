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

gender = ["Male", "Female"]

5.times do User.create!(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		city: Faker::Address.city,
		state_province: Faker::Address.state,
		country: Faker::Address.country,
		personal_info: Faker::Hipster.paragraph,
		language: "English",
		gender: gender.sample,
		is_host: true,
		password_digest:'password'
	)
end

5.times do User.create!(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		city: Faker::Address.city,
		state_province: Faker::Address.state,
		country: Faker::Address.country,
		personal_info: Faker::Hipster.paragraph,
		language: "English",
		gender: gender.sample,
		is_host: false,
		password_digest:'password'
	)
end



20.times do
	Interest.create!(
		name: Faker::Hipster.word
		)
end

25.times do
	UserInterest.create!(
		user_id: rand(1..10),
		interest_id: rand(1..20)
		)
end

10.times do
  Itinerary.create!(
		name: Faker::Book.genre,
		visitor_id: rand(1..10),
		host_id: rand(1..10),
		date:rand(1..10),
	)
end

10.times do
  Activity.create!(
		description: Faker::Hacker.verb,
		itinerary_id: rand(1..10),
		location_id: rand(1..10),
	)
end

10.times do
  Location.create!(
		name: Faker::Hacker.abbreviation,
		address: Faker::Address.street_address,
		city: Faker::Address.city,
	)
end
