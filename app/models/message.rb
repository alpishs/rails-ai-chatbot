class Message < ApplicationRecord
  belongs_to :conversation

  validates :content, presence: true
  validates :role, presence: true

  enum :role,
      {
        user: "user",
        assistant: "assistant",
        system: "system"
      },
      validate: true
end