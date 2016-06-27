class AddConversationIdToItineraries < ActiveRecord::Migration
  def change
    add_column :itineraries, :conversation_id, :integer
  end
end
