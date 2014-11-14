class Category < ActiveRecord::Base
  has_many :blogs, through: :blog_categories
end
