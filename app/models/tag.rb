class Tag < ActiveRecord::Base
  has_many :artcle_tags
  has_many :articles, through: :article_tags
end
