require 'rails_helper'

RSpec.describe Blog, :type => :model do
  describe "テスト対象：model/blog" do
    before do
      user = User.new
      user.name = "test_user"
      user.email = "test@test.com"
      user.password = "testtest"
      user.save
      @user = User.where(name: :test_user).first
      @user.build_blog(title: "test")
    end
    context "ブログ作成テスト" do
      it "ブログが正常に作成されているか" do
        expect(@user.blog).not_to eq nil
      end
      it "ブログのtitleが正しいか" do
        expect(@user.blog.title).to eq 'test'
      end
    end
  end
end
