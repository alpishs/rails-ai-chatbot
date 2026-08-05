module Ai
  class ChatService
    def initialize(conversation)
      @conversation = conversation
      @client = Clients::OllamaClient.new
    end

    def call
      response = client.chat(
        messages: PromptBuilder.new(conversation).call
      )

      response.dig("message", "content")
    end

    private

    attr_reader :conversation, :client
  end
end