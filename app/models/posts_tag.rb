class PostsTag
  include ActiveModel::Model
  attr_accessor :image, :text, :name, :user_id

  validates :name, presence: true
  validates :image, presence: true

  def save
    post = Post.create(text: text, image: image, user_id: user_id)
    tag = Tag.where(name: name).first_or_initialize
    tag.save

    PostTagRelation.create(post_id: post.id, tag_id: tag.id)
  end
end