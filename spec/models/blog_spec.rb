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
    end

    context "ブログ作成テスト" do
      before do
        @user.build_blog(title: "test")
      end
      it "ブログが正常に作成されているか" do
        expect(@user.blog).not_to eq nil
      end
      it "ブログのtitleが正しいか" do
        expect(@user.blog.title).to eq 'test'
      end
    end

    context "ブログ作成失敗のテスト" do
      it "ブログの作成に失敗しているか" do
        blog = @user.build_blog(title: "")
        blog.save
        expect(blog.errors[:title].size).to eq 1
      end
    end

    context "モデルの関連確認テスト" do
      it "ブログが記事をもっているか" do
        is_expected.to have_many(:articles)
      end
      it "ブログが記事に所属しているかどうか" do
        is_expected.to belong_to(:user)
      end
      it "ブログがブログカテゴリを通してカテゴリを持っているか" do
        is_expected.to have_many(:categories).through(:blog_categories)
      end
    end

  end
end
