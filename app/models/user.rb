class User < ActiveRecord::Base
	has_many :user_interests
	has_many :interests, through: :user_interests
	has_many :likeminded_users, { through: :interests, source: :users }

	def self.hosts
		where(is_host: true)
	end

	def possible_matches
		likeminded_users.where.not(id: self.id).distinct
	end

end
