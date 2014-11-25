require 'rails_helper'

RSpec.describe BlogsController, :type => :controller do
  describe "テスト対象：POST /blogs" do

    before do
      user = User.new
      user.id = 1234
      user.name = "test_user"
      user.email = "test@test.com"
      user.password = "testtest"
      user.save
      @user = User.where(name: :test_user).first
    end

    context "blogを作成するテスト" do
      it "create a blog" do
        visit new_user_blog_path(@user.id)
        fill_in "title", with: "hoge"
        click_button "作成"
        page.should have_content("hoge")
      end
    end

  end
end
