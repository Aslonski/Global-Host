class User < ActiveRecord::Base

  has_many :visitor_itineraries, foreign_key: "visitor_id", class_name: "Itinerary"
  has_many :host_itineraries, foreign_key: "host_id", class_name: "Itinerary"

	has_many :user_interests
	has_many :interests, through: :user_interests
	has_many :likeminded_users, { through: :interests, source: :users }

	validates :first_name, :last_name, :email, :city, :state_province, :country, :perosnal_info, :language, :gender, :is_host, presence: true

	def self.hosts
		where(is_host: true)
	end

	def possible_matches
		likeminded_users.where.not(id: self.id).distinct
	end

end
