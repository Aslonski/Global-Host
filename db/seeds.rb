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
		last: Faker::Name.last_name,
		city: Faker::Address.city,
		state_province: Faker::Address.state,
		country: Faker::Address.country,
		personal_info: Faker::Hipster.paragraph,
		language: "English",
		gender: gender.sample,
		is_host: true,
	)
end

5.times do User.create!(
		first_name: Faker::Name.first_name,
		last: Faker::Name.last_name,
		city: Faker::Address.city,
		state_province: Faker::Address.state,
		country: Faker::Address.country,
		personal_info: Faker::Hipster.paragraph,
		language: "English",
		gender: gender.sample,
		is_host: false,
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
