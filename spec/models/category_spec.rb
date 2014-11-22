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
  end
end
