class ResponseList < ApplicationRecord
  belongs_to :task
  belongs_to :user, class_name: 'User', foreign_key: 'performer_id'

end
