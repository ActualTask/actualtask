class Info < ApplicationRecord
  belongs_to :user

  validates_presence_of  :name, :surname, :phone

end
