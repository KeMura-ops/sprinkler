class Tag < ApplicationRecord
  has_many :post_tag_relations
  has_many :posts, through: :post_tag_relations

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: true } # 大文字と小文字を区別するために付与
end
