class ConversationsController < ApplicationController
  def index
    @users = User.all
    @conversations = Conversation.all
  end

  def new
    @conversation = Conversation.create
    @message = @conversation.messages.new
  end

  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.new(sender_id: current_user.id)
      if @conversation.save
        redirect_to conversation_path(@conversation)
      else
        @errors = @conversation.errors.full_messages
        redirect_to conversation_messages_path(@conversation)
      end
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = @conversation.messages.new
  end

  private
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end

end
