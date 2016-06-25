class ConversationsController < ApplicationController
  def index
    @users = User.all
    @conversations = Conversation.all
  end

  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.new(conversation_params)
      if !@conversation.save
        @errors = @conversation.errors.full_messages
        redirect_to conversation_messages_path(@conversation)
      end
    end
    redirect_to conversation_messages_path(@conversation)
  end

  private
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end

end
