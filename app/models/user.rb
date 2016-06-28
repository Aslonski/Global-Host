class User < ActiveRecord::Base

	has_secure_password

  has_many :visitor_itineraries, foreign_key: "visitor_id", class_name: "Itinerary"
  has_many :host_itineraries, foreign_key: "host_id", class_name: "Itinerary"

	has_many :user_interests
	has_many :interests, through: :user_interests
	has_many :likeminded_users, { through: :interests, source: :users }

  has_many :started_conversations, foreign_key: :sender_id, class_name: "Conversation"
  has_many :continued_conversations, foreign_key: :recipient_id, class_name: "Conversation"
  has_many :messages

	validates_presence_of :first_name, :last_name, :email, :city, :state_province, :country, :personal_info, :language, :gender

	validates_uniqueness_of :email

	def self.hosts
		where(is_host: true)
	end

	def possible_matches
		likeminded_users.where.not(id: self.id).distinct
	end

	def search(search)
		city_hosts = hosts.where(city: search)
		matching_hosts = self.possible_matches
		city_hosts & matching_hosts
	end

# Add Interests
	def all_interests=(names)
	  self.interests = names.split(",").map do |name|
	      Interest.where(name: name.strip).first_or_create!
	  end
	end

	def all_interests
	  self.interests.map(&:name).join(", ")
	end

	def all_conversations
		self.started_conversations + self.continued_conversations
	end

	def unread_messages_count
		@unread = 0
		self.all_conversations.each do |convo|
			convo.messages.each do |msg|
				if msg.user_id != self.id && msg.read == false
					@unread += 1
				end
			end
		end
			@unread
	end



end
