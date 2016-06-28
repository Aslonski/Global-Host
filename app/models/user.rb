class User < ActiveRecord::Base

	has_secure_password

	has_many :reviews
	# The users this user has reviewd
	has_many :reviewd_users, through: :reviews, class_name: "User", foreign_key: :reviewd_user_id
	# The users that have reviewd this client
  has_many :reviewd_by_users, through: :reviews, class_name: "User", foreign_key: :rating_user_id

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

	def self.all_city_hosts(search)
    where(city: search)
  end

  def self.exclude_current_user(user_id)
  	where.not(id: user_id)
  end

  def self.alternative_matches(user_id, search)
  	self.exclude_current_user(user_id).all_city_hosts(search)
  end

	def self.hosts
		where(is_host: true)
	end

	def possible_matches
		likeminded_users.where.not(id: self.id).distinct
	end


	def self.search(search)
		city_hosts = hosts.where(city: search.downcase)
		matching_hosts = $current.possible_matches
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

# User overall review score
	def overall_score
    self.reviews.exists? ? self.reviews.average(:score).round(1) : 0
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
