class ConversationsController < ApplicationController

  before_action :find_recipient, except: [:index]

  def index
    @user = User.find(current_user.id)
    started = Conversation.where(sender_id: current_user.id)
    continued = Conversation.where(recipient_id: current_user.id)
    @conversations = started.concat(continued)
  end

  def new
    @conversation = Conversation.find_or_create_between(current_user, @recipient)
    redirect_to conversation_messages_path(@conversation)
  end

  def show
    @conversation = Conversation.find(params[:id])
    redirect_to conversation_messages_path(@conversation)
  end

  private
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end

    def find_recipient
      @recipient = User.find(params[:id])
    end
end
