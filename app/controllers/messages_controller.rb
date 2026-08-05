class MessagesController < ApplicationController
  def create
    conversation = Conversation.find(params[:conversation_id])

    Conversations::CreateMessage.new(
      conversation: conversation,
      content: params[:content]
    ).call

    redirect_to conversation
  end
end