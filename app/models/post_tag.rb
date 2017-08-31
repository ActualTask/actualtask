class PostTag < ApplicationRecord

  has_many :post_taggings
  has_many :posts, through: :post_taggings
end

def self.counts
  self.select("name, count(post_taggings.tag_id) as count").joins(:post_taggings).group("name, post_taggings.tag_id")

end
