class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :post_tag_relations, dependent: :destroy
  has_many :tags, through: :post_tag_relations
  has_many :nices, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :comments

  validates :image, presence: true

  def niced_by(user)
    # user_idとpost_idが一致するlikeを検索する
    Nice.find_by(user_id: user.id, post_id: id)
  end

  def self.search(search)
    if search != ""
      Post.where('text LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
