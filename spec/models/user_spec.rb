require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "is invalid without a mail_address" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without a name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "is invalid without a name" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end
    
    it "is invalid without a name_kana" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "is invalid without a name_kana" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください")
    end

    it "is invalid without a tel" do
      user = build(:user, tel: nil)
      user.valid?
      expect(user.errors[:tel]).to include("を入力してください")
    end

    it "is invalid without a birthday" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
  end
  describe "facebook連携でサインアップする" do

    before do
      OmniAuth.config.mock_auth[:facebook] = nil
      Rails.application.env_config['omniauth.auth'] = facebook_mock
    end

    it "指定のemailアドレスを持つユーザーが登録されていればそのユーザーを返す" do
      user = create(:user, email: "sample@test.com")
      Rails.application.env_config['omniauth.auth'] = facebook_mock
      user2 = build(:user,)

    end

    it "指定のemailアドレスを持つユーザーが登録されていなければ新規にユーザーを作成させる" do
      user = build(:user, email: "somple@tist.com")
    end
  end

  # google認証テスト
  before do
    @google_user = create(:user, :google_user)
    @google_user_build = build(:user, :google_user_build)
  end

  describe 'method' do
    describe 'class method #from_omniauth' do
      it "引数のemailをもつユーザが存在していたらそのユーザを返すこと" do
        # google@test.comを検索し、すでにcreate済みなので同じユーザを返す
        google_user = User.from_omniauth(google_mock) 
        expect(@google_user.id).to eq google_user.id
      end      

      it "引数のemailをもつユーザが存在しなかったら新規にユーザを作成すること" do
        # google-build@test.comを検索し、いないので新規作成する。
        google_build_user = User.from_omniauth(google_build_mock)
        expect(@google_user_build.email).to eq google_build_user.email
      end      
    end
  end
end