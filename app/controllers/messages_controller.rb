class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages
    # tutorial recommends making a new @message in the index method???
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    # double check user_id assignment alongside message_params
    @message = @conversation.messages.new(message_params, user_id: current_user.id)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    else
      @errors = @message.errors.full_messages
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private
    def message_params
      params.require(:message).permit(:body, :user_id)
    end

end
