class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "disputes:#{message.dispute.id}", {
      username: message.user.username,
      body: message.body,
      dispute_id: message.dispute.id
    }
  end
end
