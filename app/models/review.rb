class Review < ApplicationRecord
  belongs_to :user, class_name: 'user', foreign_key: 'task_user_id'


end
