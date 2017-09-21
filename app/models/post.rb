class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :post_taggings, dependent: :destroy
  has_many :post_tags, through: :post_taggings
  belongs_to :user

  def other_tags
    self.post_tags.map(&:name).join(', ')
  end

  def other_tags=(names)
    self.post_tags = names.split(',').map do |name|
      PostTag.where(name: name.strip).first_or_create!
    end
  end
end
