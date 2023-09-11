require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば新規登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do
      it 'ニックネームが必須であること。nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが必須であること。emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが一意性であること。重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは、@を含む必要があること。emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが必須であること。passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは、6文字以上での入力が必須であること。passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは、半角英数字混合での入力が必須であること。英字のみのパスワードでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードは、半角英数字混合での入力が必須であること。数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードとパスワード（確認）は、値の一致が必須であること。passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = '456abd'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前(全角)は、名字が必須であること。' do
        @user.name_sei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name sei can't be blank")
      end
      it 'お名前(全角)は、名前が必須であること。' do
        @user.name_mei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name mei can't be blank")
      end
      it 'お名前(全角)、名字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。半角英数では入力できない。' do
        @user.name_sei = 'ab12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name sei 全角文字を使用してください')
      end
      it 'お名前(全角)、名前は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。半角英数では入力できない。' do
        @user.name_mei = 'ab12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name mei 全角文字を使用してください')
      end
      it 'お名前カナ(全角)は、名字が必須であること。' do
        @user.name_sei_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name sei kana can't be blank")
      end
      it 'お名前カナ(全角)は、名前が必須であること。' do
        @user.name_mei_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name mei kana can't be blank")
      end
      it 'お名前カナ(全角)、名字は、全角（カタカナ）での入力が必須であること。半角英数では入力できない' do
        @user.name_sei_kana = 'ab12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name sei kana 全角カナを使用してください')
      end
      it 'お名前カナ(全角)、名字は、全角（カタカナ）での入力が必須であること。漢字では入力できない' do
        @user.name_sei_kana = '壱弐参'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name sei kana 全角カナを使用してください')
      end
      it 'お名前カナ(全角)、名字は、全角（カタカナ）での入力が必須であること。かなでは入力できない' do
        @user.name_sei_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name sei kana 全角カナを使用してください')
      end
      it 'お名前カナ(全角)、名前は、全角（カタカナ）での入力が必須であること。半角英数では入力できない' do
        @user.name_mei_kana = 'ab12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name mei kana 全角カナを使用してください')
      end
      it 'お名前カナ(全角)、名前は、全角（カタカナ）での入力が必須であること。漢字では入力できない' do
        @user.name_mei_kana = '壱弐参'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name mei kana 全角カナを使用してください')
      end
      it 'お名前カナ(全角)、名前は、全角（カタカナ）での入力が必須であること。かなでは入力できない' do
        @user.name_mei_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name mei kana 全角カナを使用してください')
      end
      it '生年月日が必須であること。生年月日が空では登録できない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end
