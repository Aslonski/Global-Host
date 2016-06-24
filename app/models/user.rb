class User < ActiveRecord::Base
  has_many :user_interests
  has_many :interests, through: :user_interests

  has_many :itineraries, foreign_key: "visitor_id"
  has_many :itineraries, foreign_key: "host_id"
end
