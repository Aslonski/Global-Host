class User < ActiveRecord::Base
	has_many :user_interests
	has_many :interests, through: :user_interests
	has_many :likeminded_users, { through: :interests, source: :users }

  has_many :started_conversations, foreign_key: :sender_id, class_name: "Conversation"
  has_many :continued_conversations, foreign_key: :recipient_id, class_name: "Conversation"
  has_many :messages, through: :conversations

	def self.hosts
		where(is_host: true)
	end

	def possible_matches
		likeminded_users.where.not(id: self.id).distinct
	end

end
