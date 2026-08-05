module Conversations
  class CreateMessage
    def initialize(conversation:, content:)
      @conversation = conversation
      @content = content
    end

    def call
      user_message = conversation.messages.create!(
        role: :user,
        content: content
      )

      response = Ai::ChatService.new(content).call

      conversation.messages.create!(
        role: :assistant,
        content: response
      )
    end

    private

    attr_reader :conversation, :content
  end
end