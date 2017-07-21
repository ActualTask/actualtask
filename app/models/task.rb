class Task < ApplicationRecord
  mount_uploader :images, ImageUploader

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  belongs_to :category
  belongs_to :user
  has_many :responses
  has_many :comments
  has_many :pictures #files through attachments
  has_many :task_locatings, dependent: :destroy #locations
  has_many :locations, through:  :task_locatings
  accepts_nested_attributes_for :locations
  accepts_nested_attributes_for :responses






  validates_associated :locations
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