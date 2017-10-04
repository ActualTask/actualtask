class Performer < ApplicationRecord



  mount_uploader :photo_id_1, ImageUploader
  mount_uploader :photo_id_2, ImageUploader
  has_many :pictures
  belongs_to :user
  has_many :tasks
end

