require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "テスト対象：model/user" do

    context "ユーザー作成テスト" do
      before do
        @user = User.new
        @user.name = "test_user"
        @user.email = "test@test.com"
        @user.password = "testtest"
      end
      it "ユーザーが正常に作成出来ているか" do
        @user.save
        expect(@user).not_to eq nil
      end
      it "ユーザー情報が正常かどうか" do
        expect(@user.name).to eq "test_user"
        expect(@user.email).to eq "test@test.com"
        expect(@user.password).to eq "testtest"
      end
    end

    context "ユーザ作成失敗テスト" do
      before do
        @user = User.new
        @user.name = ""
        @user.email = "stt.com"
        @user.password = "est"
        @user.save
      end
      it "ユーザ名が空の時作成に失敗しているか" do
        expect(@user.errors[:name].size).to eq 1
      end

      it "メールアドレスが空の時作成に失敗しているか" do
      end

      it "メールアドレスが正しくないフォーマットの時に失敗しているか" do
        expect(@user.errors[:email].size).to eq 1
      end

      it "パスワードが短い時失敗しているか" do
        expect(@user.errors[:password].size).to eq 1
      end
    end

    context "ユーザーモデルの関連テスト" do
      it "ユーザーがブログを持っているか" do
        is_expected.to have_one(:blog)
      end
    end

  end
end
