class Category < ApplicationRecord
  has_many :tasks
  validates :name, presence: true
  has_ancestry
   before_validation :seo_url

  private

  def seo_url
    self.category_translit = I18n.transliterate(self.name).parameterize
  end
end
