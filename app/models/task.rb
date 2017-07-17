class Task < ApplicationRecord
  mount_uploader :images, ImageUploader

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  belongs_to :category
  belongs_to :user
  has_many :responses
  has_many :comments
  has_many :pictures #files through attachments


  validates :title, :body, presence: true

  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
end