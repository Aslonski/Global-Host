class User < ActiveRecord::Base
  has_many :visitor_itineraries, foreign_key: "visitor_id", class_name: "Itinerary"
  has_many :host_itineraries, foreign_key: "host_id", class_name: "Itinerary"

	has_many :user_interests
	has_many :interests, through: :user_interests
	has_many :likeminded_users, { through: :interests, source: :users }
	
	has_secure_password

  has_many :started_conversations, foreign_key: :sender_id, class_name: "Conversation"
  has_many :continued_conversations, foreign_key: :recipient_id, class_name: "Conversation"
  # is this next association necessary?
  has_many :messages

	def self.hosts
		where(is_host: true)
	end

	def possible_matches
		likeminded_users.where.not(id: self.id).distinct
	end

end
