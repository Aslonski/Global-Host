class ConversationsController < ApplicationController

  before_action :find_recipient, except: [:index]

  def index
    @users = User.find(params[:id])
    @messages = @user.messages
    # @conversations = Conversation.all
  end

  def new
    convo = Conversation.where(sender_id: current_user.id, recipient_id: @recipient.id) ||
      Conversation.where(sender_id: @recipient.id, recipient_id: current_user.id)

    if convo.exists?
      @conversation = convo.first
      redirect_to conversation_messages_path(@conversation)
    else
      @conversation = Conversation.create(sender_id: current_user.id, recipient_id: @recipient.id)
      session[:convo_id] = @conversation.id
      redirect_to conversation_messages_path(@conversation)
    end
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
