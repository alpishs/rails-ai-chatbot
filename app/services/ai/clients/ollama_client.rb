require "net/http"
require "json"

module Ai
  module Clients
    class OllamaClient
      URL = URI("http://localhost:11434/api/chat")

      def chat(messages:)
        request = Net::HTTP::Post.new(URL)
        request["Content-Type"] = "application/json"

        request.body = {
          model: "llama3.2",
          messages: messages,
          stream: false
        }.to_json

        response = Net::HTTP.start(
          URL.hostname,
          URL.port
        ) do |http|
          http.request(request)
        end

        JSON.parse(response.body)
      end
    end
  end
end