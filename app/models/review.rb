class Review < ActiveRecord::Base

  belongs_to :reviewer, class_name: "User"
  belongs_to :reviewed_user, class_name: "User"

  validates :title, presence: true
  validates :title, length: {
                              minimum: 3,
                              too_short: '%{count} characters is the minimum required'
                            }
  validates :body, length: {
                              minimum: 10,
                              too_short: '%{count} characters is the minimum required'
                           }

end
