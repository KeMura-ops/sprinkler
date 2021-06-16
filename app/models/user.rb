class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts, dependent: :destroy
  has_many :nices
  has_many :comments
  has_many :active_relationships, class_name: 'Follow', foreign_key: 'user_id'
  has_many :passive_relationships, class_name: 'Follow', foreign_key: 'target_user_id'
  has_many :followings, through: :active_relationships, source: :target_user
  has_many :followers, through: :passive_relationships, source: :user

  with_options presence: true do
    validates :nickname, length: { maximum: 20 }
  end

  def update_without_current_password(params, *options)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options) #Rails 6.1以降ではupdate_attributes非推奨ということで、updateを使用。
    clean_up_passwords
    result
  end

  def niced_by?(post_id)
    nices.where(post_id: post_id).exists?
  end
end
