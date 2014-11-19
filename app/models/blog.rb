class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :blog_categories
  has_many :categories, through: :blog_categories
  has_many :articles
  # accepts_nested_attributes_for :blog_categories # has_many :foo の後に記入しないとだめ?
  validates :title, presence: true
end
