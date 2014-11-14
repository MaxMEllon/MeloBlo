class Article < ActiveRecord::Base
  belongs_to :blog
  has_many :tag, through: :article_tags
  validates :title, presence: true
end
