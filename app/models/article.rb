class Article < ActiveRecord::Base
  acts_as_taggable
  belongs_to :blog
  validates  :title, presence: true
end
