class ResponseList < ApplicationRecord
  validates :response_text, presence: true


  belongs_to :task
  belongs_to :user, class_name: 'User', foreign_key: 'performer_id'


end
