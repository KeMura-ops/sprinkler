require 'rails_helper'

RSpec.describe Tag, type: :model do
  before do
    @tag = FactoryBot.build(:tag)
  end
  describe 'タグの保存' do
    context 'タグの保存ができる時' do
      it 'nameが存在する時' do
        expect(@tag).to be_valid
      end
    end
    context 'タグの保存ができないとき' do
      it 'タグ(name)の入力がない場合' do
        @tag.name = nil
        @tag.valid?
        expect(@tag.errors.full_messages).to include("Nameを入力してください")
      end
    end
  end
end
