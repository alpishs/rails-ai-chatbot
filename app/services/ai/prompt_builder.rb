module Ai
  class PromptBuilder
    def initialize(conversation)
      @conversation = conversation
    end

    def call
      [
        system_prompt,
        *conversation_messages
      ]
    end

    private

    attr_reader :conversation

    def system_prompt
      {
        role: "system",
        content: "You are a helpful Ruby on Rails assistant."
      }
    end

    def conversation_messages
      conversation.messages.order(:created_at).map do |message|
        {
          role: message.role,
          content: message.content
        }
      end
    end
  end
end