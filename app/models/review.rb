class Review < ApplicationRecord
  belongs_to :user, inverse_of: :reviews
  belongs_to :user, inverse_of: :user_reviews
  belongs_to :task


end
