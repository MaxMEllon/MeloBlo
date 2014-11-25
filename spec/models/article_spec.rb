require 'rails_helper'

RSpec.describe Article, :type => :model do
  describe "テスト対象：model/article" do
    before do
      user = User.new
      user.name = "test_user"
      user.email = "test@test.com"
      user.password = "testtest"
      user.save
      @user = User.where(name: :test_user).first
      @user.build_blog(title: "test")
      @blog = @user.blog
    end

    context "記事作成テスト" do
      before do
        @article = Article.new
        @article.title = "test_title"
        @article.content = "test_content"
        @article.save
      end

      it "記事が正常に作成されているか" do
        expect(@article).not_to eq nil
      end

      it "記事のtitle, contentが正しいか" do
        expect(@article.title).to eq 'test_title'
        expect(@article.content).to eq 'test_content'
      end
    end

    context "記事の作成失敗テスト" do
      it "記事の作成に失敗しているか" do
        article = @blog.articles.build(title: "")
        article.save
        expect(article.errors[:title].size).to eq 1
      end
    end

    context "記事のモデル関連テスト" do
      it "記事がブログに所属しているか" do
        is_expected.to belong_to(:blog)
      end
    end

  end
end
