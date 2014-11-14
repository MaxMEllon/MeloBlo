class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :categories, through: :blog_categories
  has_many :articles
end
