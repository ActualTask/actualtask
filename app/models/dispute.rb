class Dispute < ApplicationRecord
  has_many :dispute_users, dependent: :destroy
  has_many :users, through: :dispute_users
  has_many :messages, dependent: :destroy

  scope :public_channels, ->{ where(direct_message: false) }
  scope :direct_messages, ->{ where(direct_message: true) }

  def self.direct_message_for_users(users)
    user_ids = users.map(&:id).sort
    name = "DM:#{user_ids.join(":")}"

    if dispute = direct_messages.where(name: name).first
      dispute
    else
      # create a new dispute
      dispute = new(name: name, direct_message: true)
      dispute.users = users
      dispute.save
      dispute
    end
  end
end
