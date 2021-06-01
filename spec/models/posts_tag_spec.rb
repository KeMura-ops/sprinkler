require 'rails_helper'

RSpec.describe PostsTag, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @user.save
    @post = FactoryBot.build(:post)
    @post.save
    @posts_tag = FactoryBot.build(:posts_tag, image: @post.image, text: @post.text, user_id: @user.id)
    sleep 0.1 # Mysqlエラー対策のため記述
  end

  describe '画像とタグを投稿する' do
    context 'タグ付きの画像投稿できる時' do
      it '全ての項目が存在すれば投稿できる' do
        expect(@posts_tag).to be_valid
      end
      it 'テキストが存在していなくても投稿できる' do
        @posts_tag.text = nil
        expect(@posts_tag).to be_valid
      end
    end

    context 'タグ付きの画像投稿ができない時' do
      it 'タグが存在しなければ投稿できない' do
        @posts_tag.name = nil
        @posts_tag.valid?
        expect(@posts_tag.errors.full_messages).to include("Name can't be blank")
      end
      it '画像が存在しなければ投稿ができない' do
        @posts_tag.image = nil
        @posts_tag.valid?
        expect(@posts_tag.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
