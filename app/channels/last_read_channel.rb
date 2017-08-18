# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class LastReadChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def update(data)
    dispute_user = current_user.dispute_users.find_by(dispute_id: data["dispute_id"])
    dispute_user.update(last_read_at: Time.zone.now)
  end
end
