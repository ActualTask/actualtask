# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class DisputesChannel < ApplicationCable::Channel
  def subscribed
    current_user.disputes.each do |dispute|
      stream_from "disputes:#{dispute.id}"
    end
  end

  def unsubscribed
    stop_all_streams
  end

  def send_message(data)
    @dispute = Dispute.find(data["dispute_id"])
    message   = @dispute.messages.create(body: data["body"], user: current_user)
    MessageRelayJob.perform_later(message)
  end
end
