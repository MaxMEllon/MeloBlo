require 'rails_helper'

RSpec.describe BlogsController, :type => :controller do
  describe "テスト対象：POST /blogs" do

    before "ユーザーのサインイン" do
      @user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in "user_name",     with: @user.name
      fill_in "user_email",    with: @user.email
      fill_in "user_password", with: @user.password
      click_button "ログイン"
      visit root_path
    end

    context "ログインに成功しているかテスト" do
      it do
        should have_content @user.name
      end
    end

    context "blogを作成するテスト" do
      it "create a blog" do
        visit new_user_blog_path(@user.id)
        fill_in "blog_title", with: "hoge"
        click_button "作成"
        page.should have_content("hoge")
      end
    end

  end
end
