require 'rails_helper'

RSpec.describe Category, :type => :model do
  describe "テスト対象：model/category" do
    context "カテゴリ作成テスト" do
      before do
        @category = Category.new
        @category.name = "test"
      end

      it "カテゴリが作成されているか" do
        expect(@category).not_to eq nil
      end

      it "カテゴリの名前が正しいか" do
        expect(@category.name).to eq 'test'
      end
    end

    context "カテゴリの作成失敗テスト" do
      it "カテゴリ名が空の時、作成失敗しているか" do
        category = Category.new
        category.name = ""
        category.save
        expect(category.errors[:name].size).to eq 1
      end
    end

    context "カテゴリモデルの関連確認テスト" do
      it "ブログがブログカテゴリを通してカテゴリを持っているか" do
        is_expected.to have_many(:blogs).through(:blog_categories)
      end
    end

  end
end
