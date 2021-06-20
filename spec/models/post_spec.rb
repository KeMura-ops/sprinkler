require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end
  describe '投稿の保存' do
    context '画像投稿ができる場合' do
      it '画像とテキストがあれば投稿できる' do
        expect(@post).to be_valid
      end
      it 'テキストがなくても画像が存在すれば投稿できる' do
        @post.text = nil
        expect(@post).to be_valid
      end

      context '画像投稿ができない場合' do
        it '画像が存在しない場合、投稿できない' do
          @post.image = nil
          @post.valid?
          expect(@post.errors.full_messages).to include("Imageを入力してください")
        end
        it 'ユーザーが紐づいていなければ投稿できない' do
          @post.user = nil
          @post.valid?
          expect(@post.errors.full_messages).to include("Userを入力してください")
        end
      end
    end
  end
end
