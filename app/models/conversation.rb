class Conversation < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  has_many :messages, dependent: :destroy

  validates_presence_of :sender_id, :recipient_id
  # The following scope ensures that only one conversation exists between two users
  # This may be something to refactor later for repeat uses of the app
  # validates_uniqueness_of :sender_id, :scope => :recipient_id
  validate :conversation_is_uniq, on: :create

  def conversation_is_uniq
    if Conversation.between(sender, recipient).present?
      errors.add(:base)
    end
  end

  def self.between(sender, recipient)
    where(
      "(conversations.sender_id = ? AND conversations.recipient_id =?)
       OR
       (conversations.sender_id = ? AND conversations.recipient_id =?)",
      sender.id, recipient.id, recipient.id, sender.id
      ).first
  end

  def self.find_or_create_between(sender, recipient)
    between(sender, recipient) || create!(sender_id: sender.id, recipient_id: recipient.id)
  end
end
