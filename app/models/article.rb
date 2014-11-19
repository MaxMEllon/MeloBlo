class Article < ActiveRecord::Base
  belongs_to :blog
  has_many   :artcle_tags
  has_many   :tags, through: :article_tags
  validates  :title, presence: true
end
