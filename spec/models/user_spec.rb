require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    end
end

