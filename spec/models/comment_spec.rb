require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメントの投稿' do
    context 'コメント投稿が出来る場合' do
      it 'コメントが入力されていれば投稿できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメント投稿が出来ない場合' do
      it 'コメントが入力されていなければ投稿できない' do
        @comment.comment = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Commentを入力してください")
      end

      it 'コメントを行うユーザーが存在しなければ投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Userを入力してください")
      end

      it 'コメントする投稿が存在しなければ投稿できない' do
        @comment.post = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Postを入力してください")
      end
    end
  end
end
